@interface AVPlaybackSpeed
+ (NSArray)systemDefaultSpeeds;
+ (id)_highToLowSystemDefaultSpeeds;
+ (id)_lowToHighSystemDefaultSpeeds;
+ (id)_rateFormattedAsString:(float)a3 locale:(id)a4;
- (AVPlaybackSpeed)initWithRate:(float)a3 localizedName:(id)a4 synthesized:(BOOL)a5;
- (AVPlaybackSpeed)initWithRate:(float)rate localizedName:(NSString *)localizedName;
- (BOOL)isSynthesized;
- (NSString)localizedName;
- (NSString)localizedNumericName;
- (float)rate;
- (id)description;
- (id)internalDescription;
@end

@implementation AVPlaybackSpeed

- (float)rate
{
  return self->_rate;
}

uint64_t __38__AVPlaybackSpeed_systemDefaultSpeeds__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _lowToHighSystemDefaultSpeeds];
  uint64_t v2 = AVPlaybackSpeedSystemDefaultSpeeds;
  AVPlaybackSpeedSystemDefaultSpeeds = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (AVPlaybackSpeed)initWithRate:(float)a3 localizedName:(id)a4 synthesized:(BOOL)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AVPlaybackSpeed;
  v9 = [(AVPlaybackSpeed *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_rate = a3;
    uint64_t v11 = [v8 copy];
    localizedName = v10->_localizedName;
    v10->_localizedName = (NSString *)v11;

    v13 = self;
    v14 = NSString;
    v15 = AVLocalizedString(@"%@\\U00D7");
    v16 = [MEMORY[0x1E4F1CA20] currentLocale];
    *(float *)&double v17 = a3;
    v18 = [v13 _rateFormattedAsString:v16 locale:v17];
    uint64_t v19 = objc_msgSend(v14, "stringWithFormat:", v15, v18);

    localizedNumericName = v10->_localizedNumericName;
    v10->_localizedNumericName = (NSString *)v19;

    v10->_synthesized = a5;
  }

  return v10;
}

- (AVPlaybackSpeed)initWithRate:(float)rate localizedName:(NSString *)localizedName
{
  return -[AVPlaybackSpeed initWithRate:localizedName:synthesized:](self, "initWithRate:localizedName:synthesized:", localizedName, 0);
}

+ (id)_rateFormattedAsString:(float)a3 locale:(id)a4
{
  id v5 = a4;
  v6 = v5;
  double v7 = a3;
  if (a3 <= 0.01)
  {
    v10 = @"0.01";
  }
  else
  {
    float v8 = (float)(a3 * 10.0) - floorf(a3 * 10.0);
    if (v5)
    {
      id v9 = v5;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    uint64_t v11 = v9;
    double v12 = v8;
    id v13 = [NSString alloc];
    if (v12 > 0.951 || v12 <= 0.051) {
      v15 = @"%0.1f";
    }
    else {
      v15 = @"%0.2f";
    }
    v10 = (__CFString *)objc_msgSend(v13, "initWithFormat:locale:", v15, v11, *(void *)&v7);
  }

  return v10;
}

+ (NSArray)systemDefaultSpeeds
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AVPlaybackSpeed_systemDefaultSpeeds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (systemDefaultSpeeds_createSystemDefaultSpeedsOnce != -1) {
    dispatch_once(&systemDefaultSpeeds_createSystemDefaultSpeedsOnce, block);
  }
  uint64_t v2 = (void *)AVPlaybackSpeedSystemDefaultSpeeds;

  return (NSArray *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNumericName, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (NSString)localizedNumericName
{
  return self->_localizedNumericName;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AVPlaybackSpeed;
  v3 = [(AVPlaybackSpeed *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" [%f, %@, %@]", self->_rate, self->_localizedNumericName, self->_localizedName];

  return v4;
}

- (id)internalDescription
{
  BOOL v3 = [(AVPlaybackSpeed *)self isSynthesized];
  v4 = @"selectable";
  if (v3) {
    v4 = @"not selectable";
  }
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackSpeed;
  id v5 = v4;
  objc_super v6 = [(AVPlaybackSpeed *)&v9 description];
  double v7 = [v6 stringByAppendingFormat:@" [%f, %@, %@, %@]", self->_rate, v5, self->_localizedNumericName, self->_localizedName, v9.receiver, v9.super_class];

  return v7;
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

+ (id)_highToLowSystemDefaultSpeeds
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc((Class)a1);
  v24 = AVLocalizedString(@"Double Speed");
  LODWORD(v4) = 2.0;
  id v5 = (void *)[v3 initWithRate:v24 localizedName:v4];
  v25[0] = v5;
  id v6 = objc_alloc((Class)a1);
  double v7 = AVLocalizedString(@"Faster Speed");
  LODWORD(v8) = 1.5;
  objc_super v9 = (void *)[v6 initWithRate:v7 localizedName:v8];
  v25[1] = v9;
  id v10 = objc_alloc((Class)a1);
  uint64_t v11 = AVLocalizedString(@"Fast Speed");
  LODWORD(v12) = 1.25;
  id v13 = (void *)[v10 initWithRate:v11 localizedName:v12];
  v25[2] = v13;
  id v14 = objc_alloc((Class)a1);
  v15 = AVLocalizedString(@"Normal Speed");
  LODWORD(v16) = 1.0;
  double v17 = (void *)[v14 initWithRate:v15 localizedName:v16];
  v25[3] = v17;
  id v18 = objc_alloc((Class)a1);
  uint64_t v19 = AVLocalizedString(@"Half Speed");
  LODWORD(v20) = 0.5;
  v21 = (void *)[v18 initWithRate:v19 localizedName:v20];
  v25[4] = v21;
  objc_super v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];

  return v22;
}

+ (id)_lowToHighSystemDefaultSpeeds
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc((Class)a1);
  v24 = AVLocalizedString(@"Half Speed");
  LODWORD(v4) = 0.5;
  id v5 = (void *)[v3 initWithRate:v24 localizedName:v4];
  v25[0] = v5;
  id v6 = objc_alloc((Class)a1);
  double v7 = AVLocalizedString(@"Normal Speed");
  LODWORD(v8) = 1.0;
  objc_super v9 = (void *)[v6 initWithRate:v7 localizedName:v8];
  v25[1] = v9;
  id v10 = objc_alloc((Class)a1);
  uint64_t v11 = AVLocalizedString(@"Fast Speed");
  LODWORD(v12) = 1.25;
  id v13 = (void *)[v10 initWithRate:v11 localizedName:v12];
  v25[2] = v13;
  id v14 = objc_alloc((Class)a1);
  v15 = AVLocalizedString(@"Faster Speed");
  LODWORD(v16) = 1.5;
  double v17 = (void *)[v14 initWithRate:v15 localizedName:v16];
  v25[3] = v17;
  id v18 = objc_alloc((Class)a1);
  uint64_t v19 = AVLocalizedString(@"Double Speed");
  LODWORD(v20) = 2.0;
  v21 = (void *)[v18 initWithRate:v19 localizedName:v20];
  v25[4] = v21;
  objc_super v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];

  return v22;
}

@end