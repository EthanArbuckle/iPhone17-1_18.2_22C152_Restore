@interface DOCSharedServerSource
- (UIImage)iconPreferingSymbolImages;
- (unint64_t)status;
@end

@implementation DOCSharedServerSource

- (UIImage)iconPreferingSymbolImages
{
  v2 = self;
  id v3 = sub_100102598(0x6B726F7774656ELL, 0xE700000000000000, 0, 1);

  return (UIImage *)v3;
}

- (unint64_t)status
{
  return 2;
}

@end