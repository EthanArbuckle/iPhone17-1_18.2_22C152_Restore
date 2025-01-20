@interface NTKSmokeColorEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKSmokeColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKSmokeColorEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CB10);
  id WeakRetained = objc_loadWeakRetained(&qword_CB18);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_CB18);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_CB18, v3);
    qword_CB20 = (uint64_t)[v3 version];

    v10 = (void *)qword_CB08;
    qword_CB08 = (uint64_t)&off_8C48;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_CB20;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CB10);
  id v11 = (id)qword_CB08;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_8248 + a3);
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 >= 4)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___NTKSmokeColorEditOption;
    v10 = objc_msgSendSuper2(&v12, "_localizedNameForValue:forDevice:", a3, v6);
    uint64_t v8 = @"Vapor";
  }
  else
  {
    id v7 = *(&off_8268 + a3);
    uint64_t v8 = [@"Vapor" stringByAppendingString:@"-Companion"];
    id v9 = [v7 stringByAppendingString:@"_COMPANION"];
    v10 = +[NTKVaporFaceBundle localizedStringForKey:v9 table:v8 comment:@"Color"];
  }

  return v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_CB30 != -1) {
    dispatch_once(&qword_CB30, &stru_8228);
  }
  v2 = (void *)qword_CB28;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end