@interface ASDBetaAppFeedbackMetadata
+ (BOOL)supportsSecureCoding;
- (ASDBetaAppFeedbackMetadata)initWithCoder:(id)a3;
- (ASDBetaAppVersion)version;
- (BOOL)isEqual:(id)a3;
- (NSString)email;
- (NSString)incidentID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEmail:(id)a3;
- (void)setIncidentID:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ASDBetaAppFeedbackMetadata

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ - %@", self->_version, self->_email];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (ASDBetaAppFeedbackMetadata *)a3;
  if (self == v5)
  {
    char v7 = 1;
    goto LABEL_5;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v9 = [(ASDBetaAppFeedbackMetadata *)self incidentID];
    if (v9
      || ([(ASDBetaAppFeedbackMetadata *)v5 incidentID],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = [(ASDBetaAppFeedbackMetadata *)self incidentID];
      v11 = [(ASDBetaAppFeedbackMetadata *)v5 incidentID];
      int v12 = [v10 isEqualToString:v11];

      if (v9)
      {

        if (!v12) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v12 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    v13 = [(ASDBetaAppFeedbackMetadata *)self email];
    if (v13
      || ([(ASDBetaAppFeedbackMetadata *)v5 email], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(ASDBetaAppFeedbackMetadata *)self email];
      v15 = [(ASDBetaAppFeedbackMetadata *)v5 email];
      int v16 = [v14 isEqualToString:v15];

      if (v13)
      {

        if (!v16) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v16 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    v17 = [(ASDBetaAppFeedbackMetadata *)self version];
    v18 = [(ASDBetaAppFeedbackMetadata *)v5 version];
    char v7 = [v17 isEqual:v18];

    goto LABEL_5;
  }
LABEL_3:
  char v7 = 0;
LABEL_5:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  incidentID = self->_incidentID;
  id v5 = a3;
  [v5 encodeObject:incidentID forKey:@"A"];
  [v5 encodeObject:self->_email forKey:@"B"];
  [v5 encodeObject:self->_version forKey:@"C"];
}

- (ASDBetaAppFeedbackMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDBetaAppFeedbackMetadata;
  id v5 = [(ASDBetaAppFeedbackMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    incidentID = v5->_incidentID;
    v5->_incidentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    email = v5->_email;
    v5->_email = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"C"];
    version = v5->_version;
    v5->_version = (ASDBetaAppVersion *)v10;
  }
  return v5;
}

- (NSString)incidentID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncidentID:(id)a3
{
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmail:(id)a3
{
}

- (ASDBetaAppVersion)version
{
  return (ASDBetaAppVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
}

@end