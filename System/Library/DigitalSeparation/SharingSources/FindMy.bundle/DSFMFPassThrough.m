@interface DSFMFPassThrough
- (DSFMFSession)sharedSession;
- (id)contactForHandle:(id)a3;
@end

@implementation DSFMFPassThrough

- (DSFMFSession)sharedSession
{
  return +[FMFSession sharedInstance];
}

- (id)contactForHandle:(id)a3
{
  id v3 = a3;
  v4 = +[FMFContactUtility sharedInstance];
  v5 = [v4 getContactForHandle:v3];

  return v5;
}

@end