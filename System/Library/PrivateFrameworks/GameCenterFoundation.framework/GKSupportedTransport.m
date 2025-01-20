@interface GKSupportedTransport
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKSupportedTransport)initWithVersionNumber:(id)a3;
- (NSString)name;
- (int64_t)version;
- (unint64_t)hash;
- (void)setVersion:(int64_t)a3;
@end

@implementation GKSupportedTransport

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_6 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_6, &__block_literal_global_33);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_6;

  return v2;
}

void __47__GKSupportedTransport_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"name";
  v2[1] = @"version";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_6;
  secureCodedPropertyKeys_sSecureCodedKeys_6 = v0;
}

- (GKSupportedTransport)initWithVersionNumber:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKSupportedTransport;
  v5 = [(GKSupportedTransport *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 integerValue];
    int64_t v7 = v6;
    switch(v6)
    {
      case 2:
        name = v5->_name;
        v9 = @"FastSync";
        goto LABEL_8;
      case 1:
        name = v5->_name;
        v9 = @"Viceroy";
        goto LABEL_8;
      case 0:
        name = v5->_name;
        v9 = @"Undefined";
LABEL_8:
        v5->_name = &v9->isa;

        v5->_version = v7;
        break;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 name];
    int64_t v7 = [(GKSupportedTransport *)self name];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [v5 version];
      BOOL v9 = v8 == [(GKSupportedTransport *)self version];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(GKSupportedTransport *)self version];
  id v4 = [(GKSupportedTransport *)self name];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
}

@end