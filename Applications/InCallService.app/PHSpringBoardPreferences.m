@interface PHSpringBoardPreferences
+ (id)sharedPreferences;
- (BOOL)isProximitySensorAvailable;
- (id)domain;
@end

@implementation PHSpringBoardPreferences

+ (id)sharedPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7D5C;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_100326330 != -1) {
    dispatch_once(&qword_100326330, block);
  }
  v2 = (void *)qword_100326328;

  return v2;
}

- (id)domain
{
  return @"com.apple.springboard";
}

- (BOOL)isProximitySensorAvailable
{
  return ![(PHPreferences *)self BOOLForKey:@"SBDisableProximity" defaultValue:0];
}

@end