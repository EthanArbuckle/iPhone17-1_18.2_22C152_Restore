@interface DMTEnrollmentStatusViewModel
+ (BOOL)supportsSecureCoding;
+ (id)detailTextWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5;
+ (id)statusMessageForEnrollmentState:(int64_t)a3 networkName:(id)a4;
+ (id)titleWithLocalizedDeviceClass:(id)a3;
- (DMTEnrollmentStatusViewModel)initWithCoder:(id)a3;
- (DMTEnrollmentStatusViewModel)initWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5 enrollmentState:(int64_t)a6 networkName:(id)a7;
- (NSString)detailText;
- (NSString)statusMessage;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMTEnrollmentStatusViewModel

- (DMTEnrollmentStatusViewModel)initWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5 enrollmentState:(int64_t)a6 networkName:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)DMTEnrollmentStatusViewModel;
  v15 = [(DMTEnrollmentStatusViewModel *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [(id)objc_opt_class() titleWithLocalizedDeviceClass:v13];
    title = v15->_title;
    v15->_title = (NSString *)v16;

    uint64_t v18 = [(id)objc_opt_class() detailTextWithOrganizationName:v12 organizationType:a4 localizedDeviceClass:v13];
    detailText = v15->_detailText;
    v15->_detailText = (NSString *)v18;

    uint64_t v20 = [(id)objc_opt_class() statusMessageForEnrollmentState:a6 networkName:v14];
    statusMessage = v15->_statusMessage;
    v15->_statusMessage = (NSString *)v20;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTEnrollmentStatusViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMTEnrollmentStatusViewModel;
  v5 = [(DMTEnrollmentStatusViewModel *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = v7;

    objc_storeStrong((id *)&v5->_title, v7);
    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"detailText"];
    detailText = v5->_detailText;
    v5->_detailText = v10;

    objc_storeStrong((id *)&v5->_detailText, v10);
    id v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"statusMessage"];
    statusMessage = v5->_statusMessage;
    v5->_statusMessage = v13;

    objc_storeStrong((id *)&v5->_statusMessage, v13);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMTEnrollmentStatusViewModel *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(DMTEnrollmentStatusViewModel *)self detailText];
  [v4 encodeObject:v6 forKey:@"detailText"];

  id v7 = [(DMTEnrollmentStatusViewModel *)self statusMessage];
  [v4 encodeObject:v7 forKey:@"statusMessage"];
}

+ (id)titleWithLocalizedDeviceClass:(id)a3
{
  return DMTTitleTextAddingDeviceFor(a3);
}

+ (id)detailTextWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5
{
  id v7 = a3;
  v8 = DMTDetailTextAddingDeviceBodyFor(a5);
  v9 = DMTFormattedEnrollmentOrganizationNameFrom((uint64_t)v7);

  v10 = DMTLocalizedOrganizationMarketingNameForOrganizationType(a4);
  v11 = [NSString stringWithValidatedFormat:v8, @"%@%@", 0, v9, v10 validFormatSpecifiers error];

  return v11;
}

+ (id)statusMessageForEnrollmentState:(int64_t)a3 networkName:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 4:
      id v7 = DMTBundle();
      v8 = v7;
      v9 = @"Pairing…";
      goto LABEL_10;
    case 5:
      id v7 = DMTBundle();
      v8 = v7;
      v9 = @"Receiving organization details…";
      goto LABEL_10;
    case 6:
      id v7 = DMTBundle();
      v8 = v7;
      v9 = @"Starting enrollment…";
      goto LABEL_10;
    case 7:
      uint64_t v11 = [v5 length];
      id v7 = DMTBundle();
      v8 = v7;
      if (v11)
      {
        uint64_t v12 = [v7 localizedStringForKey:@"Connecting to network “%@”…" value:&stru_26E10D868 table:0];

        objc_msgSend(NSString, "stringWithFormat:", v12, v6);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)v12;
      }
      else
      {
        v9 = @"Connecting to network…";
LABEL_10:
        v10 = [v7 localizedStringForKey:v9 value:&stru_26E10D868 table:0];
      }

LABEL_12:
      return v10;
    case 8:
      id v7 = DMTBundle();
      v8 = v7;
      v9 = @"Activating…";
      goto LABEL_10;
    case 9:
      id v7 = DMTBundle();
      v8 = v7;
      v9 = @"Adding…";
      goto LABEL_10;
    default:
      v10 = &stru_26E10D868;
      goto LABEL_12;
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end