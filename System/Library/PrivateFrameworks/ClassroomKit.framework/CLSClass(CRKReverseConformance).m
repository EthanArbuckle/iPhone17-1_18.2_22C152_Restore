@interface CLSClass(CRKReverseConformance)
- (BOOL)isEditable;
@end

@implementation CLSClass(CRKReverseConformance)

- (BOOL)isEditable
{
  return [a1 source] == 3;
}

@end