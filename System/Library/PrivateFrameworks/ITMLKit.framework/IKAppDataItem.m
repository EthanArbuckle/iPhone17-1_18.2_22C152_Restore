@interface IKAppDataItem
- (BOOL)isEqual:(id)a3;
- (IKAppDataItem)initWithType:(id)a3 identifier:(id)a4 prototypeIdentifier:(id)a5 dataDictionary:(id)a6;
- (IKAppPrototypeIdentifier)prototypeIdentifier;
- (NSDictionary)dataDictionary;
- (NSString)identifier;
- (NSString)type;
- (id)valueForPropertyPath:(id)a3;
- (unint64_t)hash;
@end

@implementation IKAppDataItem

- (IKAppDataItem)initWithType:(id)a3 identifier:(id)a4 prototypeIdentifier:(id)a5 dataDictionary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IKAppDataItem;
  v14 = [(IKAppDataItem *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    type = v14->_type;
    v14->_type = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_prototypeIdentifier, a5);
    uint64_t v19 = [v13 copy];
    dataDictionary = v14->_dataDictionary;
    v14->_dataDictionary = (NSDictionary *)v19;
  }
  return v14;
}

- (unint64_t)hash
{
  v2 = [(IKAppDataItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IKAppDataItem *)self identifier];
    v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(IKAppDataItem *)self type];
      v9 = [v5 type];
      if ([v8 isEqual:v9])
      {
        id v10 = [(IKAppDataItem *)self prototypeIdentifier];
        id v11 = [v5 prototypeIdentifier];
        if ([v10 isEqual:v11])
        {
          id v12 = [(IKAppDataItem *)self dataDictionary];
          id v13 = [v5 dataDictionary];
          if (v12 == v13)
          {
            char v15 = 1;
          }
          else
          {
            v18 = v13;
            uint64_t v17 = [(IKAppDataItem *)self dataDictionary];
            [v5 dataDictionary];
            v14 = uint64_t v19 = v12;
            char v15 = [v17 isEqualToDictionary:v14];

            id v12 = v19;
            id v13 = v18;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)valueForPropertyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(IKAppDataItem *)self dataDictionary];
  v6 = [v4 string];

  v7 = [v5 valueForKeyPath:v6];

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKAppPrototypeIdentifier)prototypeIdentifier
{
  return self->_prototypeIdentifier;
}

- (NSDictionary)dataDictionary
{
  return self->_dataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDictionary, 0);
  objc_storeStrong((id *)&self->_prototypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end