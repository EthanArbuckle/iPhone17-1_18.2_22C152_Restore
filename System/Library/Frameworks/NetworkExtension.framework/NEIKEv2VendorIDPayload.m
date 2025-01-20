@interface NEIKEv2VendorIDPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2VendorIDPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    id v4 = objc_getProperty(self, v3, 16, 1);
    objc_setProperty_atomic(self, v5, v4, 24);

    return [(NEIKEv2VendorIDPayload *)self hasRequiredFields];
  }
  else
  {
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[NEIKEv2VendorIDPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
    {
LABEL_5:
      id Property = objc_getProperty(self, v3, 16, 1);
      return Property != 0;
    }
    if ([(NEIKEv2VendorIDPayload *)self hasRequiredFields])
    {
      id v5 = objc_getProperty(self, v4, 24, 1);
      objc_setProperty_atomic(self, v6, v5, 16);

      goto LABEL_5;
    }
  }
  else
  {
    char v9 = [0 hasRequiredFields];
    id Property = 0;
    if (v9) {
      return Property != 0;
    }
  }
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "Vendor ID payload missing required fields", v11, 2u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2VendorIDPayload *)objc_getProperty(self, a2, 24, 1);
  }
  return self != 0;
}

- (id)description
{
  return [(NEIKEv2VendorIDPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  int v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Vendor Data" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 43;
}

+ (id)copyTypeDescription
{
  return @"Vendor";
}

@end