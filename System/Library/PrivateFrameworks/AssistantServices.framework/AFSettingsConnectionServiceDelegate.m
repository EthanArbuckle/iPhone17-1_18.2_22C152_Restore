@interface AFSettingsConnectionServiceDelegate
- (AFSettingsConnectionServiceDelegate)initWithSettingsConnection:(id)a3;
- (void)syncVerificationPartialResult:(id)a3;
- (void)syncVerificationServerReport:(id)a3;
@end

@implementation AFSettingsConnectionServiceDelegate

- (void).cxx_destruct
{
}

- (void)syncVerificationServerReport:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained _tellDelegateServerVerificationReport:v4];
}

- (void)syncVerificationPartialResult:(id)a3
{
  p_connection = &self->_connection;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  [WeakRetained _tellDelegatePartialVerificationResult:v4];
}

- (AFSettingsConnectionServiceDelegate)initWithSettingsConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFSettingsConnectionServiceDelegate;
  v5 = [(AFSettingsConnectionServiceDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

@end