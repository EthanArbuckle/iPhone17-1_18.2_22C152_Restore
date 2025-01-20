@interface IKOrdinalElement
- (unint64_t)maxLength;
@end

@implementation IKOrdinalElement

- (unint64_t)maxLength
{
  v2 = [(IKViewElement *)self style];
  unint64_t v3 = [v2 ordinalMaxLength];

  return v3;
}

@end