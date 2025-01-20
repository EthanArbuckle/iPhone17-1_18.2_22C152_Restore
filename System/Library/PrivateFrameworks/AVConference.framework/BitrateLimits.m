@interface BitrateLimits
- (BitrateLimits)initWithOperatingMode:(unsigned __int8)a3 withBitrateCap:(unint64_t)a4 useCaseWatchContinuity:(BOOL)a5;
- (NSArray)limits;
- (id)commonAudioOnlyLimits;
- (id)commonAudioOnlyLimitsLegacy;
- (id)commonAudioVideoLimits;
- (unint64_t)defaultValueForNetwork:(BOOL)a3;
- (void)capDefaultValues:(unint64_t)a3;
- (void)dealloc;
- (void)setUpDefaultValuesAudioVideo;
- (void)setupDefaultValuesAudio;
@end

@implementation BitrateLimits

- (BitrateLimits)initWithOperatingMode:(unsigned __int8)a3 withBitrateCap:(unint64_t)a4 useCaseWatchContinuity:(BOOL)a5
{
  int v7 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)BitrateLimits;
  v8 = [(BitrateLimits *)&v17 init];
  v9 = v8;
  if (v8)
  {
    switch(v7)
    {
      case 0:
      case 1:
      case 4:
      case 5:
        id v10 = [(BitrateLimits *)v8 commonAudioVideoLimits];
        v11 = &unk_1F3DC79B0;
        goto LABEL_4;
      case 2:
        v12 = [(BitrateLimits *)v8 commonAudioOnlyLimitsLegacy];
        if (a5) {
          goto LABEL_13;
        }
        v13 = &unk_1F3DC7980;
        break;
      case 3:
        v12 = [(BitrateLimits *)v8 commonAudioOnlyLimits];
        if (a5) {
          goto LABEL_13;
        }
        v13 = &unk_1F3DC7998;
        break;
      case 6:
        v18[0] = [NSNumber numberWithUnsignedInteger:a4];
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        v9->defaultValue = a4;
        v9->defaultValueCellular = a4;
        v9->defaultValue2G = a4;
        v9->limits = (NSArray *)v14;
        goto LABEL_14;
      case 7:
        v12 = [(BitrateLimits *)v8 commonAudioOnlyLimitsLegacy];
        goto LABEL_13;
      case 8:
        v12 = [(BitrateLimits *)v8 commonAudioOnlyLimits];
        v13 = &unk_1F3DC79C8;
        break;
      case 9:
        id v10 = [(BitrateLimits *)v8 commonAudioVideoLimits];
        v11 = &unk_1F3DC79E0;
LABEL_4:
        v9->limits = (NSArray *)[v10 arrayByAddingObjectsFromArray:v11];
        [(BitrateLimits *)v9 setUpDefaultValuesAudioVideo];
        goto LABEL_14;
      default:
        goto LABEL_14;
    }
    v12 = [(NSArray *)v12 arrayByAddingObjectsFromArray:v13];
LABEL_13:
    v9->limits = v12;
    [(BitrateLimits *)v9 setupDefaultValuesAudio];
LABEL_14:
    [(BitrateLimits *)v9 capDefaultValues:a4];
    v15 = v9->limits;
  }
  return v9;
}

- (void)setupDefaultValuesAudio
{
  *(int64x2_t *)&self->defaultValue = vdupq_n_s64(0x9C40uLL);
  self->defaultValue2G = 40000;
}

- (void)setUpDefaultValuesAudioVideo
{
  *(_OWORD *)&self->defaultValue = xmmword_1E25A1B70;
  self->defaultValue2G = 32000;
}

- (id)commonAudioOnlyLimitsLegacy
{
  return (id)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3DC79F8];
}

- (id)commonAudioOnlyLimits
{
  return (id)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3DC7A10];
}

- (id)commonAudioVideoLimits
{
  return (id)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3DC7A28];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)BitrateLimits;
  [(BitrateLimits *)&v3 dealloc];
}

- (void)capDefaultValues:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self->limits count] - 1;
  unint64_t v6 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", [NSNumber numberWithUnsignedInteger:a3], self->limits);
  if (v5 >= v6) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = v5;
  }
  unint64_t defaultValue2G = objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->limits, "objectAtIndexedSubscript:", v7), "unsignedIntegerValue");
  int8x16_t v9 = (int8x16_t)vdupq_n_s64(defaultValue2G);
  *(int8x16_t *)&self->defaultValue = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v9, *(uint64x2_t *)&self->defaultValue), *(int8x16_t *)&self->defaultValue, v9);
  if (self->defaultValue2G < defaultValue2G) {
    unint64_t defaultValue2G = self->defaultValue2G;
  }
  self->unint64_t defaultValue2G = defaultValue2G;
}

- (unint64_t)defaultValueForNetwork:(BOOL)a3
{
  uint64_t v3 = 8;
  if (a3) {
    uint64_t v3 = 16;
  }
  return *(unint64_t *)((char *)&self->super.isa + v3);
}

- (NSArray)limits
{
  return self->limits;
}

@end