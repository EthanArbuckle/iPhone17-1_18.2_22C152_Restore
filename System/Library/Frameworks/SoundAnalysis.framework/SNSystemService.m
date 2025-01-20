@interface SNSystemService
+ (id)audiomxdLaunch;
- (SNSystemService)init;
@end

@implementation SNSystemService

+ (id)audiomxdLaunch
{
  static SNSystemService.audiomxdLaunch()();
  v4[4] = nullsub_1;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1DC9C881C;
  v4[3] = &unk_1F37FA990;
  v2 = _Block_copy(v4);
  swift_release();

  return v2;
}

- (SNSystemService)init
{
  return (SNSystemService *)SNSystemService.init()();
}

@end