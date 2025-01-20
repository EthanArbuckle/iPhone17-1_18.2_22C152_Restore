@interface MCSingleSignOnPayloadKerberosInfo
- (BOOL)validateAppIdentifierMatch:(id)a3 outError:(id *)a4;
- (BOOL)validateURLPrefixMatch:(id)a3 outNormalizedString:(id *)a4 outError:(id *)a5;
- (MCSingleSignOnPayloadKerberosInfo)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)URLPrefixMatches;
- (NSArray)appIdentifierMatches;
- (NSString)accountGUID;
- (NSString)accountTypeGUID;
- (NSString)certificateUUID;
- (NSString)principalName;
- (NSString)realm;
- (id)description;
- (id)stubDictionary;
- (void)setAccountGUID:(id)a3;
- (void)setAccountTypeGUID:(id)a3;
- (void)setAppIdentifierMatches:(id)a3;
- (void)setCertificateUUID:(id)a3;
- (void)setPrincipalName:(id)a3;
- (void)setRealm:(id)a3;
- (void)setURLPrefixMatches:(id)a3;
@end

@implementation MCSingleSignOnPayloadKerberosInfo

- (MCSingleSignOnPayloadKerberosInfo)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v78.receiver = self;
  v78.super_class = (Class)MCSingleSignOnPayloadKerberosInfo;
  v10 = [(MCSingleSignOnPayloadKerberosInfo *)&v78 init];
  if (!v10) {
    goto LABEL_26;
  }
  id v77 = 0;
  uint64_t v11 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PrincipalName" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v77];
  id v12 = v77;
  principalName = v10->_principalName;
  v10->_principalName = (NSString *)v11;

  if (!v12)
  {
    id v76 = 0;
    uint64_t v14 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"Realm" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v76];
    id v12 = v76;
    realm = v10->_realm;
    v10->_realm = (NSString *)v14;
  }
  id v75 = v12;
  uint64_t v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"PayloadCertificateUUID" isRequired:0 outError:&v75];
  id v17 = v75;

  certificateUUID = v10->_certificateUUID;
  v10->_certificateUUID = (NSString *)v16;

  if (!v17)
  {
    id v74 = 0;
    uint64_t v19 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"AppIdentifierMatches" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v74];
    id v17 = v74;
    appIdentifierMatches = v10->_appIdentifierMatches;
    v10->_appIdentifierMatches = (NSArray *)v19;

    if (!v17)
    {
      v58 = a5;
      v59 = v9;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v21 = v10->_appIdentifierMatches;
      uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        id v17 = 0;
        uint64_t v24 = *(void *)v71;
        while (2)
        {
          uint64_t v25 = 0;
          v26 = v17;
          do
          {
            if (*(void *)v71 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v27 = *(void *)(*((void *)&v70 + 1) + 8 * v25);
            id v69 = v26;
            BOOL v28 = [(MCSingleSignOnPayloadKerberosInfo *)v10 validateAppIdentifierMatch:v27 outError:&v69];
            id v17 = v69;

            if (!v28)
            {
              uint64_t v29 = +[MCPayload badFieldValueErrorWithField:@"AppIdentifierMatches" underlyingError:v17];

              id v17 = (id)v29;
              a5 = v58;
              id v9 = v59;
              goto LABEL_16;
            }
            ++v25;
            v26 = v17;
          }
          while (v23 != v25);
          uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v17 = 0;
      }

      if ([(NSArray *)v10->_appIdentifierMatches count])
      {
        v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v10->_appIdentifierMatches];
        uint64_t v31 = [v30 allObjects];
        v32 = v10->_appIdentifierMatches;
        v10->_appIdentifierMatches = (NSArray *)v31;
      }
      else
      {
        v30 = v10->_appIdentifierMatches;
        v10->_appIdentifierMatches = (NSArray *)&unk_1EF4D0C70;
      }
      a5 = v58;
      id v9 = v59;

      if (!v17)
      {
        v34 = v10->_principalName;
        if (v34 && [(NSString *)v34 rangeOfString:@"@"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v53 = @"PrincipalName";
        }
        else
        {
          if ([(NSString *)v10->_realm rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v68 = 0;
            uint64_t v35 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"URLPrefixMatches" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v68];
            id v17 = v68;
            URLPrefixMatches = v10->_URLPrefixMatches;
            v10->_URLPrefixMatches = (NSArray *)v35;

            if (![(NSArray *)v10->_URLPrefixMatches count])
            {
              v37 = v10->_URLPrefixMatches;
              v10->_URLPrefixMatches = (NSArray *)&unk_1EF4D0C88;
            }
            v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v10->_URLPrefixMatches, "count"));
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            obj = v10->_URLPrefixMatches;
            uint64_t v39 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v79 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v57 = *(void *)v65;
              while (2)
              {
                uint64_t v41 = 0;
                v42 = v17;
                do
                {
                  if (*(void *)v65 != v57) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v43 = *(void *)(*((void *)&v64 + 1) + 8 * v41);
                  id v62 = v42;
                  id v63 = 0;
                  BOOL v44 = [(MCSingleSignOnPayloadKerberosInfo *)v10 validateURLPrefixMatch:v43 outNormalizedString:&v63 outError:&v62];
                  id v45 = v63;
                  id v17 = v62;

                  if (!v44)
                  {
                    v46 = v38;
                    uint64_t v54 = +[MCPayload badFieldValueErrorWithField:@"URLPrefixMatches" underlyingError:v17];

                    id v17 = (id)v54;
                    a5 = v58;
                    id v9 = v59;

                    goto LABEL_48;
                  }
                  [v38 addObject:v45];

                  ++v41;
                  v42 = v17;
                }
                while (v40 != v41);
                uint64_t v40 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v79 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
            }

            v46 = v38;
            v47 = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
            uint64_t v48 = [v47 allObjects];
            v49 = v10->_URLPrefixMatches;
            v10->_URLPrefixMatches = (NSArray *)v48;

            id v9 = v59;
            if ([v59 isStub])
            {
              a5 = v58;
              if (!v17)
              {
                id v61 = 0;
                uint64_t v50 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"AccountGUID" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v61];
                id v17 = v61;
                accountGUID = v10->_accountGUID;
                v10->_accountGUID = (NSString *)v50;

                if (!v17)
                {
                  id v60 = 0;
                  uint64_t v52 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"AccountTypeGUID" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v60];
                  id v17 = v60;
                  obja = v10->_accountTypeGUID;
                  v10->_accountTypeGUID = (NSString *)v52;
                }
              }
            }
            else
            {
              a5 = v58;
            }
LABEL_48:

LABEL_16:
            if (!v17) {
              goto LABEL_26;
            }
            goto LABEL_23;
          }
          v53 = @"Realm";
        }
        id v17 = +[MCPayload badFieldValueErrorWithField:v53];
        goto LABEL_16;
      }
    }
  }
LABEL_23:
  if (a5) {
    *a5 = v17;
  }

  v10 = 0;
LABEL_26:

  return v10;
}

- (BOOL)validateAppIdentifierMatch:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  if (([v5 isEqualToString:@"*"] & 1) != 0
    || (uint64_t v6 = [v5 rangeOfString:@"*" options:12],
        v6 == [v5 rangeOfString:@"*"])
    && (v6 == 0x7FFFFFFFFFFFFFFFLL
     || [v5 rangeOfString:@".*" options:12] != 0x7FFFFFFFFFFFFFFFLL))
  {
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = MCErrorArray(@"SSO_BAD_APP_IDENTIFIER_MATCH_P_PATTERN", v7, v8, v9, v10, v11, v12, v13, v5);
    uint64_t v16 = [v14 MCErrorWithDomain:@"MCOSSErrorDomain" code:34000 descriptionArray:v15 errorType:@"MCFatalError"];

    if (a4) {
      *a4 = v16;
    }

    BOOL v17 = 0;
  }

  return v17;
}

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)MCSingleSignOnPayloadKerberosInfo;
  v3 = [(MCSingleSignOnPayloadKerberosInfo *)&v20 description];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(MCSingleSignOnPayloadKerberosInfo *)self principalName];

  if (v5)
  {
    uint64_t v6 = [(MCSingleSignOnPayloadKerberosInfo *)self principalName];
    [v4 appendFormat:@"Principal     : %@\n", v6];
  }
  uint64_t v7 = [(MCSingleSignOnPayloadKerberosInfo *)self realm];

  if (v7)
  {
    uint64_t v8 = [(MCSingleSignOnPayloadKerberosInfo *)self realm];
    [v4 appendFormat:@"Realm         : %@\n", v8];
  }
  uint64_t v9 = [(MCSingleSignOnPayloadKerberosInfo *)self certificateUUID];

  if (v9)
  {
    uint64_t v10 = [(MCSingleSignOnPayloadKerberosInfo *)self certificateUUID];
    [v4 appendFormat:@"Cert UUID     : %@\n", v10];
  }
  uint64_t v11 = [(MCSingleSignOnPayloadKerberosInfo *)self URLPrefixMatches];

  if (v11)
  {
    uint64_t v12 = [(MCSingleSignOnPayloadKerberosInfo *)self URLPrefixMatches];
    [v4 appendFormat:@"URL Prefix Matches:\n%@\n", v12];
  }
  uint64_t v13 = [(MCSingleSignOnPayloadKerberosInfo *)self accountGUID];

  if (v13)
  {
    uint64_t v14 = [(MCSingleSignOnPayloadKerberosInfo *)self accountGUID];
    [v4 appendFormat:@"Acct GUID     : %@\n", v14];
  }
  v15 = [(MCSingleSignOnPayloadKerberosInfo *)self accountTypeGUID];

  if (v15)
  {
    uint64_t v16 = [(MCSingleSignOnPayloadKerberosInfo *)self accountTypeGUID];
    [v4 appendFormat:@"AcctType GUID : %@\n", v16];
  }
  BOOL v17 = [(MCSingleSignOnPayloadKerberosInfo *)self appIdentifierMatches];

  if (v17)
  {
    v18 = [(MCSingleSignOnPayloadKerberosInfo *)self appIdentifierMatches];
    [v4 appendFormat:@"App Matches:\n%@\n", v18];
  }
  return v4;
}

- (BOOL)validateURLPrefixMatch:(id)a3 outNormalizedString:(id *)a4 outError:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v7];
  uint64_t v9 = (void *)[v7 mutableCopy];
  uint64_t v10 = [v8 scheme];
  if ([v10 isEqualToString:@"http"])
  {
  }
  else
  {
    uint64_t v11 = [v8 scheme];
    int v12 = [v11 isEqualToString:@"https"];

    if (!v12) {
      goto LABEL_10;
    }
  }
  uint64_t v13 = [v8 fragment];
  uint64_t v14 = [v13 length];

  if (!v14)
  {
    v15 = [v8 query];
    uint64_t v16 = [v15 length];

    if (!v16)
    {
      BOOL v17 = [v8 host];
      uint64_t v18 = [v17 rangeOfString:@"*" options:4];
      if (([v17 isEqualToString:@"*"] & 1) == 0
        && ([v17 isEqualToString:@"*."] & 1) == 0
        && ([v17 isEqualToString:@"."] & 1) == 0
        && (![v17 hasPrefix:@"*"]
         || [v17 hasPrefix:@"*."])
        && (v18 == 0x7FFFFFFFFFFFFFFFLL || !v18))
      {
        uint64_t v32 = [v8 rangeOfHost];
        if ([v17 hasPrefix:@"*."])
        {
          v33 = [v8 string];
          v34 = [v33 substringToIndex:objc_msgSend(@"*.", "length") + v32];
          int v35 = [v9 hasPrefix:v34];

          if (v35) {
            objc_msgSend(v9, "deleteCharactersInRange:", v32, 1);
          }
        }
        if ([v9 rangeOfString:@"/" options:12] == 0x7FFFFFFFFFFFFFFFLL) {
          [v9 appendString:@"/"];
        }
        id v30 = (id)[v9 copy];

        if (a4)
        {
          id v30 = v30;
          *a4 = v30;
        }
        BOOL v29 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:

  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v27 = MCErrorArray(@"SSO_BAD_URL_MATCH_PATTERN_P_PATTERN", v20, v21, v22, v23, v24, v25, v26, v7);
  BOOL v28 = [v19 MCErrorWithDomain:@"MCOSSErrorDomain" code:34001 descriptionArray:v27 errorType:@"MCFatalError"];

  if (a5) {
    *a5 = v28;
  }

  BOOL v29 = 0;
  id v30 = 0;
LABEL_13:

  return v29;
}

- (id)stubDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MCSingleSignOnPayloadKerberosInfo *)self principalName];

  if (v4)
  {
    id v5 = [(MCSingleSignOnPayloadKerberosInfo *)self principalName];
    [v3 setObject:v5 forKeyedSubscript:@"PrincipalName"];
  }
  uint64_t v6 = [(MCSingleSignOnPayloadKerberosInfo *)self realm];

  if (v6)
  {
    id v7 = [(MCSingleSignOnPayloadKerberosInfo *)self realm];
    [v3 setObject:v7 forKeyedSubscript:@"Realm"];
  }
  uint64_t v8 = [(MCSingleSignOnPayloadKerberosInfo *)self URLPrefixMatches];

  if (v8)
  {
    uint64_t v9 = [(MCSingleSignOnPayloadKerberosInfo *)self URLPrefixMatches];
    [v3 setObject:v9 forKeyedSubscript:@"URLPrefixMatches"];
  }
  uint64_t v10 = [(MCSingleSignOnPayloadKerberosInfo *)self accountTypeGUID];

  if (v10)
  {
    uint64_t v11 = [(MCSingleSignOnPayloadKerberosInfo *)self accountTypeGUID];
    [v3 setObject:v11 forKeyedSubscript:@"AccountTypeGUID"];
  }
  int v12 = [(MCSingleSignOnPayloadKerberosInfo *)self accountGUID];

  if (v12)
  {
    uint64_t v13 = [(MCSingleSignOnPayloadKerberosInfo *)self accountGUID];
    [v3 setObject:v13 forKeyedSubscript:@"AccountGUID"];
  }
  uint64_t v14 = [(MCSingleSignOnPayloadKerberosInfo *)self appIdentifierMatches];

  if (v14)
  {
    v15 = [(MCSingleSignOnPayloadKerberosInfo *)self appIdentifierMatches];
    [v3 setObject:v15 forKeyedSubscript:@"AppIdentifierMatches"];
  }
  return v3;
}

- (NSString)principalName
{
  return self->_principalName;
}

- (void)setPrincipalName:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
}

- (NSArray)URLPrefixMatches
{
  return self->_URLPrefixMatches;
}

- (void)setURLPrefixMatches:(id)a3
{
}

- (NSArray)appIdentifierMatches
{
  return self->_appIdentifierMatches;
}

- (void)setAppIdentifierMatches:(id)a3
{
}

- (NSString)accountGUID
{
  return self->_accountGUID;
}

- (void)setAccountGUID:(id)a3
{
}

- (NSString)accountTypeGUID
{
  return self->_accountTypeGUID;
}

- (void)setAccountTypeGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountTypeGUID, 0);
  objc_storeStrong((id *)&self->_accountGUID, 0);
  objc_storeStrong((id *)&self->_appIdentifierMatches, 0);
  objc_storeStrong((id *)&self->_URLPrefixMatches, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_principalName, 0);
}

@end