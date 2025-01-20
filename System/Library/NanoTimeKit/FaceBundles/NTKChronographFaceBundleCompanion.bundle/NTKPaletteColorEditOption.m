@interface NTKPaletteColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColorValue:(unint64_t)a3;
+ (id)optionByValidatingValueOfInvalidOption:(id)a3;
+ (id)optionWithPaletteColor:(unint64_t)a3 forDevice:(id)a4;
+ (unint64_t)colorValueForColorName:(id)a3;
+ (void)colorName:(id *)a3 collectionName:(id *)a4 forColorValue:(unint64_t)a5;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKPaletteColorEditOption

+ (id)optionWithPaletteColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)optionByValidatingValueOfInvalidOption:(id)a3
{
  id v3 = a3;
  v4 = [v3 device];
  if (!NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()) {
    goto LABEL_11;
  }
  v5 = (char *)[v3 _value];
  v6 = (char *)[v4 collectionType];
  [v4 materialType];
  v7 = objc_opt_class();
  if (v5 == (unsigned char *)&dword_8 + 1)
  {
    if (v6 == (unsigned char *)&dword_4 + 2) {
      goto LABEL_11;
    }
    uint64_t v8 = 13;
  }
  else
  {
    if (v5 != (unsigned char *)&dword_4 + 3)
    {
      if (!v5)
      {
        if (v6 == (unsigned char *)&dword_0 + 3) {
          uint64_t v8 = 19;
        }
        else {
          uint64_t v8 = 18;
        }
        goto LABEL_13;
      }
LABEL_11:
      v9 = 0;
      goto LABEL_14;
    }
    if (v6 == (unsigned char *)&dword_4 + 1) {
      goto LABEL_11;
    }
    uint64_t v8 = 11;
  }
LABEL_13:
  v9 = [v7 optionWithPaletteColor:v8 forDevice:v4];
LABEL_14:

  return v9;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (char *)[v3 collectionType];

  if (v5 == (unsigned char *)&dword_4 + 1)
  {
    v6 = &off_1D5F0;
  }
  else
  {
    if (v5 != (unsigned char *)&dword_4 + 2) {
      goto LABEL_6;
    }
    v6 = &off_1D608;
  }
  [v4 addObject:v6];
LABEL_6:

  return v4;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_238E8);
  id WeakRetained = objc_loadWeakRetained(&qword_238F0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_238F0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_238F0, v4);
    qword_238F8 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_238E0;
    qword_238E0 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_238F8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_238E8);
  id v13 = (id)qword_238E0;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [&off_1DE28 mutableCopy];
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues())
  {
    [v5 insertObject:&off_1D6C8 atIndex:0];
    [v5 addObjectsFromArray:&off_1DE40];
  }
  else
  {
    [v5 insertObject:&off_1D7B8 atIndex:0];
  }
  v6 = [a1 _orderedValuesRestrictedByDevice:v4];
  id v7 = [v6 reverseObjectEnumerator];
  id v8 = [v7 allObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v5, "insertObject:atIndex:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, (void)v15);
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 0x13) {
    return 0;
  }
  else {
    return *(&off_1C5A8 + a3);
  }
}

- (id)localizedName
{
  v2 = [(NTKPaletteColorEditOption *)self pigmentEditOption];
  id v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_23908 != -1) {
    dispatch_once(&qword_23908, &stru_1C588);
  }
  v2 = (void *)qword_23900;

  return v2;
}

+ (void)colorName:(id *)a3 collectionName:(id *)a4 forColorValue:(unint64_t)a5
{
  id v9 = NTKColorPaletteDomainChronograph;
  id v10 = v9;
  id v11 = @"black";
  switch(a5)
  {
    case 0uLL:
      goto LABEL_23;
    case 1uLL:
      id v11 = @"darkBlue";
      goto LABEL_23;
    case 2uLL:
      id v11 = @"darkBrown";
      goto LABEL_23;
    case 3uLL:
      id v11 = @"darkGreen";
      goto LABEL_23;
    case 4uLL:
      id v11 = @"darkGray";
      goto LABEL_23;
    case 5uLL:
      id v11 = @"lightGray";
      goto LABEL_23;
    case 6uLL:
      id v11 = @"lightYellow";
      goto LABEL_23;
    case 7uLL:
      id v36 = v9;
      uint64_t v37 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v36;
      goto LABEL_22;
    case 8uLL:
      id v11 = @"lightBlue";
      goto LABEL_23;
    case 9uLL:
      id v34 = v9;
      uint64_t v35 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v34;
      goto LABEL_22;
    case 0xAuLL:
      id v32 = v9;
      uint64_t v33 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v32;
      goto LABEL_22;
    case 0xBuLL:
      id v30 = v9;
      uint64_t v31 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v30;
      goto LABEL_22;
    case 0xCuLL:
      id v28 = v9;
      uint64_t v29 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v28;
      goto LABEL_22;
    case 0xDuLL:
      id v26 = v9;
      uint64_t v27 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v26;
      goto LABEL_22;
    case 0xEuLL:
      id v24 = v9;
      uint64_t v25 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v24;
      goto LABEL_22;
    case 0xFuLL:
      id v22 = v9;
      uint64_t v23 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v22;
      goto LABEL_22;
    case 0x10uLL:
      id v20 = v9;
      uint64_t v21 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v20;
      goto LABEL_22;
    case 0x11uLL:
      id v18 = v9;
      uint64_t v19 = 0;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v18;
      goto LABEL_22;
    case 0x12uLL:
      id v16 = v9;
      id v17 = 0;
      [a1 colorName:&v17 collectionName:&v16 forColorValue:0];
      id v11 = (__CFString *)v17;
      uint64_t v12 = v16;
      goto LABEL_22;
    case 0x13uLL:
      id v15 = v9;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v15;
      goto LABEL_22;
    default:
      id v14 = v9;
      NTKFaceColorNameAndCollection();
      id v11 = (__CFString *)0;
      uint64_t v12 = v14;
LABEL_22:
      id v13 = v12;

      id v10 = v13;
LABEL_23:
      if (a3) {
        *a3 = v11;
      }
      if (a4) {
        *a4 = v10;
      }

      return;
  }
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  id v5 = 0;
  [a1 colorName:&v5 collectionName:0 forColorValue:a3];
  id v3 = v5;

  return v3;
}

+ (unint64_t)colorValueForColorName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 18;
  v6 = [a1 colorNameForColorValue:18];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    unint64_t v5 = 1;
    id v8 = [a1 colorNameForColorValue:1];
    unsigned __int8 v9 = [v4 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      unint64_t v5 = 2;
      id v10 = [a1 colorNameForColorValue:2];
      unsigned __int8 v11 = [v4 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        unint64_t v5 = 3;
        uint64_t v12 = [a1 colorNameForColorValue:3];
        unsigned __int8 v13 = [v4 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          unint64_t v5 = 4;
          id v14 = [a1 colorNameForColorValue:4];
          unsigned __int8 v15 = [v4 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            unint64_t v5 = 5;
            id v16 = [a1 colorNameForColorValue:5];
            unsigned __int8 v17 = [v4 isEqualToString:v16];

            if ((v17 & 1) == 0)
            {
              unint64_t v5 = 6;
              id v18 = [a1 colorNameForColorValue:6];
              unsigned __int8 v19 = [v4 isEqualToString:v18];

              if ((v19 & 1) == 0)
              {
                id v20 = [a1 colorNameForColorValue:8];
                unsigned int v21 = [v4 isEqualToString:v20];

                if (v21) {
                  unint64_t v5 = 8;
                }
                else {
                  unint64_t v5 = 20;
                }
              }
            }
          }
        }
      }
    }
  }

  return v5;
}

- (id)pigmentEditOption
{
  id v6 = 0;
  id v7 = 0;
  objc_msgSend((id)objc_opt_class(), "colorName:collectionName:forColorValue:", &v7, &v6, -[NTKPaletteColorEditOption _value](self, "_value"));
  id v2 = v7;
  id v3 = v6;
  id v4 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v2 collectionName:v3];

  return v4;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  if (NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()) {
    return 1;
  }
  unint64_t v5 = NTKPaletteColorsForGreenfieldColorMapping();
  unsigned __int8 v6 = objc_msgSend(v5, "containsIndex:", -[NTKPaletteColorEditOption paletteColor](self, "paletteColor"));

  return v6 ^ 1;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end