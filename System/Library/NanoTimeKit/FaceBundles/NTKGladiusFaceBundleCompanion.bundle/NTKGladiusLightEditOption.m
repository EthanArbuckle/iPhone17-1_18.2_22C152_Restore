@interface NTKGladiusLightEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithLight:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)light;
@end

@implementation NTKGladiusLightEditOption

- (unint64_t)light
{
  return (unint64_t)[(NTKGladiusLightEditOption *)self _value];
}

+ (id)optionWithLight:(unint64_t)a3 forDevice:(id)a4
{
  return _[a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2A9D8);
  id WeakRetained = objc_loadWeakRetained(&qword_2A9E0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2A9E0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_2A9E0, v3);
    qword_2A9E8 = (uint64_t)[v3 version];

    v10 = (void *)qword_2A9D0;
    qword_2A9D0 = (uint64_t)&off_21658;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_2A9E8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2A9D8);
  id v11 = (id)qword_2A9D0;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_20858[a3];
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKGladiusLightEditOption *)self light];
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_20870[v2];
  }

  return +[NTKGladiusFaceBundle localizedStringForKey:v3 comment:@"light"];
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_38EC;
  block[3] = &unk_20808;
  block[4] = self;
  if (qword_2A9F8 != -1) {
    dispatch_once(&qword_2A9F8, block);
  }
  return (id)qword_2A9F0;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end