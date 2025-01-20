@interface CNPhoneDialer
+ (BOOL)cancelDialMessage:(id)a3 error:(id *)a4;
+ (BOOL)sendMessage:(id)a3 error:(id *)a4;
+ (id)URLWithPhoneNumber:(id)a3;
+ (id)cancelMessageWithDialMessageID:(id)a3;
+ (id)dialMessageWithDataValue:(id)a3 displayName:(id)a4;
+ (id)dialNumber:(id)a3 displayName:(id)a4 error:(id *)a5;
+ (id)messageWithAdditionalParameters:(id)a3;
+ (id)sanitizePhoneNumber:(id)a3;
+ (id)sendDialMessage:(id)a3 displayName:(id)a4 error:(id *)a5;
+ (void)loadIdentityServices;
@end

@implementation CNPhoneDialer

+ (id)dialNumber:(id)a3 displayName:(id)a4 error:(id *)a5
{
  v5 = objc_msgSend(a1, "URLWithPhoneNumber:", a3, a4, a5);
  v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v6 openSensitiveURL:v5 withOptions:0];

  return 0;
}

+ (id)URLWithPhoneNumber:(id)a3
{
  v3 = [a1 sanitizePhoneNumber:a3];
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [NSString stringWithFormat:@"tel:%@", v3];
  v6 = [v4 URLWithString:v5];

  return v6;
}

+ (id)sanitizePhoneNumber:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (id)sendDialMessage:(id)a3 displayName:(id)a4 error:(id *)a5
{
  v7 = [a1 dialMessageWithDataValue:a3 displayName:a4];
  id v13 = 0;
  char v8 = [a1 sendMessage:v7 error:&v13];
  id v9 = v13;
  v10 = v9;
  if ((v8 & 1) == 0) {
    NSLog(&cfstr_ErrorDialing.isa, v9);
  }
  if (a5) {
    *a5 = v10;
  }
  v11 = [v7 objectForKey:@"guid"];

  return v11;
}

+ (id)dialMessageWithDataValue:(id)a3 displayName:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionary];
  [v9 setObject:@"dial" forKey:@"command"];
  [v9 setObject:v8 forKey:@"TUCallServicesDestinationIDKey"];
  [v9 setObject:v8 forKey:@"dataValue"];

  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"shouldPrompt"];
  objc_msgSend(v9, "_cn_setNonNilObject:forKey:", v7, @"displayName");

  [v9 setObject:&unk_1EE089368 forKey:@"ttl"];
  v10 = [a1 messageWithAdditionalParameters:v9];

  return v10;
}

+ (BOOL)cancelDialMessage:(id)a3 error:(id *)a4
{
  v6 = [a1 cancelMessageWithDialMessageID:a3];
  id v11 = 0;
  char v7 = [a1 sendMessage:v6 error:&v11];
  id v8 = v11;
  id v9 = v8;
  if ((v7 & 1) == 0) {
    NSLog(&cfstr_ErrorCancellin.isa, v8);
  }
  if (a4) {
    *a4 = v9;
  }

  return v7;
}

+ (id)cancelMessageWithDialMessageID:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"command";
  v9[1] = @"message";
  v10[0] = @"cancel";
  v10[1] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:v9 count:2];

  char v7 = [a1 messageWithAdditionalParameters:v6];

  return v7;
}

+ (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [a1 loadIdentityServices];
  char v7 = (void *)[objc_alloc(NSClassFromString(&cfstr_Idsservice.isa)) initWithService:@"com.apple.private.alloy.maps"];
  id v8 = [v7 accounts];
  id v9 = [v8 anyObject];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [v9 registeredURIs];
  v12 = [v10 setWithArray:v11];

  uint64_t v14 = 0;
  LOBYTE(a4) = [v7 sendMessage:v6 fromAccount:v9 toDestinations:v12 priority:300 options:0 identifier:&v14 error:a4];

  return (char)a4;
}

+ (void)loadIdentityServices
{
  if (loadIdentityServices_onceToken != -1) {
    dispatch_once(&loadIdentityServices_onceToken, &__block_literal_global_77);
  }
}

void __37__CNPhoneDialer_loadIdentityServices__block_invoke()
{
  if (!NSClassFromString(&cfstr_Idsservice.isa)) {
    NSLog(&cfstr_CouldNotLoadId.isa);
  }
}

void __37__CNPhoneDialer_loadIdentityServices__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/IDS.framework"];
  [v0 load];
}

+ (id)messageWithAdditionalParameters:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  [v5 setObject:&unk_1EE089380 forKey:@"protocolVersion"];
  id v6 = [MEMORY[0x1E4F29128] UUID];
  char v7 = [v6 UUIDString];
  [v5 setObject:v7 forKey:@"guid"];

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v8 forKey:@"timestamp"];

  [v5 addEntriesFromDictionary:v4];

  return v5;
}

@end