@interface EMHMERecipientCreationRequest
+ (BOOL)canCreateHMEReplyToAddress:(id)a3;
+ (Class)responseClass;
+ (id)log;
- (EMHMERecipientCreationRequest)initWithAccount:(id)a3 recipient:(id)a4 hmeAddress:(id)a5;
- (id)_httpBody;
- (id)urlRequest;
- (id)urlString;
- (void)_httpBody;
@end

@implementation EMHMERecipientCreationRequest

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EMHMERecipientCreationRequest_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_17 != -1) {
    dispatch_once(&log_onceToken_17, block);
  }
  v2 = (void *)log_log_17;
  return v2;
}

void __36__EMHMERecipientCreationRequest_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_17;
  log_log_17 = (uint64_t)v1;
}

- (EMHMERecipientCreationRequest)initWithAccount:(id)a3 recipient:(id)a4 hmeAddress:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMHMERecipientCreationRequest;
  v12 = [(EMHMERecipientCreationRequest *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    uint64_t v14 = [v10 copy];
    recipient = v13->_recipient;
    v13->_recipient = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    hmeAddress = v13->_hmeAddress;
    v13->_hmeAddress = (NSString *)v16;
  }
  return v13;
}

+ (BOOL)canCreateHMEReplyToAddress:(id)a3
{
  id v3 = [a3 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"hmeGetReplyToAddress"];

  LOBYTE(v3) = [v4 length] != 0;
  return (char)v3;
}

- (id)urlString
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  id v3 = [v2 objectForKeyedSubscript:@"hmeGetReplyToAddress"];

  v4 = +[EMHMERecipientCreationRequest log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1BEFDB000, v4, OS_LOG_TYPE_DEFAULT, "HME replyTo URL %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)_httpBody
{
  v11[2] = *MEMORY[0x1E4F143B8];
  hmeAddress = self->_hmeAddress;
  v10[0] = @"hme";
  v10[1] = @"recipientEmail";
  recipient = self->_recipient;
  v11[0] = hmeAddress;
  v11[1] = recipient;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v9 = 0;
  v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    v7 = +[EMHMERecipientCreationRequest log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(EMHMERecipientCreationRequest *)(uint64_t)v6 _httpBody];
    }
  }
  return v5;
}

- (id)urlRequest
{
  v15.receiver = self;
  v15.super_class = (Class)EMHMERecipientCreationRequest;
  id v3 = [(AARequest *)&v15 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  v5 = [(EMHMERecipientCreationRequest *)self _httpBody];
  [v4 setHTTPBody:v5];

  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  id v6 = [MEMORY[0x1E4F4BFA0] udid];
  [v4 setValue:v6 forHTTPHeaderField:@"X-Client-UDID"];

  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
  id v9 = [v8 infoDictionary];

  id v10 = [v7 objectForKey:@"ProductVersion"];
  id v11 = [v9 objectForKey:@"CFBundleName"];
  v12 = [v9 objectForKey:@"CFBundleVersion"];
  v13 = [NSString stringWithFormat:@"%@/%@ iOS/%@", v11, v12, v10];
  [v4 setValue:v13 forHTTPHeaderField:@"User-agent"];

  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmeAddress, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)_httpBody
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "JSONSerialization error for body %@", (uint8_t *)&v2, 0xCu);
}

@end