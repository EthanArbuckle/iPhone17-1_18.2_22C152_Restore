@interface NTKParmesanColorEditOption
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorsForGroup:(unint64_t)a3 device:(id)a4;
+ (id)defaultOptionForSlot:(id)a3 style:(unint64_t)a4 device:(id)a5;
+ (id)duotoneColorsForDevice:(id)a3;
+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4;
+ (id)optionAtIndex:(unint64_t)a3 slot:(id)a4 style:(unint64_t)a5 device:(id)a6;
+ (id)optionByValidatingValueOfInvalidOption:(id)a3;
+ (id)optionWithFaceColor:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithOption:(id)a3 slot:(id)a4 style:(unint64_t)a5 forDevice:(id)a6;
+ (id)plainColorsForDevice:(id)a3;
+ (id)regularColorsForDevice:(id)a3;
+ (id)timeColorsForDevice:(id)a3;
+ (id)tritoneColorsForDevice:(id)a3;
+ (unint64_t)groupForSlot:(id)a3 style:(unint64_t)a4;
+ (unint64_t)indexOfOption:(id)a3 slot:(id)a4 style:(unint64_t)a5 device:(id)a6;
+ (unint64_t)numberOfOptionsForSlot:(id)a3 style:(unint64_t)a4 device:(id)a5;
- (BOOL)isValidOption;
- (UIColor)colorValue;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKParmesanColorEditOption

- (UIColor)colorValue
{
  objc_msgSend_color(self, a2, v2, v3);
  v8 = objc_msgSend_device(self, v5, v6, v7);
  v9 = NTKForegroundColor();

  return (UIColor *)v9;
}

+ (id)optionWithFaceColor:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)defaultOptionForSlot:(id)a3 style:(unint64_t)a4 device:(id)a5
{
  id v7 = a5;
  unint64_t v9 = objc_msgSend_groupForSlot_style_(NTKParmesanColorEditOption, v8, (uint64_t)a3, a4);
  if (v9 <= 4)
  {
    a4 = objc_msgSend_optionWithFaceColor_forDevice_(NTKParmesanColorEditOption, v10, qword_246C32D08[v9], (uint64_t)v7);
  }

  return (id)a4;
}

+ (id)optionWithOption:(id)a3 slot:(id)a4 style:(unint64_t)a5 forDevice:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v13 = objc_msgSend_groupForSlot_style_(NTKParmesanColorEditOption, v12, (uint64_t)a4, a5);
  v15 = objc_msgSend_colorsForGroup_device_(NTKParmesanColorEditOption, v14, v13, (uint64_t)v10);
  uint64_t v19 = objc_msgSend_color(v11, v16, v17, v18);

  v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, v19, v21);
  char v25 = objc_msgSend_containsObject_(v15, v23, (uint64_t)v22, v24);

  if ((v25 & 1) == 0)
  {
    v29 = objc_msgSend_firstObject(v15, v26, v27, v28);
    uint64_t v19 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32);
  }
  v33 = objc_msgSend_optionWithFaceColor_forDevice_(a1, v26, v19, (uint64_t)v10);

  return v33;
}

+ (unint64_t)numberOfOptionsForSlot:(id)a3 style:(unint64_t)a4 device:(id)a5
{
  id v7 = a5;
  uint64_t v9 = objc_msgSend_groupForSlot_style_(NTKParmesanColorEditOption, v8, (uint64_t)a3, a4);
  id v11 = objc_msgSend_colorsForGroup_device_(NTKParmesanColorEditOption, v10, v9, (uint64_t)v7);

  unint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);
  return v15;
}

+ (id)optionAtIndex:(unint64_t)a3 slot:(id)a4 style:(unint64_t)a5 device:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v13 = objc_msgSend_groupForSlot_style_(NTKParmesanColorEditOption, v12, (uint64_t)v11, a5);
  unint64_t v15 = objc_msgSend_numberOfOptionsForSlot_style_device_(a1, v14, (uint64_t)v11, a5, v10);

  if (v15 <= a3) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = a3;
  }
  uint64_t v18 = objc_msgSend_colorsForGroup_device_(NTKParmesanColorEditOption, v16, v13, (uint64_t)v10);
  uint64_t v21 = objc_msgSend_objectAtIndex_(v18, v19, v17, v20);
  uint64_t v25 = objc_msgSend_unsignedIntegerValue(v21, v22, v23, v24);

  uint64_t v27 = objc_msgSend_optionWithFaceColor_forDevice_(a1, v26, v25, (uint64_t)v10);

  return v27;
}

+ (unint64_t)indexOfOption:(id)a3 slot:(id)a4 style:(unint64_t)a5 device:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v12 = objc_msgSend_groupForSlot_style_(NTKParmesanColorEditOption, v11, (uint64_t)a4, a5);
  uint64_t v14 = objc_msgSend_colorsForGroup_device_(NTKParmesanColorEditOption, v13, v12, (uint64_t)v9);

  uint64_t v18 = objc_msgSend_color(v10, v15, v16, v17);
  uint64_t v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, v18, v20);
  uint64_t v24 = objc_msgSend_indexOfObject_(v14, v22, (uint64_t)v21, v23);

  if (v24 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v25 = 0;
  }
  else {
    unint64_t v25 = v24;
  }

  return v25;
}

+ (unint64_t)groupForSlot:(id)a3 style:(unint64_t)a4
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"time-color", a4)) {
    return 4;
  }
  if (a4 - 2 > 4) {
    return 0;
  }
  return qword_246C32D30[a4 - 2];
}

+ (id)optionByValidatingValueOfInvalidOption:(id)a3
{
  return (id)((uint64_t (*)(void, char *, id))MEMORY[0x270F9A6D0])(MEMORY[0x263F579F0], sel__optionByValidatingValueOfInvalidOption_, a3);
}

- (BOOL)isValidOption
{
  unint64_t v5 = 0;
  BOOL v6 = 1;
  while (1)
  {
    id v7 = objc_msgSend_device(self, a2, v2, v3);
    id v9 = objc_msgSend_colorsForGroup_device_(NTKParmesanColorEditOption, v8, v5, (uint64_t)v7);

    id v10 = NSNumber;
    uint64_t v14 = objc_msgSend__value(self, v11, v12, v13);
    uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v10, v15, v14, v16);
    char v20 = objc_msgSend_containsObject_(v9, v18, (uint64_t)v17, v19);

    if (v20) {
      break;
    }
    BOOL v6 = v5++ < 5;
    if (v5 == 6)
    {
      objc_msgSend_logObject(NTKParmesanFaceBundle, a2, v2, v3);
      uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        sub_246C2B7AC(self, v21, v22, v23);
      }

      return 0;
    }
  }
  return v6;
}

- (id)localizedName
{
  v4 = objc_msgSend_pigmentEditOption(self, a2, v2, v3);
  v8 = objc_msgSend_localizedName(v4, v5, v6, v7);

  return v8;
}

- (id)pigmentEditOption
{
  if (objc_msgSend_color(self, a2, v2, v3) == 3000)
  {
    v8 = @"plain";
    id v9 = NTKParmesanColorNamePlain;
    goto LABEL_5;
  }
  if (objc_msgSend_color(self, v5, v6, v7) == 3027)
  {
    v8 = @"time";
    id v9 = NTKParmesanColorNameVibrant;
LABEL_5:
    uint64_t v13 = *v9;
LABEL_6:
    uint64_t v14 = v13;
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend_color(self, v10, v11, v12) >= 0xBB9
    && (unint64_t)objc_msgSend_color(self, v19, v20, v21) <= 0xBCC)
  {
    v8 = @"duotone";
    switch(objc_msgSend_color(self, v22, v23, v24))
    {
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3008:
      case 3009:
      case 3010:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
      case 3016:
      case 3017:
      case 3018:
      case 3019:
      case 3020:
        NTKFaceColorNameForDuotones();
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      default:
        goto LABEL_18;
    }
  }
  if ((unint64_t)objc_msgSend_color(self, v19, v20, v21) < 0xBCD
    || (unint64_t)objc_msgSend_color(self, v25, v26, v27) > 0xBD2)
  {
    objc_msgSend_color(self, v25, v26, v27);
    NTKFaceColorNameAndCollection();
    uint64_t v14 = (__CFString *)0;
    v8 = (__CFString *)0;
  }
  else
  {
    v8 = @"tritone";
    switch(objc_msgSend_color(self, v28, v29, v30))
    {
      case 3021:
        id v9 = NTKParmesanColorNameTritone01;
        goto LABEL_5;
      case 3022:
        id v9 = NTKParmesanColorNameTritone02;
        goto LABEL_5;
      case 3023:
        id v9 = NTKParmesanColorNameTritone03;
        goto LABEL_5;
      case 3024:
        id v9 = NTKParmesanColorNameTritone04;
        goto LABEL_5;
      case 3025:
        id v9 = NTKParmesanColorNameTritone05;
        goto LABEL_5;
      case 3026:
        id v9 = &NTKParmesanColorNameTritone06;
        goto LABEL_5;
      default:
LABEL_18:
        uint64_t v14 = 0;
        break;
    }
  }
LABEL_7:
  id v15 = objc_alloc(MEMORY[0x263F57A50]);
  uint64_t v17 = objc_msgSend_initWithOptionName_collectionName_(v15, v16, (uint64_t)v14, (uint64_t)v8);

  return v17;
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_optionName(v6, v8, v9, v10);
  int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, @"plain", v13);

  if (isEqualToString)
  {
    objc_msgSend_optionWithFaceColor_forDevice_(a1, v15, 3000, (uint64_t)v7);
  }
  else
  {
    uint64_t v18 = objc_msgSend_optionName(v6, v15, v16, v17);
    int v21 = objc_msgSend_isEqualToString_(v18, v19, @"vibrant", v20);

    if (v21)
    {
      objc_msgSend_optionWithFaceColor_forDevice_(a1, v22, 3027, (uint64_t)v7);
    }
    else
    {
      unint64_t v25 = objc_msgSend_optionName(v6, v22, v23, v24);
      int v28 = objc_msgSend_isEqualToString_(v25, v26, @"tritone-01", v27);

      if (v28)
      {
        objc_msgSend_optionWithFaceColor_forDevice_(a1, v29, 3021, (uint64_t)v7);
      }
      else
      {
        uint64_t v32 = objc_msgSend_optionName(v6, v29, v30, v31);
        int v35 = objc_msgSend_isEqualToString_(v32, v33, @"tritone-02", v34);

        if (v35)
        {
          objc_msgSend_optionWithFaceColor_forDevice_(a1, v36, 3022, (uint64_t)v7);
        }
        else
        {
          v39 = objc_msgSend_optionName(v6, v36, v37, v38);
          int v42 = objc_msgSend_isEqualToString_(v39, v40, @"tritone-03", v41);

          if (v42)
          {
            objc_msgSend_optionWithFaceColor_forDevice_(a1, v43, 3023, (uint64_t)v7);
          }
          else
          {
            v46 = objc_msgSend_optionName(v6, v43, v44, v45);
            int v49 = objc_msgSend_isEqualToString_(v46, v47, @"tritone-04", v48);

            if (v49)
            {
              objc_msgSend_optionWithFaceColor_forDevice_(a1, v50, 3024, (uint64_t)v7);
            }
            else
            {
              v53 = objc_msgSend_optionName(v6, v50, v51, v52);
              int v56 = objc_msgSend_isEqualToString_(v53, v54, @"tritone-05", v55);

              if (v56)
              {
                objc_msgSend_optionWithFaceColor_forDevice_(a1, v57, 3025, (uint64_t)v7);
              }
              else
              {
                v60 = objc_msgSend_optionName(v6, v57, v58, v59);
                int v63 = objc_msgSend_isEqualToString_(v60, v61, @"tritone-06", v62);

                if (!v63)
                {
                  v67 = objc_msgSend_legacyOptionWithPigmentEditOption_forDevice_(MEMORY[0x263F579F0], v64, (uint64_t)v6, (uint64_t)v7);
                  v71 = v67;
                  if (v67)
                  {
                    uint64_t v72 = objc_msgSend_faceColor(v67, v68, v69, v70);
                    v65 = objc_msgSend_optionWithFaceColor_forDevice_(a1, v73, v72, (uint64_t)v7);
                  }
                  else
                  {
                    v65 = 0;
                  }

                  goto LABEL_18;
                }
                objc_msgSend_optionWithFaceColor_forDevice_(a1, v64, 3026, (uint64_t)v7);
              }
            }
          }
        }
      }
    }
  v65 = };
LABEL_18:

  return v65;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D8EB8 != -1) {
    dispatch_once(&qword_2691D8EB8, &unk_26FB1C2C0);
  }
  uint64_t v2 = (void *)qword_2691D8EB0;

  return v2;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 - 3000 >= 0x1C)
  {
    objc_msgSend__snapshotKeyForValue_forDevice_(MEMORY[0x263F579F0], v5, a3, (uint64_t)v6);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_2651FC470[a3 - 3000];
  }

  return v7;
}

+ (id)colorsForGroup:(unint64_t)a3 device:(id)a4
{
  id v7 = a4;
  switch(a3)
  {
    case 0uLL:
      unint64_t v8 = objc_msgSend_plainColorsForDevice_(NTKParmesanColorEditOption, v5, (uint64_t)v7, v6);
      goto LABEL_7;
    case 1uLL:
      unint64_t v8 = objc_msgSend_regularColorsForDevice_(NTKParmesanColorEditOption, v5, (uint64_t)v7, v6);
      goto LABEL_7;
    case 2uLL:
      unint64_t v8 = objc_msgSend_duotoneColorsForDevice_(NTKParmesanColorEditOption, v5, (uint64_t)v7, v6);
      goto LABEL_7;
    case 3uLL:
      unint64_t v8 = objc_msgSend_tritoneColorsForDevice_(NTKParmesanColorEditOption, v5, (uint64_t)v7, v6);
      goto LABEL_7;
    case 4uLL:
      unint64_t v8 = objc_msgSend_timeColorsForDevice_(NTKParmesanColorEditOption, v5, (uint64_t)v7, v6);
LABEL_7:
      a3 = v8;
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)plainColorsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8EC8);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8ED0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691D8ED0);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691D8ED0, v3);
    qword_2691D8ED8 = objc_msgSend_version(v3, v13, v14, v15);

    uint64_t v16 = (void *)qword_2691D8EC0;
    qword_2691D8EC0 = (uint64_t)&unk_26FB34FB0;

    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691D8ED8;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8EC8);
  id v17 = (id)qword_2691D8EC0;

  return v17;
}

+ (id)duotoneColorsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8EE8);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8EF0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691D8EF0);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691D8EF0, v3);
    qword_2691D8EF8 = objc_msgSend_version(v3, v13, v14, v15);

    sub_246B7A1D8(v16, v3);
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691D8EF8;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8EE8);
  id v17 = (id)qword_2691D8EE0;

  return v17;
}

+ (id)regularColorsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8F08);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8F10);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691D8F10);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691D8F10, v3);
    qword_2691D8F18 = objc_msgSend_version(v3, v13, v14, v15);

    sub_246B7A4C4(v16, v3);
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691D8F18;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8F08);
  id v17 = (id)qword_2691D8F00;

  return v17;
}

+ (id)tritoneColorsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8F28);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8F30);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691D8F30);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691D8F30, v3);
    qword_2691D8F38 = objc_msgSend_version(v3, v13, v14, v15);

    uint64_t v16 = (void *)qword_2691D8F20;
    qword_2691D8F20 = (uint64_t)&unk_26FB34FC8;

    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691D8F38;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8F28);
  id v17 = (id)qword_2691D8F20;

  return v17;
}

+ (id)timeColorsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691D8F48);
  id WeakRetained = objc_loadWeakRetained(&qword_2691D8F50);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691D8F50);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691D8F50, v3);
    qword_2691D8F58 = objc_msgSend_version(v3, v13, v14, v15);

    sub_246B7A768(v16, v3);
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691D8F58;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691D8F48);
  id v17 = (id)qword_2691D8F40;

  return v17;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end