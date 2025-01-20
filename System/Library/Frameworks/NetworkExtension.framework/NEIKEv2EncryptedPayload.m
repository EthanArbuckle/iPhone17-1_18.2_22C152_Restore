@interface NEIKEv2EncryptedPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2EncryptedPayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    return [(NEIKEv2EncryptedPayload *)self hasRequiredFields];
  }
  else
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      v6 = "-[NEIKEv2EncryptedPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v5, 0xCu);
    }

    return 0;
  }
}

- (BOOL)generatePayloadData
{
  if (self) {
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16, 1);
  }
  return self != 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16, 1);
  }
  return self != 0;
}

- (id)description
{
  return [(NEIKEv2EncryptedPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  uint64_t v7 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v6 appendPrettyObject:v7 withName:@"Payload Type" andIndent:v5 options:a4];

  return v6;
}

- (unint64_t)type
{
  return 46;
}

+ (id)copyTypeDescription
{
  return @"Encrypted";
}

@end