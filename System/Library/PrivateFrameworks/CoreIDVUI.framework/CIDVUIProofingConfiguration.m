@interface CIDVUIProofingConfiguration
+ (BOOL)supportsSecureCoding;
- (CIDVUIProofingConfiguration)initWithCoder:(id)a3;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 extendedReviewURL:(id)a11 learnMoreURL:(id)a12 supplementalProvisioningData:(id)a13;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 supplementalProvisioningData:(id)a11;
- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 learnMoreURL:(id)a10 extendedReviewURL:(id)a11;
- (NSData)supplementalProvisioningData;
- (NSString)accountKeyIdentifier;
- (NSString)country;
- (NSString)credentialIdentifier;
- (NSString)productIdentifier;
- (NSString)state;
- (NSURL)extendedReviewURL;
- (NSURL)learnMoreURL;
- (int64_t)idType;
- (int64_t)status;
- (int64_t)target;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKeyIdentifier:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setExtendedReviewURL:(id)a3;
- (void)setIdType:(int64_t)a3;
- (void)setLearnMoreURL:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setState:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSupplementalProvisioningData:(id)a3;
- (void)setTarget:(int64_t)a3;
@end

@implementation CIDVUIProofingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8
{
  v19.receiver = self;
  v19.super_class = (Class)CIDVUIProofingConfiguration;
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  v17 = [(CIDVUIProofingConfiguration *)&v19 init];
  -[CIDVUIProofingConfiguration setState:](v17, "setState:", v16, v19.receiver, v19.super_class);

  [(CIDVUIProofingConfiguration *)v17 setCountry:v15];
  [(CIDVUIProofingConfiguration *)v17 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v17 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v17 setCredentialIdentifier:v14];

  [(CIDVUIProofingConfiguration *)v17 setProductIdentifier:v13];
  return v17;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9
{
  v22.receiver = self;
  v22.super_class = (Class)CIDVUIProofingConfiguration;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  v20 = [(CIDVUIProofingConfiguration *)&v22 init];
  -[CIDVUIProofingConfiguration setState:](v20, "setState:", v19, v22.receiver, v22.super_class);

  [(CIDVUIProofingConfiguration *)v20 setCountry:v18];
  [(CIDVUIProofingConfiguration *)v20 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v20 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v20 setCredentialIdentifier:v17];

  [(CIDVUIProofingConfiguration *)v20 setProductIdentifier:v16];
  [(CIDVUIProofingConfiguration *)v20 setAccountKeyIdentifier:v15];

  [(CIDVUIProofingConfiguration *)v20 setIdType:0];
  return v20;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 learnMoreURL:(id)a10 extendedReviewURL:(id)a11
{
  v26.receiver = self;
  v26.super_class = (Class)CIDVUIProofingConfiguration;
  id v16 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  v23 = [(CIDVUIProofingConfiguration *)&v26 init];
  [(CIDVUIProofingConfiguration *)v23 setState:v22];

  [(CIDVUIProofingConfiguration *)v23 setCountry:v21];
  [(CIDVUIProofingConfiguration *)v23 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v23 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v23 setCredentialIdentifier:v20];

  [(CIDVUIProofingConfiguration *)v23 setProductIdentifier:v19];
  [(CIDVUIProofingConfiguration *)v23 setAccountKeyIdentifier:v18];

  [(CIDVUIProofingConfiguration *)v23 setLearnMoreURL:v17];
  [(CIDVUIProofingConfiguration *)v23 setExtendedReviewURL:v16];

  return v23;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10
{
  v23.receiver = self;
  v23.super_class = (Class)CIDVUIProofingConfiguration;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(CIDVUIProofingConfiguration *)&v23 init];
  -[CIDVUIProofingConfiguration setState:](v21, "setState:", v20, v23.receiver, v23.super_class);

  [(CIDVUIProofingConfiguration *)v21 setCountry:v19];
  [(CIDVUIProofingConfiguration *)v21 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v21 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v21 setCredentialIdentifier:v18];

  [(CIDVUIProofingConfiguration *)v21 setProductIdentifier:v17];
  [(CIDVUIProofingConfiguration *)v21 setAccountKeyIdentifier:v16];

  [(CIDVUIProofingConfiguration *)v21 setIdType:a10];
  return v21;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 supplementalProvisioningData:(id)a11
{
  v25.receiver = self;
  v25.super_class = (Class)CIDVUIProofingConfiguration;
  id v17 = a11;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  objc_super v23 = [(CIDVUIProofingConfiguration *)&v25 init];
  [(CIDVUIProofingConfiguration *)v23 setState:v22];

  [(CIDVUIProofingConfiguration *)v23 setCountry:v21];
  [(CIDVUIProofingConfiguration *)v23 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v23 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v23 setCredentialIdentifier:v20];

  [(CIDVUIProofingConfiguration *)v23 setProductIdentifier:v19];
  [(CIDVUIProofingConfiguration *)v23 setAccountKeyIdentifier:v18];

  [(CIDVUIProofingConfiguration *)v23 setIdType:a10];
  [(CIDVUIProofingConfiguration *)v23 setSupplementalProvisioningData:v17];

  return v23;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 extendedReviewURL:(id)a11 learnMoreURL:(id)a12 supplementalProvisioningData:(id)a13
{
  v29.receiver = self;
  v29.super_class = (Class)CIDVUIProofingConfiguration;
  id v17 = a13;
  id v18 = a12;
  id v19 = a11;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a4;
  id v24 = a3;
  objc_super v25 = [(CIDVUIProofingConfiguration *)&v29 init];
  [(CIDVUIProofingConfiguration *)v25 setState:v24];

  [(CIDVUIProofingConfiguration *)v25 setCountry:v23];
  [(CIDVUIProofingConfiguration *)v25 setTarget:a5];
  [(CIDVUIProofingConfiguration *)v25 setStatus:a6];
  [(CIDVUIProofingConfiguration *)v25 setCredentialIdentifier:v22];

  [(CIDVUIProofingConfiguration *)v25 setProductIdentifier:v21];
  [(CIDVUIProofingConfiguration *)v25 setAccountKeyIdentifier:v20];

  [(CIDVUIProofingConfiguration *)v25 setIdType:a10];
  [(CIDVUIProofingConfiguration *)v25 setExtendedReviewURL:v19];

  [(CIDVUIProofingConfiguration *)v25 setLearnMoreURL:v18];
  [(CIDVUIProofingConfiguration *)v25 setSupplementalProvisioningData:v17];

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CIDVUIProofingConfiguration *)self state];
  [v4 encodeObject:v5 forKey:@"state"];

  v6 = [(CIDVUIProofingConfiguration *)self country];
  [v4 encodeObject:v6 forKey:@"country"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration target](self, "target"), @"target");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration status](self, "status"), @"status");
  v7 = [(CIDVUIProofingConfiguration *)self credentialIdentifier];
  [v4 encodeObject:v7 forKey:@"credentialIdentifier"];

  v8 = [(CIDVUIProofingConfiguration *)self productIdentifier];
  [v4 encodeObject:v8 forKey:@"productIdentifier"];

  v9 = [(CIDVUIProofingConfiguration *)self accountKeyIdentifier];
  [v4 encodeObject:v9 forKey:@"accountKeyIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration idType](self, "idType"), @"idType");
  v10 = [(CIDVUIProofingConfiguration *)self learnMoreURL];
  [v4 encodeObject:v10 forKey:@"learnMoreURL"];

  v11 = [(CIDVUIProofingConfiguration *)self extendedReviewURL];
  [v4 encodeObject:v11 forKey:@"extendedReviewURL"];

  id v12 = [(CIDVUIProofingConfiguration *)self supplementalProvisioningData];
  [v4 encodeObject:v12 forKey:@"supplementalProvisioningData"];
}

- (CIDVUIProofingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
  state = self->_state;
  self->_state = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
  country = self->_country;
  self->_country = v7;

  self->_target = [v4 decodeIntegerForKey:@"target"];
  self->_status = [v4 decodeIntegerForKey:@"status"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
  credentialIdentifier = self->_credentialIdentifier;
  self->_credentialIdentifier = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
  productIdentifier = self->_productIdentifier;
  self->_productIdentifier = v11;

  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKeyIdentifier"];
  accountKeyIdentifier = self->_accountKeyIdentifier;
  self->_accountKeyIdentifier = v13;

  self->_idType = [v4 decodeIntegerForKey:@"idType"];
  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learnMoreURL"];
  learnMoreURL = self->_learnMoreURL;
  self->_learnMoreURL = v15;

  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedReviewURL"];
  extendedReviewURL = self->_extendedReviewURL;
  self->_extendedReviewURL = v17;

  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementalProvisioningData"];

  supplementalProvisioningData = self->_supplementalProvisioningData;
  self->_supplementalProvisioningData = v19;

  return self;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (NSURL)extendedReviewURL
{
  return self->_extendedReviewURL;
}

- (void)setExtendedReviewURL:(id)a3
{
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (NSData)supplementalProvisioningData
{
  return self->_supplementalProvisioningData;
}

- (void)setSupplementalProvisioningData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalProvisioningData, 0);
  objc_storeStrong((id *)&self->_extendedReviewURL, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end