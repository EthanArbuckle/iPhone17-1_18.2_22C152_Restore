@interface CIDVUIBiometricBindingEnrollmentProvider
- (CIDVUIBiometricBindingEnrollmentProvider)init;
- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)internalProvider;
- (void)enrollWithCompletion:(id)a3;
- (void)fetchAttestationsWithCompletion:(id)a3;
- (void)setInternalProvider:(id)a3;
@end

@implementation CIDVUIBiometricBindingEnrollmentProvider

- (CIDVUIBiometricBindingEnrollmentProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CIDVUIBiometricBindingEnrollmentProvider;
  v2 = [(CIDVUIBiometricBindingEnrollmentProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider);
    internalProvider = v2->_internalProvider;
    v2->_internalProvider = v3;
  }
  return v2;
}

- (void)enrollWithCompletion:(id)a3
{
}

- (void)fetchAttestationsWithCompletion:(id)a3
{
}

- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)internalProvider
{
  return (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end