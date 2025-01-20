@interface AccessoryPresenceController
- (AccessoryPresenceInputs)inputs;
- (BOOL)isDeviceDocked;
- (BOOL)isHeadsetPluggedIn;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation AccessoryPresenceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  v26[0] = @"USB";
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100002BEC;
  v21[3] = &unk_100004150;
  v21[4] = self;
  v3 = objc_retainBlock(v21);
  v27[0] = v3;
  v26[1] = @"MiniJack";
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100002BF4;
  v20[3] = &unk_100004150;
  v20[4] = self;
  v4 = objc_retainBlock(v20);
  v27[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  v6 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(AccessoryPresenceController *)self inputs];
    v8 = [v7 identifier];
    v9 = [(AccessoryPresenceController *)self inputs];
    id v10 = [v9 timeout];
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    __int16 v24 = 2048;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Check accessory %@ with time out of %lu seconds", buf, 0x16u);
  }
  if ([(AccessoryPresenceController *)self isCancelled])
  {
    v11 = &off_100004288;
  }
  else
  {
    v12 = [(AccessoryPresenceController *)self inputs];
    v13 = [v12 identifier];
    v14 = [v5 objectForKeyedSubscript:v13];

    if (v14)
    {
      unint64_t v15 = 0;
      v11 = &off_100004288;
      do
      {
        if ([(AccessoryPresenceController *)self isCancelled]) {
          break;
        }
        if (v14[2](v14)) {
          v11 = &off_1000042A0;
        }
        if ([v11 isEqualToNumber:&off_100004288])
        {
          +[NSThread sleepForTimeInterval:1.0];
          ++v15;
        }
        if (![v11 isEqualToNumber:&off_100004288]) {
          break;
        }
        v16 = [(AccessoryPresenceController *)self inputs];
        id v17 = [v16 timeout];
      }
      while (v15 < (unint64_t)v17);
    }
    else
    {
      v18 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100003008(self, v18);
      }

      v11 = &off_1000042B8;
    }
  }
  if (([(AccessoryPresenceController *)self isCancelled] & 1) == 0)
  {
    v19 = [(AccessoryPresenceController *)self result];
    [v19 setStatusCode:v11];
  }
  [(AccessoryPresenceController *)self setFinished:1];
}

- (BOOL)isHeadsetPluggedIn
{
  v2 = +[AVAudioSession sharedInstance];
  v3 = [v2 currentRoute];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v15 = v3;
  v4 = [v3 outputs];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_1000030B8(v20, v10, &v21, v11);
        }

        v12 = [v10 portType];
        if ([v12 isEqualToString:AVAudioSessionPortHeadphones])
        {
          int v7 = 1;
        }
        else
        {
          v13 = [v10 portType];
          v7 |= [v13 isEqualToString:AVAudioSessionPortLineOut];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)isDeviceDocked
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = +[EAAccessoryManager sharedAccessoryManager];
  v4 = [v3 connectedAccessories];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v11 = [(AccessoryPresenceController *)self inputs];
        v12 = [v11 modelNumbers];
        v13 = [v10 modelNumber];
        unsigned int v14 = [v12 containsObject:v13];

        if (v14)
        {
          CFStringRef v25 = @"dockModel";
          unint64_t v15 = [v10 modelNumber];
          long long v16 = stringOrNull(v15);
          v26 = v16;
          char v7 = 1;
          long long v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          long long v18 = [(AccessoryPresenceController *)self result];
          [v18 setData:v17];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (AccessoryPresenceInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end