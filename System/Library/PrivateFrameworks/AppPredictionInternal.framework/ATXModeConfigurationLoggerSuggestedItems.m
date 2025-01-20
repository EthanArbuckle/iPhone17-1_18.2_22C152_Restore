@interface ATXModeConfigurationLoggerSuggestedItems
- (ATXModeConfigurationLoggerSuggestedItems)init;
- (NSMutableSet)suggestedAllowedApps;
- (NSMutableSet)suggestedAllowedContacts;
- (NSMutableSet)suggestedDeniedApps;
- (NSMutableSet)suggestedDeniedContacts;
- (void)setSuggestedAllowedApps:(id)a3;
- (void)setSuggestedAllowedContacts:(id)a3;
- (void)setSuggestedDeniedApps:(id)a3;
- (void)setSuggestedDeniedContacts:(id)a3;
@end

@implementation ATXModeConfigurationLoggerSuggestedItems

- (ATXModeConfigurationLoggerSuggestedItems)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXModeConfigurationLoggerSuggestedItems;
  v2 = [(ATXModeConfigurationLoggerSuggestedItems *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    suggestedDeniedApps = v2->_suggestedDeniedApps;
    v2->_suggestedDeniedApps = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    suggestedAllowedApps = v2->_suggestedAllowedApps;
    v2->_suggestedAllowedApps = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    suggestedDeniedContacts = v2->_suggestedDeniedContacts;
    v2->_suggestedDeniedContacts = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    suggestedAllowedContacts = v2->_suggestedAllowedContacts;
    v2->_suggestedAllowedContacts = (NSMutableSet *)v9;
  }
  return v2;
}

- (NSMutableSet)suggestedDeniedApps
{
  return self->_suggestedDeniedApps;
}

- (void)setSuggestedDeniedApps:(id)a3
{
}

- (NSMutableSet)suggestedAllowedApps
{
  return self->_suggestedAllowedApps;
}

- (void)setSuggestedAllowedApps:(id)a3
{
}

- (NSMutableSet)suggestedDeniedContacts
{
  return self->_suggestedDeniedContacts;
}

- (void)setSuggestedDeniedContacts:(id)a3
{
}

- (NSMutableSet)suggestedAllowedContacts
{
  return self->_suggestedAllowedContacts;
}

- (void)setSuggestedAllowedContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAllowedContacts, 0);
  objc_storeStrong((id *)&self->_suggestedDeniedContacts, 0);
  objc_storeStrong((id *)&self->_suggestedAllowedApps, 0);
  objc_storeStrong((id *)&self->_suggestedDeniedApps, 0);
}

@end