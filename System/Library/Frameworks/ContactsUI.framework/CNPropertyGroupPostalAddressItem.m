@interface CNPropertyGroupPostalAddressItem
+ (id)emptyValueForLabel:(id)a3;
- (BOOL)_isMinimalAddress:(id)a3;
- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4;
- (CNPostalAddress)address;
- (id)bestValue:(id)a3;
- (id)defaultActionURL;
- (id)displayStringForValue:(id)a3;
- (id)normalizedValue;
@end

@implementation CNPropertyGroupPostalAddressItem

+ (id)emptyValueForLabel:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA80]);

  return v3;
}

- (id)bestValue:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyGroupItem *)self labeledValue];
  v6 = [v5 value];

  v7 = [v4 labeledValue];

  v8 = [v7 value];

  LODWORD(v7) = __46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(v6);
  if ((int)v7 >= (int)__46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(v8)) {
    v9 = v6;
  }
  else {
    v9 = v8;
  }
  id v10 = v9;

  return v10;
}

uint64_t __46__CNPropertyGroupPostalAddressItem_bestValue___block_invoke(void *a1)
{
  id v1 = a1;
  v2 = [v1 street];
  uint64_t v3 = [v2 length];

  id v4 = [v1 subLocality];
  uint64_t v5 = [v4 length];

  if (v3) {
    int v6 = 2;
  }
  else {
    int v6 = 1;
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = v3 != 0;
  }
  v8 = [v1 city];
  uint64_t v9 = [v8 length];

  if (v9) {
    ++v7;
  }
  id v10 = [v1 subAdministrativeArea];
  uint64_t v11 = [v10 length];

  if (v11) {
    ++v7;
  }
  v12 = [v1 state];
  uint64_t v13 = [v12 length];

  if (v13) {
    ++v7;
  }
  v14 = [v1 postalCode];
  uint64_t v15 = [v14 length];

  if (v15) {
    ++v7;
  }
  v16 = [v1 country];
  uint64_t v17 = [v16 length];

  if (v17) {
    unsigned int v18 = v7 + 1;
  }
  else {
    unsigned int v18 = v7;
  }
  v19 = [v1 ISOCountryCode];

  uint64_t v20 = [v19 length];
  if (v20) {
    return v18 + 1;
  }
  else {
    return v18;
  }
}

- (BOOL)_isMinimalAddress:(id)a3
{
  uint64_t v3 = [a3 street];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v6 = a3;
  int v7 = [(CNPropertyGroupItem *)self labeledValue];
  v8 = [v7 value];

  uint64_t v9 = [v6 labeledValue];
  id v10 = [v9 value];

  uint64_t v11 = [(CNPropertyGroupItem *)self labeledValue];
  v12 = [v11 label];

  uint64_t v13 = [v6 labeledValue];

  v14 = [v13 label];

  if ([(CNPropertyGroupPostalAddressItem *)self _isMinimalAddress:v8]
    || [(CNPropertyGroupPostalAddressItem *)self _isMinimalAddress:v10])
  {
    uint64_t v15 = [v8 subLocality];
    v16 = [v10 subLocality];
    uint64_t v17 = [v15 caseInsensitiveCompare:v16];
    if (v17)
    {
      BOOL v4 = [v8 subLocality];
      if (v4)
      {
        unsigned int v18 = [v10 subLocality];
        if (v18)
        {

          BOOL v19 = 0;
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }
      }
    }
    uint64_t v20 = [v8 city];
    v75 = [v10 city];
    uint64_t v73 = objc_msgSend(v20, "caseInsensitiveCompare:");
    uint64_t v74 = v17;
    if (v73)
    {
      uint64_t v21 = [v8 city];
      if (v21)
      {
        v72 = (void *)v21;
        v22 = [v10 city];
        if (v22)
        {

          BOOL v19 = 0;
          if (!v17) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
        v70 = v20;
        v23 = v16;
        v24 = v14;
        v25 = v12;
      }
      else
      {
        v70 = v20;
        v23 = v16;
        v24 = v14;
        v25 = v12;
        v72 = 0;
      }
    }
    else
    {
      v70 = v20;
      v23 = v16;
      v24 = v14;
      v25 = v12;
    }
    v26 = [v8 postalCode];
    v27 = [v10 postalCode];
    v71 = v26;
    uint64_t v69 = [v26 caseInsensitiveCompare:v27];
    if (v69)
    {
      uint64_t v28 = [v8 postalCode];
      if (v28)
      {
        v68 = (void *)v28;
        v29 = [v10 postalCode];
        if (v29)
        {

          BOOL v19 = 0;
          v12 = v25;
          v14 = v24;
          v16 = v23;
          uint64_t v30 = v74;
          goto LABEL_75;
        }
        v67 = v27;
      }
      else
      {
        v67 = v27;
        v68 = 0;
      }
    }
    else
    {
      v67 = v27;
    }
    v12 = v25;
    v14 = v24;
    v16 = v23;
    uint64_t v30 = v74;
    v31 = [v8 subAdministrativeArea];
    v66 = [v10 subAdministrativeArea];
    uint64_t v65 = objc_msgSend(v31, "caseInsensitiveCompare:");
    if (v65)
    {
      uint64_t v32 = [v8 subAdministrativeArea];
      if (v32)
      {
        v61 = (void *)v32;
        v33 = [v10 subAdministrativeArea];
        if (v33)
        {

          BOOL v19 = 0;
LABEL_72:
          if (v69) {

          }
LABEL_75:
          if (v73) {

          }
          if (!v30) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
        v62 = v31;
      }
      else
      {
        v61 = 0;
        v62 = v31;
      }
    }
    else
    {
      v62 = v31;
    }
    v34 = [v8 state];
    v63 = [v10 state];
    v64 = v34;
    uint64_t v60 = objc_msgSend(v34, "caseInsensitiveCompare:");
    if (v60)
    {
      uint64_t v35 = [v8 state];
      if (v35)
      {
        v59 = (void *)v35;
        v36 = [v10 state];
        if (v36)
        {

          BOOL v19 = 0;
LABEL_69:
          if (v65) {

          }
          goto LABEL_72;
        }
      }
      else
      {
        v59 = 0;
      }
    }
    v37 = [v8 country];
    v57 = [v10 country];
    v58 = v37;
    uint64_t v38 = objc_msgSend(v37, "caseInsensitiveCompare:");
    if (v38)
    {
      uint64_t v39 = [v8 country];
      if (v39)
      {
        v56 = (void *)v39;
        v40 = [v10 country];
        if (v40)
        {

          BOOL v19 = 0;
LABEL_66:
          if (v60) {

          }
          goto LABEL_69;
        }
        v53 = v4;
        v54 = v12;
        v41 = v14;
      }
      else
      {
        v53 = v4;
        v54 = v12;
        v41 = v14;
        v56 = 0;
      }
    }
    else
    {
      v53 = v4;
      v54 = v12;
      v41 = v14;
    }
    v42 = [v8 ISOCountryCode];
    v43 = [v10 ISOCountryCode];
    uint64_t v44 = [v42 caseInsensitiveCompare:v43];
    uint64_t v55 = v38;
    if (v44)
    {
      v14 = [v8 ISOCountryCode];
      if (v14)
      {
        v45 = [v10 ISOCountryCode];
        if (v45)
        {

          BOOL v19 = 0;
          v12 = v54;
          v14 = v41;
LABEL_63:
          BOOL v4 = v53;
          uint64_t v30 = v74;
          if (v55) {

          }
          goto LABEL_66;
        }
      }
      v49 = v42;
      v51 = v16;
      v52 = v15;
    }
    else
    {
      v49 = v42;
      v51 = v16;
      v52 = v15;
    }
    v12 = v54;
    if (objc_msgSend(v54, "caseInsensitiveCompare:", v41, v49)) {
      BOOL v46 = v54 == 0;
    }
    else {
      BOOL v46 = 1;
    }
    BOOL v19 = v46 || v41 == 0;
    if (v44) {

    }
    v14 = v41;
    v16 = v51;
    uint64_t v15 = v52;
    goto LABEL_63;
  }
  BOOL v19 = 0;
LABEL_80:

  return v19;
}

- (id)defaultActionURL
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1BA88];
  BOOL v4 = [(CNPropertyGroupPostalAddressItem *)self address];
  uint64_t v5 = [v3 singleLineStringFromPostalAddress:v4 addCountryName:0];
  id v6 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  int v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  v8 = NSString;
  uint64_t v9 = [(CNPropertyGroupItem *)self anyContactLegacyIdentifier];
  uint64_t v10 = [(CNPropertyGroupItem *)self labeledValueMultiValueIdentifierForChosenSourceContact];
  uint64_t v11 = [(CNPropertyGroupItem *)self contact];
  v12 = [v11 identifier];
  uint64_t v13 = [(CNPropertyGroupItem *)self labeledValue];
  v14 = [v13 identifier];
  uint64_t v15 = [v8 stringWithFormat:@"maps:?address=%@&abPersonID=%d&abAddressID=%d&cncontactidentifier=%@&cnaddressidentifier=%@", v7, v9, v10, v12, v14];

  v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];

  return v16;
}

- (id)displayStringForValue:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F1BA88];
  uint64_t v5 = [(CNPropertyGroupPostalAddressItem *)self address];
  id v6 = [v4 stringFromPostalAddress:v5 style:0];

  if (![v6 length])
  {
    int v7 = [(CNPropertyGroupPostalAddressItem *)self address];
    v8 = [v7 dictionaryRepresentation];
    uint64_t v9 = [v8 allValues];
    uint64_t v10 = [v9 componentsJoinedByString:@" "];

    id v6 = (void *)v10;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v27 = v6;
  v12 = [v6 componentsSeparatedByCharactersInSet:v11];

  uint64_t v13 = [MEMORY[0x1E4F28E78] string];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 0;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v22 = [v20 stringByTrimmingCharactersInSet:v21];
        uint64_t v23 = [v22 length];

        if (v23)
        {
          v24 = &stru_1ED8AC728;
          if (v17) {
            v24 = @"\n";
          }
          [v13 appendFormat:@"%@%@", v24, v20];
          char v17 = 1;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  v25 = (void *)[v13 copy];

  return v25;
}

- (id)normalizedValue
{
  v2 = [(CNPropertyGroupItem *)self displayValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];

    v2 = [v3 stringByReplacingOccurrencesOfString:@"\r" withString:@"\n"];
  }

  return v2;
}

- (CNPostalAddress)address
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  uint64_t v3 = [v2 value];

  return (CNPostalAddress *)v3;
}

@end