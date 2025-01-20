@interface IEDirectInvocation
- (IEDirectInvocation)initWithIdentifier:(id)a3;
- (IEDirectInvocation)initWithIdentifier:(id)a3 withUserData:(id)a4;
- (NSDictionary)userData;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation IEDirectInvocation

- (IEDirectInvocation)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IEDirectInvocation;
  v6 = [(IEDirectInvocation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    userData = v7->_userData;
    v7->_userData = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v7;
}

- (IEDirectInvocation)initWithIdentifier:(id)a3 withUserData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IEDirectInvocation;
  v9 = [(IEDirectInvocation *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_userData, a4);
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end