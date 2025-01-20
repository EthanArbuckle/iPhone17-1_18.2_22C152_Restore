@interface NTKMargaritaStripeCountEditOption
+ (id)__allOrderedValues;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithCount:(unint64_t)a3 forDevice:(id)a4;
+ (unint64_t)_maxStripeCount;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)count;
@end

@implementation NTKMargaritaStripeCountEditOption

+ (id)optionWithCount:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString localizedStringWithFormat:@"%lu", a4, a3];
}

- (unint64_t)count
{
  id v3 = [(id)objc_opt_class() _maxStripeCount];
  unint64_t result = (unint64_t)[(NTKMargaritaStripeCountEditOption *)self _value];
  if (result >= (unint64_t)v3) {
    return (unint64_t)v3;
  }
  return result;
}

+ (id)__allOrderedValues
{
  [a1 _maxStripeCount];
  v2 = _EnumValueRange();
  id v3 = [v2 reverseObjectEnumerator];
  v4 = [v3 allObjects];

  return v4;
}

+ (unint64_t)_maxStripeCount
{
  return +[NTKMargaritaFace totalStripeCount];
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  return [a1 _orderedValuesForDevice:a3];
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, a4);
  v5 = [v4 description];

  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8BD4;
  block[3] = &unk_104A8;
  block[4] = self;
  if (qword_17390 != -1) {
    dispatch_once(&qword_17390, block);
  }
  return (id)qword_17388;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end