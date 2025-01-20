@interface CalMockCalendarDataContainerProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)accountUsesDataSeparatedContainer:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CalMockCalendarDataContainerProvider)initWithAccountDataContainerMap:(id)a3 defaultDataContainer:(id)a4;
- (CalMockCalendarDataContainerProvider)initWithCalendarDataContainerURL:(id)a3;
- (CalMockCalendarDataContainerProvider)initWithCoder:(id)a3;
- (id)containerForAccountIdentifier:(id)a3;
- (id)containerInfoForAccount:(id)a3;
- (id)containerInfoForAccountIdentifier:(id)a3;
- (id)containerInfoForPersonaIdentifier:(id)a3;
- (id)personaForAccountIdentifier:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CalMockCalendarDataContainerProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalMockCalendarDataContainerProvider)initWithCalendarDataContainerURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalMockCalendarDataContainerProvider;
  v6 = [(CalMockCalendarDataContainerProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_calendarDataContainerURL, a3);
  }

  return v7;
}

- (CalMockCalendarDataContainerProvider)initWithAccountDataContainerMap:(id)a3 defaultDataContainer:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CalMockCalendarDataContainerProvider;
  objc_super v9 = [(CalMockCalendarDataContainerProvider *)&v27 init];
  v10 = v9;
  if (v9)
  {
    id v22 = v8;
    objc_storeStrong((id *)&v9->_calendarDataContainerURL, a4);
    objc_storeStrong((id *)&v10->_accountsWithSpecificContainers, a3);
    v11 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v18 = [v12 objectForKeyedSubscript:v17];
          v19 = [@"persona-for-" stringByAppendingString:v17];
          [(NSDictionary *)v11 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    personaIDsByContainer = v10->_personaIDsByContainer;
    v10->_personaIDsByContainer = v11;

    id v8 = v22;
  }

  return v10;
}

- (CalMockCalendarDataContainerProvider)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v5 decodeObjectOfClasses:v8 forKey:@"accountsWithSpecificContainers"];

  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"calendarDataContainerURL"];

  v11 = [(CalMockCalendarDataContainerProvider *)self initWithAccountDataContainerMap:v9 defaultDataContainer:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  accountsWithSpecificContainers = self->_accountsWithSpecificContainers;
  id v5 = a3;
  [v5 encodeObject:accountsWithSpecificContainers forKey:@"accountsWithSpecificContainers"];
  [v5 encodeObject:self->_calendarDataContainerURL forKey:@"calendarDataContainerURL"];
}

- (id)containerForAccountIdentifier:(id)a3
{
  v4 = [(NSDictionary *)self->_accountsWithSpecificContainers objectForKeyedSubscript:a3];
  calendarDataContainerURL = v4;
  if (!v4) {
    calendarDataContainerURL = self->_calendarDataContainerURL;
  }
  uint64_t v6 = calendarDataContainerURL;

  return v6;
}

- (id)personaForAccountIdentifier:(id)a3
{
  v4 = [(NSDictionary *)self->_accountsWithSpecificContainers objectForKeyedSubscript:a3];
  id v5 = [(NSDictionary *)self->_personaIDsByContainer objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)accountUsesDataSeparatedContainer:(id)a3
{
  v3 = [(NSDictionary *)self->_accountsWithSpecificContainers objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)containerInfoForAccount:(id)a3
{
  BOOL v4 = [a3 identifier];
  id v5 = [(CalMockCalendarDataContainerProvider *)self containerInfoForAccountIdentifier:v4];

  return v5;
}

- (id)containerInfoForAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CalMockCalendarDataContainerInfo);
  [(CalMockCalendarDataContainerInfo *)v5 setAccountID:v4];
  uint64_t v6 = [(CalMockCalendarDataContainerProvider *)self personaForAccountIdentifier:v4];
  [(CalMockCalendarDataContainerInfo *)v5 setPersonaID:v6];

  uint64_t v7 = [(CalMockCalendarDataContainerProvider *)self containerForAccountIdentifier:v4];
  [(CalMockCalendarDataContainerInfo *)v5 setContainerURL:v7];

  BOOL v8 = [(CalMockCalendarDataContainerProvider *)self accountUsesDataSeparatedContainer:v4];
  [(CalMockCalendarDataContainerInfo *)v5 setUsesDataSeparatedContainer:v8];

  return v5;
}

- (id)containerInfoForPersonaIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_accountsWithSpecificContainers;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = -[CalMockCalendarDataContainerProvider personaForAccountIdentifier:](self, "personaForAccountIdentifier:", v10, (void)v14);
        if ([v4 isEqualToString:v11])
        {
          id v12 = [(CalMockCalendarDataContainerProvider *)self containerInfoForAccountIdentifier:v10];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v12 = objc_alloc_init(CalMockCalendarDataContainerInfo);
  [(CalMockCalendarDataContainerInfo *)v12 setPersonaID:v4];
  [(CalMockCalendarDataContainerInfo *)v12 setContainerURL:self->_calendarDataContainerURL];
  [(CalMockCalendarDataContainerInfo *)v12 setUsesDataSeparatedContainer:0];
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_calendarDataContainerURL hash];
  uint64_t v4 = [(NSDictionary *)self->_accountsWithSpecificContainers hash] + v3;
  return v4 + [(NSDictionary *)self->_personaIDsByContainer hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(NSURL *)self->_calendarDataContainerURL isEqual:v5[1]]
      && [(NSDictionary *)self->_accountsWithSpecificContainers isEqual:v5[2]])
    {
      char v6 = [(NSDictionary *)self->_personaIDsByContainer isEqual:v5[3]];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaIDsByContainer, 0);
  objc_storeStrong((id *)&self->_accountsWithSpecificContainers, 0);

  objc_storeStrong((id *)&self->_calendarDataContainerURL, 0);
}

@end