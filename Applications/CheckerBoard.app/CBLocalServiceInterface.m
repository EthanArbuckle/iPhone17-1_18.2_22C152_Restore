@interface CBLocalServiceInterface
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation CBLocalServiceInterface

+ (id)clientInterface
{
  if (qword_10008FE18 != -1) {
    dispatch_once(&qword_10008FE18, &stru_100079E18);
  }
  v2 = (void *)qword_10008FE20;

  return v2;
}

+ (id)serverInterface
{
  if (qword_10008FE28 != -1) {
    dispatch_once(&qword_10008FE28, &stru_100079E38);
  }
  v2 = (void *)qword_10008FE30;

  return v2;
}

@end