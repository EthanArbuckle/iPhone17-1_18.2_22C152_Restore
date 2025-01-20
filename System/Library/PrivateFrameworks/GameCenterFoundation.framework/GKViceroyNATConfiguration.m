@interface GKViceroyNATConfiguration
+ (NSArray)settingsKeys;
+ (id)externalAddressForSelfConnectionData:(id)a3;
+ (void)applySettings:(id)a3;
@end

@implementation GKViceroyNATConfiguration

+ (NSArray)settingsKeys
{
  return (NSArray *)&unk_1F1E7E9A8;
}

+ (void)applySettings:(id)a3
{
  id v16 = a3;
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = [v16 objectForKey:@"gk-commnat-main0"];
  uint64_t v5 = *MEMORY[0x1E4F63A58];
  v6 = [v16 objectForKey:@"gk-commnat-main1"];
  uint64_t v7 = *MEMORY[0x1E4F63A60];
  v8 = [v16 objectForKey:@"gk-commnat-cohort"];
  uint64_t v9 = *MEMORY[0x1E4F63A50];
  v10 = [v16 objectForKey:@"gk-cdx"];
  v11 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, v7, v8, v9, v10, *MEMORY[0x1E4F63A48], 0);

  [MEMORY[0x1E4F63B48] setServerAddresses:v11];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = [v16 objectForKey:@"gk-p2p-ice-timeout"];
  if (v13) {
    [v12 setObject:v13 forKey:*MEMORY[0x1E4F63A70]];
  }
  v14 = [v16 objectForKey:@"gk-p2p-nat-type-timeout"];

  if (v14) {
    [v12 setObject:v14 forKey:*MEMORY[0x1E4F63A78]];
  }
  v15 = [v16 objectForKey:@"gk-p2p-blob-size-max"];

  if (v15) {
    [v12 setObject:v15 forKey:*MEMORY[0x1E4F63A68]];
  }
  [MEMORY[0x1E4F63B48] setClientOptions:v12];
}

+ (id)externalAddressForSelfConnectionData:(id)a3
{
  return (id)[MEMORY[0x1E4F63B30] externalAddressForSelfConnectionData:a3];
}

@end