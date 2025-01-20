@interface NTKMargaritaRotationEditOption
+ (id)__allOrderedValues;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithRotation:(int64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKMargaritaRotationEditOption

+ (id)optionWithRotation:(int64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"%lu", a4, a3];
}

+ (id)__allOrderedValues
{
  return &off_121E0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, a4);
  v5 = [v4 description];

  return v5;
}

- (id)localizedName
{
  if (qword_172F8 != -1) {
    dispatch_once(&qword_172F8, &stru_10480);
  }
  v3 = (void *)qword_172E8;
  v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  uint64_t v5 = qword_172F0;
  v6 = (void *)qword_172E8;
  v7 = +[NSNumber numberWithInteger:[(NTKMargaritaRotationEditOption *)self rotation]];
  v8 = [v6 stringFromNumber:v7];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v8);

  return v9;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1330;
  block[3] = &unk_104A8;
  block[4] = self;
  if (qword_17308 != -1) {
    dispatch_once(&qword_17308, block);
  }
  return (id)qword_17300;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end