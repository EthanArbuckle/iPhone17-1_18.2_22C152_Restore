@interface DSMotionProvider
- (DSMotionProvider)initWithDelegate:(id)a3 queue:(id)a4;
- (DSMotionProviderDelegate)delegate;
- (void)failedToStartProviderWithOptions:(id)a3 error:(id)a4;
- (void)requestedMotionDataWithOption:(id)a3;
- (void)sendMotionData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startMotionDataProviderWithOptions:(id)a3;
- (void)startedProviderWithOptions:(id)a3;
- (void)stopMotionDataProvider;
- (void)stoppedProvider;
- (void)subscribedToMotionDataWithOptions:(id)a3;
- (void)subscriptionExpired;
- (void)unsubscribed;
@end

@implementation DSMotionProvider

- (DSMotionProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DSMotionProvider;
  v7 = [(DSProvider *)&v10 initWithDispatchQueue:a4];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (void)startMotionDataProviderWithOptions:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DSMotionProvider;
  [(DSProvider *)&v3 startMotionDataProviderWithOptions:a3];
}

- (void)sendMotionData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DSMotionProvider;
  [(DSProvider *)&v3 sendMotionData:a3];
}

- (void)stopMotionDataProvider
{
  v2.receiver = self;
  v2.super_class = (Class)DSMotionProvider;
  [(DSProvider *)&v2 stopMotionDataProvider];
}

- (void)startedProviderWithOptions:(id)a3
{
  v4 = [(DSMotionProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DSMotionProvider *)self delegate];
    [v6 dsmotionDidStartProvider:self];
  }
}

- (void)failedToStartProviderWithOptions:(id)a3 error:(id)a4
{
  id v8 = a4;
  char v5 = [(DSMotionProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(DSMotionProvider *)self delegate];
    [v7 dsmotion:self didFailToStartProviderWithError:v8];
  }
}

- (void)subscribedToMotionDataWithOptions:(id)a3
{
  id v7 = a3;
  v4 = [(DSMotionProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(DSMotionProvider *)self delegate];
    [v6 dsmotion:self didSubscribeToMotionDataWithOptions:v7];
  }
}

- (void)requestedMotionDataWithOption:(id)a3
{
  id v7 = a3;
  v4 = [(DSMotionProvider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(DSMotionProvider *)self delegate];
    [v6 dsmotion:self didRequestMotionDataWithOptions:v7];
  }
}

- (void)subscriptionExpired
{
  objc_super v3 = [(DSMotionProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(DSMotionProvider *)self delegate];
    [v5 dsmotionDidExpireMotionDataSubscription:self];
  }
}

- (void)unsubscribed
{
  objc_super v3 = [(DSMotionProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(DSMotionProvider *)self delegate];
    [v5 dsmotionDidUnsubscribeToMotionData:self];
  }
}

- (void)stoppedProvider
{
  objc_super v3 = [(DSMotionProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(DSMotionProvider *)self delegate];
    [v5 dsmotionDidStopProvider:self];
  }
}

- (DSMotionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSMotionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end