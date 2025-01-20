@interface CSSpeakerRecognitionProxy
- (CSSSRXPCClient)ssrXPCClient;
- (CSSpeakerRecognitionProxy)initWithDelegate:(id)a3;
- (CSSpeakerRecognitionProxyProtocol)delegate;
- (void)dealloc;
- (void)didFinishSpeakerRecognition:(id)a3;
- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3;
- (void)invalidateXPCConnection;
- (void)setSsrXPCClient:(id)a3;
- (void)startXPCConnection;
@end

@implementation CSSpeakerRecognitionProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ssrXPCClient, 0);
}

- (CSSpeakerRecognitionProxyProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSpeakerRecognitionProxyProtocol *)WeakRetained;
}

- (void)setSsrXPCClient:(id)a3
{
}

- (CSSSRXPCClient)ssrXPCClient
{
  return self->_ssrXPCClient;
}

- (void)didFinishSpeakerRecognition:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[CSSpeakerRecognitionProxy didFinishSpeakerRecognition:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 didFinishSpeakerRecognition:v4];
    }
  }
}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[CSSpeakerRecognitionProxy didReceiveSpeakerRecognitionScoreCard:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 didReceiveSpeakerRecognitionScoreCard:v4];
    }
  }
}

- (void)dealloc
{
  [(CSSpeakerRecognitionProxy *)self invalidateXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)CSSpeakerRecognitionProxy;
  [(CSSpeakerRecognitionProxy *)&v3 dealloc];
}

- (void)invalidateXPCConnection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeakerRecognitionProxy invalidateXPCConnection]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSSSRXPCClient *)self->_ssrXPCClient invalidate];
}

- (void)startXPCConnection
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeakerRecognitionProxy startXPCConnection]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSSSRXPCClient *)self->_ssrXPCClient startXPCConnection];
}

- (CSSpeakerRecognitionProxy)initWithDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSpeakerRecognitionProxy;
  v5 = [(CSSpeakerRecognitionProxy *)&v11 init];
  if (v5
    && (uint64_t v6 = objc_alloc_init(CSSSRXPCClient),
        ssrXPCClient = v5->_ssrXPCClient,
        v5->_ssrXPCClient = v6,
        ssrXPCClient,
        [(CSSSRXPCClient *)v5->_ssrXPCClient setDelegate:v5],
        objc_storeWeak((id *)&v5->_delegate, v4),
        !v5->_ssrXPCClient))
  {
    id v9 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSSpeakerRecognitionProxy initWithDelegate:]";
      _os_log_error_impl(&dword_1C9338000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to establish XPC connection!", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

@end