@interface IP_emptyPreferences_migrator
- (id)performMigrationForPreferences:(id)a3;
@end

@implementation IP_emptyPreferences_migrator

- (id)performMigrationForPreferences:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ISMigrator *)self platform] != 2
    || [(ISMigrator *)self previousSchemaVersion] >= 0xFA0
    || ([v4 objectForKeyedSubscript:@"AppleLocale"],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (void *)v5,
        [v4 objectForKeyedSubscript:@"AppleLanguages"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = v4;
  }
  else
  {
    v10 = MigrationLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[IP_emptyPreferences_migrator performMigrationForPreferences:]";
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_impl(&dword_1BECA5000, v10, OS_LOG_TYPE_DEFAULT, "%s: Languages or locale is empty. Preferences: %{public}@", (uint8_t *)&v23, 0x16u);
    }

    id v8 = (id)[v4 mutableCopy];
    v11 = [v8 objectForKeyedSubscript:@"AppleLanguages"];

    if (!v11) {
      [v8 setObject:&unk_1F19D8930 forKeyedSubscript:@"AppleLanguages"];
    }
    v12 = [v4 objectForKeyedSubscript:@"AppleLocale"];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4F1CA20];
      v14 = [v4 objectForKeyedSubscript:@"AppleLocale"];
      v15 = [v13 localeWithLocaleIdentifier:v14];
      v16 = [v15 regionCode];
    }
    else
    {
      v16 = @"US";
    }
    v17 = [IPLanguageListManager alloc];
    v18 = [v8 objectForKeyedSubscript:@"AppleLanguages"];
    v19 = [(IPLanguageListManager *)v17 initWithPreferredLanguages:v18];

    v20 = (void *)MEMORY[0x1E4F1CA20];
    v21 = [(IPLanguageListManager *)v19 deviceLanguage];
    v22 = [v20 _localeIdentifierForLanguage:v21 region:v16];
    [v8 setObject:v22 forKeyedSubscript:@"AppleLocale"];
  }
  return v8;
}

@end