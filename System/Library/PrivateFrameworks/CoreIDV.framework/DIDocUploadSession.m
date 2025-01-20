@interface DIDocUploadSession
- (DIDocUploadSession)init;
- (DIDocUploadSessionClient)client;
- (void)cancelUploads;
- (void)init;
- (void)setClient:(id)a3;
- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5;
@end

@implementation DIDocUploadSession

- (DIDocUploadSession)init
{
  v3 = DIV_LOG_CLIENT_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(DIDocUploadSession *)v3 init];
  }

  v14.receiver = self;
  v14.super_class = (Class)DIDocUploadSession;
  v11 = [(DIDocUploadSession *)&v14 init];
  v12 = objc_alloc_init(DIDocUploadSessionClient);
  [(DIDocUploadSession *)v11 setClient:v12];

  return v11;
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = DIV_LOG_CLIENT_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DIDocUploadSession uploadDocData:uploadSettings:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  v19 = [(DIDocUploadSession *)self client];
  [v19 uploadDocData:v10 uploadSettings:v9 completion:v8];
}

- (void)cancelUploads
{
}

- (DIDocUploadSessionClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
}

- (void)uploadDocData:(uint64_t)a3 uploadSettings:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end