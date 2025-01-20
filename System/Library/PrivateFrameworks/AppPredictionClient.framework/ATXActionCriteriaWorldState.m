@interface ATXActionCriteriaWorldState
- (ATXActionCriteriaWorldState)init;
- (BOOL)airDropCapability;
- (BOOL)airplaneMode;
- (BOOL)coreRoutineCapability;
- (BOOL)doNotDisturb;
- (BOOL)greenTeaDeviceCapability;
- (BOOL)internalBuild;
- (BOOL)lockScreen;
- (BOOL)telephonyCapability;
- (NSDate)now;
- (id)initFake;
- (id)propertyWhitelist;
- (void)setAirDropCapability:(BOOL)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setCoreRoutineCapability:(BOOL)a3;
- (void)setDoNotDisturb:(BOOL)a3;
- (void)setGreenTeaDeviceCapability:(BOOL)a3;
- (void)setInternalBuild:(BOOL)a3;
- (void)setLockScreen:(BOOL)a3;
- (void)setNow:(id)a3;
- (void)setTelephonyCapability:(BOOL)a3;
@end

@implementation ATXActionCriteriaWorldState

- (ATXActionCriteriaWorldState)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXActionCriteriaWorldState;
  return [(ATXActionCriteriaWorldState *)&v3 init];
}

- (id)initFake
{
  v2 = [(ATXActionCriteriaWorldState *)self init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_fake = 1;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:0.0];
    now = v3->_now;
    v3->_now = (NSDate *)v4;
  }
  return v3;
}

- (NSDate)now
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 1) != 0)
  {
    p_now = &self->_now;
  }
  else
  {
    uint64_t v3 = objc_opt_new();
    now = self->_now;
    p_now = &self->_now;
    *p_now = (NSDate *)v3;
  }
  v6 = *p_now;

  return v6;
}

- (void)setNow:(id)a3
{
  uint64_t v4 = (NSDate *)[a3 copy];
  now = self->_now;
  self->_now = v4;

  *(_WORD *)((char *)&self->_flags + 1) |= 1u;
}

- (BOOL)doNotDisturb
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_fake && (*(_WORD *)((char *)&self->_flags + 1) & 2) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F93650] currentModeSemanticType];
    uint64_t v4 = __atxlog_handle_default();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        int v8 = 134217984;
        uint64_t v9 = [v3 integerValue];
        _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Criteria: focus event type: %lu", (uint8_t *)&v8, 0xCu);
      }

      if (![v3 integerValue])
      {
        char flags = *(unsigned char *)&self->_flags | 1;
LABEL_14:
        *(unsigned char *)&self->_char flags = flags;
        *(_WORD *)((char *)&self->_flags + 1) |= 2u;

        return flags & 1;
      }
    }
    else
    {
      if (v5)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Criteria: focus event nil", (uint8_t *)&v8, 2u);
      }
    }
    char flags = *(unsigned char *)&self->_flags & 0xFE;
    goto LABEL_14;
  }
  char flags = (char)self->_flags;
  return flags & 1;
}

- (void)setDoNotDisturb:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
  *(_WORD *)((char *)&self->_flags + 1) |= 2u;
}

- (BOOL)telephonyCapability
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 4) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 1) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"telephony");
    if (MGBool) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 4u;
  }
  return MGBool;
}

- (void)setTelephonyCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 4u;
}

- (BOOL)airDropCapability
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 8) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 2) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"AirDropCapability");
    if (MGBool) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 8u;
  }
  return MGBool;
}

- (void)setAirDropCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 8u;
}

- (BOOL)airplaneMode
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x10) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 3) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"AirplaneMode");
    if (MGBool) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x10u;
  }
  return MGBool;
}

- (void)setAirplaneMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x10u;
}

- (BOOL)coreRoutineCapability
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x20) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 4) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"CoreRoutineCapability");
    if (MGBool) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x20u;
  }
  return MGBool;
}

- (void)setCoreRoutineCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x20u;
}

- (BOOL)greenTeaDeviceCapability
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x40) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 5) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"green-tea");
    if (MGBool) {
      char v4 = 32;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x40u;
  }
  return MGBool;
}

- (void)setGreenTeaDeviceCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x40u;
}

- (BOOL)internalBuild
{
  if (self->_fake || (*(_WORD *)((char *)&self->_flags + 1) & 0x80) != 0)
  {
    return (*(unsigned char *)&self->_flags >> 6) & 1;
  }
  else
  {
    int MGBool = getMGBool(@"InternalBuild");
    if (MGBool) {
      char v4 = 64;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xBF | v4;
    *(_WORD *)((char *)&self->_flags + 1) |= 0x80u;
  }
  return MGBool;
}

- (void)setInternalBuild:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xBF | v3;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x80u;
}

- (BOOL)lockScreen
{
  if (self->_fake) {
    return *(unsigned char *)&self->_flags < 0;
  }
  __int16 v3 = *(_WORD *)((char *)&self->_flags + 1);
  if ((v3 & 0x100) != 0) {
    return *(unsigned char *)&self->_flags < 0;
  }
  BOOL result = 0;
  *(unsigned char *)&self->_flags &= ~0x80u;
  *(_WORD *)((char *)&self->_flags + 1) = v3 | 0x100;
  return result;
}

- (void)setLockScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
  *(_WORD *)((char *)&self->_flags + 1) |= 0x100u;
}

- (id)propertyWhitelist
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"now", @"doNotDisturb", @"telephonyCapability", @"airDropCapability", @"airplaneMode", @"coreRoutineCapability", @"greenTeaDeviceCapability", @"internalBuild", @"lockScreen", 0);
}

- (void).cxx_destruct
{
}

@end