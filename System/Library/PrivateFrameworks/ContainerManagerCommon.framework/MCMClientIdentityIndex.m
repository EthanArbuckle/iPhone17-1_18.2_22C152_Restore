@interface MCMClientIdentityIndex
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientIdentityIndex:(id)a3;
- (MCMClientIdentityIndex)initWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MCMClientIdentityIndex

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MCMClientIdentityIndex *)self isEqualToClientIdentityIndex:v4];

  return v5;
}

- (BOOL)isEqualToClientIdentityIndex:(id)a3
{
  id v4 = a3;
  if (![(NSData *)self->_auditToken isEqualToData:v4[1]]
    || ![(NSData *)self->_proximateAuditToken isEqualToData:v4[2]])
  {
    goto LABEL_8;
  }
  personaUniqueString = self->_personaUniqueString;
  uint64_t v6 = v4[3];
  if (personaUniqueString)
  {
    if (v6 && -[NSString isEqualToString:](personaUniqueString, "isEqualToString:")) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  if (v6) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_auditToken hash];
  uint64_t v4 = [(NSData *)self->_proximateAuditToken hash];
  NSUInteger personaUniqueString = (NSUInteger)self->_personaUniqueString;
  if (personaUniqueString) {
    NSUInteger personaUniqueString = [(id)personaUniqueString hash];
  }
  return v4 ^ v3 ^ personaUniqueString;
}

- (MCMClientIdentityIndex)initWithAuditToken:(id *)a3 proximateAuditToken:(id *)a4 personaUniqueString:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMClientIdentityIndex;
  v10 = [(MCMClientIdentityIndex *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:32];
    auditToken = v10->_auditToken;
    v10->_auditToken = (NSData *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:32];
    proximateAuditToken = v10->_proximateAuditToken;
    v10->_proximateAuditToken = (NSData *)v13;

    objc_storeStrong((id *)&v10->_personaUniqueString, a5);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_proximateAuditToken, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  [(NSData *)self->_auditToken getBytes:&v11 length:32];
  long long v9 = 0u;
  long long v10 = 0u;
  [(NSData *)self->_proximateAuditToken getBytes:&v9 length:32];
  uint64_t v4 = [MCMClientIdentityIndex alloc];
  NSUInteger personaUniqueString = self->_personaUniqueString;
  v8[0] = v11;
  v8[1] = v12;
  v7[0] = v9;
  v7[1] = v10;
  return [(MCMClientIdentityIndex *)v4 initWithAuditToken:v8 proximateAuditToken:v7 personaUniqueString:personaUniqueString];
}

@end