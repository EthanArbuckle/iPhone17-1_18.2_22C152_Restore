@interface LAPersistedRight
- (LAPersistedRight)initWithIdentifier:(id)a3 accessKey:(id)a4 privateKeys:(id)a5 secrets:(id)a6;
- (LAPrivateKey)key;
- (LASecret)secret;
- (void)key;
- (void)secret;
@end

@implementation LAPersistedRight

- (LAPersistedRight)initWithIdentifier:(id)a3 accessKey:(id)a4 privateKeys:(id)a5 secrets:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)LAPersistedRight;
  v13 = [(LARight *)&v16 initWithIdentifier:a3 accessKey:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_secrets, a6);
    objc_storeStrong((id *)&v14->_privateKeys, a5);
  }

  return v14;
}

- (LASecret)secret
{
  if ([(NSArray *)self->_secrets count] >= 2) {
    -[LAPersistedRight secret]();
  }
  v3 = [(NSArray *)self->_secrets firstObject];
  [v3 setRight:self];

  return (LASecret *)v3;
}

- (LAPrivateKey)key
{
  if ([(NSArray *)self->_privateKeys count] != 1) {
    -[LAPersistedRight key]();
  }
  v3 = [(NSArray *)self->_privateKeys firstObject];
  [v3 setRight:self];

  return (LAPrivateKey *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);

  objc_storeStrong((id *)&self->_secrets, 0);
}

- (void)secret
{
  __assert_rtn("-[LAPersistedRight secret]", "LAPersistedRight.m", 39, "_secrets.count <= 1");
}

- (void)key
{
  __assert_rtn("-[LAPersistedRight key]", "LAPersistedRight.m", 47, "_privateKeys.count == 1");
}

@end