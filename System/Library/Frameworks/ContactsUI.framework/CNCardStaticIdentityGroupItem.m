@interface CNCardStaticIdentityGroupItem
- (CNCardStaticIdentityGroupItem)initWithIdentity:(id)a3;
- (NSString)identity;
- (void)setIdentity:(id)a3;
@end

@implementation CNCardStaticIdentityGroupItem

- (void).cxx_destruct
{
}

- (void)setIdentity:(id)a3
{
}

- (NSString)identity
{
  return self->_identity;
}

- (CNCardStaticIdentityGroupItem)initWithIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNCardStaticIdentityGroupItem;
  v6 = [(CNCardStaticIdentityGroupItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identity, a3);
  }

  return v7;
}

@end