@interface CRKCurrentPlatformInstructordTransportProvider
- (CRKCurrentPlatformInstructordTransportProvider)init;
- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3;
- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4;
- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5;
- (NSString)instructordBundleIdentifier;
- (NSURL)classroomAppBundleURL;
- (id)makeProviderForCurrentPlatformWithStudentDaemonProxy:(id)a3;
- (void)fetchTransportWithCompletion:(id)a3;
- (void)setClassroomAppBundleURL:(id)a3;
- (void)setInstructordBundleIdentifier:(id)a3;
@end

@implementation CRKCurrentPlatformInstructordTransportProvider

- (CRKCurrentPlatformInstructordTransportProvider)init
{
  return [(CRKCurrentPlatformInstructordTransportProvider *)self initWithStudentDaemonProxy:0];
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3
{
  return [(CRKCurrentPlatformInstructordTransportProvider *)self initWithStudentDaemonProxy:a3 classroomAppBundleURL:0];
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4
{
  return [(CRKCurrentPlatformInstructordTransportProvider *)self initWithStudentDaemonProxy:a3 classroomAppBundleURL:a4 instructordBundleIdentifier:0];
}

- (CRKCurrentPlatformInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKCurrentPlatformInstructordTransportProvider;
  v11 = [(CRKCurrentPlatformInstructordTransportProvider *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_classroomAppBundleURL, a4);
    uint64_t v13 = [v10 copy];
    instructordBundleIdentifier = v12->_instructordBundleIdentifier;
    v12->_instructordBundleIdentifier = (NSString *)v13;

    uint64_t v15 = [(CRKCurrentPlatformInstructordTransportProvider *)v12 makeProviderForCurrentPlatformWithStudentDaemonProxy:v8];
    mBaseProvider = v12->mBaseProvider;
    v12->mBaseProvider = (CRKTransportProviding *)v15;
  }
  return v12;
}

- (id)makeProviderForCurrentPlatformWithStudentDaemonProxy:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08AB0] processInfo];
  int v6 = objc_msgSend(v5, "crk_hasEntitlement:withValue:", @"com.apple.studentd-access", MEMORY[0x263EFFA88]);

  if (v6)
  {
    v7 = [CRKStudentdBackedInstructordTransportProvider alloc];
    id v8 = [(CRKCurrentPlatformInstructordTransportProvider *)self classroomAppBundleURL];
    id v9 = [(CRKCurrentPlatformInstructordTransportProvider *)self instructordBundleIdentifier];
    id v10 = [(CRKStudentdBackedInstructordTransportProvider *)v7 initWithStudentDaemonProxy:v4 classroomAppBundleURL:v8 instructordBundleIdentifier:v9];
  }
  else
  {
    id v10 = (CRKStudentdBackedInstructordTransportProvider *)objc_opt_new();
  }

  return v10;
}

- (void)fetchTransportWithCompletion:(id)a3
{
}

- (NSURL)classroomAppBundleURL
{
  return self->_classroomAppBundleURL;
}

- (void)setClassroomAppBundleURL:(id)a3
{
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void)setInstructordBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_classroomAppBundleURL, 0);

  objc_storeStrong((id *)&self->mBaseProvider, 0);
}

@end