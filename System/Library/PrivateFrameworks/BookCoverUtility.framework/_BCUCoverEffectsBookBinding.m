@interface _BCUCoverEffectsBookBinding
- (BOOL)includeBinding;
- (double)cornerRadius;
- (double)tintBlurRadius;
@end

@implementation _BCUCoverEffectsBookBinding

- (BOOL)includeBinding
{
  return 1;
}

- (double)cornerRadius
{
  return 2.0;
}

- (double)tintBlurRadius
{
  return 60.0;
}

@end