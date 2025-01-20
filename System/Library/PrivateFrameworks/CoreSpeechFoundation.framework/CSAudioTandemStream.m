@interface CSAudioTandemStream
- (BOOL)isStreaming;
- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4;
- (CSAudioStream)primaryStream;
- (CSAudioTandemStream)initWithMasterAudioStream:(id)a3 name:(id)a4;
- (void)attachToPrimaryStreamWithCompletion:(id)a3;
- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4;
- (void)setPrimaryStream:(id)a3;
- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4;
- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4;
@end

@implementation CSAudioTandemStream

- (void).cxx_destruct
{
}

- (void)setPrimaryStream:(id)a3
{
}

- (CSAudioStream)primaryStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryStream);
  return (CSAudioStream *)WeakRetained;
}

- (BOOL)isStreaming
{
  v2 = [(CSAudioTandemStream *)self primaryStream];
  char v3 = [v2 isStreaming];

  return v3;
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSAudioTandemStream stopAudioStreamWithOption:completion:]", "CSAudioTandemStream.m", 65, "NO");
}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSAudioTandemStream startAudioStreamWithOption:completion:]", "CSAudioTandemStream.m", 58, "NO");
}

- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSAudioTandemStream prepareAudioStreamWithRequest:completion:]", "CSAudioTandemStream.m", 51, "NO");
}

- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  __assert_rtn("-[CSAudioTandemStream prepareAudioStreamSyncWithRequest:error:]", "CSAudioTandemStream.m", 46, "NO");
}

- (void)attachToPrimaryStreamWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(CSAudioTandemStream *)self primaryStream];

  if (!v5)
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      v12 = "-[CSAudioTandemStream attachToPrimaryStreamWithCompletion:]";
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s primaryStream already torn down", (uint8_t *)&v11, 0xCu);
      if (!v4) {
        goto LABEL_6;
      }
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:963 userInfo:0];
    v4[2](v4, 0, v10);

    goto LABEL_6;
  }
  id v6 = [(CSAudioTandemStream *)self primaryStream];
  v7 = [v6 streamProvider];
  v8 = [(CSAudioTandemStream *)self primaryStream];
  [v7 attachTandemStream:self toPrimaryStream:v8 completion:v4];

LABEL_6:
}

- (CSAudioTandemStream)initWithMasterAudioStream:(id)a3 name:(id)a4
{
  id v4 = (CSAudioTandemStream *)a3;
  if (a3)
  {
    id v6 = a4;
    v7 = v4;
    [(CSAudioTandemStream *)self setPrimaryStream:v7];
    v8 = [(CSAudioStream *)v7 streamProvider];
    v9 = [CSAudioStreamRequest alloc];
    v10 = [(CSAudioStream *)v7 streamRequest];

    id v11 = [(CSAudioStreamRequest *)v9 initTandemWithRequest:v10];
    v12 = [(CSAudioStream *)self initWithAudioStreamProvider:v8 streamName:v6 streamRequest:v11];

    self = v12;
    id v4 = self;
  }

  return v4;
}

@end