@interface CNSensitiveContentUIEntitlementVerifierTestDouble
- (BOOL)canShowSensitiveUI;
- (BOOL)hasCommunicationFilterEntitlements;
- (CNSensitiveContentUIEntitlementVerifierTestDouble)initWithCanShowSensitiveUI:(BOOL)a3 processHasCommunicationFilterEntitlements:(BOOL)a4;
- (void)setCanShowSensitiveUI:(BOOL)a3;
- (void)setHasCommunicationFilterEntitlements:(BOOL)a3;
@end

@implementation CNSensitiveContentUIEntitlementVerifierTestDouble

- (void)setHasCommunicationFilterEntitlements:(BOOL)a3
{
  self->_hasCommunicationFilterEntitlements = a3;
}

- (BOOL)hasCommunicationFilterEntitlements
{
  return self->_hasCommunicationFilterEntitlements;
}

- (void)setCanShowSensitiveUI:(BOOL)a3
{
  self->_canShowSensitiveUI = a3;
}

- (BOOL)canShowSensitiveUI
{
  return self->_canShowSensitiveUI;
}

- (CNSensitiveContentUIEntitlementVerifierTestDouble)initWithCanShowSensitiveUI:(BOOL)a3 processHasCommunicationFilterEntitlements:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentUIEntitlementVerifierTestDouble;
  v6 = [(CNSensitiveContentUIEntitlementVerifierTestDouble *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_canShowSensitiveUI = a3;
    v6->_hasCommunicationFilterEntitlements = a4;
    v8 = v6;
  }

  return v7;
}

@end