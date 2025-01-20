@interface MAHandleSetNavigationVoiceVolume
- (id)_navVolumeSettingValue;
- (int)_actionForVolume;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleSetNavigationVoiceVolume

- (id)_navVolumeSettingValue
{
  v2 = [(MAHandleSetNavigationVoiceVolume *)self volume];
  if ([v2 isEqualToString:SALocalSearchNavigationVoiceVolumeOffValue])
  {
    CFStringRef v3 = @"Off Volume";
  }
  else if ([v2 isEqualToString:SALocalSearchNavigationVoiceVolumeLowValue])
  {
    CFStringRef v3 = @"Low Volume";
  }
  else if ([v2 isEqualToString:SALocalSearchNavigationVoiceVolumeNormalValue])
  {
    CFStringRef v3 = @"Normal Volume";
  }
  else if ([v2 isEqualToString:SALocalSearchNavigationVoiceVolumeLoudValue])
  {
    CFStringRef v3 = @"Loud Volume";
  }
  else
  {
    CFStringRef v3 = 0;
  }

  return (id)v3;
}

- (int)_actionForVolume
{
  v7[0] = SALocalSearchNavigationVoiceVolumeOffValue;
  v7[1] = SALocalSearchNavigationVoiceVolumeLowValue;
  v8[0] = &off_4A0C8;
  v8[1] = &off_4A0E0;
  v7[2] = SALocalSearchNavigationVoiceVolumeNormalValue;
  v7[3] = SALocalSearchNavigationVoiceVolumeLoudValue;
  v8[2] = &off_4A0F8;
  v8[3] = &off_4A110;
  CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v4 = [(MAHandleSetNavigationVoiceVolume *)self volume];
  v5 = [v3 objectForKeyedSubscript:v4];

  LODWORD(v4) = [v5 intValue];
  return (int)v4;
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)SACommandFailed);
  id v7 = [v6 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  v8 = +[MKMapService sharedService];
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", -[MAHandleSetNavigationVoiceVolume _actionForVolume](self, "_actionForVolume"), 802, 0);

  v9 = +[MapsSiriIPCInterface sharedInterface];
  [v9 initializeBrokerConnectionIfNeeded];
  if ([v9 canReceiveMessages]
    && ![v9 isMapsBackgroundTaskSuspended])
  {
    v10 = [(MAHandleSetNavigationVoiceVolume *)self _navVolumeSettingValue];
    if (v10)
    {
      v11 = objc_alloc_init(IPCSetNavigationVoiceVolumeMessage);
      [(IPCSetNavigationVoiceVolumeMessage *)v11 setRequestedVolume:v10];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_E508;
      v14[3] = &unk_30C68;
      id v15 = v5;
      [v9 setNavigationVoiceVolume:v11 completion:v14];
    }
    else
    {
      id v12 = objc_alloc((Class)SACommandFailed);
      v11 = (IPCSetNavigationVoiceVolumeMessage *)[v12 initWithErrorCode:SALocalSearchStateUnchangedErrorCode];
      v13 = [(IPCSetNavigationVoiceVolumeMessage *)v11 dictionary];
      (*((void (**)(id, void *))v5 + 2))(v5, v13);
    }
  }
  else
  {
    v10 = [v7 dictionary];
    (*((void (**)(id, void *))v5 + 2))(v5, v10);
  }
}

@end