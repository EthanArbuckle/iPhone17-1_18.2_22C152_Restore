@interface _CDPeopleSuggesterContext
+ (id)currentContext;
- (NSDate)date;
- (NSSet)contentUTIs;
- (NSSet)nearbyPeople;
- (NSSet)seedContactIdentifiers;
- (NSString)consumerIdentifier;
- (NSString)contactPrefix;
- (NSString)locationUUID;
- (NSString)title;
- (_CDInteraction)activeInteraction;
- (_CDPeopleSuggesterContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActiveInteraction:(id)a3;
- (void)setConsumerIdentifier:(id)a3;
- (void)setContactPrefix:(id)a3;
- (void)setContentUTIs:(id)a3;
- (void)setDate:(id)a3;
- (void)setLocationUUID:(id)a3;
- (void)setNearbyPeople:(id)a3;
- (void)setSeedContactIdentifiers:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _CDPeopleSuggesterContext

+ (id)currentContext
{
  v2 = objc_alloc_init(_CDPeopleSuggesterContext);
  return v2;
}

- (_CDPeopleSuggesterContext)init
{
  v11.receiver = self;
  v11.super_class = (Class)_CDPeopleSuggesterContext;
  v2 = [(_CDPeopleSuggesterContext *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    locationUUID = v2->_locationUUID;
    v2->_locationUUID = 0;

    title = v2->_title;
    v2->_title = 0;

    contactPrefix = v2->_contactPrefix;
    v2->_contactPrefix = 0;

    seedContactIdentifiers = v2->_seedContactIdentifiers;
    v2->_seedContactIdentifiers = 0;

    consumerIdentifier = v2->_consumerIdentifier;
    v2->_consumerIdentifier = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = [(_CDPeopleSuggesterContext *)self date];
    [v4 setDate:v5];

    v6 = [(_CDPeopleSuggesterContext *)self locationUUID];
    [v4 setLocationUUID:v6];

    v7 = [(_CDPeopleSuggesterContext *)self title];
    [v4 setTitle:v7];

    v8 = [(_CDPeopleSuggesterContext *)self contactPrefix];
    [v4 setContactPrefix:v8];

    v9 = [(_CDPeopleSuggesterContext *)self seedContactIdentifiers];
    [v4 setSeedContactIdentifiers:v9];

    v10 = [(_CDPeopleSuggesterContext *)self consumerIdentifier];
    [v4 setConsumerIdentifier:v10];

    objc_super v11 = [(_CDPeopleSuggesterContext *)self contentUTIs];
    [v4 setContentUTIs:v11];

    v12 = [(_CDPeopleSuggesterContext *)self nearbyPeople];
    [v4 setNearbyPeople:v12];

    v13 = [(_CDPeopleSuggesterContext *)self activeInteraction];
    [v4 setActiveInteraction:v13];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"Context {\n"];
  id v4 = [(_CDPeopleSuggesterContext *)self date];
  [v3 appendFormat:@"                      date: %@\n", v4];

  v5 = [(_CDPeopleSuggesterContext *)self locationUUID];
  [v3 appendFormat:@"              locationUUID: %@\n", v5];

  v6 = [(_CDPeopleSuggesterContext *)self title];
  [v3 appendFormat:@"                     title: %@\n", v6];

  v7 = [(_CDPeopleSuggesterContext *)self contactPrefix];
  [v3 appendFormat:@"             contactPrefix: %@\n", v7];

  v8 = [(_CDPeopleSuggesterContext *)self seedContactIdentifiers];
  [v3 appendFormat:@"    seedContactIdentifiers: %@\n", v8];

  v9 = [(_CDPeopleSuggesterContext *)self consumerIdentifier];
  [v3 appendFormat:@"        consumerIdentifier: %@\n", v9];

  v10 = [(_CDPeopleSuggesterContext *)self nearbyPeople];
  [v3 appendFormat:@"              nearbyPeople: %@\n", v10];

  objc_super v11 = [(_CDPeopleSuggesterContext *)self activeInteraction];
  [v3 appendFormat:@"         activeInteraction: %@\n", v11];

  v12 = [(_CDPeopleSuggesterContext *)self contentUTIs];
  [v3 appendFormat:@"               contentUTIs: %@\n", v12];

  [v3 appendFormat:@"}\n"];
  return v3;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)locationUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocationUUID:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)contactPrefix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactPrefix:(id)a3
{
}

- (NSSet)seedContactIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSeedContactIdentifiers:(id)a3
{
}

- (NSSet)nearbyPeople
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNearbyPeople:(id)a3
{
}

- (NSString)consumerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConsumerIdentifier:(id)a3
{
}

- (NSSet)contentUTIs
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContentUTIs:(id)a3
{
}

- (_CDInteraction)activeInteraction
{
  return (_CDInteraction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInteraction, 0);
  objc_storeStrong((id *)&self->_contentUTIs, 0);
  objc_storeStrong((id *)&self->_consumerIdentifier, 0);
  objc_storeStrong((id *)&self->_nearbyPeople, 0);
  objc_storeStrong((id *)&self->_seedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactPrefix, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end