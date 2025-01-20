@interface ATXSettingsAction
+ (BOOL)isActionEligibleForSettingsSuggestions:(id)a3;
+ (BOOL)isActionEligibleForSettingsSuggestionsWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4;
+ (BOOL)supportsSecureCoding;
- (ATXProactiveSuggestion)proactiveSuggestion;
- (ATXSettingsAction)initWithAction:(id)a3;
- (ATXSettingsAction)initWithAction:(id)a3 date:(id)a4;
- (ATXSettingsAction)initWithCoder:(id)a3;
- (ATXSettingsAction)initWithNavigationLink:(id)a3;
- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3;
- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3 action:(id)a4 date:(id)a5 navigationLink:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSettingsAction:(id)a3;
- (LNAction)linkAction;
- (NSDate)date;
- (NSURL)navigationLink;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)navigationLink;
@end

@implementation ATXSettingsAction

- (ATXSettingsAction)initWithNavigationLink:(id)a3
{
  return [(ATXSettingsAction *)self initWithProactiveSuggestion:0 action:0 date:0 navigationLink:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSettingsAction *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSettingsAction *)self isEqualToATXSettingsAction:v5];

  return v6;
}

- (BOOL)isEqualToATXSettingsAction:(id)a3
{
  id v4 = a3;
  v5 = [(ATXSettingsAction *)self navigationLink];
  BOOL v6 = [v4 navigationLink];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(ATXSettingsAction *)self navigationLink];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSURL)navigationLink
{
  navigationLink = self->_navigationLink;
  if (navigationLink)
  {
    unint64_t v3 = navigationLink;
  }
  else
  {
    id v4 = [(LNAction *)self->_linkAction parameters];
    v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_52);

    BOOL v6 = [v5 firstObject];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 value];
      v9 = [v8 value];
      Class v10 = NSClassFromString(&cfstr_Lnentity.isa);
      id v11 = v9;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      if (v13)
      {
        v14 = [v13 properties];
        v15 = objc_msgSend(v14, "_pas_filteredArrayWithTest:", &__block_literal_global_47_1);

        v16 = [v15 firstObject];
        v17 = v16;
        if (v16)
        {
          v18 = [v16 value];
          v19 = [v18 value];
          Class v20 = NSClassFromString(&cfstr_Nsurl.isa);
          id v21 = v19;
          if (v20)
          {
            if (objc_opt_isKindOfClass()) {
              v22 = v21;
            }
            else {
              v22 = 0;
            }
          }
          else
          {
            v22 = 0;
          }
          v23 = v22;

          if (v23)
          {
            v23 = v23;
            unint64_t v3 = (NSURL *)v23;
          }
          else
          {
            v24 = __atxlog_handle_settings_actions();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              -[ATXSettingsAction navigationLink].cold.4(v17);
            }

            unint64_t v3 = 0;
          }
        }
        else
        {
          v23 = __atxlog_handle_settings_actions();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[ATXSettingsAction navigationLink](v23);
          }
          unint64_t v3 = 0;
        }
      }
      else
      {
        v15 = __atxlog_handle_settings_actions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[ATXSettingsAction navigationLink](v7);
        }
        unint64_t v3 = 0;
      }
    }
    else
    {
      v13 = __atxlog_handle_settings_actions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[ATXSettingsAction navigationLink](v13);
      }
      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);

  objc_storeStrong((id *)&self->_navigationLink, 0);
}

- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3 action:(id)a4 date:(id)a5 navigationLink:(id)a6
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  unint64_t v15 = (unint64_t)a6;
  if (!(v13 | v15))
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ATXSettingsAction.m", 66, @"Invalid parameter not satisfying: %@", @"action || navigationLink" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)ATXSettingsAction;
  v16 = [(ATXSettingsAction *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_proactiveSuggestion, a3);
    objc_storeStrong((id *)&v17->_linkAction, a4);
    objc_storeStrong((id *)&v17->_date, a5);
    objc_storeStrong((id *)&v17->_navigationLink, a6);
  }

  return v17;
}

- (ATXSettingsAction)initWithProactiveSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 executableSpecification];
  BOOL v6 = [v5 executableObject];
  Class v7 = NSClassFromString(&cfstr_Atxaction_0.isa);
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = [v10 intent];
    Class v12 = NSClassFromString(&cfstr_Inappintent.isa);
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
    id v16 = v14;

    if (v16)
    {
      v17 = [v16 linkAction];
      if (v17)
      {
        self = [(ATXSettingsAction *)self initWithProactiveSuggestion:v4 action:v17 date:0 navigationLink:0];
        unint64_t v15 = self;
      }
      else
      {
        unint64_t v15 = 0;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (ATXSettingsAction)initWithAction:(id)a3
{
  return [(ATXSettingsAction *)self initWithProactiveSuggestion:0 action:a3 date:0 navigationLink:0];
}

- (ATXSettingsAction)initWithAction:(id)a3 date:(id)a4
{
  return [(ATXSettingsAction *)self initWithProactiveSuggestion:0 action:a3 date:a4 navigationLink:0];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(LNAction *)self->_linkAction description];
  date = self->_date;
  BOOL v6 = [(ATXProactiveSuggestion *)self->_proactiveSuggestion scoreSpecification];
  [v6 rawScore];
  id v8 = (void *)[v3 initWithFormat:@"Action: %@; Date: %@; Score: %f", v4, date, v7];

  return v8;
}

uint64_t __35__ATXSettingsAction_navigationLink__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"target"];

  return v3;
}

uint64_t __35__ATXSettingsAction_navigationLink__block_invoke_45(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"navigationLink"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  proactiveSuggestion = self->_proactiveSuggestion;
  id v5 = a3;
  [v5 encodeObject:proactiveSuggestion forKey:@"proactiveSuggestion"];
  [v5 encodeObject:self->_linkAction forKey:@"action"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (ATXSettingsAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proactiveSuggestion"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    self = [(ATXSettingsAction *)self initWithProactiveSuggestion:v6 action:v5 date:v7 navigationLink:0];

    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)isActionEligibleForSettingsSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 intent];
  Class v6 = NSClassFromString(&cfstr_Inappintent.isa);
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [v4 bundleId];
    id v11 = [v9 appIntentIdentifier];
    char v12 = [a1 isActionEligibleForSettingsSuggestionsWithBundleIdentifier:v10 actionIdentifier:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)isActionEligibleForSettingsSuggestionsWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:@"com.apple."]) {
    char v7 = [v6 isEqualToString:@"SettingsNavigationEventDonationIntent"];
  }
  else {
    char v7 = 0;
  }
  char v8 = [v5 isEqualToString:@"com.apple.DEC.PredictionAnalyzer"];
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(@"usePredictionsAppForTestingSettingsActions", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
    {
      char v9 = v8;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }
  char v10 = v7 | v9;

  return v10;
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (NSDate)date
{
  return self->_date;
}

- (void)navigationLink
{
  v1 = [a1 value];
  v2 = [v1 value];
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v4, v5, "Settings action does not have a navigation link containing a URL anymore; actual: %@",
    v6,
    v7,
    v8,
    v9,
    2u);
}

@end