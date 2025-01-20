@interface AVCaption
+ (BOOL)supportsSecureCoding;
+ (id)captionFromFigCaption:(OpaqueFigCaption *)a3;
+ (void)_appendFigStyleKey:(__CFString *)a3 value:(void *)a4 range:(id)a5 toArray:(id)a6;
- (AVCaption)init;
- (AVCaption)initWithCoder:(id)a3;
- (AVCaption)initWithFigCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4;
- (AVCaption)initWithFigMutableCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4;
- (AVCaption)initWithText:(NSString *)text timeRange:(CMTimeRange *)timeRange;
- (AVCaptionAnimation)animation;
- (AVCaptionDecoration)decorationAtIndex:(NSInteger)index range:(NSRange *)outRange;
- (AVCaptionFontStyle)fontStyleAtIndex:(NSInteger)index range:(NSRange *)outRange;
- (AVCaptionFontWeight)fontWeightAtIndex:(NSInteger)index range:(NSRange *)outRange;
- (AVCaptionRegion)region;
- (AVCaptionTextAlignment)textAlignment;
- (AVCaptionTextCombine)textCombineAtIndex:(NSInteger)index range:(NSRange *)outRange;
- (CGColor)copyBackgroundColorAtIndex:(int64_t)a3 range:(_NSRange *)a4;
- (CGColor)copyTextColorAtIndex:(int64_t)a3 range:(_NSRange *)a4;
- (CMTimeRange)timeRange;
- (NSString)text;
- (OpaqueFigCaptionData)_figCaptionData;
- (id)_stylePropertiesForArchive;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)rubyTextAtIndex:(int64_t)a3 range:(_NSRange *)a4;
- (void)_setAnimation:(int64_t)a3;
- (void)_setBackgroundColor:(CGColor *)a3 inRange:(_NSRange)a4;
- (void)_setDecoration:(unint64_t)a3 inRange:(_NSRange)a4;
- (void)_setFontStyle:(int64_t)a3 inRange:(_NSRange)a4;
- (void)_setFontWeight:(int64_t)a3 inRange:(_NSRange)a4;
- (void)_setRegion:(id)a3;
- (void)_setRuby:(id)a3 inRange:(_NSRange)a4;
- (void)_setStylePropertiesForArchive:(id)a3;
- (void)_setText:(id)a3;
- (void)_setTextAlignment:(int64_t)a3;
- (void)_setTextColor:(CGColor *)a3 inRange:(_NSRange)a4;
- (void)_setTextCombine:(int64_t)a3 inRange:(_NSRange)a4;
- (void)_setTimeRange:(id *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCaption

+ (id)captionFromFigCaption:(OpaqueFigCaption *)a3
{
  void (*v7)(long long *__return_ptr, OpaqueFigCaption *);
  long long v8;
  uint64_t CMBaseObject;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, void, void, CFTypeRef *);
  id v13;
  void *v14;
  _OWORD v16[3];
  CFTypeRef cf;
  CFTypeRef v18;
  long long v19;
  long long v20;
  long long v21;

  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(void (**)(long long *__return_ptr, OpaqueFigCaption *))(v6 + 8);
  if (v7)
  {
    v7(&v19, a3);
  }
  else
  {
    v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v19 = *MEMORY[0x1E4F1FA20];
    v20 = v8;
    v21 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  }
  cf = 0;
  v18 = 0;
  CMBaseObject = FigCaptionGetCMBaseObject();
  v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  v12 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v11 + 48);
  if (!v12
    || v12(CMBaseObject, *MEMORY[0x1E4F32850], *MEMORY[0x1E4F1CF80], &v18)
    || FigCaptionDataCreateMutableCopy())
  {
    v14 = 0;
  }
  else
  {
    v13 = objc_alloc((Class)a1);
    v16[0] = v19;
    v16[1] = v20;
    v16[2] = v21;
    v14 = (void *)[v13 initWithFigMutableCaptionData:cf timeRange:v16];
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v18) {
    CFRelease(v18);
  }
  return v14;
}

- (AVCaption)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(sel_initWithText_timeRange_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVCaption)initWithFigMutableCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4
{
  if (!a3)
  {
    v12 = (objc_class *)self;
    v13 = a2;
    v23 = self;
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = "figCaptionData != NULL";
LABEL_11:
    v24 = (void *)[v20 exceptionWithName:v21, AVMethodExceptionReasonWithObjectAndSelector(v12, v13, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)v22), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  if ((a4->var0.var2 & 0x1D) != 1 || (a4->var1.var2 & 0x1D) != 1)
  {
    v12 = (objc_class *)self;
    v13 = a2;
    v14 = self;
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = "isValidCaptionTimeRange(timeRange)";
    goto LABEL_11;
  }
  v25.receiver = self;
  v25.super_class = (Class)AVCaption;
  uint64_t v6 = [(AVCaption *)&v25 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptionInternal);
    v6->_internal = v7;
    if (v7)
    {
      CFRetain(v7);
      internal = v6->_internal;
      long long v9 = *(_OWORD *)&a4->var0.var0;
      long long v10 = *(_OWORD *)&a4->var1.var1;
      *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&internal->timeRange.duration.timescale = v10;
      *(_OWORD *)&internal->timeRange.start.value = v9;
      v6->_internal->figCaptionData = (OpaqueFigCaptionData *)CFRetain(a3);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaption)initWithFigCaptionData:(OpaqueFigCaptionData *)a3 timeRange:(id *)a4
{
  v4 = (objc_class *)self;
  if ((a4->var0.var2 & 0x1D) != 1 || (a4->var1.var2 & 0x1D) != 1)
  {
    long long v10 = self;
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(v4, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)"CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)"), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  CFTypeRef v18 = 0;
  if (FigCaptionDataCreateMutableCopy())
  {

    v4 = 0;
  }
  long long v6 = *(_OWORD *)&a4->var0.var3;
  v17[0] = *(_OWORD *)&a4->var0.var0;
  v17[1] = v6;
  v17[2] = *(_OWORD *)&a4->var1.var1;
  uint64_t v7 = [(objc_class *)v4 initWithFigMutableCaptionData:v18 timeRange:v17];
  if (v18) {
    CFRelease(v18);
  }
  return v7;
}

- (AVCaption)initWithText:(NSString *)text timeRange:(CMTimeRange *)timeRange
{
  v4 = (objc_class *)self;
  if (!text)
  {
    uint64_t v13 = a2;
    v23 = self;
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = "text != nil";
LABEL_17:
    v24 = (void *)[v20 exceptionWithName:v21, AVMethodExceptionReasonWithObjectAndSelector(v4, v13, @"invalid parameter not satisfying: %s", v15, v16, v17, v18, v19, (uint64_t)v22), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  if ((timeRange->start.flags & 0x1D) != 1 || (timeRange->duration.flags & 0x1D) != 1)
  {
    uint64_t v13 = a2;
    uint64_t v14 = self;
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = "CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)";
    goto LABEL_17;
  }
  CFTypeRef v26 = 0;
  if (FigCaptionDataCreateMutable())
  {

    v4 = 0;
  }
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = *(unsigned int (**)(CFTypeRef, NSString *))(v8 + 16);
  if (!v9 || v9(v26, text))
  {

    v4 = 0;
  }
  long long v10 = *(_OWORD *)&timeRange->start.epoch;
  v25[0] = *(_OWORD *)&timeRange->start.value;
  v25[1] = v10;
  v25[2] = *(_OWORD *)&timeRange->duration.timescale;
  uint64_t v11 = [(objc_class *)v4 initWithFigMutableCaptionData:v26 timeRange:v25];
  if (v26) {
    CFRelease(v26);
  }
  return v11;
}

- (AVCaption)initWithCoder:(id)a3
{
  CFTypeRef v18 = 0;
  if (FigCaptionDataCreateMutable()) {
    goto LABEL_2;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (!a3) {
    goto LABEL_2;
  }
  [a3 decodeCMTimeRangeForKey:@"AVCaptionArchiveKeyTimeRange"];
  if ((BYTE12(v15) & 0x1D) != 1 || (BYTE4(v17) & 0x1D) != 1) {
    goto LABEL_2;
  }
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  self = [(AVCaption *)self initWithFigMutableCaptionData:v18 timeRange:v14];
  if (!self) {
    goto LABEL_3;
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionArchiveKeyText"];
  if (!v6)
  {
LABEL_2:

    self = 0;
    goto LABEL_3;
  }
  [(AVCaption *)self _setText:v6];
  -[AVCaption _setAnimation:](self, "_setAnimation:", [a3 decodeIntegerForKey:@"AVCaptionArchiveKeyAnimation"]);
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionArchiveKeyRegion"];
  if (v7) {
    [(AVCaption *)self _setRegion:v7];
  }
  if ([a3 containsValueForKey:@"AVCaptionArchiveKeyTextAlignment"]) {
    -[AVCaption _setTextAlignment:](self, "_setTextAlignment:", [a3 decodeIntegerForKey:@"AVCaptionArchiveKeyTextAlignment"]);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), @"AVCaptionArchiveKeyStyleProperties");
  if (v13) {
    [(AVCaption *)self _setStylePropertiesForArchive:v13];
  }
LABEL_3:
  if (v18) {
    CFRelease(v18);
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:2 forKey:@"AVCaptionArchiveKeyVersion"];
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption text](self, "text"), @"AVCaptionArchiveKeyText");
  if (self) {
    [(AVCaption *)self timeRange];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [a3 encodeCMTimeRange:v5 forKey:@"AVCaptionArchiveKeyTimeRange"];
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption region](self, "region"), @"AVCaptionArchiveKeyRegion");
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaption animation](self, "animation"), @"AVCaptionArchiveKeyAnimation");
  objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaption textAlignment](self, "textAlignment"), @"AVCaptionArchiveKeyTextAlignment");
  objc_msgSend(a3, "encodeObject:forKey:", -[AVCaption _stylePropertiesForArchive](self, "_stylePropertiesForArchive"), @"AVCaptionArchiveKeyStyleProperties");
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    if (internal->figCaptionData)
    {
      CFRelease(internal->figCaptionData);
      internal = self->_internal;
    }
    CFRelease(internal);
    v4 = self->_internal;
  }
  else
  {
    v4 = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCaption;
  [(AVCaption *)&v5 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [AVMutableCaption alloc];
  objc_super v5 = [(AVCaption *)self _figCaptionData];
  if (self) {
    [(AVCaption *)self timeRange];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  return [(AVCaption *)v4 initWithFigCaptionData:v5 timeRange:v7];
}

- (NSString)text
{
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(OpaqueFigCaptionData *))(v4 + 8);
  if (!v5) {
    return (NSString *)&stru_1EE5953B8;
  }
  return (NSString *)v5(figCaptionData);
}

- (AVCaptionRegion)region
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_super v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F1FF20], *MEMORY[0x1E4F1CF80], &cf);
  CFTypeRef v7 = cf;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = cf == 0;
  }
  if (v8)
  {
    uint64_t v10 = 0;
    if (!cf) {
      return v10;
    }
    goto LABEL_10;
  }
  uint64_t v9 = [AVCaptionRegion alloc];
  uint64_t v10 = [(AVCaptionRegion *)v9 initWithFigCaptionRegion:cf];
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_10:
  }
    CFRelease(v7);
  return v10;
}

- (CMTimeRange)timeRange
{
  uint64_t v3 = *(_OWORD **)&self->start.timescale;
  long long v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (OpaqueFigCaptionData)_figCaptionData
{
  return self->_internal->figCaptionData;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(AVCaption *)self timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CFStringRef v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  objc_super v5 = NSString;
  int v6 = (objc_class *)objc_opt_class();
  return (id)[v5 stringWithFormat:@"<%@: %p, timeRange = %@ text=%@>", NSStringFromClass(v6), self, v4, -[AVCaption text](self, "text")];
}

- (void)_setText:(id)a3
{
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(void (**)(OpaqueFigCaptionData *, id))(v6 + 16);
  if (v7)
  {
    v7(figCaptionData, a3);
  }
}

- (void)_setTimeRange:(id *)a3
{
  internal = self->_internal;
  long long v4 = *(_OWORD *)&a3->var0.var0;
  long long v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&internal->timeRange.duration.timescale = v5;
  *(_OWORD *)&internal->timeRange.start.value = v4;
}

- (void)_setRegion:(id)a3
{
  uint64_t v38 = 0;
  if (![a3 endPosition]) {
    goto LABEL_9;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "unitType");
  if (!v6)
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "cellX");
    uint64_t v23 = objc_msgSend((id)objc_msgSend(a3, "position"), "cellX");
    uint64_t v24 = objc_msgSend((id)objc_msgSend(a3, "endPosition"), "cellY");
    uint64_t v25 = objc_msgSend((id)objc_msgSend(a3, "position"), "cellY");
    if (v22 >= v23)
    {
      if (v24 <= v25) {
        goto LABEL_6;
      }
      goto LABEL_9;
    }
    goto LABEL_27;
  }
  if (v6 != 1)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"Unit type not valid";
LABEL_29:
    v36 = objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v21, v7, v8, v9, v10, v11, v37), 0);
    objc_exception_throw(v36);
  }
  objc_msgSend((id)objc_msgSend(a3, "endPosition"), "relativeToEnclosingRegionX");
  float v13 = v12;
  objc_msgSend((id)objc_msgSend(a3, "position"), "relativeToEnclosingRegionX");
  float v15 = v13 - v14;
  objc_msgSend((id)objc_msgSend(a3, "endPosition"), "relativeToEnclosingRegionY");
  float v17 = v16;
  objc_msgSend((id)objc_msgSend(a3, "position"), "relativeToEnclosingRegionY");
  if (v15 <= 0.0)
  {
LABEL_27:
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"region width is negative.";
    goto LABEL_29;
  }
  if ((float)(v17 - v18) <= 0.0)
  {
LABEL_6:
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = @"region height is negative.";
    goto LABEL_29;
  }
LABEL_9:
  uint64_t v26 = [a3 _figCaptionRegion];
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 0;
  }
  v30 = *(void (**)(uint64_t, void, uint64_t))(v29 + 56);
  if (v30) {
    v30(CMBaseObject, *MEMORY[0x1E4F1FF20], v26);
  }
  uint64_t v31 = FigCaptionDataGetCMBaseObject();
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  v34 = *(void (**)(uint64_t, void, void, uint64_t *))(v33 + 48);
  if (!v34 || (v34(v31, *MEMORY[0x1E4F1FF58], *MEMORY[0x1E4F1CF80], &v38), !v38))
  {
    if (+[AVCaptionRegion appleiTTTop] == a3
      || +[AVCaptionRegion appleiTTBottom] == a3)
    {
      uint64_t v35 = 2;
      goto LABEL_25;
    }
    if (+[AVCaptionRegion appleiTTLeft] == a3
      || +[AVCaptionRegion appleiTTRight] == a3)
    {
      uint64_t v35 = 0;
LABEL_25:
      [(AVCaption *)self _setTextAlignment:v35];
    }
  }
}

- (void)_setAnimation:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      float v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"animation property must be one of the values defined in AVCaptionAnimation.", v3, v4, v5, v6, v7, v16), 0 reason userInfo];
      objc_exception_throw(v15);
    }
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1FE40];
  }
  else
  {
    uint64_t v8 = (uint64_t *)MEMORY[0x1E4F1FE48];
  }
  uint64_t v9 = *v8;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  float v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 56);
  if (v13)
  {
    uint64_t v14 = *MEMORY[0x1E4F1FEE0];
    v13(CMBaseObject, v14, v9);
  }
}

- (void)_setTextAlignment:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"textAlignment is not one of the supported value.", v3, v4, v5, v6, v7, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (!FigCaptionDynamicStyleCreate())
  {
    uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void (**)(uint64_t, void, void))(v10 + 56);
    if (v11) {
      v11(CMBaseObject, *MEMORY[0x1E4F1FF58], 0);
    }
  }
}

- (void)_setTextColor:(CGColor *)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (a3)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v13 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v9 + 32);
        if (v13) {
          v13(figCaptionData, *MEMORY[0x1E4F201C8], 0, location, length);
        }
      }
    }
    else
    {
      uint64_t v10 = self->_internal->figCaptionData;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v14 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v12 + 40);
      if (v14) {
        v14(v10, *MEMORY[0x1E4F201C8], location, length);
      }
    }
  }
}

- (void)_setBackgroundColor:(CGColor *)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (a3)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v8) {
          uint64_t v9 = v8;
        }
        else {
          uint64_t v9 = 0;
        }
        uint64_t v13 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v9 + 32);
        if (v13) {
          v13(figCaptionData, *MEMORY[0x1E4F20138], 0, location, length);
        }
      }
    }
    else
    {
      uint64_t v10 = self->_internal->figCaptionData;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v14 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v12 + 40);
      if (v14) {
        v14(v10, *MEMORY[0x1E4F20138], location, length);
      }
    }
  }
}

- (void)_setFontWeight:(int64_t)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    switch(a3)
    {
      case 0:
        goto LABEL_11;
      case 1:
        uint64_t v10 = (void *)MEMORY[0x1E4F20190];
        break;
      case 2:
        uint64_t v10 = (void *)MEMORY[0x1E4F20188];
        break;
      default:
        uint64_t v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"fontWeight property must be one of the values defined in AVCaptionFontWeight.", a4.location, a4.length, v4, v5, v6, v20), 0 reason userInfo];
        objc_exception_throw(v19);
    }
    if (*v10)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        float v18 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v13 + 32);
        if (v18) {
          v18(figCaptionData, *MEMORY[0x1E4F20180], 0, location, length);
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v14 = self->_internal->figCaptionData;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      float v17 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v16 + 40);
      if (v17) {
        v17(v14, *MEMORY[0x1E4F20180], location, length);
      }
    }
  }
}

- (void)_setFontStyle:(int64_t)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    switch(a3)
    {
      case 0:
        goto LABEL_11;
      case 1:
        uint64_t v10 = (void *)MEMORY[0x1E4F20170];
        break;
      case 2:
        uint64_t v10 = (void *)MEMORY[0x1E4F20168];
        break;
      default:
        uint64_t v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"fontStyle property must be one of the values defined in AVCaptionFontStyle.", a4.location, a4.length, v4, v5, v6, v20), 0 reason userInfo];
        objc_exception_throw(v19);
    }
    if (*v10)
    {
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v12) {
          uint64_t v13 = v12;
        }
        else {
          uint64_t v13 = 0;
        }
        float v18 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v13 + 32);
        if (v18) {
          v18(figCaptionData, *MEMORY[0x1E4F20160], 0, location, length);
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v14 = self->_internal->figCaptionData;
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      float v17 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v16 + 40);
      if (v17) {
        v17(v14, *MEMORY[0x1E4F20160], location, length);
      }
    }
  }
}

- (void)_setDecoration:(unint64_t)a3 inRange:(_NSRange)a4
{
  unint64_t valuePtr = a3;
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (a3)
    {
      CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberNSIntegerType, &valuePtr);
      if (!FigCaptionDynamicStyleCreate())
      {
        figCaptionData = self->_internal->figCaptionData;
        uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v9) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v14 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v10 + 32);
        if (v14) {
          v14(figCaptionData, *MEMORY[0x1E4F20140], 0, location, length);
        }
      }
    }
    else
    {
      uint64_t v11 = self->_internal->figCaptionData;
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v15 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v13 + 40);
      if (v15) {
        v15(v11, *MEMORY[0x1E4F20140], location, length);
      }
      CFNumberRef v7 = 0;
    }
    if (v7) {
      CFRelease(v7);
    }
  }
}

- (void)_setTextCombine:(int64_t)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    switch(a3)
    {
      case -1:
      case 1:
      case 2:
      case 3:
      case 4:
        if (!FigCaptionDynamicStyleCreate())
        {
          figCaptionData = self->_internal->figCaptionData;
          uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v14) {
            uint64_t v15 = v14;
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v16 = *(void (**)(OpaqueFigCaptionData *, void, void, NSUInteger, NSUInteger))(v15 + 32);
          if (v16) {
            v16(figCaptionData, *MEMORY[0x1E4F201D0], 0, location, length);
          }
        }
        break;
      case 0:
        uint64_t v10 = self->_internal->figCaptionData;
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        float v17 = *(void (**)(OpaqueFigCaptionData *, void, NSUInteger, NSUInteger))(v12 + 40);
        if (v17) {
          v17(v10, *MEMORY[0x1E4F201D0], location, length);
        }
        break;
      default:
        float v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"textCombine is not one of the supported value.", a4.location, a4.length, v4, v5, v6, v19), 0 reason userInfo];
        objc_exception_throw(v18);
    }
  }
}

- (void)_setRuby:(id)a3 inRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (a3)
    {
      CFNumberRef v7 = (const void *)[a3 copyFigCaptionData];
      figCaptionData = self->_internal->figCaptionData;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v14 = *(void (**)(OpaqueFigCaptionData *, void, const void *, NSUInteger, NSUInteger))(v10 + 32);
      if (v14) {
        v14(figCaptionData, *MEMORY[0x1E4F201C0], v7, location, length);
      }
      if (v7)
      {
        CFRelease(v7);
      }
    }
    else
    {
      uint64_t v11 = self->_internal->figCaptionData;
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v15 = *(void (**)(OpaqueFigCaptionData *, uint64_t, NSUInteger, NSUInteger))(v13 + 40);
      if (v15)
      {
        uint64_t v16 = *MEMORY[0x1E4F201C0];
        v15(v11, v16, location, length);
      }
    }
  }
}

- (void)_setStylePropertiesForArchive:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v4) {
    goto LABEL_52;
  }
  uint64_t v5 = v4;
  uint64_t v36 = 0;
  uint64_t v6 = *(void *)v38;
  uint64_t v28 = *MEMORY[0x1E4F201C0];
  uint64_t v29 = *MEMORY[0x1E4F201D0];
  uint64_t v30 = *MEMORY[0x1E4F20140];
  uint64_t v31 = *MEMORY[0x1E4F20160];
  uint64_t v27 = *MEMORY[0x1E4F20168];
  uint64_t v33 = *MEMORY[0x1E4F20138];
  uint64_t v34 = *MEMORY[0x1E4F201C8];
  uint64_t v35 = *MEMORY[0x1E4F20180];
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v38 != v6) {
        objc_enumerationMutation(a3);
      }
      uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 objectForKeyedSubscript:@"AVCaptionArchiveKeyStylePropertyName"];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = (NSString *)[v8 objectForKeyedSubscript:@"AVCaptionArchiveKeyStylePropertyRange"];
          if (v11)
          {
            NSRange v12 = NSRangeFromString(v11);
            if (v12.length)
            {
              uint64_t v13 = [v8 objectForKeyedSubscript:@"AVCaptionArchiveKeyStylePropertyValue"];
              if (v13)
              {
                uint64_t v14 = (void *)v13;
                if (cf)
                {
                  CFRelease(cf);
                  CFTypeRef cf = 0;
                }
                if (objc_msgSend(v10, "isEqualToString:", @"AVCaptionArchiveKeyStylePropertyName_FontWeight", v27))
                {
                  objc_opt_class();
                  uint64_t v36 = v35;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  if (![v14 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_FontWeightNormal"])
                  {
                    uint64_t v36 = v35;
                    if (![v14 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_FontWeightBold"])goto LABEL_38; {
                  }
                    }
                  FigCaptionDynamicStyleCreate();
                  uint64_t v17 = v35;
                }
                else if ([v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_TextColor"])
                {
                  objc_opt_class();
                  uint64_t v36 = v34;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  uint64_t CGColorSRGBFromArray = FigCreateCGColorSRGBFromArray();
                  uint64_t v36 = v34;
                  if (!CGColorSRGBFromArray) {
                    goto LABEL_38;
                  }
                  uint64_t v16 = (CGColor *)CGColorSRGBFromArray;
                  FigCaptionDynamicStyleCreate();
                  CGColorRelease(v16);
                  uint64_t v17 = v34;
                }
                else if ([v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_BackgroundColor"])
                {
                  objc_opt_class();
                  uint64_t v36 = v33;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  uint64_t v18 = FigCreateCGColorSRGBFromArray();
                  uint64_t v36 = v33;
                  if (!v18) {
                    goto LABEL_38;
                  }
                  uint64_t v19 = (CGColor *)v18;
                  FigCaptionDynamicStyleCreate();
                  CGColorRelease(v19);
                  uint64_t v17 = v33;
                }
                else if ([v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_FontStyle"])
                {
                  objc_opt_class();
                  uint64_t v36 = v31;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  if (![v14 isEqualToString:@"AVCaptionArchiveStylePropertyValue_FontStyleNormal"])
                  {
                    uint64_t v36 = v31;
                    if (![v14 isEqualToString:@"AVCaptionArchiveStylePropertyValue_FontStyleItalic"])goto LABEL_38; {
                  }
                    }
                  FigCaptionDynamicStyleCreate();
                  uint64_t v17 = v31;
                }
                else if ([v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_Decoration"])
                {
                  objc_opt_class();
                  uint64_t v36 = v30;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  FigCaptionDynamicStyleCreate();
                  uint64_t v17 = v30;
                }
                else if ([v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_TextCombine"])
                {
                  objc_opt_class();
                  uint64_t v36 = v29;
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_38;
                  }
                  FigCaptionDynamicStyleCreate();
                  uint64_t v17 = v29;
                }
                else
                {
                  int v25 = [v10 isEqualToString:@"AVCaptionArchiveKeyStylePropertyName_RubyText"];
                  uint64_t v17 = v36;
                  if (v25)
                  {
                    objc_opt_class();
                    uint64_t v36 = v28;
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_38;
                    }
                    CFTypeRef cf = (CFTypeRef)[v14 copyFigCaptionData];
                    uint64_t v17 = v28;
                  }
                }
                uint64_t v36 = v17;
                if (v17)
                {
                  CFTypeRef v20 = cf;
                  if (cf)
                  {
                    figCaptionData = self->_internal->figCaptionData;
                    uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
                    uint64_t v23 = v22 ? v22 : 0;
                    uint64_t v24 = *(unsigned int (**)(OpaqueFigCaptionData *, uint64_t, CFTypeRef, NSUInteger, NSUInteger))(v23 + 32);
                    if (!v24 || v24(figCaptionData, v36, v20, v12.location, v12.length)) {
                      goto LABEL_52;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_38:
      ++v7;
    }
    while (v5 != v7);
    uint64_t v26 = [a3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    uint64_t v5 = v26;
  }
  while (v26);
LABEL_52:
  if (cf) {
    CFRelease(cf);
  }
}

+ (void)_appendFigStyleKey:(__CFString *)a3 value:(void *)a4 range:(id)a5 toArray:(id)a6
{
  NSUInteger var1 = a5.var1;
  NSUInteger var0 = a5.var0;
  _OWORD v14[3] = *MEMORY[0x1E4F143B8];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F20180]))
  {
    if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E4F20190]))
    {
      a4 = @"AVCaptionArchiveKeyStylePropertyName_FontWeightNormal";
    }
    else
    {
      if (!CFEqual(a4, (CFTypeRef)*MEMORY[0x1E4F20188])) {
        return;
      }
      a4 = @"AVCaptionArchiveKeyStylePropertyName_FontWeightBold";
    }
    NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_FontWeight";
    goto LABEL_13;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F201C8]))
  {
    uint64_t v11 = (AVCaptionRuby *)FigCopyCGColorSRGBAsArray();
    NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_TextColor";
LABEL_11:
    a4 = v11;
    goto LABEL_12;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F20138]))
  {
    uint64_t v11 = (AVCaptionRuby *)FigCopyCGColorSRGBAsArray();
    NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_BackgroundColor";
    goto LABEL_11;
  }
  if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F20160]))
  {
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F20140]))
    {
      NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_Decoration";
    }
    else
    {
      if (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F201D0]))
      {
        if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F201C0]))
        {
          uint64_t v11 = [[AVCaptionRuby alloc] initWithFigCaptionData:a4];
          NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_RubyText";
          goto LABEL_11;
        }
        return;
      }
      NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_TextCombine";
    }
LABEL_12:
    if (!a4) {
      return;
    }
    goto LABEL_13;
  }
  if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E4F20170]))
  {
    a4 = @"AVCaptionArchiveStylePropertyValue_FontStyleNormal";
LABEL_22:
    NSRange v12 = @"AVCaptionArchiveKeyStylePropertyName_FontStyle";
LABEL_13:
    v15.NSUInteger location = var0;
    v15.NSUInteger length = var1;
    v13[0] = @"AVCaptionArchiveKeyStylePropertyName";
    v13[1] = @"AVCaptionArchiveKeyStylePropertyValue";
    v14[0] = v12;
    v14[1] = a4;
    v13[2] = @"AVCaptionArchiveKeyStylePropertyRange";
    v14[2] = NSStringFromRange(v15);
    objc_msgSend(a6, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    return;
  }
  if (CFEqual(a4, (CFTypeRef)*MEMORY[0x1E4F20168]))
  {
    a4 = @"AVCaptionArchiveStylePropertyValue_FontStyleItalic";
    goto LABEL_22;
  }
}

- (id)_stylePropertiesForArchive
{
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v6 + 48);
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F1CF80];
    if (!v7(CMBaseObject, *MEMORY[0x1E4F1FF48], *MEMORY[0x1E4F1CF80], &theArray))
    {
      CFIndex v9 = theArray ? CFArrayGetCount(theArray) : 0;
      figCaptionData = self->_internal->figCaptionData;
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(uint64_t (**)(OpaqueFigCaptionData *))(v12 + 8);
      CFStringRef v14 = v13 ? (const __CFString *)v13(figCaptionData) : &stru_1EE5953B8;
      CFIndex Length = CFStringGetLength(v14);
      if (v9)
      {
        CFIndex v16 = Length;
        CFIndex v17 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v17);
          if (v16) {
            break;
          }
LABEL_33:
          if (++v17 == v9) {
            goto LABEL_34;
          }
        }
        uint64_t v19 = ValueAtIndex;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v30 = 0;
          uint64_t v31 = 0;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          uint64_t v21 = self->_internal->figCaptionData;
          uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v22) {
            uint64_t v23 = v22;
          }
          else {
            uint64_t v23 = 0;
          }
          uint64_t v24 = *(unsigned int (**)(OpaqueFigCaptionData *, uint64_t, const void *, uint64_t, CFTypeRef *, uint64_t *))(v23 + 24);
          if (!v24 || v24(v21, v20, v19, v8, &cf, &v30)) {
            break;
          }
          if (cf)
          {
            CFTypeID v25 = CFGetTypeID(cf);
            if (v25 == FigCaptionDynamicStyleGetTypeID())
            {
              uint64_t InitialValue = FigCaptionDynamicStyleGetInitialValue();
              uint64_t v27 = v30;
              uint64_t v28 = v31;
LABEL_31:
              +[AVCaption _appendFigStyleKey:value:range:toArray:](AVCaption, "_appendFigStyleKey:value:range:toArray:", v19, InitialValue, v27, v28, v3, v30, v31);
              goto LABEL_32;
            }
            uint64_t InitialValue = (uint64_t)cf;
            if (cf)
            {
              uint64_t v27 = v30;
              uint64_t v28 = v31;
              goto LABEL_31;
            }
          }
LABEL_32:
          uint64_t v20 = v31 + v30;
          if (v31 + v30 == v16) {
            goto LABEL_33;
          }
        }
      }
    }
  }
LABEL_34:
  if (theArray) {
    CFRelease(theArray);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

- (CGColor)copyTextColorAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFIndex v9 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, void, void, CFTypeRef *, _NSRange *))(v8 + 24);
  if (!v9) {
    return 0;
  }
  int v10 = v9(figCaptionData, a3, *MEMORY[0x1E4F201C8], *MEMORY[0x1E4F1CF80], &cf, a4);
  CFTypeRef v11 = cf;
  if (v10)
  {
    uint64_t InitialValue = 0;
    if (!cf) {
      return InitialValue;
    }
    goto LABEL_7;
  }
  uint64_t InitialValue = (CGColor *)FigCaptionDynamicStyleGetInitialValue();
  CGColorRetain(InitialValue);
  CFTypeRef v11 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v11);
  return InitialValue;
}

- (CGColor)copyBackgroundColorAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFIndex v9 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, void, void, CFTypeRef *, _NSRange *))(v8 + 24);
  if (!v9) {
    return 0;
  }
  int v10 = v9(figCaptionData, a3, *MEMORY[0x1E4F20138], *MEMORY[0x1E4F1CF80], &cf, a4);
  CFTypeRef v11 = cf;
  if (v10)
  {
    uint64_t InitialValue = 0;
    if (!cf) {
      return InitialValue;
    }
    goto LABEL_7;
  }
  uint64_t InitialValue = (CGColor *)FigCaptionDynamicStyleGetInitialValue();
  CGColorRetain(InitialValue);
  CFTypeRef v11 = cf;
  if (cf) {
LABEL_7:
  }
    CFRelease(v11);
  return InitialValue;
}

- (AVCaptionFontWeight)fontWeightAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFIndex v9 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, void, void, CFTypeRef *, NSRange *))(v8 + 24);
  if (!v9 || v9(figCaptionData, index, *MEMORY[0x1E4F20180], *MEMORY[0x1E4F1CF80], &cf, outRange))
  {
    AVCaptionFontWeight v10 = AVCaptionFontWeightUnknown;
  }
  else
  {
    FigCaptionDynamicStyleGetInitialValue();
    if (FigCFEqual()) {
      AVCaptionFontWeight v10 = AVCaptionFontWeightNormal;
    }
    else {
      AVCaptionFontWeight v10 = 2 * (FigCFEqual() != 0);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v10;
}

- (AVCaptionFontStyle)fontStyleAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFIndex v9 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, void, void, CFTypeRef *, NSRange *))(v8 + 24);
  if (!v9 || v9(figCaptionData, index, *MEMORY[0x1E4F20160], *MEMORY[0x1E4F1CF80], &cf, outRange))
  {
    AVCaptionFontStyle v10 = AVCaptionFontStyleUnknown;
  }
  else
  {
    FigCaptionDynamicStyleGetInitialValue();
    if (FigCFEqual()) {
      AVCaptionFontStyle v10 = AVCaptionFontStyleNormal;
    }
    else {
      AVCaptionFontStyle v10 = 2 * (FigCFEqual() != 0);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v10;
}

- (AVCaptionDecoration)decorationAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  AVCaptionDecoration v12 = 0;
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  CFIndex v9 = *(unsigned int (**)(OpaqueFigCaptionData *, NSInteger, void, void, CFTypeRef *, NSRange *))(v8 + 24);
  if (v9)
  {
    if (!v9(figCaptionData, index, *MEMORY[0x1E4F20140], *MEMORY[0x1E4F1CF80], &cf, outRange))
    {
      CFNumberRef InitialValue = (const __CFNumber *)FigCaptionDynamicStyleGetInitialValue();
      if (InitialValue) {
        CFNumberGetValue(InitialValue, kCFNumberNSIntegerType, &v12);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

- (AVCaptionTextCombine)textCombineAtIndex:(NSInteger)index range:(NSRange *)outRange
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  CFTypeRef v11 = *(uint64_t (**)(OpaqueFigCaptionData *, NSInteger, void, void, CFTypeRef *, NSRange *))(v10 + 24);
  if (!v11) {
    goto LABEL_10;
  }
  int v12 = v11(figCaptionData, index, *MEMORY[0x1E4F201D0], *MEMORY[0x1E4F1CF80], &cf, outRange);
  CFTypeRef v13 = cf;
  if (v12) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = cf == 0;
  }
  if (v14)
  {
    AVCaptionTextCombine v15 = AVCaptionTextCombineNone;
    if (!cf) {
      return v15;
    }
    goto LABEL_12;
  }
  FigCaptionDynamicStyleGetInitialValue();
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      AVCaptionTextCombine v15 = AVCaptionTextCombineAll;
    }
    else if (FigCFEqual())
    {
      AVCaptionTextCombine v15 = AVCaptionTextCombineOneDigit;
    }
    else if (FigCFEqual())
    {
      AVCaptionTextCombine v15 = AVCaptionTextCombineTwoDigits;
    }
    else if (FigCFEqual())
    {
      AVCaptionTextCombine v15 = AVCaptionTextCombineThreeDigits;
    }
    else
    {
      if (!FigCFEqual())
      {
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"textCombine value is unrecognizable; it is a programming error.",
                          v17,
                          v18,
                          v19,
                          v20,
                          v21,
                          v23),
                        0);
        objc_exception_throw(v22);
      }
      AVCaptionTextCombine v15 = AVCaptionTextCombineFourDigits;
    }
  }
  else
  {
LABEL_10:
    AVCaptionTextCombine v15 = AVCaptionTextCombineNone;
  }
  CFTypeRef v13 = cf;
  if (cf) {
LABEL_12:
  }
    CFRelease(v13);
  return v15;
}

- (id)rubyTextAtIndex:(int64_t)a3 range:(_NSRange *)a4
{
  CFTypeRef cf = 0;
  figCaptionData = self->_internal->figCaptionData;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(OpaqueFigCaptionData *, int64_t, void, void, CFTypeRef *, _NSRange *))(v8 + 24);
  if (!v9)
  {
    BOOL v14 = 0;
    return v14;
  }
  int v10 = v9(figCaptionData, a3, *MEMORY[0x1E4F201C0], *MEMORY[0x1E4F1CF80], &cf, a4);
  CFTypeRef v11 = cf;
  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = cf == 0;
  }
  if (v12)
  {
    BOOL v14 = 0;
    if (!cf) {
      return v14;
    }
    goto LABEL_10;
  }
  CFTypeRef v13 = [AVCaptionRuby alloc];
  BOOL v14 = [(AVCaptionRuby *)v13 initWithFigCaptionData:cf];
  CFTypeRef v11 = cf;
  if (cf) {
LABEL_10:
  }
    CFRelease(v11);
  return v14;
}

- (AVCaptionAnimation)animation
{
  CFTypeRef cf1 = 0;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F1FEE0], *MEMORY[0x1E4F1CF80], &cf1);
  CFTypeRef v7 = cf1;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = cf1 == 0;
  }
  if (v8 || (v9 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1FE48]), CFTypeRef v7 = cf1, v9))
  {
    AVCaptionAnimation v10 = AVCaptionAnimationNone;
    if (!v7) {
      return v10;
    }
    goto LABEL_14;
  }
  AVCaptionAnimation v10 = (unint64_t)(CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1FE40]) != 0);
  CFTypeRef v7 = cf1;
  if (cf1) {
LABEL_14:
  }
    CFRelease(v7);
  return v10;
}

- (AVCaptionTextAlignment)textAlignment
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionDataGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (v7
    && !v7(CMBaseObject, *MEMORY[0x1E4F1FF58], *MEMORY[0x1E4F1CF80], &cf)
    && (CFNumberRef InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue()) != 0
    && (int v9 = InitialValue, !CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F20250])))
  {
    if (CFEqual(v9, (CFTypeRef)*MEMORY[0x1E4F20238]))
    {
      AVCaptionTextAlignment v10 = AVCaptionTextAlignmentEnd;
    }
    else if (CFEqual(v9, (CFTypeRef)*MEMORY[0x1E4F20230]))
    {
      AVCaptionTextAlignment v10 = AVCaptionTextAlignmentCenter;
    }
    else if (CFEqual(v9, (CFTypeRef)*MEMORY[0x1E4F20240]))
    {
      AVCaptionTextAlignment v10 = AVCaptionTextAlignmentLeft;
    }
    else
    {
      if (!CFEqual(v9, (CFTypeRef)*MEMORY[0x1E4F20248]))
      {
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"textAlignment value is unrecognizable; it is a programming error.",
                          v12,
                          v13,
                          v14,
                          v15,
                          v16,
                          v18),
                        0);
        objc_exception_throw(v17);
      }
      AVCaptionTextAlignment v10 = AVCaptionTextAlignmentRight;
    }
  }
  else
  {
    AVCaptionTextAlignment v10 = AVCaptionTextAlignmentStart;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v10;
}

@end