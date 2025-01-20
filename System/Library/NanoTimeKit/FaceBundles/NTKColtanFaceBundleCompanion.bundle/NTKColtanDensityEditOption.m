@interface NTKColtanDensityEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithDensity:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)density;
@end

@implementation NTKColtanDensityEditOption

- (unint64_t)density
{
  return (unint64_t)[(NTKColtanDensityEditOption *)self _value];
}

+ (id)optionWithDensity:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16E30);
  id WeakRetained = objc_loadWeakRetained(&qword_16E38);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_16E38);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_16E38, v3);
    qword_16E40 = (uint64_t)[v3 version];

    sub_6AB0();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_16E40;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16E30);
  id v10 = (id)qword_16E28;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"detailed";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"simple";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16E50 != -1) {
    dispatch_once(&qword_16E50, &stru_10420);
  }
  v2 = (void *)qword_16E48;

  return v2;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKColtanDensityEditOption *)self density];
  CFStringRef v3 = @"EDIT_OPTION_LABEL_DENSITY_DETAILED";
  if (v2 != 1) {
    CFStringRef v3 = 0;
  }
  if (v2) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = @"EDIT_OPTION_LABEL_DENSITY_SIMPLE";
  }

  return +[NTKColtanFaceBundle localizedStringForKey:v4 comment:@"density"];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end