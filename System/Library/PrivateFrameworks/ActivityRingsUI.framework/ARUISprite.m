@interface ARUISprite
+ (id)randomSprite;
- (ARUISprite)initWithFrameCount:(ARUISprite *)self frameColumns:(SEL)a2 firstFrameOrigin:(unint64_t)a3 frameSize:(unint64_t)a4;
- (ARUISprite)initWithSprite:(id)a3;
- (BOOL)isEqual:(id)a3;
- (double)firstFrameOrigin;
- (double)frameSize;
- (double)translation;
- (float)opacity;
- (float)size;
- (float32x2_t)textureRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)currentFrameIndex;
- (unint64_t)frameColumns;
- (unint64_t)frameCount;
- (unint64_t)hash;
- (void)setCurrentFrameIndex:(unint64_t)a3;
- (void)setOpacity:(float)a3;
- (void)setSize:(float)a3;
- (void)setTranslation:(ARUISprite *)self;
@end

@implementation ARUISprite

- (unint64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unint64_t)a3
{
  self->_currentFrameIndex = a3;
}

- (unint64_t)hash
{
  v3 = +[ARUIHashBuilder builder];
  [v3 appendUnsignedInt:self->_frameCount];
  [v3 appendUnsignedInt:self->_frameColumns];
  [v3 appendUnsignedInt:self->_currentFrameIndex];
  [v3 appendFloat2:*(double *)self->_firstFrameOrigin];
  [v3 appendFloat2:*(double *)self->_frameSize];
  p_size = &self->_size;
  *(float32x2_t *)&double v5 = vld1_dup_f32(p_size);
  [v3 appendFloat2:v5];
  [v3 appendFloat2:*(double *)self->_translation];
  *(float *)&double v6 = self->_opacity;
  [v3 appendFloat:v6];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (double)translation
{
  return *(double *)(a1 + 16);
}

- (float32x2_t)textureRect
{
  float32x2_t v1 = a1[4];
  float32x2_t v2 = a1[7];
  v3.i64[0] = *(void *)&v1 % *(void *)&v2;
  v3.i64[1] = *(void *)&v1 / *(void *)&v2;
  return vmla_f32(a1[5], a1[6], vcvt_f32_f64(vcvtq_f64_u64(v3)));
}

- (float)size
{
  return self->_size;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setTranslation:(ARUISprite *)self
{
  *(void *)self->_translation = v2;
}

- (void)setSize:(float)a3
{
  self->_size = a3;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (ARUISprite)initWithFrameCount:(ARUISprite *)self frameColumns:(SEL)a2 firstFrameOrigin:(unint64_t)a3 frameSize:(unint64_t)a4
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  v11.receiver = self;
  v11.super_class = (Class)ARUISprite;
  result = [(ARUISprite *)&v11 init];
  if (result)
  {
    result->_frameColumns = a4;
    *(void *)result->_firstFrameOrigin = v7;
    *(void *)result->_frameSize = v6;
    *(void *)result->_translation = 0;
    result->_frameCount = a3;
    result->_currentFrameIndex = 0;
    *(void *)&result->_size = 0x3F80000043960000;
  }
  return result;
}

- (ARUISprite)initWithSprite:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 frameCount];
  uint64_t v6 = [v4 frameColumns];
  [v4 firstFrameOrigin];
  double v8 = v7;
  [v4 frameSize];
  v10 = [(ARUISprite *)self initWithFrameCount:v5 frameColumns:v6 firstFrameOrigin:v8 frameSize:v9];
  if (v10)
  {
    v10->_currentFrameIndex = [v4 currentFrameIndex];
    [v4 size];
    v10->_size = v11;
    [v4 translation];
    *(void *)v10->_translation = v12;
    [v4 opacity];
    v10->_opacity = v13;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t frameCount = self->_frameCount;
    if (frameCount != [v5 frameCount]) {
      goto LABEL_11;
    }
    unint64_t frameColumns = self->_frameColumns;
    if (frameColumns != [v5 frameColumns]) {
      goto LABEL_11;
    }
    unint64_t currentFrameIndex = self->_currentFrameIndex;
    if (currentFrameIndex != [v5 currentFrameIndex]) {
      goto LABEL_11;
    }
    float32x2_t v9 = *(float32x2_t *)self->_firstFrameOrigin;
    [v5 firstFrameOrigin];
    if (!ARUIFloat2Equal(v9, v10)) {
      goto LABEL_11;
    }
    float32x2_t v11 = *(float32x2_t *)self->_frameSize;
    [v5 frameSize];
    if (ARUIFloat2Equal(v11, v12)
      && (p_size = &self->_size,
          float32x2_t v14 = vld1_dup_f32(p_size),
          [v5 size],
          ARUIFloat2Equal(v14, (float32x2_t)vdup_lane_s32(v15, 0)))
      && (float32x2_t v16 = *(float32x2_t *)self->_translation, [v5 translation], ARUIFloat2Equal(v16, v17)))
    {
      float opacity = self->_opacity;
      [v5 opacity];
      BOOL v20 = ARUIFloatEqual(opacity, v19);
    }
    else
    {
LABEL_11:
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ARUISprite;
  uint64x2_t v3 = [(ARUISprite *)&v7 description];
  id v4 = objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  id v5 = [NSString stringWithFormat:@"%@, frame %lu/%lu>", v4, self->_currentFrameIndex, self->_frameCount];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ARUISprite allocWithZone:a3];

  return [(ARUISprite *)v4 initWithSprite:self];
}

+ (id)randomSprite
{
  uint64_t v2 = (int)ARUIRandomInt(0, 1000);
  uint64x2_t v3 = [ARUISprite alloc];
  uint64_t v4 = (int)ARUIRandomInt(0, 1000);
  double v5 = COERCE_DOUBLE(ARUIRandomFloat2(0.0, 1000.0));
  uint64_t v6 = [(ARUISprite *)v3 initWithFrameCount:v2 frameColumns:v4 firstFrameOrigin:v5 frameSize:COERCE_DOUBLE(ARUIRandomFloat2(0.0, 1000.0))];
  *(float *)&double v7 = ARUIRandomFloat(0.0, 1000.0);
  [(ARUISprite *)v6 setSize:v7];
  [(ARUISprite *)v6 setTranslation:COERCE_DOUBLE(ARUIRandomFloat2(0.0, 1000.0))];
  [(ARUISprite *)v6 setCurrentFrameIndex:ARUIRandomNSUInt(0, v2)];
  *(float *)&double v8 = ARUIRandomFloat(0.0, 1.0);
  [(ARUISprite *)v6 setOpacity:v8];

  return v6;
}

- (double)firstFrameOrigin
{
  return *(double *)(a1 + 40);
}

- (double)frameSize
{
  return *(double *)(a1 + 48);
}

- (unint64_t)frameColumns
{
  return self->_frameColumns;
}

@end