@interface CHSHCKContainerUserDefaults
- (CHSHCKContainerUserDefaults)init;
- (CHSHCKContainerUserDefaults)initWithContainerIdentifier:(id)a3;
- (NSData)previousServerChangeTokenData;
- (NSDate)transactionRecordZoneCreationDate;
- (NSDate)transactionRecordZoneFetchDate;
- (NSDate)transactionRecordZoneSubscriptionCreationDate;
- (NSString)containerIdentifier;
- (id)containerUserDefaultsObjectForKey:(id)a3;
- (void)setContainerUserDefaultsObject:(id)a3 forKey:(id)a4;
- (void)setPreviousServerChangeTokenData:(id)a3;
- (void)setTransactionRecordZoneCreationDate:(id)a3;
- (void)setTransactionRecordZoneFetchDate:(id)a3;
- (void)setTransactionRecordZoneSubscriptionCreationDate:(id)a3;
@end

@implementation CHSHCKContainerUserDefaults

- (CHSHCKContainerUserDefaults)init
{
  return 0;
}

- (CHSHCKContainerUserDefaults)initWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSHCKContainerUserDefaults;
  v5 = [(CHSHCKContainerUserDefaults *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = v6;
  }
  return v5;
}

- (id)containerUserDefaultsObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(CHSHCKContainerUserDefaults *)self containerIdentifier];
  if (v5)
  {
    v6 = +[NSUserDefaults standardUserDefaults];
    v7 = [v6 dictionaryForKey:v5];

    v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setContainerUserDefaultsObject:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [(CHSHCKContainerUserDefaults *)self containerIdentifier];
  if (v7)
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    objc_super v9 = [v8 dictionaryForKey:v7];
    id v10 = [v9 mutableCopy];

    if (!v10)
    {
      id v10 = +[NSMutableDictionary dictionary];
    }
    [v10 setObject:v12 forKeyedSubscript:v6];
    v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:v10 forKey:v7];
  }
}

- (NSData)previousServerChangeTokenData
{
  v3 = NSStringFromSelector("previousServerChangeTokenData");
  id v4 = [(CHSHCKContainerUserDefaults *)self containerUserDefaultsObjectForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (void)setPreviousServerChangeTokenData:(id)a3
{
  id v4 = a3;
  NSStringFromSelector("previousServerChangeTokenData");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CHSHCKContainerUserDefaults *)self setContainerUserDefaultsObject:v4 forKey:v5];
}

- (NSDate)transactionRecordZoneCreationDate
{
  v3 = NSStringFromSelector("transactionRecordZoneCreationDate");
  id v4 = [(CHSHCKContainerUserDefaults *)self containerUserDefaultsObjectForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setTransactionRecordZoneCreationDate:(id)a3
{
  id v4 = a3;
  NSStringFromSelector("transactionRecordZoneCreationDate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CHSHCKContainerUserDefaults *)self setContainerUserDefaultsObject:v4 forKey:v5];
}

- (NSDate)transactionRecordZoneFetchDate
{
  v3 = NSStringFromSelector("transactionRecordZoneFetchDate");
  id v4 = [(CHSHCKContainerUserDefaults *)self containerUserDefaultsObjectForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setTransactionRecordZoneFetchDate:(id)a3
{
  id v4 = a3;
  NSStringFromSelector("transactionRecordZoneFetchDate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CHSHCKContainerUserDefaults *)self setContainerUserDefaultsObject:v4 forKey:v5];
}

- (NSDate)transactionRecordZoneSubscriptionCreationDate
{
  v3 = NSStringFromSelector("transactionRecordZoneSubscriptionCreationDate");
  id v4 = [(CHSHCKContainerUserDefaults *)self containerUserDefaultsObjectForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setTransactionRecordZoneSubscriptionCreationDate:(id)a3
{
  id v4 = a3;
  NSStringFromSelector("transactionRecordZoneSubscriptionCreationDate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CHSHCKContainerUserDefaults *)self setContainerUserDefaultsObject:v4 forKey:v5];
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
}

@end