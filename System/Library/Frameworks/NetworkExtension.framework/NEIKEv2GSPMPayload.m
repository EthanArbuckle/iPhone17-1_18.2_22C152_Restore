@interface NEIKEv2GSPMPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
- (void)setGspmData:(uint64_t)a1;
@end

@implementation NEIKEv2GSPMPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    id Property = objc_getProperty(self, v3, 16, 1);
    objc_storeStrong((id *)&self->_gspmData, Property);
    return [(NEIKEv2GSPMPayload *)self hasRequiredFields];
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      v8 = "-[NEIKEv2GSPMPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
}

- (void)setGspmData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
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
    if ([(NEIKEv2GSPMPayload *)self hasRequiredFields])
    {
      v4 = self->_gspmData;
      objc_setProperty_atomic(self, v5, v4, 16);

      goto LABEL_5;
    }
  }
  else
  {
    char v8 = [0 hasRequiredFields];
    id Property = 0;
    if (v8) {
      return Property != 0;
    }
  }
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "GSPM payload missing required fields", v10, 2u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    gspmData = self->_gspmData;
  }
  else {
    gspmData = 0;
  }
  return gspmData != 0;
}

- (id)description
{
  return [(NEIKEv2GSPMPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  char v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    gspmData = self->_gspmData;
  }
  else {
    gspmData = 0;
  }
  [v7 appendPrettyObject:gspmData withName:@"GSPM Data" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 49;
}

+ (id)copyTypeDescription
{
  return @"GSPM";
}

@end