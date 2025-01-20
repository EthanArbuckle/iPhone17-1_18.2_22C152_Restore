@interface VCSessionMediaTypeSettings
+ (BOOL)supportsSecureCoding;
+ (id)serializationClasses;
+ (id)settingsWithMediaType:(unsigned int)a3;
- (NSSet)streamGroupIDs;
- (VCSessionMediaTypeSettings)initWithCoder:(id)a3;
- (VCSessionMediaTypeSettings)initWithMediaType:(unsigned int)a3;
- (id)description;
- (unsigned)mediaState;
- (unsigned)mediaType;
- (unsigned)remoteMediaState;
- (void)addStreamGroupID:(unsigned int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaState:(unsigned int)a3;
- (void)setRemoteMediaState:(unsigned int)a3;
@end

@implementation VCSessionMediaTypeSettings

- (VCSessionMediaTypeSettings)initWithMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCSessionMediaTypeSettings;
  v4 = [(VCObject *)&v12 init];
  if (v4)
  {
    -[VCObject setLogPrefix:](v4, "setLogPrefix:", [NSString stringWithFormat:@"mediaType=%@ ", VCSessionMediaType_Name(v3)]);
    v4->_mediaType = v3;
    v4->_mediaState = 0;
    uint64_t v5 = objc_opt_new();
    v4->_streamGroupIDs = (NSMutableSet *)v5;
    if (!v5)
    {
      if ((VCSessionMediaTypeSettings *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaTypeSettings initWithMediaType:](v8, v9);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v7 = (__CFString *)[(VCSessionMediaTypeSettings *)v4 performSelector:sel_logPrefix];
        }
        else {
          v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v10;
            __int16 v15 = 2080;
            v16 = "-[VCSessionMediaTypeSettings initWithMediaType:]";
            __int16 v17 = 1024;
            int v18 = 33;
            __int16 v19 = 2112;
            v20 = v7;
            __int16 v21 = 2048;
            v22 = v4;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the streamGroupID set", buf, 0x30u);
          }
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaTypeSettings;
  [(VCObject *)&v3 dealloc];
}

+ (id)settingsWithMediaType:(unsigned int)a3
{
  objc_super v3 = [[VCSessionMediaTypeSettings alloc] initWithMediaType:*(void *)&a3];

  return v3;
}

- (void)addStreamGroupID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VCObject *)self lock];
  -[NSMutableSet addObject:](self->_streamGroupIDs, "addObject:", [NSNumber numberWithUnsignedInt:v3]);

  [(VCObject *)self unlock];
}

- (NSSet)streamGroupIDs
{
  [(VCObject *)self lock];
  uint64_t v3 = (NSSet *)[MEMORY[0x1E4F1CAD0] setWithSet:self->_streamGroupIDs];
  [(VCObject *)self unlock];
  return v3;
}

- (id)description
{
  uint64_t v3 = VCSessionMediaType_Name(self->_mediaType);
  return (id)[NSString stringWithFormat:@"mediaType=%@ mediaState=%@", v3, VCSessionMediaState_Name(self->_mediaState)];
}

+ (id)serializationClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_mediaType forKey:@"type"];
  [a3 encodeInt32:self->_mediaState forKey:@"state"];
  streamGroupIDs = self->_streamGroupIDs;

  [a3 encodeObject:streamGroupIDs forKey:@"streamGroupIDs"];
}

- (VCSessionMediaTypeSettings)initWithCoder:(id)a3
{
  uint64_t v4 = -[VCSessionMediaTypeSettings initWithMediaType:](self, "initWithMediaType:", [a3 decodeInt32ForKey:@"type"]);
  if (v4)
  {
    v4->_mediaState = [a3 decodeInt32ForKey:@"state"];
    -[NSMutableSet unionSet:](v4->_streamGroupIDs, "unionSet:", [a3 decodeObjectForKey:@"streamGroupIDs"]);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (unsigned)mediaState
{
  return self->_mediaState;
}

- (void)setMediaState:(unsigned int)a3
{
  self->_mediaState = a3;
}

- (unsigned)remoteMediaState
{
  return self->_remoteMediaState;
}

- (void)setRemoteMediaState:(unsigned int)a3
{
  self->_remoteMediaState = a3;
}

- (void)initWithMediaType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCSessionMediaTypeSettings initWithMediaType:]";
  __int16 v6 = 1024;
  int v7 = 33;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate the streamGroupID set", (uint8_t *)&v2, 0x1Cu);
}

@end