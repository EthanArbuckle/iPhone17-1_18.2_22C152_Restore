@interface BKSHIDUISensorCharacteristics
+ (BKSHIDUISensorCharacteristics)new;
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (BKSHIDUISensorCharacteristics)init;
- (BKSHIDUISensorCharacteristics)initWithCoder:(id)a3;
- (BOOL)hasDiscreteProximitySensor;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (int64_t)suggestedSystemApertureGracePeriodForScreenOff;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDUISensorCharacteristics

- (int64_t)suggestedSystemApertureGracePeriodForScreenOff
{
  return self->_suggestedSystemApertureGracePeriodForScreenOff;
}

- (BOOL)hasDiscreteProximitySensor
{
  return self->_hasDiscreteProximitySensor;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__BKSHIDUISensorCharacteristics_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __62__BKSHIDUISensorCharacteristics_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"hasDiscreteProximitySensor"];
  return (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 8) withName:@"suggestedSystemApertureGracePeriodForScreenOff"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopy
{
  v3 = objc_alloc_init(BKSMutableHIDUISensorCharacteristics);
  [(BKSMutableHIDUISensorCharacteristics *)v3 setHasDiscreteProximitySensor:self->_hasDiscreteProximitySensor];
  [(BKSMutableHIDUISensorCharacteristics *)v3 setSuggestedSystemApertureGracePeriodForScreenOff:self->_suggestedSystemApertureGracePeriodForScreenOff];
  return v3;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_11225];
}

void __47__BKSHIDUISensorCharacteristics_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_hasDiscreteProximitySensor"];
  [v2 addField:"_suggestedSystemApertureGracePeriodForScreenOff"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BKSHIDUISensorCharacteristics)new
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDUISensorCharacteristics"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSHIDUISensorCharacteristics.m";
    __int16 v17 = 1024;
    int v18 = 34;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDUISensorCharacteristics *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[BKSHIDUISensorCharacteristics allocWithZone:a3] _init];
  *((unsigned char *)result + 16) = self->_hasDiscreteProximitySensor;
  *((void *)result + 1) = self->_suggestedSystemApertureGracePeriodForScreenOff;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  BOOL v9 = v8
    && *((unsigned __int8 *)v8 + 16) == self->_hasDiscreteProximitySensor
    && v8[1] == self->_suggestedSystemApertureGracePeriodForScreenOff;

  return v9;
}

- (unint64_t)hash
{
  if (self->_suggestedSystemApertureGracePeriodForScreenOff)
  {
    id v2 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v2 hash];
  }
  return BSHashPurifyNS();
}

- (void)encodeWithCoder:(id)a3
{
  BOOL hasDiscreteProximitySensor = self->_hasDiscreteProximitySensor;
  id v5 = a3;
  [v5 encodeBool:hasDiscreteProximitySensor forKey:@"hasDiscreteProximitySensor"];
  [v5 encodeInteger:self->_suggestedSystemApertureGracePeriodForScreenOff forKey:@"suggestedSystemApertureGracePeriodForScreenOff"];
}

- (BKSHIDUISensorCharacteristics)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDUISensorCharacteristics;
  id v3 = a3;
  id v4 = [(BKSHIDUISensorCharacteristics *)&v7 init];
  v4->_BOOL hasDiscreteProximitySensor = objc_msgSend(v3, "decodeBoolForKey:", @"hasDiscreteProximitySensor", v7.receiver, v7.super_class);
  uint64_t v5 = [v3 decodeIntegerForKey:@"suggestedSystemApertureGracePeriodForScreenOff"];

  v4->_suggestedSystemApertureGracePeriodForScreenOff = v5;
  return v4;
}

- (id)_init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      objc_super v7 = [NSString stringWithFormat:@"BKSHIDUISensorCharacteristics cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        BOOL v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138544642;
        __int16 v13 = v8;
        __int16 v14 = 2114;
        __int16 v15 = v10;
        __int16 v16 = 2048;
        __int16 v17 = self;
        __int16 v18 = 2114;
        __int16 v19 = @"BKSHIDUISensorCharacteristics.m";
        __int16 v20 = 1024;
        int v21 = 40;
        __int16 v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA6A2B8);
    }
  }
  self->_suggestedSystemApertureGracePeriodForScreenOff = 0x7FFFFFFFFFFFFFFFLL;
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDUISensorCharacteristics;
  return [(BKSHIDUISensorCharacteristics *)&v11 init];
}

- (BKSHIDUISensorCharacteristics)init
{
  uint64_t v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDUISensorCharacteristics"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BKSHIDUISensorCharacteristics.m";
    __int16 v17 = 1024;
    int v18 = 29;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (BKSHIDUISensorCharacteristics *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end