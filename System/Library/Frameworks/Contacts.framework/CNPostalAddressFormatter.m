@interface CNPostalAddressFormatter
+ (NSArray)supportedCountries;
+ (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style withDefaultAttributes:(NSDictionary *)attributes;
+ (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style;
+ (id)_postalToFormatMap;
+ (id)addressValueForFormatKey:(void *)a3 postalAddress:;
+ (id)fieldArrangementWithString:(uint64_t)a1;
+ (id)fieldLabelMapWithPlist:(uint64_t)a1;
+ (id)formatPropertyKeyForPostalAddressPropertyKey:(id)a3;
+ (id)getCountryCodeFromPostalAddress:(uint64_t)a1;
+ (id)localizedCountryNameForISOCountryCode:(id)a3;
+ (id)localizedStringForPostalAddressString:(id)a3;
+ (id)postalAddressPropertyKeyForFormatPropertyKey:(id)a3;
+ (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4;
+ (id)specificationForCountry:(id)a3;
+ (id)specificationWithAddressFormatPlist:(id)a3;
- (CNPostalAddressFormatterStyle)style;
- (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress withDefaultAttributes:(NSDictionary *)attributes;
- (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)attributedStringFromPostalAddress:(id)a3 name:(id)a4 organization:(id)a5 attributes:(id)a6;
- (id)attributedStringFromPostalAddress:(uint64_t)a1 name:(void *)a2 organization:(void *)a3 attributes:(void *)a4 order:(void *)a5;
- (id)postalAddressFromString:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (void)setStyle:(CNPostalAddressFormatterStyle)style;
@end

@implementation CNPostalAddressFormatter

uint64_t __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) postalAddressPropertyKeyForFormatPropertyKey:a2];
}

id __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 40);
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v4 = [v2 localizedStringForPostalAddressString:v3];

  return v4;
}

+ (id)localizedStringForPostalAddressString:(id)a3
{
  return (id)[MEMORY[0x1E4F5A4A0] localizedStringForPostalAddressString:a3 returningNilIfNotFound:1];
}

id __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a2;
  v5 = [v3 whitespaceCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke_2;
  v10[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  v10[4] = *(void *)(a1 + 32);
  v7 = objc_msgSend(v6, "_cn_map:", v10);
  v8 = objc_msgSend(v7, "_cn_filter:", *MEMORY[0x1E4F5A280]);

  return v8;
}

+ (id)postalAddressPropertyKeyForFormatPropertyKey:(id)a3
{
  id v3 = a3;
  id v4 = +[CNPostalAddressFormatter _postalToFormatMap]();
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)_postalToFormatMap
{
  self;
  if (_postalToFormatMap_cn_once_token_1 != -1) {
    dispatch_once(&_postalToFormatMap_cn_once_token_1, &__block_literal_global_29);
  }
  id v0 = (id)_postalToFormatMap_cn_once_object_1;

  return v0;
}

+ (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style
{
  v5 = postalAddress;
  v6 = objc_alloc_init(CNPostalAddressFormatter);
  [(CNPostalAddressFormatter *)v6 setStyle:style];
  v7 = [(CNPostalAddressFormatter *)v6 stringFromPostalAddress:v5];

  return (NSString *)v7;
}

- (NSString)stringFromPostalAddress:(CNPostalAddress *)postalAddress
{
  id v3 = -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, postalAddress, 0, 0, 0);
  id v4 = [v3 string];

  return (NSString *)v4;
}

- (void)setStyle:(CNPostalAddressFormatterStyle)style
{
  self->_style = style;
}

- (id)attributedStringFromPostalAddress:(uint64_t)a1 name:(void *)a2 organization:(void *)a3 attributes:(void *)a4 order:(void *)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v13 = [v9 formattedAddress];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
      v15 = [v9 formattedAddress];
      v16 = (void *)[v14 initWithString:v15 attributes:0];
    }
    else
    {
      uint64_t v17 = +[CNPostalAddressFormatter getCountryCodeFromPostalAddress:]((uint64_t)CNPostalAddressFormatter, v9);
      v18 = +[CNAddressFormats addressFormats];
      v19 = [v18 objectForKey:v17];

      v47 = v19;
      if (v10
        && ([v19 objectForKey:@"LABEL_FORMAT"], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v21 = (void *)v20;
        char v42 = 1;
      }
      else
      {
        v21 = [v19 objectForKey:@"FORMAT"];
        char v42 = 0;
      }
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EE052B80 attributes:v12];
      v48 = (void *)v17;
      v22 = [(id)objc_opt_class() specificationForCountry:v17];
      v46 = v21;
      v23 = +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)CNPostalAddressFormatter, v21);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke;
      v53[3] = &unk_1E56B7790;
      id v54 = v9;
      id v55 = v12;
      id v44 = v22;
      v45 = v23;
      id v56 = v44;
      v24 = objc_msgSend(v23, "_cn_map:", v53);
      v25 = objc_msgSend(v24, "_cn_filter:", &__block_literal_global_88);

      v43 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:0];
      v58[0] = v43;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
      v27 = objc_msgSend(v25, "_cn_join:", v26);

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v28 = objc_msgSend(v27, "_cn_flatten");
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v50 != v31) {
              objc_enumerationMutation(v28);
            }
            [v16 appendAttributedString:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v30);
      }

      if ([v11 length]) {
        char v33 = v42;
      }
      else {
        char v33 = 1;
      }
      if ((v33 & 1) == 0)
      {
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:0];
        v35 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"organizationName", @"postalAddressProperty", 0);
        v36 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11 attributes:v35];
        [v36 appendAttributedString:v34];
        [v16 insertAttributedString:v36 atIndex:0];
      }
      if ([v10 length]) {
        char v37 = v42;
      }
      else {
        char v37 = 1;
      }
      if ((v37 & 1) == 0)
      {
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:0];
        v39 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Name", @"postalAddressProperty", 0);
        v40 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10 attributes:v39];
        [v40 appendAttributedString:v38];
        [v16 insertAttributedString:v40 atIndex:0];
      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke(id *a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_2;
  v9[3] = &unk_1E56B7768;
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  id v4 = objc_msgSend(a2, "_cn_map:", v9);
  v5 = objc_msgSend(v4, "_cn_filter:", *MEMORY[0x1E4F5A280]);

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:a1[5]];
  v7 = objc_msgSend(v5, "_cn_join:", v6);

  return v7;
}

+ (id)specificationForCountry:(id)a3
{
  id v4 = +[CNAddressFormats addressFormatForCountryCode:a3];
  v5 = [a1 specificationWithAddressFormatPlist:v4];

  return v5;
}

+ (id)specificationWithAddressFormatPlist:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKeyedSubscript:@"FORMAT"];
    v6 = +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)a1, v5);

    v7 = [v4 objectForKeyedSubscript:@"EDIT_FORMAT"];
    v8 = +[CNPostalAddressFormatter fieldArrangementWithString:]((uint64_t)a1, v7);

    id v9 = +[CNPostalAddressFormatter fieldLabelMapWithPlist:]((uint64_t)a1, v4);

    id v10 = [[CNPostalAddressFormattingSpecification alloc] initWithDisplayFieldArrangement:v6 editingFieldArrangement:v8 fieldLabelMap:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)fieldArrangementWithString:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v5 = [v2 componentsSeparatedByCharactersInSet:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CNPostalAddressFormatter_fieldArrangementWithString___block_invoke;
  v8[3] = &__block_descriptor_40_e27___NSArray_16__0__NSString_8l;
  v8[4] = v3;
  v6 = objc_msgSend(v5, "_cn_map:", v8);

  return v6;
}

+ (id)getCountryCodeFromPostalAddress:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 ISOCountryCode];

  if (v3 == (void *)*MEMORY[0x1E4F1D260])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 lowercaseString];
  }

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) != 0
    || (+[CNAddressFormats addressFormats],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v7 = +[CNContactsUserDefaults sharedDefaults];
    uint64_t v8 = [v7 countryCode];

    id v4 = (void *)v8;
  }

  return v4;
}

+ (id)fieldLabelMapWithPlist:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (fieldLabelMapWithPlist__cn_once_token_2 != -1) {
    dispatch_once(&fieldLabelMapWithPlist__cn_once_token_2, &__block_literal_global_47);
  }
  id v4 = (id)fieldLabelMapWithPlist__cn_once_object_2;
  v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_53);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_2;
  id v14 = &unk_1E56B7818;
  id v15 = v2;
  uint64_t v16 = v3;
  id v6 = v2;
  v7 = objc_msgSend(v4, "_cn_map:", &v11);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:", v7, v5, v11, v12, v13, v14);
  id v9 = objc_msgSend(v8, "_cn_filter:", &__block_literal_global_51_1);

  return v9;
}

id __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 valueForKey:v4];
  id v6 = (void *)[*(id *)(a1 + 40) mutableCopy];
  [v6 setObject:v4 forKeyedSubscript:@"postalAddressProperty"];
  v7 = [*(id *)(a1 + 48) localizedPlaceholderForKey:v4];

  [v6 setObject:v7 forKeyedSubscript:@"postalAddressLocalizedPropertyName"];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) != 0
    || ([MEMORY[0x1E4F1CA98] null],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v5 == v8))
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v6];
  }
  id v10 = (void *)v9;

  return v10;
}

uint64_t __97__CNPostalAddressFormatter_attributedStringFromPostalAddress_name_organization_attributes_order___block_invoke_3()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))() ^ 1;
}

BOOL __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a3;
  id v7 = [v5 null];

  if (v7 == v6)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    BOOL v9 = v8 != v4;
  }
  return v9;
}

void __51__CNPostalAddressFormatter_fieldLabelMapWithPlist___block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"Street";
  v3[1] = @"SubLocality";
  v3[2] = @"City";
  v3[3] = @"SubAdministrativeArea";
  v3[4] = @"State";
  v3[5] = @"ZIP";
  v3[6] = @"Country";
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)fieldLabelMapWithPlist__cn_once_object_2;
  fieldLabelMapWithPlist__cn_once_object_2 = v1;
}

void __46__CNPostalAddressFormatter__postalToFormatMap__block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v3[0] = @"Street";
  v3[1] = @"SubLocality";
  v4[0] = @"street";
  v4[1] = @"subLocality";
  v3[2] = @"City";
  v3[3] = @"State";
  v4[2] = @"city";
  v4[3] = @"state";
  v3[4] = @"SubAdministrativeArea";
  v3[5] = @"Region";
  v4[4] = @"subAdministrativeArea";
  v4[5] = @"subAdministrativeArea";
  v3[6] = @"ZIP";
  v3[7] = @"Country";
  v4[6] = @"postalCode";
  v4[7] = @"country";
  void v3[8] = @"CountryCode";
  v3[9] = @"FormattedAddress";
  v4[8] = @"ISOCountryCode";
  v4[9] = @"formattedAddress";
  id v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:10];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)_postalToFormatMap_cn_once_object_1;
  _postalToFormatMap_cn_once_object_1 = v1;
}

+ (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress style:(CNPostalAddressFormatterStyle)style withDefaultAttributes:(NSDictionary *)attributes
{
  id v7 = attributes;
  id v8 = postalAddress;
  BOOL v9 = objc_alloc_init(CNPostalAddressFormatter);
  [(CNPostalAddressFormatter *)v9 setStyle:style];
  id v10 = [(CNPostalAddressFormatter *)v9 attributedStringFromPostalAddress:v8 withDefaultAttributes:v7];

  return (NSAttributedString *)v10;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CNPostalAddressFormatter *)self stringFromPostalAddress:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, v6, 0, 0, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSAttributedString)attributedStringFromPostalAddress:(CNPostalAddress *)postalAddress withDefaultAttributes:(NSDictionary *)attributes
{
  return (NSAttributedString *)-[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, postalAddress, 0, 0, attributes);
}

- (id)attributedStringFromPostalAddress:(id)a3 name:(id)a4 organization:(id)a5 attributes:(id)a6
{
  return -[CNPostalAddressFormatter attributedStringFromPostalAddress:name:organization:attributes:order:]((uint64_t)self, a3, a4, a5, a6);
}

+ (id)formatPropertyKeyForPostalAddressPropertyKey:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CNPostalAddressFormatter_formatPropertyKeyForPostalAddressPropertyKey___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = formatPropertyKeyForPostalAddressPropertyKey__cn_once_token_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&formatPropertyKeyForPostalAddressPropertyKey__cn_once_token_0, block);
  }
  v5 = [(id)formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0 objectForKeyedSubscript:v4];

  return v5;
}

void __73__CNPostalAddressFormatter_formatPropertyKeyForPostalAddressPropertyKey___block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F1C9E8];
  +[CNPostalAddressFormatter _postalToFormatMap]();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v7 allKeys];
  id v2 = +[CNPostalAddressFormatter _postalToFormatMap]();
  uint64_t v3 = [v2 allValues];
  id v4 = [v0 dictionaryWithObjects:v1 forKeys:v3];
  uint64_t v5 = [v4 copy];
  id v6 = (void *)formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0;
  formatPropertyKeyForPostalAddressPropertyKey__cn_once_object_0 = v5;
}

+ (id)addressValueForFormatKey:(void *)a3 postalAddress:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if ([v4 isEqualToString:@"Street"])
  {
    uint64_t v6 = [v5 street];
LABEL_12:
    id v7 = (void *)v6;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"SubLocality"])
  {
    uint64_t v6 = [v5 subLocality];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"City"])
  {
    uint64_t v6 = [v5 city];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"State"])
  {
    uint64_t v6 = [v5 state];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"SubAdministrativeArea"]
    || [v4 isEqualToString:@"Region"])
  {
    uint64_t v6 = [v5 subAdministrativeArea];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"ZIP"])
  {
    uint64_t v6 = [v5 postalCode];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Country"])
  {
    uint64_t v6 = [v5 country];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"CountryCode"])
  {
    uint64_t v6 = [v5 ISOCountryCode];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"FormattedAddress"])
  {
    uint64_t v6 = [v5 formattedAddress];
    goto LABEL_12;
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

- (id)postalAddressFromString:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F5A4B0] postalAddressFromString:a3 error:0];
  if (v3)
  {
    id v4 = objc_opt_new();
    id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2F8]];
    [v4 setStreet:v5];

    uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A308]];
    [v4 setSubLocality:v6];

    id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2D0]];
    [v4 setCity:v7];

    id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A300]];
    [v4 setSubAdministrativeArea:v8];

    BOOL v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2F0]];
    [v4 setState:v9];

    id v10 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2E8]];
    [v4 setPostalCode:v10];

    uint64_t v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2D8]];
    [v4 setCountry:v11];

    uint64_t v12 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5A2E0]];
    [v4 setISOCountryCode:v12];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)singleLineStringFromPostalAddress:(id)a3 addCountryName:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v7 = 0x1E56B2000uLL;
  uint64_t v8 = +[CNPostalAddressFormatter getCountryCodeFromPostalAddress:]((uint64_t)CNPostalAddressFormatter, v5);
  BOOL v9 = +[CNAddressFormats addressFormats];
  uint64_t v30 = (void *)v8;
  id v10 = [v9 objectForKey:v8];

  v26 = v10;
  v25 = [v10 objectForKey:@"URL_FORMAT"];
  uint64_t v11 = [v25 componentsSeparatedByString:@", "];
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *MEMORY[0x1E4F5A298];
    uint64_t v27 = *MEMORY[0x1E4F1C400];
    uint64_t v28 = v12;
    id v29 = v6;
    do
    {
      uint64_t v16 = [v11 objectAtIndex:v14];
      uint64_t v17 = +[CNPostalAddressFormatter addressValueForFormatKey:postalAddress:](*(void *)(v7 + 3880), v16, v5);
      if ([v16 isEqualToString:@"Country"]
        && v4
        && (*(unsigned int (**)(uint64_t, void *))(v15 + 16))(v15, v17))
      {
        v18 = [MEMORY[0x1E4F1CA20] currentLocale];
        [v18 displayNameForKey:v27 value:v30];
        v19 = v11;
        unint64_t v20 = v7;
        BOOL v21 = v4;
        v23 = id v22 = v5;

        uint64_t v17 = (void *)v23;
        id v5 = v22;
        BOOL v4 = v21;
        unint64_t v7 = v20;
        uint64_t v11 = v19;
        uint64_t v13 = v28;
        id v6 = v29;
      }
      if (((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v17) & 1) == 0)
      {
        if ([v6 length]) {
          [v6 appendString:@" "];
        }
        [v6 appendString:v17];
      }

      ++v14;
    }
    while (v13 != v14);
  }
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\n", @" ", 2, 0, objc_msgSend(v6, "length"));

  return v6;
}

+ (id)localizedCountryNameForISOCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = +[CNAddressFormats addressFormatForCountryCode:v4];
  id v6 = [v5 objectForKeyedSubscript:@"COUNTRY"];
  unint64_t v7 = [a1 localizedStringForPostalAddressString:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = v8;

  return v9;
}

+ (NSArray)supportedCountries
{
  return (NSArray *)+[CNAddressFormats supportedCountries];
}

- (CNPostalAddressFormatterStyle)style
{
  return self->_style;
}

@end