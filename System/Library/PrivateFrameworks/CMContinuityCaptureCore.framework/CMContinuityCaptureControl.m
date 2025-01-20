@interface CMContinuityCaptureControl
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion;
- (CMContinuityCaptureControl)initWithCoder:(id)a3;
- (CMContinuityCaptureControl)initWithDictionaryRepresentation:(id)a3;
- (CMContinuityCaptureControl)initWithName:(id)a3 attributes:(id)a4 entity:(int64_t)a5 minimumSupportedVersion:(id *)a6 value:(id)a7;
- (NSDictionary)attributes;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)value;
- (int64_t)entity;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CMContinuityCaptureControl

- (CMContinuityCaptureControl)initWithName:(id)a3 attributes:(id)a4 entity:(int64_t)a5 minimumSupportedVersion:(id *)a6 value:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMContinuityCaptureControl;
  v16 = [(CMContinuityCaptureControl *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_attributes, a4);
    v17->_entity = a5;
    long long v18 = *(_OWORD *)&a6->var0;
    v17->_minimumSupportedVersion.patch = a6->var2;
    *(_OWORD *)&v17->_minimumSupportedVersion.major = v18;
    [(CMContinuityCaptureControl *)v17 setValue:v15];
    v19 = v17;
  }

  return v17;
}

- (CMContinuityCaptureControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureControl;
  v5 = [(CMContinuityCaptureControl *)&v15 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = v5->_name;
  v5->_name = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"class"];
  v9 = v5->_class;
  v5->_class = (NSString *)v8;

  v5->_entity = [v4 decodeInt64ForKey:@"entity"];
  v5->_minimumSupportedVersion.major = [v4 decodeInt64ForKey:@"minimumSupportedVersionMajor"];
  v5->_minimumSupportedVersion.minor = [v4 decodeInt64ForKey:@"minimumSupportedVersionMinor"];
  v5->_minimumSupportedVersion.patch = [v4 decodeInt64ForKey:@"minimumSupportedVersionPatch"];
  if (v5->_class)
  {
    v10 = v5;
    objc_sync_enter(v10);
    if ([(NSString *)v5->_class isEqualToString:@"CVPixelBufferRef"]) {
      [v4 decodeCVPixelBufferForKey:@"value" expectSourceMedia:1];
    }
    else {
    uint64_t v11 = [v4 decodePropertyListForKey:@"value"];
    }
    id value = v10->_value;
    v10->_id value = (id)v11;

    objc_sync_exit(v10);
    id v13 = v10;
  }
  else
  {
LABEL_8:
    id v13 = 0;
  }

  return v13;
}

- (CMContinuityCaptureControl)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"name"];
  if (!v5)
  {
    uint64_t v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:](v6, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_20;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"attributes"];
  v7 = [v4 objectForKeyedSubscript:@"entity"];
  if (!v7)
  {
    uint64_t v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:](v8, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [v7 integerValue];
  v10 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMajor"];

  if (v10)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMajor"];
    uint64_t v12 = (int)[v11 intValue];
    id v13 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionMinor"];

    uint64_t v14 = (int)[v13 intValue];
    v10 = [v4 objectForKeyedSubscript:@"minimumSupportedVersionPatch"];

    uint64_t v15 = (int)[v10 intValue];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v12 = 1;
  }
  v46[0] = v12;
  v46[1] = v14;
  v46[2] = v15;
  self = [(CMContinuityCaptureControl *)self initWithName:v5 attributes:v6 entity:v9 minimumSupportedVersion:v46 value:0];
  v16 = [v4 objectForKeyedSubscript:@"class"];
  v17 = self->_class;
  self->_class = v16;

  if (!self->_class) {
    goto LABEL_10;
  }
  long long v18 = [v4 objectForKeyedSubscript:@"value"];

  if (!v18)
  {
    v38 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureControl initWithDictionaryRepresentation:](v38, v39, v40, v41, v42, v43, v44, v45);
    }

LABEL_19:
LABEL_20:
    v22 = 0;
    goto LABEL_11;
  }
  if (![(NSString *)self->_class isEqualToString:@"CVPixelBufferRef"])
  {
    v19 = self;
    objc_sync_enter(v19);
    uint64_t v20 = [v4 objectForKeyedSubscript:@"value"];
    id value = v19->_value;
    v19->_id value = (id)v20;

    objc_sync_exit(v19);
  }
LABEL_10:
  self = self;

  v22 = self;
LABEL_11:

  return v22;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  id v4 = [NSNumber numberWithInteger:self->_entity];
  [v3 setObject:v4 forKeyedSubscript:@"entity"];

  attributes = self->_attributes;
  if (attributes) {
    [v3 setObject:attributes forKeyedSubscript:@"attributes"];
  }
  uint64_t v6 = self->_class;
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"class"];
    if (![(NSString *)self->_class isEqualToString:@"CVPixelBufferRef"])
    {
      v7 = self;
      objc_sync_enter(v7);
      [v3 setObject:v7->_value forKeyedSubscript:@"value"];
      objc_sync_exit(v7);
    }
  }
  uint64_t v8 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.major];
  [v3 setObject:v8 forKeyedSubscript:@"minimumSupportedVersionMajor"];

  uint64_t v9 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.minor];
  [v3 setObject:v9 forKeyedSubscript:@"minimumSupportedVersionMinor"];

  v10 = [NSNumber numberWithInteger:self->_minimumSupportedVersion.patch];
  [v3 setObject:v10 forKeyedSubscript:@"minimumSupportedVersionPatch"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CMContinuityCaptureControl *)self name];
  [v7 encodeObject:v4 forKey:@"name"];

  objc_msgSend(v7, "encodeInt64:forKey:", -[CMContinuityCaptureControl entity](self, "entity"), @"entity");
  [v7 encodeObject:self->_class forKey:@"class"];
  BOOL v5 = [(NSString *)self->_class isEqualToString:@"CVPixelBufferRef"];
  uint64_t v6 = [(CMContinuityCaptureControl *)self value];
  if (v5) {
    [v7 encodeCVPixelBuffer:v6 forKey:@"value"];
  }
  else {
    [v7 encodeObject:v6 forKey:@"value"];
  }

  [v7 encodeInt64:self->_minimumSupportedVersion.major forKey:@"minimumSupportedVersionMajor"];
  [v7 encodeInt64:self->_minimumSupportedVersion.minor forKey:@"minimumSupportedVersionMinor"];
  [v7 encodeInt64:self->_minimumSupportedVersion.patch forKey:@"minimumSupportedVersionPatch"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  objc_sync_enter(v3);
  id v4 = v3->_value;
  objc_sync_exit(v3);

  BOOL v5 = [CMContinuityCaptureControl alloc];
  int64_t entity = v3->_entity;
  attributes = v3->_attributes;
  name = v3->_name;
  long long v11 = *(_OWORD *)&v3->_minimumSupportedVersion.major;
  int64_t patch = v3->_minimumSupportedVersion.patch;
  uint64_t v9 = [(CMContinuityCaptureControl *)v5 initWithName:name attributes:attributes entity:entity minimumSupportedVersion:&v11 value:v4];

  return v9;
}

- (NSString)debugDescription
{
  v3 = [(CMContinuityCaptureControl *)self name];
  int v4 = [v3 isEqualToString:@"kCMContinuityCaptureControlDebugInfo"];

  BOOL v5 = NSString;
  uint64_t v6 = [(CMContinuityCaptureControl *)self name];
  int64_t v7 = [(CMContinuityCaptureControl *)self entity];
  if (v4)
  {
    uint64_t v8 = self->_class;
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
    v10 = [v5 stringWithFormat:@"%@ entity:%u %@ minimumSupportedVersion: %@", v6, v7, v8, v9];
  }
  else
  {
    uint64_t v9 = [(CMContinuityCaptureControl *)self value];
    long long v11 = self->_class;
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", self->_minimumSupportedVersion.major, self->_minimumSupportedVersion.minor, self->_minimumSupportedVersion.patch);
    v10 = [v5 stringWithFormat:@"%@ entity:%u value:%@ %@ minimumSupportedVersion: %@", v6, v7, v9, v11, v12];
  }
  return (NSString *)v10;
}

- (NSString)description
{
  v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureControl *)self debugDescription];
  int64_t v7 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)value
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_value;
  objc_sync_exit(v2);

  return v3;
}

- (void)setValue:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      int64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = self->_class;
      self->_class = v7;
LABEL_8:

LABEL_9:
      uint64_t v9 = self;
      objc_sync_enter(v9);
      objc_storeStrong(&v9->_value, a3);
      objc_sync_exit(v9);

      goto LABEL_10;
    }
    CFTypeID v10 = CFGetTypeID(v5);
    if (v10 == CVPixelBufferGetTypeID())
    {
      uint64_t v8 = self->_class;
      self->_class = (NSString *)@"CVPixelBufferRef";
      goto LABEL_8;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v12 = CMContinuityCaptureLog(0);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v13)
      {
        int v17 = 138412546;
        long long v18 = self;
        __int16 v19 = 2112;
        uint64_t v20 = objc_opt_class();
        uint64_t v14 = "%@ Unhandled value object type %@";
        uint64_t v15 = v12;
        uint32_t v16 = 22;
LABEL_18:
        _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, v16);
      }
    }
    else if (v13)
    {
      int v17 = 138412290;
      long long v18 = self;
      uint64_t v14 = "%@ Unhandled value unknown type";
      uint64_t v15 = v12;
      uint32_t v16 = 12;
      goto LABEL_18;
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedVersion
{
  *($93270A8783F91AF9136665ABBDC0A449 *)retstr = ($93270A8783F91AF9136665ABBDC0A449)self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_class, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end