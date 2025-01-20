@interface CEMNetworkBluetoothDeclaration_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)build;
+ (id)buildRequiredOnly;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (id)serializePayload;
@end

@implementation CEMNetworkBluetoothDeclaration_Status

+ (NSSet)allowedStatusKeys
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (NSSet)allowedReasons
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (id)build
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [a3 allKeys];
  v7 = [v5 setWithArray:v6];

  v8 = +[CEMNetworkBluetoothDeclaration_Status allowedStatusKeys];
  [v7 minusSet:v8];

  uint64_t v9 = [v7 count];
  uint64_t v10 = v9;
  if (a4 && v9)
  {
    v11 = (void *)MEMORY[0x263F087E8];
    v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v7, *MEMORY[0x263F08320]];
    v16[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];
  }
  return v10 == 0;
}

- (id)serializePayload
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

@end