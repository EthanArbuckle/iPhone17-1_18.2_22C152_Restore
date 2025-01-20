@interface AudioSystemResult
- (NSNumber)dbValue;
- (NSString)input;
- (NSString)output;
- (NSString)source;
- (id)dictionaryValue;
- (void)setDbValue:(id)a3;
- (void)setInput:(id)a3;
- (void)setOutput:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation AudioSystemResult

- (id)dictionaryValue
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AudioSystemResult *)self input];
  [v3 setObject:v4 forKeyedSubscript:@"input"];

  v5 = [(AudioSystemResult *)self output];
  [v3 setObject:v5 forKeyedSubscript:@"output"];

  v6 = [(AudioSystemResult *)self source];
  [v3 setObject:v6 forKeyedSubscript:@"source"];

  v7 = [(AudioSystemResult *)self dbValue];

  if (v7)
  {
    v8 = [(AudioSystemResult *)self dbValue];
    [v3 setObject:v8 forKeyedSubscript:@"dbValue"];
  }
  id v9 = [v3 copy];

  return v9;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSNumber)dbValue
{
  return self->_dbValue;
}

- (void)setDbValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbValue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_output, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

@end