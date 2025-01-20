@interface AKFollowUpServerPayloadFormatter
+ (id)pendingAuthKitFollowUpPayload:(id)a3;
@end

@implementation AKFollowUpServerPayloadFormatter

+ (id)pendingAuthKitFollowUpPayload:(id)a3
{
  return (id)objc_msgSend(a3, "aaf_map:", &__block_literal_global_37);
}

id __66__AKFollowUpServerPayloadFormatter_pendingAuthKitFollowUpPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [v2 uniqueIdentifier];

  if (v4)
  {
    v5 = [v2 uniqueIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"id"];
  }
  v6 = [v2 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"idmsdata"];

  if (v7)
  {
    v8 = [v2 userInfo];
    v9 = [v8 objectForKeyedSubscript:@"idmsdata"];
    [v3 setObject:v9 forKeyedSubscript:@"idmsdata"];
  }

  return v3;
}

@end