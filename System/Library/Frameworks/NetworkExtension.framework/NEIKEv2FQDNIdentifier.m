@interface NEIKEv2FQDNIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2FQDNIdentifier)initWithFQDN:(id)a3;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2FQDNIdentifier

- (unint64_t)identifierType
{
  return 2;
}

- (NEIKEv2FQDNIdentifier)initWithFQDN:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[NEIKEv2FQDNIdentifier initWithFQDN:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null fqdn", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v9.receiver = self;
  v9.super_class = (Class)NEIKEv2FQDNIdentifier;
  v5 = [(NEIKEv2FQDNIdentifier *)&v9 init];
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2FQDNIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, &self->super.super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:
    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
  self = [v4 dataUsingEncoding:4];
  [(NEIKEv2Identifier *)v6 setIdentifierData:self];
LABEL_4:

  return v6;
}

+ (id)copyTypeDescription
{
  return @"FQDN";
}

@end