@interface NTKUltraCubeContentEditOption
+ (NTKUltraCubeContentEditOption)optionWithUltraCubeContent:(unint64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (unint64_t)ultracubeContent;
@end

@implementation NTKUltraCubeContentEditOption

+ (NTKUltraCubeContentEditOption)optionWithUltraCubeContent:(unint64_t)a3 forDevice:(id)a4
{
  return (NTKUltraCubeContentEditOption *)[a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)ultracubeContent
{
  return (unint64_t)[(NTKUltraCubeContentEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_58E80);
  id WeakRetained = objc_loadWeakRetained(&qword_58E88);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_58E88);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_58E88, v3);
    qword_58E90 = (uint64_t)[v3 version];

    v10 = (void *)qword_58E78;
    qword_58E78 = (uint64_t)&off_4B638;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_58E90;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_58E80);
  id v11 = (id)qword_58E78;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3) {
    return 0;
  }
  else {
    return @"custom";
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3)
  {
    id v6 = &stru_49630;
  }
  else
  {
    id v6 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"EDIT_OPTION_LABEL_CONTENT_CUSTOM_COMPANION", @"Photos", v4 comment];
  }
  return v6;
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"EDIT_OPTION_LABEL_CONTENT_CUSTOM_ACTION_COMPANION", @"Choose Photos…", v4 comment];
  }
  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_58EA0 != -1) {
    dispatch_once(&qword_58EA0, &stru_49100);
  }
  v2 = (void *)qword_58E98;

  return v2;
}

@end