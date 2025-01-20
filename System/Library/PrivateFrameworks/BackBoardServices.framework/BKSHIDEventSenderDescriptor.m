@interface BKSHIDEventSenderDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)anyBuiltinTouchscreenDigitizer;
+ (id)anyDigitizer;
+ (id)build:(id)a3;
+ (id)protobufSchema;
+ (id)stylusOpaqueTouchDigitizer;
+ (id)wildcard;
- (BKSHIDEventDisplay)associatedDisplay;
- (BKSHIDEventSenderDescriptor)init;
- (BKSHIDEventSenderDescriptor)initWithCoder:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDescriptor:(id)a3 failureReason:(id *)a4;
- (NSString)description;
- (id)_initWithHardwareType:(int64_t)a3 associatedDisplay:(id)a4 authenticated:(BOOL)a5 primaryPage:(unsigned int)a6 primaryUsage:(unsigned int)a7 senderID:(unint64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForProtobufDecoding;
- (id)initFromPropertyList:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyListEncoded;
- (int64_t)hardwareType;
- (unint64_t)hash;
- (unint64_t)senderID;
- (unsigned)primaryPage;
- (unsigned)primaryUsage;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventSenderDescriptor

- (unint64_t)hash
{
  return [(BKSHIDEventDisplay *)self->_associatedDisplay hash] ^ self->_hardwareType ^ self->_primaryPage ^ self->_primaryUsage ^ (self->_senderID + self->_authenticated) ^ 0x2861;
}

- (void).cxx_destruct
{
}

- (BOOL)matchesDescriptor:(id)a3 failureReason:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v8 = [v6 senderID];
  if (v8 && v8 != self->_senderID)
  {
    if (!a4) {
      goto LABEL_31;
    }
    char v14 = 0;
    v15 = @"senderID does not match";
    goto LABEL_30;
  }
  if ([v7 isAuthenticated] && !self->_authenticated)
  {
    if (!a4) {
      goto LABEL_31;
    }
    char v14 = 0;
    v15 = @"not authenticated";
    goto LABEL_30;
  }
  uint64_t v9 = [v7 hardwareType];
  if (v9 && v9 != self->_hardwareType)
  {
    if (!a4) {
      goto LABEL_31;
    }
    char v14 = 0;
    v15 = @"hardware type does not match";
    goto LABEL_30;
  }
  int v10 = [v7 primaryPage];
  int v11 = [v7 primaryUsage];
  if (v10)
  {
    if (v10 == self->_primaryPage)
    {
      if (!v11 || v11 == self->_primaryUsage) {
        goto LABEL_13;
      }
      if (a4)
      {
        char v14 = 0;
        v15 = @"usage does not match";
        goto LABEL_30;
      }
LABEL_31:
      char v14 = 0;
      goto LABEL_32;
    }
    if (!a4) {
      goto LABEL_31;
    }
    char v14 = 0;
    v15 = @"page does not match";
LABEL_30:
    *a4 = v15;
    goto LABEL_32;
  }
LABEL_13:
  v12 = [v7 associatedDisplay];
  if (v12)
  {
    v13 = self->_associatedDisplay;
    char v14 = [(BKSHIDEventDisplay *)v13 isEqual:v12];
    if ((v14 & 1) == 0 && a4)
    {
      [NSString stringWithFormat:@"display does not match (%@ != %@)", v13, v12];
      char v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    char v14 = 1;
  }

LABEL_32:
  return v14;
}

- (BKSHIDEventDisplay)associatedDisplay
{
  return self->_associatedDisplay;
}

- (int64_t)hardwareType
{
  return self->_hardwareType;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryPage
{
  return self->_primaryPage;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    id v6 = v5;
    BOOL v7 = self->_hardwareType == v5[1]
      && self->_authenticated == *((unsigned __int8 *)v5 + 24)
      && BSEqualObjects()
      && self->_primaryPage == v6[7]
      && self->_primaryUsage == v6[8]
      && self->_senderID == *((void *)v6 + 5);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)initFromPropertyList:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BKSHIDEventSenderDescriptor;
  v5 = [(BKSHIDEventSenderDescriptor *)&v44 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"hardwareType"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = [v10 integerValue];
    v5->_hardwareType = v11;
    v12 = [v4 objectForKey:@"auth"];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    char v17 = [v16 BOOLValue];
    v5->_authenticated = v17;
    v18 = [v4 objectForKey:@"page"];
    uint64_t v19 = objc_opt_class();
    id v20 = v18;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
    id v22 = v21;

    unsigned int v23 = [v22 unsignedIntValue];
    v5->_primaryPage = v23;
    v24 = [v4 objectForKey:@"usage"];
    uint64_t v25 = objc_opt_class();
    id v26 = v24;
    if (v25)
    {
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    unsigned int v29 = [v28 unsignedIntValue];
    v5->_primaryUsage = v29;
    v30 = [v4 objectForKey:@"senderID"];
    uint64_t v31 = objc_opt_class();
    id v32 = v30;
    if (v31)
    {
      if (objc_opt_isKindOfClass()) {
        v33 = v32;
      }
      else {
        v33 = 0;
      }
    }
    else
    {
      v33 = 0;
    }
    id v34 = v33;

    uint64_t v35 = [v34 unsignedLongLongValue];
    v5->_senderID = v35;
    v36 = [v4 objectForKey:@"display"];
    uint64_t v37 = objc_opt_class();
    id v38 = v36;
    if (v37)
    {
      if (objc_opt_isKindOfClass()) {
        v39 = v38;
      }
      else {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
    }
    id v40 = v39;

    if (v40)
    {
      if ([v40 isEqual:@"<null>"])
      {
        uint64_t v41 = +[BKSHIDEventDisplay nullDisplay];
      }
      else
      {
        if ([v40 isEqual:@"<builtin>"]) {
          +[BKSHIDEventDisplay builtinDisplay];
        }
        else {
        uint64_t v41 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v40];
        }
      }
      associatedDisplay = v5->_associatedDisplay;
      v5->_associatedDisplay = (BKSHIDEventDisplay *)v41;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BKSHIDEventSenderDescriptor alloc];
  int64_t hardwareType = self->_hardwareType;
  associatedDisplay = self->_associatedDisplay;
  BOOL authenticated = self->_authenticated;
  uint64_t primaryPage = self->_primaryPage;
  uint64_t primaryUsage = self->_primaryUsage;
  unint64_t senderID = self->_senderID;
  return [(BKSHIDEventSenderDescriptor *)v4 _initWithHardwareType:hardwareType associatedDisplay:associatedDisplay authenticated:authenticated primaryPage:primaryPage primaryUsage:primaryUsage senderID:senderID];
}

- (id)_initWithHardwareType:(int64_t)a3 associatedDisplay:(id)a4 authenticated:(BOOL)a5 primaryPage:(unsigned int)a6 primaryUsage:(unsigned int)a7 senderID:(unint64_t)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v22 = NSString;
      unsigned int v23 = (objc_class *)[v16 classForCoder];
      if (!v23) {
        unsigned int v23 = (objc_class *)objc_opt_class();
      }
      v24 = NSStringFromClass(v23);
      uint64_t v25 = (objc_class *)objc_opt_class();
      id v26 = NSStringFromClass(v25);
      v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v24, v26];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v28 = NSStringFromSelector(a2);
        unsigned int v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138544642;
        id v34 = v28;
        __int16 v35 = 2114;
        v36 = v30;
        __int16 v37 = 2048;
        id v38 = self;
        __int16 v39 = 2114;
        id v40 = @"BKSHIDEventSenderDescriptor.m";
        __int16 v41 = 1024;
        int v42 = 85;
        __int16 v43 = 2114;
        objc_super v44 = v27;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA1E608);
    }
  }

  uint64_t v17 = objc_opt_class();
  if (v17 != objc_opt_class())
  {
    uint64_t v18 = objc_opt_class();
    if (v18 != objc_opt_class())
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:self file:@"BKSHIDEventSenderDescriptor.m" lineNumber:86 description:@"BKSHIDEventSenderDescriptor cannot be subclassed"];
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)BKSHIDEventSenderDescriptor;
  uint64_t v19 = [(BKSHIDEventSenderDescriptor *)&v32 init];
  id v20 = v19;
  if (v19)
  {
    v19->_int64_t hardwareType = a3;
    objc_storeStrong((id *)&v19->_associatedDisplay, a4);
    v20->_BOOL authenticated = a5;
    v20->_uint64_t primaryPage = a6;
    v20->_uint64_t primaryUsage = a7;
    v20->_unint64_t senderID = a8;
  }

  return v20;
}

- (BKSHIDEventSenderDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"hardwareType"];
  uint64_t v6 = [v4 decodeBoolForKey:@"authenticated"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"primaryPage"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"primaryUsage"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"senderID"];

  uint64_t v11 = [(BKSHIDEventSenderDescriptor *)self _initWithHardwareType:v5 associatedDisplay:v7 authenticated:v6 primaryPage:v8 primaryUsage:v9 senderID:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hardwareType = self->_hardwareType;
  id v5 = a3;
  [v5 encodeInteger:hardwareType forKey:@"hardwareType"];
  [v5 encodeBool:self->_authenticated forKey:@"authenticated"];
  [v5 encodeObject:self->_associatedDisplay forKey:@"display"];
  [v5 encodeInteger:self->_primaryPage forKey:@"primaryPage"];
  [v5 encodeInteger:self->_primaryUsage forKey:@"primaryUsage"];
  [v5 encodeInt64:self->_senderID forKey:@"senderID"];
}

- (id)initForProtobufDecoding
{
  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventSenderDescriptor;
  return [(BKSHIDEventSenderDescriptor *)&v3 init];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v15 = a3;
  unint64_t hardwareType = self->_hardwareType;
  if (hardwareType)
  {
    id v5 = NSStringFromBKSHIDEventHardwareType(hardwareType);
    [v15 appendString:v5 withName:@"hardwareType"];
  }
  unint64_t senderID = self->_senderID;
  if (senderID) {
    id v7 = (id)[v15 appendUInt64:senderID withName:@"senderID" format:1];
  }
  uint64_t primaryPage = self->_primaryPage;
  uint64_t v9 = v15;
  if (primaryPage)
  {
    id v10 = (id)[v15 appendUnsignedInteger:primaryPage withName:@"primaryPage" format:1];
    uint64_t v9 = v15;
  }
  uint64_t primaryUsage = self->_primaryUsage;
  if (primaryUsage)
  {
    id v12 = (id)[v15 appendUnsignedInteger:primaryUsage withName:@"primaryUsage" format:1];
    uint64_t v9 = v15;
  }
  id v13 = (id)[v9 appendObject:self->_associatedDisplay withName:@"display" skipIfNil:1];
  id v14 = (id)[v15 appendBool:self->_authenticated withName:@"authenticated" ifEqualTo:1];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableHIDEventSenderDescriptor alloc];
  int64_t hardwareType = self->_hardwareType;
  associatedDisplay = self->_associatedDisplay;
  BOOL authenticated = self->_authenticated;
  uint64_t primaryPage = self->_primaryPage;
  uint64_t primaryUsage = self->_primaryUsage;
  unint64_t senderID = self->_senderID;
  return [(BKSHIDEventSenderDescriptor *)v4 _initWithHardwareType:hardwareType associatedDisplay:associatedDisplay authenticated:authenticated primaryPage:primaryPage primaryUsage:primaryUsage senderID:senderID];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_11011 != -1) {
    dispatch_once(&protobufSchema_onceToken_11011, block);
  }
  v2 = (void *)protobufSchema_schema_11012;
  return v2;
}

uint64_t __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_106];
  uint64_t v2 = protobufSchema_schema_11012;
  protobufSchema_schema_11012 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_hardwareType"];
  [v2 addField:"_authenticated"];
  [v2 addField:"_associatedDisplay"];
  [v2 addField:"_primaryPage"];
  [v2 addField:"_primaryUsage"];
  [v2 addField:"_senderID"];
}

+ (id)stylusOpaqueTouchDigitizer
{
  if (stylusOpaqueTouchDigitizer_onceToken != -1) {
    dispatch_once(&stylusOpaqueTouchDigitizer_onceToken, &__block_literal_global_67);
  }
  id v2 = (void *)stylusOpaqueTouchDigitizer_descriptor;
  return v2;
}

uint64_t __57__BKSHIDEventSenderDescriptor_stylusOpaqueTouchDigitizer__block_invoke()
{
  uint64_t v0 = +[BKSHIDEventSenderDescriptor build:&__block_literal_global_69];
  uint64_t v1 = stylusOpaqueTouchDigitizer_descriptor;
  stylusOpaqueTouchDigitizer_descriptor = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __57__BKSHIDEventSenderDescriptor_stylusOpaqueTouchDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:65376 primaryUsage:4096];
}

+ (id)anyBuiltinTouchscreenDigitizer
{
  if (anyBuiltinTouchscreenDigitizer_onceToken != -1) {
    dispatch_once(&anyBuiltinTouchscreenDigitizer_onceToken, &__block_literal_global_63);
  }
  id v2 = (void *)anyBuiltinTouchscreenDigitizer_descriptor;
  return v2;
}

uint64_t __61__BKSHIDEventSenderDescriptor_anyBuiltinTouchscreenDigitizer__block_invoke()
{
  uint64_t v0 = +[BKSHIDEventSenderDescriptor build:&__block_literal_global_65];
  uint64_t v1 = anyBuiltinTouchscreenDigitizer_descriptor;
  anyBuiltinTouchscreenDigitizer_descriptor = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __61__BKSHIDEventSenderDescriptor_anyBuiltinTouchscreenDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPrimaryPage:13 primaryUsage:0];
  id v3 = +[BKSHIDEventDisplay builtinDisplay];
  [v2 setAssociatedDisplay:v3];
}

+ (id)anyDigitizer
{
  if (anyDigitizer_onceToken != -1) {
    dispatch_once(&anyDigitizer_onceToken, &__block_literal_global_58);
  }
  id v2 = (void *)anyDigitizer_descriptor;
  return v2;
}

uint64_t __43__BKSHIDEventSenderDescriptor_anyDigitizer__block_invoke()
{
  uint64_t v0 = +[BKSHIDEventSenderDescriptor build:&__block_literal_global_61];
  uint64_t v1 = anyDigitizer_descriptor;
  anyDigitizer_descriptor = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __43__BKSHIDEventSenderDescriptor_anyDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPrimaryPage:13 primaryUsage:0];
}

+ (id)wildcard
{
  if (wildcard_onceToken != -1) {
    dispatch_once(&wildcard_onceToken, &__block_literal_global_11021);
  }
  id v2 = (void *)wildcard_wildcard;
  return v2;
}

uint64_t __39__BKSHIDEventSenderDescriptor_wildcard__block_invoke()
{
  uint64_t v0 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  uint64_t v1 = wildcard_wildcard;
  wildcard_wildcard = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, BKSMutableHIDEventSenderDescriptor *))a3;
  id v4 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  v3[2](v3, v4);

  id v5 = (void *)[(BKSMutableHIDEventSenderDescriptor *)v4 copy];
  return v5;
}

- (id)propertyListEncoded
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_hardwareType)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v4 forKey:@"hardwareType"];
  }
  if (self->_authenticated) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"auth"];
  }
  associatedDisplay = self->_associatedDisplay;
  if (associatedDisplay)
  {
    if ([(BKSHIDEventDisplay *)associatedDisplay _isNullDisplay])
    {
      uint64_t v6 = @"<null>";
LABEL_10:
      [v3 setObject:v6 forKey:@"display"];
      goto LABEL_12;
    }
    if ([(BKSHIDEventDisplay *)self->_associatedDisplay _isBuiltinDisplay])
    {
      uint64_t v6 = @"<builtin>";
      goto LABEL_10;
    }
    id v7 = [(BKSHIDEventDisplay *)self->_associatedDisplay _hardwareIdentifier];
    [v3 setObject:v7 forKey:@"display"];
  }
LABEL_12:
  if (self->_primaryPage)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v8 forKey:@"page"];
  }
  if (self->_primaryUsage)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v9 forKey:@"usage"];
  }
  if (self->_senderID)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v3 setObject:v10 forKey:@"senderID"];
  }
  return v3;
}

- (BKSHIDEventSenderDescriptor)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BKSHIDEventSenderDescriptor.m" lineNumber:80 description:@"-init is not allowed on BKSHIDEventSenderDescriptor"];

  return 0;
}

@end