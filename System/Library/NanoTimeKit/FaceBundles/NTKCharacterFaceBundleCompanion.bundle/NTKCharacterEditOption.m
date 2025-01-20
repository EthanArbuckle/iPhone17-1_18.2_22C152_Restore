@interface NTKCharacterEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithCharacter:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKCharacterEditOption

+ (id)optionWithCharacter:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26258);
  id WeakRetained = objc_loadWeakRetained(&qword_26260);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_26260);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_26260, v3);
    qword_26268 = (uint64_t)[v3 version];

    v10 = (void *)qword_26250;
    qword_26250 = (uint64_t)&off_1EA00;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_26268;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26258);
  id v11 = (id)qword_26250;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"minnie";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"mickey";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"EDIT_OPTION_LABEL_CHARACTER_MINNIE";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_CHARACTER_MICKEY";
  }
}

+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = [a1 _nameLocalizationKeyForValue:a3 forDevice:a4];
  if (!v4) {
    +[NSException raise:NSInternalInconsistencyException, @"%@ must implement either _localizedNameForValue:forDevice: or _nameLocalizationKeyForValue:forDevice:", objc_opt_class() format];
  }
  v5 = [v4 stringByAppendingString:@"_COMPANION"];
  id v6 = +[NTKCharacterFaceBundle localizedStringForKey:v5 comment:@"name for edit option"];
  if (!v6)
  {
    id v6 = +[NTKCharacterFaceBundle localizedStringForKey:v4 comment:@"name for edit option"];
  }

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_26278 != -1) {
    dispatch_once(&qword_26278, &stru_1C8D0);
  }
  v2 = (void *)qword_26270;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end