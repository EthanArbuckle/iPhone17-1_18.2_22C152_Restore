@interface MCSingleSignOnPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (MCSingleSignOnPayloadKerberosInfo)kerberosInfo;
- (NSString)humanReadableName;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setHumanReadableName:(id)a3;
- (void)setKerberosInfo:(id)a3;
@end

@implementation MCSingleSignOnPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.sso";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SSO_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SSO_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MCSingleSignOnPayload;
  v10 = [(MCPayload *)&v43 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_23;
  }
  if ([v9 isStub])
  {
    id v42 = 0;
    uint64_t v11 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Name" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v42];
    id v12 = v42;
    humanReadableName = v10->_humanReadableName;
    v10->_humanReadableName = (NSString *)v11;

    if (!v12)
    {
      id v41 = 0;
      v14 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"Kerberos" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v41];
      id v15 = v41;
      if (!v15)
      {
        v16 = [MCSingleSignOnPayloadKerberosInfo alloc];
        v17 = (void *)[v14 mutableCopy];
        id v40 = 0;
        uint64_t v18 = [(MCSingleSignOnPayloadKerberosInfo *)v16 initWithDictionary:v17 profile:v9 outError:&v40];
        id v12 = v40;
        kerberosInfo = v10->_kerberosInfo;
        v10->_kerberosInfo = (MCSingleSignOnPayloadKerberosInfo *)v18;

        goto LABEL_13;
      }
      goto LABEL_8;
    }
LABEL_14:
    v26 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v27 = v26;
    if (a5) {
      *a5 = v26;
    }
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = objc_opt_class();
      id v31 = v30;
      v32 = [v27 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      __int16 v46 = 2114;
      id v47 = v32;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_19;
  }
  id v39 = 0;
  uint64_t v20 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"Name" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v39];
  id v12 = v39;
  v21 = v10->_humanReadableName;
  v10->_humanReadableName = (NSString *)v20;

  if (v12) {
    goto LABEL_14;
  }
  id v38 = 0;
  v14 = +[MCProfile removeRequiredObjectInDictionary:v8 key:@"Kerberos" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v38];
  id v15 = v38;
  if (v15)
  {
LABEL_8:
    id v12 = v15;
    goto LABEL_13;
  }
  v22 = [MCSingleSignOnPayloadKerberosInfo alloc];
  v23 = (void *)[v14 mutableCopy];
  id v37 = 0;
  uint64_t v24 = [(MCSingleSignOnPayloadKerberosInfo *)v22 initWithDictionary:v23 profile:v9 outError:&v37];
  id v12 = v37;
  v25 = v10->_kerberosInfo;
  v10->_kerberosInfo = (MCSingleSignOnPayloadKerberosInfo *)v24;

  if (!v12)
  {
    if (v10->_kerberosInfo)
    {
      id v12 = 0;
    }
    else
    {
      id v12 = +[MCProfile missingFieldErrorWithField:@"Kerberos"];
    }
  }
LABEL_13:

  if (v12) {
    goto LABEL_14;
  }
LABEL_19:
  if ([v8 count])
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      v35 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v45 = v35;
      __int16 v46 = 2114;
      id v47 = v8;
      _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_23:
  return v10;
}

- (id)verboseDescription
{
  v10.receiver = self;
  v10.super_class = (Class)MCSingleSignOnPayload;
  uint64_t v3 = [(MCPayload *)&v10 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCSingleSignOnPayload *)self humanReadableName];

  if (v5)
  {
    uint64_t v6 = [(MCSingleSignOnPayload *)self humanReadableName];
    [v4 appendFormat:@"Name          : %@\n", v6];
  }
  uint64_t v7 = [(MCSingleSignOnPayload *)self kerberosInfo];

  if (v7)
  {
    id v8 = [(MCSingleSignOnPayload *)self kerberosInfo];
    [v4 appendFormat:@"Kerberos Info:\n%@\n", v8];
  }
  return v4;
}

- (id)stubDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)MCSingleSignOnPayload;
  uint64_t v3 = [(MCPayload *)&v10 stubDictionary];
  uint64_t v4 = [(MCSingleSignOnPayload *)self humanReadableName];

  if (v4)
  {
    uint64_t v5 = [(MCSingleSignOnPayload *)self humanReadableName];
    [v3 setObject:v5 forKeyedSubscript:@"Name"];
  }
  uint64_t v6 = [(MCSingleSignOnPayload *)self kerberosInfo];

  if (v6)
  {
    uint64_t v7 = [(MCSingleSignOnPayload *)self kerberosInfo];
    id v8 = [v7 stubDictionary];
    [v3 setObject:v8 forKeyedSubscript:@"Kerberos"];
  }
  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(MCSingleSignOnPayload *)self kerberosInfo];
  uint64_t v6 = [v5 principalName];

  if (v6)
  {
    uint64_t v7 = [MCKeyValue alloc];
    id v8 = [v5 principalName];
    id v9 = MCLocalizedString(@"PRINCIPAL_NAME");
    objc_super v10 = [(MCKeyValue *)v7 initWithLocalizedString:v8 localizedKey:v9];

    [v4 addObject:v10];
  }
  uint64_t v11 = [v5 realm];

  if (v11)
  {
    id v12 = [MCKeyValue alloc];
    v13 = [v5 realm];
    v14 = MCLocalizedString(@"REALM");
    id v15 = [(MCKeyValue *)v12 initWithLocalizedString:v13 localizedKey:v14];

    [v4 addObject:v15];
  }
  v16 = [v5 certificateUUID];

  if (v16)
  {
    v17 = [(MCPayload *)self profile];
    uint64_t v18 = [v5 certificateUUID];
    v19 = [v17 subjectSummaryFromCertificatePayloadWithUUID:v18];

    if ([v19 length])
    {
      uint64_t v20 = [MCKeyValue alloc];
      v21 = MCLocalizedString(@"SSO_CERTIFICATE");
      v22 = [(MCKeyValue *)v20 initWithLocalizedString:v19 localizedKey:v21];

      [v4 addObject:v22];
    }
  }
  if ([v4 count])
  {
    v23 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v23];
  }
  uint64_t v24 = [v5 URLPrefixMatches];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = [v5 URLPrefixMatches];
    v27 = MCLocalizedString(@"URL_PREFIX_MATCHES");
    v28 = +[MCKeyValueSection sectionWithLocalizedArray:v26 title:v27 footer:0];

    [v3 addObject:v28];
  }
  v29 = [v5 appIdentifierMatches];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    id v31 = [v5 appIdentifierMatches];
    v32 = MCLocalizedString(@"APP_MATCHES");
    v33 = +[MCKeyValueSection sectionWithLocalizedArray:v31 title:v32 footer:0];

    [v3 addObject:v33];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
}

- (MCSingleSignOnPayloadKerberosInfo)kerberosInfo
{
  return self->_kerberosInfo;
}

- (void)setKerberosInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kerberosInfo, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
}

@end