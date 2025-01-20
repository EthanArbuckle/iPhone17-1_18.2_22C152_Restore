@interface CPParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)_isLocal;
- (BOOL)_isNearby;
- (BOOL)_isSpectator;
- (BOOL)isAudioEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToParticipant:(id)a3;
- (BOOL)isScreenEnabled;
- (BOOL)isVideoEnabled;
- (CPParticipant)initWithAccountIdentifier:(id)a3;
- (CPParticipant)initWithCoder:(id)a3;
- (CPParticipant)initWithUUID:(id)a3 accountIdentifier:(id)a4;
- (NSDictionary)avcStreams;
- (NSDictionary)userContext;
- (NSString)accountIdentifier;
- (NSUUID)UUID;
- (id)_localStatusDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)audioToken;
- (int64_t)screenToken;
- (int64_t)streamToken;
- (unint64_t)hash;
- (unint64_t)participantID;
- (unint64_t)participantIdentifier;
- (unint64_t)spatialAudioSourceID;
- (unint64_t)spatialAudioSourceIdentifier;
- (unsigned)localStatus;
- (void)_setAVCStreams:(id)a3;
- (void)_setAudioToken:(int64_t)a3;
- (void)_setLocalStatus:(unsigned __int8)a3;
- (void)_setParticipantID:(int64_t)a3;
- (void)_setParticipantIdentifier:(unint64_t)a3;
- (void)_setSpatialAudioSourceId:(unint64_t)a3;
- (void)_setSpatialAudioSourceIdentifier:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setScreenToken:(int64_t)a3;
- (void)setStreamToken:(int64_t)a3;
- (void)setUserContext:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation CPParticipant

- (CPParticipant)initWithAccountIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [(CPParticipant *)self initWithUUID:v6 accountIdentifier:v5];

  return v7;
}

- (CPParticipant)initWithUUID:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPParticipant;
  v9 = [(CPParticipant *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_UUID, a3);
    objc_storeStrong((id *)&v10->_accountIdentifier, a4);
    *(_OWORD *)&v10->_audioToken = xmmword_1B1138A20;
  }

  return v10;
}

- (unint64_t)spatialAudioSourceID
{
  return self->_spatialAudioSourceIdentifier;
}

- (void)_setSpatialAudioSourceId:(unint64_t)a3
{
  self->_spatialAudioSourceIdentifier = a3;
}

- (unint64_t)participantID
{
  return self->_participantIdentifier;
}

- (void)_setParticipantID:(int64_t)a3
{
  self->_participantIdentifier = a3;
}

- (void)_setAVCStreams:(id)a3
{
}

- (void)_setAudioToken:(int64_t)a3
{
  self->_audioToken = a3;
}

- (void)_setLocalStatus:(unsigned __int8)a3
{
  self->_localStatus = a3;
}

- (id)_localStatusDescription
{
  unsigned int v2 = [(CPParticipant *)self localStatus];
  if (v2 > 3) {
    return @"<unknown>";
  }
  else {
    return off_1E5FF1AC0[(char)v2];
  }
}

- (BOOL)_isNearby
{
  return self->_localStatus == 3;
}

- (BOOL)_isLocal
{
  return self->_localStatus == 1;
}

- (BOOL)_isSpectator
{
  return self->_localStatus == 2;
}

- (unsigned)localStatus
{
  return self->_localStatus;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  id v7 = [(CPParticipant *)self UUID];
  [v6 appendFormat:@" UUID=%@", v7];

  id v8 = [(CPParticipant *)self accountIdentifier];
  [v6 appendFormat:@" accountIdentifier=%@", v8];

  objc_msgSend(v6, "appendFormat:", @" participantID=%llu", -[CPParticipant participantIdentifier](self, "participantIdentifier"));
  objc_msgSend(v6, "appendFormat:", @" streamToken=%ld", -[CPParticipant streamToken](self, "streamToken"));
  objc_msgSend(v6, "appendFormat:", @" screenToken=%ld", -[CPParticipant screenToken](self, "screenToken"));
  objc_msgSend(v6, "appendFormat:", @" isVideoEnabled=%d", -[CPParticipant isVideoEnabled](self, "isVideoEnabled"));
  objc_msgSend(v6, "appendFormat:", @" isScreenEnabled=%d", -[CPParticipant isScreenEnabled](self, "isScreenEnabled"));
  objc_msgSend(v6, "appendFormat:", @" spatialAudioSourceIdentifier=%llu", -[CPParticipant spatialAudioSourceIdentifier](self, "spatialAudioSourceIdentifier"));
  objc_msgSend(v6, "appendFormat:", @" localStatus=%d", -[CPParticipant localStatus](self, "localStatus"));
  v9 = [(CPParticipant *)self avcStreams];
  [v6 appendFormat:@" avcStreams=%@", v9];

  [v6 appendString:@">"];
  v10 = (void *)[v6 copy];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CPParticipant *)self isEquivalentToParticipant:v4];

  return v5;
}

- (BOOL)isEquivalentToParticipant:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPParticipant *)self accountIdentifier];
  v6 = [v4 accountIdentifier];
  if ([v5 isEqual:v6])
  {
    unint64_t v7 = [(CPParticipant *)self participantIdentifier];
    BOOL v8 = v7 == [v4 participantIdentifier];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(CPParticipant *)self accountIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(CPParticipant *)self participantIdentifier] ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_UUID);
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_accountIdentifier);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  v11 = [(CPParticipant *)self initWithUUID:v7 accountIdentifier:v10];
  if (v11)
  {
    objc_super v12 = NSStringFromSelector(sel_participantIdentifier);
    v11->_participantIdentifier = [v4 decodeInt64ForKey:v12];

    v13 = NSStringFromSelector(sel_spatialAudioSourceIdentifier);
    v11->_spatialAudioSourceIdentifier = [v4 decodeInt64ForKey:v13];

    v14 = NSStringFromSelector(sel_localStatus);
    v11->_localStatus = [v4 decodeInt32ForKey:v14];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v19 = NSStringFromSelector(sel_userContext);
    uint64_t v20 = [v4 decodeObjectOfClasses:v18 forKey:v19];
    userContext = v11->_userContext;
    v11->_userContext = (NSDictionary *)v20;

    v22 = NSStringFromSelector(sel_avcStreams);
    uint64_t v23 = [v4 decodeObjectOfClasses:v18 forKey:v22];
    avcStreams = v11->_avcStreams;
    v11->_avcStreams = (NSDictionary *)v23;

    v25 = NSStringFromSelector(sel_audioToken);
    v11->_audioToken = [v4 decodeIntegerForKey:v25];

    v26 = NSStringFromSelector(sel_streamToken);
    v11->_streamToken = [v4 decodeIntegerForKey:v26];

    v27 = NSStringFromSelector(sel_screenToken);
    v11->_screenToken = [v4 decodeIntegerForKey:v27];

    v28 = NSStringFromSelector(sel_isAudioEnabled);
    v11->_audioEnabled = [v4 decodeBoolForKey:v28];

    v29 = NSStringFromSelector(sel_isVideoEnabled);
    v11->_videoEnabled = [v4 decodeBoolForKey:v29];

    v30 = NSStringFromSelector(sel_isScreenEnabled);
    v11->_screenEnabled = [v4 decodeBoolForKey:v30];
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_UUID);
  [v5 encodeObject:UUID forKey:v6];

  accountIdentifier = self->_accountIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_accountIdentifier);
  [v5 encodeObject:accountIdentifier forKey:v8];

  unint64_t participantIdentifier = self->_participantIdentifier;
  v10 = NSStringFromSelector(sel_participantIdentifier);
  [v5 encodeInt64:participantIdentifier forKey:v10];

  unint64_t spatialAudioSourceIdentifier = self->_spatialAudioSourceIdentifier;
  objc_super v12 = NSStringFromSelector(sel_spatialAudioSourceIdentifier);
  [v5 encodeInt64:spatialAudioSourceIdentifier forKey:v12];

  uint64_t localStatus = self->_localStatus;
  v14 = NSStringFromSelector(sel_localStatus);
  [v5 encodeInt32:localStatus forKey:v14];

  v15 = [(CPParticipant *)self userContext];
  uint64_t v16 = NSStringFromSelector(sel_userContext);
  [v5 encodeObject:v15 forKey:v16];

  uint64_t v17 = [(CPParticipant *)self avcStreams];
  v18 = NSStringFromSelector(sel_avcStreams);
  [v5 encodeObject:v17 forKey:v18];

  int64_t v19 = [(CPParticipant *)self audioToken];
  uint64_t v20 = NSStringFromSelector(sel_audioToken);
  [v5 encodeInteger:v19 forKey:v20];

  int64_t v21 = [(CPParticipant *)self streamToken];
  v22 = NSStringFromSelector(sel_streamToken);
  [v5 encodeInteger:v21 forKey:v22];

  int64_t v23 = [(CPParticipant *)self screenToken];
  v24 = NSStringFromSelector(sel_screenToken);
  [v5 encodeInteger:v23 forKey:v24];

  BOOL v25 = [(CPParticipant *)self isAudioEnabled];
  v26 = NSStringFromSelector(sel_isAudioEnabled);
  [v5 encodeBool:v25 forKey:v26];

  BOOL v27 = [(CPParticipant *)self isVideoEnabled];
  v28 = NSStringFromSelector(sel_isVideoEnabled);
  [v5 encodeBool:v27 forKey:v28];

  BOOL v29 = [(CPParticipant *)self isScreenEnabled];
  NSStringFromSelector(sel_isScreenEnabled);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:v29 forKey:v30];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[CPParticipant alloc] initWithUUID:self->_UUID accountIdentifier:self->_accountIdentifier];
  v4->_unint64_t participantIdentifier = self->_participantIdentifier;
  uint64_t v5 = [(NSDictionary *)self->_userContext copy];
  userContext = v4->_userContext;
  v4->_userContext = (NSDictionary *)v5;

  v4->_unint64_t spatialAudioSourceIdentifier = self->_spatialAudioSourceIdentifier;
  v4->_uint64_t localStatus = self->_localStatus;
  objc_storeStrong((id *)&v4->_avcStreams, self->_avcStreams);
  v4->_audioToken = self->_audioToken;
  v4->_streamToken = self->_streamToken;
  v4->_screenToken = self->_screenToken;
  v4->_audioEnabled = self->_audioEnabled;
  v4->_videoEnabled = self->_videoEnabled;
  v4->_screenEnabled = self->_screenEnabled;
  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)_setParticipantIdentifier:(unint64_t)a3
{
  self->_unint64_t participantIdentifier = a3;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (void)setScreenEnabled:(BOOL)a3
{
  self->_screenEnabled = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)setStreamToken:(int64_t)a3
{
  self->_streamToken = a3;
}

- (int64_t)screenToken
{
  return self->_screenToken;
}

- (void)setScreenToken:(int64_t)a3
{
  self->_screenToken = a3;
}

- (NSDictionary)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSDictionary)avcStreams
{
  return self->_avcStreams;
}

- (int64_t)audioToken
{
  return self->_audioToken;
}

- (unint64_t)spatialAudioSourceIdentifier
{
  return self->_spatialAudioSourceIdentifier;
}

- (void)_setSpatialAudioSourceIdentifier:(unint64_t)a3
{
  self->_unint64_t spatialAudioSourceIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avcStreams, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end