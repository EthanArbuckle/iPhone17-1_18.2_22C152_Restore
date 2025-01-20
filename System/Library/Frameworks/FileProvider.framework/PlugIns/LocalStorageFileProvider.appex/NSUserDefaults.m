@interface NSUserDefaults
- (NSArray)iCDPackageExtensions;
@end

@implementation NSUserDefaults

- (NSArray)iCDPackageExtensions
{
  v2 = self;
  NSString v3 = sub_10096BC00();
  v4 = [(NSUserDefaults *)v2 stringArrayForKey:v3];

  if (v4)
  {
    sub_10096C0A0();

    v2 = (NSUserDefaults *)v4;
  }

  v5.super.isa = sub_10096C080().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

@end