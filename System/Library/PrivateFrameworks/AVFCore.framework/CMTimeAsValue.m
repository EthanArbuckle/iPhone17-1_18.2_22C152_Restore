@interface CMTimeAsValue
+ (BOOL)supportsSecureCoding;
+ (id)valueWithCMTime:(id *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeValue;
- (BOOL)BOOLValue;
- (BOOL)isEqualToValue:(id)a3;
- (CMTimeAsValue)initWithCoder:(id)a3;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)intValue;
- (int64_t)integerValue;
- (int64_t)longLongValue;
- (int64_t)longValue;
- (signed)shortValue;
- (unint64_t)hash;
- (unint64_t)unsignedIntegerValue;
- (unint64_t)unsignedLongLongValue;
- (unint64_t)unsignedLongValue;
- (unsigned)unsignedCharValue;
- (unsigned)unsignedIntValue;
- (unsigned)unsignedShortValue;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation CMTimeAsValue

+ (id)valueWithCMTime:(id *)a3
{
  uint64_t v4 = [objc_allocWithZone((Class)a1) init];
  int64_t var3 = a3->var3;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0;
  *(void *)(v4 + 24) = var3;
  return (id)v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeValue
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)getValue:(void *)a3
{
  int64_t epoch = self->_time.epoch;
  *(_OWORD *)a3 = *(_OWORD *)&self->_time.value;
  *((void *)a3 + 2) = epoch;
}

- (const)objCType
{
  return "{?=qiIq}";
}

- (float)floatValue
{
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  return CMTimeGetSeconds((CMTime *)&time);
}

- (double)doubleValue
{
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  return CMTimeGetSeconds((CMTime *)&time);
}

- (char)charValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 charValue];
}

- (unsigned)unsignedCharValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedCharValue];
}

- (signed)shortValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 shortValue];
}

- (unsigned)unsignedShortValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedShortValue];
}

- (int)intValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 intValue];
}

- (unsigned)unsignedIntValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedIntValue];
}

- (int64_t)longValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 longValue];
}

- (unint64_t)unsignedLongValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedLongValue];
}

- (int64_t)longLongValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 longLongValue];
}

- (unint64_t)unsignedLongLongValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedLongLongValue];
}

- (BOOL)BOOLValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 BOOLValue];
}

- (int64_t)integerValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 integerValue];
}

- (unint64_t)unsignedIntegerValue
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  [(CMTimeAsValue *)self doubleValue];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  return [v3 unsignedIntegerValue];
}

- (id)description
{
  v2 = NSString;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(CMTimeAsValue *)self CMTimeValue];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  return (id)[v2 stringWithFormat:@"CMTime: %@", (id)CMTimeCopyDescription(v3, &time)];
}

- (BOOL)isEqualToValue:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  p_CMTime time = &self->_time;
  if (a3) {
    [a3 CMTimeValue];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  $95D729B680665BEAEFA1D6FCA8238556 v9 = *p_time;
  return CMTimeCompare((CMTime *)&v9, &time2) == 0;
}

- (unint64_t)hash
{
  $95D729B680665BEAEFA1D6FCA8238556 time = self->_time;
  return CMTimeHash((CMTime *)&time);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3))
  {
    return self;
  }
  else
  {
    long long v5 = *(_OWORD *)&self->_time.value;
    int64_t epoch = self->_time.epoch;
    return +[CMTimeAsValue valueWithCMTime:&v5];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeAsValue)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v17.receiver = self;
  v17.super_class = (Class)CMTimeAsValue;
  v6 = [(CMTimeAsValue *)&v17 init];
  if (v6)
  {
    if (a3)
    {
      [a3 decodeCMTimeForKey:@"CMTime"];
    }
    else
    {
      long long v15 = 0uLL;
      uint64_t v16 = 0;
    }
    *((void *)v6 + 3) = v16;
    *(_OWORD *)(v6 + 8) = v15;
  }
  return (CMTimeAsValue *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v12 = *(_OWORD *)&self->_time.value;
  int64_t epoch = self->_time.epoch;
  [a3 encodeCMTime:&v12 forKey:@"CMTime"];
}

@end