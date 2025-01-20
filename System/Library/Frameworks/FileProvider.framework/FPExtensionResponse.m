@interface FPExtensionResponse
+ (BOOL)supportsSecureCoding;
- (FPExtensionResponse)initWithCoder:(id)a3;
- (NSDictionary)domainUserInfo;
- (NSFileProviderDomainVersion)domainVersion;
- (NSString)callDescription;
- (id)description;
- (int)extensionPid;
- (int64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setCallDescription:(id)a3;
- (void)setDomainUserInfo:(id)a3;
- (void)setDomainVersion:(id)a3;
- (void)setExtensionPid:(int)a3;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation FPExtensionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPExtensionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FPExtensionResponse;
  v5 = [(FPExtensionResponse *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainVersion"];
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v6;

    uint64_t v8 = objc_msgSend(v4, "fp_safeDecodeNSDictionaryForKey:", @"_domainUserInfo");
    domainUserInfo = v5->_domainUserInfo;
    v5->_domainUserInfo = (NSDictionary *)v8;

    v5->_extensionPid = [v4 decodeIntForKey:@"_extensionPid"];
    v5->_sequenceNumber = [v4 decodeIntegerForKey:@"_sequenceNumber"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_callDescription"];
    callDescription = v5->_callDescription;
    v5->_callDescription = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  domainVersion = self->_domainVersion;
  id v5 = a3;
  [v5 encodeObject:domainVersion forKey:@"_domainVersion"];
  [v5 encodeObject:self->_domainUserInfo forKey:@"_domainUserInfo"];
  [v5 encodeInt:self->_extensionPid forKey:@"_extensionPid"];
  [v5 encodeInteger:self->_sequenceNumber forKey:@"_sequenceNumber"];
  [v5 encodeObject:self->_callDescription forKey:@"_callDescription"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<domver:%@ seqNum:%d:%d call:%@>", self->_domainVersion, self->_extensionPid, self->_sequenceNumber, self->_callDescription];
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void)setDomainVersion:(id)a3
{
}

- (NSDictionary)domainUserInfo
{
  return self->_domainUserInfo;
}

- (void)setDomainUserInfo:(id)a3
{
}

- (int)extensionPid
{
  return self->_extensionPid;
}

- (void)setExtensionPid:(int)a3
{
  self->_extensionPid = a3;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)callDescription
{
  return self->_callDescription;
}

- (void)setCallDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDescription, 0);
  objc_storeStrong((id *)&self->_domainUserInfo, 0);

  objc_storeStrong((id *)&self->_domainVersion, 0);
}

@end