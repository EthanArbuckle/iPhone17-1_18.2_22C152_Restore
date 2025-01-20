@interface NTKEsterbrookBackgroundStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithBackgroundStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKEsterbrookBackgroundStyleEditOption

+ (id)optionWithBackgroundStyle:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

- (unint64_t)style
{
  return ((uint64_t (*)(NTKEsterbrookBackgroundStyleEditOption *, char *))MEMORY[0x270F9A6D0])(self, sel__value);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691C1EF8);
  id WeakRetained = objc_loadWeakRetained(&qword_2691C1F00);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691C1F00);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691C1F00, v3);
    qword_2691C1F08 = objc_msgSend_version(v3, v13, v14, v15);

    sub_246A82F60();
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691C1F08;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691C1EF8);
  id v16 = (id)qword_2691C1EF0;

  return v16;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"sunday";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"daily";
  }
}

- (id)localizedName
{
  uint64_t v4 = objc_msgSend_style(self, a2, v2, v3);
  v7 = @"ESTERBROOK_STYLE_EDIT_OPTION_SUNDAY";
  if (v4 != 1) {
    v7 = 0;
  }
  if (v4) {
    objc_msgSend_stringByAppendingString_(v7, v5, @"_COMPANION", v6);
  }
  else {
  uint64_t v8 = objc_msgSend_stringByAppendingString_(@"ESTERBROOK_STYLE_EDIT_OPTION_DAILY", v5, @"_COMPANION", v6);
  }
  uint64_t v10 = objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, v9, (uint64_t)v8, (uint64_t)&stru_26FB06168);

  return v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691C1F18 != -1) {
    dispatch_once(&qword_2691C1F18, &unk_26FB017F8);
  }
  uint64_t v2 = (void *)qword_2691C1F10;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end