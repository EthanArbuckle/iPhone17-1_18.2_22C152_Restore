@interface CNAssistantDisambiguationProvider
- (CNAssistantDisambiguationProvider)initWithContactStore:(id)a3;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNFavorites)favorites;
- (NSArray)labeledValues;
- (NSString)contactIdentifier;
- (NSString)propertyKey;
- (id)disambiguationForEmail:(id)a3;
- (id)disambiguationForEmail:(id)a3 contactIdentifier:(id)a4;
- (id)disambiguationForPerson:(id)a3;
- (id)disambiguationForPhone:(id)a3;
- (id)disambiguationForPhone:(id)a3 contactIdentifier:(id)a4;
- (id)disambiguationForPostalAddress:(id)a3;
- (id)disambiguationForRelatedName:(id)a3;
- (id)disambiguationItemForListItem:(id)a3;
- (id)localizedLabel:(id)a3 forPropertyKey:(id)a4;
- (id)valueForLabel:(id)a3 propertyKey:(id)a4 contactIdentifier:(id)a5;
- (void)setContactFormatter:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setFavorites:(id)a3;
- (void)setLabeledValues:(id)a3;
- (void)setPropertyKey:(id)a3;
@end

@implementation CNAssistantDisambiguationProvider

- (CNAssistantDisambiguationProvider)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAssistantDisambiguationProvider;
  v6 = [(CNAssistantDisambiguationProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)disambiguationItemForListItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (isKindOfClass)
  {
    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self disambiguationForPerson:v7];
LABEL_11:
    v13 = (void *)v8;
    goto LABEL_12;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (v9)
  {
    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self disambiguationForPhone:v7];
    goto LABEL_11;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (v10)
  {
    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self disambiguationForEmail:v7];
    goto LABEL_11;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (v11)
  {
    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self disambiguationForPostalAddress:v7];
    goto LABEL_11;
  }
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  v7 = [v4 object];
  if (v12)
  {
    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self disambiguationForRelatedName:v7];
    goto LABEL_11;
  }
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();

  if (v15)
  {
    v16 = [v4 object];
    v7 = [v16 object];

    if (!v7)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v17 = [v7 identifier];
    v18 = +[CNAssistantID contactIDFromAssistantID:v17];

    uint64_t v19 = [v7 phones];
    if (v19
      && (v20 = (void *)v19,
          [v7 phones],
          v21 = objc_claimAutoreleasedReturnValue(),
          id v22 = [v21 count],
          v21,
          v20,
          v22))
    {
      v23 = [v7 phones];
      v24 = [v23 objectAtIndexedSubscript:0];
      uint64_t v25 = [(CNAssistantDisambiguationProvider *)self disambiguationForPhone:v24 contactIdentifier:v18];
    }
    else
    {
      uint64_t v26 = [v7 emails];
      if (!v26
        || (v27 = (void *)v26,
            [v7 emails],
            v28 = objc_claimAutoreleasedReturnValue(),
            id v29 = [v28 count],
            v28,
            v27,
            !v29))
      {
        v13 = 0;
        goto LABEL_30;
      }
      v23 = [v7 emails];
      v24 = [v23 objectAtIndexedSubscript:0];
      uint64_t v25 = [(CNAssistantDisambiguationProvider *)self disambiguationForEmail:v24 contactIdentifier:v18];
    }
    v13 = (void *)v25;

LABEL_30:
LABEL_12:

    if (v13) {
      goto LABEL_16;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_7064(v4);
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (CNContactFormatter)contactFormatter
{
  contactFormatter = self->_contactFormatter;
  if (!contactFormatter)
  {
    id v4 = (CNContactFormatter *)objc_alloc_init((Class)CNContactFormatter);
    id v5 = self->_contactFormatter;
    self->_contactFormatter = v4;

    [(CNContactFormatter *)self->_contactFormatter setStyle:0];
    [(CNContactFormatter *)self->_contactFormatter setFallbackStyle:-1];
    contactFormatter = self->_contactFormatter;
  }

  return contactFormatter;
}

- (CNFavorites)favorites
{
  favorites = self->_favorites;
  if (!favorites)
  {
    id v4 = (CNFavorites *)[objc_alloc((Class)CNFavorites) initWithContactStore:self->_contactStore];
    id v5 = self->_favorites;
    self->_favorites = v4;

    favorites = self->_favorites;
  }

  return favorites;
}

- (id)disambiguationForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAssistantDisambiguationProvider *)self contactStore];

  if (v5)
  {
    v6 = [v4 identifier];
    v7 = +[CNAssistantID contactIDFromAssistantID:v6];

    uint64_t v8 = [(CNAssistantDisambiguationProvider *)self contactFormatter];
    char v9 = [v8 descriptorForRequiredKeys];
    v39 = v9;
    char v10 = +[NSArray arrayWithObjects:&v39 count:1];

    char v11 = [(CNAssistantDisambiguationProvider *)self contactStore];
    id v34 = 0;
    id v12 = [v11 unifiedContactWithIdentifier:v7 keysToFetch:v10 error:&v34];
    id v13 = v34;

    if (!v12)
    {
      if (v13
        && [v13 code] != stru_B8.segname
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v7;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to fetch contact with identifier %@, error = %@", buf, 0x16u);
      }
      id v12 = objc_alloc_init((Class)CNMutableContact);
      v14 = [v4 firstName];

      if (v14)
      {
        char v15 = [v4 firstName];
        [v12 setGivenName:v15];
      }
      v16 = [v4 lastName];

      if (v16)
      {
        v17 = [v4 lastName];
        [v12 setFamilyName:v17];
      }
      v18 = [v4 nickName];

      if (v18)
      {
        uint64_t v19 = [v4 nickName];
        [v12 setNickname:v19];
      }
      v20 = [v4 company];

      if (v20)
      {
        v21 = [v4 company];
        [v12 setOrganizationName:v21];
      }
      id v22 = [v4 emails];
      if ([v22 count])
      {
        uint64_t v23 = [v4 firstName];
        if (v23
          || ([v4 lastName], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0)
          || ([v4 nickName], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v24 = (void *)v23;
        }
        else
        {
          v32 = [v4 company];

          if (v32) {
            goto LABEL_22;
          }
          v33 = [v4 emails];
          id v22 = [v33 objectAtIndex:0];

          v24 = [v22 emailAddress];
          [v12 setGivenName:v24];
        }
      }
    }
LABEL_22:
    uint64_t v25 = [(CNAssistantDisambiguationProvider *)self contactFormatter];
    uint64_t v26 = [v25 stringFromContact:v12];

    v27 = [(CNAssistantDisambiguationProvider *)self favorites];
    v28 = [v27 entriesForContact:v12];

    BOOL v29 = [v28 count] != 0;
    goto LABEL_24;
  }
  BOOL v29 = 0;
  uint64_t v26 = 0;
LABEL_24:
  v30 = +[SiriUIDisambiguationItem disambiguationItem];
  [v30 setTitle:v26];
  [v30 setShowsFavoriteStar:v29];

  return v30;
}

- (id)valueForLabel:(id)a3 propertyKey:(id)a4 contactIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    goto LABEL_11;
  }
  char v11 = [(CNAssistantDisambiguationProvider *)self contactStore];

  if (!v11) {
    goto LABEL_11;
  }
  id v12 = [(CNAssistantDisambiguationProvider *)self propertyKey];
  if (v12 == v9)
  {
    id v13 = [(CNAssistantDisambiguationProvider *)self contactIdentifier];

    if (v13 == v10) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [(CNAssistantDisambiguationProvider *)self setPropertyKey:v9];
  [(CNAssistantDisambiguationProvider *)self setContactIdentifier:v10];
  [(CNAssistantDisambiguationProvider *)self setLabeledValues:0];
  v14 = [(CNAssistantDisambiguationProvider *)self contactStore];
  id v36 = v9;
  char v15 = +[NSArray arrayWithObjects:&v36 count:1];
  id v31 = 0;
  v16 = [v14 unifiedContactWithIdentifier:v10 keysToFetch:v15 error:&v31];
  id v17 = v31;

  if (v16)
  {
    v18 = +[CN contactPropertiesByKey];
    uint64_t v19 = [v18 objectForKeyedSubscript:v9];

    v20 = [v19 CNValueForContact:v16];
    [(CNAssistantDisambiguationProvider *)self setLabeledValues:v20];
  }
  else if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v17;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to fetch contact with identifier %@, error = %@", buf, 0x16u);
  }

LABEL_9:
  v21 = [(CNAssistantDisambiguationProvider *)self labeledValues];

  if (v21)
  {
    id v22 = [(CNAssistantDisambiguationProvider *)self labeledValues];
    uint64_t v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_4C58;
    BOOL v29 = &unk_C368;
    id v30 = v8;
    uint64_t v23 = objc_msgSend(v22, "_cn_firstObjectPassingTest:", &v26);
    v24 = objc_msgSend(v23, "value", v26, v27, v28, v29);

    goto LABEL_12;
  }
LABEL_11:
  v24 = 0;
LABEL_12:

  return v24;
}

- (id)localizedLabel:(id)a3 forPropertyKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CNLocalization localizedStringForString:v6 class:objc_opt_class() returningNilIfNotFound:0];

  if ((*(unsigned int (**)(void, void *))(CNIsStringEmpty + 16))(CNIsStringEmpty, v7))
  {
    id v8 = +[CNContact localizedStringForKey:v5];
    uint64_t v9 = [v8 lowercaseString];

    v7 = (void *)v9;
  }

  return v7;
}

- (id)disambiguationForPhone:(id)a3
{
  return [(CNAssistantDisambiguationProvider *)self disambiguationForPhone:a3 contactIdentifier:0];
}

- (id)disambiguationForPhone:(id)a3 contactIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 label];
  uint64_t v9 = [(CNAssistantDisambiguationProvider *)self localizedLabel:v8 forPropertyKey:CNContactPhoneNumbersKey];

  id v10 = [v6 number];
  if (v10)
  {
    char v11 = [v6 number];
    +[CNPhoneNumber phoneNumberWithStringValue:v11];
  }
  else
  {
    char v11 = [v6 label];
    [(CNAssistantDisambiguationProvider *)self valueForLabel:v11 propertyKey:CNContactPhoneNumbersKey contactIdentifier:v7];
  id v12 = };

  id v13 = [v12 formattedStringValue];
  v14 = +[SiriUIDisambiguationItem disambiguationItem];
  char v15 = v14;
  v16 = v9;
  if (v13)
  {
    [v14 setHeadingText:v9];
    v14 = v15;
    v16 = v13;
  }
  [v14 setTitle:v16];
  id v17 = [v6 favoriteVoice];
  if ([v17 BOOLValue])
  {
    [v15 setShowsFavoriteStar:1];
  }
  else
  {
    v18 = [v6 favoriteFacetime];
    if ([v18 BOOLValue])
    {
      [v15 setShowsFavoriteStar:1];
    }
    else
    {
      uint64_t v19 = [v6 favoriteFacetimeAudio];
      objc_msgSend(v15, "setShowsFavoriteStar:", objc_msgSend(v19, "BOOLValue"));
    }
  }

  return v15;
}

- (id)disambiguationForEmail:(id)a3
{
  return [(CNAssistantDisambiguationProvider *)self disambiguationForEmail:a3 contactIdentifier:0];
}

- (id)disambiguationForEmail:(id)a3 contactIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 label];
  uint64_t v9 = [(CNAssistantDisambiguationProvider *)self localizedLabel:v8 forPropertyKey:CNContactEmailAddressesKey];

  id v10 = [v6 emailAddress];
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [v6 label];
    id v12 = [(CNAssistantDisambiguationProvider *)self valueForLabel:v13 propertyKey:CNContactEmailAddressesKey contactIdentifier:v7];
  }
  v14 = +[SiriUIDisambiguationItem disambiguationItem];
  char v15 = v14;
  id v16 = v9;
  if (v12)
  {
    [v14 setHeadingText:v9];
    v14 = v15;
    id v16 = v12;
  }
  [v14 setTitle:v16];
  id v17 = [v6 favoriteFacetime];
  if ([v17 BOOLValue])
  {
    [v15 setShowsFavoriteStar:1];
  }
  else
  {
    v18 = [v6 favoriteFacetimeAudio];
    objc_msgSend(v15, "setShowsFavoriteStar:", objc_msgSend(v18, "BOOLValue"));
  }

  return v15;
}

- (id)disambiguationForPostalAddress:(id)a3
{
  id v4 = a3;
  id v5 = [v4 label];
  id v6 = [(CNAssistantDisambiguationProvider *)self localizedLabel:v5 forPropertyKey:CNContactPostalAddressesKey];

  id v7 = objc_alloc_init((Class)CNMutablePostalAddress);
  id v8 = [v4 street];
  [v7 setStreet:v8];

  uint64_t v9 = [v4 subLocality];
  [v7 setSubLocality:v9];

  id v10 = [v4 city];
  [v7 setCity:v10];

  char v11 = [v4 subAdministrativeArea];
  [v7 setSubAdministrativeArea:v11];

  id v12 = [v4 street];
  if ([v12 length])
  {
    [v7 setState:&stru_C3C8];
  }
  else
  {
    id v13 = [v4 stateCode];
    [v7 setState:v13];
  }
  v14 = [v4 countryCode];
  [v7 setISOCountryCode:v14];

  char v15 = +[CNPostalAddressFormatter singleLineStringFromPostalAddress:v7 addCountryName:0];
  id v16 = +[SiriUIDisambiguationItem disambiguationItem];
  [v16 setHeadingText:v6];
  [v16 setTitle:v15];

  return v16;
}

- (id)disambiguationForRelatedName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 label];
  id v6 = [(CNAssistantDisambiguationProvider *)self localizedLabel:v5 forPropertyKey:CNContactRelationsKey];

  id v7 = +[SiriUIDisambiguationItem disambiguationItem];
  [v7 setHeadingText:v6];
  id v8 = [v4 name];

  [v7 setTitle:v8];

  return v7;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void)setFavorites:(id)a3
{
}

- (void)setContactFormatter:(id)a3
{
}

- (NSArray)labeledValues
{
  return self->_labeledValues;
}

- (void)setLabeledValues:(id)a3
{
}

- (NSString)propertyKey
{
  return self->_propertyKey;
}

- (void)setPropertyKey:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
  objc_storeStrong((id *)&self->_labeledValues, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_favorites, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end