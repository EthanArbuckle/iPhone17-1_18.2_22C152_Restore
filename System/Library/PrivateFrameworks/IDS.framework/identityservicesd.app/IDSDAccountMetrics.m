@interface IDSDAccountMetrics
+ (BOOL)areAllAliasesSelectedOnAccount:(id)a3;
+ (BOOL)areAllSelectedAliasesRegisteredOnAccount:(id)a3;
+ (BOOL)isAccountsFrameworkAvailable;
+ (BOOL)isProductionEnvironment;
+ (BOOL)isiCloudAccountMatchingAccount:(id)a3;
+ (BOOL)isiCloudSignedIn;
+ (BOOL)isiTunesSignedIn;
+ (double)timeSinceDateOnAccount:(id)a3;
+ (double)timeSinceLastRegistrationFailureOnAccount:(id)a3;
+ (double)timeSinceLastRegistrationSuccessOnAccount:(id)a3;
+ (id)registrationAccountStatusMetricForAccount:(id)a3;
+ (id)registrationAccountStatusMetricForNonexistentAccountWithType:(int)a3 serviceIdentifier:(id)a4;
+ (int64_t)accountSecurityLevelForAccount:(id)a3;
@end

@implementation IDSDAccountMetrics

+ (BOOL)isAccountsFrameworkAvailable
{
  unsigned int v2 = [(id)IMWeakLinkClass() isAccountsFrameworkAvailable];
  if (v2)
  {
    v3 = +[IDSDataMigrationTracker sharedInstance];
    unsigned __int8 v4 = [v3 hasPerformedMigration];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isiCloudSignedIn
{
  unsigned int v2 = [a1 isAccountsFrameworkAvailable];
  if (v2)
  {
    v3 = +[IDSDAccountController sharedInstance];
    unsigned __int8 v4 = [v3 isiCloudSignedIn];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isiTunesSignedIn
{
  unsigned int v2 = [a1 isAccountsFrameworkAvailable];
  if (v2)
  {
    v3 = +[IDSDAccountController sharedInstance];
    unsigned __int8 v4 = [v3 isiTunesSignedIn];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isiCloudAccountMatchingAccount:(id)a3
{
  id v4 = a3;
  if ([a1 isAccountsFrameworkAvailable])
  {
    v5 = [IDSSystemAccountAdapter alloc];
    v6 = im_primary_queue();
    v7 = [(IDSSystemAccountAdapter *)v5 initWithQueue:v6];

    v8 = [(IDSSystemAccountAdapter *)v7 iCloudSystemAccountWithError:0];
    if (v8)
    {
      v9 = [v4 dsID];
      if (v9)
      {
        v10 = [v8 DSID];
        v11 = [v4 dsID];
        unsigned __int8 v12 = [v10 isEqualToString:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }

      v14 = [v4 loginID];
      if (v14)
      {
        v15 = [v8 username];
        v16 = [v4 loginID];
        unsigned __int8 v17 = [v15 isEqualToString:v16];
      }
      else
      {
        unsigned __int8 v17 = 0;
      }

      char v13 = v12 | v17;
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (int64_t)accountSecurityLevelForAccount:(id)a3
{
  id v4 = a3;
  if ([v4 accountType] == 1)
  {
    v5 = [v4 dsID];
    v6 = [v4 loginID];
    if ([a1 isAccountsFrameworkAvailable])
    {
      v7 = [(id)IMWeakLinkClass() sharedInstance];
      if (v7)
      {
        v8 = sub_100148D9C(v5);
        v9 = [v7 authKitAccountWithDSID:v8];
        if (v9) {
          goto LABEL_10;
        }
        id v14 = 0;
        v9 = [v7 authKitAccountWithAppleID:v6 error:&v14];
        id v10 = v14;
        if (v10)
        {
          v11 = +[IMRGLog registration];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v16 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error fetching authkit account with AppleID. { error: %@ }", buf, 0xCu);
          }
        }
        if (v9)
        {
LABEL_10:
          id v12 = [v7 securityLevelForAccount:v9];
        }
        else
        {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return (int64_t)v12;
}

+ (double)timeSinceDateOnAccount:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  id v3 = a3;
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  return v6;
}

+ (double)timeSinceLastRegistrationFailureOnAccount:(id)a3
{
  id v4 = [a3 lastRegistrationFailureDate];
  [a1 timeSinceDateOnAccount:v4];
  double v6 = v5;

  return v6;
}

+ (double)timeSinceLastRegistrationSuccessOnAccount:(id)a3
{
  id v4 = [a3 lastRegistrationSuccessDate];
  [a1 timeSinceDateOnAccount:v4];
  double v6 = v5;

  return v6;
}

+ (BOOL)areAllAliasesSelectedOnAccount:(id)a3
{
  id v3 = a3;
  if ([v3 accountType] == 1)
  {
    id v4 = [v3 aliases];
    double v5 = objc_msgSend(v4, "__imArrayByFilteringWithBlock:", &stru_1009825C8);
    double v6 = +[NSSet setWithArray:v5];

    v7 = [v3 vettedAliases];
    v8 = +[NSMutableSet setWithArray:v7];

    v9 = +[IDSRegistrationController registeredPhoneNumbers];
    [v8 minusSet:v9];

    unsigned __int8 v10 = [v8 isEqualToSet:v6];
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

+ (BOOL)areAllSelectedAliasesRegisteredOnAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 registration];
  id v5 = [v4 registrationStatus];

  if (v5 == (id)8)
  {
    if ([v3 accountType] == 1)
    {
      double v6 = [v3 aliases];
      v7 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", &stru_1009825E8);
      v8 = +[NSSet setWithArray:v7];

      v9 = [v3 unprefixedURIStringsFromRegistration];
      unsigned __int8 v10 = +[NSSet setWithArray:v9];

      unsigned __int8 v11 = [v10 isEqualToSet:v8];
    }
    else
    {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (BOOL)isProductionEnvironment
{
  unsigned int v2 = IMGetEnvironmentName();
  unsigned __int8 v3 = [v2 isEqualToIgnoringCase:@"prod"];

  return v3;
}

+ (id)registrationAccountStatusMetricForAccount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 aliases];
  id v5 = objc_msgSend(v4, "__imArrayByFilteringWithBlock:", &stru_100982608);
  double v6 = +[NSSet setWithArray:v5];

  v7 = [v3 vettedAliases];
  v8 = +[NSMutableSet setWithArray:v7];

  v9 = +[IDSRegistrationController registeredPhoneNumbers];
  [v8 minusSet:v9];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v56;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        if (([v6 containsObject:v18] & 1) == 0)
        {
          switch([v3 unselectReasonForAlias:v18])
          {
            case 0u:
            case 1u:
            case 2u:
              ++v15;
              break;
            case 3u:
              ++v54;
              break;
            case 4u:
              ++v53;
              break;
            case 5u:
              ++v13;
              break;
            case 6u:
              ++v14;
              break;
            default:
              continue;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }

  id v51 = objc_alloc((Class)IDSRegistrationAccountStatusMetric);
  unsigned int v50 = [v3 accountType];
  v19 = [v3 service];
  v49 = [v19 identifier];
  unsigned int v48 = [v3 isEnabled];
  unsigned int v47 = [v3 isUserDisabled];
  unsigned int v46 = [a1 isiCloudSignedIn];
  unsigned __int8 v45 = [a1 isiCloudAccountMatchingAccount:v3];
  unsigned __int8 v43 = [a1 isiTunesSignedIn];
  id v42 = [v3 registrationError];
  unsigned int v41 = [v3 registrationErrorReason];
  v44 = [v3 registration];
  id v40 = [v44 registrationStatus];
  unsigned int v39 = [v3 registrationStatus];
  unsigned __int8 v38 = [v3 hasEverRegistered];
  id v37 = [v3 lastRegistrationFailureError];
  [a1 timeSinceLastRegistrationFailureOnAccount:v3];
  double v21 = v20;
  [a1 timeSinceLastRegistrationSuccessOnAccount:v3];
  double v23 = v22;
  id v36 = [a1 accountSecurityLevelForAccount:v3];
  unsigned __int8 v35 = [a1 areAllAliasesSelectedOnAccount:v3];
  unsigned __int8 v34 = [a1 areAllSelectedAliasesRegisteredOnAccount:v3];
  id v24 = [v6 count];
  id v25 = [v10 count];
  LOBYTE(v33) = [a1 isProductionEnvironment];
  BYTE1(v32) = v34;
  LOBYTE(v32) = v35;
  BYTE4(v31) = v38;
  LODWORD(v31) = v39;
  LODWORD(v30) = v41;
  BYTE1(v29) = v43;
  LOBYTE(v29) = v45;
  id v26 = objc_msgSend(v51, "initWithAccountType:serviceIdentifier:doesExist:isEnabled:isUserDisabled:isiCloudSignedIn:doesMatchiCloudAccount:isiTunesSignedIn:registrationError:registrationErrorReason:registrationStatus:accountRegistrationStatus:hasEverRegistered:lastRegistrationFailureError:timeIntervalSinceLastRegistrationFailure:timeIntervalSinceLastRegistrationSuccess:accountSecurityLevel:areAllAliasesSelected:areAllSelectedAliasesRegistered:numberOfSelected:numberOfVetted:numberOfUnselectReasonUnknown:numberOfUnselectReasonAlertDenial:numberOfUnselectReasonClientCall:numberOfUnselectReasonBadAlias:numberOfUnselectReasonUpdateInfo:isProdEnvironment:", v50, v49, 1, v48, v47, v46, v21, v23, v29, v42, v30, v40,
          v31,
          v37,
          v36,
          v32,
          v24,
          v25,
          v15,
          v54,
          v53,
          v13,
          v14,
          v33);

  v27 = +[IMRGLog registration];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v60 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Constructed registration account status metric { metric: %@ }", buf, 0xCu);
  }

  return v26;
}

+ (id)registrationAccountStatusMetricForNonexistentAccountWithType:(int)a3 serviceIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)IDSRegistrationAccountStatusMetric);
  id v8 = [a1 isiCloudSignedIn];
  unsigned __int8 v9 = [a1 isiTunesSignedIn];
  LOBYTE(v17) = [a1 isProductionEnvironment];
  LOWORD(v16) = 0;
  BYTE4(v15) = 0;
  LODWORD(v15) = 0;
  LODWORD(v14) = -1;
  BYTE1(v13) = v9;
  LOBYTE(v13) = 0;
  id v10 = objc_msgSend(v7, "initWithAccountType:serviceIdentifier:doesExist:isEnabled:isUserDisabled:isiCloudSignedIn:doesMatchiCloudAccount:isiTunesSignedIn:registrationError:registrationErrorReason:registrationStatus:accountRegistrationStatus:hasEverRegistered:lastRegistrationFailureError:timeIntervalSinceLastRegistrationFailure:timeIntervalSinceLastRegistrationSuccess:accountSecurityLevel:areAllAliasesSelected:areAllSelectedAliasesRegistered:numberOfSelected:numberOfVetted:numberOfUnselectReasonUnknown:numberOfUnselectReasonAlertDenial:numberOfUnselectReasonClientCall:numberOfUnselectReasonBadAlias:numberOfUnselectReasonUpdateInfo:isProdEnvironment:", v4, v6, 0, 0, 0, v8, 0.0, 0.0, v13, -1, v14, 0,
          v15,
          -1,
          0,
          v16,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          v17);

  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Constructed registration account status metric { metric: %@ }", buf, 0xCu);
  }

  return v10;
}

@end