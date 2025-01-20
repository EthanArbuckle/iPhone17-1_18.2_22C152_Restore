@interface CXChannelProviderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (CXChannelProviderConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelProviderConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" audioSessionID=%u", -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXChannelProviderConfiguration *)self isEqualToConfiguration:v4];

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(CXChannelProviderConfiguration *)self audioSessionID];
  int v5 = [v4 audioSessionID];

  return self == v5;
}

- (unint64_t)hash
{
  return [(CXChannelProviderConfiguration *)self audioSessionID];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5 = a3;
  objc_msgSend(v5, "setAudioSessionID:", -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));
}

- (id)sanitizedCopy
{
  return [(CXChannelProviderConfiguration *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXChannelProviderConfiguration *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6 = a3;
  [(CXChannelProviderConfiguration *)self updateSanitizedCopy:v6 withZone:a4];
  objc_msgSend(v6, "setAudioSessionID:", -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXChannelProviderConfiguration *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelProviderConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CXChannelProviderConfiguration *)self init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_audioSessionID);
    v5->_audioSessionID = [v4 decodeInt32ForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXChannelProviderConfiguration *)self audioSessionID];
  NSStringFromSelector(sel_audioSessionID);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt32:v5 forKey:v6];
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

@end