@interface AceObject(AnalyticsContextVending)
- (id)af_analyticsContext;
- (uint64_t)af_dialogIdentifiersForAnalyticsContext;
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation AceObject(AnalyticsContextVending)

- (uint64_t)af_dialogIdentifiersForAnalyticsContext
{
  return 0;
}

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v6 = a3;
  v4 = [a1 aceId];
  if (v4) {
    [v6 setObject:v4 forKey:@"aceId"];
  }
  v5 = [a1 refId];
  if (v5) {
    [v6 setObject:v5 forKey:@"refId"];
  }
}

- (id)af_analyticsContext
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 groupIdentifier];
  v3 = [a1 encodedClassName];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(a1, "af_addEntriesToAnalyticsContext:", v4);
  if ([v4 count])
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", v2, v3];
    v8 = v5;
    v9[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

@end