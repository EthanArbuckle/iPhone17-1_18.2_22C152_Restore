@interface ACAccountStore
+ (id)ch_sharedAccountStore;
@end

@implementation ACAccountStore

+ (id)ch_sharedAccountStore
{
  if (qword_100053E40 != -1) {
    dispatch_once(&qword_100053E40, &stru_1000494B8);
  }
  v2 = (void *)qword_100053E38;
  return v2;
}

@end