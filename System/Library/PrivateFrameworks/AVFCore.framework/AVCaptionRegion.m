@interface AVCaptionRegion
+ (AVCaptionRegion)appleITTBottomRegion;
+ (AVCaptionRegion)appleITTLeftRegion;
+ (AVCaptionRegion)appleITTRightRegion;
+ (AVCaptionRegion)appleITTTopRegion;
+ (AVCaptionRegion)subRipTextBottomRegion;
+ (BOOL)supportsSecureCoding;
+ (id)appleiTTBottom;
+ (id)appleiTTLeft;
+ (id)appleiTTRight;
+ (id)appleiTTTop;
+ (id)subRipTextBottom;
- (AVCaptionLength)height;
- (AVCaptionPoint)origin;
- (AVCaptionPosition)endPosition;
- (AVCaptionPosition)position;
- (AVCaptionRegion)init;
- (AVCaptionRegion)initWithCoder:(id)a3;
- (AVCaptionRegion)initWithFigCaptionRegion:(OpaqueFigCaptionRegion *)a3;
- (AVCaptionRegion)initWithIdentifier:(id)a3;
- (AVCaptionRegionDisplayAlignment)displayAlignment;
- (AVCaptionRegionScroll)scroll;
- (AVCaptionRegionWritingMode)writingMode;
- (AVCaptionSize)size;
- (BOOL)_predefinedRegionPositionShouldBeNil;
- (BOOL)isEqual:(id)object;
- (NSString)identifier;
- (OpaqueFigCaptionRegion)_figCaptionRegion;
- (id)_endPosition;
- (id)_position;
- (id)mutableCopyWithZone:(NSZone *)zone;
- (int)_updateExtentPropertiesOfFigCaptionRegionWithPosition:(id)a3 endPosition:(id)a4;
- (int)_updateFigCaptionRegion;
- (int)_updatePositionPropertyOfFigCaptionRegionWithPosition:(id)a3;
- (unint64_t)hash;
- (void)_setDisplayAlignment:(int64_t)a3;
- (void)_setEndPosition:(id)a3;
- (void)_setHeight:(id)a3;
- (void)_setOrigin:(AVCaptionPoint *)a3;
- (void)_setPosition:(id)a3;
- (void)_setPredefinedRegionPositionShouldBeNil:(BOOL)a3;
- (void)_setScroll:(int64_t)a3;
- (void)_setSize:(AVCaptionSize *)a3;
- (void)_setWritingMode:(int64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(NSCoder *)encoder;
@end

@implementation AVCaptionRegion

- (AVCaptionRegion)init
{
  if (!FigCaptionRegionCreateMutable()) {
    return [(AVCaptionRegion *)self initWithFigCaptionRegion:0];
  }

  return 0;
}

- (AVCaptionRegion)initWithFigCaptionRegion:(OpaqueFigCaptionRegion *)a3
{
  if (!a3)
  {
    v9 = self;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"figCaptionRegion != NULL"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVCaptionRegion;
  v4 = [(AVCaptionRegion *)&v16 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVCaptionRegionInternal);
    v4->_internal = v5;
    if (v5)
    {
      v4->_internal->figCaptionRegion = (OpaqueFigCaptionRegion *)CFRetain(a3);
      v4->_internal->position = 0;
      v4->_internal->endPosition = 0;
      v4->_internal->_overridePositionShouldBeNil = 0;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (AVCaptionRegion)initWithIdentifier:(id)a3
{
  v3 = (objc_class *)self;
  if (!a3)
  {
    v32 = self;
    v38 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(v3, a2, @"invalid parameter not satisfying: %s", v33, v34, v35, v36, v37, (uint64_t)"identifier != NULL"), 0 reason userInfo];
    objc_exception_throw(v38);
  }
  if (FigCaptionRegionCreateMutable())
  {

    v3 = 0;
  }
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = *(unsigned int (**)(uint64_t, void, id))(v7 + 56);
  if (!v8 || v8(CMBaseObject, *MEMORY[0x1E4F20018], a3))
  {

    v3 = 0;
  }
  uint64_t v9 = FigCaptionRegionGetCMBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(uint64_t, void, void))(v11 + 56);
  if (!v12 || v12(v9, *MEMORY[0x1E4F1FFF8], *MEMORY[0x1E4F1CFD0]))
  {

    v3 = 0;
  }
  uint64_t v13 = [(objc_class *)v3 initWithFigCaptionRegion:0];
  if ([a3 isEqual:*MEMORY[0x1E4F20038]])
  {
    [(AVCaptionRegion *)v13 _setPosition:[[AVCaptionPosition alloc] initWithRelativeToEnclosingRegionX:0.0 andY:0.0]];
    uint64_t v14 = [AVCaptionPosition alloc];
    LODWORD(v15) = 1041865114;
    LODWORD(v16) = 1.0;
    v17 = [(AVCaptionPosition *)v14 initWithRelativeToEnclosingRegionX:v16 andY:v15];
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_25:
    [(AVCaptionRegion *)v13 _setEndPosition:v17];
    [(AVCaptionRegion *)v13 _setDisplayAlignment:v18];
    [(AVCaptionRegion *)v13 _setWritingMode:v19];
    [(AVCaptionRegion *)v13 _setScroll:1];
    return v13;
  }
  if ([a3 isEqual:*MEMORY[0x1E4F20020]])
  {
    v20 = [AVCaptionPosition alloc];
    LODWORD(v21) = 1062836634;
    [(AVCaptionRegion *)v13 _setPosition:[(AVCaptionPosition *)v20 initWithRelativeToEnclosingRegionX:0.0 andY:v21]];
    v22 = [AVCaptionPosition alloc];
    LODWORD(v23) = 1.0;
    LODWORD(v24) = 1.0;
    v17 = [(AVCaptionPosition *)v22 initWithRelativeToEnclosingRegionX:v23 andY:v24];
    uint64_t v19 = 0;
    uint64_t v18 = 2;
    goto LABEL_25;
  }
  if ([a3 isEqual:*MEMORY[0x1E4F20028]])
  {
    [(AVCaptionRegion *)v13 _setPosition:[[AVCaptionPosition alloc] initWithRelativeToEnclosingRegionX:0.0 andY:0.0]];
    v25 = [AVCaptionPosition alloc];
    LODWORD(v27) = 1041865114;
LABEL_24:
    LODWORD(v26) = 1.0;
    v17 = [(AVCaptionPosition *)v25 initWithRelativeToEnclosingRegionX:v27 andY:v26];
    uint64_t v18 = 0;
    uint64_t v19 = 2;
    goto LABEL_25;
  }
  if ([a3 isEqual:*MEMORY[0x1E4F20030]])
  {
    v28 = [AVCaptionPosition alloc];
    LODWORD(v29) = 1062836634;
    [(AVCaptionRegion *)v13 _setPosition:[(AVCaptionPosition *)v28 initWithRelativeToEnclosingRegionX:v29 andY:0.0]];
    v25 = [AVCaptionPosition alloc];
    LODWORD(v27) = 1.0;
    goto LABEL_24;
  }
  return v13;
}

- (AVCaptionRegion)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionRegionArchiveKeyIdentifier"];
  if (v5) {
    return [(AVCaptionRegion *)self initWithIdentifier:v5];
  }
  if (FigCaptionRegionCreateMutable())
  {

    return 0;
  }
  else
  {
    uint64_t v6 = [(AVCaptionRegion *)self initWithFigCaptionRegion:0];
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionRegionArchiveKeyPosition"];
    if (v7) {
      [(AVCaptionRegion *)v6 _setPosition:v7];
    }
    uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionRegionArchiveKeyEndPosition"];
    if (v8) {
      [(AVCaptionRegion *)v6 _setEndPosition:v8];
    }
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVCaptionRegionArchiveKeyHeight"];
    if (v9) {
      [(AVCaptionRegion *)v6 _setHeight:v9];
    }
    -[AVCaptionRegion _setScroll:](v6, "_setScroll:", [a3 decodeIntegerForKey:@"AVCaptionRegionArchiveKeyScroll"]);
    -[AVCaptionRegion _setDisplayAlignment:](v6, "_setDisplayAlignment:", [a3 decodeIntegerForKey:@"AVCaptionRegionArchiveKeyDisplayAlignment"]);
    -[AVCaptionRegion _setWritingMode:](v6, "_setWritingMode:", [a3 decodeIntegerForKey:@"AVCaptionRegionArchiveKeyWritingMode"]);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
  CFTypeRef cf = 0;
  [(AVCaptionRegion *)self _figCaptionRegion];
  [(NSCoder *)encoder encodeInteger:2 forKey:@"AVCaptionRegionArchiveKeyVersion"];
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v7 + 48);
  if (v8 && (v8(CMBaseObject, *MEMORY[0x1E4F20018], *MEMORY[0x1E4F1CF80], &cf), cf))
  {
    [(NSCoder *)encoder encodeObject:cf forKey:@"AVCaptionRegionArchiveKeyIdentifier"];
  }
  else
  {
    id v9 = [(AVCaptionRegion *)self _position];
    if (v9) {
      [(NSCoder *)encoder encodeObject:v9 forKey:@"AVCaptionRegionArchiveKeyPosition"];
    }
    uint64_t v10 = [(AVCaptionRegion *)self height];
    if (v10) {
      [(NSCoder *)encoder encodeObject:v10 forKey:@"AVCaptionRegionArchiveKeyHeight"];
    }
    [(NSCoder *)encoder encodeInteger:[(AVCaptionRegion *)self scroll] forKey:@"AVCaptionRegionArchiveKeyScroll"];
    [(NSCoder *)encoder encodeInteger:[(AVCaptionRegion *)self displayAlignment] forKey:@"AVCaptionRegionArchiveKeyDisplayAlignment"];
    [(NSCoder *)encoder encodeInteger:[(AVCaptionRegion *)self writingMode] forKey:@"AVCaptionRegionArchiveKeyWritingMode"];
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    figCaptionRegion = internal->figCaptionRegion;
    if (figCaptionRegion)
    {
      CFRelease(figCaptionRegion);
      internal = self->_internal;
    }

    internal = self->_internal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCaptionRegion;
  [(AVCaptionRegion *)&v5 dealloc];
}

- (BOOL)isEqual:(id)object
{
  if (self == object) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [(AVCaptionRegion *)self _figCaptionRegion];
  [object _figCaptionRegion];
  return FigCFEqual() != 0;
}

- (unint64_t)hash
{
  return 0;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
  CFTypeRef cf = 0;
  CFTypeRef v20 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1CF80];
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(void (**)(uint64_t, void, uint64_t, CFTypeRef *))(v8 + 48);
  if (v9)
  {
    v9(CMBaseObject, *MEMORY[0x1E4F20018], v5, &cf);
    if (cf)
    {
      uint64_t v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Regions with identifier don't support mutable copy operation", v10, v11, v12, v13, v14, (uint64_t)cf), 0 reason userInfo];
      objc_exception_throw(v18);
    }
  }
  if (FigCaptionRegionCreateMutableCopy())
  {
    double v16 = 0;
  }
  else
  {
    double v15 = [AVMutableCaptionRegion alloc];
    double v16 = [(AVMutableCaptionRegion *)v15 initWithFigMutableCaptionRegion:v20];
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {
    CFRelease(v20);
  }
  return v16;
}

- (NSString)identifier
{
  uint64_t v8 = 0;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void (**)(uint64_t, void, void, void **))(v4 + 48);
  if (v5)
  {
    v5(CMBaseObject, *MEMORY[0x1E4F20018], *MEMORY[0x1E4F1CF80], &v8);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (void)_setPredefinedRegionPositionShouldBeNil:(BOOL)a3
{
  self->_internal->_overridePositionShouldBeNil = a3;
}

- (BOOL)_predefinedRegionPositionShouldBeNil
{
  if (!self->_internal->_overridePositionShouldBeNil) {
    return 0;
  }
  v2 = [(AVCaptionRegion *)self identifier];
  if (([(NSString *)v2 isEqual:*MEMORY[0x1E4F20038]] & 1) != 0
    || ([(NSString *)v2 isEqual:*MEMORY[0x1E4F20020]] & 1) != 0
    || ([(NSString *)v2 isEqual:*MEMORY[0x1E4F20028]] & 1) != 0
    || ([(NSString *)v2 isEqual:*MEMORY[0x1E4F20030]] & 1) != 0)
  {
    return 1;
  }
  uint64_t v4 = *MEMORY[0x1E4F20040];
  return [(NSString *)v2 isEqual:v4];
}

- (id)_position
{
  CFTypeRef cf = 0;
  position = self->_internal->position;
  if (position)
  {
    uint64_t v3 = position;
  }
  else
  {
    uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
    if (v7)
    {
      int v8 = v7(CMBaseObject, *MEMORY[0x1E4F20070], *MEMORY[0x1E4F1CF80], &cf);
      CFTypeRef v9 = cf;
      if (v8) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = cf == 0;
      }
      if (v10)
      {
        uint64_t v3 = 0;
        if (!cf) {
          return v3;
        }
        goto LABEL_14;
      }
      FigCaptionDynamicStyleGetInitialValue();
      FigGeometryPointMakeFromDictionary();
    }
    uint64_t v3 = 0;
  }
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_14:
  }
    CFRelease(v9);
  return v3;
}

- (AVCaptionPosition)position
{
  if ([(AVCaptionRegion *)self _predefinedRegionPositionShouldBeNil]) {
    return 0;
  }
  return (AVCaptionPosition *)[(AVCaptionRegion *)self _position];
}

- (id)_endPosition
{
  CFTypeRef cf = 0;
  CFTypeRef v44 = 0;
  endPosition = self->_internal->endPosition;
  if (endPosition)
  {
    uint64_t v3 = endPosition;
LABEL_3:
    uint64_t v4 = v3;
LABEL_23:
    CFTypeRef v18 = cf;
    goto LABEL_24;
  }
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v9 + 48);
  if (!v10
    || ((uint64_t v11 = *MEMORY[0x1E4F1CF80], !v10(CMBaseObject, *MEMORY[0x1E4F20090], *MEMORY[0x1E4F1CF80], &v44))
      ? (BOOL v12 = v44 == 0)
      : (BOOL v12 = 1),
        v12
     || ((uint64_t v13 = FigCaptionRegionGetCMBaseObject(), (v14 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
       ? (uint64_t v15 = 0)
       : (uint64_t v15 = v14),
         (double v16 = *(uint64_t (**)(uint64_t, void, uint64_t, CFTypeRef *))(v15 + 48)) == 0)))
  {
    uint64_t v4 = 0;
    goto LABEL_23;
  }
  int v17 = v16(v13, *MEMORY[0x1E4F20008], v11, &cf);
  uint64_t v4 = 0;
  CFTypeRef v18 = cf;
  if (!v17 && cf)
  {
    FigCaptionDynamicStyleGetInitialValue();
    uint64_t v19 = FigGeometryDimensionMakeFromDictionary();
    int v21 = v20;
    FigCaptionDynamicStyleGetInitialValue();
    uint64_t v22 = FigGeometryDimensionMakeFromDictionary();
    if (v21 == v28)
    {
      double v29 = *(double *)&v19;
      double v30 = *(double *)&v22;
      id v31 = [(AVCaptionRegion *)self _position];
      if (v21 == 622862368)
      {
        uint64_t v33 = [AVCaptionPosition alloc];
        [v31 relativeToEnclosingRegionX];
        float v35 = v29 / 100.0 + v34;
        [v31 relativeToEnclosingRegionY];
        double v37 = v30 / 100.0;
        double v38 = v30 / 100.0 + v36;
        *(float *)&double v37 = v38;
        *(float *)&double v38 = v35;
        uint64_t v3 = [(AVCaptionPosition *)v33 initWithRelativeToEnclosingRegionX:v38 andY:v37];
        goto LABEL_3;
      }
      if (v21 == 1667591276)
      {
        uint64_t v3 = -[AVCaptionPosition initWithCellPositionX:andY:]([AVCaptionPosition alloc], "initWithCellPositionX:andY:", [v31 cellX] + (uint64_t)v29, objc_msgSend(v31, "cellY") + (uint64_t)v30);
        goto LABEL_3;
      }
      v39 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = *MEMORY[0x1E4F1C3B8];
      v41 = @"endPosition uses an unrecognizable unit.";
    }
    else
    {
      v39 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = *MEMORY[0x1E4F1C3B8];
      v41 = @"endPosition uses different units for width and height.";
    }
    v42 = objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v41, v23, v24, v25, v26, v27, (uint64_t)cf), 0);
    objc_exception_throw(v42);
  }
LABEL_24:
  if (v18) {
    CFRelease(v18);
  }
  if (v44) {
    CFRelease(v44);
  }
  return v4;
}

- (AVCaptionPosition)endPosition
{
  if ([(AVCaptionRegion *)self _predefinedRegionPositionShouldBeNil]) {
    return 0;
  }
  return (AVCaptionPosition *)[(AVCaptionRegion *)self _endPosition];
}

- (AVCaptionLength)height
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v4 + 48);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x1E4F20008], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_9;
  }
  if (!cf)
  {
    uint64_t v6 = 0;
    return v6;
  }
  FigCaptionDynamicStyleGetInitialValue();
  if (FigCaptionGeometryGetCellBasedDimensionFromDictionary()) {
LABEL_9:
  }
    uint64_t v6 = 0;
  else {
    uint64_t v6 = [[AVCaptionLength alloc] initWithCellCount:(uint64_t)0.0];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

- (AVCaptionPoint)origin
{
  retstr->x = 0u;
  retstr->y = 0u;
  result = (AVCaptionPoint *)[(AVCaptionRegion *)self _predefinedRegionPositionShouldBeNil];
  if ((result & 1) == 0)
  {
    id v6 = [(AVCaptionRegion *)self _position];
    result = (AVCaptionPoint *)[v6 unitType];
    if (result == (AVCaptionPoint *)1)
    {
      [v6 relativeToEnclosingRegionX];
      retstr->x.value = v9 * 100.0;
      AVCaptionUnitsType v7 = AVCaptionUnitsTypePercent;
      retstr->x.units = AVCaptionUnitsTypePercent;
      result = (AVCaptionPoint *)[v6 relativeToEnclosingRegionY];
      double v8 = v10 * 100.0;
    }
    else
    {
      if (result) {
        return result;
      }
      retstr->x.value = (double)[v6 cellX];
      AVCaptionUnitsType v7 = AVCaptionUnitsTypeCells;
      retstr->x.units = AVCaptionUnitsTypeCells;
      result = (AVCaptionPoint *)[v6 cellY];
      double v8 = (double)(uint64_t)result;
    }
    retstr->y.value = v8;
    retstr->y.units = v7;
  }
  return result;
}

- (AVCaptionSize)size
{
  retstr->width = 0u;
  retstr->height = 0u;
  result = (AVCaptionSize *)[(AVCaptionRegion *)self _predefinedRegionPositionShouldBeNil];
  if ((result & 1) == 0)
  {
    id v6 = [(AVCaptionRegion *)self position];
    AVCaptionUnitsType v7 = [(AVCaptionRegion *)self endPosition];
    result = [(AVCaptionPosition *)v6 unitType];
    if (result == (AVCaptionSize *)1)
    {
      [(AVCaptionPosition *)v7 relativeToEnclosingRegionX];
      float v13 = v12;
      [(AVCaptionPosition *)v6 relativeToEnclosingRegionX];
      retstr->width.value = (float)(v13 - v14) * 100.0;
      AVCaptionUnitsType v11 = AVCaptionUnitsTypePercent;
      retstr->width.units = AVCaptionUnitsTypePercent;
      [(AVCaptionPosition *)v7 relativeToEnclosingRegionY];
      float v16 = v15;
      result = (AVCaptionSize *)[(AVCaptionPosition *)v6 relativeToEnclosingRegionY];
      double v10 = (float)(v16 - v17) * 100.0;
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t v8 = [(AVCaptionPosition *)v7 cellX];
      retstr->width.value = (double)(v8 - [(AVCaptionPosition *)v6 cellX]);
      retstr->width.units = AVCaptionUnitsTypeUnspecified;
      uint64_t v9 = [(AVCaptionPosition *)v7 cellY];
      result = [(AVCaptionPosition *)v6 cellY];
      double v10 = (double)(v9 - (uint64_t)result);
      AVCaptionUnitsType v11 = AVCaptionUnitsTypeCells;
    }
    retstr->height.value = v10;
    retstr->height.units = v11;
  }
  return result;
}

- (AVCaptionRegionScroll)scroll
{
  CFTypeRef cf1 = 0;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
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
  int v6 = v5(CMBaseObject, *MEMORY[0x1E4F1FFC0], *MEMORY[0x1E4F1CF80], &cf1);
  CFTypeRef v7 = cf1;
  if (v6)
  {
    AVCaptionRegionScroll v9 = AVCaptionRegionScrollNone;
    if (!cf1) {
      return v9;
    }
    goto LABEL_12;
  }
  if (!cf1) {
    return 0;
  }
  int v8 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1FF68]);
  CFTypeRef v7 = cf1;
  if (v8)
  {
    AVCaptionRegionScroll v9 = AVCaptionRegionScrollRollUp;
    if (!cf1) {
      return v9;
    }
    goto LABEL_12;
  }
  CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1FF60]);
  AVCaptionRegionScroll v9 = AVCaptionRegionScrollNone;
  CFTypeRef v7 = cf1;
  if (cf1) {
LABEL_12:
  }
    CFRelease(v7);
  return v9;
}

- (AVCaptionRegionDisplayAlignment)displayAlignment
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, *MEMORY[0x1E4F1FFE8], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_8;
  }
  if (!cf) {
    return 0;
  }
  InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue();
  if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F1FF78]))
  {
LABEL_8:
    AVCaptionRegionDisplayAlignment v9 = AVCaptionRegionDisplayAlignmentBefore;
  }
  else if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F1FF80]))
  {
    AVCaptionRegionDisplayAlignment v9 = AVCaptionRegionDisplayAlignmentCenter;
  }
  else
  {
    if (!CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F1FF70]))
    {
      float v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"displayAlignment uses an unrecognizable value.", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
      objc_exception_throw(v16);
    }
    AVCaptionRegionDisplayAlignment v9 = AVCaptionRegionDisplayAlignmentAfter;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (AVCaptionRegionWritingMode)writingMode
{
  CFTypeRef cf = 0;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v6 + 48);
  if (!v7 || v7(CMBaseObject, *MEMORY[0x1E4F20098], *MEMORY[0x1E4F1CF80], &cf)) {
    goto LABEL_8;
  }
  if (!cf) {
    return 0;
  }
  InitialValue = (const void *)FigCaptionDynamicStyleGetInitialValue();
  if (CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F200B8]))
  {
LABEL_8:
    AVCaptionRegionWritingMode v9 = AVCaptionRegionWritingModeLeftToRightAndTopToBottom;
  }
  else
  {
    if (!CFEqual(InitialValue, (CFTypeRef)*MEMORY[0x1E4F200D0]))
    {
      float v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"writingMode uses an unrecognizable value.", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
      objc_exception_throw(v16);
    }
    AVCaptionRegionWritingMode v9 = AVCaptionRegionWritingModeTopToBottomAndRightToLeft;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (OpaqueFigCaptionRegion)_figCaptionRegion
{
  if ([(AVCaptionRegion *)self _updateFigCaptionRegion]) {
    return 0;
  }
  else {
    return self->_internal->figCaptionRegion;
  }
}

- (int)_updatePositionPropertyOfFigCaptionRegionWithPosition:(id)a3
{
  if ([a3 unitType] == 1)
  {
    [a3 relativeToEnclosingRegionX];
    FigGeometryDimensionMake();
    [a3 relativeToEnclosingRegionY];
  }
  else
  {
    if ([a3 unitType])
    {
      CFTypeRef v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"position uses an unrecognizable unit.", v6, v7, v8, v9, v10, v19), 0 reason userInfo];
      objc_exception_throw(v18);
    }
    [a3 cellX];
    FigGeometryDimensionMake();
    [a3 cellY];
  }
  FigGeometryDimensionMake();
  FigGeometryPointMake();
  uint64_t v11 = (const void *)FigGeometryPointCopyAsDictionary();
  FigCaptionDynamicStyleCreate();
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = *(uint64_t (**)(uint64_t, void, void))(v14 + 56);
  if (v15)
  {
    int v16 = v15(CMBaseObject, *MEMORY[0x1E4F20070], 0);
    if (!v11) {
      return v16;
    }
    goto LABEL_12;
  }
  int v16 = -12782;
  if (v11) {
LABEL_12:
  }
    CFRelease(v11);
  return v16;
}

- (int)_updateExtentPropertiesOfFigCaptionRegionWithPosition:(id)a3 endPosition:(id)a4
{
  if ([a3 unitType] == 1)
  {
    [a4 relativeToEnclosingRegionX];
    [a3 relativeToEnclosingRegionX];
    [a4 relativeToEnclosingRegionY];
    [a3 relativeToEnclosingRegionY];
    FigGeometryDimensionMake();
  }
  else
  {
    if ([a3 unitType])
    {
      uint64_t v26 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"endPosition uses an unrecognizable unit.", v8, v9, v10, v11, v12, 0), 0 reason userInfo];
      objc_exception_throw(v26);
    }
    [a4 cellX];
    [a3 cellX];
    [a4 cellY];
    [a3 cellY];
    FigGeometryDimensionMake();
  }
  FigGeometryDimensionMake();
  uint64_t v13 = (const void *)FigGeometryDimensionCopyAsDictionary();
  uint64_t v14 = (const void *)FigGeometryDimensionCopyAsDictionary();
  int v15 = FigCaptionDynamicStyleCreate();
  if (v15) {
    goto LABEL_17;
  }
  int v15 = FigCaptionDynamicStyleCreate();
  if (v15) {
    goto LABEL_17;
  }
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = *(uint64_t (**)(uint64_t, void, void))(v18 + 56);
  if (v19)
  {
    int v15 = v19(CMBaseObject, *MEMORY[0x1E4F20090], 0);
    if (v15)
    {
LABEL_17:
      int v24 = v15;
      goto LABEL_19;
    }
    uint64_t v20 = FigCaptionRegionGetCMBaseObject();
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = *(uint64_t (**)(uint64_t, void, void))(v22 + 56);
    if (v23)
    {
      int v15 = v23(v20, *MEMORY[0x1E4F20008], 0);
      goto LABEL_17;
    }
  }
  int v24 = -12782;
LABEL_19:
  if (v14) {
    CFRelease(v14);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v24;
}

- (int)_updateFigCaptionRegion
{
  internal = self->_internal;
  if (!internal->position)
  {
    if (!internal->endPosition) {
      return 0;
    }
    self->_internal->position = (AVCaptionPosition *)[(AVCaptionRegion *)self _position];
    internal = self->_internal;
  }
  if (!internal->endPosition)
  {
    self->_internal->endPosition = (AVCaptionPosition *)[(AVCaptionRegion *)self _endPosition];
    internal = self->_internal;
    if (!internal->endPosition)
    {
      if (internal->position) {
        goto LABEL_7;
      }
      return 0;
    }
  }
  if (!internal->position)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"position is not specified even though endPosition is specified", v2, v3, v4, v5, v6, v12), 0 reason userInfo];
    objc_exception_throw(v11);
  }
LABEL_7:
  int result = -[AVCaptionRegion _updatePositionPropertyOfFigCaptionRegionWithPosition:](self, "_updatePositionPropertyOfFigCaptionRegionWithPosition:");
  if (result) {
    return result;
  }

  self->_internal->position = 0;
  if (!self->_internal->endPosition) {
    return 0;
  }
  int result = [(AVCaptionRegion *)self _updateExtentPropertiesOfFigCaptionRegionWithPosition:[(AVCaptionRegion *)self _position] endPosition:self->_internal->endPosition];
  if (!result)
  {

    int result = 0;
    self->_internal->endPosition = 0;
  }
  return result;
}

- (void)_setPosition:(id)a3
{
  self->_internal->position = (AVCaptionPosition *)a3;
}

- (void)_setEndPosition:(id)a3
{
  self->_internal->endPosition = (AVCaptionPosition *)a3;
}

- (void)_setHeight:(id)a3
{
  if (a3)
  {
    [a3 numberOfCells];
    uint64_t v3 = (const void *)FigCaptionGeometryCopyCellBasedDimensionAsDictionary();
    FigCaptionDynamicStyleCreate();
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (**)(uint64_t, void, void))(v6 + 56);
  if (v7) {
    v7(CMBaseObject, *MEMORY[0x1E4F20008], 0);
  }
  if (v3) {
    CFRelease(v3);
  }
}

- (void)_setOrigin:(AVCaptionPoint *)a3
{
  self->_internal->position = 0;
  self->_internal->endPosition = 0;
  _convertFigGeometryDimensionToAVCaptionDimension(*(void *)&a3->x.value, a3->x.units);
  _convertFigGeometryDimensionToAVCaptionDimension(*(void *)&a3->y.value, a3->y.units);
  FigGeometryPointMake();
  uint64_t v5 = (const void *)FigGeometryPointCopyAsDictionary();
  FigCaptionDynamicStyleCreate();
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void (**)(uint64_t, void, void))(v8 + 56);
  if (v9) {
    v9(CMBaseObject, *MEMORY[0x1E4F20070], 0);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)_setSize:(AVCaptionSize *)a3
{
  self->_internal->position = 0;
  self->_internal->endPosition = 0;
  AVCaptionUnitsType units = a3->width.units;
  if (units)
  {
    _convertFigGeometryDimensionToAVCaptionDimension(*(void *)&a3->width.value, units);
    uint64_t v6 = (const void *)FigGeometryDimensionCopyAsDictionary();
    FigCaptionDynamicStyleCreate();
    if (v6) {
      CFRelease(v6);
    }
  }
  AVCaptionUnitsType v7 = a3->height.units;
  if (v7)
  {
    _convertFigGeometryDimensionToAVCaptionDimension(*(void *)&a3->height.value, v7);
    uint64_t v8 = (const void *)FigGeometryDimensionCopyAsDictionary();
    FigCaptionDynamicStyleCreate();
    if (v8) {
      CFRelease(v8);
    }
  }
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(unsigned int (**)(uint64_t, void, void))(v11 + 56);
  if (v12 && !v12(CMBaseObject, *MEMORY[0x1E4F20090], 0))
  {
    uint64_t v13 = FigCaptionRegionGetCMBaseObject();
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    int v16 = *(void (**)(uint64_t, void, void))(v15 + 56);
    if (v16) {
      v16(v13, *MEMORY[0x1E4F20008], 0);
    }
  }
}

- (void)_setScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4F1FF68];
  }
  else
  {
    if (a3)
    {
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"scroll must be one of the values defined in AVCaptionRegionScroll.", v3, v4, v5, v6, v7, v15), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v8 = (const void **)MEMORY[0x1E4F1FF60];
  }
  uint64_t v9 = *v8;
  uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void (**)(uint64_t, void, const void *))(v12 + 56);
  if (v13) {
    v13(CMBaseObject, *MEMORY[0x1E4F1FFC0], v9);
  }
  if (v9)
  {
    CFRelease(v9);
  }
}

- (void)_setDisplayAlignment:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"displayAlignment is invalid.", v3, v4, v5, v6, v7, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t v8 = (const void *)**((void **)&unk_1E57B33F8 + a3);
  if (!FigCaptionDynamicStyleCreate())
  {
    uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v11 = v10 ? v10 : 0;
    uint64_t v12 = *(void (**)(uint64_t, void, void))(v11 + 56);
    if (v12) {
      v12(CMBaseObject, *MEMORY[0x1E4F1FFE8], 0);
    }
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (void)_setWritingMode:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 2)
    {
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"writingMode is invalid.", v3, v4, v5, v6, v7, v15), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v8 = (const void **)MEMORY[0x1E4F200D0];
  }
  else
  {
    uint64_t v8 = (const void **)MEMORY[0x1E4F200B8];
  }
  uint64_t v9 = *v8;
  if (!FigCaptionDynamicStyleCreate())
  {
    uint64_t CMBaseObject = FigCaptionRegionGetCMBaseObject();
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v12 = v11 ? v11 : 0;
    uint64_t v13 = *(void (**)(uint64_t, void, void))(v12 + 56);
    if (v13) {
      v13(CMBaseObject, *MEMORY[0x1E4F20098], 0);
    }
  }
  if (v9) {
    CFRelease(v9);
  }
}

+ (id)appleiTTTop
{
  if (appleiTTTop_createOnceToken != -1) {
    dispatch_once(&appleiTTTop_createOnceToken, &__block_literal_global_4);
  }
  return (id)appleiTTTop_region;
}

uint64_t __30__AVCaptionRegion_appleiTTTop__block_invoke()
{
  v0 = [AVCaptionRegion alloc];
  uint64_t result = [(AVCaptionRegion *)v0 initWithIdentifier:*MEMORY[0x1E4F20038]];
  appleiTTTop_region = result;
  return result;
}

+ (id)appleiTTBottom
{
  if (appleiTTBottom_createOnceToken != -1) {
    dispatch_once(&appleiTTBottom_createOnceToken, &__block_literal_global_187);
  }
  return (id)appleiTTBottom_region;
}

uint64_t __33__AVCaptionRegion_appleiTTBottom__block_invoke()
{
  v0 = [AVCaptionRegion alloc];
  uint64_t result = [(AVCaptionRegion *)v0 initWithIdentifier:*MEMORY[0x1E4F20020]];
  appleiTTBottom_region = result;
  return result;
}

+ (id)appleiTTLeft
{
  if (appleiTTLeft_createOnceToken != -1) {
    dispatch_once(&appleiTTLeft_createOnceToken, &__block_literal_global_189);
  }
  return (id)appleiTTLeft_region;
}

uint64_t __31__AVCaptionRegion_appleiTTLeft__block_invoke()
{
  v0 = [AVCaptionRegion alloc];
  uint64_t result = [(AVCaptionRegion *)v0 initWithIdentifier:*MEMORY[0x1E4F20028]];
  appleiTTLeft_region = result;
  return result;
}

+ (id)appleiTTRight
{
  if (appleiTTRight_createOnceToken != -1) {
    dispatch_once(&appleiTTRight_createOnceToken, &__block_literal_global_191);
  }
  return (id)appleiTTRight_region;
}

uint64_t __32__AVCaptionRegion_appleiTTRight__block_invoke()
{
  v0 = [AVCaptionRegion alloc];
  uint64_t result = [(AVCaptionRegion *)v0 initWithIdentifier:*MEMORY[0x1E4F20030]];
  appleiTTRight_region = result;
  return result;
}

+ (id)subRipTextBottom
{
  if (subRipTextBottom_createOnceToken != -1) {
    dispatch_once(&subRipTextBottom_createOnceToken, &__block_literal_global_193);
  }
  return (id)subRipTextBottom_region;
}

uint64_t __35__AVCaptionRegion_subRipTextBottom__block_invoke()
{
  v0 = [AVCaptionRegion alloc];
  uint64_t result = [(AVCaptionRegion *)v0 initWithIdentifier:*MEMORY[0x1E4F20040]];
  subRipTextBottom_region = result;
  return result;
}

+ (AVCaptionRegion)appleITTTopRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTTop];
}

+ (AVCaptionRegion)appleITTBottomRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTBottom];
}

+ (AVCaptionRegion)appleITTLeftRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTLeft];
}

+ (AVCaptionRegion)appleITTRightRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion appleiTTRight];
}

+ (AVCaptionRegion)subRipTextBottomRegion
{
  return (AVCaptionRegion *)+[AVCaptionRegion subRipTextBottom];
}

@end