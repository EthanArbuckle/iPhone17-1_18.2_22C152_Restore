@interface IDSXPCEventReportingInterface
+ (id)interface;
@end

@implementation IDSXPCEventReportingInterface

+ (id)interface
{
  if (qword_1EB2BD598 != -1) {
    dispatch_once(&qword_1EB2BD598, &unk_1EE2468A8);
  }
  v2 = (void *)qword_1EB2BD630;

  return v2;
}

@end