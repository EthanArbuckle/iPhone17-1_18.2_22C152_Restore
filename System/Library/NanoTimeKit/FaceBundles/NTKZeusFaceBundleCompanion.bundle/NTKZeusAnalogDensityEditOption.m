@interface NTKZeusAnalogDensityEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
- (int64_t)swatchStyle;
@end

@implementation NTKZeusAnalogDensityEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C9C8);
  id WeakRetained = objc_loadWeakRetained(&qword_4C9D0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_4C9D0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_4C9D0, v3);
    qword_4C9D8 = (uint64_t)[v3 version];

    v10 = (void *)qword_4C9C0;
    qword_4C9C0 = (uint64_t)&off_3F9D8;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_4C9D8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C9C8);
  id v11 = (id)qword_4C9C0;

  return v11;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 - 1 > 2) {
    v4 = 0;
  }
  else {
    v4 = off_3CAC0[a3 - 1];
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION", a4];
  if (v5)
  {
    id v6 = +[NTKZeusAnalogFaceBundle localizedStringForKey:v5 comment:&stru_3D3C0];
  }
  else
  {
    id v6 = &stru_3D3C0;
  }

  return v6;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end