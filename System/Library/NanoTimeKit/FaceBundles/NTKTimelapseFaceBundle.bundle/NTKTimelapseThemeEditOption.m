@interface NTKTimelapseThemeEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_resourceBaseNameForTheme:(unint64_t)a3 forDevice:(id)a4;
+ (id)_resourceNameForTheme:(unint64_t)a3 videoIndex:(int64_t)a4 forDevice:(id)a5;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTimelapseTheme:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionsDescription;
- (NSString)resourceBaseName;
- (NSString)resourceName;
- (id)_valueToFaceBundleStringDict;
- (id)resourceNameWithVideoIndex:(int64_t)a3;
- (int64_t)swatchStyle;
- (unint64_t)timelapseTheme;
@end

@implementation NTKTimelapseThemeEditOption

+ (id)optionWithTimelapseTheme:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)timelapseTheme
{
  return (unint64_t)[(NTKTimelapseThemeEditOption *)self _value];
}

- (NSString)resourceBaseName
{
  v3 = objc_opt_class();
  unint64_t v4 = [(NTKTimelapseThemeEditOption *)self timelapseTheme];
  v5 = [(NTKTimelapseThemeEditOption *)self device];
  v6 = [v3 _resourceBaseNameForTheme:v4 forDevice:v5];

  return (NSString *)v6;
}

- (NSString)resourceName
{
  v3 = objc_opt_class();
  unint64_t v4 = [(NTKTimelapseThemeEditOption *)self timelapseTheme];
  v5 = [(NTKTimelapseThemeEditOption *)self device];
  v6 = [v3 _resourceNameForTheme:v4 videoIndex:-1 forDevice:v5];

  return (NSString *)v6;
}

- (id)resourceNameWithVideoIndex:(int64_t)a3
{
  v5 = objc_opt_class();
  unint64_t v6 = [(NTKTimelapseThemeEditOption *)self timelapseTheme];
  v7 = [(NTKTimelapseThemeEditOption *)self device];
  v8 = [v5 _resourceNameForTheme:v6 videoIndex:a3 forDevice:v7];

  return v8;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_154F0);
  id WeakRetained = objc_loadWeakRetained(&qword_154F8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_154F8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_154F8, v3);
    qword_15500 = (uint64_t)[v3 version];

    sub_4AC8();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_15500;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_154F0);
  id v10 = (id)qword_154E8;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _resourceNameForTheme:a3 videoIndex:-1 forDevice:a4];
}

+ (id)_resourceBaseNameForTheme:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_10338[a3];
  }
}

+ (id)_resourceNameForTheme:(unint64_t)a3 videoIndex:(int64_t)a4 forDevice:(id)a5
{
  id v6 = [a1 _resourceBaseNameForTheme:a3 forDevice:a5];
  if ((a4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"%@-%03d", v6, a4];

    id v6 = (void *)v7;
  }

  return v6;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 >= 6)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___NTKTimelapseThemeEditOption;
    id v10 = objc_msgSendSuper2(&v12, "_localizedNameForValue:forDevice:", a3, v6);
    uint64_t v8 = @"Timelapse";
  }
  else
  {
    uint64_t v7 = off_10368[a3];
    uint64_t v8 = [@"Timelapse" stringByAppendingString:@"-Companion"];
    id v9 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    id v10 = +[NTKTimelapseFaceBundle localizedStringForKey:v9 table:v8 comment:@"Location"];
  }

  return v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_15510 != -1) {
    dispatch_once(&qword_15510, &stru_10318);
  }
  v2 = (void *)qword_15508;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)optionsDescription
{
  return +[NTKTimelapseFaceBundle localizedStringForKey:@"EDIT_MODE_TIMELAPSE_CONTENT_DESCRIPTION" table:@"Timelapse-Companion" comment:@"Location"];
}

@end