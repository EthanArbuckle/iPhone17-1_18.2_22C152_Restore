@interface OSLogHandleManager
+ (id)sharedInstance;
@end

@implementation OSLogHandleManager

+ (id)sharedInstance
{
  if (qword_1EB273D10 != -1) {
    dispatch_once(&qword_1EB273D10, &unk_1EE22FE78);
  }
  v2 = (void *)qword_1EB273C70;
  return v2;
}

@end