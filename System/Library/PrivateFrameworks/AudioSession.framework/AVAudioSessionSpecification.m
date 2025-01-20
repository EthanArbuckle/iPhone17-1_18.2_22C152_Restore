@interface AVAudioSessionSpecification
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (AVAudioSessionSpecification)initWithCoder:(id)a3;
- (BOOL)autoReconnect;
- (NSString)clientIdentifier;
- (unint64_t)sessionType;
- (unsigned)sourceSessionID;
- (unsigned)useCaseIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoReconnect:(BOOL)a3;
- (void)setClientAuditToken:(id *)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setSourceSessionID:(unsigned int)a3;
- (void)setUseCaseIdentifier:(unsigned int)a3;
@end

@implementation AVAudioSessionSpecification

- (void).cxx_destruct
{
}

- (unint64_t)sessionType
{
  return self->sessionType;
}

- (unsigned)sourceSessionID
{
  return self->sourceSessionID;
}

- (unsigned)useCaseIdentifier
{
  return self->useCaseIdentifier;
}

- (NSString)clientIdentifier
{
  return self->clientIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)autoReconnect
{
  return self->autoReconnect;
}

- (void)setSessionType:(unint64_t)a3
{
  self->sessionType = a3;
}

- (void)setAutoReconnect:(BOOL)a3
{
  self->autoReconnect = a3;
}

- (void)setSourceSessionID:(unsigned int)a3
{
  self->sourceSessionID = a3;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setClientAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->sessionType forKey:@"sessionType"];
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_clientAuditToken length:32];
  [v5 encodeObject:v4 forKey:@"clientAuditToken"];
  [v5 encodeInt32:self->sourceSessionID forKey:@"sourceSessionID"];
  [v5 encodeObject:self->clientIdentifier forKey:@"clientIdentifier"];
}

- (AVAudioSessionSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSessionSpecification;
  id v5 = [(AVAudioSessionSpecification *)&v10 init];
  if (v5)
  {
    v5->sessionType = [v4 decodeIntegerForKey:@"sessionType"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAuditToken"];
    [v6 getBytes:&v5->_clientAuditToken length:32];
    v5->sourceSessionID = [v4 decodeInt32ForKey:@"sourceSessionID"];
    uint64_t v7 = [v4 decodeObjectForKey:@"clientIdentifer"];
    clientIdentifier = v5->clientIdentifier;
    v5->clientIdentifier = (NSString *)v7;
  }
  return v5;
}

- (void)setUseCaseIdentifier:(unsigned int)a3
{
  self->useCaseIdentifier = a3;
}

@end