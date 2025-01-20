@interface PHASEPresetMedium
+ (id)new;
- (PHASEPresetMedium)init;
- (PHASEPresetMedium)initWithEngine:(id)a3 preset:(int64_t)a4;
- (PHASEPresetMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4;
@end

@implementation PHASEPresetMedium

- (PHASEPresetMedium)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEPresetMedium)initWithEngine:(id)a3 preset:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PHASEPresetMedium;
  return [(PHASEMedium *)&v5 initWithEngine:a3 preset:a4];
}

- (PHASEPresetMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PHASEPresetMedium;
  return [(PHASEMedium *)&v5 initWithEngine:a3 privatePreset:a4];
}

@end