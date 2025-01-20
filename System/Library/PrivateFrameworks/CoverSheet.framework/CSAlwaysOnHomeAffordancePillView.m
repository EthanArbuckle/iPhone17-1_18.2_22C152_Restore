@interface CSAlwaysOnHomeAffordancePillView
+ (Class)layerClass;
- (CSAlwaysOnHomeAffordancePillView)initWithFrame:(CGRect)a3 settings:(id)a4;
@end

@implementation CSAlwaysOnHomeAffordancePillView

- (CSAlwaysOnHomeAffordancePillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CSAlwaysOnHomeAffordancePillView;
  v4 = -[MTPillView initWithFrame:settings:](&v13, sel_initWithFrame_settings_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = [MEMORY[0x1E4F428B8] whiteColor];
    v6 = [v5 colorWithAlphaComponent:0.25];
    [(CSAlwaysOnHomeAffordancePillView *)v4 setBackgroundColor:v6];

    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v7 setValue:&unk_1F306A508 forKey:*MEMORY[0x1E4F3A1D8]];
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    [v7 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A1B8]];
    [v7 setValue:v8 forKey:*MEMORY[0x1E4F3A1A0]];
    v9 = [(CSAlwaysOnHomeAffordancePillView *)v4 layer];
    v14[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v9 setFilters:v10];

    v11 = [(CSAlwaysOnHomeAffordancePillView *)v4 layer];
    [v11 setScale:0.125];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end