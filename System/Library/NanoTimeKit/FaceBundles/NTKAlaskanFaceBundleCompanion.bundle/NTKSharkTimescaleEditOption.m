@interface NTKSharkTimescaleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTimescale:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)timescale;
@end

@implementation NTKSharkTimescaleEditOption

+ (id)optionWithTimescale:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)timescale
{
  return (unint64_t)[(NTKSharkTimescaleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47958);
  id WeakRetained = objc_loadWeakRetained(&qword_47960);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_47960);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_47960, v3);
    qword_47968 = (uint64_t)[v3 version];

    sub_5DE4();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_47968;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47958);
  id v10 = (id)qword_47950;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return *(&off_38958 + a3 - 1);
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKSharkTimescaleEditOption *)self timescale];
  if (v2 - 1 > 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_38980 + v2 - 1);
  }

  return +[NTKAlaskanFaceBundle localizedStringForKey:v3 comment:&stru_39558];
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_47978 != -1) {
    dispatch_once(&qword_47978, &stru_38938);
  }
  unint64_t v2 = (void *)qword_47970;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end