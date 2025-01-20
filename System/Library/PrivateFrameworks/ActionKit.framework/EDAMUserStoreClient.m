@interface EDAMUserStoreClient
- (BOOL)checkVersion:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5;
- (EDAMUserStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4;
- (EDAMUserStoreClient)initWithProtocol:(id)a3;
- (id)authenticate:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 supportsTwoFactor:(BOOL)a7;
- (id)authenticateLongSession:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 deviceIdentifier:(id)a7 deviceDescription:(id)a8 supportsTwoFactor:(BOOL)a9;
- (id)authenticateLongSessionV2:(id)a3;
- (id)authenticateOpenID:(id)a3 consumerKey:(id)a4 consumerSecret:(id)a5 deviceIdentifier:(id)a6 deviceDescription:(id)a7 authLongSession:(BOOL)a8 supportsTwoFactor:(BOOL)a9;
- (id)authenticateToBusiness:(id)a3;
- (id)completeTwoFactorAuthentication:(id)a3 oneTimeCode:(id)a4 deviceIdentifier:(id)a5 deviceDescription:(id)a6;
- (id)createSessionAuthenticationToken:(id)a3;
- (id)getAccountLimits:(int)a3;
- (id)getBootstrapInfo:(id)a3;
- (id)getConnectedIdentities:(id)a3 identityIds:(id)a4;
- (id)getNoteStoreUrl:(id)a3;
- (id)getPremiumInfo:(id)a3;
- (id)getPublicUserInfo:(id)a3;
- (id)getSubscriptionInfo:(id)a3;
- (id)getUser:(id)a3;
- (id)getUserUrls:(id)a3;
- (id)listBusinessInvitations:(id)a3 includeRequestedInvitations:(BOOL)a4;
- (id)listBusinessUsers:(id)a3;
- (id)refreshAuthentication:(id)a3;
- (id)registerForSyncPushNotifications:(id)a3 credentials:(id)a4;
- (void)inviteToBusiness:(id)a3 emailAddress:(id)a4;
- (void)removeFromBusiness:(id)a3 emailAddress:(id)a4;
- (void)revokeLongSession:(id)a3;
- (void)unregisterForSyncPushNotifications:(id)a3;
- (void)updateBusinessUserIdentifier:(id)a3 oldEmailAddress:(id)a4 newEmailAddress:(id)a5;
@end

@implementation EDAMUserStoreClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProtocol, 0);
  objc_storeStrong((id *)&self->_inProtocol, 0);
}

- (id)getConnectedIdentities:(id)a3 identityIds:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v10 = +[FATArgument argumentWithField:v9 value:v8];

  v25[0] = v10;
  v11 = +[FATField fieldWithIndex:0 type:10 optional:1 name:0];
  v12 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"identityIds" valueField:v11];
  v13 = +[FATArgument argumentWithField:v12 value:v7];

  v25[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  +[ENTProtocolUtil sendMessage:@"getConnectedIdentities" toProtocol:outProtocol withArguments:v14];

  inProtocol = self->_inProtocol;
  v16 = +[FATField fieldWithIndex:0 type:10 optional:1 name:0];
  v17 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v18 = +[FATField fieldWithIndex:0 type:13 optional:0 name:@"success" keyField:v16 valueField:v17];
  v19 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v18 type optional name structClass];
  v24[1] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v24[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  v22 = +[ENTProtocolUtil readMessage:@"getConnectedIdentities" fromProtocol:inProtocol withResponseTypes:v21];

  return v22;
}

- (id)getAccountLimits:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  v6 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"serviceLevel"];
  id v7 = [NSNumber numberWithInt:v3];
  id v8 = +[FATArgument argumentWithField:v6 value:v7];
  v17[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getAccountLimits" toProtocol:outProtocol withArguments:v9];

  inProtocol = self->_inProtocol;
  v11 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v12 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v11 type optional name structClass];
  v16[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v14 = +[ENTProtocolUtil readMessage:@"getAccountLimits" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)createSessionAuthenticationToken:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"createSessionAuthenticationToken" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  v10 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v11 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v10 type optional name structClass];
  v17[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v12;
  v13 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v17[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  v15 = +[ENTProtocolUtil readMessage:@"createSessionAuthenticationToken" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (void)unregisterForSyncPushNotifications:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v16[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  +[ENTProtocolUtil sendMessage:@"unregisterForSyncPushNotifications" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  v10 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v15[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v15[1] = v11;
  v12 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"unregisterForSyncPushNotifications" fromProtocol:inProtocol withResponseTypes:v13];
}

- (id)registerForSyncPushNotifications:(id)a3 credentials:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"credentials" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"registerForSyncPushNotifications" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"registerForSyncPushNotifications" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)listBusinessInvitations:(id)a3 includeRequestedInvitations:(BOOL)a4
{
  BOOL v4 = a4;
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a3;
  id v8 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v9 = +[FATArgument argumentWithField:v8 value:v7];

  v23[0] = v9;
  v10 = +[FATField fieldWithIndex:2 type:2 optional:0 name:@"includeRequestedInvitations"];
  v11 = [NSNumber numberWithBool:v4];
  v12 = +[FATArgument argumentWithField:v10 value:v11];
  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"listBusinessInvitations" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v17 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v16 type optional name structClass];
  v22[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  v20 = +[ENTProtocolUtil readMessage:@"listBusinessInvitations" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)listBusinessUsers:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listBusinessUsers" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v15 = +[ENTProtocolUtil readMessage:@"listBusinessUsers" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (void)updateBusinessUserIdentifier:(id)a3 oldEmailAddress:(id)a4 newEmailAddress:(id)a5
{
  v26[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v12 = +[FATArgument argumentWithField:v11 value:v10];

  v26[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"oldEmailAddress"];
  id v14 = +[FATArgument argumentWithField:v13 value:v9];

  v26[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"newEmailAddress"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v26[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  +[ENTProtocolUtil sendMessage:@"updateBusinessUserIdentifier" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v25[0] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v25[1] = v20;
  v21 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v25[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v23 = +[ENTProtocolUtil readMessage:@"updateBusinessUserIdentifier" fromProtocol:inProtocol withResponseTypes:v22];
}

- (void)removeFromBusiness:(id)a3 emailAddress:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v21[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"emailAddress"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v21[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  +[ENTProtocolUtil sendMessage:@"removeFromBusiness" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:2, 12, 0, @"systemException", objc_opt_class(), v15 type optional name structClass];
  v20[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v20[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"removeFromBusiness" fromProtocol:inProtocol withResponseTypes:v18];
}

- (void)inviteToBusiness:(id)a3 emailAddress:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v20[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"emailAddress"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v20[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  +[ENTProtocolUtil sendMessage:@"inviteToBusiness" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v19[0] = v15;
  v16 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v19[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  id v18 = +[ENTProtocolUtil readMessage:@"inviteToBusiness" fromProtocol:inProtocol withResponseTypes:v17];
}

- (id)getUserUrls:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getUserUrls" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"getUserUrls" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)getNoteStoreUrl:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getNoteStoreUrl" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"getNoteStoreUrl" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)getSubscriptionInfo:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getSubscriptionInfo" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"getSubscriptionInfo" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)getPremiumInfo:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getPremiumInfo" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"getPremiumInfo" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)getPublicUserInfo:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"username"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"getPublicUserInfo" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:1, 12, 0, @"notFoundException", objc_opt_class(), v10 type optional name structClass];
  v17[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v12;
  v13 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  void v17[3] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  v15 = +[ENTProtocolUtil readMessage:@"getPublicUserInfo" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (id)getUser:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getUser" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"getUser" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)refreshAuthentication:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"refreshAuthentication" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"refreshAuthentication" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)authenticateToBusiness:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"authenticateToBusiness" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"authenticateToBusiness" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (void)revokeLongSession:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v15[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  +[ENTProtocolUtil sendMessage:@"revokeLongSession" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:2, 12, 0, @"systemException", objc_opt_class(), v10 type optional name structClass];
  v14[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v13 = +[ENTProtocolUtil readMessage:@"revokeLongSession" fromProtocol:inProtocol withResponseTypes:v12];
}

- (id)completeTwoFactorAuthentication:(id)a3 oneTimeCode:(id)a4 deviceIdentifier:(id)a5 deviceDescription:(id)a6
{
  v32[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v14 = +[FATArgument argumentWithField:v13 value:v12];

  v32[0] = v14;
  v15 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"oneTimeCode"];
  v16 = +[FATArgument argumentWithField:v15 value:v11];

  v32[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"deviceIdentifier"];
  id v18 = +[FATArgument argumentWithField:v17 value:v10];

  v32[2] = v18;
  id v19 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"deviceDescription"];
  v20 = +[FATArgument argumentWithField:v19 value:v9];

  v32[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  +[ENTProtocolUtil sendMessage:@"completeTwoFactorAuthentication" toProtocol:outProtocol withArguments:v21];

  inProtocol = self->_inProtocol;
  id v23 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v31[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v31[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v31[2] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v27 = +[ENTProtocolUtil readMessage:@"completeTwoFactorAuthentication" fromProtocol:inProtocol withResponseTypes:v26];

  return v27;
}

- (id)authenticateLongSessionV2:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"authParams" structClass:objc_opt_class()];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"authenticateLongSessionV2" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  id v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v16[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  id v14 = +[ENTProtocolUtil readMessage:@"authenticateLongSessionV2" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)authenticateLongSession:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 deviceIdentifier:(id)a7 deviceDescription:(id)a8 supportsTwoFactor:(BOOL)a9
{
  v46[7] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v43 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"username"];
  v42 = +[FATArgument argumentWithField:v43 value:v19];

  v46[0] = v42;
  v40 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"password"];
  v39 = +[FATArgument argumentWithField:v40 value:v18];

  v46[1] = v39;
  v38 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"consumerKey"];
  v37 = +[FATArgument argumentWithField:v38 value:v17];

  v46[2] = v37;
  v20 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"consumerSecret"];
  v21 = +[FATArgument argumentWithField:v20 value:v16];

  v46[3] = v21;
  v22 = +[FATField fieldWithIndex:5 type:11 optional:0 name:@"deviceIdentifier"];
  id v23 = +[FATArgument argumentWithField:v22 value:v15];

  v46[4] = v23;
  v24 = +[FATField fieldWithIndex:6 type:11 optional:0 name:@"deviceDescription"];
  v25 = +[FATArgument argumentWithField:v24 value:v14];

  v46[5] = v25;
  v26 = +[FATField fieldWithIndex:7 type:2 optional:0 name:@"supportsTwoFactor"];
  v27 = [NSNumber numberWithBool:a9];
  v28 = +[FATArgument argumentWithField:v26 value:v27];
  v46[6] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:7];
  +[ENTProtocolUtil sendMessage:@"authenticateLongSession" toProtocol:outProtocol withArguments:v29];

  inProtocol = self->_inProtocol;
  v31 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v45[0] = v31;
  v32 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v45[1] = v32;
  v33 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v45[2] = v33;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  v35 = +[ENTProtocolUtil readMessage:@"authenticateLongSession" fromProtocol:inProtocol withResponseTypes:v34];

  return v35;
}

- (id)authenticateOpenID:(id)a3 consumerKey:(id)a4 consumerSecret:(id)a5 deviceIdentifier:(id)a6 deviceDescription:(id)a7 authLongSession:(BOOL)a8 supportsTwoFactor:(BOOL)a9
{
  BOOL v38 = a8;
  v46[7] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v43 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"credential" structClass:objc_opt_class()];
  v42 = +[FATArgument argumentWithField:v43 value:v17];

  v46[0] = v42;
  v40 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"consumerKey"];
  v39 = +[FATArgument argumentWithField:v40 value:v16];

  v46[1] = v39;
  v37 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"consumerSecret"];
  v36 = +[FATArgument argumentWithField:v37 value:v15];

  v46[2] = v36;
  v35 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"deviceIdentifier"];
  id v18 = +[FATArgument argumentWithField:v35 value:v14];

  v46[3] = v18;
  id v19 = +[FATField fieldWithIndex:5 type:11 optional:0 name:@"deviceDescription"];
  v20 = +[FATArgument argumentWithField:v19 value:v13];

  v46[4] = v20;
  v21 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"authLongSession"];
  v22 = [NSNumber numberWithBool:v38];
  id v23 = +[FATArgument argumentWithField:v21 value:v22];
  v46[5] = v23;
  v24 = +[FATField fieldWithIndex:7 type:2 optional:0 name:@"supportsTwoFactor"];
  v25 = [NSNumber numberWithBool:a9];
  v26 = +[FATArgument argumentWithField:v24 value:v25];
  v46[6] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:7];
  +[ENTProtocolUtil sendMessage:@"authenticateOpenID" toProtocol:outProtocol withArguments:v27];

  inProtocol = self->_inProtocol;
  v29 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v45[0] = v29;
  v30 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v45[1] = v30;
  v31 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v45[2] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  v33 = +[ENTProtocolUtil readMessage:@"authenticateOpenID" fromProtocol:inProtocol withResponseTypes:v32];

  return v33;
}

- (id)authenticate:(id)a3 password:(id)a4 consumerKey:(id)a5 consumerSecret:(id)a6 supportsTwoFactor:(BOOL)a7
{
  BOOL v31 = a7;
  v37[5] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v34 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"username"];
  v32 = +[FATArgument argumentWithField:v34 value:v13];

  v37[0] = v32;
  id v14 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"password"];
  id v15 = +[FATArgument argumentWithField:v14 value:v12];

  v37[1] = v15;
  id v16 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"consumerKey"];
  id v17 = +[FATArgument argumentWithField:v16 value:v11];

  v37[2] = v17;
  id v18 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"consumerSecret"];
  id v19 = +[FATArgument argumentWithField:v18 value:v10];

  v37[3] = v19;
  v20 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"supportsTwoFactor"];
  v21 = [NSNumber numberWithBool:v31];
  v22 = +[FATArgument argumentWithField:v20 value:v21];
  v37[4] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:5];
  +[ENTProtocolUtil sendMessage:@"authenticate" toProtocol:outProtocol withArguments:v23];

  inProtocol = self->_inProtocol;
  v25 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v36[0] = v25;
  v26 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v36[1] = v26;
  v27 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v36[2] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
  v29 = +[ENTProtocolUtil readMessage:@"authenticate" fromProtocol:inProtocol withResponseTypes:v28];

  return v29;
}

- (id)getBootstrapInfo:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"locale"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v15[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  +[ENTProtocolUtil sendMessage:@"getBootstrapInfo" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  id v14 = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  id v12 = +[ENTProtocolUtil readMessage:@"getBootstrapInfo" fromProtocol:inProtocol withResponseTypes:v11];

  return v12;
}

- (BOOL)checkVersion:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  void v25[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a3;
  id v8 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"clientName"];
  id v9 = +[FATArgument argumentWithField:v8 value:v7];

  v25[0] = v9;
  id v10 = +[FATField fieldWithIndex:2 type:6 optional:0 name:@"edamVersionMajor"];
  id v11 = [NSNumber numberWithShort:v6];
  id v12 = +[FATArgument argumentWithField:v10 value:v11];
  v25[1] = v12;
  id v13 = +[FATField fieldWithIndex:3 type:6 optional:0 name:@"edamVersionMinor"];
  id v14 = [NSNumber numberWithShort:v5];
  id v15 = +[FATArgument argumentWithField:v13 value:v14];
  v25[2] = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  +[ENTProtocolUtil sendMessage:@"checkVersion" toProtocol:outProtocol withArguments:v16];

  inProtocol = self->_inProtocol;
  id v18 = +[FATField fieldWithIndex:0 type:2 optional:0 name:@"success"];
  v24 = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v20 = +[ENTProtocolUtil readMessage:@"checkVersion" fromProtocol:inProtocol withResponseTypes:v19];
  LOBYTE(inProtocol) = [v20 BOOLValue];

  return (char)inProtocol;
}

- (EDAMUserStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDAMUserStoreClient;
  id v9 = [(EDAMUserStoreClient *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inProtocol, a3);
    objc_storeStrong((id *)&v10->_outProtocol, a4);
  }

  return v10;
}

- (EDAMUserStoreClient)initWithProtocol:(id)a3
{
  return [(EDAMUserStoreClient *)self initWithInProtocol:a3 outProtocol:a3];
}

@end