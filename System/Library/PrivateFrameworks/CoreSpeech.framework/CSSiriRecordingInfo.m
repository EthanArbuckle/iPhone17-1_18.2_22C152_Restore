@interface CSSiriRecordingInfo
- (AFBluetoothDevice)bluetoothDevice;
- (BOOL)codecIsNarrowband;
- (BOOL)isBluetooth;
- (BOOL)isDictation;
- (BOOL)isDucking;
- (BOOL)isEndAlertInfo;
- (BOOL)isFingerprintOnly;
- (BOOL)isSecureOfflineOnly;
- (BOOL)triggeredTwoShotBorealis;
- (CSFAudioRecordDeviceInfo)deviceInfo;
- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 codec:(id)a4;
- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 fingerprintOnly:(BOOL)a4 secureOfflineOnly:(BOOL)a5 audioAlertStyle:(int64_t)a6 recordSettings:(id)a7 recordRoute:(id)a8 recordDeviceInfo:(id)a9 playbackRoute:(id)a10 audioDeviceID:(unsigned int)a11 audioSessionID:(unsigned int)a12 voiceTriggerEventInfo:(id)a13 activationAlertStartTimestamp:(double)a14 startRecordingTimestamp:(double)a15 firstBufferTimestamp:(double)a16 firstBufferHostTime:(unint64_t)a17 estimatedSpeechEndHostTime:(unint64_t)a18 deviceIdentifier:(id)a19 includeBTInfo:(BOOL)a20 speechEvent:(int64_t)a21;
- (NSDictionary)voiceTriggerEventInfo;
- (NSString)codec;
- (NSString)destination;
- (NSString)deviceIdentifier;
- (NSString)dspStatus;
- (NSString)headsetAddress;
- (NSString)headsetName;
- (NSString)modelName;
- (NSString)productId;
- (NSString)route;
- (NSString)source;
- (NSString)vendorId;
- (double)activationAlertStartTimestamp;
- (double)firstBufferTimestamp;
- (double)startRecordingTimestamp;
- (id)_bluetoothDeviceInfo;
- (int)mhSource;
- (int64_t)audioAlertStyle;
- (int64_t)speechEvent;
- (unint64_t)audioSessionSetActiveEndHostTime;
- (unint64_t)estimatedSpeechEndHostTime;
- (unint64_t)firstBufferHostTime;
- (unsigned)audioSessionID;
- (void)_fetchBTInfo;
- (void)setAudioSessionSetActiveEndHostTime:(unint64_t)a3;
- (void)setIsEndAlertInfo:(BOOL)a3;
- (void)setTriggeredTwoShotBorealis:(BOOL)a3;
@end

@implementation CSSiriRecordingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_headsetName, 0);
  objc_storeStrong((id *)&self->_dspStatus, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_headsetAddress, 0);
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (AFBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setAudioSessionSetActiveEndHostTime:(unint64_t)a3
{
  self->_audioSessionSetActiveEndHostTime = a3;
}

- (unint64_t)audioSessionSetActiveEndHostTime
{
  return self->_audioSessionSetActiveEndHostTime;
}

- (void)setTriggeredTwoShotBorealis:(BOOL)a3
{
  self->_triggeredTwoShotBorealis = a3;
}

- (BOOL)triggeredTwoShotBorealis
{
  return self->_triggeredTwoShotBorealis;
}

- (void)setIsEndAlertInfo:(BOOL)a3
{
  self->_isEndAlertInfo = a3;
}

- (BOOL)isEndAlertInfo
{
  return self->_isEndAlertInfo;
}

- (BOOL)isDucking
{
  return self->_isDucking;
}

- (unint64_t)estimatedSpeechEndHostTime
{
  return self->_estimatedSpeechEndHostTime;
}

- (unint64_t)firstBufferHostTime
{
  return self->_firstBufferHostTime;
}

- (double)firstBufferTimestamp
{
  return self->_firstBufferTimestamp;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (double)startRecordingTimestamp
{
  return self->_startRecordingTimestamp;
}

- (double)activationAlertStartTimestamp
{
  return self->_activationAlertStartTimestamp;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (NSString)headsetName
{
  return self->_headsetName;
}

- (NSString)dspStatus
{
  return self->_dspStatus;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (CSFAudioRecordDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)route
{
  return self->_route;
}

- (NSString)destination
{
  return self->_destination;
}

- (int)mhSource
{
  return self->_mhSource;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)codec
{
  return self->_codec;
}

- (int64_t)audioAlertStyle
{
  return self->_audioAlertStyle;
}

- (BOOL)isSecureOfflineOnly
{
  return self->_isSecureOfflineOnly;
}

- (BOOL)isFingerprintOnly
{
  return self->_isFingerprintOnly;
}

- (BOOL)isDictation
{
  return self->_isDictation;
}

- (BOOL)codecIsNarrowband
{
  if ([(NSString *)self->_codec isEqualToString:*MEMORY[0x1E4F975B0]]) {
    return 1;
  }
  codec = self->_codec;
  uint64_t v5 = *MEMORY[0x1E4F975E0];
  return [(NSString *)codec isEqualToString:v5];
}

- (NSString)productId
{
  v2 = NSNumber;
  v3 = [(CSSiriRecordingInfo *)self _bluetoothDeviceInfo];
  v4 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "productID"));
  uint64_t v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (NSString)vendorId
{
  v2 = NSNumber;
  v3 = [(CSSiriRecordingInfo *)self _bluetoothDeviceInfo];
  v4 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "vendorID"));
  uint64_t v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (NSString)headsetAddress
{
  headsetAddress = self->_headsetAddress;
  if (headsetAddress)
  {
    v3 = headsetAddress;
  }
  else
  {
    v4 = [(CSSiriRecordingInfo *)self _bluetoothDeviceInfo];
    v3 = [v4 address];
  }
  return v3;
}

- (id)_bluetoothDeviceInfo
{
  return (id)[(AFBluetoothDevice *)self->_bluetoothDevice deviceInfo];
}

- (void)_fetchBTInfo
{
  if (self->_headsetAddress)
  {
    id v8 = +[CSSiriBluetoothManager sharedInstance];
    v3 = [v8 deviceWithAddress:self->_headsetAddress];
    bluetoothDevice = self->_bluetoothDevice;
    self->_bluetoothDevice = v3;
LABEL_3:

    uint64_t v5 = v8;
    goto LABEL_4;
  }
  if (![(NSString *)self->_source isEqualToString:*MEMORY[0x1E4F97640]]) {
    return;
  }
  uint64_t v5 = [(CSFAudioRecordDeviceInfo *)self->_deviceInfo remoteDeviceUID];
  if (v5)
  {
    id v8 = v5;
    bluetoothDevice = +[CSSiriBluetoothManager sharedInstance];
    v6 = [bluetoothDevice deviceWithUID:v8];
    v7 = self->_bluetoothDevice;
    self->_bluetoothDevice = v6;

    goto LABEL_3;
  }
LABEL_4:
}

- (BOOL)isBluetooth
{
  if ([(NSString *)self->_source isEqualToString:*MEMORY[0x1E4F97648]]) {
    return 1;
  }
  source = self->_source;
  uint64_t v5 = *MEMORY[0x1E4F97640];
  return [(NSString *)source isEqualToString:v5];
}

- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 codec:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSSiriRecordingInfo;
  v7 = [(CSSiriRecordingInfo *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_isDictation = a3;
    uint64_t v9 = [v6 copy];
    codec = v8->_codec;
    v8->_codec = (NSString *)v9;
  }
  return v8;
}

- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 fingerprintOnly:(BOOL)a4 secureOfflineOnly:(BOOL)a5 audioAlertStyle:(int64_t)a6 recordSettings:(id)a7 recordRoute:(id)a8 recordDeviceInfo:(id)a9 playbackRoute:(id)a10 audioDeviceID:(unsigned int)a11 audioSessionID:(unsigned int)a12 voiceTriggerEventInfo:(id)a13 activationAlertStartTimestamp:(double)a14 startRecordingTimestamp:(double)a15 firstBufferTimestamp:(double)a16 firstBufferHostTime:(unint64_t)a17 estimatedSpeechEndHostTime:(unint64_t)a18 deviceIdentifier:(id)a19 includeBTInfo:(BOOL)a20 speechEvent:(int64_t)a21
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v113 = a7;
  id v112 = a8;
  id v114 = a9;
  id v111 = a10;
  id v30 = a13;
  id v31 = a19;
  v115.receiver = self;
  v115.super_class = (Class)CSSiriRecordingInfo;
  v32 = [(CSSiriRecordingInfo *)&v115 init];

  if (!v32) {
    goto LABEL_137;
  }
  v32->_isDictation = a3;
  v32->_isFingerprintOnly = a4;
  v32->_isSecureOfflineOnly = a5;
  v32->_audioAlertStyle = a6;
  uint64_t v33 = *MEMORY[0x1E4F151E0];
  id v34 = v113;
  v35 = [v34 objectForKey:v33];
  int v36 = [v35 intValue];

  v37 = [v34 objectForKey:*MEMORY[0x1E4F15228]];
  int v38 = [v37 intValue];

  v39 = [v34 objectForKey:*MEMORY[0x1E4F151F0]];
  int v40 = [v39 intValue];

  v41 = [v34 objectForKey:*MEMORY[0x1E4F15270]];

  int v42 = [v41 intValue];
  if (v36 == 1819304813 && v38 == 1 && v40 == 16)
  {
    id v43 = 0;
    if (v42 <= 15999)
    {
      if (v42 == 8000)
      {
        v44 = (id *)MEMORY[0x1E4F975D8];
      }
      else
      {
        if (v42 != 11025) {
          goto LABEL_28;
        }
        v44 = (id *)MEMORY[0x1E4F975B8];
      }
    }
    else
    {
      switch(v42)
      {
        case 16000:
          v44 = (id *)MEMORY[0x1E4F975C0];
          break;
        case 22050:
          v44 = (id *)MEMORY[0x1E4F975C8];
          break;
        case 32000:
          v44 = (id *)MEMORY[0x1E4F975D0];
          break;
        default:
          goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
  if (v36 == 1869641075)
  {
    if (v42 == 8000)
    {
      v44 = (id *)MEMORY[0x1E4F975B0];
      goto LABEL_27;
    }
    if (v42 == 16000)
    {
      v44 = (id *)MEMORY[0x1E4F975A8];
      goto LABEL_27;
    }
LABEL_21:
    id v43 = 0;
    goto LABEL_28;
  }
  if (v36 != 1936745848) {
    goto LABEL_21;
  }
  if (v42 == 8000)
  {
    v44 = (id *)MEMORY[0x1E4F975E0];
    goto LABEL_27;
  }
  if (v42 != 16000) {
    goto LABEL_21;
  }
  v44 = (id *)MEMORY[0x1E4F975E8];
LABEL_27:
  id v43 = *v44;
LABEL_28:
  v45 = [MEMORY[0x1E4F28CB8] defaultManager];
  v46 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  v47 = [v46 stringByAppendingPathComponent:@"forceSiriPCMAudio"];
  int v48 = [v45 fileExistsAtPath:v47];

  if (v48)
  {
    id v49 = (id)*MEMORY[0x1E4F975E8];

    id v43 = v49;
  }
  id v109 = v30;
  codec = v32->_codec;
  v32->_codec = (NSString *)v43;

  if (!v32->_codec)
  {
    v51 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v119 = "-[CSSiriRecordingInfo initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:re"
             "cordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlert"
             "StartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:"
             "deviceIdentifier:includeBTInfo:speechEvent:]";
      __int16 v120 = 2114;
      id v121 = v34;
      _os_log_error_impl(&dword_1C9338000, v51, OS_LOG_TYPE_ERROR, "%s No SACodec for settings %{public}@", buf, 0x16u);
    }
  }
  uint64_t v52 = a11;
  id v53 = v112;
  uint64_t v54 = *MEMORY[0x1E4F15158];
  char v55 = [v53 isEqualToString:*MEMORY[0x1E4F15158]];
  v56 = (void **)MEMORY[0x1E4F97668];
  v57 = (void *)MEMORY[0x1E4F150F0];
  v58 = (id *)MEMORY[0x1E4F97668];
  if ((v55 & 1) == 0)
  {
    if ([v53 isEqualToString:*MEMORY[0x1E4F150F0]])
    {
      v58 = (id *)MEMORY[0x1E4F97650];
    }
    else if ([v53 isEqualToString:*MEMORY[0x1E4F15150]])
    {
      v58 = (id *)MEMORY[0x1E4F97678];
    }
    else if ([v53 isEqualToString:*MEMORY[0x1E4F150D8]])
    {
      v58 = (id *)MEMORY[0x1E4F97648];
    }
    else if ([v53 isEqualToString:*MEMORY[0x1E4F15160]])
    {
      v58 = (id *)MEMORY[0x1E4F97670];
    }
    else if ([v53 isEqualToString:*MEMORY[0x1E4F15118]])
    {
      v58 = (id *)MEMORY[0x1E4F97658];
    }
    else if ([v53 isEqualToString:*MEMORY[0x1E4F15328]])
    {
      v58 = (id *)MEMORY[0x1E4F97660];
    }
    else
    {
      if (([v53 isEqualToString:*MEMORY[0x1E4F152F8]] & 1) == 0)
      {

        goto LABEL_51;
      }
      v58 = (id *)MEMORY[0x1E4F97640];
    }
  }
  v59 = (NSString *)*v58;

  if (v59)
  {
    source = v32->_source;
    v32->_source = v59;
    v61 = v59;
    goto LABEL_55;
  }
LABEL_51:
  if (!a11) {
    goto LABEL_53;
  }
  UInt32 ioPropertyDataSize = 4;
  *(_DWORD *)buf = 0;
  if (AudioDeviceGetProperty(a11, 0, 1u, 0x7472616Eu, &ioPropertyDataSize, buf)) {
    goto LABEL_53;
  }
  id v62 = 0;
  if (*(int *)buf > 1818848868)
  {
    if (*(_DWORD *)buf == 1818848869)
    {
      v66 = *v56;
      goto LABEL_80;
    }
    if (*(_DWORD *)buf != 1970496032) {
      goto LABEL_54;
    }
    v65 = (void **)MEMORY[0x1E4F97670];
LABEL_72:
    v66 = *v65;
LABEL_80:
    id v62 = v66;
    goto LABEL_54;
  }
  if (*(_DWORD *)buf != 1651274862)
  {
    if (*(_DWORD *)buf != 1651275109) {
      goto LABEL_54;
    }
    v65 = (void **)MEMORY[0x1E4F97648];
    goto LABEL_72;
  }
  int outPropertyData = 0;
  UInt32 ioPropertyDataSize = 4;
  if (!AudioDeviceGetProperty(a11, 0, 1u, 0x73737263u, &ioPropertyDataSize, &outPropertyData))
  {
    if (outPropertyData == 1768778083)
    {
      v65 = (void **)MEMORY[0x1E4F97650];
      goto LABEL_72;
    }
    if (outPropertyData == 1701669219)
    {
      v65 = (void **)MEMORY[0x1E4F97678];
      goto LABEL_72;
    }
  }
LABEL_53:
  id v62 = 0;
LABEL_54:
  v61 = (NSString *)v62;
  source = v32->_source;
  v32->_source = v61;
LABEL_55:

  id v63 = v53;
  if ([v63 isEqualToString:v54])
  {
    int v64 = 1;
LABEL_85:

    goto LABEL_86;
  }
  if ([v63 isEqualToString:*v57])
  {
    int v64 = 2;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F15150]])
  {
    int v64 = 3;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F150D8]])
  {
    int v64 = 4;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F15160]])
  {
    int v64 = 5;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F15118]])
  {
    int v64 = 6;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F15328]])
  {
    int v64 = 8;
    goto LABEL_85;
  }
  if ([v63 isEqualToString:*MEMORY[0x1E4F152F8]])
  {
    int v64 = 7;
    goto LABEL_85;
  }

  if (!a11) {
    goto LABEL_104;
  }
  UInt32 ioPropertyDataSize = 4;
  *(_DWORD *)buf = 0;
  if (AudioDeviceGetProperty(a11, 0, 1u, 0x7472616Eu, &ioPropertyDataSize, buf)) {
    goto LABEL_104;
  }
  if (*(int *)buf > 1818848868)
  {
    if (*(_DWORD *)buf == 1818848869)
    {
      int v64 = 1;
    }
    else
    {
      if (*(_DWORD *)buf != 1970496032) {
        goto LABEL_104;
      }
      int v64 = 5;
    }
  }
  else
  {
    if (*(_DWORD *)buf != 1651274862)
    {
      if (*(_DWORD *)buf == 1651275109)
      {
        int v64 = 4;
        goto LABEL_86;
      }
LABEL_104:
      int v64 = 0;
      goto LABEL_86;
    }
    int outPropertyData = 0;
    UInt32 ioPropertyDataSize = 4;
    if (AudioDeviceGetProperty(a11, 0, 1u, 0x73737263u, &ioPropertyDataSize, &outPropertyData)) {
      goto LABEL_104;
    }
    if (outPropertyData == 1768778083)
    {
      int v64 = 2;
    }
    else
    {
      if (outPropertyData != 1701669219) {
        goto LABEL_104;
      }
      int v64 = 3;
    }
  }
LABEL_86:
  v32->_mhSource = v64;
  id v67 = v111;
  char v68 = [v67 isEqualToString:*MEMORY[0x1E4F15108]];
  v69 = (void *)MEMORY[0x1E4F150C0];
  if (v68)
  {
    v70 = (id *)MEMORY[0x1E4F97610];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F150F8]])
  {
    v70 = (id *)MEMORY[0x1E4F97608];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F15138]])
  {
    v70 = (id *)MEMORY[0x1E4F97628];
  }
  else if ([v67 isEqualToString:*v69])
  {
    v70 = (id *)MEMORY[0x1E4F975F0];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F150D8]])
  {
    v70 = (id *)MEMORY[0x1E4F975F8];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F150E0]])
  {
    v70 = (id *)MEMORY[0x1E4F97600];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F15118]])
  {
    v70 = (id *)MEMORY[0x1E4F97618];
  }
  else if ([v67 isEqualToString:*MEMORY[0x1E4F15160]])
  {
    v70 = (id *)MEMORY[0x1E4F97638];
  }
  else
  {
    if (![v67 isEqualToString:*MEMORY[0x1E4F15130]])
    {
      v71 = 0;
      if (!v67) {
        goto LABEL_110;
      }
      goto LABEL_108;
    }
    v70 = (id *)MEMORY[0x1E4F97620];
  }
  v71 = (NSString *)*v70;
  if (!v67) {
    goto LABEL_110;
  }
LABEL_108:
  if (!v71) {
    v71 = (NSString *)(id)*MEMORY[0x1E4F97630];
  }
LABEL_110:

  destination = v32->_destination;
  v32->_destination = v71;

  v73 = v63;
  if (!v63)
  {
    v73 = [v114 route];
  }
  uint64_t v74 = objc_msgSend(v73, "copy", v109);
  route = v32->_route;
  v32->_route = (NSString *)v74;

  if (!v63) {
  uint64_t v76 = [v114 copy];
  }
  deviceInfo = v32->_deviceInfo;
  v32->_deviceInfo = (CSFAudioRecordDeviceInfo *)v76;

  uint64_t v78 = [v110 copy];
  voiceTriggerEventInfo = v32->_voiceTriggerEventInfo;
  v32->_voiceTriggerEventInfo = (NSDictionary *)v78;

  v32->_activationAlertStartTimestamp = a14;
  v32->_startRecordingTimestamp = a15;
  v32->_firstBufferTimestamp = a16;
  v80 = v31;
  v32->_firstBufferHostTime = a17;
  if (!v31)
  {
    uint64_t v52 = [v114 remoteDeviceUID];
    v80 = [(id)v52 UUIDString];
  }
  uint64_t v81 = [v80 copy];
  deviceIdentifier = v32->_deviceIdentifier;
  v32->_deviceIdentifier = (NSString *)v81;

  if (!v31)
  {
  }
  v32->_speechEvent = a21;
  v83 = [v34 objectForKey:@"CSSpeechRecordSettingsKey_isDucking"];
  v32->_isDucking = [v83 BOOLValue];

  v32->_audioSessionID = a12;
  v32->_estimatedSpeechEndHostTime = a18;
  if (([v63 isEqualToString:*v69] & 1) != 0
    || ([v63 isEqualToString:*MEMORY[0x1E4F150D8]] & 1) != 0
    || [v63 isEqualToString:*MEMORY[0x1E4F150E0]])
  {
    v84 = [MEMORY[0x1E4F153E0] retrieveSessionWithID:a12];
    v85 = [v84 currentRoute];
    v86 = [v85 inputs];
    v87 = [v86 firstObject];

    v88 = [v87 portName];
    uint64_t v89 = [v88 copy];
    headsetName = v32->_headsetName;
    v32->_headsetName = (NSString *)v89;

    v91 = [v87 UID];
    uint64_t v92 = [v91 copy];
    headsetAddress = v32->_headsetAddress;
    v32->_headsetAddress = (NSString *)v92;

    if ([v84 isEarpieceActiveNoiseCancelationEnabled]) {
      v94 = (void *)*MEMORY[0x1E4F97680];
    }
    else {
      v94 = 0;
    }
    objc_storeStrong((id *)&v32->_dspStatus, v94);
  }
  id v30 = v110;
  if ([v63 isEqualToString:*MEMORY[0x1E4F152F8]])
  {
    v95 = [v114 remoteDeviceUID];
    BOOL v96 = v95 != 0;
  }
  else
  {
    BOOL v96 = 0;
  }
  v97 = v32->_headsetAddress;
  if (v97)
  {
    if (!v32->_deviceIdentifier)
    {
      uint64_t v107 = [(NSString *)v97 copy];
      v108 = v32->_deviceIdentifier;
      v32->_deviceIdentifier = (NSString *)v107;

      if (v32->_headsetAddress) {
        BOOL v96 = 1;
      }
      if (!v96) {
        goto LABEL_134;
      }
      goto LABEL_132;
    }
    BOOL v96 = 1;
  }
  if (v96)
  {
LABEL_132:
    if (a20) {
      [(CSSiriRecordingInfo *)v32 _fetchBTInfo];
    }
  }
LABEL_134:
  if (([v63 isEqualToString:*MEMORY[0x1E4F15118]] & 1) != 0
    || [v63 isEqualToString:*MEMORY[0x1E4F15328]])
  {
    v98 = [MEMORY[0x1E4F16508] currentCarPlayExternalDevice];
    v99 = [v98 screenIDs];
    uint64_t v100 = [v99 componentsJoinedByString:@","];
    v101 = v32->_deviceIdentifier;
    v32->_deviceIdentifier = (NSString *)v100;

    v102 = [v98 modelName];
    uint64_t v103 = [v102 copy];
    modelName = v32->_modelName;
    v32->_modelName = (NSString *)v103;
  }
LABEL_137:
  v105 = v32;

  return v105;
}

@end