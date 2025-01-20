@interface MADVIUserFeedbackRequest
+ (BOOL)supportsSecureCoding;
- (MADVIUserFeedbackRequest)initWithCoder:(id)a3;
- (MADVIUserFeedbackRequest)initWithPayload:(id)a3 andReportIdentifier:(id)a4;
- (MADVIUserFeedbackRequest)initWithUserFeedbackPayload:(id)a3 sfReportData:(id)a4 reportIdentifier:(id)a5;
- (NSData)sfReportData;
- (NSData)userFeedbackPayload;
- (NSString)reportIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIUserFeedbackRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIUserFeedbackRequest)initWithPayload:(id)a3 andReportIdentifier:(id)a4
{
  return [(MADVIUserFeedbackRequest *)self initWithUserFeedbackPayload:a3 sfReportData:0 reportIdentifier:a4];
}

- (MADVIUserFeedbackRequest)initWithUserFeedbackPayload:(id)a3 sfReportData:(id)a4 reportIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADVIUserFeedbackRequest;
  v12 = [(MADVIUserFeedbackRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userFeedbackPayload, a3);
    objc_storeStrong((id *)&v13->_sfReportData, a4);
    objc_storeStrong((id *)&v13->_reportIdentifier, a5);
  }

  return v13;
}

- (MADVIUserFeedbackRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVIUserFeedbackRequest;
  v5 = [(MADRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserFeedbackPayload"];
    userFeedbackPayload = v5->_userFeedbackPayload;
    v5->_userFeedbackPayload = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFReportData"];
    sfReportData = v5->_sfReportData;
    v5->_sfReportData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReportIdentifier"];
    reportIdentifier = v5->_reportIdentifier;
    v5->_reportIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIUserFeedbackRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_userFeedbackPayload, @"UserFeedbackPayload", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sfReportData forKey:@"SFReportData"];
  [v4 encodeObject:self->_reportIdentifier forKey:@"ReportIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"userFeedbackPayload: %@, ", self->_userFeedbackPayload];
  [v3 appendFormat:@"sfReportData: %@, ", self->_sfReportData];
  [v3 appendFormat:@"reportIdentifier: %@, ", self->_reportIdentifier];
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (NSData)sfReportData
{
  return self->_sfReportData;
}

- (NSString)reportIdentifier
{
  return self->_reportIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIdentifier, 0);
  objc_storeStrong((id *)&self->_sfReportData, 0);
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
}

@end