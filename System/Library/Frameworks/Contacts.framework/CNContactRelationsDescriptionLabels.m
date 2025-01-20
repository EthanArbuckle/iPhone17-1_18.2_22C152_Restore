@interface CNContactRelationsDescriptionLabels
- (CNContactRelationsDescriptionLabels)initWithPreferredLanguages:(id)a3 standardLabels:(id)a4 standardLocaleSpecificLabels:(id)a5 extendedLabels:(id)a6 extendedLocaleSpecificLabels:(id)a7 localizedStringsByLabelKey:(id)a8;
- (NSArray)extendedLabels;
- (NSArray)extendedLocaleSpecificLabels;
- (NSArray)preferredLanguages;
- (NSArray)standardLabels;
- (NSArray)standardLocaleSpecificLabels;
- (NSDictionary)localizedStringsByLabelKey;
@end

@implementation CNContactRelationsDescriptionLabels

- (CNContactRelationsDescriptionLabels)initWithPreferredLanguages:(id)a3 standardLabels:(id)a4 standardLocaleSpecificLabels:(id)a5 extendedLabels:(id)a6 extendedLocaleSpecificLabels:(id)a7 localizedStringsByLabelKey:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CNContactRelationsDescriptionLabels;
  v18 = [(CNContactRelationsDescriptionLabels *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_preferredLanguages, a3);
    objc_storeStrong((id *)&v19->_standardLabels, a4);
    objc_storeStrong((id *)&v19->_standardLocaleSpecificLabels, a5);
    objc_storeStrong((id *)&v19->_extendedLabels, a6);
    objc_storeStrong((id *)&v19->_extendedLocaleSpecificLabels, a7);
    objc_storeStrong((id *)&v19->_localizedStringsByLabelKey, a8);
    v20 = v19;
  }

  return v19;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (NSArray)standardLabels
{
  return self->_standardLabels;
}

- (NSArray)standardLocaleSpecificLabels
{
  return self->_standardLocaleSpecificLabels;
}

- (NSArray)extendedLabels
{
  return self->_extendedLabels;
}

- (NSArray)extendedLocaleSpecificLabels
{
  return self->_extendedLocaleSpecificLabels;
}

- (NSDictionary)localizedStringsByLabelKey
{
  return self->_localizedStringsByLabelKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStringsByLabelKey, 0);
  objc_storeStrong((id *)&self->_extendedLocaleSpecificLabels, 0);
  objc_storeStrong((id *)&self->_extendedLabels, 0);
  objc_storeStrong((id *)&self->_standardLocaleSpecificLabels, 0);
  objc_storeStrong((id *)&self->_standardLabels, 0);

  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

@end