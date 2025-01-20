@interface NTKSalmonColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)curatedColorValuesForDevice:(id)a3;
+ (id)domain;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (id)localizedName;
- (id)pigmentEditOption;
- (unint64_t)color;
@end

@implementation NTKSalmonColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKSalmonColorEditOption *)self _value];
}

+ (id)curatedColorValuesForDevice:(id)a3
{
  return (id)_EnumValueRange();
}

- (id)localizedName
{
  v2 = [(NTKSalmonColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47998);
  id WeakRetained = objc_loadWeakRetained(&qword_479A0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_479A0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_479A0, v4);
    qword_479A8 = (uint64_t)[v4 version];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6520;
    v13[3] = &unk_389C8;
    v13[4] = a1;
    sub_6520((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_479A8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47998);
  id v11 = (id)qword_47990;

  return v11;
}

- (id)pigmentEditOption
{
  switch([(NTKSalmonColorEditOption *)self color])
  {
    case 0xBB8uLL:
      uint64_t v3 = 3000;
      goto LABEL_5;
    case 0xBB9uLL:
      uint64_t v3 = 3012;
LABEL_5:
      v5 = +[NTKCaliforniaColorEditOption colorNameForColor:v3];
      uint64_t v6 = 3014;
      goto LABEL_14;
    case 0xBBAuLL:
      v5 = +[NTKCaliforniaColorEditOption colorNameForColor:3012];
      uint64_t v6 = 3000;
      goto LABEL_14;
    case 0xBBBuLL:
      v5 = +[NTKCaliforniaColorEditOption colorNameForColor:3012];
      uint64_t v6 = 3003;
      goto LABEL_14;
    case 0xBBCuLL:
      uint64_t v7 = 3001;
      goto LABEL_13;
    case 0xBBDuLL:
      uint64_t v7 = 3002;
      goto LABEL_13;
    case 0xBBEuLL:
      uint64_t v7 = 3004;
      goto LABEL_13;
    case 0xBBFuLL:
      uint64_t v7 = 3010;
      goto LABEL_13;
    case 0xBC0uLL:
      uint64_t v7 = 3011;
LABEL_13:
      v5 = +[NTKCaliforniaColorEditOption colorNameForColor:v7];
      uint64_t v6 = 3013;
LABEL_14:
      id v4 = +[NTKCaliforniaColorEditOption colorNameForColor:v6];
      id v8 = NTKNameForDuotones();
      if (!v8) {
        goto LABEL_16;
      }
      id v9 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v8 collectionName:@"gmt-evergreen"];

      break;
    default:
      id v4 = 0;
      v5 = 0;
LABEL_16:
      v11.receiver = self;
      v11.super_class = (Class)NTKSalmonColorEditOption;
      id v9 = [(NTKSalmonColorEditOption *)&v11 pigmentEditOption];
      break;
  }

  return v9;
}

+ (id)domain
{
  return NTKColorPaletteDomainGMT;
}

@end