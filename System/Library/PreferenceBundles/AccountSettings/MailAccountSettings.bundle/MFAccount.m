@interface MFAccount
+ (id)authSchemeTitles;
+ (id)authSchemeValues;
+ (id)profileDisplayNameFromTag:(id)a3;
+ (id)storeOnServerSettingsForKey:(id)a3;
+ (id)storeOnServerSettingsForType:(int64_t)a3;
- (NSString)managedAccountFooterText;
- (id)valueForSettingsInAccountPropertiesForKey:(id)a3;
- (void)_copyBooleanValueInAccountPropertiesForKey:(id)a3 intoDictionary:(id)a4;
- (void)copyAccountPropertiesForSpecifiers:(id)a3 intoDictionary:(id)a4;
- (void)copySecureMIMEIdentitiesIntoDictionary:(id)a3;
- (void)setAccountPropertiesWithDictionary:(id)a3;
@end

@implementation MFAccount

+ (id)storeOnServerSettingsForType:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = sub_AB94();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v12) == (id)a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v4 = sub_AB94();
  id v9 = [v4 lastObject];
LABEL_11:
  v10 = v9;

  return v10;
}

+ (id)storeOnServerSettingsForKey:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = sub_AB94();
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "key", (void)v16);
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if ((v10 & 1) == 0)
        {
          v11 = [v8 mailboxNameKey];
          unsigned __int8 v12 = [v11 isEqualToString:v3];

          if ((v12 & 1) == 0) {
            continue;
          }
        }
        id v13 = v8;
        goto LABEL_12;
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v4 = sub_AB94();
  id v13 = [v4 lastObject];
LABEL_12:
  long long v14 = v13;

  return v14;
}

- (void)_copyBooleanValueInAccountPropertiesForKey:(id)a3 intoDictionary:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(MFAccount *)self valueForSettingsInAccountPropertiesForKey:v11];
  v8 = v7;
  if (v7) {
    id v9 = [v7 BOOLValue];
  }
  else {
    id v9 = 0;
  }
  unsigned __int8 v10 = +[NSNumber numberWithBool:v9];
  [v6 setObject:v10 forKey:v11];
}

- (void)copyAccountPropertiesForSpecifiers:(id)a3 intoDictionary:(id)a4
{
  id v6 = a3;
  id v52 = a4;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v7)
  {
    uint64_t v50 = *(void *)v58;
    uint64_t v49 = PSKeyNameKey;
    uint64_t v47 = MFMailAccountUsername;
    uint64_t v46 = MailAccountPassword;
    uint64_t v45 = MFMailAccountAuthenticationScheme;
    uint64_t v44 = MailAccountPortNumber;
    uint64_t v43 = MFMailAccountNumberOfDaysToKeepTrash;
    uint64_t v42 = MF_POPAccountDeletionPolicy;
    uint64_t v41 = MailAccountEmailAddresses;
    uint64_t v38 = MFMailAccountSigningEnabled;
    uint64_t v34 = MFMailAccountEncryptionEnabled;
    uint64_t v37 = MFAliasDefaultKey;
    v40 = (void *)MF_POPAccountDeleteMessagesRightAwayKey;
    v36 = (void *)MF_POPAccountDeleteMessagesWhenTransferredOutOfInboxKey;
    v39 = (void *)MF_POPAccountDeleteMessagesAfterIntervalKey;
    v35 = (void *)MF_POPAccountNeverDeleteMessagesKey;
    do
    {
      id v51 = v7;
      for (i = 0; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v58 != v50) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        unsigned __int8 v10 = [v9 propertyForKey:v49];
        if (!v10)
        {
          id v11 = [v9 userInfo];
          unsigned __int8 v10 = [v11 valueForKey:@"outgoing_key"];
        }
        unsigned __int8 v12 = [v52 objectForKey:v10];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          if ([v10 isEqualToString:@"MailAccountIsActive"])
          {
            id v14 = +[NSNumber numberWithBool:[(MFAccount *)self isActive]];
            [v52 setObject:v14 forKey:v10];
            goto LABEL_22;
          }
          if ([v10 isEqualToString:v47])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [(MFAccount *)self displayUsername];
              if (v14) {
                [v52 setObject:v14 forKey:v47];
              }
              goto LABEL_22;
            }
          }
          if ([v10 isEqualToString:v46])
          {
            id v14 = [(MFAccount *)self password];
            if (!v14)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ![(MFAccount *)self credentialAccessibility])
              {
                [v52 setObject:@"********" forKey:v10];
              }
              goto LABEL_22;
            }
            long long v15 = [(MFAccount *)self password];
            [v52 setObject:v15 forKey:v10];
          }
          else
          {
            if (![v10 isEqualToString:v45])
            {
              if ([v10 isEqualToString:v44])
              {
                id v26 = [(MFAccount *)self portNumber];
                if (!v26)
                {
                  id v14 = 0;
                  goto LABEL_22;
                }
                id v14 = +[NSString stringWithFormat:@"%u", v26];
                if (!v14)
                {
LABEL_22:

                  goto LABEL_23;
                }
              }
              else
              {
                if ([v10 isEqualToString:v43])
                {
                  id v14 = +[NSString stringWithFormat:@"%d", [(MFAccount *)self emptyFrequencyForMailboxType:3]];
                  [v52 setObject:v14 forKey:v10];
                  goto LABEL_22;
                }
                if ([v10 isEqualToString:v42])
                {
                  v27 = (char *)[(MFAccount *)self messageDeletionPolicy];
                  v28 = v40;
                  if (v27 != (unsigned char *)&dword_0 + 1)
                  {
                    v28 = v39;
                    if (v27 != (unsigned char *)&dword_0 + 2)
                    {
                      v28 = v36;
                      if (v27 != (unsigned char *)&dword_0 + 3) {
                        v28 = v35;
                      }
                    }
                  }
                  id v14 = v28;
                  [v52 setObject:v14 forKey:v10];
                  goto LABEL_22;
                }
                if ([v10 isEqualToString:v41])
                {
                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  v61[0] = v41;
                  v61[1] = v37;
                  id v14 = +[NSArray arrayWithObjects:v61 count:2];
                  id v29 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
                  if (v29)
                  {
                    uint64_t v30 = *(void *)v54;
                    do
                    {
                      for (j = 0; j != v29; j = (char *)j + 1)
                      {
                        if (*(void *)v54 != v30) {
                          objc_enumerationMutation(v14);
                        }
                        uint64_t v32 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
                        v33 = [(MFAccount *)self valueForSettingsInAccountPropertiesForKey:v32];
                        if (v33) {
                          [v52 setObject:v33 forKey:v32];
                        }
                      }
                      id v29 = [v14 countByEnumeratingWithState:&v53 objects:v62 count:16];
                    }
                    while (v29);
                  }
                  goto LABEL_22;
                }
                if (([v10 isEqualToString:v38] & 1) != 0
                  || [v10 isEqualToString:v34])
                {
                  [(MFAccount *)self _copyBooleanValueInAccountPropertiesForKey:v10 intoDictionary:v52];
                  goto LABEL_23;
                }
                id v14 = [(MFAccount *)self valueForSettingsInAccountPropertiesForKey:v10];
                if (!v14) {
                  goto LABEL_22;
                }
              }
              [v52 setObject:v14 forKey:v10];
              goto LABEL_22;
            }
            long long v16 = [(MFAccount *)self preferredAuthScheme];
            id v14 = v16;
            if (!v16) {
              goto LABEL_22;
            }
            long long v15 = [v16 name];
            [v52 setObject:v15 forKey:v10];
          }

          goto LABEL_22;
        }
LABEL_23:
        long long v17 = [v9 userInfo];
        long long v18 = [v17 objectForKey:@"MailboxType"];

        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = (int)[v18 intValue];
            v20 = +[MFAccount storeOnServerSettingsForType:v19];
            v21 = [(MFAccount *)self mailboxUidOfType:v19 createIfNeeded:0];
            v22 = [v20 key];
            v23 = [v52 objectForKey:v22];
            if (v23) {
              goto LABEL_30;
            }
            unsigned int v24 = [(MFAccount *)self storeMailboxTypeOnServer:v19];

            if (v24)
            {
              if (v21)
              {
                v25 = [v20 mailboxNameKey];
                [v52 setObject:v21 forKey:v25];
              }
              v22 = +[NSNumber numberWithBool:1];
              v23 = [v20 key];
              [v52 setObject:v22 forKey:v23];
LABEL_30:
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v7);
  }
}

- (id)valueForSettingsInAccountPropertiesForKey:(id)a3
{
  id v3 = [(MFAccount *)self valueInAccountPropertiesForKey:a3];

  return v3;
}

- (void)copySecureMIMEIdentitiesIntoDictionary:(id)a3
{
  id v19 = a3;
  v4 = self;
  id v5 = [(MFAccount *)v4 firstEmailAddress];
  id v6 = [v5 emailAddressValue];
  id v7 = [v6 simpleAddress];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 stringValue];
  }
  unsigned __int8 v10 = v9;

  uint64_t v11 = MFMailAccountSigningIdentity;
  unsigned __int8 v12 = [v19 objectForKey:MFMailAccountSigningIdentity];

  if (!v12)
  {
    BOOL v13 = [(MFAccount *)v4 signingIdentityPersistentReferenceForAddress:v10];
    id v14 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v13 error:0];
    if (v14) {
      [v19 setObject:v14 forKey:v11];
    }
  }
  uint64_t v15 = MFMailAccountEncryptionIdentity;
  long long v16 = [v19 objectForKey:MFMailAccountEncryptionIdentity];

  if (!v16)
  {
    long long v17 = [(MFAccount *)v4 encryptionIdentityPersistentReferenceForAddress:v10];
    id v18 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v17 error:0];
    if (v18) {
      [v19 setObject:v18 forKey:v15];
    }
  }
}

- (void)setAccountPropertiesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v57 = MailAccountPassword;
  uint64_t v43 = objc_msgSend(v4, "objectForKey:");
  if (!v43)
  {
    uint64_t v43 = [(MFAccount *)self password];
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v5 = [v4 allKeys];
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v63;
    uint64_t v56 = MailAccountHostname;
    uint64_t v55 = MFMailAccountAuthenticationScheme;
    uint64_t v54 = IMAPServerPathPrefix;
    uint64_t v53 = MailAccountPortNumber;
    uint64_t v52 = MFMailAccountNumberOfDaysToKeepTrash;
    uint64_t v51 = MF_POPAccountDeletionPolicy;
    uint64_t v44 = MFMailAccountSigningIdentity;
    uint64_t v40 = MFMailAccountEncryptionIdentity;
    uint64_t v50 = (void *)MF_POPAccountDeleteMessagesAfterIntervalKey;
    uint64_t v46 = (void *)MF_POPAccountDeleteMessagesWhenTransferredOutOfInboxKey;
    uint64_t v42 = (void *)MF_POPAccountDeleteMessagesRightAwayKey;
    *(void *)&long long v7 = 134217984;
    long long v39 = v7;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_msgSend(v4, "objectForKey:", v10, v39);
        unsigned __int8 v12 = +[MFAccount storeOnServerSettingsForKey:v10];
        if ([v10 isEqualToString:@"MailAccountIsActive"])
        {
          -[MFAccount setActive:](self, "setActive:", [v11 BOOLValue]);
        }
        else if (([v10 isEqualToString:v57] & 1) == 0)
        {
          if ([v10 isEqualToString:v56])
          {
            [(MFAccount *)self setHostname:v11];
          }
          else if ([v10 isEqualToString:v55])
          {
            BOOL v13 = +[ECAuthenticationScheme schemeWithName:v11];
            [(MFAccount *)self setPreferredAuthScheme:v13];
          }
          else if ([v10 isEqualToString:v54] {
                 && (uint64_t v14 = objc_opt_class(), v14 == objc_opt_class()))
          }
          {
            [(MFAccount *)self setServerPathPrefix:v11];
          }
          else if ([v10 isEqualToString:v53])
          {
            -[MFAccount setPortNumber:](self, "setPortNumber:", [v11 intValue]);
          }
          else if ([v10 isEqualToString:v52])
          {
            -[MFAccount setEmptyFrequency:forMailboxType:](self, "setEmptyFrequency:forMailboxType:", [v11 intValue], 3);
          }
          else if ([v10 isEqualToString:v51])
          {
            if (v50 == v11)
            {
              uint64_t v15 = 2;
            }
            else if (v46 == v11)
            {
              uint64_t v15 = 3;
            }
            else
            {
              uint64_t v15 = v42 == v11;
            }
            [(MFAccount *)self setMessageDeletionPolicy:v15];
          }
          else if ([v12 type] == (id)-500)
          {
            if ([v10 isEqualToString:v44])
            {
              SecTrustRef trust = 0;
              SecCertificateRef certificateRef = 0;
              long long v16 = [(MFAccount *)self firstEmailAddress];
              CFTypeRef policies = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v16];

              SecIdentityCopyCertificate((SecIdentityRef)v11, &certificateRef);
              SecTrustCreateWithCertificates(certificateRef, policies, &trust);
              os_log_t log = (os_log_t)[objc_alloc((Class)CertUITrustManager) initWithAccessGroup:@"com.apple.mobilemail.smime"];
              SecTrustRef v17 = trust;
              id v18 = [(MFAccount *)self firstEmailAddress];
              LODWORD(v17) = [log actionForSMIMETrust:v17 sender:v18];

              if (v17 == 2)
              {
                SecTrustRef v19 = trust;
                v20 = [(MFAccount *)self firstEmailAddress];
                [log addSMIMETrust:v19 sender:v20];
              }
              keys = (void *)kSecValueRef;
              CFStringRef v72 = kSecAttrSynchronizable;
              CFStringRef v73 = kSecReturnPersistentRef;
              values = v11;
              CFStringRef v69 = kSecAttrSynchronizableAny;
              CFBooleanRef v70 = kCFBooleanTrue;
              CFDictionaryRef v21 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              CFTypeRef result = 0;
              CFDictionaryRef cf = v21;
              OSStatus v22 = SecItemCopyMatching(v21, &result);
              if (v22)
              {
                v23 = MFLogGeneral();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v39;
                  uint64_t v67 = v22;
                  _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "#Warning SecItemCopyMatching returned %ld", buf, 0xCu);
                }
              }
              else
              {
                CFTypeRef v32 = result;
                uint64_t v33 = [(MFAccount *)self firstEmailAddress];
                CFTypeRef v34 = v32;
                v23 = v33;
                -[MFAccount setSigningIdentityPersistentReference:forAddress:](self, "setSigningIdentityPersistentReference:forAddress:", v34);
              }

              CFRelease(certificateRef);
              CFRelease(trust);
              CFRelease(policies);
              CFRelease(cf);
              CFRelease(result);
            }
            else if ([v10 isEqualToString:v40])
            {
              keys = (void *)kSecValueRef;
              CFStringRef v72 = kSecAttrSynchronizable;
              CFStringRef v73 = kSecReturnPersistentRef;
              values = v11;
              CFStringRef v69 = kSecAttrSynchronizableAny;
              CFBooleanRef v70 = kCFBooleanTrue;
              CFDictionaryRef v25 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              SecCertificateRef certificateRef = 0;
              CFDictionaryRef v26 = v25;
              OSStatus v27 = SecItemCopyMatching(v25, (CFTypeRef *)&certificateRef);
              if (v27)
              {
                loga = MFLogGeneral();
                if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v39;
                  uint64_t v67 = v27;
                  v28 = loga;
                  _os_log_impl(&dword_0, loga, OS_LOG_TYPE_DEFAULT, "#Warning SecItemCopyMatching returned %ld", buf, 0xCu);
                }
                else
                {
                  v28 = loga;
                }
              }
              else
              {
                SecCertificateRef v35 = certificateRef;
                uint64_t v36 = [(MFAccount *)self firstEmailAddress];
                SecCertificateRef v37 = v35;
                v28 = (void *)v36;
                [(MFAccount *)self setEncryptionIdentityPersistentReference:v37 forAddress:v36];
              }

              CFRelease(v26);
              if (certificateRef) {
                CFRelease(certificateRef);
              }
            }
            else if (v11)
            {
              [(MFAccount *)self setAccountProperty:v11 forKey:v10];
            }
          }
          else
          {
            os_log_t logb = [v12 key];
            unsigned int v24 = [v10 isEqualToString:logb];

            if (v24)
            {
              -[MFAccount setStoreMailboxType:onServer:](self, "setStoreMailboxType:onServer:", [v12 type], objc_msgSend(v11, "BOOLValue"));
            }
            else
            {
              id v29 = [v12 mailboxNameKey];
              unsigned int v30 = [v10 isEqualToString:v29];

              if (v30)
              {
                id v31 = v11;
                -[MFAccount setMailboxUid:forMailboxType:](self, "setMailboxUid:forMailboxType:", v31, [v12 type]);
              }
            }
          }
        }

        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v5 = obj;
      id v38 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
      id v6 = v38;
    }
    while (v38);
  }

  [(MFAccount *)self setPassword:v43];
}

+ (id)authSchemeValues
{
  id v3 = [a1 authSchemesForAccountClass];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "canAuthenticateAccountClass:connection:", a1, 0, (void)v12))
        {
          unsigned __int8 v10 = [v9 name];
          [v4 addObject:v10];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)authSchemeTitles
{
  id v3 = [a1 authSchemesForAccountClass];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "canAuthenticateAccountClass:connection:", a1, 0, (void)v12))
        {
          unsigned __int8 v10 = [v9 humanReadableName];
          [v4 addObject:v10];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

- (NSString)managedAccountFooterText
{
  if (![(MFAccount *)self isManaged])
  {
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  id v3 = [(MFAccount *)self accountPropertyForKey:MailAccountManagedTag];
  if ([v3 length])
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"PROFILE_ACCOUNT_DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
    id v6 = +[MFAccount profileDisplayNameFromTag:v3];
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
  }
  else
  {
    id v4 = [(MFAccount *)self accountPropertyForKey:ACAccountPropertyManagingSourceName];
    if (![v4 length])
    {
      uint64_t v8 = 0;
      goto LABEL_8;
    }
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"MANAGED_ACCOUNT_DESCRIPTION" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4);
  }
  uint64_t v8 = (void *)v7;

LABEL_8:
LABEL_9:

  return (NSString *)v8;
}

+ (id)profileDisplayNameFromTag:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 rangeOfString:@"|" options:4];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = &stru_B9F70;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", v4 + 1, (char *)objc_msgSend(v3, "length") + ~v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end