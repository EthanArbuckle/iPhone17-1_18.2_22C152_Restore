@interface CNPolicyDescription
- (BOOL)ignoresGuardianRestrictions;
- (NSString)containerIdentifier;
- (void)setContainerIdentifier:(id)a3;
- (void)setIgnoresGuardianRestrictions:(BOOL)a3;
@end

@implementation CNPolicyDescription

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (void).cxx_destruct
{
}

@end