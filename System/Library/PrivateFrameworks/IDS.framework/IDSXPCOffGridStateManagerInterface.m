@interface IDSXPCOffGridStateManagerInterface
+ (id)interface;
@end

@implementation IDSXPCOffGridStateManagerInterface

+ (id)interface
{
  if (qword_1EB2BD578 != -1) {
    dispatch_once(&qword_1EB2BD578, &unk_1EE2465C8);
  }
  v2 = (void *)qword_1EB2BD610;

  return v2;
}

@end