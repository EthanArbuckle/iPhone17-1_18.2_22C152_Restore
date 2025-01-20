@interface NEIKEv2KeyIDIdentifier
+ (id)copyTypeDescription;
- (NEIKEv2KeyIDIdentifier)initWithKeyID:(id)a3;
- (NEIKEv2KeyIDIdentifier)initWithKeyIDString:(id)a3;
- (unint64_t)identifierType;
@end

@implementation NEIKEv2KeyIDIdentifier

- (unint64_t)identifierType
{
  return 11;
}

- (NEIKEv2KeyIDIdentifier)initWithKeyIDString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = [(NEIKEv2KeyIDIdentifier *)self initWithKeyID:v4];

  return v5;
}

- (NEIKEv2KeyIDIdentifier)initWithKeyID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[NEIKEv2KeyIDIdentifier initWithKeyID:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null keyID", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v9.receiver = self;
  v9.super_class = (Class)NEIKEv2KeyIDIdentifier;
  v5 = [(NEIKEv2KeyIDIdentifier *)&v9 init];
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2KeyIDIdentifier *)objc_claimAutoreleasedReturnValue();
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
  [(NEIKEv2Identifier *)v5 setIdentifierData:v4];
LABEL_4:

  return v6;
}

+ (id)copyTypeDescription
{
  return @"KeyID";
}

@end