@interface PKQuery
- (PKQuery)initWithRecognitionSessionManager:(id)a3;
- (PKRecognitionSessionManager)sessionManager;
- (id)delegate;
- (void)setDelegate:(id)a3;
- (void)setSessionManager:(id)a3;
@end

@implementation PKQuery

- (PKQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKQuery;
  v5 = [(PKQuery *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sessionManager, v4);
  }

  return v6;
}

- (PKRecognitionSessionManager)sessionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionManager);

  return (PKRecognitionSessionManager *)WeakRetained;
}

- (void)setSessionManager:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);

  objc_destroyWeak((id *)&self->_sessionManager);
}

@end