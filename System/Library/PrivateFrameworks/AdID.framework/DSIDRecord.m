@interface DSIDRecord
@end

@implementation DSIDRecord

void __62__DSIDRecord_Private__resetDeviceNewsPlusSubscriberIDIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 intValue] == 6)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    v7 = [v6 UUIDString];
    [v5 setID:v7];

    v8 = NSString;
    v9 = [v5 ID];
    v10 = [*(id *)(a1 + 32) DSID];
    [v13 intValue];
    v11 = ClientTypeToString();
    v12 = [v8 stringWithFormat:@"Created ID %@ for DSID %@ and client type %@(%@)", v9, v10, v13, v11];
    _ADLog();
  }
}

@end