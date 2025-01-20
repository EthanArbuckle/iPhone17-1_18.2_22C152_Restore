@interface CRKStudentdBackedInstructordTransportProvider
- (CRKRequestPerformingProtocol)studentDaemonProxy;
- (CRKStudentdBackedInstructordTransportProvider)init;
- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3;
- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4;
- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5;
- (NSString)instructordBundleIdentifier;
- (NSURL)classroomAppBundleURL;
- (void)fetchTransportOperationDidFinish:(id)a3 completion:(id)a4;
- (void)fetchTransportWithCompletion:(id)a3;
- (void)setClassroomAppBundleURL:(id)a3;
- (void)setInstructordBundleIdentifier:(id)a3;
- (void)setStudentDaemonProxy:(id)a3;
@end

@implementation CRKStudentdBackedInstructordTransportProvider

- (CRKStudentdBackedInstructordTransportProvider)init
{
  return [(CRKStudentdBackedInstructordTransportProvider *)self initWithStudentDaemonProxy:0 classroomAppBundleURL:0];
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3
{
  return [(CRKStudentdBackedInstructordTransportProvider *)self initWithStudentDaemonProxy:a3 classroomAppBundleURL:0];
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4
{
  return [(CRKStudentdBackedInstructordTransportProvider *)self initWithStudentDaemonProxy:a3 classroomAppBundleURL:a4 instructordBundleIdentifier:0];
}

- (CRKStudentdBackedInstructordTransportProvider)initWithStudentDaemonProxy:(id)a3 classroomAppBundleURL:(id)a4 instructordBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKStudentdBackedInstructordTransportProvider;
  v11 = [(CRKStudentdBackedInstructordTransportProvider *)&v17 init];
  if (v11)
  {
    if (v8) {
      v12 = (CRKRequestPerformingProtocol *)v8;
    }
    else {
      v12 = (CRKRequestPerformingProtocol *)objc_opt_new();
    }
    studentDaemonProxy = v11->_studentDaemonProxy;
    v11->_studentDaemonProxy = v12;

    uint64_t v14 = [v10 copy];
    instructordBundleIdentifier = v11->_instructordBundleIdentifier;
    v11->_instructordBundleIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_classroomAppBundleURL, a4);
  }

  return v11;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_opt_new();
  v5 = [(CRKStudentdBackedInstructordTransportProvider *)self classroomAppBundleURL];
  [v11 setClassroomAppBundleURL:v5];

  v6 = [(CRKStudentdBackedInstructordTransportProvider *)self instructordBundleIdentifier];
  [v11 setInstructordBundleIdentifier:v6];

  v7 = [(CRKStudentdBackedInstructordTransportProvider *)self studentDaemonProxy];
  id v8 = [v7 operationForRequest:v11];

  id v9 = (void *)MEMORY[0x22A620AF0](v4);
  [v8 addTarget:self selector:sel_fetchTransportOperationDidFinish_completion_ forOperationEvents:6 userInfo:v9];

  id v10 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v10 addOperation:v8];
}

- (void)fetchTransportOperationDidFinish:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, id))a4;
  id v6 = a3;
  v7 = [v6 error];

  if (v7)
  {
    id v12 = [v6 error];

    v5[2](v5, 0, v12);
  }
  else
  {
    id v12 = [v6 resultObject];

    id v8 = objc_alloc(MEMORY[0x263F08D68]);
    id v9 = [v12 endpoint];
    uint64_t v10 = [v8 initWithListenerEndpoint:v9];

    id v11 = (void *)[objc_alloc(MEMORY[0x263F39CE8]) initWithXPCConnection:v10];
    ((void (**)(id, void *, id))v5)[2](v5, v11, 0);

    v5 = (void (**)(id, void, id))v10;
  }
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void)setStudentDaemonProxy:(id)a3
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

  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end