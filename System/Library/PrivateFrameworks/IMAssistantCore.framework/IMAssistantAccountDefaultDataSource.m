@interface IMAssistantAccountDefaultDataSource
+ (id)sharedInstance;
- (BOOL)hasMessagingAccount;
- (id)countryCode;
- (id)imHandleWithID:(id)a3;
@end

@implementation IMAssistantAccountDefaultDataSource

- (BOOL)hasMessagingAccount
{
  v2 = [MEMORY[0x263F4A520] sharedInstance];
  v3 = objc_msgSend(v2, "__im_assistant_bestMessagingAccount");
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)imHandleWithID:(id)a3
{
  v3 = (void *)MEMORY[0x263F4A520];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  v6 = objc_msgSend(v5, "__im_assistant_bestMessagingAccount");

  v7 = [v6 imHandleWithID:v4];

  return v7;
}

- (id)countryCode
{
  v2 = [MEMORY[0x263F4A520] sharedInstance];
  v3 = objc_msgSend(v2, "__im_assistant_bestMessagingAccount");

  id v4 = [v3 countryCode];

  return v4;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22C1CCD18;
  block[3] = &unk_264912A68;
  block[4] = a1;
  if (qword_2684A5578 != -1) {
    dispatch_once(&qword_2684A5578, block);
  }
  v2 = (void *)qword_2684A5570;

  return v2;
}

@end