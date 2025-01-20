@interface VCPHuman
+ (unint64_t)flagsFromKeypoints:(id)a3 withMinConfidence:(float)a4;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange;
- (CGRect)bounds;
- (VCPHuman)init;
- (VNTorsoprint)torsoprint;
- (float)confidence;
- (int)humanID;
- (unint64_t)flags;
- (void)setBounds:(CGRect)a3;
- (void)setConfidence:(float)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHumanID:(int)a3;
- (void)setTimerange:(id *)a3;
- (void)setTorsoprint:(id)a3;
@end

@implementation VCPHuman

- (VCPHuman)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPHuman;
  v2 = [(VCPHuman *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_flags = 0;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_bounds.size = v4;
    *(void *)&v2->_confidence = 0;
    uint64_t v5 = MEMORY[0x1E4F1FA20];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&v2->_timerange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&v2->_timerange.start.epoch = v6;
    *(_OWORD *)&v2->_timerange.duration.timescale = *(_OWORD *)(v5 + 32);
    torsoprint = v2->_torsoprint;
    v2->_torsoprint = 0;
  }
  return v3;
}

+ (unint64_t)flagsFromKeypoints:(id)a3 withMinConfidence:(float)a4
{
  id v5 = a3;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  unsigned __int8 v11 = 0;
  unsigned int v12 = -13;
  while ([v5 count] > v6)
  {
    v13 = [v5 objectAtIndexedSubscript:v6];
    uint64_t v14 = [v13 count];

    if (v14 != 3) {
      goto LABEL_25;
    }
    v15 = [v5 objectAtIndexedSubscript:v6];
    v16 = [v15 objectAtIndexedSubscript:2];
    [v16 floatValue];
    float v18 = v17;

    if (v18 > a4)
    {
      if (v6 > 4)
      {
        if (v12 + 8 > 1)
        {
          if (v12 < 0xFFFFFFFE)
          {
            if (v12 + 6 > 1)
            {
              if (v12 < 2) {
                v7 |= 0x800000uLL;
              }
            }
            else
            {
              v7 |= 0x400000uLL;
            }
          }
          else
          {
            ++v10;
          }
        }
        else
        {
          ++v9;
        }
      }
      else
      {
        v11 |= v6 < 3;
        ++v8;
      }
    }
    ++v6;
    ++v12;
  }
  if ((v11 & (v8 > 2)) != 0) {
    uint64_t v19 = v7 | 0x100000;
  }
  else {
    uint64_t v19 = v7;
  }
  if (v10) {
    BOOL v20 = v9 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20) {
    unint64_t v7 = v19;
  }
  else {
    unint64_t v7 = v19 | 0x200000;
  }
LABEL_25:

  return v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int)humanID
{
  return self->_humanID;
}

- (void)setHumanID:(int)a3
{
  self->_humanID = a3;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange
{
  objc_copyStruct(retstr, &self->_timerange, 48, 1, 0);
  return result;
}

- (void)setTimerange:(id *)a3
{
}

- (VNTorsoprint)torsoprint
{
  return (VNTorsoprint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTorsoprint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end