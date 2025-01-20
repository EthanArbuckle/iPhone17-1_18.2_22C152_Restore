@interface CalDatabaseSendAnalyticsEventForChange
@end

@implementation CalDatabaseSendAnalyticsEventForChange

void ___CalDatabaseSendAnalyticsEventForChange_block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  [v7 setObject:a1[4] forKeyedSubscript:@"client"];
  uint64_t v3 = a1[5];
  if (v3)
  {
    [v7 setObject:v3 forKeyedSubscript:@"process"];
  }
  else
  {
    v4 = CalDatabaseGetProcessName();
    [v7 setObject:v4 forKeyedSubscript:@"process"];
  }
  v5 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v7 setObject:v5 forKeyedSubscript:@"notificationType"];

  v6 = [NSNumber numberWithUnsignedInteger:a1[7]];
  [v7 setObject:v6 forKeyedSubscript:@"reason"];
}

@end