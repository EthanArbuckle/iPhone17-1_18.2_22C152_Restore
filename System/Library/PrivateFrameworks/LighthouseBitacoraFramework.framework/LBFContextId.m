@interface LBFContextId
+ (id)getContextId;
@end

@implementation LBFContextId

+ (id)getContextId
{
  if (qword_26B269D78 != -1) {
    dispatch_once(&qword_26B269D78, &unk_2703DD258);
  }
  v2 = (void *)qword_26B269D70;
  return v2;
}

@end