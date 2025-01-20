@interface HUAvailableTriggerItemActivationRequest
- (BOOL)active;
- (BOOL)isSameAsRequest:(id)a3;
- (HUAvailableTriggerItem)item;
- (HUAvailableTriggerItemActivationRequest)initWithItem:(id)a3 active:(BOOL)a4;
- (NAFuture)completionFuture;
- (void)setActive:(BOOL)a3;
- (void)setCompletionFuture:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation HUAvailableTriggerItemActivationRequest

- (HUAvailableTriggerItemActivationRequest)initWithItem:(id)a3 active:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUAvailableTriggerItemActivationRequest;
  v7 = [(HUAvailableTriggerItemActivationRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_active = a4;
    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    completionFuture = v8->_completionFuture;
    v8->_completionFuture = v9;
  }
  return v8;
}

- (BOOL)isSameAsRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 item];
  id v6 = [(HUAvailableTriggerItemActivationRequest *)self item];
  if ([v5 isEqual:v6])
  {
    int v7 = [v4 active];
    int v8 = v7 ^ [(HUAvailableTriggerItemActivationRequest *)self active] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (HUAvailableTriggerItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (HUAvailableTriggerItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void)setCompletionFuture:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionFuture, 0);

  objc_destroyWeak((id *)&self->_item);
}

@end