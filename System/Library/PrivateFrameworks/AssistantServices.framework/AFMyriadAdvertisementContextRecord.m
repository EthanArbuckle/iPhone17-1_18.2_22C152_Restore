@interface AFMyriadAdvertisementContextRecord
- (AFMyriadAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6;
- (AFMyriadAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3;
- (BOOL)compareAdvertisementPayload:(id)a3;
- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4;
- (NSData)advertisementPayload;
- (NSUUID)deviceID;
- (char)_getAdvertisementRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4;
- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4;
- (double)advertisementDispatchTime;
- (double)voiceTriggerEndTime;
- (id)_deviceIDFromBytes:(const unsigned __int8 *)(a3;
- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4;
- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4;
- (id)description;
- (id)myriadAdvertisementContextAsData;
- (id)recordForDeviceId:(id)a3;
- (int64_t)advertisementRecordType;
- (unint64_t)_advertisementPayloadSizeForVersion:(unsigned __int8)a3;
- (unsigned)advertisementContextVersion;
- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3;
- (void)setAdvertisementDispatchTime:(double)a3;
@end

@implementation AFMyriadAdvertisementContextRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

- (void)setAdvertisementDispatchTime:(double)a3
{
  self->_advertisementDispatchTime = a3;
}

- (double)advertisementDispatchTime
{
  return self->_advertisementDispatchTime;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (int64_t)advertisementRecordType
{
  return self->_advertisementRecordType;
}

- (unsigned)advertisementContextVersion
{
  return self->_advertisementContextVersion;
}

- (id)_deviceIDFromBytes:(const unsigned __int8 *)(a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (uuid_is_null((const unsigned __int8 *)a3)) {
    goto LABEL_2;
  }
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)a3, out);
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", out);
  if (![v5 length])
  {

LABEL_2:
    v4 = 0;
    goto LABEL_5;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];

LABEL_5:
  return v4;
}

- (BOOL)compareAdvertisementPayload:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && self->_advertisementPayload
    && (uint64_t v6 = [v4 length], v6 == -[NSData length](self->_advertisementPayload, "length")))
  {
    char v7 = [v5 isEqual:self->_advertisementPayload];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)recordForDeviceId:(id)a3
{
  id v4 = a3;
  if (v4 && self->_advertisementPayload)
  {
    v5 = [[AFMyriadRecord alloc] initWithDeviceID:v4 data:self->_advertisementPayload];
    [(AFMyriadRecord *)v5 setIsCollectedFromContextCollector:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v4 && v5)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_advertisementContextVersion, 0, 1);
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int advertisementContextVersion = self->_advertisementContextVersion;
      int v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      __int16 v16 = 1024;
      LODWORD(v17) = advertisementContextVersion;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Initializing Myriad advertisement context (version: %d)", (uint8_t *)&v14, 0x12u);
    }
    self->_advertisementRecordType = [(AFMyriadAdvertisementContextRecord *)self _getAdvertisementRecordTypeForVersion:self->_advertisementContextVersion data:v4];
    [(AFMyriadAdvertisementContextRecord *)self _getVoiceTriggerEndTimeForVersion:self->_advertisementContextVersion data:v4];
    self->_voiceTriggerEndTime = v8;
    v9 = [(AFMyriadAdvertisementContextRecord *)self _getMyriadAdvertisementDataForVersion:self->_advertisementContextVersion data:v4];
    advertisementPayload = self->_advertisementPayload;
    self->_advertisementPayload = v9;

    v11 = [(AFMyriadAdvertisementContextRecord *)self _getDeviceIdForVersion:self->_advertisementContextVersion data:v4];
    deviceID = self->_deviceID;
    self->_deviceID = v11;
  }
  else
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s #myriad-advertisementcontext: Received wedged Myriad advertisement context record %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12[0] = 0;
  v12[1] = 0;
  unint64_t v7 = [v6 length];
  if ((v4 - 1) > 1)
  {
    if (v7 >= 0x22)
    {
      uint64_t v8 = 18;
      goto LABEL_6;
    }
  }
  else if (v7 > 0x20)
  {
    uint64_t v8 = 17;
LABEL_6:
    objc_msgSend(v6, "getBytes:range:", v12, v8, 16);
    v9 = [(AFMyriadAdvertisementContextRecord *)self _deviceIDFromBytes:v12];
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:
  v10 = (void *)[v9 copy];

  return v10;
}

- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  size_t v6 = [(AFMyriadAdvertisementContextRecord *)self _advertisementPayloadSizeForVersion:self->_advertisementContextVersion];
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v11 - v7;
  bzero((char *)v11 - v7, v6);
  if ([v5 length] >= v6 + 10) {
    objc_msgSend(v5, "getBytes:range:", v8, 10, v6);
  }
  v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v6];

  return v9;
}

- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4 = a4;
  double v7 = 0.0;
  double v5 = 0.0;
  if ((unint64_t)[v4 length] >= 0xA)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 2, 8);
    double v5 = v7;
  }

  return v5;
}

- (char)_getAdvertisementRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4 = a4;
  char v5 = 7;
  uint64_t v7 = 7;
  if ((unint64_t)[v4 length] >= 2)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 1, 1);
    char v5 = v7;
  }

  return v5;
}

- (unint64_t)_advertisementPayloadSizeForVersion:(unsigned __int8)a3
{
  if ((a3 - 1) < 2) {
    return 7;
  }
  else {
    return 8;
  }
}

- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      v15 = "-[AFMyriadAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      __int16 v16 = 2048;
      *(double *)id v17 = a3;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s Invalid Voicetrigger endtime: %f", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    double v6 = fmin(a4, 0.5);
    double voiceTriggerEndTime = self->_voiceTriggerEndTime;
    if (voiceTriggerEndTime - a3 >= 0.0) {
      double v8 = voiceTriggerEndTime - a3;
    }
    else {
      double v8 = -(voiceTriggerEndTime - a3);
    }
    BOOL v9 = v8 <= v6;
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      advertisementPayload = self->_advertisementPayload;
      int v14 = 136316674;
      v15 = "-[AFMyriadAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      __int16 v16 = 1024;
      *(_DWORD *)id v17 = v8 <= v6;
      *(_WORD *)&v17[4] = 2048;
      *(double *)&v17[6] = v6;
      __int16 v18 = 2048;
      double v19 = a3;
      __int16 v20 = 2048;
      double v21 = voiceTriggerEndTime;
      __int16 v22 = 2048;
      double v23 = v8;
      __int16 v24 = 2112;
      v25 = advertisementPayload;
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s VoicetriggerEndtime isSane: %d (threshold: %f, me: %f, other: %f, abs-diff: %f adv: %@)", (uint8_t *)&v14, 0x44u);
    }
  }
  return v9;
}

- (id)myriadAdvertisementContextAsData
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA58] data];
  size_t v4 = [(AFMyriadAdvertisementContextRecord *)self _advertisementPayloadSizeForVersion:self->_advertisementContextVersion];
  char v5 = &buf[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v5, v4);
  advertisementPayload = self->_advertisementPayload;
  if (advertisementPayload && [(NSData *)advertisementPayload length] == v4) {
    [(NSData *)self->_advertisementPayload getBytes:v5 length:v4];
  }
  v16[0] = 0;
  v16[1] = 0;
  deviceID = self->_deviceID;
  if (deviceID) {
    [(NSUUID *)deviceID getUUIDBytes:v16];
  }
  [v3 appendBytes:&self->_advertisementContextVersion length:1];
  [v3 appendBytes:&self->_advertisementRecordType length:1];
  [v3 appendBytes:&self->_voiceTriggerEndTime length:8];
  [v3 appendBytes:v5 length:v4];
  [v3 appendBytes:v16 length:16];
  double v8 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    uint64_t v10 = [v3 length];
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFMyriadAdvertisementContextRecord myriadAdvertisementContextAsData]";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s Generated Myriad advertisement context data: %lu bytes", buf, 0x16u);
  }
  return v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(NSData *)self->_advertisementPayload length])
  {
    size_t v4 = [(NSData *)self->_advertisementPayload bytes];
    if ([(NSData *)self->_advertisementPayload length])
    {
      unint64_t v5 = 0;
      do
        objc_msgSend(v3, "appendFormat:", @"%02x", v4[v5++]);
      while (v5 < [(NSData *)self->_advertisementPayload length]);
    }
  }
  double v6 = [NSString stringWithFormat:@"AFMyriadAdvertisementContextRecord: contextVersion=%ld vtEndTime=%f advRecordType=%ld advPayload=0x%@ deviceID=%@", self->_advertisementContextVersion, *(void *)&self->_voiceTriggerEndTime, self->_advertisementRecordType, v3, self->_deviceID];

  return v6;
}

- (AFMyriadAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFMyriadAdvertisementContextRecord;
  unint64_t v5 = [(AFMyriadAdvertisementContextRecord *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(AFMyriadAdvertisementContextRecord *)v5 _initializeMyriadAdvertisementContextRecordFromData:v4];
  }

  return v6;
}

- (AFMyriadAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AFMyriadAdvertisementContextRecord;
  v12 = [(AFMyriadAdvertisementContextRecord *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_int advertisementContextVersion = kMyriadAdvertisementContextRecordVersion;
    v12->_advertisementRecordType = a3;
    v12->_double voiceTriggerEndTime = a4;
    uint64_t v14 = [v10 copy];
    advertisementPayload = v13->_advertisementPayload;
    v13->_advertisementPayload = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    deviceID = v13->_deviceID;
    v13->_deviceID = (NSUUID *)v16;
  }
  return v13;
}

@end