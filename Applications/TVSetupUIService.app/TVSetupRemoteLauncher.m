@interface TVSetupRemoteLauncher
+ (void)launchRemoteWithDeviceIdentifier:(id)a3;
@end

@implementation TVSetupRemoteLauncher

+ (void)launchRemoteWithDeviceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v4 = (void *)qword_10001E810;
  uint64_t v18 = qword_10001E810;
  if (!qword_10001E810)
  {
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100002EAC;
    v13 = &unk_100018758;
    v14 = &v15;
    sub_100002EAC((uint64_t)&v10);
    v4 = (void *)v16[3];
  }
  v5 = v4;
  _Block_object_dispose(&v15, 8);
  id v6 = [[v5 alloc] initWithDeviceIdentifier:v3 identifierType:0 deviceType:1 launchContext:11 launchMethod:1];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)qword_10001E820;
  uint64_t v18 = qword_10001E820;
  if (!qword_10001E820)
  {
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100003074;
    v13 = &unk_100018758;
    v14 = &v15;
    sub_100003074((uint64_t)&v10);
    v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  v9 = [v8 sharedInstance];
  [v9 presentWithContext:v6];
}

@end