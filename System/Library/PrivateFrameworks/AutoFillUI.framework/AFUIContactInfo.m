@interface AFUIContactInfo
+ (id)symbolNameForLabel:(id)a3;
- (AFUIContactInfo)initWithLabel:(id)a3;
- (NSString)birthdateDayString;
- (NSString)birthdateMonthString;
- (NSString)birthdateString;
- (NSString)birthdateYearString;
- (NSString)cityString;
- (NSString)countryString;
- (NSString)emailString;
- (NSString)familyNameString;
- (NSString)fullStreetAddressString;
- (NSString)givenNameString;
- (NSString)jobTitleString;
- (NSString)label;
- (NSString)middleNameString;
- (NSString)namePrefixString;
- (NSString)nameString;
- (NSString)nameSuffixString;
- (NSString)nicknameString;
- (NSString)organizationNameString;
- (NSString)phoneAreaCodeString;
- (NSString)phoneCountryCodeString;
- (NSString)phoneExtensionString;
- (NSString)phoneLocalNumberString;
- (NSString)phoneNationalNumberString;
- (NSString)phoneString;
- (NSString)postalCodeString;
- (NSString)stateString;
- (NSString)streetAddressLine1String;
- (NSString)streetAddressLine2String;
- (NSString)sublocalityString;
- (NSString)urlString;
- (id)customInfoFromContactInfo;
- (id)propertyForTextContentType:(id)a3;
- (id)subtitleTextForAutoFillContext:(id)a3;
- (id)titleText;
- (void)setBirthdateDayString:(id)a3;
- (void)setBirthdateMonthString:(id)a3;
- (void)setBirthdateString:(id)a3;
- (void)setBirthdateYearString:(id)a3;
- (void)setCityString:(id)a3;
- (void)setCountryString:(id)a3;
- (void)setEmailString:(id)a3;
- (void)setFamilyNameString:(id)a3;
- (void)setFullStreetAddressString:(id)a3;
- (void)setGivenNameString:(id)a3;
- (void)setJobTitleString:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMiddleNameString:(id)a3;
- (void)setNamePrefixString:(id)a3;
- (void)setNameString:(id)a3;
- (void)setNameSuffixString:(id)a3;
- (void)setNicknameString:(id)a3;
- (void)setOrganizationNameString:(id)a3;
- (void)setPhoneAreaCodeString:(id)a3;
- (void)setPhoneCountryCodeString:(id)a3;
- (void)setPhoneExtensionString:(id)a3;
- (void)setPhoneLocalNumberString:(id)a3;
- (void)setPhoneNationalNumberString:(id)a3;
- (void)setPhoneString:(id)a3;
- (void)setPostalCodeString:(id)a3;
- (void)setStateString:(id)a3;
- (void)setStreetAddressLine1String:(id)a3;
- (void)setStreetAddressLine2String:(id)a3;
- (void)setSublocalityString:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation AFUIContactInfo

- (AFUIContactInfo)initWithLabel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFUIContactInfo;
  v5 = [(AFUIContactInfo *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AFUIContactInfo *)v5 setLabel:v4];
  }

  return v6;
}

- (id)propertyForTextContentType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F29518]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self nameString];
LABEL_59:
    v6 = (void *)v5;
    goto LABEL_60;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F294F8]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self givenNameString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F294E8]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self familyNameString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29510]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self middleNameString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29520]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self namePrefixString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29528]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self nameSuffixString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29538]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self nicknameString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29500]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self jobTitleString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29550]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self organizationNameString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29468]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self birthdateString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29470]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self birthdateDayString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29478]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self birthdateMonthString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29480]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self birthdateYearString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F294F0]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self fullStreetAddressString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29568]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self streetAddressLine1String];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29570]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self streetAddressLine2String];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29450]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self cityString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29460]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self stateString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29578]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self sublocalityString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29488]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self countryString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F29560]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self postalCodeString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F295A0]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:@"tel-national"])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneNationalNumberString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:@"tel-country-code"])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneCountryCodeString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:@"tel-area-code"])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneAreaCodeString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:@"tel-local"])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneLocalNumberString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:@"tel-extension"])
  {
    uint64_t v5 = [(AFUIContactInfo *)self phoneExtensionString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F294E0]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self emailString];
    goto LABEL_59;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F295A8]])
  {
    uint64_t v5 = [(AFUIContactInfo *)self urlString];
    goto LABEL_59;
  }
  v6 = 0;
LABEL_60:

  return v6;
}

- (id)customInfoFromContactInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(AFUIContactInfo *)self nameString];

  if (v4)
  {
    uint64_t v5 = [(AFUIContactInfo *)self nameString];
    [v3 setObject:v5 forKey:*MEMORY[0x263F29518]];
  }
  v6 = [(AFUIContactInfo *)self givenNameString];

  if (v6)
  {
    v7 = [(AFUIContactInfo *)self givenNameString];
    [v3 setObject:v7 forKey:*MEMORY[0x263F294F8]];
  }
  objc_super v8 = [(AFUIContactInfo *)self familyNameString];

  if (v8)
  {
    v9 = [(AFUIContactInfo *)self familyNameString];
    [v3 setObject:v9 forKey:*MEMORY[0x263F294E8]];
  }
  v10 = [(AFUIContactInfo *)self middleNameString];

  if (v10)
  {
    v11 = [(AFUIContactInfo *)self middleNameString];
    [v3 setObject:v11 forKey:*MEMORY[0x263F29510]];
  }
  v12 = [(AFUIContactInfo *)self namePrefixString];

  if (v12)
  {
    v13 = [(AFUIContactInfo *)self namePrefixString];
    [v3 setObject:v13 forKey:*MEMORY[0x263F29520]];
  }
  v14 = [(AFUIContactInfo *)self nameSuffixString];

  if (v14)
  {
    v15 = [(AFUIContactInfo *)self nameSuffixString];
    [v3 setObject:v15 forKey:*MEMORY[0x263F29528]];
  }
  v16 = [(AFUIContactInfo *)self nicknameString];

  if (v16)
  {
    v17 = [(AFUIContactInfo *)self nicknameString];
    [v3 setObject:v17 forKey:*MEMORY[0x263F29538]];
  }
  v18 = [(AFUIContactInfo *)self jobTitleString];

  if (v18)
  {
    v19 = [(AFUIContactInfo *)self jobTitleString];
    [v3 setObject:v19 forKey:*MEMORY[0x263F29500]];
  }
  v20 = [(AFUIContactInfo *)self organizationNameString];

  if (v20)
  {
    v21 = [(AFUIContactInfo *)self organizationNameString];
    [v3 setObject:v21 forKey:*MEMORY[0x263F29550]];
  }
  v22 = [(AFUIContactInfo *)self birthdateString];

  if (v22)
  {
    v23 = [(AFUIContactInfo *)self birthdateString];
    [v3 setObject:v23 forKey:*MEMORY[0x263F29468]];
  }
  v24 = [(AFUIContactInfo *)self birthdateDayString];

  if (v24)
  {
    v25 = [(AFUIContactInfo *)self birthdateDayString];
    [v3 setObject:v25 forKey:*MEMORY[0x263F29470]];
  }
  v26 = [(AFUIContactInfo *)self birthdateMonthString];

  if (v26)
  {
    v27 = [(AFUIContactInfo *)self birthdateMonthString];
    [v3 setObject:v27 forKey:*MEMORY[0x263F29478]];
  }
  v28 = [(AFUIContactInfo *)self birthdateYearString];

  if (v28)
  {
    v29 = [(AFUIContactInfo *)self birthdateYearString];
    [v3 setObject:v29 forKey:*MEMORY[0x263F29480]];
  }
  v30 = [(AFUIContactInfo *)self fullStreetAddressString];

  if (v30)
  {
    v31 = [(AFUIContactInfo *)self fullStreetAddressString];
    [v3 setObject:v31 forKey:*MEMORY[0x263F294F0]];
  }
  v32 = [(AFUIContactInfo *)self streetAddressLine1String];

  if (v32)
  {
    v33 = [(AFUIContactInfo *)self streetAddressLine1String];
    [v3 setObject:v33 forKey:*MEMORY[0x263F29568]];
  }
  v34 = [(AFUIContactInfo *)self streetAddressLine2String];

  if (v34)
  {
    v35 = [(AFUIContactInfo *)self streetAddressLine2String];
    [v3 setObject:v35 forKey:*MEMORY[0x263F29570]];
  }
  v36 = [(AFUIContactInfo *)self cityString];

  if (v36)
  {
    v37 = [(AFUIContactInfo *)self cityString];
    [v3 setObject:v37 forKey:*MEMORY[0x263F29450]];
  }
  v38 = [(AFUIContactInfo *)self stateString];

  if (v38)
  {
    v39 = [(AFUIContactInfo *)self stateString];
    [v3 setObject:v39 forKey:*MEMORY[0x263F29460]];
  }
  v40 = [(AFUIContactInfo *)self sublocalityString];

  if (v40)
  {
    v41 = [(AFUIContactInfo *)self sublocalityString];
    [v3 setObject:v41 forKey:*MEMORY[0x263F29578]];
  }
  v42 = [(AFUIContactInfo *)self countryString];

  if (v42)
  {
    v43 = [(AFUIContactInfo *)self countryString];
    [v3 setObject:v43 forKey:*MEMORY[0x263F29488]];
  }
  v44 = [(AFUIContactInfo *)self postalCodeString];

  if (v44)
  {
    v45 = [(AFUIContactInfo *)self postalCodeString];
    [v3 setObject:v45 forKey:*MEMORY[0x263F29560]];
  }
  v46 = [(AFUIContactInfo *)self phoneString];

  if (v46)
  {
    v47 = [(AFUIContactInfo *)self phoneString];
    [v3 setObject:v47 forKey:*MEMORY[0x263F295A0]];
  }
  v48 = [(AFUIContactInfo *)self phoneNationalNumberString];

  if (v48)
  {
    v49 = [(AFUIContactInfo *)self phoneNationalNumberString];
    [v3 setObject:v49 forKey:@"tel-national"];
  }
  v50 = [(AFUIContactInfo *)self phoneCountryCodeString];

  if (v50)
  {
    v51 = [(AFUIContactInfo *)self phoneCountryCodeString];
    [v3 setObject:v51 forKey:@"tel-country-code"];
  }
  v52 = [(AFUIContactInfo *)self phoneAreaCodeString];

  if (v52)
  {
    v53 = [(AFUIContactInfo *)self phoneAreaCodeString];
    [v3 setObject:v53 forKey:@"tel-area-code"];
  }
  v54 = [(AFUIContactInfo *)self phoneLocalNumberString];

  if (v54)
  {
    v55 = [(AFUIContactInfo *)self phoneLocalNumberString];
    [v3 setObject:v55 forKey:@"tel-local"];
  }
  v56 = [(AFUIContactInfo *)self phoneExtensionString];

  if (v56)
  {
    v57 = [(AFUIContactInfo *)self phoneExtensionString];
    [v3 setObject:v57 forKey:@"tel-extension"];
  }
  v58 = [(AFUIContactInfo *)self emailString];

  if (v58)
  {
    v59 = [(AFUIContactInfo *)self emailString];
    [v3 setObject:v59 forKey:*MEMORY[0x263F294E0]];
  }
  v60 = [(AFUIContactInfo *)self urlString];

  if (v60)
  {
    v61 = [(AFUIContactInfo *)self urlString];
    [v3 setObject:v61 forKey:*MEMORY[0x263F295A8]];
  }

  return v3;
}

- (id)titleText
{
  id v3 = [(AFUIContactInfo *)self label];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = NSString;
    v6 = [(AFUIContactInfo *)self nameString];
    v7 = [(AFUIContactInfo *)self label];
    objc_super v8 = [v5 stringWithFormat:@"%@ - %@", v6, v7];
  }
  else
  {
    objc_super v8 = [(AFUIContactInfo *)self nameString];
  }

  return v8;
}

- (id)subtitleTextForAutoFillContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = AFUIPreferredSubtitleOrder();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    uint64_t v9 = *MEMORY[0x263F294E0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v12 = [v3 objectForKey:v11];
        if (v12 && AFTextContentTypeIsInNameSet(v11))
        {
          char v13 = [v4 containsObject:@"Name"];

          if ((v13 & 1) == 0)
          {
            v14 = v4;
            v15 = @"Name";
LABEL_27:
            [v14 addObject:v15];
            continue;
          }
        }
        else
        {
        }
        v16 = [v3 objectForKey:v11];
        if (v16 && AFTextContentTypeIsInPhoneSet(v11))
        {
          char v17 = [v4 containsObject:@"Phone"];

          if ((v17 & 1) == 0)
          {
            v14 = v4;
            v15 = @"Phone";
            goto LABEL_27;
          }
        }
        else
        {
        }
        v18 = [v3 objectForKey:v11];
        if (v18 && [v11 isEqualToString:v9])
        {
          char v19 = [v4 containsObject:@"Email"];

          if ((v19 & 1) == 0)
          {
            v14 = v4;
            v15 = @"Email";
            goto LABEL_27;
          }
        }
        else
        {
        }
        v20 = [v3 objectForKey:v11];
        if (!v20
          || !AFTextContentTypeIsInContactSet(v11)
          || (AFTextContentTypeIsInBirthdaySet(v11) & 1) != 0)
        {

          continue;
        }
        char v21 = [v4 containsObject:@"Address"];

        if ((v21 & 1) == 0)
        {
          v14 = v4;
          v15 = @"Address";
          goto LABEL_27;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v7);
  }

  v22 = [MEMORY[0x263F089D8] string];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v29 = [v28 localizedStringForKey:v27 value:&stru_26FCB6C48 table:@"Localizable"];

        if ([v22 length]) {
          [v22 appendString:@", "];
        }
        [v22 appendString:v29];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v24);
  }

  return v22;
}

+ (id)symbolNameForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 localizedCaseInsensitiveCompare:@"Home"])
  {
    if ([v3 localizedCaseInsensitiveCompare:@"Work"])
    {
      if ([v3 localizedCaseInsensitiveCompare:@"Phone"])
      {
        if ([v3 localizedCaseInsensitiveCompare:@"Mobile"]) {
          uint64_t v4 = @"person.text.rectangle";
        }
        else {
          uint64_t v4 = @"iphone";
        }
      }
      else
      {
        uint64_t v4 = @"phone";
      }
    }
    else
    {
      uint64_t v4 = @"building.2";
    }
  }
  else
  {
    uint64_t v4 = @"house";
  }

  return v4;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)nameString
{
  return self->_nameString;
}

- (void)setNameString:(id)a3
{
}

- (NSString)givenNameString
{
  return self->_givenNameString;
}

- (void)setGivenNameString:(id)a3
{
}

- (NSString)familyNameString
{
  return self->_familyNameString;
}

- (void)setFamilyNameString:(id)a3
{
}

- (NSString)middleNameString
{
  return self->_middleNameString;
}

- (void)setMiddleNameString:(id)a3
{
}

- (NSString)namePrefixString
{
  return self->_namePrefixString;
}

- (void)setNamePrefixString:(id)a3
{
}

- (NSString)nameSuffixString
{
  return self->_nameSuffixString;
}

- (void)setNameSuffixString:(id)a3
{
}

- (NSString)nicknameString
{
  return self->_nicknameString;
}

- (void)setNicknameString:(id)a3
{
}

- (NSString)jobTitleString
{
  return self->_jobTitleString;
}

- (void)setJobTitleString:(id)a3
{
}

- (NSString)organizationNameString
{
  return self->_organizationNameString;
}

- (void)setOrganizationNameString:(id)a3
{
}

- (NSString)birthdateString
{
  return self->_birthdateString;
}

- (void)setBirthdateString:(id)a3
{
}

- (NSString)birthdateDayString
{
  return self->_birthdateDayString;
}

- (void)setBirthdateDayString:(id)a3
{
}

- (NSString)birthdateMonthString
{
  return self->_birthdateMonthString;
}

- (void)setBirthdateMonthString:(id)a3
{
}

- (NSString)birthdateYearString
{
  return self->_birthdateYearString;
}

- (void)setBirthdateYearString:(id)a3
{
}

- (NSString)phoneString
{
  return self->_phoneString;
}

- (void)setPhoneString:(id)a3
{
}

- (NSString)phoneNationalNumberString
{
  return self->_phoneNationalNumberString;
}

- (void)setPhoneNationalNumberString:(id)a3
{
}

- (NSString)phoneCountryCodeString
{
  return self->_phoneCountryCodeString;
}

- (void)setPhoneCountryCodeString:(id)a3
{
}

- (NSString)phoneAreaCodeString
{
  return self->_phoneAreaCodeString;
}

- (void)setPhoneAreaCodeString:(id)a3
{
}

- (NSString)phoneLocalNumberString
{
  return self->_phoneLocalNumberString;
}

- (void)setPhoneLocalNumberString:(id)a3
{
}

- (NSString)phoneExtensionString
{
  return self->_phoneExtensionString;
}

- (void)setPhoneExtensionString:(id)a3
{
}

- (NSString)emailString
{
  return self->_emailString;
}

- (void)setEmailString:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)fullStreetAddressString
{
  return self->_fullStreetAddressString;
}

- (void)setFullStreetAddressString:(id)a3
{
}

- (NSString)streetAddressLine1String
{
  return self->_streetAddressLine1String;
}

- (void)setStreetAddressLine1String:(id)a3
{
}

- (NSString)streetAddressLine2String
{
  return self->_streetAddressLine2String;
}

- (void)setStreetAddressLine2String:(id)a3
{
}

- (NSString)sublocalityString
{
  return self->_sublocalityString;
}

- (void)setSublocalityString:(id)a3
{
}

- (NSString)cityString
{
  return self->_cityString;
}

- (void)setCityString:(id)a3
{
}

- (NSString)stateString
{
  return self->_stateString;
}

- (void)setStateString:(id)a3
{
}

- (NSString)postalCodeString
{
  return self->_postalCodeString;
}

- (void)setPostalCodeString:(id)a3
{
}

- (NSString)countryString
{
  return self->_countryString;
}

- (void)setCountryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryString, 0);
  objc_storeStrong((id *)&self->_postalCodeString, 0);
  objc_storeStrong((id *)&self->_stateString, 0);
  objc_storeStrong((id *)&self->_cityString, 0);
  objc_storeStrong((id *)&self->_sublocalityString, 0);
  objc_storeStrong((id *)&self->_streetAddressLine2String, 0);
  objc_storeStrong((id *)&self->_streetAddressLine1String, 0);
  objc_storeStrong((id *)&self->_fullStreetAddressString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_emailString, 0);
  objc_storeStrong((id *)&self->_phoneExtensionString, 0);
  objc_storeStrong((id *)&self->_phoneLocalNumberString, 0);
  objc_storeStrong((id *)&self->_phoneAreaCodeString, 0);
  objc_storeStrong((id *)&self->_phoneCountryCodeString, 0);
  objc_storeStrong((id *)&self->_phoneNationalNumberString, 0);
  objc_storeStrong((id *)&self->_phoneString, 0);
  objc_storeStrong((id *)&self->_birthdateYearString, 0);
  objc_storeStrong((id *)&self->_birthdateMonthString, 0);
  objc_storeStrong((id *)&self->_birthdateDayString, 0);
  objc_storeStrong((id *)&self->_birthdateString, 0);
  objc_storeStrong((id *)&self->_organizationNameString, 0);
  objc_storeStrong((id *)&self->_jobTitleString, 0);
  objc_storeStrong((id *)&self->_nicknameString, 0);
  objc_storeStrong((id *)&self->_nameSuffixString, 0);
  objc_storeStrong((id *)&self->_namePrefixString, 0);
  objc_storeStrong((id *)&self->_middleNameString, 0);
  objc_storeStrong((id *)&self->_familyNameString, 0);
  objc_storeStrong((id *)&self->_givenNameString, 0);
  objc_storeStrong((id *)&self->_nameString, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end