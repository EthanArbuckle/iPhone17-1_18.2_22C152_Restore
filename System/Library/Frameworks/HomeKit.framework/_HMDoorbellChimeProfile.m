@interface _HMDoorbellChimeProfile
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (_HMDoorbellChimeProfileDelegate)delegate;
- (void)_handleDoorbellChimeMessage:(id)a3;
- (void)_registerNotificationHandlers;
- (void)setDelegate:(id)a3;
@end

@implementation _HMDoorbellChimeProfile

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1) {
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_5076);
  }
  v2 = (void *)logCategory__hmf_once_v3;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
  v4 = &self->_lock + 1;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(v4);
}

- (_HMDoorbellChimeProfileDelegate)delegate
{
  v3 = &self->_lock + 1;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(v3);

  return (_HMDoorbellChimeProfileDelegate *)WeakRetained;
}

- (void)_handleDoorbellChimeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(_HMDoorbellChimeProfile *)self delegate];
  [v5 didReceiveDoorbellChimeMessage:v4];
}

- (void)_registerNotificationHandlers
{
  id v4 = [(_HMAccessoryProfile *)self context];
  v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"HM.doorbell.chime" receiver:self selector:sel__handleDoorbellChimeMessage_];
}

@end