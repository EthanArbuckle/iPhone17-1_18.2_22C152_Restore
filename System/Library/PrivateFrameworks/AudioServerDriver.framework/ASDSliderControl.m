@interface ASDSliderControl
+ (id)sliderControlWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8;
- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDSliderControl)initWithPlugin:(id)a3;
- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8;
- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8 andObjectClassID:(unsigned int)a9;
- (BOOL)changeValue:(unsigned int)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isSettable;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (_ASDSliderRange)range;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)value;
- (void)setRange:(_ASDSliderRange)a3;
- (void)setValue:(unsigned int)a3;
@end

@implementation ASDSliderControl

- (ASDSliderControl)initWithPlugin:(id)a3
{
  LODWORD(v4) = 1936483442;
  return [(ASDSliderControl *)self initWithValue:0 andRange:0 isSettable:0 forElement:0 inScope:1735159650 withPlugin:a3 andObjectClassID:v4];
}

- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  LODWORD(v6) = 1936483442;
  return [(ASDSliderControl *)self initWithValue:0 andRange:0 isSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5 andObjectClassID:v6];
}

- (ASDSliderControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  LODWORD(v7) = a6;
  return [(ASDSliderControl *)self initWithValue:0 andRange:0 isSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5 andObjectClassID:v7];
}

- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8
{
  LODWORD(v9) = 1936483442;
  return [(ASDSliderControl *)self initWithValue:*(void *)&a3 andRange:a4 isSettable:a5 forElement:*(void *)&a6 inScope:*(void *)&a7 withPlugin:a8 andObjectClassID:v9];
}

- (ASDSliderControl)initWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8 andObjectClassID:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  unsigned int mMinimum = a4.mMinimum;
  unsigned int mMaximum = a4.mMaximum;
  id v17 = a8;
  if (mMinimum > mMaximum)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"ASDSliderControl.m", 58, @"Invalid parameter not satisfying: %@", @"range.mMinimum <= range.mMaximum" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)ASDSliderControl;
  v18 = [(ASDControl *)&v30 initWithElement:v10 inScope:v9 withPlugin:v17 andObjectClassID:a9];
  v19 = v18;
  if (v18)
  {
    v18->_value = a3;
    v18->_range.unsigned int mMinimum = mMinimum;
    v18->_range.unsigned int mMaximum = mMaximum;
    v18->_settable = a5;
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 bundleIdentifier];
    v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    id v25 = [v22 stringWithFormat:@"%@.%@.%p", v21, v24, v19];
    dispatch_queue_t v26 = dispatch_queue_create((const char *)[v25 UTF8String], 0);
    valueQueue = v19->_valueQueue;
    v19->_valueQueue = (OS_dispatch_queue *)v26;
  }
  return v19;
}

- (unsigned)baseClass
{
  return 1936483442;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if ((a3->mSelector | 4) == 0x73647276) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDSliderControl;
  return -[ASDControl hasProperty:](&v4, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1935962742) {
    return 4;
  }
  if (a3->mSelector == 1935962738) {
    return 8;
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDSliderControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8 = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1935962738)
    {
      if (*a6 >= 8)
      {
        valueQueue = self->_valueQueue;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
        v15[3] = &unk_2647732E8;
        v15[4] = self;
        v15[5] = a7;
        dispatch_sync(valueQueue, v15);
        unsigned int v11 = 8;
        goto LABEL_10;
      }
    }
    else
    {
      if (a3->mSelector != 1935962742)
      {
        v14.receiver = self;
        v14.super_class = (Class)ASDSliderControl;
        return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
      }
      if (*a6 >= 4)
      {
        uint64_t v10 = self->_valueQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
        block[3] = &unk_2647732E8;
        block[4] = self;
        block[5] = a7;
        dispatch_sync(v10, block);
        unsigned int v11 = 4;
LABEL_10:
        *a6 = v11;
        return 1;
      }
    }
    return 0;
  }
  return v8;
}

uint64_t __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t result)
{
  **(_DWORD **)(result + 40) = *(_DWORD *)(*(void *)(result + 32) + 80);
  return result;
}

uint64_t __91__ASDSliderControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t result)
{
  **(void **)(result + 40) = *(void *)(*(void *)(result + 32) + 84);
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3 || a3->mSelector == 1935962738) {
    return 0;
  }
  if (a3->mSelector == 1935962742)
  {
    return [(ASDSliderControl *)self isSettable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDSliderControl;
    return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  BOOL v15 = -[ASDSliderControl hasProperty:](self, "hasProperty:");
  if (!v15) {
    return v15;
  }
  BOOL v15 = [(ASDSliderControl *)self isPropertySettable:a3];
  if (!v15) {
    return v15;
  }
  if (a3->mSelector != 1935962742)
  {
    v20.receiver = self;
    v20.super_class = (Class)ASDSliderControl;
    LOBYTE(v15) = [(ASDObject *)&v20 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    return v15;
  }
  if (v10 != 4)
  {
LABEL_14:
    LOBYTE(v15) = 0;
    return v15;
  }
  unsigned int mMinimum = self->_range.mMinimum;
  unsigned int mMaximum = self->_range.mMaximum;
  if (mMaximum >= *(_DWORD *)a7) {
    unsigned int mMaximum = *(_DWORD *)a7;
  }
  if (mMaximum <= mMinimum) {
    uint64_t v18 = mMinimum;
  }
  else {
    uint64_t v18 = mMaximum;
  }
  LOBYTE(v15) = [(ASDSliderControl *)self changeValue:v18];
  return v15;
}

- (void)setRange:(_ASDSliderRange)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v12 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDSliderControl_setRange___block_invoke;
  block[3] = &unk_264773338;
  block[5] = &v9;
  void block[6] = a3;
  block[4] = self;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v10 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F6273647272;
    v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __29__ASDSliderControl_setRange___block_invoke(uint64_t result)
{
  v1 = (void *)(*(void *)(result + 32) + 84);
  if (*(_DWORD *)(*(void *)(result + 32) + 88) != *(_DWORD *)(result + 52)
    || *(_DWORD *)v1 != *(_DWORD *)(result + 48))
  {
    void *v1 = *(void *)(result + 48);
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (_ASDSliderRange)range
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2810000000;
  uint64_t v9 = "";
  uint64_t v10 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__ASDSliderControl_range__block_invoke;
  block[3] = &unk_264773158;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(valueQueue, block);
  _ASDSliderRange v3 = (_ASDSliderRange)v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ASDSliderControl_range__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 32) = *(void *)(*(void *)(result + 32) + 84);
  return result;
}

- (void)setValue:(unsigned int)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDSliderControl_setValue___block_invoke;
  block[3] = &unk_264773560;
  unsigned int v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F6273647276;
    v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __29__ASDSliderControl_setValue___block_invoke(uint64_t result)
{
  v1 = *(_DWORD **)(result + 32);
  unsigned int v2 = v1[22];
  if (v2 >= *(_DWORD *)(result + 48)) {
    unsigned int v2 = *(_DWORD *)(result + 48);
  }
  if (v2 <= v1[21]) {
    unsigned int v2 = v1[21];
  }
  if (v1[20] != v2)
  {
    v1[20] = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (unsigned)value
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ASDSliderControl_value__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__ASDSliderControl_value__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 80);
  return result;
}

- (BOOL)changeValue:(unsigned int)a3
{
  return 0;
}

+ (id)sliderControlWithValue:(unsigned int)a3 andRange:(_ASDSliderRange)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 withPlugin:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v9 = *(void *)&a6;
  BOOL v10 = a5;
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  LODWORD(v16) = 1936483442;
  objc_super v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v12 andRange:a4 isSettable:v10 forElement:v9 inScope:v8 withPlugin:v13 andObjectClassID:v16];

  return v14;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDSliderControl;
  id v6 = a3;
  int v7 = [(ASDControl *)&v12 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  _ASDSliderRange v8 = [(ASDSliderControl *)self range];
  BOOL v9 = [(ASDSliderControl *)self isSettable];
  BOOL v10 = @"NO";
  if (v9) {
    BOOL v10 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Settable: %@\n", v6, v10];
  [v7 appendFormat:@"%@|    Value: %u\n", v6, -[ASDSliderControl value](self, "value")];
  [v7 appendFormat:@"%@|    Range: Min %u Max %u\n", v6, v8, HIDWORD(*(unint64_t *)&v8)];

  return v7;
}

- (id)driverClassName
{
  return @"AudioSliderControl";
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void).cxx_destruct
{
}

@end