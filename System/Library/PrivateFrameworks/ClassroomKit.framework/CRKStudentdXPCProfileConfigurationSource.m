@interface CRKStudentdXPCProfileConfigurationSource
- (BOOL)isStudentdInstalled;
- (BOOL)shouldUsePlaceholderFile;
- (CRKNonCatalystStudentDaemonProxy)studentDaemonProxy;
- (CRKStudentdXPCProfileConfigurationSource)init;
- (CRKStudentdXPCProfileConfigurationSource)initWithCallbackQueue:(id)a3;
- (void)fetchConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CRKStudentdXPCProfileConfigurationSource

- (CRKStudentdXPCProfileConfigurationSource)init
{
  return [(CRKStudentdXPCProfileConfigurationSource *)self initWithCallbackQueue:MEMORY[0x263EF83A0]];
}

- (CRKStudentdXPCProfileConfigurationSource)initWithCallbackQueue:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKStudentdXPCProfileConfigurationSource;
  v6 = [(CRKStudentdXPCProfileConfigurationSource *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mCallbackQueue, a3);
    if ([(CRKStudentdXPCProfileConfigurationSource *)v7 shouldUsePlaceholderFile])
    {
      v8 = objc_msgSend(NSURL, "crk_iOSPlaceholderProfileURL");
      v9 = [v8 URLByDeletingLastPathComponent];
      v10 = [v8 lastPathComponent];
      v11 = [[CRKDirectoryBackedConfigurationSource alloc] initWithDirectoryURL:v9 fileName:v10 callbackQueue:v5];
      mPlaceholderFileConfigurationSource = v7->mPlaceholderFileConfigurationSource;
      v7->mPlaceholderFileConfigurationSource = (CRKConfigurationSource *)v11;
    }
    v13 = [[CRKNonCatalystStudentDaemonProxy alloc] initWithCallbackQueue:v5];
    studentDaemonProxy = v7->_studentDaemonProxy;
    v7->_studentDaemonProxy = v13;
  }
  return v7;
}

- (BOOL)isStudentdInstalled
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = objc_msgSend(v2, "crk_isStudentdInstalled");

  return v3;
}

- (BOOL)shouldUsePlaceholderFile
{
  int v3 = CRKIsiOS();
  if (v3) {
    LOBYTE(v3) = ![(CRKStudentdXPCProfileConfigurationSource *)self isStudentdInstalled];
  }
  return v3;
}

- (void)fetchConfiguration:(id)a3
{
  id v5 = a3;
  if ([(CRKStudentdXPCProfileConfigurationSource *)self shouldUsePlaceholderFile])
  {
    [(CRKConfigurationSource *)self->mPlaceholderFileConfigurationSource fetchConfiguration:v5];
  }
  else
  {
    v4 = [(CRKStudentdXPCProfileConfigurationSource *)self studentDaemonProxy];
    [v4 fetchConfiguration:v5];
  }
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CRKStudentdXPCProfileConfigurationSource *)self shouldUsePlaceholderFile])
  {
    if (v9) {
      uint64_t v7 = MEMORY[0x263EFFA78];
    }
    else {
      uint64_t v7 = 0;
    }
    [(CRKConfigurationSource *)self->mPlaceholderFileConfigurationSource setConfiguration:v7 completion:v6];
  }
  else
  {
    v8 = [(CRKStudentdXPCProfileConfigurationSource *)self studentDaemonProxy];
    [v8 setConfiguration:v9 completion:v6];
  }
}

- (CRKNonCatalystStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->mPlaceholderFileConfigurationSource, 0);

  objc_storeStrong((id *)&self->mCallbackQueue, 0);
}

@end