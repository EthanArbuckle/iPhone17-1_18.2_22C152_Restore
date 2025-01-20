@interface IDSXPCOpportunisticInterface
+ (id)interface;
@end

@implementation IDSXPCOpportunisticInterface

+ (id)interface
{
  if (qword_1EB2BD590 != -1) {
    dispatch_once(&qword_1EB2BD590, &unk_1EE246848);
  }
  v2 = (void *)qword_1EB2BD628;

  return v2;
}

@end