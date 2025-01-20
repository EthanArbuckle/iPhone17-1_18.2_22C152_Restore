@interface ASDBooleanControl
+ (id)invertControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7;
+ (id)jackControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7;
+ (id)muteControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7;
+ (id)phantomPowerControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7;
- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDBooleanControl)initWithPlugin:(id)a3;
- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7;
- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8;
- (BOOL)changeValue:(BOOL)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isSettable;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)value;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (void)setValue:(BOOL)a3;
@end

@implementation ASDBooleanControl

- (ASDBooleanControl)initWithPlugin:(id)a3
{
  return [(ASDBooleanControl *)self initWithValue:0 isSettable:0 forElement:0 inScope:1735159650 withPlugin:a3 andObjectClassID:1953458028];
}

- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return [(ASDBooleanControl *)self initWithValue:0 isSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5 andObjectClassID:1953458028];
}

- (ASDBooleanControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  return [(ASDBooleanControl *)self initWithValue:0 isSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5 andObjectClassID:*(void *)&a6];
}

- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  return [(ASDBooleanControl *)self initWithValue:a3 isSettable:a4 forElement:*(void *)&a5 inScope:*(void *)&a6 withPlugin:a7 andObjectClassID:1953458028];
}

- (ASDBooleanControl)initWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7 andObjectClassID:(unsigned int)a8
{
  v21.receiver = self;
  v21.super_class = (Class)ASDBooleanControl;
  v10 = [(ASDControl *)&v21 initWithElement:*(void *)&a5 inScope:*(void *)&a6 withPlugin:a7 andObjectClassID:*(void *)&a8];
  v11 = v10;
  if (v10)
  {
    v10->_value = a3;
    v10->_settable = a4;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"%@.%@.%p", v13, v16, v11];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    valueQueue = v11->_valueQueue;
    v11->_valueQueue = (OS_dispatch_queue *)v18;
  }
  return v11;
}

- (unsigned)baseClass
{
  return 1953458028;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1650685548) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDBooleanControl;
  return -[ASDControl hasProperty:](&v4, sel_hasProperty_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1650685548) {
    return 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDBooleanControl;
  return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result = 0;
  if (a3 && a6 && a7)
  {
    if (a3->mSelector == 1650685548)
    {
      if (*a6 < 4)
      {
        return 0;
      }
      else
      {
        *(_DWORD *)a7 = [(ASDBooleanControl *)self value];
        *a6 = 4;
        return 1;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)ASDBooleanControl;
      return -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v11, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
    }
  }
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1650685548)
  {
    return [(ASDBooleanControl *)self isSettable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDBooleanControl;
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
  BOOL v15 = -[ASDBooleanControl hasProperty:](self, "hasProperty:");
  if (!v15) {
    return v15;
  }
  BOOL v15 = [(ASDBooleanControl *)self isPropertySettable:a3];
  if (!v15) {
    return v15;
  }
  if (a3->mSelector != 1650685548)
  {
    v18.receiver = self;
    v18.super_class = (Class)ASDBooleanControl;
    LOBYTE(v15) = [(ASDObject *)&v18 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
    return v15;
  }
  if (v10 != 4)
  {
LABEL_9:
    LOBYTE(v15) = 0;
    return v15;
  }
  BOOL v16 = *(_DWORD *)a7 != 0;
  LOBYTE(v15) = [(ASDBooleanControl *)self changeValue:v16];
  return v15;
}

- (BOOL)changeValue:(BOOL)a3
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  valueQueue = self->_valueQueue;
  char v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__ASDBooleanControl_setValue___block_invoke;
  block[3] = &unk_2647734E8;
  BOOL v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    int v7 = 0;
    uint64_t v6 = 0x676C6F626263766CLL;
    v5 = [(ASDObject *)self propertyChangedDelegate];
    [v5 changedProperty:&v6 forObject:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __30__ASDBooleanControl_setValue___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(*(void *)(result + 32) + 80) != *(unsigned __int8 *)(result + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 48);
  }
  return result;
}

- (BOOL)value
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __26__ASDBooleanControl_value__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__ASDBooleanControl_value__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

+ (id)muteControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a7;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v10 isSettable:v9 forElement:v8 inScope:v7 withPlugin:v11 andObjectClassID:1836414053];

  return v12;
}

+ (id)phantomPowerControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a7;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v10 isSettable:v9 forElement:v8 inScope:v7 withPlugin:v11 andObjectClassID:1885888878];

  return v12;
}

+ (id)invertControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a7;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v10 isSettable:v9 forElement:v8 inScope:v7 withPlugin:v11 andObjectClassID:1885893481];

  return v12;
}

+ (id)jackControlWithValue:(BOOL)a3 isSettable:(BOOL)a4 forElement:(unsigned int)a5 inScope:(unsigned int)a6 withPlugin:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v11 = a7;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v10 isSettable:v9 forElement:v8 inScope:v7 withPlugin:v11 andObjectClassID:1784767339];

  return v12;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDBooleanControl;
  id v6 = a3;
  uint64_t v7 = [(ASDControl *)&v11 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  if ([(ASDBooleanControl *)self isSettable]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Settable: %@\n", v6, v8, v11.receiver, v11.super_class];
  if ([(ASDBooleanControl *)self value]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  [v7 appendFormat:@"%@|    Value: %@\n", v6, v9];

  return v7;
}

- (id)driverClassName
{
  int v2 = [(ASDControl *)self objectClass];
  char v3 = @"AudioBooleanControl";
  if (v2 > 1885888877)
  {
    int v4 = 1936682094;
    uint64_t v12 = @"AudioLFEMuteControl";
    char v13 = @"AudioTalkbackControl";
    if (v2 != 1952541794) {
      char v13 = @"AudioBooleanControl";
    }
    if (v2 != 1937072749) {
      uint64_t v12 = v13;
    }
    if (v2 == 1936682095) {
      uint64_t v7 = @"AudioSoloControl";
    }
    else {
      uint64_t v7 = v12;
    }
    int v8 = 1885888878;
    BOOL v9 = @"AudioPhantomPowerControl";
    int v10 = 1885893481;
    objc_super v11 = @"AudioInvertControl";
  }
  else
  {
    int v4 = 1784767338;
    v5 = @"AudioListenbackControl";
    id v6 = @"AudioMuteControl";
    if (v2 != 1836414053) {
      id v6 = @"AudioBooleanControl";
    }
    if (v2 != 1819504226) {
      v5 = v6;
    }
    if (v2 == 1784767339) {
      uint64_t v7 = @"AudioJackControl";
    }
    else {
      uint64_t v7 = v5;
    }
    int v8 = 1668049264;
    BOOL v9 = @"AudioClipLightControl";
    int v10 = 1702259059;
    objc_super v11 = @"AudioTapEnableControl";
  }
  if (v2 == v10) {
    char v3 = v11;
  }
  if (v2 == v8) {
    char v3 = v9;
  }
  if (v2 <= v4) {
    return v3;
  }
  else {
    return v7;
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