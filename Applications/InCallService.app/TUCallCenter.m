@interface TUCallCenter
- (BOOL)ics_hasTooManyCallsForCallWaitingBanner;
- (BOOL)shouldActivateProviderInBackgroundForCall:(id)a3;
- (TUCall)emergencyCall;
- (int64_t)bottomBarCallState;
@end

@implementation TUCallCenter

- (BOOL)shouldActivateProviderInBackgroundForCall:(id)a3
{
  id v4 = a3;
  v5 = [v4 provider];
  if ([v5 isSuperboxProvider])
  {
    v6 = [v4 provider];
    if ([v6 isSystemProvider])
    {
      v7 = [(TUCallCenter *)self audioOrVideoCallWithStatus:4];
      BOOL v8 = v7 == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)bottomBarCallState
{
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A7D0C;
  v30[3] = &unk_1002CFC50;
  v31 = &stru_1002CFC28;
  v3 = [(TUCallCenter *)self callPassingTest:v30];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A7D6C;
  v28[3] = &unk_1002CFC50;
  v29 = &stru_1002CFC28;
  id v4 = [(TUCallCenter *)self callPassingTest:v28];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000A7DCC;
  v26[3] = &unk_1002CFC50;
  v27 = &stru_1002CFC28;
  v5 = [(TUCallCenter *)self callPassingTest:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A7E2C;
  v24[3] = &unk_1002CFC50;
  v25 = &stru_1002CFC28;
  v6 = [(TUCallCenter *)self callPassingTest:v24];
  uint64_t v7 = [(TUCallCenter *)self incomingCall];
  BOOL v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v6;
  }
  unint64_t v10 = v9;

  if (v5) {
    v11 = v5;
  }
  else {
    v11 = v4;
  }
  if (v3) {
    v11 = v3;
  }
  unint64_t v12 = v11;

  if (v10 && v12)
  {
    v13 = [(id)v10 provider];
    unsigned int v14 = [v13 isSystemProvider];

    v15 = [(id)v12 provider];
    unsigned int v16 = [v15 isSystemProvider];

    if (v14)
    {
      if (v16) {
        int64_t v17 = 2;
      }
      else {
        int64_t v17 = 4;
      }
    }
    else if (v16)
    {
      int64_t v17 = 3;
    }
    else
    {
      int64_t v17 = 1;
    }
  }
  else
  {
    if (v12 | v10)
    {
      if (v12) {
        v18 = (void *)v12;
      }
      else {
        v18 = (void *)v10;
      }
      id v19 = v18;
    }
    else
    {
      v20 = +[UIApplication sharedApplication];
      v21 = [v20 delegate];
      id v19 = [v21 mostRecentlyDisconnectedAudioCall];
    }
    v22 = [v19 provider];
    if ([v22 isSystemProvider]) {
      int64_t v17 = 2;
    }
    else {
      int64_t v17 = 1;
    }
  }
  return v17;
}

- (BOOL)ics_hasTooManyCallsForCallWaitingBanner
{
  v2 = self;
  unsigned __int8 v3 = sub_1001832B0();

  return v3 & 1;
}

- (TUCall)emergencyCall
{
  v2 = self;
  unsigned __int8 v3 = (void *)sub_1001E8A18();

  return (TUCall *)v3;
}

@end