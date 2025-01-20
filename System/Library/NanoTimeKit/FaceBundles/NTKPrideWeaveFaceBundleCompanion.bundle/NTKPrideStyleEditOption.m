@interface NTKPrideStyleEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
+ (int64_t)indexForStyle:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKPrideStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (int64_t)indexForStyle:(unint64_t)a3 forDevice:(id)a4
{
  v5 = [a1 _orderedValuesForDevice:a4];
  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = [v5 indexOfObject:v6];

  return (int64_t)v7;
}

- (unint64_t)style
{
  return (unint64_t)[(NTKPrideStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2C8B8);
  id WeakRetained = objc_loadWeakRetained(&qword_2C8C0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2C8C0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_2C8C0, v3);
    qword_2C8C8 = (uint64_t)[v3 version];

    sub_BFCC();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_2C8C8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2C8B8);
  id v10 = (id)qword_2C8B0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_247B8[a3];
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[NTKPrideDigitalFaceBundle localizedStringForKey:off_247D0[a3], @"PrideDigital", @"Style", v4 table comment];
  }
  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2C8D8 != -1) {
    dispatch_once(&qword_2C8D8, &stru_24798);
  }
  v2 = (void *)qword_2C8D0;

  return v2;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 nrDeviceVersion];
  unint64_t v6 = [(NTKPrideStyleEditOption *)self style];
  if (v6 == 2)
  {
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
    unsigned __int8 v7 = [v4 supportsCapability:v8];
  }
  else
  {
    unsigned __int8 v7 = v6 != 1 || v5 > 0x50200;
  }

  return v7;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end