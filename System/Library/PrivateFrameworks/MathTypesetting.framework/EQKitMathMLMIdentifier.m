@interface EQKitMathMLMIdentifier
- (int)scriptVariant;
@end

@implementation EQKitMathMLMIdentifier

- (int)scriptVariant
{
  if ((*(unsigned char *)&self->super.mFlags & 3) != 0) {
    return 1;
  }
  else {
    return 3;
  }
}

@end