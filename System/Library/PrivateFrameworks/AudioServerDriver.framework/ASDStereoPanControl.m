@interface ASDStereoPanControl
- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDStereoPanControl)initWithPlugin:(id)a3;
- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9;
- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10;
- (BOOL)changeValue:(float)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isSettable;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (float)value;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)leftPanChannel;
- (unsigned)rightPanChannel;
- (void)setLeftPanChannel:(unsigned int)a3;
- (void)setPanChannel:(unsigned int)a3 isLeft:(BOOL)a4;
- (void)setRightPanChannel:(unsigned int)a3;
- (void)setValue:(float)a3;
@end

@implementation ASDStereoPanControl

- (ASDStereoPanControl)initWithPlugin:(id)a3
{
  LODWORD(v5) = 1936744814;
  LODWORD(v3) = 0.5;
  return [(ASDStereoPanControl *)self initWithValue:1 leftPanChannel:2 rightPanChannel:0 isSettable:0 forElement:1735159650 inScope:a3 withPlugin:v3 andObjectClassID:v5];
}

- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  LODWORD(v7) = 1936744814;
  LODWORD(v5) = 0.5;
  return [(ASDStereoPanControl *)self initWithValue:1 leftPanChannel:2 rightPanChannel:0 isSettable:*(void *)&a3 forElement:*(void *)&a4 inScope:a5 withPlugin:v5 andObjectClassID:v7];
}

- (ASDStereoPanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  LODWORD(v8) = a6;
  LODWORD(v6) = 0.5;
  return [(ASDStereoPanControl *)self initWithValue:1 leftPanChannel:2 rightPanChannel:0 isSettable:*(void *)&a3 forElement:*(void *)&a4 inScope:a5 withPlugin:v6 andObjectClassID:v8];
}

- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9
{
  LODWORD(v10) = 1936744814;
  return -[ASDStereoPanControl initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:](self, "initWithValue:leftPanChannel:rightPanChannel:isSettable:forElement:inScope:withPlugin:andObjectClassID:", *(void *)&a4, *(void *)&a5, a6, *(void *)&a7, *(void *)&a8, a9, v10);
}

- (ASDStereoPanControl)initWithValue:(float)a3 leftPanChannel:(unsigned int)a4 rightPanChannel:(unsigned int)a5 isSettable:(BOOL)a6 forElement:(unsigned int)a7 inScope:(unsigned int)a8 withPlugin:(id)a9 andObjectClassID:(unsigned int)a10
{
  v25.receiver = self;
  v25.super_class = (Class)ASDStereoPanControl;
  v14 = [(ASDControl *)&v25 initWithElement:*(void *)&a7 inScope:*(void *)&a8 withPlugin:a9 andObjectClassID:a10];
  v15 = v14;
  if (v14)
  {
    v14->_value = a3;
    v14->_settable = a6;
    v14->_leftPanChannel = a4;
    v14->_rightPanChannel = a5;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 bundleIdentifier];
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    id v21 = [v18 stringWithFormat:@"%@.%@.%p", v17, v20, v15];
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    valueQueue = v15->_valueQueue;
    v15->_valueQueue = (OS_dispatch_queue *)v22;
  }
  return v15;
}

- (unsigned)baseClass
{
  return 1936744814;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1936745315 || a3->mSelector == 1936745334) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)ASDStereoPanControl;
  return -[ASDControl hasProperty:](&v5, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1936745334) {
    return 4;
  }
  if (a3->mSelector == 1936745315) {
    return 8;
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDStereoPanControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1936745315)
    {
      if (*a6 >= 8)
      {
        *(_DWORD *)a7 = [(ASDStereoPanControl *)self leftPanChannel];
        *((_DWORD *)a7 + 1) = [(ASDStereoPanControl *)self rightPanChannel];
        unsigned int v13 = 8;
        goto LABEL_10;
      }
      return 0;
    }
    if (a3->mSelector == 1936745334)
    {
      if (*a6 >= 4)
      {
        [(ASDStereoPanControl *)self value];
        *(_DWORD *)a7 = v12;
        unsigned int v13 = 4;
LABEL_10:
        *a6 = v13;
        return 1;
      }
      return 0;
    }
    v14.receiver = self;
    v14.super_class = (Class)ASDStereoPanControl;
    return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3 || a3->mSelector == 1936745315) {
    return 0;
  }
  if (a3->mSelector == 1936745334)
  {
    return [(ASDStereoPanControl *)self isSettable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDStereoPanControl;
    return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  BOOL v15 = -[ASDStereoPanControl hasProperty:](self, "hasProperty:");
  if (!v15) {
    return v15;
  }
  BOOL v15 = [(ASDStereoPanControl *)self isPropertySettable:a3];
  if (!v15) {
    return v15;
  }
  if (a3->mSelector != 1936745334)
  {
    v18.receiver = self;
    v18.super_class = (Class)ASDStereoPanControl;
    LOBYTE(v15) = [(ASDObject *)&v18 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    return v15;
  }
  if (v10 != 4)
  {
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  LODWORD(v16) = *(_DWORD *)a7;
  LOBYTE(v15) = [(ASDStereoPanControl *)self changeValue:v16];
  return v15;
}

- (BOOL)changeValue:(float)a3
{
  return 0;
}

- (void)setValue:(float)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASDStereoPanControl_setValue___block_invoke;
  block[3] = &unk_264773560;
  float v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F6273706376;
    objc_super v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __32__ASDStereoPanControl_setValue___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 48);
  if (*(float *)(v1 + 80) != v2)
  {
    float v3 = 1.0;
    BOOL v4 = v2 >= 1.0;
    BOOL v5 = v2 > 0.0 || v2 >= 1.0;
    if (v2 <= 0.0) {
      BOOL v4 = 1;
    }
    if (!v5) {
      float v3 = 0.0;
    }
    if (v4) {
      float v2 = v3;
    }
    *(float *)(v1 + 80) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (float)value
{
  uint64_t v6 = 0;
  int v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__ASDStereoPanControl_value__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __28__ASDStereoPanControl_value__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 80);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)leftPanChannel
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__ASDStereoPanControl_leftPanChannel__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__ASDStereoPanControl_leftPanChannel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 96);
  return result;
}

- (unsigned)rightPanChannel
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ASDStereoPanControl_rightPanChannel__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__ASDStereoPanControl_rightPanChannel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 100);
  return result;
}

- (void)setPanChannel:(unsigned int)a3 isLeft:(BOOL)a4
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__ASDStereoPanControl_setPanChannel_isLeft___block_invoke;
  block[3] = &unk_2647736B0;
  BOOL v11 = a4;
  unsigned int v10 = a3;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v13 + 24))
  {
    int v8 = 0;
    uint64_t v7 = 0x676C6F6273706363;
    uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
    [v6 changedProperty:&v7 forObject:self];
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __44__ASDStereoPanControl_setPanChannel_isLeft___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 48);
  if (*(unsigned char *)(result + 52)) {
    uint64_t v2 = 96;
  }
  else {
    uint64_t v2 = 100;
  }
  unsigned int v3 = (_DWORD *)(*(void *)(result + 32) + v2);
  if (*v3 != v1)
  {
    *unsigned int v3 = v1;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)setLeftPanChannel:(unsigned int)a3
{
}

- (void)setRightPanChannel:(unsigned int)a3
{
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASDStereoPanControl;
  id v6 = a3;
  uint64_t v7 = [(ASDControl *)&v10 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  [(ASDStereoPanControl *)self value];
  [v7 appendFormat:@"%@|    Current Value: %f\n", v6, v8];
  [v7 appendFormat:@"%@|    Panning Channels: %u, %u\n", v6, -[ASDStereoPanControl leftPanChannel](self, "leftPanChannel"), -[ASDStereoPanControl rightPanChannel](self, "rightPanChannel")];

  return v7;
}

- (id)driverClassName
{
  return @"AudioStereoPanControl";
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void).cxx_destruct
{
}

@end