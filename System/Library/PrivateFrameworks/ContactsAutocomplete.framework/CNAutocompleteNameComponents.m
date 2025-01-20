@interface CNAutocompleteNameComponents
+ (CNAutocompleteNameComponents)nameComponentsWithFirstName:(id)a3 lastName:(id)a4 nickname:(id)a5 nameSuffix:(id)a6;
+ (id)contactKeys;
- (BOOL)isEqual:(id)a3;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)nameSuffix;
- (NSString)nickname;
- (unint64_t)hash;
@end

@implementation CNAutocompleteNameComponents

+ (CNAutocompleteNameComponents)nameComponentsWithFirstName:(id)a3 lastName:(id)a4 nickname:(id)a5 nameSuffix:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  uint64_t v15 = [v13 copy];

  v16 = (void *)v14[1];
  v14[1] = v15;

  uint64_t v17 = [v12 copy];
  v18 = (void *)v14[2];
  v14[2] = v17;

  uint64_t v19 = [v11 copy];
  v20 = (void *)v14[3];
  v14[3] = v19;

  uint64_t v21 = [v10 copy];
  v22 = (void *)v14[4];
  v14[4] = v21;

  return (CNAutocompleteNameComponents *)v14;
}

+ (id)contactKeys
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v6[0] = *MEMORY[0x1E4F1ADF0];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEB8];
  v6[2] = *MEMORY[0x1E4F1AEC0];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4F1ADD0];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      firstName = self->_firstName;
      if (!((unint64_t)firstName | *((void *)a3 + 1))
        || (int v6 = -[NSString isEqual:](firstName, "isEqual:")) != 0)
      {
        lastName = self->_lastName;
        if (!((unint64_t)lastName | *((void *)a3 + 2))
          || (int v6 = -[NSString isEqual:](lastName, "isEqual:")) != 0)
        {
          nickname = self->_nickname;
          if (!((unint64_t)nickname | *((void *)a3 + 3))
            || (int v6 = -[NSString isEqual:](nickname, "isEqual:")) != 0)
          {
            nameSuffix = self->_nameSuffix;
            if (!((unint64_t)nameSuffix | *((void *)a3 + 4))
              || (int v6 = -[NSString isEqual:](nameSuffix, "isEqual:")) != 0)
            {
              LOBYTE(v6) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_firstName];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_lastName] - v3 + 32 * v3;
  uint64_t v5 = [MEMORY[0x1E4F5A418] objectHash:self->_nickname] - v4 + 32 * v4;
  return [MEMORY[0x1E4F5A418] objectHash:self->_nameSuffix] - v5 + 32 * v5 + 15699857;
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)nameSuffix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end