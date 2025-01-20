@interface IDSKTVerificationInfoProvider
- (IDSKTVerificationInfoProvider)initWithApplicationIdentifier:(id)a3;
- (NSString)applicationIdentifier;
- (void)fetchPeerVerificationInfos:(id)a3 completionBlock:(id)a4;
- (void)fetchSelfVerificationInfo:(id)a3;
- (void)healSelf:(id)a3 completionBlock:(id)a4;
- (void)setApplicationIdentifier:(id)a3;
@end

@implementation IDSKTVerificationInfoProvider

- (IDSKTVerificationInfoProvider)initWithApplicationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSKTVerificationInfoProvider;
  v6 = [(IDSKTVerificationInfoProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationIdentifier, a3);
  }

  return v7;
}

- (void)fetchPeerVerificationInfos:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919944F0;
  v10[3] = &unk_1E57299E8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  +[IDSXPCDaemonController performDaemonControllerTask:v10];
}

- (void)fetchSelfVerificationInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191994704;
  v6[3] = &unk_1E572A990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (void)healSelf:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191994A0C;
  v10[3] = &unk_1E57299E8;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  +[IDSXPCDaemonController performDaemonControllerTask:v10];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end