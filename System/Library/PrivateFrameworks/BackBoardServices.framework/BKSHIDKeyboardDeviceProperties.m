@interface BKSHIDKeyboardDeviceProperties
+ (BKSHIDKeyboardDeviceProperties)new;
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)protobufSchema;
- (BKSHIDKeyboardDeviceProperties)init;
- (BKSHIDKeyboardDeviceProperties)initWithCoder:(id)a3;
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)globeKeyLabelHasGlobeSymbol;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)exclusivityIdentifier;
- (NSString)language;
- (NSString)layout;
- (NSString)transport;
- (id)_init;
- (id)_initCopyFromOriginal:(id)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)subinterfaceID;
- (unint64_t)hash;
- (unint64_t)senderID;
- (unsigned)countryCode;
- (unsigned)standardType;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDKeyboardDeviceProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return self->_globeKeyLabelHasGlobeSymbol;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return self->_capsLockKeyHasLanguageSwitchLabel;
}

- (int64_t)subinterfaceID
{
  return self->_subinterfaceID;
}

- (unsigned)standardType
{
  return self->_standardType;
}

- (unsigned)countryCode
{
  return self->_countryCode;
}

- (NSString)exclusivityIdentifier
{
  return self->_exclusivityIdentifier;
}

- (NSString)layout
{
  return self->_layout;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)transport
{
  return self->_transport;
}

- (unint64_t)senderID
{
  return self->_senderID;
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
        v4 = [NSString stringWithFormat:@"BKSHIDKeyboardDeviceProperties cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v5 = NSStringFromSelector(sel__init);
          v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          v16 = @"BKSHIDKeyboardDeviceProperties.m";
          __int16 v17 = 1024;
          int v18 = 51;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v4 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA5B97CLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDKeyboardDeviceProperties;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v14 = a3;
  id v4 = (id)[v14 appendUInt64:self->_senderID withName:@"senderID" format:1];
  id v5 = (id)[v14 appendObject:self->_transport withName:@"transport"];
  id v6 = (id)[v14 appendObject:self->_language withName:@"language"];
  id v7 = (id)[v14 appendObject:self->_layout withName:@"layout"];
  exclusivityIdentifier = self->_exclusivityIdentifier;
  if (exclusivityIdentifier) {
    [v14 appendString:exclusivityIdentifier withName:@"exclusivityIdentifier"];
  }
  id v9 = (id)[v14 appendInteger:self->_countryCode withName:@"countryCode"];
  id v10 = (id)[v14 appendInteger:self->_standardType withName:@"standardType"];
  id v11 = (id)[v14 appendInteger:self->_subinterfaceID withName:@"subinterfaceID"];
  id v12 = (id)[v14 appendBool:self->_capsLockKeyHasLanguageSwitchLabel withName:@"capsLockKeyHasLanguageSwitchLabel"];
  id v13 = (id)[v14 appendBool:self->_globeKeyLabelHasGlobeSymbol withName:@"globeKeyLabelHasGlobeSymbol"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableHIDKeyboardDeviceProperties alloc];
  return -[BKSHIDKeyboardDeviceProperties _initCopyFromOriginal:](v4, self);
}

- (id)_initCopyFromOriginal:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)BKSHIDKeyboardDeviceProperties;
    id v4 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = *((void *)v3 + 1);
      uint64_t v5 = [*((id *)v3 + 2) copy];
      id v6 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v5;

      uint64_t v7 = [*((id *)v3 + 3) copy];
      objc_super v8 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v7;

      uint64_t v9 = [*((id *)v3 + 4) copy];
      id v10 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v9;

      uint64_t v11 = [*((id *)v3 + 5) copy];
      id v12 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v11;

      *((unsigned char *)a1 + 64) = *((unsigned char *)v3 + 64);
      *((_DWORD *)a1 + 12) = *((_DWORD *)v3 + 12);
      *((void *)a1 + 7) = *((void *)v3 + 7);
      *((unsigned char *)a1 + 65) = *((unsigned char *)v3 + 65);
      *((unsigned char *)a1 + 66) = *((unsigned char *)v3 + 66);
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSHIDKeyboardDeviceProperties alloc];
  return -[BKSHIDKeyboardDeviceProperties _initCopyFromOriginal:](v4, self);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && v4[1] == self->_senderID
    && BSEqualObjects()
    && BSEqualObjects()
    && BSEqualObjects()
    && *((unsigned __int8 *)v4 + 64) == self->_countryCode
    && *((_DWORD *)v4 + 12) == self->_standardType
    && v4[7] == self->_subinterfaceID
    && *((unsigned __int8 *)v4 + 65) == self->_capsLockKeyHasLanguageSwitchLabel
    && *((unsigned __int8 *)v4 + 66) == self->_globeKeyLabelHasGlobeSymbol;

  return v5;
}

- (unint64_t)hash
{
  unint64_t senderID = self->_senderID;
  NSUInteger v4 = [(NSString *)self->_transport hash] ^ senderID;
  NSUInteger v5 = [(NSString *)self->_language hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_layout hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_exclusivityIdentifier hash];
  objc_super v8 = [NSNumber numberWithUnsignedChar:self->_countryCode];
  uint64_t v9 = [v8 hash];

  id v10 = [NSNumber numberWithUnsignedInt:self->_standardType];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];

  id v12 = [NSNumber numberWithInteger:self->_subinterfaceID];
  unint64_t v13 = v11 ^ [v12 hash];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeInt64:self->_senderID forKey:@"senderID"];
  transport = self->_transport;
  if (transport) {
    [v9 encodeObject:transport forKey:@"transport"];
  }
  language = self->_language;
  if (language) {
    [v9 encodeObject:language forKey:@"language"];
  }
  layout = self->_layout;
  NSUInteger v7 = v9;
  if (layout)
  {
    [v9 encodeObject:layout forKey:@"layout"];
    NSUInteger v7 = v9;
  }
  exclusivityIdentifier = self->_exclusivityIdentifier;
  if (exclusivityIdentifier)
  {
    [v9 encodeObject:exclusivityIdentifier forKey:@"exclusivityIdentifier"];
    NSUInteger v7 = v9;
  }
  [v7 encodeInteger:self->_countryCode forKey:@"countryCode"];
  [v9 encodeInteger:self->_standardType forKey:@"standardType"];
  [v9 encodeInteger:self->_subinterfaceID forKey:@"subinterfaceID"];
  [v9 encodeBool:self->_capsLockKeyHasLanguageSwitchLabel forKey:@"capsLockKeyHasLanguageSwitchLabel"];
  [v9 encodeBool:self->_globeKeyLabelHasGlobeSymbol forKey:@"globeKeyLabelHasGlobeSymbol"];
}

- (BKSHIDKeyboardDeviceProperties)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BKSHIDKeyboardDeviceProperties;
  id v3 = a3;
  NSUInteger v4 = [(BKSHIDKeyboardDeviceProperties *)&v15 init];
  v4->_unint64_t senderID = objc_msgSend(v3, "decodeInt64ForKey:", @"senderID", v15.receiver, v15.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"transport"];
  transport = v4->_transport;
  v4->_transport = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
  language = v4->_language;
  v4->_language = (NSString *)v7;

  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"layout"];
  layout = v4->_layout;
  v4->_layout = (NSString *)v9;

  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"exclusivityIdentifier"];
  exclusivityIdentifier = v4->_exclusivityIdentifier;
  v4->_exclusivityIdentifier = (NSString *)v11;

  v4->_countryCode = [v3 decodeIntegerForKey:@"countryCode"];
  v4->_standardType = [v3 decodeIntegerForKey:@"standardType"];
  v4->_subinterfaceID = [v3 decodeIntegerForKey:@"subinterfaceID"];
  v4->_capsLockKeyHasLanguageSwitchLabel = [v3 decodeBoolForKey:@"capsLockKeyHasLanguageSwitchLabel"];
  char v13 = [v3 decodeBoolForKey:@"globeKeyLabelHasGlobeSymbol"];

  v4->_globeKeyLabelHasGlobeSymbol = v13;
  return v4;
}

- (BKSHIDKeyboardDeviceProperties)init
{
  NSUInteger v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDKeyboardDeviceProperties"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    NSUInteger v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDKeyboardDeviceProperties.m";
    __int16 v17 = 1024;
    int v18 = 40;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDKeyboardDeviceProperties *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_8529];
}

void __48__BKSHIDKeyboardDeviceProperties_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_senderID"];
  [v2 addField:"_transport"];
  [v2 addField:"_language"];
  [v2 addField:"_layout"];
  [v2 addField:"_exclusivityIdentifier"];
  [v2 addField:"_countryCode"];
  [v2 addField:"_standardType"];
  [v2 addField:"_subinterfaceID"];
  [v2 addField:"_capsLockKeyHasLanguageSwitchLabel"];
  [v2 addField:"_globeKeyLabelHasGlobeSymbol"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BKSHIDKeyboardDeviceProperties)new
{
  NSUInteger v4 = [NSString stringWithFormat:@"cannot directly allocate BKSHIDKeyboardDeviceProperties"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    NSUInteger v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSHIDKeyboardDeviceProperties.m";
    __int16 v17 = 1024;
    int v18 = 45;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDKeyboardDeviceProperties *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSHIDKeyboardDeviceProperties _init]([BKSMutableHIDKeyboardDeviceProperties alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end