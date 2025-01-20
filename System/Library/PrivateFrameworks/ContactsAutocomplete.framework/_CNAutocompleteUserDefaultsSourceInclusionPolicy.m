@interface _CNAutocompleteUserDefaultsSourceInclusionPolicy
- (BOOL)includeCalendarServers;
- (BOOL)includeContacts;
- (BOOL)includeDirectoryServers;
- (BOOL)includeLocalExtensions;
- (BOOL)includePredictions;
- (BOOL)includeRecents;
- (BOOL)includeStewie;
- (BOOL)includeSuggestions;
- (BOOL)includeSupplementalResults;
- (CNUserDefaults)userDefaults;
- (_CNAutocompleteUserDefaultsSourceInclusionPolicy)initWithUserDefaults:(id)a3;
@end

@implementation _CNAutocompleteUserDefaultsSourceInclusionPolicy

- (_CNAutocompleteUserDefaultsSourceInclusionPolicy)initWithUserDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteUserDefaultsSourceInclusionPolicy;
  v6 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)includeContacts
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNLocalContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNLocalContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include local contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeRecents
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNRecentContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNRecentContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include recent contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeStewie
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNStewieInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNStewieInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include stewie contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeSuggestions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNSuggestedContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNSuggestedContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include suggested contacts: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeLocalExtensions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNLocalExtensionContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNLocalExtensionContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include local extensions: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includePredictions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNDuetContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNDuetContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include predicted contacts: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeDirectoryServers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNServerContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNServerContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include directory server contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeCalendarServers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNCalendarServerContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNCalendarServerContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include calendar server contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)includeSupplementalResults
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(_CNAutocompleteUserDefaultsSourceInclusionPolicy *)self userDefaults];
  int v3 = [v2 userHasOptedOutOfPreference:@"CNSupplementalContactsInAutocomplete"];

  if (v3)
  {
    v4 = CNALoggingContextDebug();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      v7 = @"CNSupplementalContactsInAutocomplete";
      _os_log_impl(&dword_1BEF57000, v4, OS_LOG_TYPE_DEFAULT, "Will not include supplemental contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end