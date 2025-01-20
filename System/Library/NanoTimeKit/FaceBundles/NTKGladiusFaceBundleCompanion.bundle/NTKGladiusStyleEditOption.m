@interface NTKGladiusStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKGladiusStyleEditOption

- (unint64_t)style
{
  return (unint64_t)[(NTKGladiusStyleEditOption *)self _value];
}

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return _[a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2A9A8);
  id WeakRetained = objc_loadWeakRetained(&qword_2A9B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2A9B0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_2A9B0, v3);
    qword_2A9B8 = (uint64_t)[v3 version];

    sub_3400();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_2A9B8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2A9A8);
  id v10 = (id)qword_2A9A0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_20828[a3];
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKGladiusStyleEditOption *)self style];
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_20840[v2];
  }

  return +[NTKGladiusFaceBundle localizedStringForKey:v3 comment:@"style"];
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3548;
  block[3] = &unk_20808;
  block[4] = self;
  if (qword_2A9C8 != -1) {
    dispatch_once(&qword_2A9C8, block);
  }
  return (id)qword_2A9C0;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end