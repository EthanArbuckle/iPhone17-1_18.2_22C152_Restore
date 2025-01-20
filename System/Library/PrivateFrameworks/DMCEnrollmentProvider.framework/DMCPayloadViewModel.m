@interface DMCPayloadViewModel
+ (BOOL)supportsSecureCoding;
+ (id)accountPayloadClasses;
+ (id)managedAppClasses;
+ (id)managedBookClasses;
+ (id)payloadViewModelsFromPayload:(id)a3;
+ (id)removeDuplicatesFromRestrictionPayloadViewModels:(id)a3;
+ (id)restrictionPayloadClasses;
+ (int64_t)payloadTypeForPayloadClass:(Class)a3;
- (BOOL)hasDetails;
- (BOOL)isCertificate;
- (BOOL)isManagedAppPayload;
- (BOOL)isManagedBookPayload;
- (BOOL)showIcon;
- (DMCApplicationProxy)managedApp;
- (DMCPayloadViewModel)initWithCoder:(id)a3;
- (DMCPayloadViewModel)initWithManagedApp:(id)a3;
- (DMCPayloadViewModel)initWithManagedBook:(id)a3;
- (DMCPayloadViewModel)initWithPayload:(id)a3;
- (MDMBook)managedBook;
- (NSArray)certificateProperties;
- (NSArray)payloadDescriptionKeyValueSections;
- (NSArray)typeStrings;
- (NSDate)certificateExpirationDate;
- (NSString)friendlyName;
- (NSString)localizedPluralForm;
- (NSString)localizedSingularForm;
- (NSString)subtitle1Description;
- (NSString)subtitle1Label;
- (NSString)subtitle2Description;
- (NSString)subtitle2Label;
- (NSString)title;
- (id)_sendableCertificateProperties;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificateExpirationDate:(id)a3;
- (void)setCertificateProperties:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setHasDetails:(BOOL)a3;
- (void)setIsCertificate:(BOOL)a3;
- (void)setIsManagedAppPayload:(BOOL)a3;
- (void)setIsManagedBookPayload:(BOOL)a3;
- (void)setLocalizedPluralForm:(id)a3;
- (void)setLocalizedSingularForm:(id)a3;
- (void)setManagedApp:(id)a3;
- (void)setManagedBook:(id)a3;
- (void)setPayloadDescriptionKeyValueSections:(id)a3;
- (void)setShowIcon:(BOOL)a3;
- (void)setSubtitle1Description:(id)a3;
- (void)setSubtitle1Label:(id)a3;
- (void)setSubtitle2Description:(id)a3;
- (void)setSubtitle2Label:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeStrings:(id)a3;
@end

@implementation DMCPayloadViewModel

+ (id)accountPayloadClasses
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)accountPayloadClasses_accountPayloadClasses;
  if (!accountPayloadClasses_accountPayloadClasses)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    v6[4] = objc_opt_class();
    v6[5] = objc_opt_class();
    v6[6] = objc_opt_class();
    v6[7] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
    v4 = (void *)accountPayloadClasses_accountPayloadClasses;
    accountPayloadClasses_accountPayloadClasses = v3;

    v2 = (void *)accountPayloadClasses_accountPayloadClasses;
  }
  return v2;
}

+ (id)managedAppClasses
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)managedAppClasses_managedAppPayloadClasses;
  if (!managedAppClasses_managedAppPayloadClasses)
  {
    v6[0] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    v4 = (void *)managedAppClasses_managedAppPayloadClasses;
    managedAppClasses_managedAppPayloadClasses = v3;

    v2 = (void *)managedAppClasses_managedAppPayloadClasses;
  }
  return v2;
}

+ (id)managedBookClasses
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)managedBookClasses_managedBookPayloadClasses;
  if (!managedBookClasses_managedBookPayloadClasses)
  {
    v6[0] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    v4 = (void *)managedBookClasses_managedBookPayloadClasses;
    managedBookClasses_managedBookPayloadClasses = v3;

    v2 = (void *)managedBookClasses_managedBookPayloadClasses;
  }
  return v2;
}

+ (id)restrictionPayloadClasses
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
  if (!restrictionPayloadClasses_restrictionPayloadClasses)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    void v6[2] = objc_opt_class();
    v6[3] = objc_opt_class();
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
    v4 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
    restrictionPayloadClasses_restrictionPayloadClasses = v3;

    v2 = (void *)restrictionPayloadClasses_restrictionPayloadClasses;
  }
  return v2;
}

+ (int64_t)payloadTypeForPayloadClass:(Class)a3
{
  v4 = +[DMCPayloadViewModel accountPayloadClasses];
  char v5 = [v4 containsObject:a3];

  if (v5) {
    return 1;
  }
  v7 = +[DMCPayloadViewModel managedAppClasses];
  char v8 = [v7 containsObject:a3];

  if (v8) {
    return 2;
  }
  v9 = +[DMCPayloadViewModel managedBookClasses];
  char v10 = [v9 containsObject:a3];

  if (v10) {
    return 3;
  }
  v11 = +[DMCPayloadViewModel restrictionPayloadClasses];
  int v12 = [v11 containsObject:a3];

  if (v12) {
    return 4;
  }
  else {
    return 5;
  }
}

+ (id)payloadViewModelsFromPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = (DMCPayloadViewModel *)v3;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v6 = [(DMCPayloadViewModel *)v5 localizedRestrictionStrings];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            int v12 = [[DMCPayloadViewModel alloc] initWithPayload:v5];
            [(DMCPayloadViewModel *)v12 setTitle:v11];
            [(DMCPayloadViewModel *)v12 setSubtitle1Label:0];
            [(DMCPayloadViewModel *)v12 setSubtitle1Description:0];
            [(DMCPayloadViewModel *)v12 setShowIcon:0];
            [v4 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }
    }
    else
    {
      char v5 = [[DMCPayloadViewModel alloc] initWithPayload:v3];
      [v4 addObject:v5];
    }

    v13 = (void *)[v4 copy];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)removeDuplicatesFromRestrictionPayloadViewModels:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "title", (void)v14);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  int v12 = [v4 allValues];

  return v12;
}

- (DMCPayloadViewModel)initWithManagedApp:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMCPayloadViewModel;
  uint64_t v6 = [(DMCPayloadViewModel *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 bundleID];
    title = v6->_title;
    v6->_title = (NSString *)v7;

    uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APPS_SINGULAR");
    localizedSingularForm = v6->_localizedSingularForm;
    v6->_localizedSingularForm = (NSString *)v9;

    uint64_t v11 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APPS_PLURAL");
    localizedPluralForm = v6->_localizedPluralForm;
    v6->_localizedPluralForm = (NSString *)v11;

    typeStrings = v6->_typeStrings;
    v6->_typeStrings = (NSArray *)&unk_26D44B0C8;

    payloadDescriptionKeyValueSections = v6->_payloadDescriptionKeyValueSections;
    v6->_payloadDescriptionKeyValueSections = 0;

    v6->_showIcon = 1;
    objc_storeStrong((id *)&v6->_managedApp, a3);
    v6->_isManagedAppPayload = 1;
    v6->_hasDetails = 1;
  }

  return v6;
}

- (DMCPayloadViewModel)initWithManagedBook:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMCPayloadViewModel;
  uint64_t v6 = [(DMCPayloadViewModel *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 friendlyName];
    title = v6->_title;
    v6->_title = (NSString *)v7;

    uint64_t v9 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_BOOKS_SINGULAR");
    localizedSingularForm = v6->_localizedSingularForm;
    v6->_localizedSingularForm = (NSString *)v9;

    uint64_t v11 = DMCEnrollmentLocalizedString(@"DMC_MANAGED_APPS_PLURAL");
    localizedPluralForm = v6->_localizedPluralForm;
    v6->_localizedPluralForm = (NSString *)v11;

    typeStrings = v6->_typeStrings;
    v6->_typeStrings = (NSArray *)&unk_26D44B0E0;

    payloadDescriptionKeyValueSections = v6->_payloadDescriptionKeyValueSections;
    v6->_payloadDescriptionKeyValueSections = 0;

    v6->_showIcon = 1;
    objc_storeStrong((id *)&v6->_managedBook, a3);
    v6->_isManagedBookPayload = 1;
    v6->_hasDetails = 1;
  }

  return v6;
}

- (DMCPayloadViewModel)initWithPayload:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DMCPayloadViewModel;
  id v5 = [(DMCPayloadViewModel *)&v37 init];
  if (v5)
  {
    v5->_type = +[DMCPayloadViewModel payloadTypeForPayloadClass:objc_opt_class()];
    uint64_t v6 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [(id)objc_opt_class() localizedSingularForm];
    localizedSingularForm = v5->_localizedSingularForm;
    v5->_localizedSingularForm = (NSString *)v8;

    uint64_t v10 = [(id)objc_opt_class() localizedPluralForm];
    localizedPluralForm = v5->_localizedPluralForm;
    v5->_localizedPluralForm = (NSString *)v10;

    uint64_t v12 = [(id)objc_opt_class() typeStrings];
    typeStrings = v5->_typeStrings;
    v5->_typeStrings = (NSArray *)v12;

    uint64_t v14 = [v4 payloadDescriptionKeyValueSections];
    payloadDescriptionKeyValueSections = v5->_payloadDescriptionKeyValueSections;
    v5->_payloadDescriptionKeyValueSections = (NSArray *)v14;

    uint64_t v16 = [v4 friendlyName];
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v16;

    uint64_t v18 = [v4 title];
    uint64_t v19 = v5->_title;
    v5->_title = (NSString *)v18;

    uint64_t v20 = [v4 subtitle1Label];
    subtitle1Label = v5->_subtitle1Label;
    v5->_subtitle1Label = (NSString *)v20;

    uint64_t v22 = [v4 subtitle1Description];
    subtitle1Description = v5->_subtitle1Description;
    v5->_subtitle1Description = (NSString *)v22;

    uint64_t v24 = [v4 subtitle2Label];
    subtitle2Label = v5->_subtitle2Label;
    v5->_subtitle2Label = (NSString *)v24;

    uint64_t v26 = [v4 subtitle2Description];
    subtitle2Description = v5->_subtitle2Description;
    v5->_subtitle2Description = (NSString *)v26;

    objc_opt_class();
    v5->_isCertificate = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v5->_isManagedAppPayload = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v5->_isManagedBookPayload = objc_opt_isKindOfClass() & 1;
    if (v5->_isCertificate || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v28 = [v4 copyCertificate];
      if (v28)
      {
        v29 = (const void *)v28;
        v30 = (void *)SecCertificateCopyProperties();
        if (v30)
        {
          v31 = v30;
          objc_storeStrong((id *)&v5->_certificateProperties, v30);
          CFRelease(v31);
        }
        SecCertificateNotValidAfter();
        uint64_t v32 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:");
        certificateExpirationDate = v5->_certificateExpirationDate;
        v5->_certificateExpirationDate = (NSDate *)v32;

        CFRelease(v29);
      }
    }
    v5->_showIcon = 1;
    v34 = v5->_payloadDescriptionKeyValueSections;
    BOOL v35 = v34 && [(NSArray *)v34 count]
       || v5->_isManagedAppPayload
       || v5->_isManagedBookPayload
       || v5->_certificateProperties != 0;
    v5->_hasDetails = v35;
  }

  return v5;
}

- (id)_sendableCertificateProperties
{
  return +[DMCCertificateProperties sendablePropertiesFromProperties:self->_certificateProperties];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCPayloadViewModel *)self typeStrings];
  [v4 encodeObject:v5 forKey:@"typeStrings"];

  uint64_t v6 = [(DMCPayloadViewModel *)self localizedSingularForm];
  [v4 encodeObject:v6 forKey:@"localizedSingularForm"];

  uint64_t v7 = [(DMCPayloadViewModel *)self localizedPluralForm];
  [v4 encodeObject:v7 forKey:@"localizedPluralForm"];

  uint64_t v8 = [(DMCPayloadViewModel *)self payloadDescriptionKeyValueSections];
  [v4 encodeObject:v8 forKey:@"payloadDescriptionKeyValueSections"];

  uint64_t v9 = [(DMCPayloadViewModel *)self friendlyName];
  [v4 encodeObject:v9 forKey:@"friendlyName"];

  uint64_t v10 = [(DMCPayloadViewModel *)self title];
  [v4 encodeObject:v10 forKey:@"title"];

  uint64_t v11 = [(DMCPayloadViewModel *)self subtitle1Label];
  [v4 encodeObject:v11 forKey:@"subtitle1Label"];

  uint64_t v12 = [(DMCPayloadViewModel *)self subtitle1Description];
  [v4 encodeObject:v12 forKey:@"subtitle1Description"];

  v13 = [(DMCPayloadViewModel *)self subtitle2Label];
  [v4 encodeObject:v13 forKey:@"subtitle2Label"];

  uint64_t v14 = [(DMCPayloadViewModel *)self subtitle2Description];
  [v4 encodeObject:v14 forKey:@"subtitle2Description"];

  long long v15 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCPayloadViewModel showIcon](self, "showIcon"));
  [v4 encodeObject:v15 forKey:@"showIcon"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCPayloadViewModel hasDetails](self, "hasDetails"));
  [v4 encodeObject:v16 forKey:@"hasDetails"];

  long long v17 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCPayloadViewModel isCertificate](self, "isCertificate"));
  [v4 encodeObject:v17 forKey:@"isCertificate"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCPayloadViewModel isManagedAppPayload](self, "isManagedAppPayload"));
  [v4 encodeObject:v18 forKey:@"isManagedAppPayload"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[DMCPayloadViewModel isManagedBookPayload](self, "isManagedBookPayload"));
  [v4 encodeObject:v19 forKey:@"isManagedBookPayload"];

  uint64_t v20 = [(DMCPayloadViewModel *)self managedApp];
  [v4 encodeObject:v20 forKey:@"managedApp"];

  v21 = [(DMCPayloadViewModel *)self managedBook];
  [v4 encodeObject:v21 forKey:@"managedBook"];

  uint64_t v22 = [(DMCPayloadViewModel *)self certificateExpirationDate];
  [v4 encodeObject:v22 forKey:@"certificateExpirationDate"];

  v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMCPayloadViewModel type](self, "type"));
  [v4 encodeObject:v23 forKey:@"type"];

  id v24 = [(DMCPayloadViewModel *)self _sendableCertificateProperties];
  [v4 encodeObject:v24 forKey:@"certificateProperties"];
}

- (DMCPayloadViewModel)initWithCoder:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)DMCPayloadViewModel;
  id v5 = [(DMCPayloadViewModel *)&v73 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"typeStrings"];
    typeStrings = v5->_typeStrings;
    v5->_typeStrings = (NSArray *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"localizedSingularForm"];
    localizedSingularForm = v5->_localizedSingularForm;
    v5->_localizedSingularForm = (NSString *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"localizedPluralForm"];
    localizedPluralForm = v5->_localizedPluralForm;
    v5->_localizedPluralForm = (NSString *)v15;

    long long v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"payloadDescriptionKeyValueSections"];
    payloadDescriptionKeyValueSections = v5->_payloadDescriptionKeyValueSections;
    v5->_payloadDescriptionKeyValueSections = (NSArray *)v20;

    uint64_t v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"friendlyName"];
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v23;

    v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v26;

    uint64_t v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"subtitle1Label"];
    subtitle1Label = v5->_subtitle1Label;
    v5->_subtitle1Label = (NSString *)v29;

    v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"subtitle1Description"];
    subtitle1Description = v5->_subtitle1Description;
    v5->_subtitle1Description = (NSString *)v32;

    v34 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"subtitle2Label"];
    subtitle2Label = v5->_subtitle2Label;
    v5->_subtitle2Label = (NSString *)v35;

    objc_super v37 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"subtitle2Description"];
    subtitle2Description = v5->_subtitle2Description;
    v5->_subtitle2Description = (NSString *)v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showIcon"];
    v5->_showIcon = [v40 BOOLValue];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasDetails"];
    v5->_hasDetails = [v41 BOOLValue];

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCertificate"];
    v5->_isCertificate = [v42 BOOLValue];

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isManagedAppPayload"];
    v5->_isManagedAppPayload = [v43 BOOLValue];

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isManagedBookPayload"];
    v5->_isManagedBookPayload = [v44 BOOLValue];

    v45 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"managedApp"];
    managedApp = v5->_managedApp;
    v5->_managedApp = (DMCApplicationProxy *)v46;

    v48 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"managedBook"];
    managedBook = v5->_managedBook;
    v5->_managedBook = (MDMBook *)v49;

    v51 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v52 = [v4 decodeObjectOfClasses:v51 forKey:@"certificateExpirationDate"];
    certificateExpirationDate = v5->_certificateExpirationDate;
    v5->_certificateExpirationDate = (NSDate *)v52;

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v54 integerValue];

    v72 = (void *)MEMORY[0x263EFFA08];
    uint64_t v71 = objc_opt_class();
    uint64_t v70 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(v72, "setWithObjects:", v71, v70, v55, v56, v57, v58, v59, v60, v61, v62, objc_opt_class(), 0);
    uint64_t v64 = [v4 decodeObjectOfClasses:v63 forKey:@"certificateProperties"];
    certificateProperties = v5->_certificateProperties;
    v5->_certificateProperties = (NSArray *)v64;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v66 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = v5->_certificateProperties;
        *(_DWORD *)buf = 138543362;
        v75 = v67;
        _os_log_impl(&dword_221CC5000, v66, OS_LOG_TYPE_ERROR, "DMCPayloadViewModel decoder encountered invalid certificateProperties array: %{public}@", buf, 0xCu);
      }
      v68 = v5->_certificateProperties;
      v5->_certificateProperties = (NSArray *)MEMORY[0x263EFFA68];
    }
  }

  return v5;
}

- (NSArray)typeStrings
{
  return self->_typeStrings;
}

- (void)setTypeStrings:(id)a3
{
}

- (NSString)localizedSingularForm
{
  return self->_localizedSingularForm;
}

- (void)setLocalizedSingularForm:(id)a3
{
}

- (NSString)localizedPluralForm
{
  return self->_localizedPluralForm;
}

- (void)setLocalizedPluralForm:(id)a3
{
}

- (NSArray)payloadDescriptionKeyValueSections
{
  return self->_payloadDescriptionKeyValueSections;
}

- (void)setPayloadDescriptionKeyValueSections:(id)a3
{
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle1Label
{
  return self->_subtitle1Label;
}

- (void)setSubtitle1Label:(id)a3
{
}

- (NSString)subtitle1Description
{
  return self->_subtitle1Description;
}

- (void)setSubtitle1Description:(id)a3
{
}

- (NSString)subtitle2Label
{
  return self->_subtitle2Label;
}

- (void)setSubtitle2Label:(id)a3
{
}

- (NSString)subtitle2Description
{
  return self->_subtitle2Description;
}

- (void)setSubtitle2Description:(id)a3
{
}

- (BOOL)showIcon
{
  return self->_showIcon;
}

- (void)setShowIcon:(BOOL)a3
{
  self->_showIcon = a3;
}

- (BOOL)hasDetails
{
  return self->_hasDetails;
}

- (void)setHasDetails:(BOOL)a3
{
  self->_hasDetails = a3;
}

- (BOOL)isCertificate
{
  return self->_isCertificate;
}

- (void)setIsCertificate:(BOOL)a3
{
  self->_isCertificate = a3;
}

- (BOOL)isManagedAppPayload
{
  return self->_isManagedAppPayload;
}

- (void)setIsManagedAppPayload:(BOOL)a3
{
  self->_isManagedAppPayload = a3;
}

- (BOOL)isManagedBookPayload
{
  return self->_isManagedBookPayload;
}

- (void)setIsManagedBookPayload:(BOOL)a3
{
  self->_isManagedBookPayload = a3;
}

- (DMCApplicationProxy)managedApp
{
  return self->_managedApp;
}

- (void)setManagedApp:(id)a3
{
}

- (MDMBook)managedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(id)a3
{
}

- (NSArray)certificateProperties
{
  return self->_certificateProperties;
}

- (void)setCertificateProperties:(id)a3
{
}

- (NSDate)certificateExpirationDate
{
  return self->_certificateExpirationDate;
}

- (void)setCertificateExpirationDate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateExpirationDate, 0);
  objc_storeStrong((id *)&self->_certificateProperties, 0);
  objc_storeStrong((id *)&self->_managedBook, 0);
  objc_storeStrong((id *)&self->_managedApp, 0);
  objc_storeStrong((id *)&self->_subtitle2Description, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle1Description, 0);
  objc_storeStrong((id *)&self->_subtitle1Label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_payloadDescriptionKeyValueSections, 0);
  objc_storeStrong((id *)&self->_localizedPluralForm, 0);
  objc_storeStrong((id *)&self->_localizedSingularForm, 0);
  objc_storeStrong((id *)&self->_typeStrings, 0);
}

@end