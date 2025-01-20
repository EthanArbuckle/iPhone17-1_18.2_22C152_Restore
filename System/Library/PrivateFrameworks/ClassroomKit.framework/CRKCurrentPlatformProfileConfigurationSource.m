@interface CRKCurrentPlatformProfileConfigurationSource
- (CRKCurrentPlatformProfileConfigurationSource)init;
- (CRKCurrentPlatformProfileConfigurationSource)initWithCallbackQueue:(id)a3;
- (CRKCurrentPlatformProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4;
- (CRKFeatureFlags)featureFlags;
- (CRKRequestPerformingProtocol)studentDaemonProxy;
- (id)makeSourceForCurrentPlatformWithCallbackQueue:(id)a3;
- (void)fetchConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CRKCurrentPlatformProfileConfigurationSource

- (CRKCurrentPlatformProfileConfigurationSource)init
{
  return [(CRKCurrentPlatformProfileConfigurationSource *)self initWithCallbackQueue:MEMORY[0x263EF83A0]];
}

- (CRKCurrentPlatformProfileConfigurationSource)initWithCallbackQueue:(id)a3
{
  return [(CRKCurrentPlatformProfileConfigurationSource *)self initWithStudentDaemonProxy:0 callbackQueue:a3];
}

- (CRKCurrentPlatformProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKCurrentPlatformProfileConfigurationSource;
  v9 = [(CRKCurrentPlatformProfileConfigurationSource *)&v16 init];
  if (v9)
  {
    v10 = objc_opt_new();
    uint64_t v11 = [v10 makeFeatureFlags];
    featureFlags = v9->_featureFlags;
    v9->_featureFlags = (CRKFeatureFlags *)v11;

    uint64_t v13 = [(CRKCurrentPlatformProfileConfigurationSource *)v9 makeSourceForCurrentPlatformWithCallbackQueue:v8];
    mBaseSource = v9->mBaseSource;
    v9->mBaseSource = (CRKConfigurationSource *)v13;

    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
  }

  return v9;
}

- (id)makeSourceForCurrentPlatformWithCallbackQueue:(id)a3
{
  v4 = (void *)MEMORY[0x263F08AB0];
  id v5 = a3;
  v6 = [v4 processInfo];
  int v7 = objc_msgSend(v6, "crk_hasEntitlement:withValue:", @"com.apple.studentd-access", MEMORY[0x263EFFA88]);

  if (v7)
  {
    id v8 = [(CRKCurrentPlatformProfileConfigurationSource *)self studentDaemonProxy];
    v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    id v12 = v10;

    uint64_t v11 = [[CRKStudentdCatalystProfileConfigurationSource alloc] initWithStudentDaemonProxy:v12 callbackQueue:v5];
    id v5 = v12;
  }
  else
  {
    uint64_t v11 = [[CRKStudentdXPCProfileConfigurationSource alloc] initWithCallbackQueue:v5];
  }

  return v11;
}

- (void)fetchConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
}

- (CRKFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong((id *)&self->mBaseSource, 0);
}

@end