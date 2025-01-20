@interface NSObject
- (id)_tcr_associatedReader;
- (void)_tcr_associateWithReader:(id)a3;
@end

@implementation NSObject

- (void)_tcr_associateWithReader:(id)a3
{
  v4 = self;
  id value = a3;
  self;
  objc_setAssociatedObject(v4, &unk_1004A0E70, value, (void *)0x301);
}

- (id)_tcr_associatedReader
{
  v2 = self;
  self;
  v3 = objc_getAssociatedObject(v2, &unk_1004A0E70);

  return v3;
}

@end