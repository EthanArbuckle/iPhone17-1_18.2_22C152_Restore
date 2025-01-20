@interface NTKColorAnalogStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKColorAnalogStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKColorAnalogStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_157A8);
  id WeakRetained = objc_loadWeakRetained(&qword_157B0);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_157B0);
    if (v6 == v3)
    {
      id v7 = [v3 version];
      uint64_t v8 = qword_157B8;

      if (v7 == (id)v8) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_157B0, v3);
  qword_157B8 = (uint64_t)[v3 version];

  v10 = (char *)[v3 deviceCategory];
  v11 = &off_11180;
  v12 = (void *)qword_157A0;
  if (v10 == (unsigned char *)&dword_0 + 1) {
    v11 = &off_11198;
  }
  qword_157A0 = (uint64_t)v11;

LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_157A8);
  id v13 = (id)qword_157A0;

  return v13;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_10478[a3];
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKColorAnalogStyleEditOption *)self style];
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = off_10490[v2];
  }

  return +[NTKColorAnalogFaceBundle localizedStringForKey:v3 comment:@"Dial Style"];
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_157C8 != -1) {
    dispatch_once(&qword_157C8, &stru_10458);
  }
  unint64_t v2 = (void *)qword_157C0;

  return v2;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  unsigned int v4 = [a3 nrDeviceVersion];
  return (char *)[(NTKColorAnalogStyleEditOption *)self style] - 3 < (char *)0xFFFFFFFFFFFFFFFELL
      || v4 >> 8 > 0x500;
}

- (int64_t)swatchStyle
{
  unint64_t v2 = [(NTKColorAnalogStyleEditOption *)self device];
  id v3 = (char *)[v2 deviceCategory];

  if (v3 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  else {
    return 3;
  }
}

@end