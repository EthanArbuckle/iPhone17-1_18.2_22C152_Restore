@interface CRKCancelableBackedCatalystIDSSubscription
- (CRKCancelable)cancelable;
- (CRKCancelableBackedCatalystIDSSubscription)initWithCancelable:(id)a3;
- (void)cancel;
@end

@implementation CRKCancelableBackedCatalystIDSSubscription

- (CRKCancelableBackedCatalystIDSSubscription)initWithCancelable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKCancelableBackedCatalystIDSSubscription;
  v6 = [(CRKCancelableBackedCatalystIDSSubscription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cancelable, a3);
  }

  return v7;
}

- (void)cancel
{
  id v2 = [(CRKCancelableBackedCatalystIDSSubscription *)self cancelable];
  [v2 cancel];
}

- (CRKCancelable)cancelable
{
  return self->_cancelable;
}

- (void).cxx_destruct
{
}

@end