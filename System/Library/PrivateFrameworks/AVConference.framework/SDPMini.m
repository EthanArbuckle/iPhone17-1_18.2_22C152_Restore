@interface SDPMini
+ (BOOL)setPayload:(int)a3 mediaLine:(id)a4;
- (BOOL)allowAudioRecording;
- (BOOL)allowRTCPFB;
- (BOOL)allowsContentsChangeWithAspectPreservation;
- (BOOL)allowsDynamicMaxBitrate;
- (BOOL)getBasebandCodecType:(id *)a3 sampleRate:(id *)a4;
- (BOOL)getUseSbr:(BOOL *)a3 blockSize:(int *)a4 forAACFormat:(int)a5;
- (BOOL)setVideoPayloads:(int *)a3 count:(int)a4;
- (NSDictionary)featureListDict;
- (NSMutableArray)audioPayloads;
- (NSMutableArray)secondaryAudioPayloads;
- (NSNumber)aacBlockSize;
- (NSNumber)answerBandwidth;
- (NSNumber)audioRTCPPort;
- (NSNumber)audioRTPID;
- (NSNumber)audioRTPPort;
- (NSNumber)audioUnitModel;
- (NSNumber)maxBandwidth;
- (NSString)origin;
- (NSString)sessionIP;
- (SDPMini)init;
- (SDPMini)initWithString:(id)a3;
- (id)SDPUsername;
- (id)composeAudioFMTPForPayload:(id)a3;
- (id)composeAudioString;
- (id)composeBandwidthString;
- (id)composeFLSString;
- (id)composeSessionString;
- (id)getMediaLineForType:(int)a3;
- (id)mediaTypeToString:(int)a3;
- (id)parseIP:(id)a3;
- (id)parseRTCPPort:(id)a3;
- (id)parseRTPID:(id)a3;
- (id)toStringWithVideoEnabled:(BOOL)a3;
- (int)rulesFramerate:(int)a3;
- (void)addMediaLine:(id)a3 mediaType:(int)a4;
- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6;
- (void)dealloc;
- (void)getNegotiatedResolutionForPayload:(int)a3 forInterface:(int)a4 withRule:(id)a5 direction:(int)a6 result:(imageTag *)a7 remoteSupportsHD:(BOOL)a8 screenSharing:(BOOL)a9;
- (void)parseAudioFormatAttribute:(id)a3;
- (void)parseAudioMediaAttributes:(id)a3;
- (void)parseBandwidth:(id)a3;
- (void)parseMediaLine:(id)a3;
- (void)parseSDPFromString:(id)a3;
- (void)parseSessionAttributes:(id)a3;
- (void)rulesImageSizeForExternalPayload:(int)a3 pWidth:(int *)a4 pHeight:(int *)a5;
- (void)setAacBlockSize:(id)a3;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setAllowRTCPFB:(BOOL)a3;
- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3;
- (void)setAllowsDynamicMaxBitrate:(BOOL)a3;
- (void)setAnswerBandwidth:(id)a3;
- (void)setAudioRTCPPort:(id)a3;
- (void)setAudioRTPID:(id)a3;
- (void)setAudioRTPPort:(id)a3;
- (void)setAudioUnitModel:(id)a3;
- (void)setBasebandCodecType:(id)a3 sampleRate:(id)a4;
- (void)setFeatureListDict:(id)a3;
- (void)setMaxBandwidth:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setSessionIP:(id)a3;
- (void)setUseSbr:(BOOL)a3 blockSize:(int)a4 forAACFormat:(int)a5;
- (void)setVideoRTCPFB:(BOOL)a3 useNACK:(BOOL)a4;
@end

@implementation SDPMini

- (id)SDPUsername
{
  id result = self->_sdpUsername;
  if (!result)
  {
    v4 = NSUserName();
    if (v4 && (v5 = [(NSString *)v4 componentsSeparatedByString:@" "]) != 0)
    {
      id result = (id)objc_msgSend([NSString alloc], "initWithString:", -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0));
      self->_sdpUsername = (NSString *)result;
      if (result) {
        return result;
      }
    }
    else
    {
      id result = self->_sdpUsername;
      if (result) {
        return result;
      }
    }
    id result = (id)[[NSString alloc] initWithString:@"-"];
    self->_sdpUsername = (NSString *)result;
  }
  return result;
}

- (SDPMini)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)SDPMini;
  v2 = [(SDPMini *)&v5 init];
  if (v2)
  {
    v2->_audioParameters = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v2->audioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    v2->secondaryAudioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v2->_mediaLines = (NSMutableDictionary *)objc_opt_new();
    v3 = objc_alloc_init(SDPMediaLine);
    [(SDPMini *)v2 addMediaLine:v3 mediaType:2];
  }
  return v2;
}

- (SDPMini)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SDPMini;
  v4 = [(SDPMini *)&v7 init];
  if (v4)
  {
    v4->_audioParameters = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v4->audioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    v4->secondaryAudioPayloads = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    v4->_mediaLines = (NSMutableDictionary *)objc_opt_new();
    objc_super v5 = (void *)MEMORY[0x1E4E589F0]();
    [(SDPMini *)v4 parseSDPFromString:a3];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)SDPMini;
  [(SDPMini *)&v3 dealloc];
}

- (id)getMediaLineForType:(int)a3
{
  uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  objc_super v5 = (void *)[(NSMutableDictionary *)self->_mediaLines objectForKeyedSubscript:v4];

  return v5;
}

- (void)addMediaLine:(id)a3 mediaType:(int)a4
{
  id v6 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a4];
  [(NSMutableDictionary *)self->_mediaLines setObject:a3 forKeyedSubscript:v6];
}

- (id)mediaTypeToString:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E6DB6648[a3 - 1];
  }
}

+ (BOOL)setPayload:(int)a3 mediaLine:(id)a4
{
  if (a3 != 100 && a3 != 126 && a3 != 123) {
    return 0;
  }
  objc_msgSend(a4, "addPayload:rtpMap:formatParameters:");
  return 1;
}

- (BOOL)setVideoPayloads:(int *)a3 count:(int)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = [(SDPMini *)self getMediaLineForType:2];
  if (a4 < 1)
  {
    int v10 = 1;
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = 0;
    while (1)
    {
      unsigned int v9 = *a3++;
      if (!+[SDPMini setPayload:v9 mediaLine:v7]) {
        break;
      }
      --v8;
      if (!(a4 + v8))
      {
        int v10 = 0;
        return v10 == 0;
      }
    }
    int v10 = a4 + v8;
  }
  return v10 == 0;
}

- (id)toStringWithVideoEnabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:512];
  objc_msgSend(v5, "appendString:", -[SDPMini composeSessionString](self, "composeSessionString"));
  objc_msgSend(v5, "appendString:", -[SDPMini composeAudioString](self, "composeAudioString"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_mediaLines, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (a3 || [*(id *)(*((void *)&v15 + 1) + 8 * i) intValue] != 2)
        {
          v12 = (void *)[(NSMutableDictionary *)self->_mediaLines objectForKeyedSubscript:v11];
          [v5 appendFormat:@"%@=%@ %@ %@ %@%@", @"m", -[SDPMini mediaTypeToString:](self, "mediaTypeToString:", objc_msgSend(v11, "intValue")), @"%VRTP-PORT%", @"RTP/AVP", objc_msgSend((id)objc_msgSend(v12, "payloads"), "componentsJoinedByString:", @" ", @"\r\n"];
          objc_msgSend(v5, "appendString:", objc_msgSend(v12, "string"));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  return v5;
}

- (void)setBasebandCodecType:(id)a3 sampleRate:(id)a4
{
  self->basebandCodecSampleRate = (NSNumber *)a4;
  self->basebandCodecType = (NSString *)[a3 copy];
}

- (BOOL)getBasebandCodecType:(id *)a3 sampleRate:(id *)a4
{
  if (!self->basebandCodecSampleRate) {
    return 0;
  }
  basebandCodecType = self->basebandCodecType;
  if (!basebandCodecType) {
    return 0;
  }
  if (a3) {
    *a3 = basebandCodecType;
  }
  if (a4) {
    *a4 = self->basebandCodecSampleRate;
  }
  return 1;
}

- (void)createVideoImageAttr:(int)a3 direction:(int)a4 dimensions:(imageTag *)a5 count:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v10 = [(SDPMini *)self getMediaLineForType:2];

  [v10 createVideoImageAttr:v9 direction:v8 dimensions:a5 count:v6];
}

- (void)getNegotiatedResolutionForPayload:(int)a3 forInterface:(int)a4 withRule:(id)a5 direction:(int)a6 result:(imageTag *)a7 remoteSupportsHD:(BOOL)a8 screenSharing:(BOOL)a9
{
  uint64_t v13 = *(void *)&a3;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (![a5 count])
  {
    a7->var2 = 0;
    a7->var5 = 0;
    return;
  }
  if (a9) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  id v16 = [(SDPMini *)self getMediaLineForType:v15];
  id v17 = (id)[v16 videoImageAttributes:v13];
  if (v17)
  {
    id v18 = v17;
    id v62 = a5;
    v63 = self;
    v65 = a7;
    int v64 = [a5 count];
    v66 = v18;
    v67 = v16;
    if (a6)
    {
      id v19 = (id)[v16 getVideoRecvImages:v18];
      v20 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      obuint64_t j = v19;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v75 objects:v74 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v76 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            memset(v71, 170, sizeof(v71));
            uint64_t v72 = -1431655766;
            int v73 = -1431655766;
            +[SDPMediaLine fillImageStruct:v25 imageStruct:v71];
            if (v73 != a4) {
              [v20 addObject:v25];
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v75 objects:v74 count:16];
        }
        while (v22);
      }
      v26 = v20;
      v27 = obj;
      [obj removeObjectsInArray:v26];
      if (obj && [obj count])
      {
        [obj sortUsingFunction:compareByPref context:v63];
        int v28 = [obj count];
        if (v28 >= 1)
        {
          uint64_t v29 = v28;
          while (1)
          {
            uint64_t v30 = [obj objectAtIndexedSubscript:(v29 - 1)];
            if (v64 >= 1) {
              break;
            }
LABEL_26:
            if (v29-- < 2) {
              goto LABEL_54;
            }
          }
          uint64_t v31 = v30;
          uint64_t v32 = v64 + 1;
          while (1)
          {
            v33 = (void *)[v62 objectAtIndexedSubscript:(v32 - 2)];
            v34 = v33;
            if (a8 || (int v35 = [v33 iWidth], (int)(objc_msgSend(v34, "iHeight") * v35) <= 407040))
            {
              uint64_t v36 = [v34 iWidth];
              uint64_t v37 = [v34 iHeight];
              [v34 fRate];
              if ([v16 supportImage:v31 width:v36 height:v37 rate:(int)v38])break; {
            }
              }
            if (--v32 <= 1) {
              goto LABEL_26;
            }
          }
          a7->var0 = [v34 iWidth];
          a7->var2 = [v34 iWidth];
          a7->var3 = [v34 iHeight];
          a7->var5 = [v34 iHeight];
          [v34 fRate];
          a7->var6 = (int)v58;
          [v34 fPref];
          a7->var7 = v59;
LABEL_54:
          v48 = v66;
          v27 = obj;
          goto LABEL_51;
        }
LABEL_50:
        v48 = v66;
LABEL_51:

        return;
      }
    }
    else
    {
      id v40 = (id)[v16 getVideoSendImages:v18];
      id obja = (id)[MEMORY[0x1E4F1CA48] array];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v41 = v40;
      uint64_t v42 = [v40 countByEnumeratingWithState:&v80 objects:v79 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v81 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v80 + 1) + 8 * j);
            memset(v71, 170, sizeof(v71));
            uint64_t v72 = -1431655766;
            int v73 = -1431655766;
            +[SDPMediaLine fillImageStruct:v46 imageStruct:v71];
            if (v73 != a4) {
              [obja addObject:v46];
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v80 objects:v79 count:16];
        }
        while (v43);
      }
      v27 = v41;
      [v41 removeObjectsInArray:obja];
      if (v41 && [v41 count])
      {
        [v41 sortUsingFunction:compareByPref context:v63];
        unsigned int v47 = [v41 count];
        v48 = v66;
        if (v64 >= 1)
        {
          uint64_t v49 = v47;
          uint64_t v50 = v64;
          do
          {
            uint64_t v51 = v50--;
            v52 = (void *)[v62 objectAtIndexedSubscript:v50];
            uint64_t v53 = v49;
            while ((int)v53 >= 1)
            {
              uint64_t v54 = [v27 objectAtIndexedSubscript:--v53];
              uint64_t v55 = [v52 iWidth];
              uint64_t v56 = [v52 iHeight];
              [v52 fRate];
              if ([v67 supportImage:v54 width:v55 height:v56 rate:(int)v57])
              {
                v65->var0 = [v52 iWidth];
                v65->var2 = [v52 iWidth];
                v65->var3 = [v52 iHeight];
                v65->var5 = [v52 iHeight];
                [v52 fRate];
                v65->var6 = (int)v60;
                [v52 fPref];
                v65->var7 = v61;
                goto LABEL_51;
              }
            }
          }
          while (v51 >= 2);
        }
        goto LABEL_51;
      }
    }
    a7->var2 = 0;
    a7->var5 = 0;
    goto LABEL_50;
  }
}

- (NSString)origin
{
  return self->origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSMutableArray)audioPayloads
{
  return self->audioPayloads;
}

- (NSMutableArray)secondaryAudioPayloads
{
  return self->secondaryAudioPayloads;
}

- (NSString)sessionIP
{
  return self->sessionIP;
}

- (void)setSessionIP:(id)a3
{
}

- (NSNumber)audioRTPPort
{
  return self->audioRTPPort;
}

- (void)setAudioRTPPort:(id)a3
{
}

- (NSNumber)audioRTCPPort
{
  return self->audioRTCPPort;
}

- (void)setAudioRTCPPort:(id)a3
{
}

- (NSNumber)audioRTPID
{
  return self->audioRTPID;
}

- (void)setAudioRTPID:(id)a3
{
}

- (BOOL)allowRTCPFB
{
  return self->allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->allowRTCPFB = a3;
}

- (NSNumber)answerBandwidth
{
  return self->answerBandwidth;
}

- (void)setAnswerBandwidth:(id)a3
{
}

- (NSNumber)maxBandwidth
{
  return self->maxBandwidth;
}

- (void)setMaxBandwidth:(id)a3
{
}

- (BOOL)allowsDynamicMaxBitrate
{
  return self->allowsDynamicMaxBitrate;
}

- (void)setAllowsDynamicMaxBitrate:(BOOL)a3
{
  self->allowsDynamicMaxBitrate = a3;
}

- (NSDictionary)featureListDict
{
  return self->featureListDict;
}

- (void)setFeatureListDict:(id)a3
{
}

- (NSNumber)aacBlockSize
{
  return self->aacBlockSize;
}

- (void)setAacBlockSize:(id)a3
{
}

- (NSNumber)audioUnitModel
{
  return self->audioUnitModel;
}

- (void)setAudioUnitModel:(id)a3
{
}

- (BOOL)allowsContentsChangeWithAspectPreservation
{
  return self->allowsContentsChangeWithAspectPreservation;
}

- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  self->allowsContentsChangeWithAspectPreservation = a3;
}

- (BOOL)allowAudioRecording
{
  return self->allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->allowAudioRecording = a3;
}

- (id)composeBandwidthString
{
  if ([(NSNumber *)self->maxBandwidth intValue] < 1) {
    return 0;
  }
  if ([(NSNumber *)self->answerBandwidth intValue] < 1) {
    return (id)[NSString stringWithFormat:@"AS:%@", self->maxBandwidth, v4];
  }
  return (id)[NSString stringWithFormat:@"AS:%@:%@", self->answerBandwidth, self->maxBandwidth];
}

- (id)composeSessionString
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  [v3 appendFormat:@"%@=0\r\n", @"v"];
  [v3 appendFormat:@"%@=%@ 0 0 IN %@ %@\r\n", @"o", self->origin, @"%RTP-IP-AF%", @"%RTP-IP%"];
  [v3 appendFormat:@"%@=%@\r\n", @"s", -[SDPMini SDPUsername](self, "SDPUsername")];
  [v3 appendFormat:@"%@=IN %@ %@\r\n", @"c", @"%RTP-IP-AF%", @"%RTP-IP%"];
  id v4 = [(SDPMini *)self composeBandwidthString];
  if (v4) {
    [v3 appendFormat:@"%@=%@\r\n", @"b", v4];
  }
  [v3 appendFormat:@"%@=0 0\r\n", @"t"];
  objc_msgSend(v3, "appendString:", -[SDPMini composeFLSString](self, "composeFLSString"));
  if (self->allowsDynamicMaxBitrate) {
    [v3 appendFormat:@"%@=%@\r\n", @"a", @"DMBR"];
  }
  if (self->allowsContentsChangeWithAspectPreservation) {
    [v3 appendFormat:@"%@=%@\r\n", @"a", @"CAP"];
  }
  basebandCodecType = self->basebandCodecType;
  if (basebandCodecType)
  {
    basebandCodecSampleRate = self->basebandCodecSampleRate;
    if (basebandCodecSampleRate) {
      [v3 appendFormat:@"%@=%@:%@:%u\r\n", @"a", @"BBCODEC", basebandCodecType, -[NSNumber unsignedIntValue](basebandCodecSampleRate, "unsignedIntValue")];
    }
  }

  return v3;
}

- (id)composeFLSString
{
  v6[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3D3E450];
  featureListDict = self->featureListDict;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SDPMini_SDPComposing__composeFLSString__block_invoke;
  v6[3] = &unk_1E6DB6628;
  v6[4] = v3;
  [(NSDictionary *)featureListDict enumerateKeysAndObjectsUsingBlock:v6];
  return v3;
}

uint64_t __41__SDPMini_SDPComposing__composeFLSString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 intValue];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5 == 126) {
    return [v6 appendFormat:@"%@=%@\r\n", @"a", a3, v8, v9];
  }
  else {
    return [v6 appendFormat:@"%@=%@:%d %@\r\n", @"a", @"X_FLS", v5, a3];
  }
}

- (id)composeAudioFMTPForPayload:(id)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  if ([(NSMutableArray *)self->secondaryAudioPayloads containsObject:a3]) {
    [v5 addObject:@"sec"];
  }
  objc_msgSend(v5, "addObjectsFromArray:", -[NSMutableDictionary objectForKeyedSubscript:](self->_audioParameters, "objectForKeyedSubscript:", a3));
  uint64_t v6 = (void *)[v5 componentsJoinedByString:@";"];

  return v6;
}

- (id)composeAudioString
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:256];
  [v3 appendFormat:@"%@=audio %@ %@ %@\r\n", @"m", @"%ARTP-PORT%", @"RTP/AVP", -[NSMutableArray componentsJoinedByString:](self->audioPayloads, "componentsJoinedByString:", @" "];
  [v3 appendFormat:@"%@=rtcp:%@\r\n", @"a", @"%ARTCP-PORT%"];
  aacBlockSize = self->aacBlockSize;
  if (aacBlockSize) {
    [v3 appendFormat:@"%@=fmtp:AAC SamplesPerBlock %@\r\n", @"a", aacBlockSize];
  }
  if ([+[VCDefaults sharedInstance] audioRecordingEnabled]&& self->allowAudioRecording)
  {
    [v3 appendFormat:@"%@=allowrecording\r\n", @"a"];
  }
  audioRTPID = self->audioRTPID;
  if (audioRTPID) {
    [v3 appendFormat:@"%@=rtpID:%@\r\n", @"a", audioRTPID];
  }
  audioUnitModel = self->audioUnitModel;
  if (audioUnitModel) {
    [v3 appendFormat:@"%@=au:%@\r\n", @"a", audioUnitModel];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  audioPayloads = self->audioPayloads;
  uint64_t v8 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(audioPayloads);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [(SDPMini *)self composeAudioFMTPForPayload:v12];
        if ([v13 length]) {
          [v3 appendFormat:@"%@=fmtp:%@ %@\r\n", @"a", v12, v13];
        }
      }
      uint64_t v9 = [(NSMutableArray *)audioPayloads countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v9);
  }
  return v3;
}

- (id)parseIP:(id)a3
{
  objc_super v3 = (void *)[a3 componentsSeparatedByString:@" "];
  if ((unint64_t)[v3 count] < 3) {
    return 0;
  }

  return (id)[v3 objectAtIndexedSubscript:2];
}

- (void)parseBandwidth:(id)a3
{
  id v4 = (void *)[a3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), "intValue"));
    [(SDPMini *)self setAnswerBandwidth:v5];
    [(SDPMini *)self setMaxBandwidth:v5];
  }
  if ((unint64_t)[v4 count] >= 3)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2), "intValue"));
    [(SDPMini *)self setMaxBandwidth:v6];
  }
}

- (void)parseMediaLine:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v23 = -1;
  uint64_t v5 = objc_opt_new();
  unsigned int v22 = -1;
  objc_msgSend(a3, "parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:", objc_msgSend(a3, "fieldValue"), &v23, v5, &v22);
  [a3 nextLine];
  if (v23 - 2 < 2)
  {
    uint64_t v6 = [SDPMediaLine alloc];
    uint64_t v7 = [(SDPMediaLine *)v6 initWithParser:a3 rtpPort:v22 payloads:v5];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v5);
            }
            id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            int v21 = -1431655766;
            int v21 = [v13 intValue];
            [(SDPMini *)self setVideoPayloads:&v21 count:1];
          }
          uint64_t v10 = [v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
        }
        while (v10);
      }
      [(SDPMini *)self addMediaLine:v8 mediaType:v23];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[SDPMini(SDPParsing) parseMediaLine:](v20);
      }
    }
LABEL_23:
    id v14 = 0;
    goto LABEL_24;
  }
  if (v23 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[SDPMini(SDPParsing) parseMediaLine:](v19);
      }
    }
    goto LABEL_23;
  }
  -[SDPMini setAudioRTPPort:](self, "setAudioRTPPort:", [NSNumber numberWithInt:v22]);

  self->audioPayloads = (NSMutableArray *)v5;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = 0;
  do
  {
    if ([a3 parsingDone]) {
      break;
    }
    int v16 = [a3 fieldType];
    uint64_t v17 = v15;
    if ((v16 - 1) >= 4)
    {
      if (v16 != 5) {
        break;
      }
      objc_msgSend(v14, "addObject:", objc_msgSend(a3, "fieldValue"));
      LOBYTE(v15) = 0;
      uint64_t v17 = 1;
    }
    char v18 = v15;
    [a3 nextLine];
    uint64_t v15 = v17;
  }
  while ((v18 & 1) == 0);
  if (v23 == 1) {
    [(SDPMini *)self parseAudioMediaAttributes:v14];
  }
LABEL_24:
}

- (void)parseSDPFromString:(id)a3
{
  uint64_t v8 = [[SDPParser alloc] initWithString:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  while (![(SDPParser *)v8 parsingDone])
  {
    int v5 = [(SDPParser *)v8 fieldType];
    if (v5 > 4)
    {
      if (v5 == 5)
      {
        objc_msgSend(v4, "addObject:", -[SDPParser fieldValue](v8, "fieldValue"));
        goto LABEL_12;
      }
      uint64_t v6 = v8;
      if (v5 != 15) {
        goto LABEL_13;
      }
      [(SDPMini *)self parseMediaLine:v8];
    }
    else
    {
      if (v5 == 2)
      {
        uint64_t v7 = (NSString *)[(SDPMini *)self parseIP:[(SDPParser *)v8 fieldValue]];
        uint64_t v6 = v8;
        self->sessionIP = v7;
        goto LABEL_13;
      }
      uint64_t v6 = v8;
      if (v5 != 3) {
        goto LABEL_13;
      }
      [(SDPMini *)self parseBandwidth:[(SDPParser *)v8 fieldValue]];
LABEL_12:
      uint64_t v6 = v8;
LABEL_13:
      [(SDPParser *)v6 nextLine];
    }
  }
  [(SDPMini *)self parseSessionAttributes:v4];
}

- (id)parseRTPID:(id)a3
{
  objc_super v3 = (void *)[a3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v3 count] < 2) {
    return 0;
  }
  id v4 = NSNumber;
  unint64_t v5 = strtoul((const char *)objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "UTF8String"), 0, 10);

  return (id)[v4 numberWithUnsignedLong:v5];
}

- (id)parseRTCPPort:(id)a3
{
  objc_super v3 = (void *)[a3 componentsSeparatedByString:@":"];
  if ((unint64_t)[v3 count] < 2) {
    return 0;
  }
  id v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", @" ");
  if (![v4 count]) {
    return 0;
  }
  unint64_t v5 = NSNumber;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "intValue");

  return (id)[v5 numberWithInt:v6];
}

- (void)parseSessionAttributes:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v38;
    *(void *)&long long v7 = 136315906;
    long long v33 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (!self->allowsDynamicMaxBitrate
          && [*(id *)(*((void *)&v37 + 1) + 8 * i) hasPrefix:@"DMBR"])
        {
          self->allowsDynamicMaxBitrate = 1;
          continue;
        }
        if (objc_msgSend(v11, "hasPrefix:", @"FLS", v33, *(_OWORD *)buf, *(void *)&buf[16], v35))
        {
          if ([(NSDictionary *)v5 objectForKeyedSubscript:&unk_1F3DC4170]) {
            continue;
          }
          uint64_t v12 = v5;
          id v13 = v11;
          id v14 = &unk_1F3DC4170;
          goto LABEL_12;
        }
        if (!self->allowsContentsChangeWithAspectPreservation
          && [v11 hasPrefix:@"CAP"])
        {
          self->allowsContentsChangeWithAspectPreservation = 1;
          continue;
        }
        if ([v11 hasPrefix:@"X_FLS"])
        {
          uint64_t v15 = (void *)[v11 componentsSeparatedByString:@" "];
          int v16 = (void *)[v15 objectAtIndexedSubscript:0];
          uint64_t v17 = [v15 objectAtIndexedSubscript:1];
          uint64_t v18 = [v16 rangeOfString:@":"];
          if (v16) {
            BOOL v19 = v17 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19 || v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v21 = VRTraceErrorLogLevelToCSTR();
              unsigned int v22 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                if (v11) {
                  unsigned int v23 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
                }
                else {
                  unsigned int v23 = "<nil>";
                }
                *(_DWORD *)buf = v33;
                *(void *)&buf[4] = v21;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[SDPMini(SDPParsing) parseSessionAttributes:]";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v35) = 822;
                WORD2(v35) = 2080;
                *(void *)((char *)&v35 + 6) = v23;
                uint64_t v32 = v22;
LABEL_42:
                _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can't parse attribute: %s", buf, 0x26u);
                continue;
              }
            }
          }
          else
          {
            long long v27 = (void *)[v16 substringFromIndex:v18 + 1];
            uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v27, "intValue"));
            if (![(NSDictionary *)v5 objectForKeyedSubscript:v28])
            {
              uint64_t v12 = v5;
              id v13 = (void *)v17;
              id v14 = (void *)v28;
LABEL_12:
              [(NSDictionary *)v12 setObject:v13 forKeyedSubscript:v14];
              continue;
            }
          }
        }
        else
        {
          if (![v11 hasPrefix:@"BBCODEC"]) {
            continue;
          }
          v24 = (void *)[v11 componentsSeparatedByString:@":"];
          if ([v24 count] == 3)
          {
            long long v25 = (void *)[v24 objectAtIndexedSubscript:1];
            long long v26 = (void *)[v24 objectAtIndexedSubscript:2];

            self->basebandCodecType = (NSString *)v25;
            self->basebandCodecSampleRate = (NSNumber *)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v26, "intValue"));
            continue;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v29 = VRTraceErrorLogLevelToCSTR();
            uint64_t v30 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v11) {
                uint64_t v31 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              }
              else {
                uint64_t v31 = "<nil>";
              }
              *(_DWORD *)buf = v33;
              *(void *)&buf[4] = v29;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[SDPMini(SDPParsing) parseSessionAttributes:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v35) = 838;
              WORD2(v35) = 2080;
              *(void *)((char *)&v35 + 6) = v31;
              uint64_t v32 = v30;
              goto LABEL_42;
            }
          }
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v8);
  }
  self->featureListDict = v5;
}

- (void)parseAudioFormatAttribute:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 rangeOfString:@" "];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    long long v7 = objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", v5), "componentsSeparatedByString:", @":");
    if ((unint64_t)[v7 count] >= 2)
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue"));
      if ([(NSMutableArray *)self->audioPayloads containsObject:v8])
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", v6), "componentsSeparatedByString:", @";");
        if ([v9 count])
        {
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v14 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v16;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                if (!objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet")), "caseInsensitiveCompare:", @"sec"))
                {
                  [(NSMutableArray *)self->secondaryAudioPayloads addObject:v8];
                  goto LABEL_15;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v14 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
LABEL_15:
          [(NSMutableDictionary *)self->_audioParameters setObject:v9 forKeyedSubscript:v8];
        }
      }
    }
  }
}

- (void)parseAudioMediaAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    long long v7 = @" ";
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if ([v10 hasPrefix:@"fmtp:AAC SamplesPerBlock"])
        {
          uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "componentsSeparatedByString:", v7), "lastObject");
          -[SDPMini setAacBlockSize:](self, "setAacBlockSize:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "intValue")));
        }
        else if ([v10 hasPrefix:@"au:"])
        {
          uint64_t v12 = (void *)[v10 componentsSeparatedByString:@":"];
          if ((unint64_t)[v12 count] >= 2)
          {
            id v13 = v7;
            id v14 = NSNumber;
            uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "integerValue");
            long long v16 = v14;
            long long v7 = v13;
            -[SDPMini setAudioUnitModel:](self, "setAudioUnitModel:", [v16 numberWithInteger:v15]);
          }
        }
        else if ([v10 hasPrefix:@"rtpID"])
        {
          [(SDPMini *)self setAudioRTPID:[(SDPMini *)self parseRTPID:v10]];
        }
        else if ([v10 hasPrefix:@"rtcp:"])
        {
          [(SDPMini *)self setAudioRTCPPort:[(SDPMini *)self parseRTCPPort:v10]];
        }
        else if ([v10 hasPrefix:@"fmtp:"])
        {
          [(SDPMini *)self parseAudioFormatAttribute:v10];
        }
        else if (!self->allowAudioRecording {
               && [v10 isEqualToString:@"allowrecording"])
        }
        {
          self->allowAudioRecording = 1;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v17 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
      uint64_t v6 = v17;
    }
    while (v17);
  }
}

- (int)rulesFramerate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [(SDPMini *)self getMediaLineForType:2];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"fmtp:%d", v3);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = (void *)[v4 attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if ([v11 hasPrefix:v5])
      {
        uint64_t v12 = (void *)[v11 componentsSeparatedByString:@" "];
        if (v12)
        {
          id v13 = v12;
          if ((unint64_t)[v12 count] >= 5) {
            break;
          }
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        return 10;
      }
    }
    id v14 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 4), "componentsSeparatedByString:", @":");
    if (v14)
    {
      uint64_t v15 = v14;
      if ((unint64_t)[v14 count] >= 3) {
        return objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "intValue");
      }
    }
  }
  return 10;
}

- (void)rulesImageSizeForExternalPayload:(int)a3 pWidth:(int *)a4 pHeight:(int *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = [(SDPMini *)self getMediaLineForType:2];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"fmtp:%d", v7);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = (void *)[v8 attributes];
  uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
      if ([v15 hasPrefix:v9])
      {
        long long v16 = (void *)[v15 componentsSeparatedByString:@" "];
        if (v16)
        {
          uint64_t v17 = v16;
          if ((unint64_t)[v16 count] >= 5) {
            break;
          }
        }
      }
      if (v12 == (void *)++v14)
      {
        uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v20 count:16];
        uint64_t v12 = v11;
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", 4), "componentsSeparatedByString:", @":");
    if (!v11) {
      goto LABEL_17;
    }
    long long v18 = v11;
    if ((unint64_t)[v11 count] < 3)
    {
      LODWORD(v11) = 0;
      goto LABEL_17;
    }
    int v19 = objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", 1), "intValue");
    LODWORD(v11) = objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", 2), "intValue");
    if (a4) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    int v19 = 0;
    if (a4) {
LABEL_18:
    }
      *a4 = v19;
  }
  if (a5) {
    *a5 = (int)v11;
  }
}

- (void)setUseSbr:(BOOL)a3 blockSize:(int)a4 forAACFormat:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if (v7) {
    [v10 addObject:@"sbr"];
  }
  uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"block %u", v6);
  [v10 addObject:v9];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioParameters, "setObject:forKeyedSubscript:", v10, [NSNumber numberWithInt:v5]);
}

- (BOOL)getUseSbr:(BOOL *)a3 blockSize:(int *)a4 forAACFormat:(int)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  BOOL v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioParameters, "objectForKeyedSubscript:", [NSNumber numberWithInt:*(void *)&a5]);
  id v8 = v7;
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet"));
          uint64_t v14 = v13;
          if (a4 && [v13 hasPrefix:@"block "])
          {
            uint64_t v15 = (void *)[v14 substringFromIndex:objc_msgSend(@"block ", "length")];
            if (v15)
            {
              uint64_t v16 = [v15 integerValue];
              if ((unint64_t)(v16 - 1) <= 0x3FF) {
                *a4 = v16;
              }
            }
          }
          else if (a3 && ![v14 caseInsensitiveCompare:@"sbr"])
          {
            *a3 = 1;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return v8 != 0;
}

- (void)setVideoRTCPFB:(BOOL)a3 useNACK:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 || a4)
  {
    if (a3) {
      uint64_t v5 = " rpsi";
    }
    else {
      uint64_t v5 = "";
    }
    id v6 = [(SDPMini *)self getMediaLineForType:2];
    BOOL v7 = " nack";
    if (!v4) {
      BOOL v7 = "";
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"rtcp-fb:*%s%s", v5, v7);
    [v6 addAttribute:v8];
  }
}

@end