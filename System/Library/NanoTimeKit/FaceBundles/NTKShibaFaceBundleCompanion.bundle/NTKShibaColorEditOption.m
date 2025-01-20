@interface NTKShibaColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKShibaColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKShibaColorEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_114A0);
  id WeakRetained = objc_loadWeakRetained(&qword_114A8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_114A8);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_114A8, v3);
    qword_114B0 = (uint64_t)[v3 version];

    v10 = (void *)qword_11498;
    qword_11498 = (uint64_t)&off_CA90;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_114B0;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_114A0);
  id v11 = (id)qword_11498;

  return v11;
}

- (id)localizedName
{
  v2 = [(NTKShibaColorEditOption *)self pigmentEditOption];
  id v3 = [v2 localizedName];

  return v3;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"color-%lu", a4, a3];
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_52D4;
  block[3] = &unk_C2E0;
  block[4] = self;
  if (qword_114C0 != -1) {
    dispatch_once(&qword_114C0, block);
  }
  return (id)qword_114B8;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  if ((char *)[(NTKShibaColorEditOption *)self color] == "Frameworks/UIKit.framework/UIKit")
  {
    id v3 = +[NTKPigmentEditOption pigmentNamed:ntk_special_multicolor];
  }
  else
  {
    uint64_t v4 = NTKColorPaletteDomainVictoryHybrid;
    v5 = +[NTKOlympusColorEditOption colorNameForColorValue:[(NTKShibaColorEditOption *)self color]];
    id v3 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v5 collectionName:v4];
  }

  return v3;
}

@end