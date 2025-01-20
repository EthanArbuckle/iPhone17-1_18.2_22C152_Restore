@interface NEIKEv2NULLIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2NULLIdentifier)init;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2NULLIdentifier

- (unint64_t)identifierType
{
  return 13;
}

- (NEIKEv2NULLIdentifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2NULLIdentifier;
  v2 = [(NEIKEv2NULLIdentifier *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    [(NEIKEv2Identifier *)v2 setIdentifierData:v3];

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
  return v2;
}

+ (id)copyTypeDescription
{
  return @"NULL";
}

@end