@interface SGWalletPassKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWalletPassKey:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (SGWalletPassKey)initWithIdentifier:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGWalletPassKey

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGWalletPassKey identifier: %@]", self->_identifier];
  return (NSString *)v2;
}

- (id)serialize
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqualToWalletPassKey:(id)a3
{
  v4 = (SGWalletPassKey *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self->_identifier;
    v6 = v5;
    if (v5 == v4->_identifier) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGWalletPassKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGWalletPassKey *)self isEqualToWalletPassKey:v5];

  return v6;
}

- (SGWalletPassKey)initWithIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGWalletPassKey.m", 22, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGWalletPassKey;
  char v7 = [(SGWalletPassKey *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_identifier, a3);
  }

  return v8;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 26;
}

@end