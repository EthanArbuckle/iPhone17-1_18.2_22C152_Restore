@interface NTKInfinityStyleEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKInfinityStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKInfinityStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11960);
  id WeakRetained = objc_loadWeakRetained(&qword_11968);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_11968);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_11968, v3);
    qword_11970 = (uint64_t)[v3 version];

    uint64_t v10 = +[NSMutableArray arrayWithArray:&off_CF98];
    v11 = (void *)qword_11958;
    qword_11958 = v10;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_11970;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11960);
  id v12 = (id)qword_11958;

  return v12;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_C628 + a3);
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3)
  {
    id v6 = &stru_CC28;
  }
  else
  {
    id v6 = +[NTKToyStoryFaceBundle localizedStringForKey:*(&off_C648 + a3), @"ToyBox", @"Character", v4 table comment];
  }
  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_11980 != -1) {
    dispatch_once(&qword_11980, &stru_C608);
  }
  v2 = (void *)qword_11978;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end