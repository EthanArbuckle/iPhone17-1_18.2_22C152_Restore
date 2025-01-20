@interface NEIKEv2Payload
+ (NSObject)createPayloadWithType:(void *)a3 fromData:;
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (NEIKEv2Payload)init;
- (id)copyPayloadData;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (uint64_t)isValid;
- (unint64_t)type;
@end

@implementation NEIKEv2Payload

- (void).cxx_destruct
{
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v7 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v6 appendPrettyObject:v7 withName:@"Payload Type" andIndent:v5 options:a4];

  return v6;
}

- (BOOL)parsePayloadData
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Cannot parse payload data for %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (BOOL)generatePayloadData
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Cannot generate payload data for %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Cannot check for required fields on generic payload %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (NEIKEv2Payload)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Payload;
  v2 = [(NEIKEv2Payload *)&v8 init];
  if (!v2)
  {
    v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)uint64_t v7 = 0;
    v6 = "[super init] failed";
    goto LABEL_8;
  }
  if (![(NEIKEv2Payload *)v2 isMemberOfClass:objc_opt_class()])
  {
    v4 = v2;
    goto LABEL_6;
  }
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    v6 = "Must use a subclass of NEIKEv2Payload to init";
LABEL_8:
    _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, v6, v7, 2u);
  }
LABEL_4:

  v4 = 0;
LABEL_6:

  return v4;
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

- (uint64_t)isValid
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 8))
  {
    if (([(id)result hasRequiredFields] & 1) == 0) {
      goto LABEL_4;
    }
    return 1;
  }
  if ([(id)result generatePayloadData]) {
    return 1;
  }
LABEL_4:
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = v1;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Failed to validate %@", (uint8_t *)&v3, 0xCu);
  }

  return 0;
}

+ (NSObject)createPayloadWithType:(void *)a3 fromData:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  uint64_t v5 = off_1E598D3B0;
  switch(a2)
  {
    case '!':
      if ((unint64_t)[v4 length] <= 7)
      {
        p_super = ne_log_obj();
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        int v17 = 67109120;
        LODWORD(v18) = [v4 length];
        uint64_t v7 = "Failed to parse SA, length %u";
        goto LABEL_39;
      }
      uint64_t v13 = [v4 bytes];
      int v14 = *(unsigned __int8 *)(v13 + 5);
      if (v14 == 1)
      {
        uint64_t v5 = off_1E598D410;
        goto LABEL_25;
      }
      if (v14 == 3)
      {
        uint64_t v5 = off_1E598D320;
        goto LABEL_25;
      }
      uint64_t v15 = v13;
      p_super = ne_log_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        int v16 = *(unsigned __int8 *)(v15 + 5);
        int v17 = 67109120;
        LODWORD(v18) = v16;
        uint64_t v7 = "Failed to parse unknown SA type %u";
LABEL_39:
        _os_log_error_impl(&dword_19DDAF000, p_super, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v17, 8u);
      }
LABEL_31:

      p_super = 0;
LABEL_32:

      return p_super;
    case '""':
      uint64_t v5 = off_1E598D4F0;
      goto LABEL_25;
    case '#':
      uint64_t v5 = off_1E598D4A0;
      goto LABEL_25;
    case '$':
      uint64_t v5 = off_1E598D570;
      goto LABEL_25;
    case '%':
      uint64_t v5 = off_1E598D300;
      goto LABEL_25;
    case '&':
      uint64_t v5 = off_1E598D308;
      goto LABEL_25;
    case '\'':
      uint64_t v5 = off_1E598D2F0;
      goto LABEL_25;
    case '(':
      uint64_t v5 = off_1E598D520;
      goto LABEL_25;
    case ')':
      uint64_t v5 = off_1E598D528;
      goto LABEL_25;
    case '*':
      uint64_t v5 = off_1E598D378;
      goto LABEL_25;
    case '+':
      uint64_t v5 = off_1E598D610;
      goto LABEL_25;
    case ',':
      uint64_t v5 = off_1E598D4A8;
      goto LABEL_25;
    case '-':
      uint64_t v5 = off_1E598D578;
      goto LABEL_25;
    case '.':
      goto LABEL_25;
    case '/':
      uint64_t v5 = off_1E598D338;
      goto LABEL_25;
    case '0':
      uint64_t v5 = off_1E598D388;
      goto LABEL_25;
    case '1':
      uint64_t v5 = off_1E598D3E0;
      goto LABEL_25;
    case '5':
      uint64_t v5 = off_1E598D3A0;
LABEL_25:
      p_super = objc_alloc_init(*v5);
      if (p_super) {
        goto LABEL_26;
      }
      goto LABEL_27;
    default:
      objc_super v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v17 = 67109120;
        LODWORD(v18) = a2;
        _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "Received unknown payload type %u, saving as custom", (uint8_t *)&v17, 8u);
      }

      v9 = objc_alloc_init(NEIKEv2CustomPayload);
      p_super = &v9->super.super;
      if (!v9) {
        goto LABEL_27;
      }
      v9->_customType = a2;
LABEL_26:
      objc_setProperty_atomic(p_super, v10, v4, 16);
      LOBYTE(p_super[1].isa) = 1;
LABEL_27:
      if ([p_super parsePayloadData]) {
        goto LABEL_32;
      }
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        v18 = p_super;
        _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Failed to parse payload data for %@", (uint8_t *)&v17, 0xCu);
      }

      goto LABEL_31;
  }
}

- (id)copyPayloadData
{
  if (!a1 || ![a1 generatePayloadData]) {
    return 0;
  }
  id Property = objc_getProperty(a1, v2, 16, 1);

  return Property;
}

@end