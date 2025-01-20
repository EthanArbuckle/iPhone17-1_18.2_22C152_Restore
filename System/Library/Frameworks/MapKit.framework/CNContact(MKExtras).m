@interface CNContact(MKExtras)
+ (__CFString)_mapkit_sharedLocationContactIdentifer;
+ (id)mapsContactKeys;
- (uint64_t)_mapkit_isSharedLocationContact;
- (uint64_t)_maps_isEqualToContact:()MKExtras;
@end

@implementation CNContact(MKExtras)

+ (id)mapsContactKeys
{
  v11[17] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
  uint64_t v1 = *MEMORY[0x1E4F1AFA8];
  v11[0] = v0;
  v11[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADF0];
  v11[2] = *MEMORY[0x1E4F1AEB0];
  v11[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADE0];
  v11[4] = *MEMORY[0x1E4F1AEA0];
  v11[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEC0];
  v11[6] = *MEMORY[0x1E4F1AEB8];
  v11[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AF00];
  v11[8] = *MEMORY[0x1E4F1AEF8];
  v11[9] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AED8];
  v11[10] = *MEMORY[0x1E4F1AEF0];
  v11[11] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AEE0];
  v11[12] = *MEMORY[0x1E4F1AE78];
  v11[13] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1AF10];
  v11[14] = *MEMORY[0x1E4F1ADC8];
  v11[15] = v8;
  v11[16] = *MEMORY[0x1E4F1AFB0];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:17];

  return v9;
}

- (uint64_t)_maps_isEqualToContact:()MKExtras
{
  id v4 = a3;
  if (a1 != v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1B8F8] mapsContactKeys];
    if (![a1 areKeysAvailable:v5]
      || ![v4 areKeysAvailable:v5])
    {
      uint64_t v49 = 0;
LABEL_72:

      goto LABEL_73;
    }
    uint64_t v6 = [a1 namePrefix];
    uint64_t v7 = [v4 namePrefix];
    if (![v6 isEqualToString:v7])
    {
      uint64_t v49 = 0;
LABEL_71:

      goto LABEL_72;
    }
    uint64_t v8 = [a1 givenName];
    v9 = [v4 givenName];
    if (![v8 isEqualToString:v9])
    {
      uint64_t v49 = 0;
LABEL_70:

      goto LABEL_71;
    }
    v10 = [a1 middleName];
    v11 = [v4 middleName];
    if (![v10 isEqualToString:v11])
    {
      uint64_t v49 = 0;
LABEL_69:

      goto LABEL_70;
    }
    uint64_t v12 = [a1 familyName];
    uint64_t v13 = [v4 familyName];
    v92 = (void *)v12;
    v14 = (void *)v12;
    v15 = (void *)v13;
    if (![v14 isEqualToString:v13])
    {
      uint64_t v49 = 0;
LABEL_68:

      goto LABEL_69;
    }
    v89 = v10;
    v16 = [a1 nameSuffix];
    v90 = [v4 nameSuffix];
    v91 = v16;
    if (![v16 isEqualToString:v90])
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_67:

      goto LABEL_68;
    }
    v17 = [a1 nickname];
    v87 = [v4 nickname];
    v88 = v17;
    if (!objc_msgSend(v17, "isEqualToString:"))
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_66:

      goto LABEL_67;
    }
    v18 = [a1 phoneticGivenName];
    [v4 phoneticGivenName];
    v85 = v86 = v18;
    if (!objc_msgSend(v18, "isEqualToString:"))
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_65:

      goto LABEL_66;
    }
    v19 = [a1 phoneticMiddleName];
    v83 = [v4 phoneticMiddleName];
    v84 = v19;
    if (!objc_msgSend(v19, "isEqualToString:"))
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_64:

      goto LABEL_65;
    }
    v20 = [a1 phoneticFamilyName];
    v81 = [v4 phoneticFamilyName];
    v82 = v20;
    if (![v20 isEqualToString:v81])
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_63:

      goto LABEL_64;
    }
    v21 = [a1 organizationName];
    v69 = [v4 organizationName];
    v70 = v21;
    if (![v21 isEqualToString:v69])
    {
      uint64_t v49 = 0;
      v10 = v89;
LABEL_62:

      goto LABEL_63;
    }
    v22 = [a1 jobTitle];
    v62 = [v4 jobTitle];
    v63 = v22;
    if (![v22 isEqualToString:v62])
    {
      uint64_t v49 = 0;
LABEL_61:
      v10 = v89;

      goto LABEL_62;
    }
    v60 = v15;
    v23 = [a1 phoneNumbers];
    v24 = [v4 phoneNumbers];
    id v25 = v23;
    id v26 = v24;
    uint64_t v78 = [v25 count];
    v71 = v26;
    if (v78 != [v26 count])
    {
      uint64_t v49 = 0;
      v80 = v26;
LABEL_53:
      v51 = v25;
LABEL_60:

      v15 = v60;
      goto LABEL_61;
    }
    uint64_t v64 = [v25 count];
    id v68 = v25;
    if (v64)
    {
      uint64_t v27 = 0;
      while (1)
      {
        v75 = [v25 objectAtIndexedSubscript:v27];
        v72 = [v71 objectAtIndexedSubscript:v27];
        char v79 = [v75 isEqualIgnoringIdentifiers:v72];

        if ((v79 & 1) == 0) {
          break;
        }
        ++v27;
        id v25 = v68;
        if (v64 == v27) {
          goto LABEL_20;
        }
      }
      uint64_t v49 = 0;
      v80 = v71;
      id v25 = v68;
      goto LABEL_53;
    }
LABEL_20:

    v28 = [a1 emailAddresses];
    v29 = [v4 emailAddresses];
    id v30 = v28;
    id v31 = v29;
    v61 = v30;
    uint64_t v32 = [v30 count];
    v80 = v31;
    if (v32 != [v31 count]) {
      goto LABEL_51;
    }
    uint64_t v57 = [v61 count];
    if (v57)
    {
      uint64_t v33 = 0;
      while (1)
      {
        v73 = [v61 objectAtIndexedSubscript:v33];
        uint64_t v34 = v33;
        v65 = [v80 objectAtIndexedSubscript:v33];
        char v76 = [v73 isEqualIgnoringIdentifiers:v65];

        if ((v76 & 1) == 0) {
          break;
        }
        ++v33;
        if (v57 == v34 + 1) {
          goto LABEL_25;
        }
      }
LABEL_51:
      uint64_t v49 = 0;
      v77 = v61;

LABEL_59:
      v51 = v61;
      id v25 = v68;
      goto LABEL_60;
    }
LABEL_25:

    v35 = [a1 postalAddresses];
    v36 = [v4 postalAddresses];
    id v37 = v35;
    id v38 = v36;
    v77 = v37;
    uint64_t v39 = [v37 count];
    v74 = v38;
    if (v39 == [v38 count])
    {
      uint64_t v53 = [v77 count];
      if (!v53)
      {
LABEL_30:

        v41 = [a1 urlAddresses];
        v42 = [v4 urlAddresses];
        id v43 = v41;
        id v44 = v42;
        v59 = v43;
        uint64_t v45 = [v43 count];
        v56 = v44;
        if (v45 == [v44 count])
        {
          uint64_t v46 = [v43 count];
          if (v46)
          {
            uint64_t v47 = 0;
            uint64_t v54 = v46 - 1;
            do
            {
              v48 = objc_msgSend(v59, "objectAtIndexedSubscript:", v47, v54);
              v67 = [v56 objectAtIndexedSubscript:v47];
              uint64_t v49 = [v48 isEqualIgnoringIdentifiers:v67];

              if (!v49) {
                break;
              }
            }
            while (v54 != v47++);
          }
          else
          {
            uint64_t v49 = 1;
          }
        }
        else
        {
          uint64_t v49 = 0;
        }

        goto LABEL_58;
      }
      uint64_t v40 = 0;
      while (1)
      {
        v58 = objc_msgSend(v77, "objectAtIndexedSubscript:", v40, v53);
        v55 = [v74 objectAtIndexedSubscript:v40];
        char v66 = [v58 isEqualIgnoringIdentifiers:v55];

        if ((v66 & 1) == 0) {
          break;
        }
        if (v53 == ++v40) {
          goto LABEL_30;
        }
      }
    }
    uint64_t v49 = 0;
    v59 = v77;

LABEL_58:
    goto LABEL_59;
  }
  uint64_t v49 = 1;
LABEL_73:

  return v49;
}

+ (__CFString)_mapkit_sharedLocationContactIdentifer
{
  return @"ShareLocationContactIdentifier";
}

- (uint64_t)_mapkit_isSharedLocationContact
{
  uint64_t v1 = [a1 postalAddresses];
  uint64_t v2 = [v1 firstObject];

  uint64_t v3 = [v2 identifier];
  id v4 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

@end