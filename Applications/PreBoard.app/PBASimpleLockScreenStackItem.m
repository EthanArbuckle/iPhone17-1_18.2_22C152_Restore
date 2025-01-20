@interface PBASimpleLockScreenStackItem
- (BOOL)isEqual:(id)a3;
- (NSString)iconSystemName;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setIconSystemName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PBASimpleLockScreenStackItem

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PBASimpleLockScreenStackItem *)self iconSystemName];
    v7 = [v5 iconSystemName];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = [(PBASimpleLockScreenStackItem *)self title];
      v10 = [v5 title];
      unsigned __int8 v11 = [v9 isEqualToString:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(PBASimpleLockScreenStackItem *)self iconSystemName];
  id v4 = [v3 hash];
  id v5 = [(PBASimpleLockScreenStackItem *)self title];
  v6 = (char *)[v5 hash] + 13 * (void)v4;

  return (unint64_t)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_iconSystemName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void)setIconSystemName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_iconSystemName, 0);
}

@end