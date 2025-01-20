@interface NTKPlumeriaFontHelper
+ (void)generateTransformFromRect:(id)a1 toRect:(SEL)a2 transformX:transformY:;
- (BOOL)setFont:(id)a3 points:(float)a4;
- (BOOL)setFontToSFRoundedNumericSemibold10Point;
- (NTKPlumeriaFontHelper)init;
- (float)getWidthOfDigitPair:(int)a3;
- (void)generateLayout:(int)a3 minute:(int)a4 layout:;
- (void)generateLayoutWithCGRect:(int)a3 minute:(int)a4 layout:(CGRect *)a5;
- (void)generateTable:(id)a3;
@end

@implementation NTKPlumeriaFontHelper

- (NTKPlumeriaFontHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPlumeriaFontHelper;
  return [(NTKPlumeriaFontHelper *)&v3 init];
}

- (BOOL)setFontToSFRoundedNumericSemibold10Point
{
  LODWORD(v2) = 10.0;
  return [(NTKPlumeriaFontHelper *)self setFont:@".SFRoundedNumeric-Semibold" points:v2];
}

- (BOOL)setFont:(id)a3 points:(float)a4
{
  v7 = (__CFString *)a3;
  if (v7 == @".SFRoundedNumeric-Semibold" && a4 == 10.0)
  {
    fontName = self->_fontName;
    self->_fontName = (NSString *)@".SFRoundedNumeric-Semibold";

    *(void *)&self->_points = 0x40E177FF41200000;
    memcpy(self->_pairs, &unk_115C0, sizeof(self->_pairs));
  }
  else
  {
    p_fontName = &self->_fontName;
    objc_storeStrong((id *)&self->_fontName, a3);
    self->_points = a4;
    self->_capHeight = 0.0;
    double v10 = a4;
    v11 = CTFontCreateWithNameAndOptions(v7, v10, 0, 0x400uLL);
    v12 = v11;
    if (!v11)
    {
      v12 = +[UIFont systemFontOfSize:v10];
      uint64_t v13 = [v12 fontName];
      v14 = *p_fontName;
      *p_fontName = (NSString *)v13;
    }
    [v12 capHeight];
    uint64_t v15 = 0;
    *(float *)&double v16 = v16;
    self->_capHeight = *(float *)&v16;
    p_leftAdvance = (float32x4_t *)&self->_pairs[0].leftAdvance;
    do
    {
      v18 = +[NSString stringWithFormat:@"%d%d", v15 / 0xAu, v15 % 0xAu];
      v19 = +[NSDictionary dictionaryWithObject:v12 forKey:NSFontAttributeName];
      v20 = CTLineCreateWithAttributedString((CFAttributedStringRef)[objc_alloc((Class)NSAttributedString) initWithString:v18 attributes:v19]);
      CFArrayRef GlyphRuns = CTLineGetGlyphRuns(v20);
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, 0);
      v36.location = 0;
      v36.length = 2;
      CTRunGetGlyphs(ValueAtIndex, v36, buffer);
      CTFontGetBoundingRectsForGlyphs(v11, kCTFontOrientationHorizontal, buffer, &boundingRects, 2);
      v37.location = 0;
      v37.length = 2;
      CTRunGetPositions(ValueAtIndex, v37, &v31);
      v38.location = 0;
      v38.length = 2;
      CTRunGetAdvances(ValueAtIndex, v38, &v29);
      CFRelease(v20);
      CGSize size = boundingRects.size;
      p_leftAdvance[-4] = (float32x4_t)boundingRects.origin;
      p_leftAdvance[-3] = (float32x4_t)size;
      float64x2_t v24 = v35;
      p_leftAdvance[-2] = v34;
      p_leftAdvance[-1] = (float32x4_t)v24;
      v25.f64[0] = v29.width;
      v24.f64[0] = v31.x;
      v25.f64[1] = v30;
      v24.f64[1] = v32;
      float32x4_t *p_leftAdvance = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v24);
      p_leftAdvance += 5;

      ++v15;
    }
    while (v15 != 100);
    CFRelease(v11);
  }
  return 1;
}

- (float)getWidthOfDigitPair:(int)a3
{
  return self->_pairs[a3].leftAdvance + self->_pairs[a3].rightAdvance;
}

- (void)generateLayoutWithCGRect:(int)a3 minute:(int)a4 layout:(CGRect *)a5
{
  if (a5)
  {
    uint64_t v6 = *(void *)&a4;
    -[NTKPlumeriaFontHelper getWidthOfDigitPair:](self, "getWidthOfDigitPair:");
    v9 = &self->_pairs[a3];
    double y = v9->leftRect.origin.y;
    double v11 = v9->rightRect.origin.y;
    CGSize size = v9->rightRect.size;
    CGSize v29 = v9->leftRect.size;
    float v13 = v12 * -0.5;
    CGFloat v14 = v9->leftRect.origin.x + v13;
    CGFloat v15 = v9->rightRect.origin.x + (float)(v13 + v9->leftAdvance);
    [(NTKPlumeriaFontHelper *)self getWidthOfDigitPair:v6];
    double v16 = &self->_pairs[(int)v6];
    CGSize v26 = v16->rightRect.size;
    CGSize v27 = v16->leftRect.size;
    float v18 = v17 * -0.5;
    CGFloat v19 = v16->leftRect.origin.x + v18;
    CGFloat v20 = v16->rightRect.origin.x + (float)(v18 + v16->leftAdvance);
    float capHeight = self->_capHeight;
    double v22 = (float)(capHeight * 0.066667);
    double v23 = (float)((float)-(float)(capHeight * 0.066667) - capHeight);
    CGFloat v24 = v16->leftRect.origin.y + v23;
    CGFloat v25 = v16->rightRect.origin.y + v23;
    a5->origin.x = v14;
    a5->origin.double y = y + v22;
    a5->CGSize size = v29;
    a5[1].origin.x = v15;
    a5[1].origin.double y = v11 + v22;
    a5[1].CGSize size = size;
    a5[2].origin.x = v19;
    a5[2].origin.double y = v24;
    a5[2].CGSize size = v27;
    a5[3].origin.x = v20;
    a5[3].origin.double y = v25;
    a5[3].CGSize size = v26;
  }
}

- (void)generateLayout:(int)a3 minute:(int)a4 layout:
{
  v5 = v4;
  [(NTKPlumeriaFontHelper *)self generateLayoutWithCGRect:*(void *)&a3 minute:*(void *)&a4 layout:v7];
  for (uint64_t i = 0; i != 128; i += 32)
    *v5++ = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v7[i]), vaddq_f64(*(float64x2_t *)&v7[i], *(float64x2_t *)&v7[i + 16]));
}

+ (void)generateTransformFromRect:(id)a1 toRect:(SEL)a2 transformX:transformY:
{
  int32x4_t v6 = vzip1q_s32((int32x4_t)v4, (int32x4_t)vdivq_f32(vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), v5), vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), v4)));
  v6.i32[2] = v5.i32[0];
  *double v2 = v6;
  *(float *)v6.i32 = v4.f32[3] - v4.f32[1];
  int32x4_t v7 = vdupq_lane_s32(*(int32x2_t *)v4.f32, 1);
  *(float *)&v7.i32[1] = COERCE_FLOAT(vsubq_f32((float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&v5, 3), v5).i32[1])
                       / *(float *)v6.i32;
  v7.i32[2] = v5.i32[1];
  *objc_super v3 = v7;
}

- (void)generateTable:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  [v4 appendString:@"// ---------- BEGIN GENERATED CODE ----------\n"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"static NSString *_savedFontName = @\"%s\";\n",
  float32x4_t v5 = [(NSString *)self->_fontName cStringUsingEncoding:1]);
  [v4 appendString:v5];

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"static float _savedPoints = %f;\n",
  int32x4_t v6 = self->_points);
  [v4 appendString:v6];

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"static float _savedCapHeight = %f;\n",
  int32x4_t v7 = self->_capHeight);
  [v4 appendString:v7];

  [v4 appendString:@"static NTKPlumeriaFontDigitPairInfoFlat _savedPairs[] = {\n"];
  [v4 appendString:@"    // leftRect, rightRect, leftAdvance, rightAdvance, leftX, rightX\n"];
  uint64_t v8 = 0;
  p_rightRect = &self->_pairs[0].rightRect;
  do
  {
    if (v8 == 99) {
      uint64_t v10 = 32;
    }
    else {
      uint64_t v10 = 44;
    }
    double v11 = +[NSString stringWithFormat:@"    { %f,%f,%f,%f,  %f,%f,%f,%f,  %f, %f, %f, %f }%c // Index: %d, Pair: %c, %c\n", *(_OWORD *)&p_rightRect[-1].origin, *(_OWORD *)&p_rightRect[-1].size, *(_OWORD *)&p_rightRect->origin, *(void *)&p_rightRect->size.width, *(void *)&p_rightRect->size.height, *(float *)&p_rightRect[1].origin.x, *((float *)&p_rightRect[1].origin.x + 1), *(float *)&p_rightRect[1].origin.y, *((float *)&p_rightRect[1].origin.y + 1), v10, v8, v8 / 0xAu + 48, (v8 % 0xAu) | 0x30];
    [v4 appendString:v11];

    ++v8;
    p_rightRect = (CGRect *)((char *)p_rightRect + 80);
  }
  while (v8 != 100);
  [v4 appendString:@"};\n"];
  [v4 appendString:@"// ---------- END GENERATED CODE ----------\n"];
  float v12 = +[NSFileManager defaultManager];
  [v12 createFileAtPath:v13 contents:0 attributes:0];

  [v4 writeToFile:v13 atomically:1 encoding:4 error:0];
}

- (void).cxx_destruct
{
}

@end