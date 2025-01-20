@interface IKAppPrototypeIdentifier
- (BOOL)isEqual:(id)a3;
- (IKAppPrototypeIdentifier)initWithIdentifier:(id)a3 selector:(id)a4 groupingValues:(id)a5;
- (NSDictionary)groupingValues;
- (NSString)identifier;
- (NSString)selector;
- (unint64_t)hash;
@end

@implementation IKAppPrototypeIdentifier

- (IKAppPrototypeIdentifier)initWithIdentifier:(id)a3 selector:(id)a4 groupingValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IKAppPrototypeIdentifier;
  v11 = [(IKAppPrototypeIdentifier *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    selector = v11->_selector;
    v11->_selector = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    groupingValues = v11->_groupingValues;
    v11->_groupingValues = (NSDictionary *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  v2 = [(IKAppPrototypeIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(IKAppPrototypeIdentifier *)self identifier];
    v7 = [v5 identifier];
    if (![v6 isEqualToString:v7])
    {
      char v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v8 = [(IKAppPrototypeIdentifier *)self selector];
    id v9 = [v5 selector];
    if (v8 != v9)
    {
      id v10 = [(IKAppPrototypeIdentifier *)self selector];
      v11 = [v5 selector];
      if (![v10 isEqualToString:v11])
      {
        char v12 = 0;
LABEL_13:

LABEL_14:
        goto LABEL_15;
      }
      v20 = v11;
      v21 = v10;
    }
    v13 = [(IKAppPrototypeIdentifier *)self groupingValues];
    uint64_t v14 = [v5 groupingValues];
    if (v13 == (void *)v14)
    {

      char v12 = 1;
    }
    else
    {
      v15 = (void *)v14;
      uint64_t v16 = [(IKAppPrototypeIdentifier *)self groupingValues];
      [v5 groupingValues];
      v17 = objc_super v19 = v8;
      char v12 = [v16 isEqualToDictionary:v17];

      id v8 = v19;
    }
    v11 = v20;
    id v10 = v21;
    if (v8 == v9) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)selector
{
  return self->_selector;
}

- (NSDictionary)groupingValues
{
  return self->_groupingValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingValues, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end