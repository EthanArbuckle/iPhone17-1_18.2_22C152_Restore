@interface CXInProcessProvider
- (CXInProcessCallSource)callSource;
- (CXInProcessProvider)initWithConfiguration:(id)a3;
- (CXInProcessProvider)initWithConfiguration:(id)a3 callSource:(id)a4;
- (NSString)identifier;
- (void)setCallSource:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
@end

@implementation CXInProcessProvider

- (CXInProcessProvider)initWithConfiguration:(id)a3
{
  return 0;
}

- (CXInProcessProvider)initWithConfiguration:(id)a3 callSource:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CXInProcessProvider;
  v7 = [(CXProvider *)&v13 initWithConfiguration:a3];
  if (v7)
  {
    v8 = [v6 identifier];
    uint64_t v9 = [v8 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    id v11 = objc_storeWeak((id *)&v7->_callSource, v6);
    [v6 setProvider:v7];

    [(CXProvider *)v7 registerCurrentConfiguration];
  }

  return v7;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXInProcessProvider;
  [(CXProvider *)&v6 setDelegate:a3 queue:a4];
  v5 = [(CXProvider *)self abstractProvider];
  [v5 sendDidBeginForProvider:self];
}

- (CXInProcessCallSource)callSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callSource);

  return (CXInProcessCallSource *)WeakRetained;
}

- (void)setCallSource:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_callSource);
}

@end