@interface MCAppLayerVPNPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)restrictDomains;
- (MCAppLayerVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)SMBDomains;
- (NSArray)SafariDomains;
- (NSArray)associatedDomains;
- (NSArray)calendarDomains;
- (NSArray)contactsDomains;
- (NSArray)excludedDomains;
- (NSArray)mailDomains;
- (NSString)VPNUUID;
- (id)filterForUserEnrollmentOutError:(id *)a3;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setAssociatedDomains:(id)a3;
- (void)setCalendarDomains:(id)a3;
- (void)setContactsDomains:(id)a3;
- (void)setExcludedDomains:(id)a3;
- (void)setMailDomains:(id)a3;
- (void)setSMBDomains:(id)a3;
- (void)setSafariDomains:(id)a3;
- (void)setVPNUUID:(id)a3;
@end

@implementation MCAppLayerVPNPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.vpn.managed.applayer";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"APP_LAYER_VPN_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"APP_LAYER_VPN_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAppLayerVPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)MCAppLayerVPNPayload;
  v10 = [(MCVPNPayloadBase *)&v51 initWithDictionary:v8 profile:v9 outError:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_25;
  }
  v10->_restrictDomains = 0;
  id v50 = 0;
  uint64_t v12 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"SafariDomains", 0, objc_msgSend(v9, "isStub"), &v50);
  id v13 = v50;
  SafariDomains = v11->_SafariDomains;
  v11->_SafariDomains = (NSArray *)v12;

  if (v13) {
    goto LABEL_16;
  }
  id v49 = 0;
  uint64_t v15 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"SMBDomains", 0, objc_msgSend(v9, "isStub"), &v49);
  id v13 = v49;
  SMBDomains = v11->_SMBDomains;
  v11->_SMBDomains = (NSArray *)v15;

  if (v13) {
    goto LABEL_16;
  }
  id v48 = 0;
  uint64_t v17 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"MailDomains", 0, objc_msgSend(v9, "isStub"), &v48);
  id v13 = v48;
  mailDomains = v11->_mailDomains;
  v11->_mailDomains = (NSArray *)v17;

  if (v13) {
    goto LABEL_16;
  }
  id v47 = 0;
  uint64_t v19 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"CalendarDomains", 0, objc_msgSend(v9, "isStub"), &v47);
  id v13 = v47;
  calendarDomains = v11->_calendarDomains;
  v11->_calendarDomains = (NSArray *)v19;

  if (v13) {
    goto LABEL_16;
  }
  id v46 = 0;
  uint64_t v21 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"ContactsDomains", 0, objc_msgSend(v9, "isStub"), &v46);
  id v13 = v46;
  contactsDomains = v11->_contactsDomains;
  v11->_contactsDomains = (NSArray *)v21;

  if (v13) {
    goto LABEL_16;
  }
  id v45 = 0;
  uint64_t v23 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"ExcludedDomains", 0, objc_msgSend(v9, "isStub"), &v45);
  id v13 = v45;
  excludedDomains = v11->_excludedDomains;
  v11->_excludedDomains = (NSArray *)v23;

  if (v13) {
    goto LABEL_16;
  }
  id v44 = 0;
  uint64_t v25 = objc_msgSend(v8, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", objc_opt_class(), @"AssociatedDomains", 0, objc_msgSend(v9, "isStub"), &v44);
  id v13 = v44;
  associatedDomains = v11->_associatedDomains;
  v11->_associatedDomains = (NSArray *)v25;

  if (v13) {
    goto LABEL_16;
  }
  if ([v9 isStub])
  {
    v27 = [(MCVPNPayloadBase *)v11 vpnType];
    int v28 = [v27 isEqualToString:@"AlwaysOn"];

    if (v28)
    {
      id v13 = +[MCPayload badFieldTypeErrorWithField:@"VPNType"];
      goto LABEL_15;
    }
    v42 = 0;
    uint64_t v29 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"VPNUUID" isRequired:0 outError:&v42];
    v30 = v42;
  }
  else
  {
    v43 = 0;
    uint64_t v29 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"VPNUUID" isRequired:1 outError:&v43];
    v30 = v43;
  }
  id v13 = v30;
  VPNUUID = v11->_VPNUUID;
  v11->_VPNUUID = (NSString *)v29;

LABEL_15:
  if (v13)
  {
LABEL_16:
    v32 = (void *)[v13 MCCopyAsPrimaryError];
    v33 = [(MCPayload *)v11 malformedPayloadErrorWithError:v32];

    if (a5) {
      *a5 = v33;
    }
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v35 = v34;
      uint64_t v36 = objc_opt_class();
      v37 = [v33 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v36;
      __int16 v54 = 2114;
      id v55 = v37;
      _os_log_impl(&dword_1A13F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v11 = 0;
  }
  if ([v8 count])
  {
    v38 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      v40 = [(MCPayload *)v11 friendlyName];
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = (uint64_t)v40;
      __int16 v54 = 2114;
      id v55 = v8;
      _os_log_impl(&dword_1A13F0000, v39, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_25:
  return v11;
}

- (id)stubDictionary
{
  v14.receiver = self;
  v14.super_class = (Class)MCAppLayerVPNPayload;
  uint64_t v3 = [(MCVPNPayloadBase *)&v14 stubDictionary];
  uint64_t v4 = v3;
  VPNUUID = self->_VPNUUID;
  if (VPNUUID) {
    [v3 setObject:VPNUUID forKey:@"VPNUUID"];
  }
  SafariDomains = self->_SafariDomains;
  if (SafariDomains) {
    [v4 setObject:SafariDomains forKey:@"SafariDomains"];
  }
  SMBDomains = self->_SMBDomains;
  if (SMBDomains) {
    [v4 setObject:SMBDomains forKey:@"SMBDomains"];
  }
  mailDomains = self->_mailDomains;
  if (mailDomains) {
    [v4 setObject:mailDomains forKey:@"MailDomains"];
  }
  calendarDomains = self->_calendarDomains;
  if (calendarDomains) {
    [v4 setObject:calendarDomains forKey:@"CalendarDomains"];
  }
  contactsDomains = self->_contactsDomains;
  if (contactsDomains) {
    [v4 setObject:contactsDomains forKey:@"ContactsDomains"];
  }
  excludedDomains = self->_excludedDomains;
  if (excludedDomains) {
    [v4 setObject:excludedDomains forKey:@"ExcludedDomains"];
  }
  associatedDomains = self->_associatedDomains;
  if (associatedDomains) {
    [v4 setObject:associatedDomains forKey:@"AssociatedDomains"];
  }
  return v4;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)MCAppLayerVPNPayload;
  uint64_t v4 = [(MCVPNPayloadBase *)&v15 verboseDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@\n", v4];

  uint64_t v6 = [(MCAppLayerVPNPayload *)self VPNUUID];
  [v5 appendFormat:@"VPNUUID     : %@\n", v6];

  uint64_t v7 = [(MCAppLayerVPNPayload *)self SafariDomains];
  [v5 appendFormat:@"Safari Domains: %@\n", v7];

  id v8 = [(MCAppLayerVPNPayload *)self SMBDomains];
  [v5 appendFormat:@"SMB Domains: %@\n", v8];

  id v9 = [(MCAppLayerVPNPayload *)self mailDomains];
  [v5 appendFormat:@"Mail Domains: %@\n", v9];

  v10 = [(MCAppLayerVPNPayload *)self calendarDomains];
  [v5 appendFormat:@"Calendar Domains: %@\n", v10];

  v11 = [(MCAppLayerVPNPayload *)self contactsDomains];
  [v5 appendFormat:@"Contacts Domains: %@\n", v11];

  uint64_t v12 = [(MCAppLayerVPNPayload *)self excludedDomains];
  [v5 appendFormat:@"Excluded Domains: %@\n", v12];

  id v13 = [(MCAppLayerVPNPayload *)self associatedDomains];
  [v5 appendFormat:@"Associated Domains: %@\n", v13];

  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(MCVPNPayloadBase *)self serviceName];

  if (v5)
  {
    uint64_t v6 = [MCKeyValue alloc];
    uint64_t v7 = [(MCVPNPayloadBase *)self serviceName];
    id v8 = MCLocalizedString(@"KEY_VPN_NAME");
    id v9 = [(MCKeyValue *)v6 initWithLocalizedString:v7 localizedKey:v8];

    [v4 addObject:v9];
  }
  v10 = [(MCVPNPayloadBase *)self vpnType];

  if (v10)
  {
    v11 = [MCKeyValue alloc];
    uint64_t v12 = [(MCVPNPayloadBase *)self vpnType];
    id v13 = MCLocalizedString(@"KEY_VPN_TYPE");
    objc_super v14 = [(MCKeyValue *)v11 initWithLocalizedString:v12 localizedKey:v13];

    [v4 addObject:v14];
  }
  objc_super v15 = [(MCAppLayerVPNPayload *)self VPNUUID];

  if (v15)
  {
    v16 = [MCKeyValue alloc];
    uint64_t v17 = [(MCAppLayerVPNPayload *)self VPNUUID];
    v18 = MCLocalizedString(@"APP_LAYER_VPN_VPNUUID");
    uint64_t v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v4 addObject:v19];
  }
  if ([v4 count])
  {
    v20 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v20];
  }
  uint64_t v21 = [(MCAppLayerVPNPayload *)self SafariDomains];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = [(MCAppLayerVPNPayload *)self SafariDomains];
    v24 = MCLocalizedString(@"APP_LAYER_VPN_SAFARI_DOMAINS");
    uint64_t v25 = +[MCKeyValueSection sectionWithLocalizedArray:v23 title:v24 footer:0];

    [v3 addObject:v25];
  }
  v26 = [(MCAppLayerVPNPayload *)self SMBDomains];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    int v28 = [(MCAppLayerVPNPayload *)self SMBDomains];
    uint64_t v29 = MCLocalizedString(@"APP_LAYER_VPN_SMB_DOMAINS");
    v30 = +[MCKeyValueSection sectionWithLocalizedArray:v28 title:v29 footer:0];

    [v3 addObject:v30];
  }
  v31 = [(MCAppLayerVPNPayload *)self mailDomains];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    v33 = [(MCAppLayerVPNPayload *)self mailDomains];
    v34 = MCLocalizedString(@"APP_LAYER_VPN_MAIL_DOMAINS");
    v35 = +[MCKeyValueSection sectionWithLocalizedArray:v33 title:v34 footer:0];

    [v3 addObject:v35];
  }
  uint64_t v36 = [(MCAppLayerVPNPayload *)self calendarDomains];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    v38 = [(MCAppLayerVPNPayload *)self calendarDomains];
    v39 = MCLocalizedString(@"APP_LAYER_VPN_CALENDAR_DOMAINS");
    v40 = +[MCKeyValueSection sectionWithLocalizedArray:v38 title:v39 footer:0];

    [v3 addObject:v40];
  }
  v41 = [(MCAppLayerVPNPayload *)self contactsDomains];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    v43 = [(MCAppLayerVPNPayload *)self contactsDomains];
    id v44 = MCLocalizedString(@"APP_LAYER_VPN_CONTACTS_DOMAINS");
    id v45 = +[MCKeyValueSection sectionWithLocalizedArray:v43 title:v44 footer:0];

    [v3 addObject:v45];
  }
  id v46 = [(MCAppLayerVPNPayload *)self associatedDomains];
  uint64_t v47 = [v46 count];

  if (v47)
  {
    id v48 = [(MCAppLayerVPNPayload *)self associatedDomains];
    id v49 = MCLocalizedString(@"APP_LAYER_VPN_ASSOCIATED_DOMAINS");
    id v50 = +[MCKeyValueSection sectionWithLocalizedArray:v48 title:v49 footer:0];

    [v3 addObject:v50];
  }
  objc_super v51 = [(MCAppLayerVPNPayload *)self excludedDomains];
  uint64_t v52 = [v51 count];

  if (v52)
  {
    uint64_t v53 = [(MCAppLayerVPNPayload *)self excludedDomains];
    __int16 v54 = MCLocalizedString(@"APP_LAYER_VPN_EXCLUDED_DOMAINS");
    id v55 = +[MCKeyValueSection sectionWithLocalizedArray:v53 title:v54 footer:0];

    [v3 addObject:v55];
  }
  v58.receiver = self;
  v58.super_class = (Class)MCAppLayerVPNPayload;
  uint64_t v56 = [(MCVPNPayloadBase *)&v58 payloadDescriptionKeyValueSections];
  [v3 addObjectsFromArray:v56];

  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  self->_restrictDomains = 1;
  return 0;
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (void)setVPNUUID:(id)a3
{
}

- (NSArray)SafariDomains
{
  return self->_SafariDomains;
}

- (void)setSafariDomains:(id)a3
{
}

- (NSArray)SMBDomains
{
  return self->_SMBDomains;
}

- (void)setSMBDomains:(id)a3
{
}

- (NSArray)mailDomains
{
  return self->_mailDomains;
}

- (void)setMailDomains:(id)a3
{
}

- (NSArray)calendarDomains
{
  return self->_calendarDomains;
}

- (void)setCalendarDomains:(id)a3
{
}

- (NSArray)contactsDomains
{
  return self->_contactsDomains;
}

- (void)setContactsDomains:(id)a3
{
}

- (NSArray)excludedDomains
{
  return self->_excludedDomains;
}

- (void)setExcludedDomains:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_contactsDomains, 0);
  objc_storeStrong((id *)&self->_calendarDomains, 0);
  objc_storeStrong((id *)&self->_mailDomains, 0);
  objc_storeStrong((id *)&self->_SMBDomains, 0);
  objc_storeStrong((id *)&self->_SafariDomains, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

@end