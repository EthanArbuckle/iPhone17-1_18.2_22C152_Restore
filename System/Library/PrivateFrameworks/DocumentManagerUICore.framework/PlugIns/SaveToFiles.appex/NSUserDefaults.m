@interface NSUserDefaults
- (BOOL)forceDisplayFilenameExtensions;
- (NSArray)DOCSourceOrderKey;
- (void)setDOCSourceOrderKey:(id)a3;
- (void)setForceDisplayFilenameExtensions:(BOOL)a3;
@end

@implementation NSUserDefaults

- (NSArray)DOCSourceOrderKey
{
  v2 = self;
  uint64_t v3 = sub_1000EB9F8();

  if (v3)
  {
    v4.super.isa = sub_1004D14F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setDOCSourceOrderKey:(id)a3
{
  if (a3)
  {
    sub_1004D1510();
    NSArray v4 = self;
    v5.super.isa = sub_1004D14F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5.super.isa = 0;
  }
  id v7 = sub_1004D1200();
  [(NSUserDefaults *)self setValue:v5.super.isa forKey:v7];

  swift_unknownObjectRelease();
}

- (BOOL)forceDisplayFilenameExtensions
{
  sub_1004D1240();
  id v3 = objc_allocWithZone((Class)NSUserDefaults);
  NSArray v4 = self;
  NSString v5 = sub_1004D1200();
  swift_bridgeObjectRelease();
  v6 = (NSUserDefaults *)[v3 initWithSuiteName:v5];

  if (v6)
  {
    unsigned __int8 v7 = [(NSUserDefaults *)v6 BOOLForKey:DOCUserDefaultsForceShowFilenameExtensionsKey];

    NSArray v4 = v6;
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)setForceDisplayFilenameExtensions:(BOOL)a3
{
}

@end