@interface HMBAction
+ (id)shouldUpdateClientsAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUpdateClients;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setShouldUpdateClients:(BOOL)a3;
@end

@implementation HMBAction

- (void)setShouldUpdateClients:(BOOL)a3
{
  self->_shouldUpdateClients = a3;
}

- (BOOL)shouldUpdateClients
{
  return self->_shouldUpdateClients;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[HMBMutableAction allocWithZone:a3] init];
  [(HMBAction *)v4 setShouldUpdateClients:[(HMBAction *)self shouldUpdateClients]];
  return v4;
}

- (unint64_t)hash
{
  return [(HMBAction *)self shouldUpdateClients];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    BOOL v7 = [(HMBAction *)self shouldUpdateClients];
    int v8 = v7 ^ [v6 shouldUpdateClients] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)shouldUpdateClientsAction
{
  v2 = objc_alloc_init(HMBMutableAction);
  [(HMBAction *)v2 setShouldUpdateClients:1];
  v3 = (void *)[(HMBMutableAction *)v2 copy];

  return v3;
}

@end