@interface BKSTouchAuthenticationSpecification
+ (BOOL)supportsSecureCoding;
+ (id)buildSpecification:(id)a3;
+ (id)new;
+ (id)protobufSchema;
- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegion;
- (BKSTouchAuthenticationSpecification)init;
- (BKSTouchAuthenticationSpecification)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)displays;
- (NSString)description;
- (float)backgroundStatisticsFailingContrast;
- (float)backgroundStatisticsForeground;
- (float)backgroundStatisticsPassingContrast;
- (id)_init;
- (id)_initWithCopyOf:(id)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)initialSampleEvent;
- (unint64_t)authenticationMessageContext;
- (unint64_t)hash;
- (unint64_t)hitTestInformationMask;
- (unsigned)secureName;
- (unsigned)slotID;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSTouchAuthenticationSpecification

- (void).cxx_destruct
{
}

- (int64_t)initialSampleEvent
{
  return self->_initialSampleEvent;
}

- (unint64_t)hitTestInformationMask
{
  return self->_hitTestInformationMask;
}

- (float)backgroundStatisticsFailingContrast
{
  return self->_backgroundStatisticsFailingContrast;
}

- (float)backgroundStatisticsPassingContrast
{
  return self->_backgroundStatisticsPassingContrast;
}

- (float)backgroundStatisticsForeground
{
  return self->_backgroundStatisticsForeground;
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (unint64_t)authenticationMessageContext
{
  return self->_authenticationMessageContext;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (NSSet)displays
{
  return self->_displays;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  displays = self->_displays;
  id v5 = a3;
  id v6 = (id)[v5 appendObject:displays withName:@"displays"];
  id v7 = (id)[v5 appendUInt64:self->_slotID withName:@"slotID" format:1];
  id v8 = (id)[v5 appendUInt64:self->_secureName withName:@"secureName" format:1];
  id v9 = (id)[v5 appendUInt64:self->_backgroundStatisticsTopEdgeInset withName:@"backgroundStatisticsTopEdgeInset" format:1];
  id v10 = (id)[v5 appendUInt64:self->_backgroundStatisticsLeftEdgeInset withName:@"backgroundStatisticsLeftEdgeInset" format:1];
  id v11 = (id)[v5 appendUInt64:self->_backgroundStatisticsBottomEdgeInset withName:@"backgroundStatisticsBottomEdgeInset" format:1];
  id v12 = (id)[v5 appendUInt64:self->_backgroundStatisticsRightEdgeInset withName:@"backgroundStatisticsRightEdgeInset" format:1];
  id v13 = (id)[v5 appendFloat:@"backgroundStatisticsForeground" withName:self->_backgroundStatisticsForeground];
  id v14 = (id)[v5 appendFloat:@"backgroundStatisticsPassingContrast" withName:self->_backgroundStatisticsPassingContrast];
  id v15 = (id)[v5 appendFloat:@"backgroundStatisticsFailingContrast" withName:self->_backgroundStatisticsFailingContrast];
  id v16 = (id)[v5 appendUInt64:self->_authenticationMessageContext withName:@"authenticationMessageContext" format:1];
  v17 = NSStringFromBKSHIDEventHitTestLayerInformationMask(self->_hitTestInformationMask);
  [v5 appendString:v17 withName:@"hitTestInformationMask"];

  NSStringFromBKSTouchAuthenticationInitialSampleEvent(self->_initialSampleEvent);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendString:v18 withName:@"initialSampleEvent"];
}

- (id)_init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v4 = [NSString stringWithFormat:@"BKSTouchAuthenticationSpecification cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v5 = NSStringFromSelector(sel__init);
          id v6 = (objc_class *)objc_opt_class();
          id v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          id v10 = v5;
          __int16 v11 = 2114;
          id v12 = v7;
          __int16 v13 = 2048;
          id v14 = v1;
          __int16 v15 = 2114;
          id v16 = @"BKSTouchAuthenticationSpecification.m";
          __int16 v17 = 1024;
          int v18 = 73;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA4691CLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSTouchAuthenticationSpecification;
    result = objc_msgSendSuper2(&v8, sel_init);
    if (result) {
      *((void *)result + 8) = 1;
    }
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  displays = self->_displays;
  id v9 = v4;
  if (displays)
  {
    [v4 encodeObject:displays forKey:@"displays"];
    id v4 = v9;
  }
  [v4 encodeInt32:self->_slotID forKey:@"slotID"];
  [v9 encodeInt64:self->_authenticationMessageContext forKey:@"authenticationMessageContext"];
  [v9 encodeInt32:self->_secureName forKey:@"secureName"];
  [v9 encodeInt32:self->_backgroundStatisticsTopEdgeInset forKey:@"backgroundStatisticsTopEdgeInset"];
  [v9 encodeInt32:self->_backgroundStatisticsLeftEdgeInset forKey:@"backgroundStatisticsLeftEdgeInset"];
  [v9 encodeInt32:self->_backgroundStatisticsBottomEdgeInset forKey:@"backgroundStatisticsBottomEdgeInset"];
  [v9 encodeInt32:self->_backgroundStatisticsRightEdgeInset forKey:@"backgroundStatisticsRightEdgeInset"];
  *(float *)&double v6 = self->_backgroundStatisticsForeground;
  [v9 encodeFloat:@"backgroundStatisticsForeground" forKey:v6];
  *(float *)&double v7 = self->_backgroundStatisticsPassingContrast;
  [v9 encodeFloat:@"backgroundStatisticsPassingContrast" forKey:v7];
  *(float *)&double v8 = self->_backgroundStatisticsFailingContrast;
  [v9 encodeFloat:@"backgroundStatisticsFailingContrast" forKey:v8];
  [v9 encodeInteger:self->_hitTestInformationMask forKey:@"hitTestInformationMask"];
  [v9 encodeInteger:self->_initialSampleEvent forKey:@"initialSampleEvent"];
}

- (BKSTouchAuthenticationSpecification)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BKSTouchAuthenticationSpecification;
  id v5 = [(BKSTouchAuthenticationSpecification *)&v26 init];
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displays"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v6 = (NSSet *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v16 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v17 = *MEMORY[0x1E4F281F8];
            uint64_t v27 = *MEMORY[0x1E4F28588];
            int v18 = [NSString stringWithFormat:@"unexpected class decoded from display set: %@", objc_opt_class()];
            v28 = v18;
            __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
            v20 = [v16 errorWithDomain:v17 code:4866 userInfo:v19];
            [v4 failWithError:v20];

            __int16 v15 = 0;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    displays = v5->_displays;
    v5->_displays = v6;

    v5->_slotID = [v4 decodeInt32ForKey:@"slotID"];
    v5->_authenticationMessageContext = [v4 decodeInt64ForKey:@"authenticationMessageContext"];
    v5->_secureName = [v4 decodeInt32ForKey:@"secureName"];
    v5->_backgroundStatisticsTopEdgeInset = [v4 decodeInt32ForKey:@"backgroundStatisticsTopEdgeInset"];
    v5->_backgroundStatisticsLeftEdgeInset = [v4 decodeInt32ForKey:@"backgroundStatisticsLeftEdgeInset"];
    v5->_backgroundStatisticsBottomEdgeInset = [v4 decodeInt32ForKey:@"backgroundStatisticsBottomEdgeInset"];
    v5->_backgroundStatisticsRightEdgeInset = [v4 decodeInt32ForKey:@"backgroundStatisticsRightEdgeInset"];
    [v4 decodeFloatForKey:@"backgroundStatisticsForeground"];
    v5->_backgroundStatisticsForeground = v12;
    [v4 decodeFloatForKey:@"backgroundStatisticsPassingContrast"];
    v5->_backgroundStatisticsPassingContrast = v13;
    [v4 decodeFloatForKey:@"backgroundStatisticsFailingContrast"];
    v5->_backgroundStatisticsFailingContrast = v14;
    v5->_hitTestInformationMask = [v4 decodeIntegerForKey:@"hitTestInformationMask"];
    v5->_initialSampleEvent = [v4 decodeIntegerForKey:@"initialSampleEvent"];
  }
  __int16 v15 = v5;
LABEL_13:

  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableTouchAuthenticationSpecification alloc];
  return -[BKSTouchAuthenticationSpecification _initWithCopyOf:](v4, self);
}

- (id)_initWithCopyOf:(id)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    a1 = -[BKSTouchAuthenticationSpecification _init](a1);
    if (a1)
    {
      uint64_t v4 = [v3[1] copy];
      id v5 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v4;

      *((_DWORD *)a1 + 4) = *((_DWORD *)v3 + 4);
      *((void *)a1 + 3) = v3[3];
      *((_DWORD *)a1 + 5) = *((_DWORD *)v3 + 5);
      *((_WORD *)a1 + 16) = *((_WORD *)v3 + 16);
      *((_WORD *)a1 + 17) = *((_WORD *)v3 + 17);
      *((_WORD *)a1 + 18) = *((_WORD *)v3 + 18);
      *((_WORD *)a1 + 19) = *((_WORD *)v3 + 19);
      *((_DWORD *)a1 + 10) = *((_DWORD *)v3 + 10);
      *((_DWORD *)a1 + 11) = *((_DWORD *)v3 + 11);
      *((_DWORD *)a1 + 12) = *((_DWORD *)v3 + 12);
      *((void *)a1 + 7) = v3[7];
      *((void *)a1 + 8) = v3[8];
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [BKSTouchAuthenticationSpecification alloc];
  return -[BKSTouchAuthenticationSpecification _initWithCopyOf:](v4, self);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = BSEqualObjects()
      && v5[4] == self->_slotID
      && *((void *)v5 + 3) == self->_authenticationMessageContext
      && v5[5] == self->_secureName
      && *((unsigned __int16 *)v5 + 16) == self->_backgroundStatisticsTopEdgeInset
      && *((unsigned __int16 *)v5 + 17) == self->_backgroundStatisticsLeftEdgeInset
      && *((unsigned __int16 *)v5 + 18) == self->_backgroundStatisticsBottomEdgeInset
      && *((unsigned __int16 *)v5 + 19) == self->_backgroundStatisticsRightEdgeInset
      && *((void *)v5 + 7) == self->_hitTestInformationMask
      && *((void *)v5 + 8) == self->_initialSampleEvent;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_displays hash];
  id v4 = [NSNumber numberWithUnsignedInt:self->_slotID];
  uint64_t v5 = [v4 hash] ^ v3;

  BOOL v6 = [NSNumber numberWithUnsignedLongLong:self->_authenticationMessageContext];
  uint64_t v7 = [v6 hash];

  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_secureName];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];

  uint64_t v10 = [NSNumber numberWithUnsignedShort:self->_backgroundStatisticsTopEdgeInset];
  uint64_t v11 = [v10 hash];

  float v12 = [NSNumber numberWithUnsignedShort:self->_backgroundStatisticsLeftEdgeInset];
  uint64_t v13 = v11 ^ [v12 hash];

  float v14 = [NSNumber numberWithUnsignedShort:self->_backgroundStatisticsBottomEdgeInset];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];

  id v16 = [NSNumber numberWithUnsignedShort:self->_backgroundStatisticsRightEdgeInset];
  uint64_t v17 = [v16 hash];

  *(float *)&double v18 = self->_backgroundStatisticsForeground;
  __int16 v19 = [NSNumber numberWithFloat:v18];
  uint64_t v20 = v17 ^ [v19 hash];

  *(float *)&double v21 = self->_backgroundStatisticsPassingContrast;
  long long v22 = [NSNumber numberWithFloat:v21];
  uint64_t v23 = v20 ^ [v22 hash];

  *(float *)&double v24 = self->_backgroundStatisticsFailingContrast;
  long long v25 = [NSNumber numberWithFloat:v24];
  uint64_t v26 = v15 ^ v23 ^ [v25 hash];

  uint64_t v27 = [NSNumber numberWithUnsignedInteger:self->_hitTestInformationMask];
  uint64_t v28 = [v27 hash];

  v29 = [NSNumber numberWithInteger:self->_initialSampleEvent];
  unint64_t v30 = v26 ^ v28 ^ [v29 hash];

  unint64_t v31 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v30 ^ (v30 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v30 ^ (v30 >> 30))) >> 27));
  return v31 ^ (v31 >> 31);
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegion
{
  return *($BEA516A46C1BA1F84587E5D243A711F7 *)&self->_backgroundStatisticsTopEdgeInset;
}

- (BKSTouchAuthenticationSpecification)init
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate BKSTouchAuthenticationSpecification"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    float v12 = v7;
    __int16 v13 = 2048;
    float v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BKSTouchAuthenticationSpecification.m";
    __int16 v17 = 1024;
    int v18 = 62;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSTouchAuthenticationSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_4289];
}

void __53__BKSTouchAuthenticationSpecification_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addRepeatingField:"_displays" containsClass:objc_opt_class()];
  [v2 addField:"_slotID"];
  [v2 addField:"_authenticationMessageContext"];
  [v2 addField:"_secureName"];
  [v2 addField:"_backgroundStatisticsTopEdgeInset"];
  [v2 addField:"_backgroundStatisticsLeftEdgeInset"];
  [v2 addField:"_backgroundStatisticsBottomEdgeInset"];
  [v2 addField:"_backgroundStatisticsRightEdgeInset"];
  [v2 addField:"_backgroundStatisticsForeground"];
  [v2 addField:"_backgroundStatisticsPassingContrast"];
  [v2 addField:"_backgroundStatisticsFailingContrast"];
  [v2 addField:"_hitTestInformationMask"];
  [v2 addField:"_initialSampleEvent"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate BKSTouchAuthenticationSpecification"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    BOOL v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    float v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    id v16 = @"BKSTouchAuthenticationSpecification.m";
    __int16 v17 = 1024;
    int v18 = 67;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)buildSpecification:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  id v4 = -[BKSTouchAuthenticationSpecification _init]([BKSMutableTouchAuthenticationSpecification alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end