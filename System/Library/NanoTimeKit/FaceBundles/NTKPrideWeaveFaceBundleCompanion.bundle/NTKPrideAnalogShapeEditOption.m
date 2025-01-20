@interface NTKPrideAnalogShapeEditOption
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

@implementation NTKPrideAnalogShapeEditOption

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
  return (unint64_t)[(NTKPrideAnalogShapeEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2C938);
  id WeakRetained = objc_loadWeakRetained(&qword_2C940);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2C940);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_2C940, v3);
    qword_2C948 = (uint64_t)[v3 version];

    sub_132F4(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_2C948;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2C938);
  id v11 = (id)qword_2C930;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"fullscreen";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"dial";
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (!a3)
  {
    CFStringRef v6 = @"EDIT_OPTION_LABEL_PRIDE_ANALOG_STYLE_DIAL";
LABEL_5:
    id v7 = +[NTKPrideAnalogFaceBundle localizedStringForKey:v6, @"PrideAnalog", @"Style", v4 table comment];
    return v7;
  }
  if (a3 == 1)
  {
    CFStringRef v6 = @"EDIT_OPTION_LABEL_PRIDE_ANALOG_STYLE_FULLSCREEN";
    goto LABEL_5;
  }
  id v7 = 0;
  return v7;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2C958 != -1) {
    dispatch_once(&qword_2C958, &stru_24A90);
  }
  v2 = (void *)qword_2C950;

  return v2;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  return [a3 nrDeviceVersion] > 0x50200;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end