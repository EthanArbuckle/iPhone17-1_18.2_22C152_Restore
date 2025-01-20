@interface NTKMetallicColorEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKMetallicColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKMetallicColorEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CAE8);
  id WeakRetained = objc_loadWeakRetained(&qword_CAF0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_CAF0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_CAF0, v3);
    qword_CAF8 = (uint64_t)[v3 version];

    v10 = (void *)qword_CAE0;
    qword_CAE0 = (uint64_t)&off_8B20;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_CAF8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CAE8);
  id v11 = (id)qword_CAE0;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_8250 + a3);
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 >= 4)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___NTKMetallicColorEditOption;
    v10 = objc_msgSendSuper2(&v12, "_localizedNameForValue:forDevice:", a3, v6);
    uint64_t v8 = @"LiquidMetal";
  }
  else
  {
    id v7 = *(&off_8270 + a3);
    uint64_t v8 = [@"LiquidMetal" stringByAppendingString:@"-Companion"];
    id v9 = [v7 stringByAppendingString:@"_COMPANION"];
    v10 = +[NTKLiquidMetalFaceBundle localizedStringForKey:v9 table:v8 comment:@"Color"];
  }

  return v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_CB08 != -1) {
    dispatch_once(&qword_CB08, &stru_8230);
  }
  v2 = (void *)qword_CB00;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end