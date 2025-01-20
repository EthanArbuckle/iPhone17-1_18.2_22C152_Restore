@interface NTKProteusBackgroundEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKProteusBackgroundEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_10C20;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"off";
  if (a3) {
    CFStringRef v4 = 0;
  }
  if (a3 == 1) {
    return @"on";
  }
  else {
    return (id)v4;
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_164D8 != -1) {
    dispatch_once(&qword_164D8, &stru_103C0);
  }
  v2 = (void *)qword_164D0;

  return v2;
}

@end