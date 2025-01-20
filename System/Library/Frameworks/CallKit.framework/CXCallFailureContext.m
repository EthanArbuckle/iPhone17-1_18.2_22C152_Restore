@interface CXCallFailureContext
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCellularSettingsRemediation;
- (BOOL)hasDateAndTimeSettingsRemediation;
- (BOOL)hasLocationSettingsRemediation;
- (BOOL)hasWiFiSettingsRemediation;
- (CXCallFailureContext)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)message;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)failureReason;
- (int64_t)providerEndedReason;
- (int64_t)providerErrorCode;
- (void)encodeWithCoder:(id)a3;
- (void)setFailureReason:(int64_t)a3;
- (void)setHasCellularSettingsRemediation:(BOOL)a3;
- (void)setHasDateAndTimeSettingsRemediation:(BOOL)a3;
- (void)setHasLocationSettingsRemediation:(BOOL)a3;
- (void)setHasWiFiSettingsRemediation:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setProviderEndedReason:(int64_t)a3;
- (void)setProviderErrorCode:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXCallFailureContext

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXCallFailureContext *)self title];

  if (v4)
  {
    v5 = [(CXCallFailureContext *)self title];
    [v3 appendFormat:@" title=%@", v5];
  }
  v6 = [(CXCallFailureContext *)self message];

  if (v6)
  {
    v7 = [(CXCallFailureContext *)self message];
    [v3 appendFormat:@" message=%@", v7];
  }
  objc_msgSend(v3, "appendFormat:", @" failureReason=%ld", -[CXCallFailureContext failureReason](self, "failureReason"));
  objc_msgSend(v3, "appendFormat:", @" providerErrorCode=%ld", -[CXCallFailureContext providerErrorCode](self, "providerErrorCode"));
  objc_msgSend(v3, "appendFormat:", @" providerEndedReason=%ld", -[CXCallFailureContext providerEndedReason](self, "providerEndedReason"));
  objc_msgSend(v3, "appendFormat:", @" hasWiFiSettingsRemediation=%d", -[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", @" hasCellularSettingsRemediation=%d", -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", @" hasDateAndTimeSettingsRemediation=%d", -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation"));
  objc_msgSend(v3, "appendFormat:", @" hasLocationSettingsRemediation=%d", -[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation"));
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (id)sanitizedCopy
{
  return [(CXCallFailureContext *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v8 = a3;
  [(CXCallFailureContext *)self updateSanitizedCopy:v8 withZone:a4];
  v6 = [(CXCallFailureContext *)self title];
  [v8 setTitle:v6];

  v7 = [(CXCallFailureContext *)self message];
  [v8 setMessage:v7];

  objc_msgSend(v8, "setFailureReason:", -[CXCallFailureContext failureReason](self, "failureReason"));
  objc_msgSend(v8, "setProviderErrorCode:", -[CXCallFailureContext providerErrorCode](self, "providerErrorCode"));
  objc_msgSend(v8, "setProviderEndedReason:", -[CXCallFailureContext providerEndedReason](self, "providerEndedReason"));
  objc_msgSend(v8, "setHasWiFiSettingsRemediation:", -[CXCallFailureContext hasWiFiSettingsRemediation](self, "hasWiFiSettingsRemediation"));
  objc_msgSend(v8, "setHasCellularSettingsRemediation:", -[CXCallFailureContext hasCellularSettingsRemediation](self, "hasCellularSettingsRemediation"));
  objc_msgSend(v8, "setHasDateAndTimeSettingsRemediation:", -[CXCallFailureContext hasDateAndTimeSettingsRemediation](self, "hasDateAndTimeSettingsRemediation"));
  objc_msgSend(v8, "setHasLocationSettingsRemediation:", -[CXCallFailureContext hasLocationSettingsRemediation](self, "hasLocationSettingsRemediation"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXCallFailureContext *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallFailureContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallFailureContext *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_title);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_message);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    message = v5->_message;
    v5->_message = (NSString *)v12;

    v14 = NSStringFromSelector(sel_failureReason);
    v5->_failureReason = [v4 decodeIntegerForKey:v14];

    v15 = NSStringFromSelector(sel_providerErrorCode);
    v5->_providerErrorCode = [v4 decodeIntegerForKey:v15];

    v16 = NSStringFromSelector(sel_providerEndedReason);
    v5->_providerEndedReason = [v4 decodeIntegerForKey:v16];

    v17 = NSStringFromSelector(sel_hasWiFiSettingsRemediation);
    v5->_hasWiFiSettingsRemediation = [v4 decodeBoolForKey:v17];

    v18 = NSStringFromSelector(sel_hasCellularSettingsRemediation);
    v5->_hasCellularSettingsRemediation = [v4 decodeBoolForKey:v18];

    v19 = NSStringFromSelector(sel_hasDateAndTimeSettingsRemediation);
    v5->_hasDateAndTimeSettingsRemediation = [v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_hasLocationSettingsRemediation);
    v5->_hasLocationSettingsRemediation = [v4 decodeBoolForKey:v20];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallFailureContext *)self title];
  uint64_t v6 = NSStringFromSelector(sel_title);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(CXCallFailureContext *)self message];
  uint64_t v8 = NSStringFromSelector(sel_message);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(CXCallFailureContext *)self failureReason];
  uint64_t v10 = NSStringFromSelector(sel_failureReason);
  [v4 encodeInteger:v9 forKey:v10];

  int64_t v11 = [(CXCallFailureContext *)self providerErrorCode];
  uint64_t v12 = NSStringFromSelector(sel_providerErrorCode);
  [v4 encodeInteger:v11 forKey:v12];

  int64_t v13 = [(CXCallFailureContext *)self providerEndedReason];
  v14 = NSStringFromSelector(sel_providerEndedReason);
  [v4 encodeInteger:v13 forKey:v14];

  BOOL v15 = [(CXCallFailureContext *)self hasWiFiSettingsRemediation];
  v16 = NSStringFromSelector(sel_hasWiFiSettingsRemediation);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(CXCallFailureContext *)self hasCellularSettingsRemediation];
  v18 = NSStringFromSelector(sel_hasCellularSettingsRemediation);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(CXCallFailureContext *)self hasDateAndTimeSettingsRemediation];
  v20 = NSStringFromSelector(sel_hasDateAndTimeSettingsRemediation);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(CXCallFailureContext *)self hasLocationSettingsRemediation];
  NSStringFromSelector(sel_hasLocationSettingsRemediation);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v21 forKey:v22];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(int64_t)a3
{
  self->_failureReason = a3;
}

- (int64_t)providerErrorCode
{
  return self->_providerErrorCode;
}

- (void)setProviderErrorCode:(int64_t)a3
{
  self->_providerErrorCode = a3;
}

- (int64_t)providerEndedReason
{
  return self->_providerEndedReason;
}

- (void)setProviderEndedReason:(int64_t)a3
{
  self->_providerEndedReason = a3;
}

- (BOOL)hasWiFiSettingsRemediation
{
  return self->_hasWiFiSettingsRemediation;
}

- (void)setHasWiFiSettingsRemediation:(BOOL)a3
{
  self->_hasWiFiSettingsRemediation = a3;
}

- (BOOL)hasCellularSettingsRemediation
{
  return self->_hasCellularSettingsRemediation;
}

- (void)setHasCellularSettingsRemediation:(BOOL)a3
{
  self->_hasCellularSettingsRemediation = a3;
}

- (BOOL)hasDateAndTimeSettingsRemediation
{
  return self->_hasDateAndTimeSettingsRemediation;
}

- (void)setHasDateAndTimeSettingsRemediation:(BOOL)a3
{
  self->_hasDateAndTimeSettingsRemediation = a3;
}

- (BOOL)hasLocationSettingsRemediation
{
  return self->_hasLocationSettingsRemediation;
}

- (void)setHasLocationSettingsRemediation:(BOOL)a3
{
  self->_hasLocationSettingsRemediation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end