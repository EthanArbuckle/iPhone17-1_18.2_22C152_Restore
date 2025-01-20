@interface CVAPreferenceManager
+ (id)defaults;
@end

@implementation CVAPreferenceManager

+ (id)defaults
{
  if (qword_1E9F76568 != -1) {
    dispatch_once(&qword_1E9F76568, &unk_1F142F268);
  }
  v2 = (void *)qword_1E9F76570;

  return v2;
}

@end