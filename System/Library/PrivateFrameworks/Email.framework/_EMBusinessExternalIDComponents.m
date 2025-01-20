@interface _EMBusinessExternalIDComponents
- (BOOL)isEqual:(id)a3;
- (NSString)brandID;
- (NSString)displayName;
- (NSString)highLevelDomain;
- (NSString)simpleAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBrandID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHighLevelDomain:(id)a3;
- (void)setSimpleAddress:(id)a3;
@end

@implementation _EMBusinessExternalIDComponents

- (BOOL)isEqual:(id)a3
{
  v4 = (_EMBusinessExternalIDComponents *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if ([(_EMBusinessExternalIDComponents *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(_EMBusinessExternalIDComponents *)self simpleAddress];
    v7 = [(_EMBusinessExternalIDComponents *)v5 simpleAddress];
    if (EFStringsAreEqual())
    {
      v8 = [(_EMBusinessExternalIDComponents *)self highLevelDomain];
      v9 = [(_EMBusinessExternalIDComponents *)v5 highLevelDomain];
      if (EFStringsAreEqual())
      {
        v15 = [(_EMBusinessExternalIDComponents *)self displayName];
        v10 = [(_EMBusinessExternalIDComponents *)v5 displayName];
        if (EFStringsAreEqual())
        {
          v14 = [(_EMBusinessExternalIDComponents *)self brandID];
          v11 = [(_EMBusinessExternalIDComponents *)v5 brandID];
          char v12 = EFStringsAreEqual();
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(_EMBusinessExternalIDComponents *)self simpleAddress];
  uint64_t v4 = [v3 hash];

  v5 = [(_EMBusinessExternalIDComponents *)self highLevelDomain];
  uint64_t v6 = [v5 hash];

  v7 = [(_EMBusinessExternalIDComponents *)self displayName];
  uint64_t v8 = [v7 hash];

  v9 = [(_EMBusinessExternalIDComponents *)self brandID];
  unint64_t v10 = 33 * (33 * (33 * v4 + v6) + v8) + [v9 hash] + 1185921;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_EMBusinessExternalIDComponents);
  v5 = [(_EMBusinessExternalIDComponents *)self simpleAddress];
  [(_EMBusinessExternalIDComponents *)v4 setSimpleAddress:v5];

  uint64_t v6 = [(_EMBusinessExternalIDComponents *)self highLevelDomain];
  [(_EMBusinessExternalIDComponents *)v4 setHighLevelDomain:v6];

  v7 = [(_EMBusinessExternalIDComponents *)self displayName];
  [(_EMBusinessExternalIDComponents *)v4 setDisplayName:v7];

  uint64_t v8 = [(_EMBusinessExternalIDComponents *)self brandID];
  [(_EMBusinessExternalIDComponents *)v4 setBrandID:v8];

  return v4;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (void)setHighLevelDomain:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)simpleAddress
{
  return self->_simpleAddress;
}

- (void)setSimpleAddress:(id)a3
{
}

- (NSString)brandID
{
  return self->_brandID;
}

- (void)setBrandID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandID, 0);
  objc_storeStrong((id *)&self->_simpleAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
}

@end