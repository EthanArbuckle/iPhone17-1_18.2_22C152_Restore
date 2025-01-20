@interface ASDLevelControl
+ (id)volumeControlWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9;
- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9;
- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10;
- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDLevelControl)initWithPlugin:(id)a3;
- (BOOL)changeDecibelValue:(float)a3;
- (BOOL)changeScalarValue:(float)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isSettable;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (float)_decibelFromScalar:(float)a3;
- (float)_scalarFromDecibel:(float)a3;
- (float)decibelFromScalar:(float)a3;
- (float)decibelValue;
- (float)maximumDecibelValue;
- (float)minimumDecibelValue;
- (float)scalarFromDecibel:(float)a3;
- (float)scalarValue;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (void)setDecibelValue:(float)a3;
- (void)setMaximumDecibelValue:(float)a3;
- (void)setMinimumDecibelValue:(float)a3;
- (void)setScalarValue:(float)a3;
@end

@implementation ASDLevelControl

- (ASDLevelControl)initWithPlugin:(id)a3
{
  return [(ASDLevelControl *)self initWithDecibelValue:0 minimumValue:0 maximumValue:1735159650 isSettable:a3 forElement:1818588780 inScope:0.0 withPlugin:0.0 andObjectClassID:0.0];
}

- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return [(ASDLevelControl *)self initWithDecibelValue:0 minimumValue:*(void *)&a3 maximumValue:*(void *)&a4 isSettable:a5 forElement:1818588780 inScope:0.0 withPlugin:0.0 andObjectClassID:0.0];
}

- (ASDLevelControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  return [(ASDLevelControl *)self initWithDecibelValue:0 minimumValue:*(void *)&a3 maximumValue:*(void *)&a4 isSettable:a5 forElement:*(void *)&a6 inScope:0.0 withPlugin:0.0 andObjectClassID:0.0];
}

- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  return -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:", a6, *(void *)&a7, *(void *)&a8, a9, 1818588780);
}

- (ASDLevelControl)initWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10
{
  uint64_t v10 = *(void *)&a10;
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  id v19 = a9;
  if (a4 > a5)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"ASDLevelControl.m", 61, @"Invalid parameter not satisfying: %@", @"minimumValue <= maximumValue" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)ASDLevelControl;
  v20 = [(ASDControl *)&v32 initWithElement:v12 inScope:v11 withPlugin:v19 andObjectClassID:v10];
  v21 = v20;
  if (v20)
  {
    v20->_decibelValue = a3;
    v20->_minimumDecibelValue = a4;
    v20->_maximumDecibelValue = a5;
    v20->_settable = a6;
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 bundleIdentifier];
    v24 = NSString;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    id v27 = [v24 stringWithFormat:@"%@.%@.%p", v23, v26, v21];
    dispatch_queue_t v28 = dispatch_queue_create((const char *)[v27 UTF8String], 0);
    valueQueue = v21->_valueQueue;
    v21->_valueQueue = (OS_dispatch_queue *)v28;
  }
  return v21;
}

- (unsigned)baseClass
{
  return 1818588780;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  BOOL result = 1;
  if ((a3->mSelector - 1818453106 > 4 || ((1 << (a3->mSelector - 114)) & 0x13) == 0)
    && mSelector != 1818456932
    && mSelector != 1818456950)
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDLevelControl;
    return -[ASDControl hasProperty:](&v9, sel_hasProperty_);
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  unsigned int result = 4;
  if ((int)a3->mSelector <= 1818453109)
  {
    if (mSelector != 1818453106)
    {
      if (mSelector == 1818453107) {
        return result;
      }
      goto LABEL_14;
    }
    return 16;
  }
  else if (mSelector != 1818453110 && mSelector != 1818456932 && mSelector != 1818456950)
  {
LABEL_14:
    v10.receiver = self;
    v10.super_class = (Class)ASDLevelControl;
    return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v10, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v9 = 0;
  if (a3 && a6 && a7)
  {
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1818453109)
    {
      if (mSelector == 1818453106)
      {
        if (*a6 >= 0x10)
        {
          valueQueue = self->_valueQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __90__ASDLevelControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_2647732E8;
          block[4] = self;
          block[5] = a7;
          dispatch_sync(valueQueue, block);
          unsigned int v14 = 16;
          goto LABEL_21;
        }
        return 0;
      }
      if (mSelector == 1818453107)
      {
        if (*a6 >= 4)
        {
          LODWORD(v8) = *(_DWORD *)a7;
          [(ASDLevelControl *)self scalarFromDecibel:v8];
          goto LABEL_18;
        }
        return 0;
      }
    }
    else
    {
      switch(mSelector)
      {
        case 0x6C636476u:
          if (*a6 >= 4)
          {
            [(ASDLevelControl *)self decibelValue];
            goto LABEL_18;
          }
          return 0;
        case 0x6C637364u:
          if (*a6 >= 4)
          {
            LODWORD(v8) = *(_DWORD *)a7;
            [(ASDLevelControl *)self decibelFromScalar:v8];
            goto LABEL_18;
          }
          return 0;
        case 0x6C637376u:
          if (*a6 >= 4)
          {
            [(ASDLevelControl *)self scalarValue];
LABEL_18:
            *(_DWORD *)a7 = v13;
            unsigned int v14 = 4;
LABEL_21:
            *a6 = v14;
            return 1;
          }
          return 0;
      }
    }
    v17.receiver = self;
    v17.super_class = (Class)ASDLevelControl;
    return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v17, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v9;
}

double __90__ASDLevelControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  v1 = *(double **)(a1 + 40);
  v1[1] = *(float *)(*(void *)(a1 + 32) + 88);
  double result = *(float *)(*(void *)(a1 + 32) + 84);
  double *v1 = result;
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  BOOL v3 = 0;
  if (!a3) {
    return v3;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1818456931)
  {
    if (mSelector - 1818453106 >= 2)
    {
      unsigned __int16 v5 = 25718;
      goto LABEL_7;
    }
    return v3;
  }
  if (mSelector == 1818456932) {
    return v3;
  }
  unsigned __int16 v5 = 29558;
LABEL_7:
  if (mSelector != (v5 | 0x6C630000))
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDLevelControl;
    return -[ASDObject isPropertySettable:](&v7, sel_isPropertySettable_);
  }
  return [(ASDLevelControl *)self isSettable];
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  BOOL v15 = -[ASDLevelControl hasProperty:](self, "hasProperty:");
  if (!v15) {
    return v15;
  }
  BOOL v15 = [(ASDLevelControl *)self isPropertySettable:a3];
  if (!v15) {
    return v15;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector != 1818456950 && mSelector != 1818453110)
  {
    v23.receiver = self;
    v23.super_class = (Class)ASDLevelControl;
    LOBYTE(v15) = [(ASDObject *)&v23 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    return v15;
  }
  if (v10 != 4)
  {
LABEL_11:
    LOBYTE(v15) = 0;
    return v15;
  }
  float v17 = *(float *)a7;
  if (mSelector == 1818456950)
  {
    HIDWORD(v18) = 0;
    *(float *)&double v18 = fminf(fmaxf(v17, 0.0), 1.0);
    LOBYTE(v15) = [(ASDLevelControl *)self changeScalarValue:v18];
  }
  else
  {
    [(ASDLevelControl *)self minimumDecibelValue];
    if (v17 <= v19)
    {
      [(ASDLevelControl *)self minimumDecibelValue];
      float v17 = v20;
    }
    [(ASDLevelControl *)self maximumDecibelValue];
    if (v17 >= *(float *)&v21)
    {
      [(ASDLevelControl *)self maximumDecibelValue];
      float v17 = *(float *)&v21;
    }
    *(float *)&double v21 = v17;
    LOBYTE(v15) = [(ASDLevelControl *)self changeDecibelValue:v21];
  }
  return v15;
}

- (float)_scalarFromDecibel:(float)a3
{
  float minimumDecibelValue = self->_minimumDecibelValue;
  float maximumDecibelValue = self->_maximumDecibelValue;
  float v5 = minimumDecibelValue;
  if (minimumDecibelValue <= a3)
  {
    float v5 = a3;
    if (maximumDecibelValue < a3) {
      float v5 = self->_maximumDecibelValue;
    }
  }
  return (float)(v5 - minimumDecibelValue) / (float)(maximumDecibelValue - minimumDecibelValue);
}

- (float)_decibelFromScalar:(float)a3
{
  float v3 = 1.0;
  if (a3 <= 1.0) {
    float v3 = a3;
  }
  if (a3 >= 0.0) {
    float v4 = v3;
  }
  else {
    float v4 = 0.0;
  }
  return self->_minimumDecibelValue + (float)(v4 * (float)(self->_maximumDecibelValue - self->_minimumDecibelValue));
}

- (float)scalarFromDecibel:(float)a3
{
  uint64_t v8 = 0;
  BOOL v9 = (float *)&v8;
  uint64_t v10 = 0x2020000000;
  valueQueue = self->_valueQueue;
  int v11 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ASDLevelControl_scalarFromDecibel___block_invoke;
  block[3] = &unk_2647735B0;
  block[4] = self;
  block[5] = &v8;
  float v7 = a3;
  dispatch_sync(valueQueue, block);
  float v4 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__ASDLevelControl_scalarFromDecibel___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) _scalarFromDecibel:a2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (float)decibelFromScalar:(float)a3
{
  uint64_t v8 = 0;
  BOOL v9 = (float *)&v8;
  uint64_t v10 = 0x2020000000;
  valueQueue = self->_valueQueue;
  int v11 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ASDLevelControl_decibelFromScalar___block_invoke;
  block[3] = &unk_2647735B0;
  block[4] = self;
  block[5] = &v8;
  float v7 = a3;
  dispatch_sync(valueQueue, block);
  float v4 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__ASDLevelControl_decibelFromScalar___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  uint64_t result = [*(id *)(a1 + 32) _decibelFromScalar:a2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (void)setMaximumDecibelValue:(float)a3
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASDLevelControl_setMaximumDecibelValue___block_invoke;
  block[3] = &unk_264773560;
  float v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F626C636472;
    float v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __42__ASDLevelControl_setMaximumDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 88) != v2)
  {
    *(float *)(v1 + 88) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)maximumDecibelValue
{
  uint64_t v6 = 0;
  int v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ASDLevelControl_maximumDecibelValue__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __38__ASDLevelControl_maximumDecibelValue__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 88);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMinimumDecibelValue:(float)a3
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASDLevelControl_setMinimumDecibelValue___block_invoke;
  block[3] = &unk_264773560;
  float v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F626C636472;
    float v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __42__ASDLevelControl_setMinimumDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 84) != v2)
  {
    *(float *)(v1 + 84) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)minimumDecibelValue
{
  uint64_t v6 = 0;
  int v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ASDLevelControl_minimumDecibelValue__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __38__ASDLevelControl_minimumDecibelValue__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 84);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDecibelValue:(float)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDLevelControl_setDecibelValue___block_invoke;
  block[3] = &unk_264773560;
  float v10 = a3;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v12 + 24))
  {
    int v8 = 0;
    uint64_t v7 = 0x676C6F626C636476;
    float v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v7 forObject:self];

    LODWORD(v7) = 1818456950;
    uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
    [v6 changedProperty:&v7 forObject:self];
  }
  _Block_object_dispose(&v11, 8);
}

uint64_t __35__ASDLevelControl_setDecibelValue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 80) != v2)
  {
    *(float *)(v1 + 80) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)decibelValue
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__ASDLevelControl_decibelValue__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __31__ASDLevelControl_decibelValue__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 80);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setScalarValue:(float)a3
{
  -[ASDLevelControl decibelFromScalar:](self, "decibelFromScalar:");
  -[ASDLevelControl setDecibelValue:](self, "setDecibelValue:");
}

- (float)scalarValue
{
  uint64_t v6 = 0;
  uint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__ASDLevelControl_scalarValue__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__ASDLevelControl_scalarValue__block_invoke(uint64_t a1, double a2)
{
  float v3 = *(_DWORD **)(a1 + 32);
  LODWORD(a2) = v3[20];
  uint64_t result = [v3 _scalarFromDecibel:a2];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (BOOL)changeDecibelValue:(float)a3
{
  return 0;
}

- (BOOL)changeScalarValue:(float)a3
{
  return 0;
}

+ (id)volumeControlWithDecibelValue:(float)a3 minimumValue:(float)a4 maximumValue:(float)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  BOOL v11 = a6;
  id v15 = a9;
  id v16 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v17 = a3;
  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  float v20 = (void *)[v16 initWithDecibelValue:v11 minimumValue:v10 maximumValue:v9 isSettable:v15 forElement:1986817381 inScope:v17 withPlugin:v18 andObjectClassID:v19];

  return v20;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASDLevelControl;
  id v6 = a3;
  uint64_t v7 = [(ASDControl *)&v16 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  BOOL v8 = [(ASDLevelControl *)self isSettable];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Settable: %@\n", v6, v9];
  [(ASDLevelControl *)self scalarValue];
  [v7 appendFormat:@"%@|    Scalar Value: %f\n", v6, v10];
  [(ASDLevelControl *)self decibelValue];
  [v7 appendFormat:@"%@|    Decibel Value: %f\n", v6, v11];
  [(ASDLevelControl *)self minimumDecibelValue];
  double v13 = v12;
  [(ASDLevelControl *)self maximumDecibelValue];
  [v7 appendFormat:@"%@|    Decibel Range: Min %f Max %f\n", v6, *(void *)&v13, v14];

  return v7;
}

- (id)driverClassName
{
  unsigned int v2 = [(ASDControl *)self objectClass];
  float v3 = @"AudioLevelControl";
  if (v2 == 1986817381) {
    float v3 = @"AudioVolumeControl";
  }
  if (v2 == 1937072758) {
    return @"AudioLFEVolumeControl";
  }
  else {
    return v3;
  }
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void).cxx_destruct
{
}

@end