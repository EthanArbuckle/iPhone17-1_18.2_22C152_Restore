@interface ICIAMMetricEvent(Metrics)
- (id)reportableDictionary;
- (id)reportableDictionaryForClickEventWithMessageIdentifier:()Metrics andTargetIdentifier:;
@end

@implementation ICIAMMetricEvent(Metrics)

- (id)reportableDictionary
{
  v2 = [a1 dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  if ([a1 pageDetailsCount])
  {
    v4 = [a1 pageDetails];
    v5 = (void *)[v4 copy];
    v6 = objc_msgSend(v5, "iam_dictionaryFromArrayOfICIIAMParameters");
    [v3 setObject:v6 forKeyedSubscript:@"pageDetails"];
  }
  if ([a1 actionDetailsCount])
  {
    v7 = [a1 actionDetails];
    v8 = (void *)[v7 copy];
    v9 = objc_msgSend(v8, "iam_dictionaryFromArrayOfICIIAMParameters");
    [v3 setObject:v9 forKeyedSubscript:@"actionDetails"];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (id)reportableDictionaryForClickEventWithMessageIdentifier:()Metrics andTargetIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 reportableDictionary];
  v9 = (void *)[v8 mutableCopy];

  v10 = [v9 objectForKeyedSubscript:@"targetId"];

  if (!v10) {
    [v9 setObject:v6 forKeyedSubscript:@"targetId"];
  }
  v11 = [v9 objectForKeyedSubscript:@"actionContext"];

  if (v7 && !v11) {
    [v9 setObject:v7 forKeyedSubscript:@"actionContext"];
  }
  v12 = (void *)[v9 copy];

  return v12;
}

@end