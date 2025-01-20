@interface NTKBreatheVideoStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKBreatheVideoStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKBreatheVideoStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CB40);
  id WeakRetained = objc_loadWeakRetained(&qword_CB48);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_CB48);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_CB48, v3);
    qword_CB50 = (uint64_t)[v3 version];

    sub_3ED0(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_CB50;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CB40);
  id v11 = (id)qword_CB38;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_8288 + a3);
  }
}

+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 > 3)
  {
    id v11 = 0;
  }
  else
  {
    id v6 = *(&off_82A8 + a3);
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v8 = [v5 supportsCapability:v7];

    if (v8)
    {
      id v6 = [v6 stringByAppendingString:@"_2021"];
    }
    id v9 = [@"Breathe" stringByAppendingString:@"-Companion"];
    uint64_t v10 = [v6 stringByAppendingString:@"_COMPANION"];

    id v11 = +[NTKBreatheFaceBundle localizedStringForKey:v10 table:v9 comment:@"Breathe Style"];
  }

  return v11;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4130;
  block[3] = &unk_8268;
  block[4] = self;
  if (qword_CB60 != -1) {
    dispatch_once(&qword_CB60, block);
  }
  return (id)qword_CB58;
}

- (int64_t)swatchStyle
{
  return 1;
}

@end