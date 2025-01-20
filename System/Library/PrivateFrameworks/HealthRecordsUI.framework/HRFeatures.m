@interface HRFeatures
+ (BOOL)hideCategoryNameFromHeader;
+ (void)setHideCategoryNameFromHeader:(BOOL)a3;
- (HRFeatures)init;
@end

@implementation HRFeatures

- (HRFeatures)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Features();
  return [(HRFeatures *)&v3 init];
}

+ (BOOL)hideCategoryNameFromHeader
{
  return byte_1EA2E52D1;
}

+ (void)setHideCategoryNameFromHeader:(BOOL)a3
{
  byte_1EA2E52D1 = a3;
}

@end