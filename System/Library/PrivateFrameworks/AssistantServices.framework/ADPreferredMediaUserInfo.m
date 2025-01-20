@interface ADPreferredMediaUserInfo
- (ADPreferredMediaUserInfo)init;
- (NSString)preferredMediaUserHomeUserID;
- (NSString)preferredMediaUserSharedUserID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPreferredMediaUserHomeUserID:(id)a3;
- (void)setPreferredMediaUserSharedUserID:(id)a3;
@end

@implementation ADPreferredMediaUserInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMediaUserHomeUserID, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserSharedUserID, 0);
}

- (void)setPreferredMediaUserHomeUserID:(id)a3
{
}

- (NSString)preferredMediaUserHomeUserID
{
  return self->_preferredMediaUserHomeUserID;
}

- (void)setPreferredMediaUserSharedUserID:(id)a3
{
}

- (NSString)preferredMediaUserSharedUserID
{
  return self->_preferredMediaUserSharedUserID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ADPreferredMediaUserInfo);
  id v5 = [(NSString *)self->_preferredMediaUserSharedUserID copy];
  [(ADPreferredMediaUserInfo *)v4 setPreferredMediaUserSharedUserID:v5];

  id v6 = [(NSString *)self->_preferredMediaUserHomeUserID copy];
  [(ADPreferredMediaUserInfo *)v4 setPreferredMediaUserHomeUserID:v6];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v7.receiver = self;
  v7.super_class = (Class)ADPreferredMediaUserInfo;
  v4 = [(ADPreferredMediaUserInfo *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@, preferredMediaUserSharedUserID: %@, preferredMediaUserHomeUserID: %@", v4, self->_preferredMediaUserSharedUserID, self->_preferredMediaUserHomeUserID];

  return v5;
}

- (ADPreferredMediaUserInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADPreferredMediaUserInfo;
  return [(ADPreferredMediaUserInfo *)&v3 init];
}

@end