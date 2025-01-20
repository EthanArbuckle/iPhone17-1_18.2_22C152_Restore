@interface _CNAutocompleteQueryCacheMissAggdLogging
- (CNAutocompleteAggdProbe)probe;
- (_CNAutocompleteQueryCacheMissAggdLogging)init;
- (_CNAutocompleteQueryCacheMissAggdLogging)initWithProbe:(id)a3;
- (void)didReturnCacheFalseNegatives:(id)a3;
- (void)didReturnCacheFalsePositives:(id)a3;
@end

@implementation _CNAutocompleteQueryCacheMissAggdLogging

- (_CNAutocompleteQueryCacheMissAggdLogging)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"com.apple.contacts.autocomplete";
  v9[1] = @"performance";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v5 = CNAutocompleteProbeBuildKey(v3, v4);

  v6 = [[CNAutocompleteAggdProbe alloc] initWithKeyPrefix:v5];
  v7 = [(_CNAutocompleteQueryCacheMissAggdLogging *)self initWithProbe:v6];

  return v7;
}

- (_CNAutocompleteQueryCacheMissAggdLogging)initWithProbe:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteQueryCacheMissAggdLogging;
  v6 = [(_CNAutocompleteQueryCacheMissAggdLogging *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_probe, a3);
    v8 = v7;
  }

  return v7;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    v4 = [(_CNAutocompleteQueryCacheMissAggdLogging *)self probe];
    id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    [v4 recordAddValue:v5 forKey:@"false-negatives"];

    v6 = [(_CNAutocompleteQueryCacheMissAggdLogging *)self probe];
    [v6 sendData];
  }
}

- (void)didReturnCacheFalsePositives:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    v4 = [(_CNAutocompleteQueryCacheMissAggdLogging *)self probe];
    id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    [v4 recordAddValue:v5 forKey:@"false-positives"];

    v6 = [(_CNAutocompleteQueryCacheMissAggdLogging *)self probe];
    [v6 sendData];
  }
}

- (CNAutocompleteAggdProbe)probe
{
  return (CNAutocompleteAggdProbe *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end