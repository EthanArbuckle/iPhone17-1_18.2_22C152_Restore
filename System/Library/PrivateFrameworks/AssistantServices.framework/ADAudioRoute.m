@interface ADAudioRoute
- (ADAudioRoute)initWithAudioDeviceID:(unsigned int)a3;
- (BOOL)isBluetooth;
- (NSString)destination;
- (NSString)deviceName;
- (NSString)source;
- (NSString)uid;
@end

@implementation ADAudioRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)source
{
  return self->_source;
}

- (BOOL)isBluetooth
{
  return self->_isBluetooth;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (ADAudioRoute)initWithAudioDeviceID:(unsigned int)a3
{
  v23.receiver = self;
  v23.super_class = (Class)ADAudioRoute;
  v4 = [(ADAudioRoute *)&v23 init];
  if (!v4) {
    return v4;
  }
  v29 = 0;
  uint64_t v30 = (uint64_t)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10006D4C0;
  v33 = sub_10006D4D0;
  id v34 = 0;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = (uint64_t)sub_10006E3EC;
  v27 = &unk_1004FFAA8;
  v28 = &v29;
  sub_10006E46C(a3, 0x676C6F626C6D6F64, 0, &v24);
  v5 = (NSString *)*(id *)(v30 + 40);
  _Block_object_dispose(&v29, 8);

  deviceName = v4->_deviceName;
  v4->_deviceName = v5;

  v29 = 0;
  uint64_t v30 = (uint64_t)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10006D4C0;
  v33 = sub_10006D4D0;
  id v34 = 0;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  uint64_t v26 = (uint64_t)sub_10006E5B4;
  v27 = &unk_1004FFAA8;
  v28 = &v29;
  sub_10006E46C(a3, 0x676C6F6275696420, 0, &v24);
  id v7 = *(id *)(v30 + 40);
  _Block_object_dispose(&v29, 8);

  v8 = (NSString *)[v7 mutableCopy];
  uid = v4->_uid;
  v4->_uid = v8;

  v24 = 0;
  uint64_t v25 = (uint64_t)&v24;
  uint64_t v26 = 0x2020000000;
  LODWORD(v27) = 0;
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = (uint64_t)sub_10006E634;
  v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004FFAD0;
  v33 = (void (*)(uint64_t))&v24;
  sub_10006E644(a3, 0x676C6F627472616ELL, 0, &v29);
  int v10 = *(_DWORD *)(v25 + 24);
  _Block_object_dispose(&v24, 8);
  BOOL v12 = v10 == 1651275109 || v10 == 1651271009;
  v4->_isBluetooth = v12;
  if (sub_10006E77C(a3))
  {
    v24 = 0;
    uint64_t v25 = (uint64_t)&v24;
    uint64_t v26 = 0x2020000000;
    LODWORD(v27) = 0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = (uint64_t)sub_10006E84C;
    v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004FFAD0;
    v33 = (void (*)(uint64_t))&v24;
    sub_10006E644(a3, 0x696E707473737263, 0, &v29);
    int v13 = *(_DWORD *)(v25 + 24);
    _Block_object_dispose(&v24, 8);
    if (v10 <= 1651275108)
    {
      if (!v10)
      {
        v14 = 0;
        goto LABEL_25;
      }
      if (v10 == 1651274862)
      {
        CFStringRef v15 = @"MicrophoneWired";
        if (v13 != 1701669219) {
          CFStringRef v15 = 0;
        }
        if (v13 == 1768778083) {
          v14 = @"MicrophoneBuiltIn";
        }
        else {
          v14 = (__CFString *)v15;
        }
        goto LABEL_25;
      }
    }
    else
    {
      switch(v10)
      {
        case 1651275109:
          v14 = @"BluetoothHFP";
          goto LABEL_25;
        case 1818848869:
          v14 = @"LineIn";
          goto LABEL_25;
        case 1970496032:
          v14 = @"USBAudio";
LABEL_25:
          objc_storeStrong((id *)&v4->_source, v14);
          goto LABEL_26;
      }
    }
    v14 = @"ADAudioSessionPortOther";
    goto LABEL_25;
  }
LABEL_26:
  if (sub_10006D91C(a3))
  {
    v24 = 0;
    uint64_t v25 = (uint64_t)&v24;
    uint64_t v26 = 0x2020000000;
    LODWORD(v27) = 0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    uint64_t v31 = (uint64_t)sub_10006E85C;
    v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004FFAD0;
    v33 = (void (*)(uint64_t))&v24;
    sub_10006E644(a3, 0x6F75747073737263, 0, &v29);
    int v16 = *(_DWORD *)(v25 + 24);
    _Block_object_dispose(&v24, 8);
    if (v10 == 1651275109)
    {
      v24 = 0;
      uint64_t v25 = (uint64_t)&v24;
      uint64_t v26 = 0x2020000000;
      LOBYTE(v27) = 0;
      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      uint64_t v31 = (uint64_t)sub_10006E86C;
      v32 = (uint64_t (*)(uint64_t, uint64_t))&unk_1004FFA58;
      v33 = (void (*)(uint64_t))&v24;
      sub_10006D6F0(a3, 0x6F75747064636832, 0, &v29);
      int v17 = *(unsigned __int8 *)(v25 + 24);
      _Block_object_dispose(&v24, 8);
      CFStringRef v18 = @"BluetoothA2DPOutput";
      CFStringRef v19 = @"BluetoothHFP";
      BOOL v20 = v17 == 0;
LABEL_29:
      if (v20) {
        v21 = (__CFString *)v19;
      }
      else {
        v21 = (__CFString *)v18;
      }
      goto LABEL_32;
    }
    if (v10 <= 1651274861)
    {
      if (v10)
      {
        if (v10 != 1651271009)
        {
LABEL_47:
          v21 = @"ADAudioSessionPortOther";
          goto LABEL_32;
        }
        v21 = @"BluetoothLE";
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      switch(v10)
      {
        case 1970496032:
          v21 = @"USBAudio";
          break;
        case 1751412073:
          v21 = @"HDMIOutput";
          break;
        case 1651274862:
          CFStringRef v18 = @"ADAudioSessionPortOther";
          if (v16 == 1751412846) {
            CFStringRef v18 = @"Headphones";
          }
          CFStringRef v19 = @"Speaker";
          BOOL v20 = v16 == 1769173099;
          goto LABEL_29;
        default:
          goto LABEL_47;
      }
    }
LABEL_32:
    objc_storeStrong((id *)&v4->_destination, v21);
  }
  return v4;
}

@end