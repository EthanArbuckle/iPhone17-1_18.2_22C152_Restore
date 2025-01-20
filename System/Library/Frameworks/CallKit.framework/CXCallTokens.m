@interface CXCallTokens
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCallTokens:(id)a3;
- (CXCallTokens)initWithCoder:(id)a3;
- (NSDictionary)streamTokensByParticipantID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)combinedAudioStreamToken;
- (int64_t)downlinkStreamToken;
- (int64_t)uplinkStreamToken;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedAudioStreamToken:(int64_t)a3;
- (void)setDownlinkStreamToken:(int64_t)a3;
- (void)setStreamTokensByParticipantID:(id)a3;
- (void)setUplinkStreamToken:(int64_t)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCallTokens

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" uplinkStreamToken=%ld", -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" downlinkStreamToken=%ld", -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" combinedAudioStreamToken=%ld", -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  v4 = [(CXCallTokens *)self streamTokensByParticipantID];
  [v3 appendFormat:@" streamTokensByParticipantID=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)sanitizedCopy
{
  return [(CXCallTokens *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6 = a3;
  [(CXCallTokens *)self updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setUplinkStreamToken:", -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v6, "setDownlinkStreamToken:", -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v6, "setCombinedAudioStreamToken:", -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  id v7 = [(CXCallTokens *)self streamTokensByParticipantID];
  [v6 setStreamTokensByParticipantID:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallTokens *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallTokens)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallTokens *)self init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_uplinkStreamToken);
    v5->_uplinkStreamToken = [v4 decodeIntegerForKey:v6];

    id v7 = NSStringFromSelector(sel_downlinkStreamToken);
    v5->_downlinkStreamToken = [v4 decodeIntegerForKey:v7];

    v8 = NSStringFromSelector(sel_combinedAudioStreamToken);
    v5->_combinedAudioStreamToken = [v4 decodeIntegerForKey:v8];

    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_streamTokensByParticipantID);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    streamTokensByParticipantID = v5->_streamTokensByParticipantID;
    v5->_streamTokensByParticipantID = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CXCallTokens *)self uplinkStreamToken];
  id v6 = NSStringFromSelector(sel_uplinkStreamToken);
  [v4 encodeInteger:v5 forKey:v6];

  int64_t v7 = [(CXCallTokens *)self downlinkStreamToken];
  v8 = NSStringFromSelector(sel_downlinkStreamToken);
  [v4 encodeInteger:v7 forKey:v8];

  int64_t v9 = [(CXCallTokens *)self combinedAudioStreamToken];
  v10 = NSStringFromSelector(sel_combinedAudioStreamToken);
  [v4 encodeInteger:v9 forKey:v10];

  id v12 = [(CXCallTokens *)self streamTokensByParticipantID];
  uint64_t v11 = NSStringFromSelector(sel_streamTokensByParticipantID);
  [v4 encodeObject:v12 forKey:v11];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CXCallTokens *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXCallTokens *)self isEqualToCallTokens:v4];
  }

  return v5;
}

- (BOOL)isEqualToCallTokens:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CXCallTokens *)self uplinkStreamToken];
  if (v5 == [v4 uplinkStreamToken]
    && (int64_t v6 = [(CXCallTokens *)self downlinkStreamToken],
        v6 == [v4 downlinkStreamToken])
    && (int64_t v7 = [(CXCallTokens *)self combinedAudioStreamToken],
        v7 == [v4 combinedAudioStreamToken]))
  {
    v8 = [(CXCallTokens *)self streamTokensByParticipantID];
    int64_t v9 = [v4 streamTokensByParticipantID];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)uplinkStreamToken
{
  return self->_uplinkStreamToken;
}

- (void)setUplinkStreamToken:(int64_t)a3
{
  self->_uplinkStreamToken = a3;
}

- (int64_t)downlinkStreamToken
{
  return self->_downlinkStreamToken;
}

- (void)setDownlinkStreamToken:(int64_t)a3
{
  self->_downlinkStreamToken = a3;
}

- (int64_t)combinedAudioStreamToken
{
  return self->_combinedAudioStreamToken;
}

- (void)setCombinedAudioStreamToken:(int64_t)a3
{
  self->_combinedAudioStreamToken = a3;
}

- (NSDictionary)streamTokensByParticipantID
{
  return self->_streamTokensByParticipantID;
}

- (void)setStreamTokensByParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end