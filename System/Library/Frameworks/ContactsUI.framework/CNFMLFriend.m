@interface CNFMLFriend
- (BOOL)isEqual:(id)a3;
- (BOOL)originatedFromTheSameClient;
- (CNFMLFriend)initWithHandle:(id)a3 handleType:(int64_t)a4 createDate:(id)a5 expiry:(id)a6 origin:(int64_t)a7 originatedFromTheSameClient:(BOOL)a8;
- (CNFMLHandle)handle;
- (NSDate)createdAt;
- (NSDate)expiry;
- (id)comparisonIdentifier;
- (id)debugDescription;
- (id)description;
- (int64_t)handleType;
- (int64_t)origin;
- (unint64_t)hash;
- (void)setCreatedAt:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(int64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setOriginatedFromTheSameClient:(BOOL)a3;
@end

@implementation CNFMLFriend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)setOriginatedFromTheSameClient:(BOOL)a3
{
  self->_originatedFromTheSameClient = a3;
}

- (BOOL)originatedFromTheSameClient
{
  return self->_originatedFromTheSameClient;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setExpiry:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandle:(id)a3
{
}

- (CNFMLHandle)handle
{
  return self->_handle;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CNFMLFriend *)self comparisonIdentifier];
  v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (id)description
{
  v2 = NSString;
  v3 = [(CNFMLFriend *)self comparisonIdentifier];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(CNFMLFriend *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)comparisonIdentifier
{
  v13 = NSString;
  unint64_t v3 = [(CNFMLFriend *)self handle];
  uint64_t v4 = [v3 identifier];
  v5 = [v4 lowercaseString];
  int64_t v6 = [(CNFMLFriend *)self handleType];
  v7 = [(CNFMLFriend *)self createdAt];
  v8 = [v7 description];
  v9 = [(CNFMLFriend *)self expiry];
  v10 = [v9 description];
  v11 = [v13 stringWithFormat:@"Handle:%@ Handle Type:%ld CreateAt:%@ expiry:%@ origin:%ld originatedFromTheSameClient:%d", v5, v6, v8, v10, -[CNFMLFriend origin](self, "origin"), -[CNFMLFriend originatedFromTheSameClient](self, "originatedFromTheSameClient")];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(CNFMLFriend *)self comparisonIdentifier];
    v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (CNFMLFriend)initWithHandle:(id)a3 handleType:(int64_t)a4 createDate:(id)a5 expiry:(id)a6 origin:(int64_t)a7 originatedFromTheSameClient:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNFMLFriend;
  v17 = [(CNFMLFriend *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(CNFMLFriend *)v17 setHandle:v14];
    [(CNFMLFriend *)v18 setHandleType:a4];
    [(CNFMLFriend *)v18 setCreatedAt:v15];
    [(CNFMLFriend *)v18 setExpiry:v16];
    [(CNFMLFriend *)v18 setOrigin:a7];
    [(CNFMLFriend *)v18 setOriginatedFromTheSameClient:v8];
  }

  return v18;
}

@end