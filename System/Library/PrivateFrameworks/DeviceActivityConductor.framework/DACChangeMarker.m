@interface DACChangeMarker
+ (BOOL)supportsSecureCoding;
+ (id)missingMarker;
- (BOOL)_isEqualToChangeMarker:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DACChangeMarker)init;
- (DACChangeMarker)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (id)description;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACChangeMarker

- (DACChangeMarker)init
{
  v7.receiver = self;
  v7.super_class = (Class)DACChangeMarker;
  v2 = [(DACChangeMarker *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    uuid = v3->_uuid;
    v3->_uuid = (NSUUID *)v4;
  }
  return v3;
}

+ (id)missingMarker
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (qword_2687715C8 != -1) {
    dispatch_once(&qword_2687715C8, &__block_literal_global_0);
  }
  v2 = DACLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    uint64_t v6 = _MergedGlobals;
    _os_log_error_impl(&dword_2330F4000, v2, OS_LOG_TYPE_ERROR, "Change Marker missing, using %{public}@", (uint8_t *)&v5, 0xCu);
  }

  v3 = (void *)_MergedGlobals;

  return v3;
}

uint64_t __32__DACChangeMarker_missingMarker__block_invoke()
{
  v0 = objc_alloc_init(DACChangeMarker);
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;

  uint64_t v2 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&UUID_NULL];
  *(void *)(_MergedGlobals + 16) = v2;

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  int64_t v6 = [(DACChangeMarker *)self version];
  uint64_t v7 = [(DACChangeMarker *)self uuid];
  v8 = [v3 stringWithFormat:@"<%@: %p, v(%ld) u(%@)>", v5, self, v6, v7];

  return v8;
}

- (DACChangeMarker)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  if (v5 < 1)
  {
    p_super = DACLogForCategory(0);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2330F4000, p_super, OS_LOG_TYPE_ERROR, "Failed to decode change marker, invalid version", buf, 2u);
    }
    v8 = (NSUUID *)self;
    self = 0;
    goto LABEL_11;
  }
  int64_t v6 = v5;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  if (!v7)
  {
    p_super = DACLogForCategory(0);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v14 = v6;
      _os_log_error_impl(&dword_2330F4000, p_super, OS_LOG_TYPE_ERROR, "Failed to decode change marker v(%ld), no UUID", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = (NSUUID *)v7;
  v12.receiver = self;
  v12.super_class = (Class)DACChangeMarker;
  v9 = [(DACChangeMarker *)&v12 init];
  self = v9;
  if (v9)
  {
    v9->_version = v6;
    v8 = v8;
    p_super = &self->_uuid->super;
    self->_uuid = v8;
LABEL_11:
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DACChangeMarker version](self, "version"), @"version");
  id v5 = [(DACChangeMarker *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isEqualToChangeMarker:(id)a3
{
  id v4 = a3;
  id v5 = [(DACChangeMarker *)self uuid];
  int64_t v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DACChangeMarker *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(DACChangeMarker *)self _isEqualToChangeMarker:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = [(DACChangeMarker *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)version
{
  return self->_version;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end