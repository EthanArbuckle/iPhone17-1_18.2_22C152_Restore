@interface _BEProcessCapabilityGrant
- (BOOL)invalidate;
- (BOOL)isValid;
@end

@implementation _BEProcessCapabilityGrant

- (BOOL)isValid
{
  return objc_msgSend(*(id *)self->inner, sel_isValid);
}

- (BOOL)invalidate
{
  return 1;
}

@end