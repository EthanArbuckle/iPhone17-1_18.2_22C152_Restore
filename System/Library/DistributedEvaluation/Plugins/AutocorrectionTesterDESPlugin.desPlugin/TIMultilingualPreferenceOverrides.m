@interface TIMultilingualPreferenceOverrides
- (NSArray)preferredAdditionalInputModes;
- (NSArray)userEnabledInputModes;
- (NSArray)userPreferredLanguages;
- (TIInputMode)preferredSecondaryInputMode;
- (TIMultilingualPreferenceOverrides)initWithPreferredSecondaryInputMode:(id)a3 userEnabledInputModes:(id)a4 userPreferredLanguages:(id)a5;
@end

@implementation TIMultilingualPreferenceOverrides

- (TIMultilingualPreferenceOverrides)initWithPreferredSecondaryInputMode:(id)a3 userEnabledInputModes:(id)a4 userPreferredLanguages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIMultilingualPreferenceOverrides;
  v12 = [(TIMultilingualPreferenceOverrides *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferredSecondaryInputMode, a3);
    objc_storeStrong((id *)&v13->_userEnabledInputModes, a4);
    objc_storeStrong((id *)&v13->_userPreferredLanguages, a5);
  }

  return v13;
}

- (TIInputMode)preferredSecondaryInputMode
{
  return self->_preferredSecondaryInputMode;
}

- (NSArray)preferredAdditionalInputModes
{
  return self->_preferredAdditionalInputModes;
}

- (NSArray)userEnabledInputModes
{
  return self->_userEnabledInputModes;
}

- (NSArray)userPreferredLanguages
{
  return self->_userPreferredLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_userEnabledInputModes, 0);
  objc_storeStrong((id *)&self->_preferredAdditionalInputModes, 0);

  objc_storeStrong((id *)&self->_preferredSecondaryInputMode, 0);
}

@end