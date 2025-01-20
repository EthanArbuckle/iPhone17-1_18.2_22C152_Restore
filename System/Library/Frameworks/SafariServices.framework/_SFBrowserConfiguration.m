@interface _SFBrowserConfiguration
- (BOOL)allowsKeyboardCorrectionLearning;
- (BOOL)allowsNetworkedSearchSuggestions;
- (BOOL)allowsPersistingTabState;
- (BOOL)allowsReopeningClosedTabs;
- (BOOL)allowsRestoringEducationTabs;
- (BOOL)allowsSearchFeedback;
- (BOOL)allowsSiteSpecificSearch;
- (BOOL)allowsSpeculativeLoading;
- (BOOL)allowsStreamlinedLogin;
- (BOOL)allowsUserActivityFeedback;
- (BOOL)isControlledByAutomation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)usesDarkTheme;
- (BOOL)usesPersistentDataStore;
- (UITraitEnvironment)traitEnvironment;
- (_SFBrowserConfiguration)initWithPrivateBrowsingEnabled:(BOOL)a3 traitEnvironment:(id)a4 controlledByAutomation:(BOOL)a5;
- (id)description;
- (int64_t)barTintStyle;
- (unint64_t)hash;
@end

@implementation _SFBrowserConfiguration

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_configuration == 1;
}

- (BOOL)isControlledByAutomation
{
  return self->_configuration == 2;
}

- (int64_t)barTintStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);
  v4 = WeakRetained;
  int64_t configuration = self->_configuration;
  if (configuration == 1) {
    goto LABEL_5;
  }
  if (configuration) {
    goto LABEL_8;
  }
  v6 = [WeakRetained traitCollection];
  unint64_t v7 = [v6 userInterfaceStyle];

  if (v7 >= 3)
  {
LABEL_5:
    v9 = [v4 traitCollection];
    unint64_t v7 = [v9 userInterfaceStyle];

    if (v7 < 3)
    {
      v8 = &unk_1A6A8A768;
      goto LABEL_7;
    }
LABEL_8:
    int64_t v10 = 5;
    goto LABEL_9;
  }
  v8 = &unk_1A6A8A750;
LABEL_7:
  int64_t v10 = v8[v7];
LABEL_9:

  return v10;
}

- (BOOL)allowsSpeculativeLoading
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void).cxx_destruct
{
}

- (_SFBrowserConfiguration)initWithPrivateBrowsingEnabled:(BOOL)a3 traitEnvironment:(id)a4 controlledByAutomation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFBrowserConfiguration;
  id v7 = a4;
  v8 = [(_SFBrowserConfiguration *)&v11 init];
  objc_storeWeak((id *)&v8->_traitEnvironment, v7);

  uint64_t v9 = 2;
  if (!v5) {
    uint64_t v9 = 0;
  }
  if (v6) {
    uint64_t v9 = 1;
  }
  v8->_int64_t configuration = v9;
  return v8;
}

- (BOOL)usesPersistentDataStore
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsUserActivityFeedback
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsSearchFeedback
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsRestoringEducationTabs
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsNetworkedSearchSuggestions
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsKeyboardCorrectionLearning
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (UITraitEnvironment)traitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitEnvironment);

  return (UITraitEnvironment *)WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SFBrowserConfiguration *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && self->_configuration == v5->_configuration;
  }

  return v6;
}

- (unint64_t)hash
{
  return 0x5555555555555555 * self->_configuration;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t configuration = self->_configuration;
  BOOL v6 = @"default";
  if (configuration == 1) {
    BOOL v6 = @"private";
  }
  if (configuration == 2) {
    id v7 = @"automation";
  }
  else {
    id v7 = v6;
  }
  return (id)[v3 stringWithFormat:@"<%@: %p; %@>", v4, self, v7];
}

- (BOOL)allowsSiteSpecificSearch
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)allowsStreamlinedLogin
{
  return self->_configuration != 2;
}

- (BOOL)allowsPersistingTabState
{
  return self->_configuration != 2;
}

- (BOOL)allowsReopeningClosedTabs
{
  return (unint64_t)(self->_configuration - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)usesDarkTheme
{
  int64_t v2 = [(_SFBrowserConfiguration *)self barTintStyle];

  return MEMORY[0x1F412FC48](v2);
}

@end