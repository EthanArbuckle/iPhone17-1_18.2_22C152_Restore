@interface SHServerResultsResponse
- (NSArray)shazamIDs;
- (NSDictionary)resultsDictionary;
- (SHServerResultsResponse)initWithResultsDictionary:(id)a3;
- (double)recordingIntermissionSeconds;
- (double)recordingSignatureOffsetSeconds;
- (double)retrySeconds;
- (void)setResultsDictionary:(id)a3;
@end

@implementation SHServerResultsResponse

- (SHServerResultsResponse)initWithResultsDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHServerResultsResponse;
  v6 = [(SHServerResultsResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resultsDictionary, a3);
  }

  return v7;
}

- (NSArray)shazamIDs
{
  v2 = [(SHServerResultsResponse *)self resultsDictionary];
  v3 = [v2 objectForKeyedSubscript:@"matches"];

  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "objectForKeyedSubscript:", @"id", (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSArray *)v11;
}

- (double)retrySeconds
{
  v2 = [(SHServerResultsResponse *)self resultsDictionary];
  v3 = [v2 objectForKeyedSubscript:@"retry"];

  v4 = [v3 objectForKeyedSubscript:@"recordingIntermissionInMilliseconds"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"retryInMilliseconds"];
    [v5 doubleValue];
    double v7 = v6 / 1000.0;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)recordingIntermissionSeconds
{
  v2 = [(SHServerResultsResponse *)self resultsDictionary];
  v3 = [v2 objectForKeyedSubscript:@"retry"];

  v4 = [v3 objectForKeyedSubscript:@"recordingIntermissionInMilliseconds"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"recordingIntermissionInMilliseconds"];
    [v5 doubleValue];
    double v7 = v6 / 1000.0;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)recordingSignatureOffsetSeconds
{
  v2 = [(SHServerResultsResponse *)self resultsDictionary];
  v3 = [v2 objectForKeyedSubscript:@"retry"];

  v4 = [v3 objectForKeyedSubscript:@"recordingOffsetInMilliseconds"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"recordingOffsetInMilliseconds"];
    [v5 doubleValue];
    double v7 = v6 / 1000.0;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (NSDictionary)resultsDictionary
{
  return self->_resultsDictionary;
}

- (void)setResultsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end