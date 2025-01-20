@interface FMLFriend
- (BOOL)isEqual:(id)a3;
- (BOOL)originatedFromTheSameClient;
- (FMLFriend)initWithHandle:(id)a3 handleType:(int64_t)a4 createDate:(id)a5 expiry:(id)a6 origin:(int64_t)a7 originatedFromTheSameClient:(BOOL)a8;
- (FMLHandle)handle;
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

@implementation FMLFriend

- (FMLFriend)initWithHandle:(id)a3 handleType:(int64_t)a4 createDate:(id)a5 expiry:(id)a6 origin:(int64_t)a7 originatedFromTheSameClient:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMLFriend;
  v17 = [(FMLFriend *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(FMLFriend *)v17 setHandle:v14];
    [(FMLFriend *)v18 setHandleType:a4];
    [(FMLFriend *)v18 setCreatedAt:v15];
    [(FMLFriend *)v18 setExpiry:v16];
    [(FMLFriend *)v18 setOrigin:a7];
    [(FMLFriend *)v18 setOriginatedFromTheSameClient:v8];
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMLFriend *)self comparisonIdentifier];
    v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  v13 = NSString;
  v3 = [(FMLFriend *)self handle];
  id v4 = [v3 identifier];
  id v5 = [v4 lowercaseString];
  int64_t v6 = [(FMLFriend *)self handleType];
  v7 = [(FMLFriend *)self createdAt];
  char v8 = [v7 description];
  v9 = [(FMLFriend *)self expiry];
  v10 = [v9 description];
  v11 = [v13 stringWithFormat:@"Handle:%@ Handle Type:%ld CreateAt:%@ expiry:%@ origin:%ld originatedFromTheSameClient:%d", v5, v6, v8, v10, -[FMLFriend origin](self, "origin"), -[FMLFriend originatedFromTheSameClient](self, "originatedFromTheSameClient")];

  return v11;
}

- (unint64_t)hash
{
  v2 = [(FMLFriend *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(FMLFriend *)self comparisonIdentifier];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMLFriend *)self comparisonIdentifier];
  int64_t v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (FMLHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (BOOL)originatedFromTheSameClient
{
  return self->_originatedFromTheSameClient;
}

- (void)setOriginatedFromTheSameClient:(BOOL)a3
{
  self->_originatedFromTheSameClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end