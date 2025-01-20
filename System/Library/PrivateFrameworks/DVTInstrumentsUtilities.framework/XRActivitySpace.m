@interface XRActivitySpace
+ (id)sharedInstance;
- (id)spaceName;
@end

@implementation XRActivitySpace

+ (id)sharedInstance
{
  if (qword_2687AA2F0 != -1) {
    dispatch_once(&qword_2687AA2F0, &unk_26E752610);
  }
  v2 = (void *)qword_2687AA2F8;

  return v2;
}

- (id)spaceName
{
  return @"Background Activity Space";
}

@end