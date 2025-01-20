@interface IDSXPCFeatureTogglerInterface
+ (id)interface;
@end

@implementation IDSXPCFeatureTogglerInterface

+ (id)interface
{
  if (qword_1EB2BD5A8 != -1) {
    dispatch_once(&qword_1EB2BD5A8, &unk_1EE2468E8);
  }
  v2 = (void *)qword_1EB2BD640;

  return v2;
}

@end