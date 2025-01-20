@interface TKTokenPasswordAuthOperation
+ (BOOL)supportsSecureCoding;
- (Class)baseClassForUI;
- (NSString)localizedPasswordLabel;
- (NSString)password;
- (TKTokenPasswordAuthOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)importOperation:(id)a3;
- (void)setLocalizedPasswordLabel:(id)a3;
- (void)setPassword:(NSString *)password;
@end

@implementation TKTokenPasswordAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenPasswordAuthOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKTokenPasswordAuthOperation;
  v5 = [(TKTokenAuthOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_password);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    password = v5->_password;
    v5->_password = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_localizedPasswordLabel);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    localizedPasswordLabel = v5->_localizedPasswordLabel;
    v5->_localizedPasswordLabel = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TKTokenPasswordAuthOperation;
  id v4 = a3;
  [(TKTokenAuthOperation *)&v9 encodeWithCoder:v4];
  password = self->_password;
  uint64_t v6 = NSStringFromSelector(sel_password);
  objc_msgSend(v4, "encodeObject:forKey:", password, v6, v9.receiver, v9.super_class);

  localizedPasswordLabel = self->_localizedPasswordLabel;
  uint64_t v8 = NSStringFromSelector(sel_localizedPasswordLabel);
  [v4 encodeObject:localizedPasswordLabel forKey:v8];
}

- (Class)baseClassForUI
{
  return (Class)objc_opt_class();
}

- (void)importOperation:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TKTokenPasswordAuthOperation;
  id v4 = a3;
  [(TKTokenAuthOperation *)&v9 importOperation:v4];
  objc_msgSend(v4, "localizedPasswordLabel", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedPasswordLabel = self->_localizedPasswordLabel;
  self->_localizedPasswordLabel = v5;

  v7 = [v4 password];

  password = self->_password;
  self->_password = v7;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(NSString *)password
{
}

- (NSString)localizedPasswordLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedPasswordLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPasswordLabel, 0);

  objc_storeStrong((id *)&self->_password, 0);
}

@end