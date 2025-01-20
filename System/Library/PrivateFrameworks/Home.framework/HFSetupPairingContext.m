@interface HFSetupPairingContext
- (BOOL)isTrustedOrigin;
- (HFSetupPairingContext)init;
- (HFSetupPairingContext)initWithSetupAccessoryDescription:(id)a3 isTrustedOrigin:(BOOL)a4;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (void)setIsTrustedOrigin:(BOOL)a3;
- (void)setSetupAccessoryDescription:(id)a3;
@end

@implementation HFSetupPairingContext

- (HFSetupPairingContext)initWithSetupAccessoryDescription:(id)a3 isTrustedOrigin:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HFSetupPairingContext.m", 15, @"Invalid parameter not satisfying: %@", @"setupAccessoryDescription" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HFSetupPairingContext;
  v9 = [(HFSetupPairingContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_setupAccessoryDescription, a3);
    v10->_isTrustedOrigin = a4;
  }

  return v10;
}

- (HFSetupPairingContext)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithSetupAccessoryDescription_isTrustedOrigin_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSetupPairingContext.m", 27, @"%s is unavailable; use %@ instead",
    "-[HFSetupPairingContext init]",
    v5);

  return 0;
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
}

- (BOOL)isTrustedOrigin
{
  return self->_isTrustedOrigin;
}

- (void)setIsTrustedOrigin:(BOOL)a3
{
  self->_isTrustedOrigin = a3;
}

- (void).cxx_destruct
{
}

@end