@interface MUPlaceHoursSectionViewConfiguration
+ (id)configurationForBusinessHours:(id)a3;
+ (id)configurationForMapItem:(id)a3;
+ (id)configurationForMessagesMapItem:(id)a3;
- (MUBusinessHoursConfiguration)placeHours;
- (NSArray)serviceHoursList;
- (unint64_t)numberOfInlineServiceHours;
- (void)setNumberOfInlineServiceHours:(unint64_t)a3;
- (void)setPlaceHours:(id)a3;
- (void)setServiceHoursList:(id)a3;
@end

@implementation MUPlaceHoursSectionViewConfiguration

+ (id)configurationForMapItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 _hasBusinessHours])
  {
    v5 = [MUBusinessHoursConfiguration alloc];
    v6 = [v3 _businessHours];
    v7 = [v3 timeZone];
    v8 = [(MUBusinessHoursConfiguration *)v5 initWithBusinessHours:v6 timeZone:v7];

    v9 = _MULocalizedStringFromThisBundle(@"Hours [Placecard]");
    [(MUBusinessHoursConfiguration *)v8 setHoursName:v9];

    [v4 addObject:v8];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v27 = v3;
  v10 = objc_msgSend(v3, "_linkedServices", a1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v16 = [v15 businessHours];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          v18 = [MUBusinessHoursConfiguration alloc];
          v19 = [v15 businessHours];
          v20 = [v15 timeZone];
          v21 = [(MUBusinessHoursConfiguration *)v18 initWithBusinessHours:v19 timeZone:v20];

          v22 = [v15 localizedCategoryName];
          [(MUBusinessHoursConfiguration *)v21 setHoursName:v22];

          [(MUBusinessHoursConfiguration *)v21 setIsServiceHours:1];
          [v4 addObject:v21];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  v23 = [v26 configurationForBusinessHours:v4];

  return v23;
}

+ (id)configurationForMessagesMapItem:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 _messageBusinessHours];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v4 _geoMapItem];
    v9 = [v8 _messageLink];
    v10 = [v9 timeZone];

    if (v10)
    {
      uint64_t v11 = [MUBusinessHoursConfiguration alloc];
      uint64_t v12 = [v4 _messageBusinessHours];
      v21[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      v14 = [v4 _geoMapItem];
      v15 = [v14 _messageLink];
      v16 = [v15 timeZone];
      uint64_t v17 = [(MUBusinessHoursConfiguration *)v11 initWithBusinessHours:v13 timeZone:v16];

      v18 = _MULocalizedStringFromThisBundle(@"Messages Hours [Placecard]");
      [(MUBusinessHoursConfiguration *)v17 setHoursName:v18];

      [v5 addObject:v17];
    }
  }
  v19 = [a1 configurationForBusinessHours:v5];

  return v19;
}

+ (id)configurationForBusinessHours:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MUPlaceHoursSectionViewConfiguration);
  id v5 = (void *)[v3 mutableCopy];
  if ([v3 count])
  {
    uint64_t v6 = [v3 firstObject];
    char v7 = [v6 isServiceHours];

    if ((v7 & 1) == 0)
    {
      v8 = [v3 firstObject];
      [(MUPlaceHoursSectionViewConfiguration *)v4 setPlaceHours:v8];

      [v5 removeObjectAtIndex:0];
    }
  }
  v9 = (void *)[v5 copy];
  [(MUPlaceHoursSectionViewConfiguration *)v4 setServiceHoursList:v9];

  [(MUPlaceHoursSectionViewConfiguration *)v4 setNumberOfInlineServiceHours:GEOConfigGetUInteger()];
  return v4;
}

- (MUBusinessHoursConfiguration)placeHours
{
  return self->_placeHours;
}

- (void)setPlaceHours:(id)a3
{
}

- (NSArray)serviceHoursList
{
  return self->_serviceHoursList;
}

- (void)setServiceHoursList:(id)a3
{
}

- (unint64_t)numberOfInlineServiceHours
{
  return self->_numberOfInlineServiceHours;
}

- (void)setNumberOfInlineServiceHours:(unint64_t)a3
{
  self->_numberOfInlineServiceHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceHoursList, 0);
  objc_storeStrong((id *)&self->_placeHours, 0);
}

@end