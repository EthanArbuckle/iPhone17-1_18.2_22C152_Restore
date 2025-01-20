@interface DMTEnrollmentCompletionViewModel
+ (BOOL)supportsSecureCoding;
+ (id)detailTextForEnrollmentFailureWithLocalizedDeviceClass:(id)a3;
+ (id)detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:(id)a3 organizationName:(id)a4 organizationType:(int64_t)a5 mdmServerName:(id)a6;
+ (id)linkButtonTitle;
+ (id)symbolNameForEnrollmentFailure;
+ (id)symbolNameForSuccessfulEnrollment;
+ (id)titleForEnrollmentFailureWithLocalizedDeviceClass:(id)a3;
+ (id)verboseDescriptionTextForError:(id)a3;
- (BOOL)hasVerboseDescription;
- (DMTEnrollmentCompletionViewModel)initWithCoder:(id)a3;
- (NSString)buttonTitle;
- (NSString)detailText;
- (NSString)linkButtonTitle;
- (NSString)symbolName;
- (NSString)title;
- (NSString)verboseDescriptionText;
- (id)initForEnrollmentFailureWithError:(id)a3 localizedDeviceClass:(id)a4;
- (id)initSuccessfulEnrollmentInOrganizationName:(id)a3 organizationType:(int64_t)a4 mdmServerName:(id)a5 localizedDeviceClass:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMTEnrollmentCompletionViewModel

- (id)initSuccessfulEnrollmentInOrganizationName:(id)a3 organizationType:(int64_t)a4 mdmServerName:(id)a5 localizedDeviceClass:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v13 = [(DMTEnrollmentCompletionViewModel *)&v23 init];
  if (v13)
  {
    uint64_t v14 = +[DMTEnrollmentCompletionViewModel symbolNameForSuccessfulEnrollment];
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v14;

    uint64_t v16 = DMTSuccessfulEnrollmentTitleTextForDeviceClass(v12);
    title = v13->_title;
    v13->_title = (NSString *)v16;

    uint64_t v18 = +[DMTEnrollmentCompletionViewModel detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:v12 organizationName:v10 organizationType:a4 mdmServerName:v11];
    detailText = v13->_detailText;
    v13->_detailText = (NSString *)v18;

    uint64_t v20 = DMTCompletionButtonTitleForDeviceClass(v12);
    buttonTitle = v13->_buttonTitle;
    v13->_buttonTitle = (NSString *)v20;
  }
  return v13;
}

- (id)initForEnrollmentFailureWithError:(id)a3 localizedDeviceClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v8 = [(DMTEnrollmentCompletionViewModel *)&v22 init];
  if (v8)
  {
    uint64_t v9 = +[DMTEnrollmentCompletionViewModel symbolNameForEnrollmentFailure];
    symbolName = v8->_symbolName;
    v8->_symbolName = (NSString *)v9;

    uint64_t v11 = +[DMTEnrollmentCompletionViewModel titleForEnrollmentFailureWithLocalizedDeviceClass:v7];
    title = v8->_title;
    v8->_title = (NSString *)v11;

    uint64_t v13 = +[DMTEnrollmentCompletionViewModel detailTextForEnrollmentFailureWithLocalizedDeviceClass:v7];
    detailText = v8->_detailText;
    v8->_detailText = (NSString *)v13;

    uint64_t v15 = +[DMTEnrollmentCompletionViewModel verboseDescriptionTextForError:v6];
    verboseDescriptionText = v8->_verboseDescriptionText;
    v8->_verboseDescriptionText = (NSString *)v15;

    uint64_t v17 = +[DMTEnrollmentCompletionViewModel linkButtonTitle];
    linkButtonTitle = v8->_linkButtonTitle;
    v8->_linkButtonTitle = (NSString *)v17;

    uint64_t v19 = DMTCompletionButtonTitleForDeviceClass(v7);
    buttonTitle = v8->_buttonTitle;
    v8->_buttonTitle = (NSString *)v19;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTEnrollmentCompletionViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v5 = [(DMTEnrollmentCompletionViewModel *)&v25 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"symbolName"];
    symbolName = v5->_symbolName;
    v5->_symbolName = v7;

    objc_storeStrong((id *)&v5->_symbolName, v7);
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"title"];
    title = v5->_title;
    v5->_title = v10;

    objc_storeStrong((id *)&v5->_title, v10);
    id v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"detailText"];
    detailText = v5->_detailText;
    v5->_detailText = v13;

    objc_storeStrong((id *)&v5->_detailText, v13);
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"verboseDescriptionText"];
    verboseDescriptionText = v5->_verboseDescriptionText;
    v5->_verboseDescriptionText = v16;

    objc_storeStrong((id *)&v5->_verboseDescriptionText, v16);
    uint64_t v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"linkButtonTitle"];
    linkButtonTitle = v5->_linkButtonTitle;
    v5->_linkButtonTitle = v19;

    objc_storeStrong((id *)&v5->_linkButtonTitle, v19);
    v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    objc_super v22 = [v4 decodeObjectOfClasses:v21 forKey:@"buttonTitle"];
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = v22;

    objc_storeStrong((id *)&v5->_buttonTitle, v22);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMTEnrollmentCompletionViewModel *)self symbolName];
  [v4 encodeObject:v5 forKey:@"symbolName"];

  id v6 = [(DMTEnrollmentCompletionViewModel *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  id v7 = [(DMTEnrollmentCompletionViewModel *)self detailText];
  [v4 encodeObject:v7 forKey:@"detailText"];

  v8 = [(DMTEnrollmentCompletionViewModel *)self verboseDescriptionText];
  [v4 encodeObject:v8 forKey:@"verboseDescriptionText"];

  uint64_t v9 = [(DMTEnrollmentCompletionViewModel *)self linkButtonTitle];
  [v4 encodeObject:v9 forKey:@"linkButtonTitle"];

  id v10 = [(DMTEnrollmentCompletionViewModel *)self buttonTitle];
  [v4 encodeObject:v10 forKey:@"buttonTitle"];
}

- (BOOL)hasVerboseDescription
{
  v3 = [(DMTEnrollmentCompletionViewModel *)self verboseDescriptionText];
  if ([v3 length])
  {
    id v4 = [(DMTEnrollmentCompletionViewModel *)self linkButtonTitle];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)linkButtonTitle
{
  v2 = DMTBundle();
  v3 = [v2 localizedStringForKey:@"View Details…" value:&stru_26E10D868 table:0];

  return v3;
}

+ (id)symbolNameForSuccessfulEnrollment
{
  return @"checkmark.circle";
}

+ (id)detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:(id)a3 organizationName:(id)a4 organizationType:(int64_t)a5 mdmServerName:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = DMTFormattedEnrollmentOrganizationNameFrom((uint64_t)a4);
  id v12 = DMTLocalizedOrganizationMarketingNameForOrganizationType(a5);
  if ([v9 length])
  {
    uint64_t v13 = DMTDetailTextSuccessfulEnrollmentWithMDMServerFor(v10);

    [NSString stringWithValidatedFormat:v13, @"%@%@%@", 0, v11, v9, v12 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v13 = DMTDetailTextSuccessfulEnrollmentFor(v10);

    [NSString stringWithValidatedFormat:v13, @"%@%@", 0, v11, v12, v16 validFormatSpecifiers error];
  uint64_t v14 = };

  return v14;
}

+ (id)symbolNameForEnrollmentFailure
{
  return @"exclamationmark.triangle";
}

+ (id)titleForEnrollmentFailureWithLocalizedDeviceClass:(id)a3
{
  return DMTTitleTextFailureEnrollmentFor(a3);
}

+ (id)detailTextForEnrollmentFailureWithLocalizedDeviceClass:(id)a3
{
  return DMTDetailTextFailureEnrollmentFor(a3);
}

+ (id)verboseDescriptionTextForError:(id)a3
{
  return (id)[a3 verboseDescription];
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)verboseDescriptionText
{
  return self->_verboseDescriptionText;
}

- (NSString)linkButtonTitle
{
  return self->_linkButtonTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_linkButtonTitle, 0);
  objc_storeStrong((id *)&self->_verboseDescriptionText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end