@interface VCCapabilities
+ (id)AudioOnlyVCCapabilities;
+ (id)DataOnlyVCCapabilities;
+ (id)VideoOnlyVCCapabilities;
+ (id)screenSharingVCCapabilities;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPausedToStart;
- (BOOL)isDTLSEnabled;
- (BOOL)isDuplexAudioOnly;
- (BOOL)isDuplexVideoOnly;
- (BOOL)isHalfDuplexAudio;
- (BOOL)isKeyExchangeEnabled;
- (BOOL)isRelayEnabled;
- (BOOL)isRelayForced;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPausedToStart;
- (BOOL)isVideoSourceScreen;
- (BOOL)requiresWifi;
- (VCCapabilities)init;
- (VCCapabilities)initWithCoder:(id)a3;
- (VCCapabilities)initWithEncodedDictionary:(id)a3;
- (id)description;
- (id)newEncodedDictionary;
- (int)deviceRole;
- (unsigned)actualAudioCodec;
- (unsigned)actualVideoCodec;
- (unsigned)preferredAudioCodec;
- (unsigned)preferredVideoCodec;
- (void)decodeFromNSDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActualAudioCodec:(unsigned int)a3;
- (void)setActualVideoCodec:(unsigned int)a3;
- (void)setDeviceRole:(int)a3;
- (void)setIsAudioEnabled:(BOOL)a3;
- (void)setIsAudioPausedToStart:(BOOL)a3;
- (void)setIsDTLSEnabled:(BOOL)a3;
- (void)setIsDuplexAudioOnly:(BOOL)a3;
- (void)setIsDuplexVideoOnly:(BOOL)a3;
- (void)setIsHalfDuplexAudio:(BOOL)a3;
- (void)setIsKeyExchangeEnabled:(BOOL)a3;
- (void)setIsRelayEnabled:(BOOL)a3;
- (void)setIsRelayForced:(BOOL)a3;
- (void)setIsVideoEnabled:(BOOL)a3;
- (void)setIsVideoPausedToStart:(BOOL)a3;
- (void)setIsVideoSourceScreen:(BOOL)a3;
- (void)setPreferredAudioCodec:(unsigned int)a3;
- (void)setPreferredVideoCodec:(unsigned int)a3;
- (void)setRequiresWifi:(BOOL)a3;
@end

@implementation VCCapabilities

+ (id)DataOnlyVCCapabilities
{
  v2 = objc_alloc_init(VCCapabilities);
  [(VCCapabilities *)v2 setIsAudioEnabled:0];
  [(VCCapabilities *)v2 setIsVideoEnabled:0];
  [(VCCapabilities *)v2 setIsDuplexAudioOnly:0];
  [(VCCapabilities *)v2 setIsDuplexVideoOnly:1];
  [(VCCapabilities *)v2 setIsVideoPausedToStart:0];
  return v2;
}

+ (id)AudioOnlyVCCapabilities
{
  v2 = objc_alloc_init(VCCapabilities);
  [(VCCapabilities *)v2 setIsAudioEnabled:1];
  [(VCCapabilities *)v2 setIsVideoEnabled:0];
  [(VCCapabilities *)v2 setIsDuplexAudioOnly:1];
  [(VCCapabilities *)v2 setIsDuplexVideoOnly:0];
  [(VCCapabilities *)v2 setIsVideoPausedToStart:0];
  return v2;
}

+ (id)VideoOnlyVCCapabilities
{
  v2 = objc_alloc_init(VCCapabilities);
  [(VCCapabilities *)v2 setIsAudioEnabled:1];
  [(VCCapabilities *)v2 setIsVideoEnabled:1];
  [(VCCapabilities *)v2 setIsDuplexAudioOnly:0];
  [(VCCapabilities *)v2 setIsDuplexVideoOnly:1];
  [(VCCapabilities *)v2 setIsVideoPausedToStart:0];
  return v2;
}

+ (id)screenSharingVCCapabilities
{
  v2 = objc_alloc_init(VCCapabilities);
  [(VCCapabilities *)v2 setIsAudioEnabled:1];
  [(VCCapabilities *)v2 setIsVideoEnabled:1];
  [(VCCapabilities *)v2 setIsVideoSourceScreen:1];
  [(VCCapabilities *)v2 setIsDuplexAudioOnly:0];
  [(VCCapabilities *)v2 setIsDuplexVideoOnly:1];
  [(VCCapabilities *)v2 setIsVideoPausedToStart:0];
  [(VCCapabilities *)v2 setDeviceRole:5];
  return v2;
}

- (VCCapabilities)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCapabilities;
  result = [(VCCapabilities *)&v3 init];
  if (result)
  {
    result->isAudioEnabled = 1;
    *(_DWORD *)&result->isAudioPausedToStart = 0;
    *(_WORD *)&result->isDuplexAudioOnly = 0;
    *(_OWORD *)&result->preferredAudioCodec = xmmword_1E259FF80;
    *(_DWORD *)&result->isKeyExchangeEnabled = 16777472;
    result->isDTLSEnabled = 0;
    result->deviceRole = 0;
  }
  return result;
}

- (VCCapabilities)initWithEncodedDictionary:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCCapabilities;
  uint64_t v4 = [(VCCapabilities *)&v6 init];
  [(VCCapabilities *)v4 decodeFromNSDictionary:a3];
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{VCCapabilities: isAudioEnabled = %d, isAudioPausedToStart = %d, isVideoEnabled = %d, isVideoPausedToStart = %d, isVideoSourceScreen = %d, isDuplexAudioOnly = %d, isDuplexVideoOnly = %d, isHalfDuplexAudio = %d, isKeyExchangeEnabled = %d, isRelayEnabled = %d, isRelayForced = %d, requiresWifi = %d, isDTLSEnabled = %d, preferredAudioCodec = %u, actualAudioCodec = %u, preferredVideoCodec = %u, actualVideoCodec = %u, deviceRole = %d}", self->isAudioEnabled, self->isAudioPausedToStart, self->isVideoEnabled, self->isVideoPausedToStart, self->isVideoSourceScreen, self->isDuplexAudioOnly, self->isDuplexVideoOnly, self->isHalfDuplexAudio, self->isKeyExchangeEnabled, self->isRelayEnabled, self->isRelayForced, self->requiresWifi, self->isDTLSEnabled, self->preferredAudioCodec, self->actualAudioCodec, self->preferredVideoCodec,
               self->actualVideoCodec,
               self->deviceRole);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->isAudioEnabled forKey:@"audioEnabled"];
  [a3 encodeBool:self->isVideoEnabled forKey:@"videoEnabled"];
  [a3 encodeBool:self->isVideoSourceScreen forKey:@"videoSourceScreen"];
  [a3 encodeBool:self->isDuplexAudioOnly forKey:@"duplexAudioOnly"];
  [a3 encodeBool:self->isDuplexVideoOnly forKey:@"duplexVideoOnly"];
  [a3 encodeBool:self->isHalfDuplexAudio forKey:@"halfDuplexAudio"];
  [a3 encodeBool:self->isKeyExchangeEnabled forKey:@"keyExchangeEnabled"];
  [a3 encodeBool:self->isAudioPausedToStart forKey:@"startAudioPaused"];
  [a3 encodeBool:self->isVideoPausedToStart forKey:@"startVideoPaused"];
  [a3 encodeInt:self->preferredAudioCodec forKey:@"preferredAudioCodec"];
  [a3 encodeInt:self->actualAudioCodec forKey:@"actualAudioCodec"];
  [a3 encodeInt:self->preferredVideoCodec forKey:@"preferredVideoCodec"];
  [a3 encodeInt:self->actualVideoCodec forKey:@"actualVideoCodec"];
  [a3 encodeInt:self->deviceRole forKey:@"deviceRole"];
  [a3 encodeBool:self->isRelayEnabled forKey:@"relayEnabled"];
  [a3 encodeBool:self->isRelayForced forKey:@"relayForced"];
  [a3 encodeBool:self->requiresWifi forKey:@"requiresWifi"];
  BOOL isDTLSEnabled = self->isDTLSEnabled;

  [a3 encodeBool:isDTLSEnabled forKey:@"DTLSEnabled"];
}

- (VCCapabilities)initWithCoder:(id)a3
{
  self->isAudioEnabled = [a3 decodeBoolForKey:@"audioEnabled"];
  self->isVideoEnabled = [a3 decodeBoolForKey:@"videoEnabled"];
  self->isVideoSourceScreen = [a3 decodeBoolForKey:@"videoSourceScreen"];
  self->isDuplexAudioOnly = [a3 decodeBoolForKey:@"duplexAudioOnly"];
  self->isDuplexVideoOnly = [a3 decodeBoolForKey:@"duplexVideoOnly"];
  self->isHalfDuplexAudio = [a3 decodeBoolForKey:@"halfDuplexAudio"];
  self->isKeyExchangeEnabled = [a3 decodeBoolForKey:@"keyExchangeEnabled"];
  self->isAudioPausedToStart = [a3 decodeBoolForKey:@"startAudioPaused"];
  self->isVideoPausedToStart = [a3 decodeBoolForKey:@"startVideoPaused"];
  self->preferredAudioCodec = [a3 decodeIntForKey:@"preferredAudioCodec"];
  self->actualAudioCodec = [a3 decodeIntForKey:@"actualAudioCodec"];
  self->preferredVideoCodec = [a3 decodeIntForKey:@"preferredVideoCodec"];
  self->actualVideoCodec = [a3 decodeIntForKey:@"actualVideoCodec"];
  self->deviceRole = [a3 decodeIntForKey:@"deviceRole"];
  self->isRelayEnabled = [a3 decodeBoolForKey:@"relayEnabled"];
  self->isRelayForced = [a3 decodeBoolForKey:@"relayForced"];
  self->requiresWifi = [a3 decodeBoolForKey:@"requiresWifi"];
  self->BOOL isDTLSEnabled = [a3 decodeBoolForKey:@"DTLSEnabled"];
  return self;
}

- (id)newEncodedDictionary
{
  v21 = (void *)[objc_alloc(NSNumber) initWithBool:self->isAudioEnabled];
  v20 = (void *)[objc_alloc(NSNumber) initWithBool:self->isVideoEnabled];
  v19 = (void *)[objc_alloc(NSNumber) initWithBool:self->isVideoSourceScreen];
  v18 = (void *)[objc_alloc(NSNumber) initWithBool:self->isDuplexAudioOnly];
  v17 = (void *)[objc_alloc(NSNumber) initWithBool:self->isDuplexVideoOnly];
  v16 = (void *)[objc_alloc(NSNumber) initWithBool:self->isHalfDuplexAudio];
  v15 = (void *)[objc_alloc(NSNumber) initWithBool:self->isKeyExchangeEnabled];
  v14 = (void *)[objc_alloc(NSNumber) initWithBool:self->isAudioPausedToStart];
  v22 = (void *)[objc_alloc(NSNumber) initWithBool:self->isVideoPausedToStart];
  v13 = (void *)[objc_alloc(NSNumber) initWithInt:self->deviceRole];
  objc_super v3 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:self->preferredAudioCodec];
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:self->actualAudioCodec];
  v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:self->preferredVideoCodec];
  v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:self->actualVideoCodec];
  v10 = (void *)[objc_alloc(NSNumber) initWithBool:self->isRelayEnabled];
  v11 = (void *)[objc_alloc(NSNumber) initWithBool:self->isRelayForced];
  uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithBool:self->requiresWifi];
  v12 = (void *)[objc_alloc(NSNumber) initWithBool:self->isDTLSEnabled];
  objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v21, @"audioEnabled", v20, @"videoEnabled", v19, @"videoSourceScreen", v18, @"duplexAudioOnly", v17, @"duplexVideoOnly", v16, @"halfDuplexAudio", v15, @"keyExchangeEnabled", v14, @"startAudioPaused", v22,
                 @"startVideoPaused",
                 v3,
                 @"preferredAudioCodec",
                 v7,
                 @"actualAudioCodec",
                 v8,
                 @"preferredVideoCodec",
                 v9,
                 @"actualVideoCodec",
                 v10,
                 @"relayEnabled",
                 v11,
                 @"relayForced",
                 v4,
                 @"requiresWifi",
                 v12,
                 @"DTLSEnabled",
                 v13,
                 @"deviceRole",
                 0);

  return v6;
}

- (void)decodeFromNSDictionary:(id)a3
{
  if (a3)
  {
    v21 = (void *)[a3 objectForKeyedSubscript:@"audioEnabled"];
    v20 = (void *)[a3 objectForKeyedSubscript:@"videoEnabled"];
    v19 = (void *)[a3 objectForKeyedSubscript:@"videoSourceScreen"];
    v18 = (void *)[a3 objectForKeyedSubscript:@"duplexAudioOnly"];
    v17 = (void *)[a3 objectForKeyedSubscript:@"duplexVideoOnly"];
    v16 = (void *)[a3 objectForKeyedSubscript:@"halfDuplexAudio"];
    v15 = (void *)[a3 objectForKeyedSubscript:@"keyExchangeEnabled"];
    v14 = (void *)[a3 objectForKeyedSubscript:@"startAudioPaused"];
    v13 = (void *)[a3 objectForKeyedSubscript:@"startVideoPaused"];
    uint64_t v4 = (void *)[a3 objectForKeyedSubscript:@"preferredAudioCodec"];
    v5 = (void *)[a3 objectForKeyedSubscript:@"actualAudioCodec"];
    objc_super v6 = (void *)[a3 objectForKeyedSubscript:@"preferredVideoCodec"];
    uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"actualVideoCodec"];
    v8 = (void *)[a3 objectForKeyedSubscript:@"relayEnabled"];
    v9 = (void *)[a3 objectForKeyedSubscript:@"relayForced"];
    v10 = (void *)[a3 objectForKeyedSubscript:@"requiresWifi"];
    v11 = (void *)[a3 objectForKeyedSubscript:@"DTLSEnabled"];
    v12 = (void *)[a3 objectForKeyedSubscript:@"deviceRole"];
    self->isAudioEnabled = [v21 BOOLValue];
    self->isVideoEnabled = [v20 BOOLValue];
    self->isVideoSourceScreen = [v19 BOOLValue];
    self->isDuplexAudioOnly = [v18 BOOLValue];
    self->isDuplexVideoOnly = [v17 BOOLValue];
    self->isHalfDuplexAudio = [v16 BOOLValue];
    self->isKeyExchangeEnabled = [v15 BOOLValue];
    self->isAudioPausedToStart = [v14 BOOLValue];
    self->isVideoPausedToStart = [v13 BOOLValue];
    self->preferredAudioCodec = [v4 unsignedIntValue];
    self->actualAudioCodec = [v5 unsignedIntValue];
    self->preferredVideoCodec = [v6 unsignedIntValue];
    self->actualVideoCodec = [v7 unsignedIntValue];
    self->isRelayEnabled = [v8 BOOLValue];
    self->isRelayForced = [v9 BOOLValue];
    self->requiresWifi = [v10 BOOLValue];
    self->BOOL isDTLSEnabled = [v11 BOOLValue];
    self->deviceRole = [v12 intValue];
  }
}

- (BOOL)isAudioEnabled
{
  return self->isAudioEnabled;
}

- (void)setIsAudioEnabled:(BOOL)a3
{
  self->isAudioEnabled = a3;
}

- (BOOL)isVideoEnabled
{
  return self->isVideoEnabled;
}

- (void)setIsVideoEnabled:(BOOL)a3
{
  self->isVideoEnabled = a3;
}

- (BOOL)isVideoSourceScreen
{
  return self->isVideoSourceScreen;
}

- (void)setIsVideoSourceScreen:(BOOL)a3
{
  self->isVideoSourceScreen = a3;
}

- (BOOL)isDuplexVideoOnly
{
  return self->isDuplexVideoOnly;
}

- (void)setIsDuplexVideoOnly:(BOOL)a3
{
  self->isDuplexVideoOnly = a3;
}

- (BOOL)isDuplexAudioOnly
{
  return self->isDuplexAudioOnly;
}

- (void)setIsDuplexAudioOnly:(BOOL)a3
{
  self->isDuplexAudioOnly = a3;
}

- (BOOL)isKeyExchangeEnabled
{
  return self->isKeyExchangeEnabled;
}

- (void)setIsKeyExchangeEnabled:(BOOL)a3
{
  self->isKeyExchangeEnabled = a3;
}

- (unsigned)preferredAudioCodec
{
  return self->preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(unsigned int)a3
{
  self->preferredAudioCodec = a3;
}

- (unsigned)actualAudioCodec
{
  return self->actualAudioCodec;
}

- (void)setActualAudioCodec:(unsigned int)a3
{
  self->actualAudioCodec = a3;
}

- (unsigned)preferredVideoCodec
{
  return self->preferredVideoCodec;
}

- (void)setPreferredVideoCodec:(unsigned int)a3
{
  self->preferredVideoCodec = a3;
}

- (unsigned)actualVideoCodec
{
  return self->actualVideoCodec;
}

- (void)setActualVideoCodec:(unsigned int)a3
{
  self->actualVideoCodec = a3;
}

- (BOOL)isAudioPausedToStart
{
  return self->isAudioPausedToStart;
}

- (void)setIsAudioPausedToStart:(BOOL)a3
{
  self->isAudioPausedToStart = a3;
}

- (BOOL)isVideoPausedToStart
{
  return self->isVideoPausedToStart;
}

- (void)setIsVideoPausedToStart:(BOOL)a3
{
  self->isVideoPausedToStart = a3;
}

- (BOOL)isRelayEnabled
{
  return self->isRelayEnabled;
}

- (void)setIsRelayEnabled:(BOOL)a3
{
  self->isRelayEnabled = a3;
}

- (BOOL)isRelayForced
{
  return self->isRelayForced;
}

- (void)setIsRelayForced:(BOOL)a3
{
  self->isRelayForced = a3;
}

- (BOOL)requiresWifi
{
  return self->requiresWifi;
}

- (void)setRequiresWifi:(BOOL)a3
{
  self->requiresWifi = a3;
}

- (BOOL)isDTLSEnabled
{
  return self->isDTLSEnabled;
}

- (void)setIsDTLSEnabled:(BOOL)a3
{
  self->BOOL isDTLSEnabled = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->deviceRole = a3;
}

- (BOOL)isHalfDuplexAudio
{
  return self->isHalfDuplexAudio;
}

- (void)setIsHalfDuplexAudio:(BOOL)a3
{
  self->isHalfDuplexAudio = a3;
}

@end