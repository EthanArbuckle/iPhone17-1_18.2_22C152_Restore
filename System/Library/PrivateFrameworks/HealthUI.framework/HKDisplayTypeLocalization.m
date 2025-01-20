@interface HKDisplayTypeLocalization
- (BOOL)isEqual:(id)a3;
- (HKDisplayTypeLocalization)init;
- (HKDisplayTypeLocalization)initWithDisplayNameKey:(id)a3 labelDisplayNameKey:(id)a4 localizationTableNameOverride:(id)a5 localizedKeySuffix:(id)a6 unitNameKeyOverrides:(id)a7;
- (NSDictionary)unitNameKeyOverrides;
- (NSSet)keywords;
- (NSString)cautionaryText;
- (NSString)displayName;
- (NSString)displayNameForFitnessJr;
- (NSString)displayNameKey;
- (NSString)embeddedDisplayName;
- (NSString)labelDisplayName;
- (NSString)localizationTableNameOverride;
- (NSString)localizedKeySuffix;
- (NSString)shortenedDisplayName;
- (NSString)summary;
- (NSString)summaryForEnhancedFeature;
- (NSString)summaryForFitnessJr;
- (NSString)summaryForPairedWatch;
- (NSString)titleEmbeddedDisplayName;
- (NSString)unitChangeCautionaryText;
- (id)_localizedStringForKeyOrNil:(id)a3;
- (id)_localizedStringWithKey:(id)a3;
- (id)_rawLocalizedStringForKey:(id)a3;
- (id)copyWithLocalizationTableNameOverride:(id)a3;
- (id)copyWithLocalizedKeySuffix:(id)a3;
- (id)unitDisplayNameKeyOverrideForUnit:(id)a3 nameContext:(int64_t)a4;
- (unint64_t)hash;
- (void)_expandLocalizationKeys;
@end

@implementation HKDisplayTypeLocalization

- (id)_localizedStringWithKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_localizedKeySuffix)
  {
    objc_msgSend(v4, "stringByAppendingString:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;
  v8 = [(HKDisplayTypeLocalization *)self _rawLocalizedStringForKey:v6];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(HKDisplayTypeLocalization *)self _rawLocalizedStringForKey:v5];
  }
  v11 = v10;

  return v11;
}

- (id)_rawLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  localizationTableNameOverride = self->_localizationTableNameOverride;
  p_localizationTableNameOverride = &self->_localizationTableNameOverride;
  v7 = HKHealthKitFrameworkBundle();
  v8 = v7;
  v9 = (NSString **)MEMORY[0x1E4F29E40];
  if (localizationTableNameOverride) {
    v9 = p_localizationTableNameOverride;
  }
  id v10 = [v7 localizedStringForKey:v4 value:&stru_1F3B9CF20 table:*v9];

  if ([v10 isEqualToString:v4])
  {

    id v10 = 0;
  }

  return v10;
}

- (HKDisplayTypeLocalization)initWithDisplayNameKey:(id)a3 labelDisplayNameKey:(id)a4 localizationTableNameOverride:(id)a5 localizedKeySuffix:(id)a6 unitNameKeyOverrides:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKDisplayTypeLocalization;
  v17 = [(HKDisplayTypeLocalization *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    displayNameKey = v17->_displayNameKey;
    v17->_displayNameKey = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    labelDisplayNameKey = v17->_labelDisplayNameKey;
    v17->_labelDisplayNameKey = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    localizationTableNameOverride = v17->_localizationTableNameOverride;
    v17->_localizationTableNameOverride = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    localizedKeySuffix = v17->_localizedKeySuffix;
    v17->_localizedKeySuffix = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    unitNameKeyOverrides = v17->_unitNameKeyOverrides;
    v17->_unitNameKeyOverrides = (NSDictionary *)v26;

    [(HKDisplayTypeLocalization *)v17 _expandLocalizationKeys];
  }

  return v17;
}

- (void)_expandLocalizationKeys
{
  v3 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SHORT"];
  shortenedDisplayNameKey = self->_shortenedDisplayNameKey;
  self->_shortenedDisplayNameKey = v3;

  v5 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_EMBEDDED"];
  embeddedDisplayNameKey = self->_embeddedDisplayNameKey;
  self->_embeddedDisplayNameKey = v5;

  v7 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_TITLE_EMBEDDED"];
  titleEmbeddedDisplayNameKey = self->_titleEmbeddedDisplayNameKey;
  self->_titleEmbeddedDisplayNameKey = v7;

  v9 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_KEYWORDS"];
  keywordsNameKey = self->_keywordsNameKey;
  self->_keywordsNameKey = v9;

  v11 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SUMMARY"];
  summaryNameKey = self->_summaryNameKey;
  self->_summaryNameKey = v11;

  id v13 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SUMMARY_ENHANCED"];
  summaryForEnhancedFeatureNameKey = self->_summaryForEnhancedFeatureNameKey;
  self->_summaryForEnhancedFeatureNameKey = v13;

  id v15 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SUMMARY_PAIRED_WATCH"];
  summaryPairedWatchNameKey = self->_summaryPairedWatchNameKey;
  self->_summaryPairedWatchNameKey = v15;

  v17 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SUMMARY_IPAD"];
  summaryIPadNameKey = self->_summaryIPadNameKey;
  self->_summaryIPadNameKey = v17;

  v19 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_FITNESS_JR"];
  displayNameFitnessJrKey = self->_displayNameFitnessJrKey;
  self->_displayNameFitnessJrKey = v19;

  v21 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_SUMMARY_FITNESS_JR"];
  summaryFitnessJrKey = self->_summaryFitnessJrKey;
  self->_summaryFitnessJrKey = v21;

  v23 = [(NSString *)self->_displayNameKey stringByAppendingString:@"_CAUTIONARY_TEXT"];
  cautionaryTextKey = self->_cautionaryTextKey;
  self->_cautionaryTextKey = v23;

  self->_unitChangeCautionaryTextKey = [(NSString *)self->_displayNameKey stringByAppendingString:@"_UNIT_CHANGE_CAUTIONARY_TEXT"];
  MEMORY[0x1F41817F8]();
}

- (NSString)displayName
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_displayNameKey];
}

- (id)unitDisplayNameKeyOverrideForUnit:(id)a3 nameContext:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(NSDictionary *)self->_unitNameKeyOverrides objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v7;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2
          || ([NSNumber numberWithInteger:a4],
              id v10 = objc_claimAutoreleasedReturnValue(),
              [v9 objectForKeyedSubscript:v10],
              id v8 = (id)objc_claimAutoreleasedReturnValue(),
              v10,
              !v8))
        {
          id v8 = [v9 objectForKeyedSubscript:&unk_1F3C21DD8];
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)localizationTableNameOverride
{
  return self->_localizationTableNameOverride;
}

- (id)copyWithLocalizationTableNameOverride:(id)a3
{
  id v4 = a3;
  v5 = [[HKDisplayTypeLocalization alloc] initWithDisplayNameKey:self->_displayNameKey labelDisplayNameKey:self->_labelDisplayNameKey localizationTableNameOverride:v4 localizedKeySuffix:self->_localizedKeySuffix unitNameKeyOverrides:self->_unitNameKeyOverrides];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitNameKeyOverrides, 0);
  objc_storeStrong((id *)&self->_localizedKeySuffix, 0);
  objc_storeStrong((id *)&self->_localizationTableNameOverride, 0);
  objc_storeStrong((id *)&self->_unitChangeCautionaryTextKey, 0);
  objc_storeStrong((id *)&self->_cautionaryTextKey, 0);
  objc_storeStrong((id *)&self->_summaryFitnessJrKey, 0);
  objc_storeStrong((id *)&self->_displayNameFitnessJrKey, 0);
  objc_storeStrong((id *)&self->_summaryPairedWatchNameKey, 0);
  objc_storeStrong((id *)&self->_summaryForEnhancedFeatureNameKey, 0);
  objc_storeStrong((id *)&self->_summaryIPadNameKey, 0);
  objc_storeStrong((id *)&self->_summaryNameKey, 0);
  objc_storeStrong((id *)&self->_keywordsNameKey, 0);
  objc_storeStrong((id *)&self->_titleEmbeddedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_shortenedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_labelDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_displayNameKey, 0);
}

- (HKDisplayTypeLocalization)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (NSString)displayNameForFitnessJr
{
  v3 = HKHealthKitFrameworkBundle();
  uint64_t v4 = [v3 localizedStringForKey:self->_displayNameFitnessJrKey value:&stru_1F3B9CF20 table:@"Localizable-tinker"];

  return (NSString *)v4;
}

- (NSString)labelDisplayName
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_labelDisplayNameKey];
}

- (NSSet)keywords
{
  v2 = [(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_keywordsNameKey];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [v2 componentsSeparatedByString:@"|"];
  v5 = [v3 setWithArray:v4];

  return (NSSet *)v5;
}

- (NSString)shortenedDisplayName
{
  v3 = [(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_shortenedDisplayNameKey];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HKDisplayTypeLocalization *)self displayName];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)embeddedDisplayName
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_embeddedDisplayNameKey];
}

- (NSString)titleEmbeddedDisplayName
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_titleEmbeddedDisplayNameKey];
}

- (NSString)summary
{
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isiPad];

  if (!v4
    || ([(HKDisplayTypeLocalization *)self _localizedStringForKeyOrNil:self->_summaryIPadNameKey], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_summaryNameKey];
  }
  return (NSString *)v5;
}

- (NSString)summaryForEnhancedFeature
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_summaryForEnhancedFeatureNameKey];
}

- (NSString)summaryForFitnessJr
{
  v3 = HKHealthKitFrameworkBundle();
  int v4 = [v3 localizedStringForKey:self->_summaryFitnessJrKey value:&stru_1F3B9CF20 table:@"Localizable-tinker"];

  return (NSString *)v4;
}

- (NSString)summaryForPairedWatch
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringForKeyOrNil:self->_summaryPairedWatchNameKey];
}

- (id)_localizedStringForKeyOrNil:(id)a3
{
  id v4 = a3;
  id v5 = [(HKDisplayTypeLocalization *)self _localizedStringWithKey:v4];
  int v6 = [v5 isEqualToString:v4];

  if (v6) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (NSString)cautionaryText
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_cautionaryTextKey];
}

- (NSString)unitChangeCautionaryText
{
  return (NSString *)[(HKDisplayTypeLocalization *)self _localizedStringWithKey:self->_unitChangeCautionaryTextKey];
}

- (id)copyWithLocalizedKeySuffix:(id)a3
{
  id v4 = a3;
  id v5 = [[HKDisplayTypeLocalization alloc] initWithDisplayNameKey:self->_displayNameKey labelDisplayNameKey:self->_labelDisplayNameKey localizationTableNameOverride:self->_localizationTableNameOverride localizedKeySuffix:v4 unitNameKeyOverrides:self->_unitNameKeyOverrides];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayNameKey hash];
  NSUInteger v4 = [(NSString *)self->_labelDisplayNameKey hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_localizationTableNameOverride hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_localizedKeySuffix hash];
  return v6 ^ [(NSDictionary *)self->_unitNameKeyOverrides hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (HKDisplayTypeLocalization *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  if (v4 == self) {
    goto LABEL_19;
  }
  displayNameKey = self->_displayNameKey;
  NSUInteger v6 = v4->_displayNameKey;
  if (displayNameKey != v6 && (!v6 || !-[NSString isEqualToString:](displayNameKey, "isEqualToString:"))) {
    goto LABEL_18;
  }
  labelDisplayNameKey = self->_labelDisplayNameKey;
  id v8 = v4->_labelDisplayNameKey;
  if (labelDisplayNameKey != v8 && (!v8 || !-[NSString isEqualToString:](labelDisplayNameKey, "isEqualToString:"))) {
    goto LABEL_18;
  }
  localizationTableNameOverride = self->_localizationTableNameOverride;
  id v10 = v4->_localizationTableNameOverride;
  if (localizationTableNameOverride != v10
    && (!v10 || !-[NSString isEqualToString:](localizationTableNameOverride, "isEqualToString:")))
  {
    goto LABEL_18;
  }
  localizedKeySuffix = self->_localizedKeySuffix;
  id v12 = v4->_localizedKeySuffix;
  if (localizedKeySuffix != v12 && (!v12 || !-[NSString isEqualToString:](localizedKeySuffix, "isEqualToString:"))) {
    goto LABEL_18;
  }
  unitNameKeyOverrides = self->_unitNameKeyOverrides;
  id v14 = v4->_unitNameKeyOverrides;
  if (unitNameKeyOverrides == v14)
  {
LABEL_19:
    char v15 = 1;
    goto LABEL_20;
  }
  if (!v14)
  {
LABEL_18:
    char v15 = 0;
    goto LABEL_20;
  }
  char v15 = -[NSDictionary isEqual:](unitNameKeyOverrides, "isEqual:");
LABEL_20:

  return v15;
}

- (NSString)displayNameKey
{
  return self->_displayNameKey;
}

- (NSString)localizedKeySuffix
{
  return self->_localizedKeySuffix;
}

- (NSDictionary)unitNameKeyOverrides
{
  return self->_unitNameKeyOverrides;
}

@end