@interface __HMDPairedAccessoryBrowseAssertion
- (HMDAccessoryBrowser)accessoryBrowser;
- (__HMDPairedAccessoryBrowseAssertion)initWithAccessoryBrowser:(id)a3 reason:(id)a4;
- (__HMDPairedAccessoryBrowseAssertion)initWithName:(id)a3;
- (void)invalidate;
@end

@implementation __HMDPairedAccessoryBrowseAssertion

- (__HMDPairedAccessoryBrowseAssertion)initWithAccessoryBrowser:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_9:
    v15 = (HMDAccessoryBrowser *)_HMFPreconditionFailure();
    [(HMDAccessoryBrowser *)v15 __activate];
    return result;
  }
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  if ([v8 length])
  {
    uint64_t v11 = [v10 stringByAppendingFormat:@".%@", v8];

    v10 = (void *)v11;
  }
  v17.receiver = self;
  v17.super_class = (Class)__HMDPairedAccessoryBrowseAssertion;
  v12 = [(HMFAssertion *)&v17 initWithName:v10];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessoryBrowser, v6);
    objc_msgSend(v6, "__activate");
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (HMDAccessoryBrowser)accessoryBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryBrowser);
  return (HMDAccessoryBrowser *)WeakRetained;
}

- (void)invalidate
{
  if ([(HMFAssertion *)self isValid])
  {
    v4.receiver = self;
    v4.super_class = (Class)__HMDPairedAccessoryBrowseAssertion;
    [(HMFAssertion *)&v4 invalidate];
    v3 = [(__HMDPairedAccessoryBrowseAssertion *)self accessoryBrowser];
    objc_msgSend(v3, "__inactivate");
  }
}

- (__HMDPairedAccessoryBrowseAssertion)initWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end