@interface NTKVictoryDigitalStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKVictoryDigitalStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKVictoryDigitalStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_173F8);
  id WeakRetained = objc_loadWeakRetained(&qword_17400);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_17400);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_17400, v3);
    qword_17408 = (uint64_t)[v3 version];

    sub_6D98();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_17408;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_173F8);
  id v10 = (id)qword_173F0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"style%d", a4, (a3 + 1)];
}

- (id)localizedName
{
  unint64_t v2 = [(NTKVictoryDigitalStyleEditOption *)self style];
  if (v2 - 3 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_104C0[v2 - 3];
  }

  return +[NTKVictoryDigitalFaceBundle localizedStringForKey:v3 comment:@"style"];
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_17418 != -1) {
    dispatch_once(&qword_17418, &stru_104A0);
  }
  unint64_t v2 = (void *)qword_17410;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end