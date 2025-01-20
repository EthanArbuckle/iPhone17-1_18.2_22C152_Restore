@interface DCPresentmentProposalReaderAnalytics
+ (BOOL)supportsSecureCoding;
- (BOOL)isTrusted;
- (DCPresentmentProposalReaderAnalytics)initWithCoder:(id)a3;
- (DCPresentmentProposalReaderAnalytics)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7;
- (NSString)untrustedIdentifier;
- (NSString)untrustedIssuerIdentifier;
- (NSString)untrustedIssuerOrganization;
- (NSString)untrustedOrganization;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCPresentmentProposalReaderAnalytics

- (DCPresentmentProposalReaderAnalytics)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DCPresentmentProposalReaderAnalytics;
  v16 = [(DCPresentmentProposalReaderAnalytics *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_trusted = a3;
    uint64_t v18 = [v12 copy];
    untrustedIdentifier = v17->_untrustedIdentifier;
    v17->_untrustedIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    untrustedOrganization = v17->_untrustedOrganization;
    v17->_untrustedOrganization = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    untrustedIssuerIdentifier = v17->_untrustedIssuerIdentifier;
    v17->_untrustedIssuerIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    untrustedIssuerOrganization = v17->_untrustedIssuerOrganization;
    v17->_untrustedIssuerOrganization = (NSString *)v24;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCPresentmentProposalReaderAnalytics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DCPresentmentProposalReaderAnalytics;
  v5 = [(DCPresentmentProposalReaderAnalytics *)&v15 init];
  if (v5)
  {
    v5->_trusted = [v4 decodeBoolForKey:0x26C59BA40];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BA60];
    untrustedIdentifier = v5->_untrustedIdentifier;
    v5->_untrustedIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BA80];
    untrustedOrganization = v5->_untrustedOrganization;
    v5->_untrustedOrganization = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BAA0];
    untrustedIssuerIdentifier = v5->_untrustedIssuerIdentifier;
    v5->_untrustedIssuerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:0x26C59BAC0];
    untrustedIssuerOrganization = v5->_untrustedIssuerOrganization;
    v5->_untrustedIssuerOrganization = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL trusted = self->_trusted;
  id v5 = a3;
  [v5 encodeBool:trusted forKey:0x26C59BA40];
  [v5 encodeObject:self->_untrustedIdentifier forKey:0x26C59BA60];
  [v5 encodeObject:self->_untrustedOrganization forKey:0x26C59BA80];
  [v5 encodeObject:self->_untrustedIssuerIdentifier forKey:0x26C59BAA0];
  [v5 encodeObject:self->_untrustedIssuerOrganization forKey:0x26C59BAC0];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if ([(DCPresentmentProposalReaderAnalytics *)self isTrusted]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [(DCPresentmentProposalReaderAnalytics *)self untrustedIdentifier];
  uint64_t v8 = [(DCPresentmentProposalReaderAnalytics *)self untrustedOrganization];
  v9 = [(DCPresentmentProposalReaderAnalytics *)self untrustedIssuerIdentifier];
  uint64_t v10 = [(DCPresentmentProposalReaderAnalytics *)self untrustedIssuerOrganization];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; BOOL trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [DCPresentmentProposalReaderAnalytics alloc];
  BOOL trusted = self->_trusted;
  untrustedIdentifier = self->_untrustedIdentifier;
  untrustedOrganization = self->_untrustedOrganization;
  untrustedIssuerIdentifier = self->_untrustedIssuerIdentifier;
  untrustedIssuerOrganization = self->_untrustedIssuerOrganization;

  return [(DCPresentmentProposalReaderAnalytics *)v4 initWithTrusted:trusted untrustedIdentifier:untrustedIdentifier untrustedOrganization:untrustedOrganization untrustedIssuerIdentifier:untrustedIssuerIdentifier untrustedIssuerOrganization:untrustedIssuerOrganization];
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (NSString)untrustedIdentifier
{
  return self->_untrustedIdentifier;
}

- (NSString)untrustedOrganization
{
  return self->_untrustedOrganization;
}

- (NSString)untrustedIssuerIdentifier
{
  return self->_untrustedIssuerIdentifier;
}

- (NSString)untrustedIssuerOrganization
{
  return self->_untrustedIssuerOrganization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);

  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end