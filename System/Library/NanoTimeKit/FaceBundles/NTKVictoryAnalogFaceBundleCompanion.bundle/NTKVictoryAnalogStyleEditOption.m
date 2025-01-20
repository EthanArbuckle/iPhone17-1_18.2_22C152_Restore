@interface NTKVictoryAnalogStyleEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_stylesInGlory;
+ (id)_stylesInGrace;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKVictoryAnalogStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKVictoryAnalogStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  if ([a3 isRunningGraceOrLater]) {
    [a1 _stylesInGrace];
  }
  else {
  v4 = [a1 _stylesInGlory];
  }

  return v4;
}

+ (id)_stylesInGrace
{
  if (qword_12B20 != -1) {
    dispatch_once(&qword_12B20, &stru_C3E0);
  }
  v2 = (void *)qword_12B18;

  return v2;
}

+ (id)_stylesInGlory
{
  if (qword_12B30 != -1) {
    dispatch_once(&qword_12B30, &stru_C400);
  }
  v2 = (void *)qword_12B28;

  return v2;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"style%d", a4, (a3 + 1)];
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3 + 1, a4);
  v5 = +[NSString localizedStringWithFormat:@"%@", v4];

  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_12B40 != -1) {
    dispatch_once(&qword_12B40, &stru_C420);
  }
  v2 = (void *)qword_12B38;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end