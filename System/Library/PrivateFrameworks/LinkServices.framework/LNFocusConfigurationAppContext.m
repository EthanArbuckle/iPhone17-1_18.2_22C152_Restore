@interface LNFocusConfigurationAppContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNFocusConfigurationAppContext)initWithCoder:(id)a3;
- (LNFocusConfigurationAppContext)initWithNotificationFilterPredicate:(id)a3 targetContentIdentifierPrefix:(id)a4;
- (NSPredicate)notificationFilterPredicate;
- (NSString)targetContentIdentifierPrefix;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNFocusConfigurationAppContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifierPrefix, 0);
  objc_storeStrong((id *)&self->_notificationFilterPredicate, 0);
}

- (NSString)targetContentIdentifierPrefix
{
  return self->_targetContentIdentifierPrefix;
}

- (NSPredicate)notificationFilterPredicate
{
  return self->_notificationFilterPredicate;
}

- (LNFocusConfigurationAppContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationFilterPredicate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentIdentifierPrefix"];

  v7 = [(LNFocusConfigurationAppContext *)self initWithNotificationFilterPredicate:v5 targetContentIdentifierPrefix:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNFocusConfigurationAppContext *)self notificationFilterPredicate];
  [v4 encodeObject:v5 forKey:@"notificationFilterPredicate"];

  id v6 = [(LNFocusConfigurationAppContext *)self targetContentIdentifierPrefix];
  [v4 encodeObject:v6 forKey:@"targetContentIdentifierPrefix"];
}

- (unint64_t)hash
{
  v3 = [(LNFocusConfigurationAppContext *)self notificationFilterPredicate];
  uint64_t v4 = [v3 hash];
  v5 = [(LNFocusConfigurationAppContext *)self targetContentIdentifierPrefix];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(LNFocusConfigurationAppContext *)self notificationFilterPredicate];
      unint64_t v6 = [v4 notificationFilterPredicate];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        id v12 = v7;
        if (!v7 || !v8)
        {
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10) {
          goto LABEL_17;
        }
      }
      v13 = [(LNFocusConfigurationAppContext *)self targetContentIdentifierPrefix];
      v14 = [v4 targetContentIdentifierPrefix];
      id v12 = v13;
      id v15 = v14;
      v11 = v15;
      if (v12 == v15)
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        LOBYTE(v10) = 0;
        if (v12 && v15) {
          LOBYTE(v10) = [v12 isEqual:v15];
        }
      }

      goto LABEL_16;
    }
  }
  LOBYTE(v10) = 0;
LABEL_18:

  return v10;
}

- (LNFocusConfigurationAppContext)initWithNotificationFilterPredicate:(id)a3 targetContentIdentifierPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LNFocusConfigurationAppContext;
  v9 = [(LNFocusConfigurationAppContext *)&v15 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notificationFilterPredicate, a3);
    uint64_t v11 = [v8 copy];
    targetContentIdentifierPrefix = v10->_targetContentIdentifierPrefix;
    v10->_targetContentIdentifierPrefix = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end