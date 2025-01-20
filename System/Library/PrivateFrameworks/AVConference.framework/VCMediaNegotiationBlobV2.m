@interface VCMediaNegotiationBlobV2
+ (Class)streamGroupsType;
- (BOOL)hasBandwidthSettings;
- (BOOL)hasCameraU1;
- (BOOL)hasCodecSupport;
- (BOOL)hasGeneralInfo;
- (BOOL)hasMicrophoneU1;
- (BOOL)hasMomentsSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)streamGroups;
- (VCMediaNegotiationBlobV2BandwidthSettings)bandwidthSettings;
- (VCMediaNegotiationBlobV2CameraSettingsU1)cameraU1;
- (VCMediaNegotiationBlobV2CodecFeatures)codecSupport;
- (VCMediaNegotiationBlobV2GeneralInfo)generalInfo;
- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)microphoneU1;
- (VCMediaNegotiationBlobV2MomentsSettings)momentsSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)streamGroupsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)streamGroupsCount;
- (void)addStreamGroups:(id)a3;
- (void)clearStreamGroups;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithTitle:(id)a3 logFile:(void *)a4;
- (void)setBandwidthSettings:(id)a3;
- (void)setCameraU1:(id)a3;
- (void)setCodecSupport:(id)a3;
- (void)setGeneralInfo:(id)a3;
- (void)setMicrophoneU1:(id)a3;
- (void)setMomentsSettings:(id)a3;
- (void)setStreamGroups:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2 *)self setGeneralInfo:0];
  [(VCMediaNegotiationBlobV2 *)self setBandwidthSettings:0];
  [(VCMediaNegotiationBlobV2 *)self setCodecSupport:0];
  [(VCMediaNegotiationBlobV2 *)self setMicrophoneU1:0];
  [(VCMediaNegotiationBlobV2 *)self setCameraU1:0];
  [(VCMediaNegotiationBlobV2 *)self setMomentsSettings:0];
  [(VCMediaNegotiationBlobV2 *)self setStreamGroups:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2;
  [(VCMediaNegotiationBlobV2 *)&v3 dealloc];
}

- (BOOL)hasGeneralInfo
{
  return self->_generalInfo != 0;
}

- (BOOL)hasBandwidthSettings
{
  return self->_bandwidthSettings != 0;
}

- (BOOL)hasCodecSupport
{
  return self->_codecSupport != 0;
}

- (BOOL)hasMicrophoneU1
{
  return self->_microphoneU1 != 0;
}

- (BOOL)hasCameraU1
{
  return self->_cameraU1 != 0;
}

- (BOOL)hasMomentsSettings
{
  return self->_momentsSettings != 0;
}

- (void)clearStreamGroups
{
}

- (void)addStreamGroups:(id)a3
{
  streamGroups = self->_streamGroups;
  if (!streamGroups)
  {
    streamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_streamGroups = streamGroups;
  }

  [(NSMutableArray *)streamGroups addObject:a3];
}

- (unint64_t)streamGroupsCount
{
  return [(NSMutableArray *)self->_streamGroups count];
}

- (id)streamGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_streamGroups objectAtIndex:a3];
}

+ (Class)streamGroupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2 description](&v3, sel_description), -[VCMediaNegotiationBlobV2 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  generalInfo = self->_generalInfo;
  if (generalInfo) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2GeneralInfo dictionaryRepresentation](generalInfo, "dictionaryRepresentation"), @"generalInfo");
  }
  bandwidthSettings = self->_bandwidthSettings;
  if (bandwidthSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2BandwidthSettings dictionaryRepresentation](bandwidthSettings, "dictionaryRepresentation"), @"bandwidthSettings");
  }
  codecSupport = self->_codecSupport;
  if (codecSupport) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2CodecFeatures dictionaryRepresentation](codecSupport, "dictionaryRepresentation"), @"codecSupport");
  }
  microphoneU1 = self->_microphoneU1;
  if (microphoneU1) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 dictionaryRepresentation](microphoneU1, "dictionaryRepresentation"), @"microphoneU1");
  }
  cameraU1 = self->_cameraU1;
  if (cameraU1) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2CameraSettingsU1 dictionaryRepresentation](cameraU1, "dictionaryRepresentation"), @"cameraU1");
  }
  momentsSettings = self->_momentsSettings;
  if (momentsSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2MomentsSettings dictionaryRepresentation](momentsSettings, "dictionaryRepresentation"), @"momentsSettings");
  }
  if ([(NSMutableArray *)self->_streamGroups count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_streamGroups, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    streamGroups = self->_streamGroups;
    uint64_t v12 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(streamGroups);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"streamGroups"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2ReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_generalInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_bandwidthSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_codecSupport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_microphoneU1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cameraU1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_momentsSettings) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  streamGroups = self->_streamGroups;
  uint64_t v5 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(streamGroups);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_generalInfo) {
    objc_msgSend(a3, "setGeneralInfo:");
  }
  if (self->_bandwidthSettings) {
    objc_msgSend(a3, "setBandwidthSettings:");
  }
  if (self->_codecSupport) {
    objc_msgSend(a3, "setCodecSupport:");
  }
  if (self->_microphoneU1) {
    objc_msgSend(a3, "setMicrophoneU1:");
  }
  if (self->_cameraU1) {
    objc_msgSend(a3, "setCameraU1:");
  }
  if (self->_momentsSettings) {
    objc_msgSend(a3, "setMomentsSettings:");
  }
  if ([(VCMediaNegotiationBlobV2 *)self streamGroupsCount])
  {
    [a3 clearStreamGroups];
    unint64_t v5 = [(VCMediaNegotiationBlobV2 *)self streamGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addStreamGroups:", -[VCMediaNegotiationBlobV2 streamGroupsAtIndex:](self, "streamGroupsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[4] = [(VCMediaNegotiationBlobV2GeneralInfo *)self->_generalInfo copyWithZone:a3];
  v5[1] = [(VCMediaNegotiationBlobV2BandwidthSettings *)self->_bandwidthSettings copyWithZone:a3];

  v5[3] = [(VCMediaNegotiationBlobV2CodecFeatures *)self->_codecSupport copyWithZone:a3];
  v5[5] = [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self->_microphoneU1 copyWithZone:a3];

  v5[2] = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self->_cameraU1 copyWithZone:a3];
  v5[6] = [(VCMediaNegotiationBlobV2MomentsSettings *)self->_momentsSettings copyWithZone:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  streamGroups = self->_streamGroups;
  uint64_t v7 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(streamGroups);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addStreamGroups:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)streamGroups countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    generalInfo = self->_generalInfo;
    if (!((unint64_t)generalInfo | *((void *)a3 + 4))
      || (int v5 = -[VCMediaNegotiationBlobV2GeneralInfo isEqual:](generalInfo, "isEqual:")) != 0)
    {
      bandwidthSettings = self->_bandwidthSettings;
      if (!((unint64_t)bandwidthSettings | *((void *)a3 + 1))
        || (int v5 = -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) isEqual:](bandwidthSettings, "isEqual:")) != 0)
      {
        codecSupport = self->_codecSupport;
        if (!((unint64_t)codecSupport | *((void *)a3 + 3))
          || (int v5 = -[VCMediaNegotiationBlobV2CodecFeatures isEqual:](codecSupport, "isEqual:")) != 0)
        {
          microphoneU1 = self->_microphoneU1;
          if (!((unint64_t)microphoneU1 | *((void *)a3 + 5))
            || (int v5 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 isEqual:](microphoneU1, "isEqual:")) != 0)
          {
            cameraU1 = self->_cameraU1;
            if (!((unint64_t)cameraU1 | *((void *)a3 + 2))
              || (int v5 = -[VCMediaNegotiationBlobV2CameraSettingsU1 isEqual:](cameraU1, "isEqual:")) != 0)
            {
              momentsSettings = self->_momentsSettings;
              if (!((unint64_t)momentsSettings | *((void *)a3 + 6))
                || (int v5 = -[VCMediaNegotiationBlobV2MomentsSettings isEqual:](momentsSettings, "isEqual:")) != 0)
              {
                streamGroups = self->_streamGroups;
                if ((unint64_t)streamGroups | *((void *)a3 + 7))
                {
                  LOBYTE(v5) = -[NSMutableArray isEqual:](streamGroups, "isEqual:");
                }
                else
                {
                  LOBYTE(v5) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCMediaNegotiationBlobV2GeneralInfo *)self->_generalInfo hash];
  unint64_t v4 = [(VCMediaNegotiationBlobV2BandwidthSettings *)self->_bandwidthSettings hash] ^ v3;
  unint64_t v5 = [(VCMediaNegotiationBlobV2CodecFeatures *)self->_codecSupport hash];
  unint64_t v6 = v4 ^ v5 ^ [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self->_microphoneU1 hash];
  unint64_t v7 = [(VCMediaNegotiationBlobV2CameraSettingsU1 *)self->_cameraU1 hash];
  unint64_t v8 = v7 ^ [(VCMediaNegotiationBlobV2MomentsSettings *)self->_momentsSettings hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_streamGroups hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  generalInfo = self->_generalInfo;
  uint64_t v6 = *((void *)a3 + 4);
  if (generalInfo)
  {
    if (v6) {
      -[VCMediaNegotiationBlobV2GeneralInfo mergeFrom:](generalInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCMediaNegotiationBlobV2 setGeneralInfo:](self, "setGeneralInfo:");
  }
  bandwidthSettings = self->_bandwidthSettings;
  uint64_t v8 = *((void *)a3 + 1);
  if (bandwidthSettings)
  {
    if (v8) {
      -[VCMediaNegotiationBlobV2BandwidthSettings mergeFrom:](bandwidthSettings, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[VCMediaNegotiationBlobV2 setBandwidthSettings:](self, "setBandwidthSettings:");
  }
  codecSupport = self->_codecSupport;
  uint64_t v10 = *((void *)a3 + 3);
  if (codecSupport)
  {
    if (v10) {
      -[VCMediaNegotiationBlobV2CodecFeatures mergeFrom:](codecSupport, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[VCMediaNegotiationBlobV2 setCodecSupport:](self, "setCodecSupport:");
  }
  microphoneU1 = self->_microphoneU1;
  uint64_t v12 = *((void *)a3 + 5);
  if (microphoneU1)
  {
    if (v12) {
      -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 mergeFrom:](microphoneU1, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[VCMediaNegotiationBlobV2 setMicrophoneU1:](self, "setMicrophoneU1:");
  }
  cameraU1 = self->_cameraU1;
  uint64_t v14 = *((void *)a3 + 2);
  if (cameraU1)
  {
    if (v14) {
      -[VCMediaNegotiationBlobV2CameraSettingsU1 mergeFrom:](cameraU1, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[VCMediaNegotiationBlobV2 setCameraU1:](self, "setCameraU1:");
  }
  momentsSettings = self->_momentsSettings;
  uint64_t v16 = *((void *)a3 + 6);
  if (momentsSettings)
  {
    if (v16) {
      -[VCMediaNegotiationBlobV2MomentsSettings mergeFrom:](momentsSettings, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[VCMediaNegotiationBlobV2 setMomentsSettings:](self, "setMomentsSettings:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v17 = (void *)*((void *)a3 + 7);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        [(VCMediaNegotiationBlobV2 *)self addStreamGroups:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v19);
  }
}

- (VCMediaNegotiationBlobV2GeneralInfo)generalInfo
{
  return self->_generalInfo;
}

- (void)setGeneralInfo:(id)a3
{
}

- (VCMediaNegotiationBlobV2BandwidthSettings)bandwidthSettings
{
  return self->_bandwidthSettings;
}

- (void)setBandwidthSettings:(id)a3
{
}

- (VCMediaNegotiationBlobV2CodecFeatures)codecSupport
{
  return self->_codecSupport;
}

- (void)setCodecSupport:(id)a3
{
}

- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)microphoneU1
{
  return self->_microphoneU1;
}

- (void)setMicrophoneU1:(id)a3
{
}

- (VCMediaNegotiationBlobV2CameraSettingsU1)cameraU1
{
  return self->_cameraU1;
}

- (void)setCameraU1:(id)a3
{
}

- (VCMediaNegotiationBlobV2MomentsSettings)momentsSettings
{
  return self->_momentsSettings;
}

- (void)setMomentsSettings:(id)a3
{
}

- (NSMutableArray)streamGroups
{
  return self->_streamGroups;
}

- (void)setStreamGroups:(id)a3
{
}

- (void)printWithTitle:(id)a3 logFile:(void *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[NSString stringWithFormat:@"%@ (size=%lu):", a3, objc_msgSend((id)-[VCMediaNegotiationBlobV2 data](self, "data"), "length")];
  char v7 = [v6 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a4, "Media Blob (v2) - %s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v14;
      __int16 v30 = 2080;
      v31 = "-[VCMediaNegotiationBlobV2(Utils) printWithTitle:logFile:]";
      __int16 v32 = 1024;
      int v33 = 20;
      __int16 v34 = 2080;
      uint64_t v35 = [v6 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob (v2) - %s", buf, 0x26u);
    }
  }
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s  ", "Media Blob (v2) - ");
  if ([(VCMediaNegotiationBlobV2 *)self hasGeneralInfo]) {
    [(VCMediaNegotiationBlobV2GeneralInfo *)self->_generalInfo printWithLogFile:a4 prefix:v16];
  }
  if ([(VCMediaNegotiationBlobV2 *)self hasBandwidthSettings]) {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self->_bandwidthSettings printWithLogFile:a4 prefix:v16];
  }
  if ([(VCMediaNegotiationBlobV2 *)self hasCodecSupport]) {
    [(VCMediaNegotiationBlobV2CodecFeatures *)self->_codecSupport printWithLogFile:a4 prefix:v16];
  }
  if ([(VCMediaNegotiationBlobV2 *)self hasMicrophoneU1]) {
    [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self->_microphoneU1 printWithLogFile:a4 prefix:v16];
  }
  if ([(VCMediaNegotiationBlobV2 *)self hasCameraU1])
  {
    cameraU1 = self->_cameraU1;
    [(VCMediaNegotiationBlobV2GeneralInfo *)self->_generalInfo screenResolution];
    -[VCMediaNegotiationBlobV2CameraSettingsU1 printWithLogFile:prefix:screenSize:](cameraU1, "printWithLogFile:prefix:screenSize:", a4, v16);
  }
  if ([(VCMediaNegotiationBlobV2 *)self hasMomentsSettings]) {
    [(VCMediaNegotiationBlobV2MomentsSettings *)self->_momentsSettings printWithLogFile:a4 prefix:v16];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = [(VCMediaNegotiationBlobV2 *)self streamGroups];
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v22++) printWithLogFile:a4 prefix:v16];
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v20);
  }
}

@end