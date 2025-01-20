@interface CXCall
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConnected;
- (BOOL)hasEnded;
- (BOOL)isEndpointOnCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCall:(CXCall *)call;
- (BOOL)isHostedOnCurrentDevice;
- (BOOL)isOnHold;
- (BOOL)isOutgoing;
- (BOOL)isScreening;
- (BOOL)isVideo;
- (CXCall)init;
- (CXCall)initWithCoder:(id)a3;
- (CXCall)initWithUUID:(id)a3;
- (NSString)providerIdentifier;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpointOnCurrentDevice:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasEnded:(BOOL)a3;
- (void)setHostedOnCurrentDevice:(BOOL)a3;
- (void)setOnHold:(BOOL)a3;
- (void)setOutgoing:(BOOL)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCall

- (CXCall)init
{
  return 0;
}

- (CXCall)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXCall;
  v6 = [(CXCall *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCall)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_UUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(CXCall *)self initWithUUID:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_providerIdentifier);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    providerIdentifier = v8->_providerIdentifier;
    v8->_providerIdentifier = (NSString *)v11;

    v13 = NSStringFromSelector(sel_isOutgoing);
    v8->_outgoing = [v4 decodeBoolForKey:v13];

    v14 = NSStringFromSelector(sel_isOnHold);
    v8->_onHold = [v4 decodeBoolForKey:v14];

    v15 = NSStringFromSelector(sel_hasConnected);
    v8->_hasConnected = [v4 decodeBoolForKey:v15];

    v16 = NSStringFromSelector(sel_hasEnded);
    v8->_hasEnded = [v4 decodeBoolForKey:v16];

    v17 = NSStringFromSelector(sel_isEndpointOnCurrentDevice);
    v8->_endpointOnCurrentDevice = [v4 decodeBoolForKey:v17];

    v18 = NSStringFromSelector(sel_isHostedOnCurrentDevice);
    v8->_hostedOnCurrentDevice = [v4 decodeBoolForKey:v18];

    v19 = NSStringFromSelector(sel_isVideo);
    v8->_video = [v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_isScreening);
    v8->_screening = [v4 decodeBoolForKey:v20];
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCall *)self UUID];
  v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(CXCall *)self providerIdentifier];
  v8 = NSStringFromSelector(sel_providerIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  BOOL v9 = [(CXCall *)self isOutgoing];
  v10 = NSStringFromSelector(sel_isOutgoing);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(CXCall *)self isOnHold];
  v12 = NSStringFromSelector(sel_isOnHold);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(CXCall *)self hasConnected];
  v14 = NSStringFromSelector(sel_hasConnected);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(CXCall *)self hasEnded];
  v16 = NSStringFromSelector(sel_hasEnded);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(CXCall *)self isEndpointOnCurrentDevice];
  v18 = NSStringFromSelector(sel_isEndpointOnCurrentDevice);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(CXCall *)self isHostedOnCurrentDevice];
  v20 = NSStringFromSelector(sel_isHostedOnCurrentDevice);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(CXCall *)self isVideo];
  v22 = NSStringFromSelector(sel_isVideo);
  [v4 encodeBool:v21 forKey:v22];

  BOOL v23 = [(CXCall *)self isScreening];
  NSStringFromSelector(sel_isScreening);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v23 forKey:v24];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXCall *)self isEqualToCall:v4];

  return v5;
}

- (BOOL)isEqualToCall:(CXCall *)call
{
  id v4 = call;
  uint64_t v5 = [(CXCall *)self UUID];
  uint64_t v6 = [(CXCall *)v4 UUID];
  if (v5 | v6 && ![(id)v5 isEqual:v6])
  {
    LOBYTE(v16) = 0;
  }
  else
  {
    uint64_t v7 = [(CXCall *)self providerIdentifier];
    uint64_t v8 = [(CXCall *)v4 providerIdentifier];
    if ((!(v7 | v8) || [(id)v7 isEqual:v8])
      && (BOOL v9 = [(CXCall *)self isOutgoing], v9 == [(CXCall *)v4 isOutgoing])
      && (BOOL v10 = [(CXCall *)self isVideo], v10 == [(CXCall *)v4 isVideo])
      && (BOOL v11 = [(CXCall *)self isOnHold], v11 == [(CXCall *)v4 isOnHold])
      && (BOOL v12 = [(CXCall *)self hasConnected], v12 == [(CXCall *)v4 hasConnected])
      && (BOOL v13 = [(CXCall *)self hasEnded], v13 == [(CXCall *)v4 hasEnded])
      && (BOOL v14 = [(CXCall *)self isEndpointOnCurrentDevice],
          v14 == [(CXCall *)v4 isEndpointOnCurrentDevice])
      && (BOOL v15 = [(CXCall *)self isHostedOnCurrentDevice],
          v15 == [(CXCall *)v4 isHostedOnCurrentDevice]))
    {
      BOOL v18 = [(CXCall *)self isScreening];
      BOOL v16 = v18 ^ [(CXCall *)v4 isScreening] ^ 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return v16;
}

- (unint64_t)hash
{
  v3 = [(CXCall *)self UUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(CXCall *)self providerIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  if ([(CXCall *)self isOutgoing]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v8 = v6 ^ v7;
  if ([(CXCall *)self isVideo]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  if ([(CXCall *)self isOnHold]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  uint64_t v11 = v8 ^ v9 ^ v10;
  if ([(CXCall *)self hasConnected]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  if ([(CXCall *)self hasEnded]) {
    uint64_t v13 = 1231;
  }
  else {
    uint64_t v13 = 1237;
  }
  uint64_t v14 = v12 ^ v13;
  if ([(CXCall *)self isEndpointOnCurrentDevice]) {
    uint64_t v15 = 1231;
  }
  else {
    uint64_t v15 = 1237;
  }
  uint64_t v16 = v11 ^ v14 ^ v15;
  if ([(CXCall *)self isHostedOnCurrentDevice]) {
    uint64_t v17 = 1231;
  }
  else {
    uint64_t v17 = 1237;
  }
  if ([(CXCall *)self isScreening]) {
    uint64_t v18 = 1231;
  }
  else {
    uint64_t v18 = 1237;
  }
  unint64_t v19 = v16 ^ v17 ^ v18;

  return v19;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5 = a3;
  objc_msgSend(v5, "setOutgoing:", -[CXCall isOutgoing](self, "isOutgoing"));
  objc_msgSend(v5, "setOnHold:", -[CXCall isOnHold](self, "isOnHold"));
  objc_msgSend(v5, "setHasConnected:", -[CXCall hasConnected](self, "hasConnected"));
  objc_msgSend(v5, "setHasEnded:", -[CXCall hasEnded](self, "hasEnded"));
}

- (id)sanitizedCopy
{
  return [(CXCall *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CXCall *)self UUID];
  uint64_t v7 = (void *)[v5 initWithUUID:v6];

  [(CXCall *)self updateSanitizedCopy:v7 withZone:a3];

  return v7;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v7 = a3;
  [(CXCall *)self updateSanitizedCopy:v7 withZone:a4];
  uint64_t v6 = [(CXCall *)self providerIdentifier];
  [v7 setProviderIdentifier:v6];

  objc_msgSend(v7, "setEndpointOnCurrentDevice:", -[CXCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  objc_msgSend(v7, "setHostedOnCurrentDevice:", -[CXCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  objc_msgSend(v7, "setVideo:", -[CXCall isVideo](self, "isVideo"));
  objc_msgSend(v7, "setScreening:", -[CXCall isScreening](self, "isScreening"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CXCall *)self UUID];
  id v7 = (void *)[v5 initWithUUID:v6];

  [(CXCall *)self updateCopy:v7 withZone:a3];
  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isOnHold
{
  return self->_onHold;
}

- (void)setOnHold:(BOOL)a3
{
  self->_onHold = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (void)setHasEnded:(BOOL)a3
{
  self->_hasEnded = a3;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (BOOL)isHostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (void)setHostedOnCurrentDevice:(BOOL)a3
{
  self->_hostedOnCurrentDevice = a3;
}

- (BOOL)isVideo
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end