@interface AACustodianInvitationResponseContext
+ (BOOL)supportsSecureCoding;
- (AACustodianInvitationResponseContext)initWithCoder:(id)a3;
- (AACustodianInvitationResponseContext)initWithCustodianID:(id)a3 didAccept:(BOOL)a4;
- (BOOL)isAccepted;
- (BOOL)isAutoAction;
- (NSUUID)custodianID;
- (void)encodeWithCoder:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setAutoAction:(BOOL)a3;
- (void)setCustodianID:(id)a3;
@end

@implementation AACustodianInvitationResponseContext

- (AACustodianInvitationResponseContext)initWithCustodianID:(id)a3 didAccept:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AACustodianInvitationResponseContext;
  v8 = [(AACustodianInvitationResponseContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_custodianID, a3);
    v9->_accepted = a4;
    v9->_autoAction = 0;
  }

  return v9;
}

- (AACustodianInvitationResponseContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AACustodianInvitationResponseContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianID"];
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_accepted = [v4 decodeBoolForKey:@"_accepted"];
    v5->_autoAction = [v4 decodeBoolForKey:@"_autoAction"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  custodianID = self->_custodianID;
  id v5 = a3;
  [v5 encodeObject:custodianID forKey:@"_custodianID"];
  [v5 encodeBool:self->_accepted forKey:@"_accepted"];
  [v5 encodeBool:self->_autoAction forKey:@"_autoAction"];
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (void)setCustodianID:(id)a3
{
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (BOOL)isAutoAction
{
  return self->_autoAction;
}

- (void)setAutoAction:(BOOL)a3
{
  self->_autoAction = a3;
}

- (void).cxx_destruct
{
}

@end