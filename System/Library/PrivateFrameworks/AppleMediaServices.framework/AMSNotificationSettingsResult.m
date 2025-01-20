@interface AMSNotificationSettingsResult
+ (id)_sectionsFromDictionaryRepresentation:(id)a3;
- (AMSNotificationSettingsResult)initWithDictionaryRepresentation:(id)a3;
- (NSArray)sections;
@end

@implementation AMSNotificationSettingsResult

- (AMSNotificationSettingsResult)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSNotificationSettingsResult;
  v5 = [(AMSNotificationSettingsResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _sectionsFromDictionaryRepresentation:v4];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;
  }
  return v5;
}

+ (id)_sectionsFromDictionaryRepresentation:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = [v4 objectForKeyedSubscript:@"sections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_101);

  return v7;
}

AMSNotificationSettingsSection *__71__AMSNotificationSettingsResult__sectionsFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AMSNotificationSettingsSection alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end