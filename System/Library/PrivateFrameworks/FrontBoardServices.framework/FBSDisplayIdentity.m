@interface FBSDisplayIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)expectsSecureRendering;
- (BOOL)isAirPlayDisplay;
- (BOOL)isCarDisplay;
- (BOOL)isCarInstrumentsDisplay;
- (BOOL)isContinuityDisplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isMainDisplay;
- (BOOL)isMainRootDisplay;
- (BOOL)isMusicOnlyDisplay;
- (BOOL)isRestrictedAirPlayDisplay;
- (BOOL)isRootIdentity;
- (BOOL)isUIKitMainLike;
- (BOOL)isiPodOnlyDisplay;
- (FBSDisplayIdentity)init;
- (FBSDisplayIdentity)initWithCoder:(id)a3;
- (FBSDisplayIdentity)initWithXPCDictionary:(id)a3;
- (FBSDisplayIdentity)rootIdentity;
- (NSString)debugDescription;
- (NSString)description;
- (id)_initWithType:(int64_t)a3 UIKitMainLike:(BOOL)a4 displayID:(unsigned int)a5 connectionType:(int64_t)a6 connectionSeed:(unsigned int)a7 pid:(int)a8 external:(BOOL)a9 uniqueIdentifier:(id)a10 secure:(BOOL)a11 root:(id)a12;
- (id)uniqueIdentifier;
- (int)pid;
- (int64_t)connectionType;
- (int64_t)type;
- (unint64_t)hash;
- (unsigned)connectionSeed;
- (unsigned)displayID;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSDisplayIdentity

- (FBSDisplayIdentity)rootIdentity
{
  if (self->_rootIdentity) {
    self = self->_rootIdentity;
  }
  return self;
}

- (BOOL)isExternal
{
  return self->_external;
}

- (BOOL)isCarDisplay
{
  return self->_type == 3;
}

- (BOOL)expectsSecureRendering
{
  return self->_secure;
}

- (BOOL)isContinuityDisplay
{
  return self->_type == 8;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  unint64_t v4 = self->_secure + 67 * type;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    unint64_t v4 = [(NSString *)uniqueIdentifier hash] + 67 * v4;
    int64_t type = self->_type;
  }
  if (type)
  {
    unint64_t v4 = self->_connectionSeed + 67 * (self->_displayID + 67 * v4);
    if (type == 1) {
      return self->_pid + 67 * v4;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentity, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (BOOL)isMainDisplay
{
  return self->_type == 0;
}

- (BOOL)isMainRootDisplay
{
  BOOL v3 = [(FBSDisplayIdentity *)self isRootIdentity];
  if (v3)
  {
    LOBYTE(v3) = [(FBSDisplayIdentity *)self isMainDisplay];
  }
  return v3;
}

- (BOOL)isRootIdentity
{
  return self->_rootIdentity == 0;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FBSDisplayIdentity *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_type == v4->_type
      && self->_mainLike == v4->_mainLike
      && self->_displayID == v4->_displayID
      && self->_connectionSeed == v4->_connectionSeed
      && self->_pid == v4->_pid
      && self->_external == v4->_external)
    {
      BSEqualObjects();
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    xpc_dictionary_set_int64(v4, (const char *)[@"type" UTF8String], self->_type);
    xpc_dictionary_set_int64(xdict, (const char *)[@"connectionType" UTF8String], self->_connectionType);
    if (self->_type)
    {
      if (self->_mainLike) {
        xpc_dictionary_set_BOOL(xdict, (const char *)[@"mainLike" UTF8String], 1);
      }
      xpc_dictionary_set_uint64(xdict, (const char *)[@"displayID" UTF8String], self->_displayID);
      xpc_dictionary_set_uint64(xdict, (const char *)[@"connectionSeed" UTF8String], self->_connectionSeed);
      if (self->_type == 1 && self->_pid >= 1) {
        xpc_dictionary_set_int64(xdict, (const char *)[@"pid" UTF8String], self->_pid);
      }
    }
    if (self->_external) {
      xpc_dictionary_set_BOOL(xdict, (const char *)[@"external" UTF8String], 1);
    }
    if (self->_uniqueIdentifier)
    {
      [@"uniqueID" UTF8String];
      BSSerializeStringToXPCDictionaryWithKey();
    }
    if (self->_secure) {
      xpc_dictionary_set_BOOL(xdict, (const char *)[@"secure" UTF8String], 1);
    }
    id v4 = xdict;
    if (self->_rootIdentity)
    {
      [@"root" UTF8String];
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
  }
}

- (FBSDisplayIdentity)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = xpc_dictionary_get_value(v4, (const char *)[@"type" UTF8String]);
    v6 = v5;
    v7 = (objc_class *)MEMORY[0x1E4F145C0];
    if (v5 && object_getClass(v5) == v7) {
      int64_t value = xpc_int64_get_value(v6);
    }
    else {
      int64_t value = -1;
    }
    v10 = xpc_dictionary_get_value(v4, (const char *)[@"connectionType" UTF8String]);
    v11 = v10;
    if (v10 && object_getClass(v10) == v7) {
      xpc_int64_get_value(v11);
    }
    if (value)
    {
      xpc_dictionary_get_BOOL(v4, (const char *)[@"mainLike" UTF8String]);
      xpc_dictionary_get_uint64(v4, (const char *)[@"displayID" UTF8String]);
      xpc_dictionary_get_uint64(v4, (const char *)[@"connectionSeed" UTF8String]);
      if (value == 1) {
        xpc_dictionary_get_int64(v4, (const char *)[@"pid" UTF8String]);
      }
    }
    xpc_dictionary_get_BOOL(v4, (const char *)[@"external" UTF8String]);
    [@"uniqueID" UTF8String];
    BSDeserializeStringFromXPCDictionaryWithKey();
  }
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  v9 = (FBSDisplayIdentity *)[(FBSDisplayIdentity *)self _initWithType:-1 UIKitMainLike:0 displayID:0 connectionType:-1 connectionSeed:0 pid:0 external:v13 uniqueIdentifier:0 secure:v14 root:0];

  return v9;
}

- (id)_initWithType:(int64_t)a3 UIKitMainLike:(BOOL)a4 displayID:(unsigned int)a5 connectionType:(int64_t)a6 connectionSeed:(unsigned int)a7 pid:(int)a8 external:(BOOL)a9 uniqueIdentifier:(id)a10 secure:(BOOL)a11 root:(id)a12
{
  id v18 = a10;
  id v19 = a12;
  uint64_t v20 = objc_opt_class();
  if (v20 != objc_opt_class())
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"FBSDisplay.m" lineNumber:41 description:@"this class cannot be subclassed"];
  }
  v31.receiver = self;
  v31.super_class = (Class)FBSDisplayIdentity;
  v21 = [(FBSDisplayIdentity *)&v31 init];
  v22 = v21;
  if (v21)
  {
    unsigned int v23 = 0;
    v21->_displayID = a5;
    v21->_int64_t type = a3;
    v21->_connectionType = a6;
    if (a3 && a3 != 7) {
      unsigned int v23 = a7;
    }
    v21->_mainLike = a4;
    int v24 = a8 & ~(a8 >> 31);
    if (a3 != 1) {
      int v24 = 0;
    }
    v21->_connectionSeed = v23;
    v21->_pid = v24;
    v21->_external = a9;
    uint64_t v25 = [v18 copy];
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v25;

    v22->_secure = a11;
    objc_storeStrong((id *)&v22->_rootIdentity, a12);
  }

  return v22;
}

- (BOOL)isUIKitMainLike
{
  return self->_mainLike;
}

- (NSString)description
{
  BOOL v3 = FBSDisplayTypeDescription(self->_type);
  id v4 = v3;
  int64_t type = self->_type;
  if (!type)
  {
    if (self->_external)
    {
      uint64_t v7 = [v3 stringByAppendingString:@"-External"];
      goto LABEL_9;
    }
LABEL_10:
    int64_t type = self->_type;
    goto LABEL_11;
  }
  if (self->_mainLike)
  {
    uint64_t v6 = [v3 stringByAppendingString:@".main"];

    int64_t type = self->_type;
    id v4 = (void *)v6;
  }
  if (type == 1)
  {
    if (self->_pid >= 1)
    {
      uint64_t v7 = [v4 stringByAppendingFormat:@"(%i)", self->_pid];
LABEL_9:
      v8 = (void *)v7;

      id v4 = v8;
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  if (type)
  {
    uint64_t v9 = [v4 stringByAppendingFormat:@"[%u-%u]", self->_displayID, self->_connectionSeed];

    id v4 = (void *)v9;
  }
  if (self->_secure)
  {
    uint64_t v10 = [v4 stringByAppendingString:@"+Secure"];

    id v4 = (void *)v10;
  }
  if (self->_uniqueIdentifier)
  {
    uint64_t v11 = [v4 stringByAppendingFormat:@"+<%@>", self->_uniqueIdentifier];

    id v4 = (void *)v11;
  }

  return (NSString *)v4;
}

- (BOOL)isCarInstrumentsDisplay
{
  return self->_type == 6;
}

- (FBSDisplayIdentity)init
{
  id v4 = [NSString stringWithFormat:@"init is not allowed"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSDisplay.m";
    __int16 v16 = 1024;
    int v17 = 27;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unsigned)connectionSeed
{
  return self->_connectionSeed;
}

- (BOOL)isAirPlayDisplay
{
  return self->_type == 1;
}

- (BOOL)isRestrictedAirPlayDisplay
{
  return self->_type == 1 && self->_pid > 0;
}

- (BOOL)isiPodOnlyDisplay
{
  return self->_type == 4;
}

- (BOOL)isMusicOnlyDisplay
{
  return self->_type == 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v19 = self;
  if ([v4 containsValueForKey:@"type"]) {
    uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  }
  else {
    uint64_t v5 = -1;
  }
  if (![v4 containsValueForKey:@"connectionType"])
  {
    uint64_t v18 = -1;
    if (v5) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v6 = 1;
    uint64_t v7 = 1;
    goto LABEL_13;
  }
  uint64_t v18 = [v4 decodeIntegerForKey:@"connectionType"];
  if (!v5) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = [v4 decodeBoolForKey:@"mainLike"];
  uint64_t v7 = [v4 decodeInt32ForKey:@"displayID"];
  if (v5 == 7)
  {
    uint64_t v8 = 0;
LABEL_12:
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [v4 decodeInt32ForKey:@"connectionSeed"];
  if (v5 != 1) {
    goto LABEL_12;
  }
  uint64_t v9 = [v4 decodeInt32ForKey:@"pid"];
LABEL_13:
  char v10 = [v4 decodeBoolForKey:@"external"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
  char v12 = [v4 decodeBoolForKey:@"secure"];
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"root"];
  LOBYTE(v17) = v12;
  LOBYTE(v16) = v10;
  __int16 v14 = [(FBSDisplayIdentity *)v19 _initWithType:v5 UIKitMainLike:v6 displayID:v7 connectionType:v18 connectionSeed:v8 pid:v9 external:v16 uniqueIdentifier:v11 secure:v17 root:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInteger:self->_type forKey:@"type"];
  [v8 encodeInteger:self->_connectionType forKey:@"connectionType"];
  if (self->_type)
  {
    id v4 = v8;
    if (self->_mainLike)
    {
      [v8 encodeBool:1 forKey:@"mainLike"];
      id v4 = v8;
    }
    [v4 encodeInt32:self->_displayID forKey:@"displayID"];
    [v8 encodeInt32:self->_connectionSeed forKey:@"connectionSeed"];
    if (self->_type == 1 && self->_pid >= 1) {
      [v8 encodeInt32:forKey:];
    }
  }
  if (self->_external) {
    [v8 encodeBool:1 forKey:@"external"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v6 = v8;
  if (uniqueIdentifier)
  {
    [v8 encodeObject:uniqueIdentifier forKey:@"uniqueID"];
    uint64_t v6 = v8;
  }
  if (self->_secure)
  {
    [v8 encodeBool:1 forKey:@"secure"];
    uint64_t v6 = v8;
  }
  rootIdentity = self->_rootIdentity;
  if (rootIdentity)
  {
    [v8 encodeObject:rootIdentity forKey:@"root"];
    uint64_t v6 = v8;
  }
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FBSDisplayIdentity *)self description];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (int)pid
{
  return self->_pid;
}

@end