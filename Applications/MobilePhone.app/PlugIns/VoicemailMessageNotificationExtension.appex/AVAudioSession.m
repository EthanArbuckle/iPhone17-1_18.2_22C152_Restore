@interface AVAudioSession
- (BOOL)activateVoicemailAudioSession;
- (BOOL)deactivateVoicemailAudioSession;
- (BOOL)isCategoryVoicemail;
@end

@implementation AVAudioSession

- (BOOL)isCategoryVoicemail
{
  v2 = [(AVAudioSession *)self category];
  unsigned __int8 v3 = [v2 isEqualToString:AVAudioSessionCategoryVoiceMail];

  return v3;
}

- (BOOL)activateVoicemailAudioSession
{
  unsigned __int8 v3 = vm_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = (id)objc_opt_class();
    id v4 = v16;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ is activating an audio session.", buf, 0xCu);
  }
  if (![(AVAudioSession *)self isCategoryVoicemail])
  {
    uint64_t v5 = AVAudioSessionCategoryVoiceMail;
    id v14 = 0;
    unsigned __int8 v6 = [(AVAudioSession *)self setCategory:AVAudioSessionCategoryVoiceMail error:&v14];
    id v7 = v14;
    if ((v6 & 1) == 0)
    {
      v8 = vm_ui_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100040F20(v5, (uint64_t)v7, v8);
      }
    }
  }
  if (![(AVAudioSession *)self isCategoryVoicemail]) {
    return 0;
  }
  id v13 = 0;
  BOOL v9 = [(AVAudioSession *)self setActive:1 error:&v13];
  id v10 = v13;
  if (!v9)
  {
    v11 = vm_ui_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100040EA8((uint64_t)v10, v11);
    }
  }
  return v9;
}

- (BOOL)deactivateVoicemailAudioSession
{
  unsigned __int8 v3 = vm_ui_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = (id)objc_opt_class();
    id v4 = v17;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ is dectivating an audio session.", buf, 0xCu);
  }
  id v15 = 0;
  BOOL v5 = 1;
  unsigned __int8 v6 = [(AVAudioSession *)self setActive:0 withOptions:1 error:&v15];
  id v7 = v15;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    id v9 = [v7 code];
    id v10 = vm_ui_log();
    v11 = v10;
    BOOL v5 = v9 == (id)560030580;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 code];
        *(_DWORD *)buf = 134217984;
        id v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Audio session deactivation was unsucessful, but error code was %ld so treating as success", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100040FA8((uint64_t)v8, v11);
    }
  }
  return v5;
}

@end