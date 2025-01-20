@interface AVMutableCaption
- (AVCaptionAnimation)animation;
- (AVCaptionTextAlignment)textAlignment;
- (CMTimeRange)timeRange;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeBackgroundColorInRange:(NSRange)range;
- (void)removeDecorationInRange:(NSRange)range;
- (void)removeFontStyleInRange:(NSRange)range;
- (void)removeFontWeightInRange:(NSRange)range;
- (void)removeRuby:(_NSRange)a3;
- (void)removeTextColorInRange:(NSRange)range;
- (void)removeTextCombineInRange:(NSRange)range;
- (void)setBackgroundColor:(CGColorRef)color inRange:(NSRange)range;
- (void)setDecoration:(AVCaptionDecoration)decoration inRange:(NSRange)range;
- (void)setFontStyle:(AVCaptionFontStyle)fontStyle inRange:(NSRange)range;
- (void)setFontWeight:(AVCaptionFontWeight)fontWeight inRange:(NSRange)range;
- (void)setRegion:(AVCaptionRegion *)region;
- (void)setRuby:(AVCaptionRuby *)ruby inRange:(NSRange)range;
- (void)setText:(NSString *)text;
- (void)setTextColor:(CGColorRef)color inRange:(NSRange)range;
- (void)setTextCombine:(AVCaptionTextCombine)textCombine inRange:(NSRange)range;
- (void)setTimeRange:(CMTimeRange *)timeRange;
@end

@implementation AVMutableCaption

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVCaption alloc];
  v5 = [(AVCaption *)self _figCaptionData];
  if (self) {
    [(AVMutableCaption *)self timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  return [(AVCaption *)v4 initWithFigCaptionData:v5 timeRange:v7];
}

- (NSString)text
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return [(AVCaption *)&v3 text];
}

- (CMTimeRange)timeRange
{
  v4.receiver = self;
  v4.super_class = (Class)AVMutableCaption;
  return (CMTimeRange *)[(CMTimeRange *)&v4 timeRange];
}

- (void)setText:(NSString *)text
{
  if (!text)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)"text != nil"), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  -[AVCaption _setText:](self, "_setText:");
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  if ((timeRange->start.flags & 0x1D) != 1)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = "CMTIME_IS_NUMERIC(timeRange.start)";
    goto LABEL_6;
  }
  if ((timeRange->duration.flags & 0x1D) != 1)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = "CMTIME_IS_NUMERIC(timeRange.duration)";
LABEL_6:
    v12 = (void *)[v9 exceptionWithName:v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)v11), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  long long v8 = *(_OWORD *)&timeRange->start.epoch;
  v13[0] = *(_OWORD *)&timeRange->start.value;
  v13[1] = v8;
  v13[2] = *(_OWORD *)&timeRange->duration.timescale;
  [(AVCaption *)self _setTimeRange:v13];
}

- (void)setRegion:(AVCaptionRegion *)region
{
  if (region)
  {
    uint64_t v6 = [(AVCaptionRegion *)region position];
    uint64_t v7 = [(AVCaptionRegion *)region height];
    AVCaptionRegionScroll v8 = [(AVCaptionRegion *)region scroll];
    if (v7)
    {
      AVCaptionRegionScroll v9 = v8;
      if (![(AVCaptionLength *)v7 numberOfCells])
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "[height numberOfCells] != 0";
        goto LABEL_21;
      }
      if ([(AVCaptionLength *)v7 numberOfCells] != 1 && v9 != AVCaptionRegionScrollRollUp)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "scroll == AVCaptionRegionScrollRollUp";
        goto LABEL_21;
      }
    }
    if (v6 && ![(AVCaptionPosition *)v6 unitType])
    {
      if ([(AVCaptionPosition *)v6 cellX] <= 0)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "[position cellX] >= 1";
      }
      else if ([(AVCaptionPosition *)v6 cellX] >= 33)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "[position cellX] <= 32";
      }
      else if ([(AVCaptionPosition *)v6 cellY] <= 0)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "[position cellY] >= 1";
      }
      else
      {
        if ([(AVCaptionPosition *)v6 cellY] < 16) {
          goto LABEL_12;
        }
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = "[position cellY] <= 15";
      }
LABEL_21:
      v18 = (void *)[v15 exceptionWithName:v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)v17), 0 reason userInfo];
      objc_exception_throw(v18);
    }
  }
LABEL_12:
  [(AVCaption *)self _setRegion:region];
}

- (void)setTextColor:(CGColorRef)color inRange:(NSRange)range
{
  if (!color)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"color != NULL"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setTextColor:inRange:](self, "_setTextColor:inRange:");
}

- (void)setBackgroundColor:(CGColorRef)color inRange:(NSRange)range
{
  if (!color)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"color != NULL"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setBackgroundColor:inRange:](self, "_setBackgroundColor:inRange:");
}

- (void)setFontWeight:(AVCaptionFontWeight)fontWeight inRange:(NSRange)range
{
  if ((unint64_t)(fontWeight - 1) >= 2)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"fontWeight == AVCaptionFontWeightNormal || fontWeight == AVCaptionFontWeightBold"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setFontWeight:inRange:](self, "_setFontWeight:inRange:");
}

- (void)setFontStyle:(AVCaptionFontStyle)fontStyle inRange:(NSRange)range
{
  if ((unint64_t)(fontStyle - 1) >= 2)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"fontStyle == AVCaptionFontStyleNormal || fontStyle == AVCaptionFontStyleItalic"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setFontStyle:inRange:](self, "_setFontStyle:inRange:");
}

- (void)setDecoration:(AVCaptionDecoration)decoration inRange:(NSRange)range
{
  if (decoration >= 8)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"(decoration & ~( AVCaptionDecorationNone | AVCaptionDecorationUnderline | AVCaptionDecorationLineThrough | AVCaptionDecorationOverline)) == 0"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setDecoration:inRange:](self, "_setDecoration:inRange:");
}

- (void)setTextCombine:(AVCaptionTextCombine)textCombine inRange:(NSRange)range
{
  if ((unint64_t)(textCombine + 1) >= 6)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"textCombine == AVCaptionTextCombineNone || textCombine == AVCaptionTextCombineAll || textCombine == AVCaptionTextCombineOneDigit || textCombine == AVCaptionTextCombineTwoDigits || textCombine == AVCaptionTextCombineThreeDigits|| textCombine == AVCaptionTextCombineFourDigits"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setTextCombine:inRange:](self, "_setTextCombine:inRange:");
}

- (void)setRuby:(AVCaptionRuby *)ruby inRange:(NSRange)range
{
  if (!ruby)
  {
    AVCaptionRegionScroll v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", range.location, range.length, v4, v5, v6, (uint64_t)"ruby != nil"), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  -[AVCaption _setRuby:inRange:](self, "_setRuby:inRange:");
}

- (void)removeTextColorInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setTextColor:inRange:](self, "_setTextColor:inRange:", 0, range.location, range.length);
  }
}

- (void)removeBackgroundColorInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setBackgroundColor:inRange:](self, "_setBackgroundColor:inRange:", 0, range.location, range.length);
  }
}

- (void)removeFontWeightInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setFontWeight:inRange:](self, "_setFontWeight:inRange:", 0, range.location, range.length);
  }
}

- (void)removeFontStyleInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setFontStyle:inRange:](self, "_setFontStyle:inRange:", 0, range.location, range.length);
  }
}

- (void)removeDecorationInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setDecoration:inRange:](self, "_setDecoration:inRange:", 0, range.location, range.length);
  }
}

- (void)removeTextCombineInRange:(NSRange)range
{
  if (range.length) {
    -[AVCaption _setTextCombine:inRange:](self, "_setTextCombine:inRange:", 0, range.location, range.length);
  }
}

- (void)removeRuby:(_NSRange)a3
{
  if (a3.length) {
    -[AVCaption _setRuby:inRange:](self, "_setRuby:inRange:", 0, a3.location, a3.length);
  }
}

- (AVCaptionAnimation)animation
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return [(AVCaption *)&v3 animation];
}

- (AVCaptionTextAlignment)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableCaption;
  return [(AVCaption *)&v3 textAlignment];
}

@end