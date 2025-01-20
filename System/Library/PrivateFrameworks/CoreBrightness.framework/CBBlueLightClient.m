@interface CBBlueLightClient
+ (BOOL)supportsBlueLightReduction;
- (BOOL)getBlueLightStatus:(id *)a3;
- (BOOL)getCCT:(float *)a3;
- (BOOL)getCCTRange:(id *)a3;
- (BOOL)getDefaultCCTRange:(id *)a3;
- (BOOL)getStrength:(float *)a3;
- (BOOL)getWarningCCT:(float *)a3;
- (BOOL)getWarningStrength:(float *)a3;
- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4;
- (BOOL)setActive:(BOOL)a3;
- (BOOL)setCCT:(float)a3 commit:(BOOL)a4;
- (BOOL)setCCT:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5;
- (BOOL)setCCTRange:(id *)a3;
- (BOOL)setEnabled:(BOOL)a3;
- (BOOL)setEnabled:(BOOL)a3 withOption:(int)a4;
- (BOOL)setMode:(int)a3;
- (BOOL)setSchedule:(id *)a3;
- (BOOL)setStrength:(float)a3 commit:(BOOL)a4;
- (BOOL)setStrength:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5;
- (BOOL)supported;
- (CBBlueLightClient)init;
- (CBBlueLightClient)initWithClientObj:(id)a3;
- (void)dealloc;
- (void)disableNotifications;
- (void)enableNotifications;
- (void)setStatusNotificationBlock:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)suspendNotifications:(BOOL)a3;
- (void)suspendNotifications:(BOOL)a3 force:(BOOL)a4;
@end

@implementation CBBlueLightClient

+ (BOOL)supportsBlueLightReduction
{
  return CBU_IsNightShiftSupported() & 1;
}

- (CBBlueLightClient)initWithClientObj:(id)a3
{
  v10 = self;
  SEL v9 = a2;
  v8 = (BrightnessSystemClient *)a3;
  if (!a3) {
    return 0;
  }
  v7.receiver = v10;
  v7.super_class = (Class)CBBlueLightClient;
  v10 = [(CBBlueLightClient *)&v7 init];
  if (v10)
  {
    v10->bsc = v8;
    v3 = v10->bsc;
    id v6 = [(BrightnessSystemClient *)v10->bsc copyPropertyForKey:@"SupportedColorFX"];
    if (v6)
    {
      char v4 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"SupportsNightMode"), "BOOLValue");
      v10->_supported = v4 & 1;
    }
    v10->ownsClient = 0;
  }
  return v10;
}

- (CBBlueLightClient)init
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)CBBlueLightClient;
  v8 = [(CBBlueLightClient *)&v6 init];
  if (!v8) {
    return v8;
  }
  v2 = objc_alloc_init(BrightnessSystemClient);
  v8->bsc = v2;
  if (v8->bsc)
  {
    id v5 = [(BrightnessSystemClient *)v8->bsc copyPropertyForKey:@"SupportedColorFX"];
    if (v5)
    {
      char v3 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"SupportsNightMode"), "BOOLValue");
      v8->_supported = v3 & 1;
    }
    v8->ownsClient = 1;
    return v8;
  }
  return 0;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  objc_sync_enter(self);
  if (v5->bsc)
  {
    if (v5->ownsClient) {
      -[BrightnessSystemClient registerNotificationBlock:forProperties:](v5->bsc, "registerNotificationBlock:forProperties:", 0);
    }
  }
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)CBBlueLightClient;
  [(CBBlueLightClient *)&v3 dealloc];
}

- (BOOL)setActive:(BOOL)a3
{
  BOOL v7 = a3;
  char v6 = 0;
  objc_sync_enter(self);
  if (self->bsc)
  {
    id v5 = (void *)[objc_alloc(NSNumber) initWithInt:v7];
    if (v5)
    {
      char v6 = [(BrightnessSystemClient *)self->bsc setProperty:v5 forKey:@"AutoBlueReductionEnabled"];
    }
  }
  objc_sync_exit(self);
  return v6 & 1;
}

- (BOOL)setEnabled:(BOOL)a3 withOption:(int)a4
{
  BOOL v11 = a3;
  char v9 = 0;
  objc_sync_enter(self);
  v8 = (void *)[objc_alloc(NSNumber) initWithInt:v11];
  if (v8)
  {
    BOOL v7 = (void *)[objc_alloc(NSNumber) initWithInt:a4];
    if (v7)
    {
      char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v8, @"BlueReductionEnabledValue", v7, @"BlueReductionEnabledOption", 0);
      if (v6)
      {
        char v9 = [(BrightnessSystemClient *)self->bsc setProperty:v6 forKey:@"BlueReductionEnabled"];
      }
    }
  }
  objc_sync_exit(self);
  return v9 & 1;
}

- (BOOL)setEnabled:(BOOL)a3
{
  return [(CBBlueLightClient *)self setEnabled:a3 withOption:0];
}

- (BOOL)setMode:(int)a3
{
  v10 = self;
  SEL v9 = a2;
  unsigned int v8 = a3;
  char v7 = 0;
  objc_sync_enter(self);
  id v6 = (id)[objc_alloc(NSNumber) initWithInt:v8];
  if (v6)
  {
    char v7 = [(BrightnessSystemClient *)v10->bsc setProperty:v6 forKey:@"BlueReductionMode"];
  }
  if ((v7 & 1) != 0 && v8 == 1)
  {
    memset(__b, 0, 0x28uLL);
    char v7 = [(CBBlueLightClient *)v10 getBlueLightStatus:__b];
    if (v7) {
      char v7 = __b[2] & 1;
    }
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (BOOL)setSchedule:(id *)a3
{
  BOOL v9 = 0;
  if (a3)
  {
    objc_sync_enter(self);
    unsigned int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    if (v8)
    {
      char v7 = (void *)[objc_alloc(NSNumber) initWithInt:a3->var1.var0];
      if (v7)
      {
        [v8 setObject:v7 forKey:@"DayStartHour"];
      }
      id v6 = (void *)[objc_alloc(NSNumber) initWithInt:a3->var1.var1];
      if (v6)
      {
        [v8 setObject:v6 forKey:@"DayStartMinute"];
      }
      id v5 = (void *)[objc_alloc(NSNumber) initWithInt:a3->var0.var0];
      if (v5)
      {
        [v8 setObject:v5 forKey:@"NightStartHour"];
      }
      SEL v4 = (void *)[objc_alloc(NSNumber) initWithInt:a3->var0.var1];
      if (v4)
      {
        [v8 setObject:v4 forKey:@"NightStartMinute"];
      }
      if ([v8 count] == 4) {
        BOOL v9 = [(BrightnessSystemClient *)self->bsc setProperty:v8 forKey:@"BlueLightReductionSchedule"];
      }
    }
    objc_sync_exit(self);
  }
  return v9;
}

- (BOOL)parseStatusDictionary:(id)a3 intoStruct:(id *)a4
{
  char v8 = 0;
  a4->var0 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"AutoBlueReductionEnabled"), "intValue") != 0;
  a4->var6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionAvailable"), "intValue") != 0;
  BOOL v6 = 0;
  if (a4->var6) {
    BOOL v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionEnabled"), "intValue") != 0;
  }
  a4->var1 = v6;
  if (a4->var6) {
    int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionMode"), "intValue");
  }
  else {
    int v5 = 0;
  }
  a4->var3 = v5;
  a4->var2 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueReductionSunScheduleAllowed"), "intValue") != 0;
  char v7 = (void *)[a3 objectForKey:@"BlueLightReductionSchedule"];
  if (v7)
  {
    a4->var4.var0.var0 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"NightStartHour"), "intValue");
    a4->var4.var0.var1 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"NightStartMinute"), "intValue");
    a4->var4.var1.var0 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"DayStartHour"), "intValue");
    a4->var4.var1.var1 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"DayStartMinute"), "intValue");
    char v8 = 1;
  }
  a4->var5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"BlueLightReductionDisableFlags"), "unsignedLongValue");
  return v8 & 1;
}

- (BOOL)getBlueLightStatus:(id *)a3
{
  v10 = self;
  SEL v9 = a2;
  char v8 = a3;
  char v7 = 0;
  objc_sync_enter(self);
  if (v8)
  {
    id v6 = 0;
    id v6 = [(BrightnessSystemClient *)v10->bsc copyPropertyForKey:@"CBBlueReductionStatus"];
    if (v6)
    {
      memset(__b, 0, 0x28uLL);
      char v7 = [(CBBlueLightClient *)v10 parseStatusDictionary:v6 intoStruct:__b];

      if (v7) {
        memcpy(v8, __b, sizeof($370FFBF569F04E7BFA4699F08AF8A162));
      }
    }
  }
  objc_sync_exit(self);
  return v7 & 1;
}

- (void)disableNotifications
{
  self->notificationActive = 0;
}

- (void)enableNotifications
{
  self->notificationActive = 1;
}

void __40__CBBlueLightClient_enableNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = a1;
  v15 = a2;
  uint64_t v14 = a3;
  uint64_t v13 = a1;
  if (([a2 isEqualToString:@"CBBlueReductionStatus"] & 1) != 0
    && (*(unsigned char *)(*(void *)(a1 + 32) + 25) & 1) != 0
    && *(void *)(*(void *)(a1 + 32) + 16))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      memset(__b, 0, sizeof(__b));
      [*(id *)(a1 + 32) parseStatusDictionary:v14 intoStruct:__b];
      queue = dispatch_get_global_queue(25, 0);
      uint64_t v5 = MEMORY[0x1E4F143A8];
      int v6 = -1073741824;
      int v7 = 0;
      char v8 = __40__CBBlueLightClient_enableNotifications__block_invoke_2;
      SEL v9 = &unk_1E6219418;
      uint64_t v10 = *(void *)(a1 + 32);
      memcpy(v11, __b, sizeof(v11));
      dispatch_async(queue, &v5);
    }
  }
}

uint64_t __40__CBBlueLightClient_enableNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  memset(__b, 0, sizeof(__b));
  memcpy(__b, (const void *)(a1 + 40), sizeof(__b));
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  return objc_sync_exit(obj);
}

- (void)suspendNotifications:(BOOL)a3 force:(BOOL)a4
{
  BOOL v6 = a3;
  BOOL v5 = a4;
  objc_sync_enter(self);
  if (self->notificationActive)
  {
    if (v6)
    {
      [(CBBlueLightClient *)self disableNotifications];
    }
    else if (self->clientBlock && v5)
    {
      [(CBBlueLightClient *)self enableNotifications];
    }
  }
  else if (!v6 && self->clientBlock)
  {
    [(CBBlueLightClient *)self enableNotifications];
  }
  objc_sync_exit(self);
}

- (void)setStatusNotificationBlock:(id)a3
{
  if (self->clientBlock)
  {

    self->clientBlock = 0;
  }
  if (a3)
  {
    self->clientBlock = (id)[a3 copy];
    [(CBBlueLightClient *)self suspendNotifications:0 force:1];
  }
  else
  {
    [(CBBlueLightClient *)self suspendNotifications:1 force:1];
  }
  objc_sync_exit(self);
}

- (void)suspendNotifications:(BOOL)a3
{
}

- (BOOL)getDefaultCCTRange:(id *)a3
{
  BOOL v8 = 0;
  if (self->rangeSet)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v7 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"BlueLightReductionCCTRange"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count] == 3)
      {
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "floatValue");
        self->defaultCctRange.minCCT = v3;
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 1), "floatValue");
        self->defaultCctRange.midCCT = v4;
        objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "floatValue");
        self->defaultCctRange.maxCCT = v5;
        self->rangeSet = 1;
        BOOL v8 = 1;
      }
    }
  }
  if (v8)
  {
    if (a3)
    {
      *(void *)&a3->var0 = *(void *)&self->defaultCctRange.minCCT;
      a3->var2 = self->defaultCctRange.midCCT;
    }
    if (!self->rangeOverridden)
    {
      *(void *)&self->cctRange.minCCT = *(void *)&self->defaultCctRange.minCCT;
      self->cctRange.midCCT = self->defaultCctRange.midCCT;
    }
  }
  return v8;
}

- (BOOL)getCCT:(float *)a3
{
  BOOL v7 = 0;
  id v6 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"BlueLightReductionCCTTargetKey"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = (void *)[v6 objectForKey:@"BlueLightReductionCCTTargetValue"];
      if (v5)
      {
        [v5 floatValue];
        if (a3) {
          *(_DWORD *)a3 = v3;
        }
        BOOL v7 = 1;
      }
    }
  }
  return v7;
}

- (BOOL)setCCT:(float)a3 commit:(BOOL)a4
{
  LODWORD(v4) = -1.0;
  return [(CBBlueLightClient *)self setCCT:a4 withPeriod:*(double *)&a3 commit:v4];
}

- (BOOL)setCCT:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5
{
  v22 = self;
  SEL v21 = a2;
  float v20 = a3;
  float v19 = a4;
  BOOL v18 = a5;
  char v17 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  char v17 = [(CBBlueLightClient *)self getDefaultCCTRange:&v15];
  if ((v17 & 1) == 0) {
    return v17 & 1;
  }
  float v20 = fmaxf(v20, *(float *)&v15);
  float v20 = fminf(v20, *((float *)&v15 + 1));
  if (v19 < 0.0) {
    float v19 = -1.0;
  }
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = v20;
  id v14 = (id)[v5 initWithFloat:v6];
  id v7 = objc_alloc(NSNumber);
  *(float *)&double v8 = v19;
  id v13 = (id)[v7 initWithFloat:v8];
  id v9 = objc_alloc(NSNumber);
  id v12 = (id)[v9 initWithInt:v18];
  if (v14)
  {
    if (v13)
    {
      if (v12)
      {
        id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
        if (v11)
        {
          [v11 setObject:v14 forKey:@"BlueLightReductionCCTTargetValue"];
          [v11 setObject:v13 forKey:@"BlueLightReductionCCTTargetPeriod"];
          [v11 setObject:v12 forKey:@"BlueLightReductionCCTTargetCommit"];
          char v17 = [(BrightnessSystemClient *)v22->bsc setProperty:v11 forKey:@"BlueLightReductionCCTTargetKey"];
        }
      }
    }
  }
  if (v14) {

  }
  if (v13) {
  if (v12)
  }

  return v17 & 1;
}

- (BOOL)getCCTRange:(id *)a3
{
  if (!self->rangeOverridden) {
    return [(CBBlueLightClient *)self getDefaultCCTRange:a3];
  }
  if (a3) {
    *($5D5450AFC9C28DABAF6756483996F5B2 *)a3 = self->cctRange;
  }
  return 1;
}

- (BOOL)setCCTRange:(id *)a3
{
  id v11 = self;
  SEL v10 = a2;
  id v9 = a3;
  uint64_t v7 = 0;
  int v8 = 0;
  BOOL v6 = 0;
  if (!a3) {
    return v6;
  }
  BOOL v6 = [(CBBlueLightClient *)v11 getDefaultCCTRange:&v7];
  if (v6)
  {
    if (v9->var1 > *((float *)&v7 + 1)
      || v9->var0 < *(float *)&v7
      || v9->var1 <= v9->var0
      || v9->var2 <= v9->var0
      || v9->var2 >= v9->var1)
    {
      return 0;
    }
    int v3 = v11;
    double v4 = v9;
    *(void *)&v11->cctRange.minCCT = *(void *)&v9->var0;
    v3->cctRange.midCCT = v4->var2;
    v11->rangeOverridden = 1;
    return v6;
  }
  return 0;
}

- (BOOL)getStrength:(float *)a3
{
  id v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  char v10 = 0;
  float v9 = 0.0;
  char v10 = [(CBBlueLightClient *)self getCCT:&v9];
  if (!v10) {
    return 0;
  }
  uint64_t v7 = 0;
  float v8 = 0.0;
  char v10 = [(CBBlueLightClient *)v13 getCCTRange:&v7];
  if (!v10) {
    return 0;
  }
  if (v9 < v8)
  {
    float v4 = 0.5 * (float)(v8 - v9) / (float)(v8 - *(float *)&v7) + 0.5;
    float v6 = fminf(v4, 1.0);
  }
  else
  {
    float v3 = 0.5 * (float)(*((float *)&v7 + 1) - v9) / (float)(*((float *)&v7 + 1) - v8);
    float v6 = fmaxf(v3, 0.0);
  }
  if (v11) {
    *id v11 = v6;
  }
  return v10 & 1;
}

- (BOOL)setStrength:(float)a3 commit:(BOOL)a4
{
  LODWORD(v4) = -1.0;
  return [(CBBlueLightClient *)self setStrength:a4 withPeriod:*(double *)&a3 commit:v4];
}

- (BOOL)setStrength:(float)a3 withPeriod:(float)a4 commit:(BOOL)a5
{
  int v16 = self;
  SEL v15 = a2;
  float v14 = a3;
  float v13 = a4;
  BOOL v12 = a5;
  char v11 = 0;
  uint64_t v9 = 0;
  float v10 = 0.0;
  char v11 = [(CBBlueLightClient *)self getCCTRange:&v9];
  if ((v11 & 1) == 0) {
    return v11 & 1;
  }
  float v14 = fmaxf(v14, 0.0);
  float v14 = fminf(v14, 1.0);
  if (v14 > 0.5)
  {
    float v7 = v14 - 0.5;
    float v14 = v7;
    double v5 = (float)(v10 - *(float *)&v9);
    double v6 = v10 - 2.0 * v7 * v5;
  }
  else
  {
    double v5 = (float)(*((float *)&v9 + 1) - v10);
    double v6 = *((float *)&v9 + 1) - 2.0 * v14 * v5;
  }
  *(float *)&double v6 = v6;
  *(float *)&double v5 = v13;
  return [(CBBlueLightClient *)v16 setCCT:v12 withPeriod:v6 commit:v5];
}

- (BOOL)getWarningCCT:(float *)a3
{
  BOOL v6 = 0;
  id v5 = [(BrightnessSystemClient *)self->bsc copyPropertyForKey:@"BlueLightReductionCCTWarningKey"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 floatValue];
      if (a3) {
        *(_DWORD *)a3 = v3;
      }
      BOOL v6 = 1;
    }
  }
  return v6;
}

- (BOOL)getWarningStrength:(float *)a3
{
  float v13 = self;
  SEL v12 = a2;
  char v11 = a3;
  char v10 = 0;
  float v9 = 0.0;
  if (a3) {
    *char v11 = 0.5;
  }
  char v10 = [(CBBlueLightClient *)v13 getWarningCCT:&v9];
  if (!v10) {
    return 0;
  }
  uint64_t v7 = 0;
  float v8 = 0.0;
  char v10 = [(CBBlueLightClient *)v13 getCCTRange:&v7];
  if (!v10) {
    return 0;
  }
  if (v9 < v8)
  {
    float v4 = 0.5 * (float)(v8 - v9) / (float)(v8 - *(float *)&v7) + 0.5;
    float v6 = fminf(v4, 1.0);
  }
  else
  {
    float v3 = 0.5 * (float)(*((float *)&v7 + 1) - v9) / (float)(*((float *)&v7 + 1) - v8);
    float v6 = fmaxf(v3, 0.0);
  }
  if (v11) {
    *char v11 = v6;
  }
  return v10 & 1;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

@end