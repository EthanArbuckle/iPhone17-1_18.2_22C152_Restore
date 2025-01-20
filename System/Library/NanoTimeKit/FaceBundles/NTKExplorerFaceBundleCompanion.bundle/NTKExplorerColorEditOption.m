@interface NTKExplorerColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKExplorerColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKExplorerColorEditOption *)self _value];
}

- (id)localizedName
{
  v2 = [(NTKExplorerColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16448);
  id WeakRetained = objc_loadWeakRetained(&qword_16450);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_16450);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_16450, v3);
    qword_16458 = (uint64_t)[v3 version];

    sub_629C();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_16458;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16448);
  id v10 = (id)qword_16440;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_10440[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16468 != -1) {
    dispatch_once(&qword_16468, &stru_10420);
  }
  v2 = (void *)qword_16460;

  return v2;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainExplorer;
}

- (id)pigmentEditOption
{
  if ([(NTKExplorerColorEditOption *)self color] > 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = NTKNameForDuotones();
  }
  id v3 = [(id)objc_opt_class() pigmentFaceDomain];
  id v4 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v2 collectionName:v3];

  return v4;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end