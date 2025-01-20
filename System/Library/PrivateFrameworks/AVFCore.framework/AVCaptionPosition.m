@interface AVCaptionPosition
+ (BOOL)supportsSecureCoding;
- (AVCaptionPosition)init;
- (AVCaptionPosition)initWithCellPositionX:(int64_t)a3 andY:(int64_t)a4;
- (AVCaptionPosition)initWithCoder:(id)a3;
- (AVCaptionPosition)initWithRelativeToEnclosingRegionX:(float)a3 andY:(float)a4;
- (BOOL)isEqual:(id)a3;
- (float)relativeToEnclosingRegionX;
- (float)relativeToEnclosingRegionY;
- (id)description;
- (int64_t)cellX;
- (int64_t)cellY;
- (int64_t)unitType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCaptionPosition

- (AVCaptionPosition)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithCellPositionX_andY_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVCaptionPosition)initWithCellPositionX:(int64_t)a3 andY:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptionPosition;
  v6 = [(AVCaptionPosition *)&v9 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptionPositionInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->x.cell = a3;
      v6->_internal->y.cell = a4;
      v6->_internal->unitType = 0;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaptionPosition)initWithRelativeToEnclosingRegionX:(float)a3 andY:(float)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVCaptionPosition;
  v6 = [(AVCaptionPosition *)&v9 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVCaptionPositionInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->x.relativeToEnclosingRegion = a3;
      v6->_internal->y.relativeToEnclosingRegion = a4;
      v6->_internal->unitType = 1;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVCaptionPosition)initWithCoder:(id)a3
{
  if ([a3 containsValueForKey:@"AVCaptionPositionArchiveKeyCellX"]
    && [a3 containsValueForKey:@"AVCaptionPositionArchiveKeyCellY"])
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"AVCaptionPositionArchiveKeyCellX"];
    uint64_t v6 = [a3 decodeIntegerForKey:@"AVCaptionPositionArchiveKeyCellY"];
    return [(AVCaptionPosition *)self initWithCellPositionX:v5 andY:v6];
  }
  else if ([a3 containsValueForKey:@"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX"]&& objc_msgSend(a3, "containsValueForKey:", @"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY"))
  {
    [a3 decodeFloatForKey:@"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX"];
    int v9 = v8;
    [a3 decodeFloatForKey:@"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY"];
    LODWORD(v10) = LODWORD(v11);
    LODWORD(v11) = v9;
    return [(AVCaptionPosition *)self initWithRelativeToEnclosingRegionX:v11 andY:v10];
  }
  else
  {

    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:2 forKey:@"AVCaptionPositionArchiveKeyVersion"];
  int64_t unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    [(AVCaptionPosition *)self relativeToEnclosingRegionX];
    objc_msgSend(a3, "encodeFloat:forKey:", @"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionX");
    [(AVCaptionPosition *)self relativeToEnclosingRegionY];
    objc_msgSend(a3, "encodeFloat:forKey:", @"AVCaptionPositionArchiveKeyRelativeToEnclosingRegionY");
  }
  else if (!unitType)
  {
    objc_msgSend(a3, "encodeInteger:forKey:", -[AVCaptionPosition cellX](self, "cellX"), @"AVCaptionPositionArchiveKeyCellX");
    int64_t v6 = [(AVCaptionPosition *)self cellY];
    [a3 encodeInteger:v6 forKey:@"AVCaptionPositionArchiveKeyCellY"];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptionPosition;
  [(AVCaptionPosition *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    [(AVCaptionPosition *)self relativeToEnclosingRegionX];
    uint64_t v10 = (uint64_t)(float)(v9 * 1000.0);
    [a3 relativeToEnclosingRegionX];
    uint64_t v12 = (uint64_t)(float)(v11 * 1000.0);
    [(AVCaptionPosition *)self relativeToEnclosingRegionY];
    float v14 = v13;
    [a3 relativeToEnclosingRegionY];
    return v10 == v12 && (uint64_t)(float)(v14 * 1000.0) == (uint64_t)(float)(v15 * 1000.0);
  }
  if (unitType) {
    return 1;
  }
  int64_t v6 = [(AVCaptionPosition *)self cellX];
  if (v6 == [a3 cellX])
  {
    int64_t v7 = [(AVCaptionPosition *)self cellY];
    if (v7 == [a3 cellY]) {
      return 1;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  int64_t v3 = [(AVCaptionPosition *)self cellX];
  return [(AVCaptionPosition *)self cellY] ^ v3;
}

- (int64_t)cellX
{
  if ([(AVCaptionPosition *)self unitType])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeCell"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return self->_internal->x.cell;
}

- (int64_t)cellY
{
  if ([(AVCaptionPosition *)self unitType])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeCell"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return self->_internal->y.cell;
}

- (float)relativeToEnclosingRegionX
{
  if ([(AVCaptionPosition *)self unitType] != 1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeRelativeToEnclosingRegion"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return self->_internal->x.relativeToEnclosingRegion;
}

- (float)relativeToEnclosingRegionY
{
  if ([(AVCaptionPosition *)self unitType] != 1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v4, v5, v6, v7, v8, (uint64_t)"[self unitType] == AVCaptionUnitTypeRelativeToEnclosingRegion"), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  return self->_internal->y.relativeToEnclosingRegion;
}

- (int64_t)unitType
{
  return self->_internal->unitType;
}

- (id)description
{
  int64_t unitType = self->_internal->unitType;
  if (unitType == 1)
  {
    uint64_t v4 = NSString;
    [(AVCaptionPosition *)self relativeToEnclosingRegionX];
    *(double *)&int64_t v7 = v6;
    [(AVCaptionPosition *)self relativeToEnclosingRegionY];
    int64_t v14 = v7;
    double v15 = v8;
    uint64_t v5 = @"relativeToEnclosingRegion=(%4.2f,%4.2f)";
  }
  else
  {
    if (unitType)
    {
      float v9 = NSString;
      uint64_t v5 = @"unsupported unit";
      goto LABEL_7;
    }
    uint64_t v4 = NSString;
    int64_t v14 = [(AVCaptionPosition *)self cellX];
    double v15 = COERCE_DOUBLE([(AVCaptionPosition *)self cellY]);
    uint64_t v5 = @"cell=(%ld,%ld)";
  }
  float v9 = v4;
LABEL_7:
  uint64_t v10 = objc_msgSend(v9, "stringWithFormat:", v5, v14, *(void *)&v15);
  float v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  return (id)[v11 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v12), self, v10];
}

@end