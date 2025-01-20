@interface AFMyriadAccessoryMessage
+ (BOOL)isMyriadRequestMessage:(id)a3;
+ (id)acknowledgeRequestKey;
+ (id)audioDataKey;
+ (id)deviceInfoKey;
+ (id)electionDecisionKey;
+ (id)emergencyHandledKey;
+ (id)messageKey;
+ (id)myriadRequestTypeAsString:(unint64_t)a3;
+ (id)protocolName;
+ (id)requestTypeKey;
+ (id)sessionIdKey;
- (AFMyriadAccessoryMessage)initWithAccessoryMessage:(id)a3 accessoryId:(id)a4;
- (AFMyriadAccessoryMessage)initWithAccessoryMessageAsDictionary:(id)a3 accessoryId:(id)a4;
- (AFMyriadAccessoryMessage)initWithRequestType:(unint64_t)a3 session:(unint64_t)a4 voiceTriggerEndTime:(double)a5 audioHash:(unsigned __int16)a6 goodnessScore:(unsigned __int8)a7 userConfidenceScore:(unsigned __int8)a8 tieBreaker:(unsigned __int8)a9 deviceClass:(unsigned __int8)a10 deviceGroup:(unsigned __int8)a11 productType:(unsigned __int8)a12 electionDecision:(unsigned __int8)a13 emergencyHandled:(unsigned __int8)a14 ack:(unsigned __int8)a15 accessoryId:(id)a16;
- (BOOL)isSane;
- (BOOL)usesSerializedProtocol;
- (NSUUID)accessoryId;
- (double)voiceTriggerEndTime;
- (id)description;
- (id)initElectionDecisionMessageWithSessionId:(unint64_t)a3 decision:(BOOL)a4 accessoryId:(id)a5;
- (id)initPreheatMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4;
- (id)initResetMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4;
- (id)messageAsData;
- (unint64_t)requestType;
- (unint64_t)session;
- (unsigned)audioHash;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (unsigned)electionWon;
- (unsigned)goodnessScore;
- (unsigned)isAcknowledgement;
- (unsigned)isEmergencyHandled;
- (unsigned)productType;
- (unsigned)tieBreaker;
- (unsigned)userConfidenceScore;
- (unsigned)version;
- (void)_copyRawBytesFromSource:(const void *)a3 toDest:(void *)a4 length:(unint64_t)a5;
- (void)_initWithMessage:(const myrAccessoryMessage *)a3;
- (void)_initializeMessageObj:(id)a3;
- (void)_initializeMessageObjFromDictionary:(id)a3;
@end

@implementation AFMyriadAccessoryMessage

- (void).cxx_destruct
{
}

- (BOOL)usesSerializedProtocol
{
  return self->_serializedProtocol;
}

- (BOOL)isSane
{
  return self->_isSane;
}

- (NSUUID)accessoryId
{
  return self->_accessoryId;
}

- (unsigned)isAcknowledgement
{
  return self->_ack;
}

- (unsigned)isEmergencyHandled
{
  return self->_emergencyHandled;
}

- (unsigned)electionWon
{
  return self->_electionDecision;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (unsigned)userConfidenceScore
{
  return self->_userConfidenceScore;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)audioHash
{
  return self->_audioHash;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (unint64_t)session
{
  return self->_session;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (unsigned)version
{
  return self->_version;
}

- (id)description
{
  v28[16] = *MEMORY[0x1E4F143B8];
  v27[0] = @"iSane";
  v26 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSane];
  v28[0] = v26;
  v27[1] = @"ACK";
  int ack = self->_message.ack;
  if (self->_message.ack)
  {
    v3 = [NSString stringWithFormat:@"1 (ACKNOWLEDGEMENT)"];
  }
  else
  {
    v3 = @"0";
  }
  v18 = v3;
  v28[1] = v3;
  v27[2] = @"usesSerializedProtocol";
  v24 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_serializedProtocol];
  v28[2] = v24;
  v27[3] = @"Version";
  v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.version];
  v28[3] = v23;
  v27[4] = @"RequestType";
  v4 = NSString;
  unint64_t requestType = self->_message.requestType;
  v22 = +[AFMyriadAccessoryMessage myriadRequestTypeAsString:requestType];
  v21 = [v4 stringWithFormat:@"%llu (%@)", requestType, v22];
  v28[4] = v21;
  v27[5] = @"Session";
  v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_message.session];
  v28[5] = v20;
  v27[6] = @"VoiceTrigger endtime";
  v19 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_message.voiceTriggerEndTime];
  v28[6] = v19;
  v27[7] = @"AudioHash";
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"hash=%#04x", self->_message.audioHash);
  v28[7] = v6;
  v27[8] = @"GoodnessScore";
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.goodnessScore];
  v28[8] = v7;
  v27[9] = @"UserConfidence";
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.userConfidenceScore];
  v28[9] = v8;
  v27[10] = @"TieBreaker";
  v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.tieBreaker];
  v28[10] = v9;
  v27[11] = @"DeviceClass";
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.deviceClass];
  v28[11] = v10;
  v27[12] = @"DeviceGroup";
  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.deviceGroup];
  v28[12] = v11;
  v27[13] = @"ProductType";
  v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.productType];
  v28[13] = v12;
  v27[14] = @"ElectionDecision";
  v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.electionDecision];
  v28[14] = v13;
  v27[15] = @"EmergencyHandled";
  v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_message.emergencyHandled];
  v28[15] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:16];

  if (ack) {
  v16 = [NSString stringWithFormat:@"%@", v15];
  }

  return v16;
}

- (id)messageAsData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:&self->_message length:48];
  return v3;
}

- (AFMyriadAccessoryMessage)initWithAccessoryMessageAsDictionary:(id)a3 accessoryId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = [(AFMyriadAccessoryMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryId, a4);
    *(_OWORD *)&v9->_message.audioHash = 0u;
    *(_OWORD *)&v9->_message.session = 0u;
    *(_OWORD *)&v9->_message.version = 0u;
    [(AFMyriadAccessoryMessage *)v9 _initializeMessageObjFromDictionary:v6];
  }

  return v9;
}

- (AFMyriadAccessoryMessage)initWithAccessoryMessage:(id)a3 accessoryId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = [(AFMyriadAccessoryMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessoryId, a4);
    *(_OWORD *)&v9->_message.audioHash = 0u;
    *(_OWORD *)&v9->_message.session = 0u;
    *(_OWORD *)&v9->_message.version = 0u;
    [(AFMyriadAccessoryMessage *)v9 _initializeMessageObj:v6];
  }

  return v9;
}

- (id)initResetMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = [(AFMyriadAccessoryMessage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 9) = 0u;
    *(_OWORD *)(v8 + 25) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    v8[8] = 1;
    *((void *)v8 + 2) = 1;
    *((void *)v8 + 3) = a3;
    objc_storeStrong((id *)v8 + 12, a4);
    v9[33] = 257;
    [v9 _initWithMessage:v9 + 4];
  }

  return v9;
}

- (id)initElectionDecisionMessageWithSessionId:(unint64_t)a3 decision:(BOOL)a4 accessoryId:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AFMyriadAccessoryMessage;
  v10 = [(AFMyriadAccessoryMessage *)&v13 init];
  objc_super v11 = v10;
  if (v10)
  {
    *(_OWORD *)(v10 + 9) = 0u;
    *(_OWORD *)(v10 + 25) = 0u;
    v10[8] = 1;
    *(_OWORD *)(v10 + 40) = 0u;
    *((void *)v10 + 2) = 10;
    *((void *)v10 + 3) = a3;
    v10[48] = a4;
    objc_storeStrong((id *)v10 + 12, a5);
    v11[33] = 257;
    [v11 _initWithMessage:v11 + 4];
  }

  return v11;
}

- (id)initPreheatMessageWithSessionId:(unint64_t)a3 accessoryId:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadAccessoryMessage;
  v8 = [(AFMyriadAccessoryMessage *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 9) = 0u;
    *(_OWORD *)(v8 + 25) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    v8[8] = 1;
    *((void *)v8 + 2) = 6;
    *((void *)v8 + 3) = a3;
    objc_storeStrong((id *)v8 + 12, a4);
    v9[33] = 257;
    [v9 _initWithMessage:v9 + 4];
  }

  return v9;
}

- (AFMyriadAccessoryMessage)initWithRequestType:(unint64_t)a3 session:(unint64_t)a4 voiceTriggerEndTime:(double)a5 audioHash:(unsigned __int16)a6 goodnessScore:(unsigned __int8)a7 userConfidenceScore:(unsigned __int8)a8 tieBreaker:(unsigned __int8)a9 deviceClass:(unsigned __int8)a10 deviceGroup:(unsigned __int8)a11 productType:(unsigned __int8)a12 electionDecision:(unsigned __int8)a13 emergencyHandled:(unsigned __int8)a14 ack:(unsigned __int8)a15 accessoryId:(id)a16
{
  id v24 = a16;
  v28.receiver = self;
  v28.super_class = (Class)AFMyriadAccessoryMessage;
  v25 = [(AFMyriadAccessoryMessage *)&v28 init];
  v26 = v25;
  if (v25)
  {
    *(_OWORD *)(v25 + 9) = 0u;
    *(_OWORD *)(v25 + 25) = 0u;
    *(_OWORD *)(v25 + 40) = 0u;
    v25[8] = 1;
    *((void *)v25 + 2) = a3;
    *((void *)v25 + 3) = a4;
    *((double *)v25 + 4) = a5;
    *((_WORD *)v25 + 20) = a6;
    v25[42] = a7;
    v25[43] = a8;
    v25[44] = a9;
    v25[45] = a10;
    v25[46] = a11;
    v25[47] = a12;
    v25[48] = a13;
    v25[49] = a14;
    v25[50] = a15;
    objc_storeStrong((id *)v25 + 12, a16);
    *((_WORD *)v26 + 33) = 257;
    [v26 _initWithMessage:v26 + 8];
  }

  return (AFMyriadAccessoryMessage *)v26;
}

- (void)_initWithMessage:(const myrAccessoryMessage *)a3
{
  if (a3)
  {
    self->_version = a3->version;
    self->_unint64_t requestType = a3->requestType;
    self->_session = a3->session;
    self->_voiceTriggerEndTime = a3->voiceTriggerEndTime;
    self->_audioHash = a3->audioHash;
    self->_goodnessScore = a3->goodnessScore;
    self->_userConfidenceScore = a3->userConfidenceScore;
    self->_tieBreaker = a3->tieBreaker;
    self->_deviceClass = a3->deviceClass;
    self->_deviceGroup = a3->deviceGroup;
    self->_productType = a3->productType;
    self->_electionDecision = a3->electionDecision;
    self->_emergencyHandled = a3->emergencyHandled;
    self->_int ack = a3->ack;
  }
}

- (void)_initializeMessageObjFromDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[AFMyriadAccessoryMessage acknowledgeRequestKey];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = +[AFMyriadAccessoryMessage sessionIdKey];
  v8 = [v4 objectForKeyedSubscript:v7];

  id v9 = +[AFMyriadAccessoryMessage requestTypeKey];
  v10 = [v4 objectForKeyedSubscript:v9];

  objc_super v11 = +[AFMyriadAccessoryMessage messageKey];
  v12 = [v4 objectForKeyedSubscript:v11];

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AFMyriadAccessoryMessage *)self _initializeMessageObj:v12];
      goto LABEL_31;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v13 = v8;
      id v14 = v10;
      self->_serializedProtocol = 0;
      self->_message.unint64_t requestType = [v14 unsignedLongValue];
      self->_message.session = [(NSUUID *)v13 unsignedLongValue];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v6 unsignedIntValue])
          {
            self->_message.int ack = 1;
            self->_isSane = 1;
LABEL_30:

            goto LABEL_31;
          }
        }
      }
      if (v14)
      {
        int v17 = [v14 intValue];
        switch(v17)
        {
          case 10:
            p_message = &self->_message;
            self->_isSane = 1;
            v19 = +[AFMyriadAccessoryMessage electionDecisionKey];
            v20 = [v4 objectForKeyedSubscript:v19];

            if (v20) {
              unsigned __int8 v21 = [v20 unsignedIntValue];
            }
            else {
              unsigned __int8 v21 = 0;
            }
            self->_message.electionDecision = v21;
            break;
          case 9:
            p_message = &self->_message;
            self->_isSane = 1;
            v22 = +[AFMyriadAccessoryMessage emergencyHandledKey];
            v20 = [v4 objectForKeyedSubscript:v22];

            if (v20) {
              unsigned __int8 v23 = [v20 unsignedIntValue];
            }
            else {
              unsigned __int8 v23 = 0;
            }
            self->_message.emergencyHandled = v23;
            break;
          case 8:
            self->_isSane = 1;
            [(AFMyriadAccessoryMessage *)self _initWithMessage:&self->_message];
            goto LABEL_30;
          default:
            goto LABEL_18;
        }
        [(AFMyriadAccessoryMessage *)self _initWithMessage:p_message];

        goto LABEL_30;
      }
LABEL_18:
      v18 = AFSiriLogContextMyriad;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_DEBUG))
      {
        accessoryId = self->_accessoryId;
        *(_DWORD *)buf = 136315650;
        v27 = "-[AFMyriadAccessoryMessage _initializeMessageObjFromDictionary:]";
        __int16 v28 = 2112;
        id v29 = v14;
        __int16 v30 = 2112;
        v31 = accessoryId;
        _os_log_debug_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_DEBUG, "%s Unknown request type %@ for accessory id: %@, Ignoring.", buf, 0x20u);
      }
      self->_isSane = 0;
      goto LABEL_30;
    }
  }
  v15 = AFSiriLogContextMyriad;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_INFO))
  {
    v16 = self->_accessoryId;
    *(_DWORD *)buf = 136315906;
    v27 = "-[AFMyriadAccessoryMessage _initializeMessageObjFromDictionary:]";
    __int16 v28 = 2112;
    id v29 = v4;
    __int16 v30 = 2112;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s Received a payload %@ with session id %@ for accessory id: %@, Ignoring.", buf, 0x2Au);
  }
  self->_isSane = 0;
LABEL_31:
}

- (void)_initializeMessageObj:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  self->_serializedProtocol = 1;
  if (v4)
  {
    if ([v4 length])
    {
      unsigned __int8 v14 = 0;
      objc_msgSend(v5, "getBytes:range:", &v14, 0, 1);
      if (v14)
      {
        unint64_t v6 = [v5 length];
        unint64_t v7 = v6;
        int v8 = v14;
        if (v14 && v6 >= 0x30)
        {
          uint64_t v9 = [v5 bytes];
          p_message = &self->_message;
          objc_super v11 = self;
          uint64_t v12 = 48;
        }
        else
        {
          if (v14 || v6 > 0x2F)
          {
            self->_isSane = 0;
            objc_super v13 = AFSiriLogContextMyriad;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextMyriad, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v16 = "-[AFMyriadAccessoryMessage _initializeMessageObj:]";
              __int16 v17 = 1024;
              int v18 = v8;
              __int16 v19 = 2048;
              unint64_t v20 = v7;
              _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s Wedged message received with version: %hhu and message length: %zu", buf, 0x1Cu);
            }
            goto LABEL_13;
          }
          uint64_t v9 = [v5 bytes];
          p_message = &self->_message;
          objc_super v11 = self;
          uint64_t v12 = v7;
        }
        [(AFMyriadAccessoryMessage *)v11 _copyRawBytesFromSource:v9 toDest:p_message length:v12];
        self->_isSane = 1;
LABEL_13:
        [(AFMyriadAccessoryMessage *)self _initWithMessage:&self->_message];
      }
    }
  }
}

- (void)_copyRawBytesFromSource:(const void *)a3 toDest:(void *)a4 length:(unint64_t)a5
{
}

+ (id)myriadRequestTypeAsString:(unint64_t)a3
{
  if (a3 - 1 > 9) {
    return @"myrRequestTypeUnknown";
  }
  else {
    return off_1E5929730[a3 - 1];
  }
}

+ (BOOL)isMyriadRequestMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[AFMyriadAccessoryMessage acknowledgeRequestKey];
  v5 = [v3 objectForKeyedSubscript:v4];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    unint64_t v7 = +[AFMyriadAccessoryMessage requestTypeKey];
    int v8 = [v3 objectForKeyedSubscript:v7];
    if (v8)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v9 = +[AFMyriadAccessoryMessage messageKey];
      v10 = [v3 objectForKeyedSubscript:v9];
      BOOL v6 = v10 != 0;
    }
  }

  return v6;
}

+ (id)messageKey
{
  return @"message";
}

+ (id)requestTypeKey
{
  return @"reqType";
}

+ (id)sessionIdKey
{
  return @"sid";
}

+ (id)emergencyHandledKey
{
  return @"emergencyHandled";
}

+ (id)electionDecisionKey
{
  return @"eDecision";
}

+ (id)deviceInfoKey
{
  return @"dInfo";
}

+ (id)audioDataKey
{
  return @"aData";
}

+ (id)acknowledgeRequestKey
{
  return @"ack";
}

+ (id)protocolName
{
  return @"com.apple.deviceArbitration";
}

@end