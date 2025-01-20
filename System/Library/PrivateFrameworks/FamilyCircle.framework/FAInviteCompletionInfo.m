@interface FAInviteCompletionInfo
+ (BOOL)supportsSecureCoding;
- (FAInviteCompletionInfo)initWithCoder:(id)a3;
- (NSArray)recipients;
- (id)_completionStatusStringValue;
- (id)_transportStringValue;
- (id)serverReadableDictionary;
- (unint64_t)completionTypeFrom:(id)a3;
- (unint64_t)status;
- (unint64_t)transportType;
- (unint64_t)transportTypeFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTransportType:(unint64_t)a3;
@end

@implementation FAInviteCompletionInfo

- (id)serverReadableDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(FAInviteCompletionInfo *)self _transportStringValue];
  [v3 setObject:v4 forKeyedSubscript:@"transportMode"];

  v5 = [(FAInviteCompletionInfo *)self recipients];
  [v3 setObject:v5 forKeyedSubscript:@"inviteRecipients"];

  v6 = [(FAInviteCompletionInfo *)self _completionStatusStringValue];
  [v3 setObject:v6 forKeyedSubscript:@"completionStatus"];

  return v3;
}

- (id)_transportStringValue
{
  unint64_t v2 = [(FAInviteCompletionInfo *)self transportType];
  if (v2 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E6925780[v2 - 1];
  }
}

- (unint64_t)transportTypeFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"messages"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"mail"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"airdrop"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"inviteInPerson"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_completionStatusStringValue
{
  unint64_t v2 = [(FAInviteCompletionInfo *)self status];
  if (v2 > 2) {
    return 0;
  }
  else {
    return off_1E69257A0[v2];
  }
}

- (unint64_t)completionTypeFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"failure"]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"success"];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FAInviteCompletionInfo *)self _transportStringValue];
  [v4 encodeObject:v5 forKey:@"transportMode"];

  v6 = [(FAInviteCompletionInfo *)self recipients];
  [v4 encodeObject:v6 forKey:@"inviteRecipients"];

  id v7 = [(FAInviteCompletionInfo *)self _completionStatusStringValue];
  [v4 encodeObject:v7 forKey:@"completionStatus"];
}

- (FAInviteCompletionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FAInviteCompletionInfo *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"inviteRecipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transportMode"];
    v5->_transportType = [(FAInviteCompletionInfo *)v5 transportTypeFrom:v11];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionStatus"];
    v5->_status = [(FAInviteCompletionInfo *)v5 completionTypeFrom:v12];
  }
  return v5;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end