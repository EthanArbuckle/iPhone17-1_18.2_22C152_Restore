@interface CRKConcreteIDSAccount
- (BOOL)isActive;
- (CRKConcreteIDSAccount)initWithAccount:(id)a3;
- (IDSAccount)account;
- (NSString)description;
- (NSString)loginID;
- (void)account:(id)a3 isActiveChanged:(BOOL)a4;
- (void)setAccount:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)updateIsActive;
- (void)updateWithAccount:(id)a3;
@end

@implementation CRKConcreteIDSAccount

- (CRKConcreteIDSAccount)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteIDSAccount;
  v5 = [(CRKConcreteIDSAccount *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CRKConcreteIDSAccount *)v5 updateWithAccount:v4];
  }

  return v6;
}

- (void)updateWithAccount:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKConcreteIDSAccount *)self account];

  if (v4 != v7)
  {
    v5 = [(CRKConcreteIDSAccount *)self account];
    [v5 removeDelegate:self];

    [(CRKConcreteIDSAccount *)self setAccount:v7];
    v6 = [(CRKConcreteIDSAccount *)self account];
    [v6 addDelegate:self queue:MEMORY[0x263EF83A0]];

    [(CRKConcreteIDSAccount *)self updateIsActive];
  }
}

- (void)updateIsActive
{
  int v3 = [(CRKConcreteIDSAccount *)self isActive];
  id v4 = [(CRKConcreteIDSAccount *)self account];
  int v5 = [v4 isActive];

  if (v3 != v5)
  {
    id v6 = [(CRKConcreteIDSAccount *)self account];
    -[CRKConcreteIDSAccount setActive:](self, "setActive:", [v6 isActive]);
  }
}

- (NSString)loginID
{
  v2 = [(CRKConcreteIDSAccount *)self account];
  int v3 = [v2 loginID];

  return (NSString *)v3;
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(CRKConcreteIDSAccount *)self updateIsActive];
  if (_CRKLogASM_onceToken_17 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_17, &__block_literal_global_47);
  }
  int v5 = _CRKLogASM_logObj_17;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_17, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ : Account activity did change.", (uint8_t *)&v6, 0xCu);
  }
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(CRKConcreteIDSAccount *)self loginID];
  BOOL v6 = [(CRKConcreteIDSAccount *)self isActive];
  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p { loginID = %@, isActive = %@ }>", v4, self, v5, v7];

  return (NSString *)v8;
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end