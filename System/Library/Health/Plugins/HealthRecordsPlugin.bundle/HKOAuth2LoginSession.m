@interface HKOAuth2LoginSession
+ (id)newLoginSessionWithGateway:(id)a3 error:(id *)a4;
@end

@implementation HKOAuth2LoginSession

+ (id)newLoginSessionWithGateway:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSUUID UUID];
  v8 = [v6 connectionInformationWithAccountIdentifier:v7 credential:0 error:a4];

  if (v8)
  {
    v9 = +[HDFHIRSpecification specificationWithConnectionInformation:v8 error:a4];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 authorizationSchemaForType:2];
      v12 = v11;
      if (v11)
      {
        v59 = [v11 currentScopeStringWithError:a4];
        if (v59)
        {
          v13 = [v8 authentication];
          id v14 = [v13 PKCEAlgorithm];

          uint64_t v15 = [a1 generatePKCEVerifierWithAlgorithm:v14];
          if (v15)
          {
            id v60 = 0;
            v58 = (void *)v15;
            uint64_t v16 = [a1 generatePKCEChallengeFromVerifier:v15 algorithm:v14 error:&v60];
            id v17 = v60;
            v57 = (__CFString *)v16;
            if (!v16)
            {
              _HKInitializeLogging();
              v18 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
                sub_AAC70(v18, a1, (uint64_t)v17);
              }

              v58 = 0;
            }
          }
          else
          {
            v57 = 0;
            v58 = 0;
          }
          v22 = [v8 gateway];
          v23 = [v22 authSchemas];
          v24 = objc_msgSend(v23, "hk_firstObjectPassingTest:", &stru_111CE8);

          v56 = v24;
          v25 = [v24 query];
          v26 = objc_msgSend(v25, "hk_firstObjectPassingTest:", &stru_111D28);

          v27 = [v26 literal];

          if (v27)
          {
            uint64_t v28 = [v26 literal];
            v29 = (void *)v28;
            if (v28) {
              CFStringRef v30 = (const __CFString *)v28;
            }
            else {
              CFStringRef v30 = &stru_1152E8;
            }
            uint64_t v31 = +[NSURLComponents componentsWithString:v30];

            v55 = (void *)v31;
            if (v31)
            {
              v51 = v26;
              v32 = +[NSUUID UUID];
              v61[0] = @"state";
              v54 = v32;
              uint64_t v33 = [v32 UUIDString];
              v52 = (void *)v33;
              CFStringRef v34 = v57;
              if (!v57) {
                CFStringRef v34 = &stru_1152E8;
              }
              v62[0] = v33;
              v62[1] = v34;
              v61[1] = @"PKCEChallenge";
              v61[2] = @"clientID";
              v35 = [v10 connection];
              v36 = [v35 authentication];
              uint64_t v37 = [v36 clientID];
              v38 = (void *)v37;
              if (v37) {
                CFStringRef v39 = (const __CFString *)v37;
              }
              else {
                CFStringRef v39 = &stru_1152E8;
              }
              v62[2] = v39;
              uint64_t v40 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];

              uint64_t v41 = v40;
              v42 = [v12 createRequestWithBindings:v40 queryMode:0 error:a4];
              v43 = v42;
              v53 = (void *)v41;
              if (v42)
              {
                v44 = [v42 URL];
                if (v44)
                {
                  id v45 = objc_alloc((Class)a1);
                  v46 = v55;
                  id v19 = [v45 initWithState:v54 loginURL:v44 callbackURLComponents:v55 requestedScope:v59 pkceVerifier:v58];
                }
                else
                {
                  +[NSError hk_assignError:a4 code:100 description:@"Login request has no URL"];
                  id v19 = 0;
                  v46 = v55;
                }
                v47 = v56;
                v26 = v51;
              }
              else
              {
                id v19 = 0;
                v46 = v55;
                v47 = v56;
                v26 = v51;
              }

              v49 = v53;
              v48 = v54;
            }
            else
            {
              v48 = [v26 literal];
              v49 = HKSensitiveLogItem();
              +[NSError hk_assignError:a4, 100, @"Redirect URL string <%@> could not be parsed into NSURLComponents", v49 code format];
              id v19 = 0;
              v46 = 0;
              v47 = v56;
            }
          }
          else
          {
            +[NSError hk_assignError:a4 code:100 description:@"Authorization schema has no redirect URL or no “literal” value"];
            id v19 = 0;
            v47 = v56;
          }
        }
        else
        {
          id v19 = 0;
        }
      }
      else
      {
        v20 = [v6 externalID];
        v21 = HKSensitiveLogItem();
        +[NSError hk_assignError:a4, 100, @"Unable to determine authorization schema for gateway %@", v21 code format];

        id v19 = 0;
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

@end