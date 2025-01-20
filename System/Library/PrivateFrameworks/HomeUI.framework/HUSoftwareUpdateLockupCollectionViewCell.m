@interface HUSoftwareUpdateLockupCollectionViewCell
- (Class)lockupViewClass;
@end

@implementation HUSoftwareUpdateLockupCollectionViewCell

- (Class)lockupViewClass
{
  return (Class)objc_opt_class();
}

@end