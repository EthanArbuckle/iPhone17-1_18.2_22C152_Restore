@interface GKImageRestrictions
+ (BOOL)isAuthorizedForGamesWithImageData:(id)a3;
+ (CGImage)cgImageForGamesWithData:(id)a3;
+ (void)setForCurrentProcess;
+ (void)setForCurrentProcessAllowingPDF:(BOOL)a3;
- (GKImageRestrictions)init;
@end

@implementation GKImageRestrictions

+ (void)setForCurrentProcess
{
}

+ (void)setForCurrentProcessAllowingPDF:(BOOL)a3
{
}

+ (BOOL)isAuthorizedForGamesWithImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1C2E91A58();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  BOOL v7 = sub_1C2E32758(v4, v6);
  sub_1C2DFD1D4(v4, v6);
  return v7;
}

+ (CGImage)cgImageForGamesWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1C2E91A58();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  BOOL v7 = (CGImage *)sub_1C2E32990(v4, v6);
  sub_1C2DFD1D4(v4, v6);
  return v7;
}

- (GKImageRestrictions)init
{
  return (GKImageRestrictions *)GKImageRestrictions.init()();
}

@end