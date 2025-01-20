@interface NTKGreyhoundStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKGreyhoundStyleEditOption

- (unint64_t)style
{
  return (unint64_t)[(NTKGreyhoundStyleEditOption *)self _value];
}

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)defaultOptionForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CLKLocaleCurrentNumberSystem();
  uint64_t v5 = 3;
  if (v4 != 2) {
    uint64_t v5 = 1;
  }
  if (v4 == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  v7 = +[NTKGreyhoundStyleEditOption optionWithStyle:v6 forDevice:v3];

  return v7;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1A5A8);
  id WeakRetained = objc_loadWeakRetained(&qword_1A5B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_1A5B0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_1A5B0, v3);
    qword_1A5B8 = (uint64_t)[v3 version];

    sub_922C(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_1A5B8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1A5A8);
  id v11 = (id)qword_1A5A0;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_14578[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_1A5C8 != -1) {
    dispatch_once(&qword_1A5C8, &stru_14558);
  }
  v2 = (void *)qword_1A5C0;

  return v2;
}

- (id)localizedName
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(NTKGreyhoundStyleEditOption *)self device];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"10262875-CE7F-4736-BEE0-2233E4EAA468"];
    unsigned int v5 = [v3 supportsCapability:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }
  switch([(NTKGreyhoundStyleEditOption *)self style])
  {
    case 0uLL:
      CFStringRef v6 = @"EDIT_OPTION_LABEL_STYLE_ROMAN";
      break;
    case 1uLL:
      CFStringRef v7 = @"EDIT_OPTION_LABEL_STYLE_ARABIC_COMPATIBILITY";
      CFStringRef v8 = @"EDIT_OPTION_LABEL_STYLE_ARABIC";
      goto LABEL_9;
    case 2uLL:
      CFStringRef v7 = @"EDIT_OPTION_LABEL_STYLE_ARABIC_INDIC_COMPATIBILITY";
      CFStringRef v8 = @"EDIT_OPTION_LABEL_STYLE_ARABIC_INDIC";
LABEL_9:
      if (v5) {
        CFStringRef v6 = v8;
      }
      else {
        CFStringRef v6 = v7;
      }
      break;
    case 3uLL:
      CFStringRef v6 = @"EDIT_OPTION_LABEL_STYLE_DEVANAGARI";
      break;
    case 4uLL:
      CFStringRef v6 = @"EDIT_OPTION_LABEL_STYLE_CHINESE";
      break;
    default:
      CFStringRef v6 = 0;
      break;
  }

  return +[NTKGreyhoundFaceBundle localizedStringForKey:v6 comment:@"style"];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end