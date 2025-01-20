@interface IRXPCSessionClient
- (IRXPCSessionClient)delegate;
- (IRXPCSessionClient)initWithDelegate:(id)a3;
- (void)_didSpotOnLocationComplete:(id)a3;
- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3;
- (void)_didUpdateContext:(id)a3;
- (void)_sessionDidFailWithError:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IRXPCSessionClient

- (void)_didUpdateContext:(id)a3
{
  id v4 = a3;
  id v5 = [(IRXPCSessionClient *)self delegate];
  [v5 _didUpdateContext:v4];
}

- (IRXPCSessionClient)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IRXPCSessionClient *)WeakRetained;
}

- (IRXPCSessionClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IRXPCSessionClient;
  id v5 = [(IRXPCSessionClient *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IRXPCSessionClient *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)_didSpotOnLocationComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(IRXPCSessionClient *)self delegate];
  [v5 _didSpotOnLocationComplete:v4];
}

- (void)_didUpdateBundlesWithSignificantInteractionPattern:(id)a3
{
  id v4 = a3;
  id v5 = [(IRXPCSessionClient *)self delegate];
  [v5 _didUpdateBundlesWithSignificantInteractionPattern:v4];
}

- (void)_sessionDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(IRXPCSessionClient *)self delegate];
  [v5 _sessionDidFailWithError:v4];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end