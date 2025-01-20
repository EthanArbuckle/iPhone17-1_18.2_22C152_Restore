@interface AVFigObjectInspector
+ (void)initialize;
- ($1CE2C3FC342086196D07C2B4E8C70800)_timeRangeForProperty:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3 defaultValue:(__CFString *)a4;
- (CGAffineTransform)_affineTransformForProperty:(SEL)a3;
- (CGSize)_sizeForProperty:(__CFString *)a3;
- (CGSize)_sizeForProperty:(__CFString *)a3 defaultValue:(CGSize)a4;
- (float)_floatForProperty:(__CFString *)a3;
- (float)_floatForProperty:(__CFString *)a3 defaultValue:(float)a4;
- (id)_nonNilArrayForProperty:(__CFString *)a3;
- (id)_nonNilDictionaryForProperty:(__CFString *)a3;
- (id)_tollFreeBridgedObjectForProperty:(__CFString *)a3;
- (int)_SInt32ForProperty:(__CFString *)a3;
- (int)_SInt32ForProperty:(__CFString *)a3 defaultValue:(int)a4;
- (int64_t)_longLongForProperty:(__CFString *)a3;
- (signed)_SInt16ForProperty:(__CFString *)a3;
- (unsigned)_BOOLeanForProperty:(__CFString *)a3;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
@end

@implementation AVFigObjectInspector

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3
{
  if (self)
  {
    long long v4 = *MEMORY[0x1E4F1FA48];
    uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:a4 defaultValue:&v4];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_timeForProperty:(SEL)a3 defaultValue:(__CFString *)a4
{
  *retstr = *a5;
  result = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a4];
  if (result)
  {
    v7 = result;
    CMTimeMakeFromDictionary(&v8, (CFDictionaryRef)result);
    *(CMTime *)retstr = v8;
    CFRelease(v7);
  }
  return result;
}

- (id)_tollFreeBridgedObjectForProperty:(__CFString *)a3
{
  v3 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  return v3;
}

+ (void)initialize
{
}

- (id)_nonNilDictionaryForProperty:(__CFString *)a3
{
  id result = [(AVFigObjectInspector *)self _dictionaryForProperty:a3];
  if (!result)
  {
    long long v4 = (void *)MEMORY[0x1E4F1C9E8];
    return (id)[v4 dictionary];
  }
  return result;
}

- (id)_nonNilArrayForProperty:(__CFString *)a3
{
  id result = [(AVFigObjectInspector *)self _arrayForProperty:a3];
  if (!result)
  {
    long long v4 = (void *)MEMORY[0x1E4F1C978];
    return (id)[v4 array];
  }
  return result;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)_timeRangeForProperty:(SEL)a3
{
  uint64_t v5 = MEMORY[0x1E4F1FA20];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  id result = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a4];
  if (result)
  {
    CMTime v8 = result;
    CMTimeRangeMakeFromDictionary(&v10, (CFDictionaryRef)result);
    long long v9 = *(_OWORD *)&v10.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v10.start.value;
    *(_OWORD *)&retstr->var0.var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v10.duration.timescale;
    CFRelease(v8);
  }
  return result;
}

- (float)_floatForProperty:(__CFString *)a3 defaultValue:(float)a4
{
  float v4 = a4;
  float valuePtr = a4;
  uint64_t v5 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (v5)
  {
    long long v6 = v5;
    CFNumberGetValue((CFNumberRef)v5, kCFNumberFloat32Type, &valuePtr);
    CFRelease(v6);
    return valuePtr;
  }
  return v4;
}

- (float)_floatForProperty:(__CFString *)a3
{
  [(AVFigObjectInspector *)self _floatForProperty:a3 defaultValue:0.0];
  return result;
}

- (signed)_SInt16ForProperty:(__CFString *)a3
{
  signed __int16 valuePtr = 0;
  v3 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (!v3) {
    return 0;
  }
  float v4 = v3;
  CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt16Type, &valuePtr);
  CFRelease(v4);
  return valuePtr;
}

- (int)_SInt32ForProperty:(__CFString *)a3 defaultValue:(int)a4
{
  int v4 = a4;
  int valuePtr = a4;
  uint64_t v5 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (v5)
  {
    long long v6 = v5;
    CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v6);
    return valuePtr;
  }
  return v4;
}

- (int)_SInt32ForProperty:(__CFString *)a3
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:a3 defaultValue:0];
}

- (int64_t)_longLongForProperty:(__CFString *)a3
{
  int64_t result = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (result)
  {
    int v4 = (const void *)result;
    int64_t v5 = [(id)result longLongValue];
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (unsigned)_BOOLeanForProperty:(__CFString *)a3
{
  v3 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (v3)
  {
    int v4 = v3;
    Boolean Value = CFBooleanGetValue((CFBooleanRef)v3);
    CFRelease(v4);
    LOBYTE(v3) = Value;
  }
  return v3;
}

- (CGSize)_sizeForProperty:(__CFString *)a3 defaultValue:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGSize v10 = a4;
  long long v6 = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a3];
  if (v6)
  {
    v7 = v6;
    CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v6, &v10);
    CFRelease(v7);
    CGFloat width = v10.width;
    CGFloat height = v10.height;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)_sizeForProperty:(__CFString *)a3
{
  -[AVFigObjectInspector _sizeForProperty:defaultValue:](self, "_sizeForProperty:defaultValue:", a3, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGAffineTransform)_affineTransformForProperty:(SEL)a3
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  CGSize result = [(AVFigObjectInspector *)self _valueAsCFTypeForProperty:a4];
  if (result)
  {
    double v8 = result;
    FigGetCGAffineTransformFrom3x3MatrixArray();
    *(_OWORD *)&retstr->a = v9;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = v11;
    CFRelease(v8);
  }
  return result;
}

@end