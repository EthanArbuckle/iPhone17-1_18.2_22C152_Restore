@interface NTKZeusAnalogStyleEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKZeusAnalogStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (BOOL)optionExistsInDevice:(id)a3
{
  if ([a3 nrDeviceVersion] >> 18) {
    return 1;
  }
  v4 = [(NTKZeusAnalogStyleEditOption *)self device];
  v5 = NTKNewToFortuneZeusAnalogStyles(v4);
  unsigned __int8 v6 = objc_msgSend(v5, "containsIndex:", -[NTKZeusAnalogStyleEditOption _value](self, "_value"));

  return v6 ^ 1;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C978);
  id WeakRetained = objc_loadWeakRetained(&qword_4C980);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_4C980);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_4C980, v3);
    qword_4C988 = (uint64_t)[v3 version];

    v10 = (void *)qword_4C970;
    qword_4C970 = (uint64_t)&off_3F9C0;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_4C988;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C978);
  id v11 = (id)qword_4C970;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_3CA80[a3];
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    v4 = 0;
  }
  else {
    v4 = off_3CAA0[a3];
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

- (id)_valueToFaceBundleStringDict
{
  if (qword_4C998 != -1) {
    dispatch_once(&qword_4C998, &stru_3CA60);
  }
  v2 = (void *)qword_4C990;

  return v2;
}

- (int64_t)swatchStyle
{
  return 2;
}

@end