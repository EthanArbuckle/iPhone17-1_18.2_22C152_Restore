@interface NEIKEv2ConfigurationAttribute
+ (id)copyTypeDescription;
- (BOOL)validForChildlessSA;
- (id)attributeName;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initEmptyRequest;
- (unint64_t)attributeType;
- (unint64_t)valueType;
@end

@implementation NEIKEv2ConfigurationAttribute

- (void).cxx_destruct
{
}

- (BOOL)validForChildlessSA
{
  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = [(NEIKEv2ConfigurationAttribute *)self attributeName];
  [v7 appendPrettyObject:v8 withName:@"Name" andIndent:v5 options:a4];

  String = NEIKEv2AttributeTypeCreateString([(NEIKEv2ConfigurationAttribute *)self attributeType]);
  [v7 appendPrettyObject:String withName:@"Type" andIndent:v5 options:a4];

  v10 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v10 withName:@"Payload Type" andIndent:v5 options:a4];

  return v7;
}

- (id)attributeName
{
  if (self)
  {
    self = (NEIKEv2ConfigurationAttribute *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)initEmptyRequest
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ConfigurationAttribute;
  uint64_t v2 = [(NEIKEv2ConfigurationAttribute *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

- (unint64_t)valueType
{
  return 0;
}

- (unint64_t)attributeType
{
  return 0;
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

@end