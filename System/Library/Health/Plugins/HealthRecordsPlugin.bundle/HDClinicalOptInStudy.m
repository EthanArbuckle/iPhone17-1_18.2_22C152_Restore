@interface HDClinicalOptInStudy
+ (void)initialize;
- (BOOL)_createDirectory:(id)a3 error:(id *)a4;
- (BOOL)_lock_loadCertificateWithError:(id *)a3;
- (BOOL)_lock_loadHealthWrapConfigurationWithError:(id *)a3;
- (BOOL)_removeDirectory:(id)a3 error:(id *)a4;
- (BOOL)_submitAnalyticsData:(id)a3 error:(id *)a4;
- (BOOL)_uploadSubmittedAnalyticsDataWithError:(id *)a3;
- (BOOL)cleanWithError:(id *)a3;
- (BOOL)readyForAnalyticsSubmission;
- (BOOL)submitJSONAnalyticsData:(id)a3 error:(id *)a4;
- (BOOL)triggerOptInAnalyticsDataUploadToHealthCloudWithError:(id *)a3;
- (HDClinicalOptInStudy)initWithProfile:(id)a3 environment:(int64_t)a4;
- (HDClinicalOptInStudyDelegate)delegate;
- (HDProfile)profile;
- (HKHealthWrapMessageConfiguration)healthWrapConfiguration;
- (NSMutableDictionary)inputStreams;
- (NSMutableDictionary)responses;
- (NSString)authorizationKey;
- (NSString)certString;
- (NSString)channel;
- (NSString)healthCloudDirectoryPath;
- (NSString)hostname;
- (NSString)scheme;
- (NSString)studyID;
- (NSString)subjectID;
- (NSString)subjectToken;
- (NSURLSession)session;
- (__SecCertificate)certificate;
- (id)_healthCloudUploadDirectoryPath;
- (id)_keyValueDomain;
- (id)_registrationURL;
- (id)_subjectIDKey;
- (id)_subjectTokenKey;
- (id)_uploadURL;
- (id)currentSubjectID;
- (int64_t)environment;
- (unsigned)port;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)_lock_enableDataCollectionIfNecessary;
- (void)_lock_registerDevice;
- (void)_setSubjectID:(id)a3 subjectToken:(id)a4;
- (void)enableDataCollection;
- (void)setCertificate:(__SecCertificate *)a3;
- (void)setDelegate:(id)a3;
- (void)setHealthWrapConfiguration:(id)a3;
- (void)setReadyForAnalyticsSubmission:(BOOL)a3;
- (void)setSubjectID:(id)a3;
- (void)setSubjectToken:(id)a3;
@end

@implementation HDClinicalOptInStudy

+ (void)initialize
{
  v2 = +[NSUserDefaults standardUserDefaults];
  uint64_t v3 = HDClinicalOptInStudyHealthCloudEnvironmentKey;
  v4 = [v2 valueForKey:HDClinicalOptInStudyHealthCloudEnvironmentKey];

  if (!v4)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 setInteger:2 forKey:v3];
  }
}

- (HDClinicalOptInStudy)initWithProfile:(id)a3 environment:(int64_t)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HDClinicalOptInStudy;
  v7 = [(HDClinicalOptInStudy *)&v36 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v8->_environment = a4;
    if (a4 == 2)
    {
      authorizationKey = v8->_authorizationKey;
      v8->_authorizationKey = (NSString *)@"XFiIxgUQcvNTJlxFE4w4gJp9mERr1DyoV63u356YHyElsbKTyp5lkNyL5k8qj63T";

      channel = v8->_channel;
      v8->_channel = (NSString *)@"DataAnalytics";

      scheme = v8->_scheme;
      v8->_scheme = (NSString *)@"https";

      hostname = v8->_hostname;
      v8->_hostname = (NSString *)@"ingest.apple-studies.com";

      __int16 v20 = 443;
    }
    else
    {
      if (a4 != 1)
      {
        if (a4)
        {
LABEL_10:
          v26 = [v6 directoryPath];
          uint64_t v27 = [v26 stringByAppendingPathComponent:@"HealthCloud"];
          healthCloudDirectoryPath = v8->_healthCloudDirectoryPath;
          v8->_healthCloudDirectoryPath = (NSString *)v27;

          v8->_ivarLock._os_unfair_lock_opaque = 0;
          v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          responses = v8->_responses;
          v8->_responses = v29;

          v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          inputStreams = v8->_inputStreams;
          v8->_inputStreams = v31;

          v33 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
          operationQueue = v8->_operationQueue;
          v8->_operationQueue = v33;

          goto LABEL_11;
        }
        v9 = v8->_authorizationKey;
        v8->_authorizationKey = (NSString *)@"2uMIJ3gLXrQZxFrZXJ5KhPBgVDRBfpjnE1Ds4nZw0bRyvO8alW6pvx5KpE6qoqsw";

        v10 = v8->_channel;
        v8->_channel = (NSString *)@"DataAnalytics";

        v11 = v8->_scheme;
        v8->_scheme = (NSString *)@"https";

        v12 = v8->_hostname;
        v8->_hostname = (NSString *)@"ingest.stg.apple-studies.com";

        v8->_port = 443;
        studyID = v8->_studyID;
        v8->_studyID = (NSString *)@"2d10aed9-9d38-4879-a22b-133877bcfe76";

        certString = v8->_certString;
        CFStringRef v15 = @"MIIDjTCCAnWgAwIBAgIEDZOX8jANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzNzIxWhcNMTgwNDE4MTgzNzIxWjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3PXGIYi84LTNzcOvbKPly9+gwYjg2D5DJnMstVFrAkjfNp+6fE8PtBQPfCxYBJGnVWAMNAKHjsTHJtpq92gW+l/WG1/SGnG251LN13ugBgSI7oaf8aF3iAJ4dyFnb5xScZoFKjwXtoR2HLFgxpCfG6KYWABSvubaupxIwmqqRMNfQb6xWHhu0y1MJG6U0UX+9PghEw5xFTtIoEpkIiuOEWU6LwdhW5cnrnVFn49f9j02LHkBq/eLbjm7lXHIGwYolhNN/RurwpF2MbAaAw4pF6b//WswZUSepbnFtlfCEo3HjraNe1nVB2S+f8pysdc67Lfr8vhn6rjK2f0nQ11oZAgMBAAGjITAfMB0GA1UdDgQWBBQ/j4HEfBnPOz4ZGC5Add8PGVw6oDANBgkqhkiG9w0BAQsFAAOCAQEAEoMDoP4ls0RxjZJesTYPv+7XHqcREDlBup4vJLUSOrOU41jKaDUH2dygzdntpaSh8C3hoY/BYwWIxNPKlETikn0bNAz0Q+TX1rNPc67ZGyJwGisIsIYdcXjrL1oc6dp45KdPN1KQY2VrW3XCXbswoT+65noI13WIXpzky+UugnbQ3fGfOw/ku6NYcZ/VfVPl9nr8JdEWY9Jlbo1Ze8J7XGrDhn2llzWDfBMZOuETJG5ZxIJum2xnIblb9I0gxxMH9BGujxCw02xoSdAbrS2kQEhDCfyE4/vOMloTnjUV95DYezSfJ08CX/Uc0nm1hCB+5CjfATWNwaYddzWbzeiWag==";
LABEL_9:
        v8->_certString = &v15->isa;

        goto LABEL_10;
      }
      v21 = v8->_authorizationKey;
      v8->_authorizationKey = (NSString *)@"XFiIxgUQcvNTJlxFE4w4gJp9mERr1DyoV63u356YHyElsbKTyp5lkNyL5k8qj63T";

      v22 = v8->_channel;
      v8->_channel = (NSString *)@"DataAnalytics";

      v23 = v8->_scheme;
      v8->_scheme = (NSString *)@"http";

      v24 = v8->_hostname;
      v8->_hostname = (NSString *)@"127.0.0.1";

      __int16 v20 = 8443;
    }
    v8->_port = v20;
    v25 = v8->_studyID;
    v8->_studyID = (NSString *)@"5ed9d727-d9d3-4cae-9869-0b97ca2dfe9d";

    certString = v8->_certString;
    CFStringRef v15 = @"MIIDjTCCAnWgAwIBAgIEFN2TTjANBgkqhkiG9w0BAQsFADB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwHhcNMTcwNDE4MTgzODI4WhcNMTgwNDE4MTgzODI4WjB3MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExEjAQBgNVBAcTCUN1cGVydGlubzEXMBUGA1UEChMOQXBwbGUgSW50ZXJuYWwxDzANBgNVBAsTBkhlYWx0aDEdMBsGA1UEAxMUY29tLmFwcGxlLkhlYWx0aERhdGEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDvR2JtAkPdG/BldPRT7EupiMo4ZvLOzztoDeul2awbM9fBU8kc3nlapOi2vooX62cyPJKsqCas465gy4U3JJBMVg/MjshfUIDBb1LQzGtvfYkirdpWOqJ7riQ0Wbe6LLRFD0963JNF1lyMHkf7OqZegIh8c+xGGgd2ynkdivaKOr2d7Qf67y2UarQc+qIgkljsaOugfBr3jsUcO0tE0j9LGOvTZZEZd3ykXUEChIkwGW+QWWd3Indit4ArSMGDjkrltGX88FBWgbPYe8dgjWcE2GkEEWhJFwIiTCHQZFHlizSzY5vyG0mcbgdl/HjbyswUn3kw8CvmSOuzi7YNolypAgMBAAGjITAfMB0GA1UdDgQWBBRaESD5M6MGBsOr4aMdm42SVZwycDANBgkqhkiG9w0BAQsFAAOCAQEAVg1mV0Zf9/o+cAbwvcQgdGIbeUghVdDybkVkeew/3dpdRN/S9k9BTusNL4gNKbRRIjJiESq68rP++8BP7xhIO3EsICFAo/fp87af1EncYIjwh9V6P77V+wnvU8Ehgj9tGj5GhU/o1tmCLmBsJi+uUz8vd7p8S/CbH0wUpe0uov4d79R1DGYrM+fansMd9JnmZfLeGU1sx2q+hEfAZyuSRJEf4+GbgEuthq0aBNC6VeXVmmNqd36at3F9O4DzJiJOZiEHXNYOXiyJYSBEvgKdd23G9tR1Pdqw//0sKv/C4b3FQWowN7uZzJ3SJTrolzpUGlTSy5PPeXsmsL7TKM27uA==";
    goto LABEL_9;
  }
LABEL_11:

  return v8;
}

- (NSURLSession)session
{
  v2 = self;
  objc_sync_enter(v2);
  session = v2->_session;
  if (!session)
  {
    v4 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.healthd.HealthRecordsPlugin.OptInStudy"];
    uint64_t v5 = +[NSURLSession sessionWithConfiguration:v4 delegate:v2 delegateQueue:v2->_operationQueue];
    id v6 = v2->_session;
    v2->_session = (NSURLSession *)v5;

    session = v2->_session;
  }
  v7 = session;
  objc_sync_exit(v2);

  return v7;
}

- (id)currentSubjectID
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  id v4 = [(NSString *)self->_subjectID copy];
  os_unfair_lock_unlock(p_ivarLock);

  return v4;
}

- (void)_setSubjectID:(id)a3 subjectToken:(id)a4
{
  p_ivarLock = &self->_ivarLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_ivarLock);
  [(HDClinicalOptInStudy *)self setSubjectID:v8];

  [(HDClinicalOptInStudy *)self setSubjectToken:v7];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)enableDataCollection
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  [(HDClinicalOptInStudy *)self _lock_enableDataCollectionIfNecessary];

  os_unfair_lock_unlock(p_ivarLock);
}

- (BOOL)submitJSONAnalyticsData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(HDClinicalOptInStudy *)self enableDataCollection];
  LOBYTE(a4) = [(HDClinicalOptInStudy *)self _submitAnalyticsData:v6 error:a4];

  return (char)a4;
}

- (BOOL)triggerOptInAnalyticsDataUploadToHealthCloudWithError:(id *)a3
{
  [(HDClinicalOptInStudy *)self enableDataCollection];

  return [(HDClinicalOptInStudy *)self _uploadSubmittedAnalyticsDataWithError:a3];
}

- (BOOL)cleanWithError:(id *)a3
{
  uint64_t v5 = [(HDClinicalOptInStudy *)self healthCloudDirectoryPath];
  id v10 = 0;
  BOOL v6 = [(HDClinicalOptInStudy *)self _removeDirectory:v5 error:&v10];
  id v7 = v10;

  if (!v6)
  {
    id v8 = v7;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AA534();
    }
  }

  return v6;
}

- (void)_lock_enableDataCollectionIfNecessary
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  if (!self->_readyForAnalyticsSubmission)
  {
    uint64_t v3 = [(HDClinicalOptInStudy *)self subjectID];
    if ([v3 length])
    {
      id v4 = [(HDClinicalOptInStudy *)self subjectToken];
      id v5 = [v4 length];

      if (v5)
      {
        id v13 = 0;
        unsigned __int8 v6 = [(HDClinicalOptInStudy *)self _lock_loadCertificateWithError:&v13];
        id v7 = v13;
        id v8 = v7;
        if (v6)
        {
          id v12 = v7;
          unsigned __int8 v9 = [(HDClinicalOptInStudy *)self _lock_loadHealthWrapConfigurationWithError:&v12];
          id v10 = v12;

          if (v9)
          {
            self->_readyForAnalyticsSubmission = 1;
            v11 = [(HDClinicalOptInStudy *)self delegate];
            [v11 clinicalOptInStudyIsReadyForDataSubmission:self];
          }
          else
          {
            if (!v10) {
              return;
            }
            _HKInitializeLogging();
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
              sub_AA59C();
            }
          }
          id v8 = v10;
        }
        else
        {
          if (!v7) {
            return;
          }
          _HKInitializeLogging();
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
            sub_AA604();
          }
        }

        return;
      }
    }
    else
    {
    }
    [(HDClinicalOptInStudy *)self _lock_registerDevice];
  }
}

- (void)_lock_registerDevice
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  _HKInitializeLogging();
  uint64_t v3 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempting to register device for clinical opt-in study", buf, 2u);
  }
  id v4 = objc_alloc((Class)NSMutableURLRequest);
  id v5 = [(HDClinicalOptInStudy *)self _registrationURL];
  id v6 = [v4 initWithURL:v5];

  [v6 setAllowsCellularAccess:1];
  [v6 setHTTPMethod:@"POST"];
  id v7 = [(HDClinicalOptInStudy *)self authorizationKey];
  [v6 setValue:v7 forHTTPHeaderField:@"Authorization"];

  [v6 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  [v6 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  id v8 = +[NSURLSession sharedSession];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_D618;
  v10[3] = &unk_111AA0;
  v10[4] = self;
  unsigned __int8 v9 = [v8 dataTaskWithRequest:v6 completionHandler:v10];

  [v9 resume];
}

- (BOOL)_lock_loadHealthWrapConfigurationWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  if (!self->_certificate) {
    return 0;
  }
  id v5 = objc_alloc((Class)NSUUID);
  id v6 = [(HDClinicalOptInStudy *)self subjectID];
  id v7 = [v5 initWithUUIDString:v6];

  id v8 = objc_alloc((Class)NSUUID);
  unsigned __int8 v9 = [(HDClinicalOptInStudy *)self studyID];
  id v10 = [v8 initWithUUIDString:v9];

  if (v7) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (v11)
  {
    +[NSError hk_assignError:a3 code:100 format:@"Received mal-formatted subject ID or study ID"];
  }
  else
  {
    id v13 = objc_alloc((Class)HKHealthWrapMessageConfiguration);
    v14 = [(HDClinicalOptInStudy *)self channel];
    CFStringRef v15 = (HKHealthWrapMessageConfiguration *)[v13 initWithSubjectUUID:v7 studyUUID:v10 channel:v14 payloadType:@"JSON" certificate:self->_certificate];

    healthWrapConfiguration = self->_healthWrapConfiguration;
    self->_healthWrapConfiguration = v15;
  }
  return v12;
}

- (BOOL)_lock_loadCertificateWithError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  HKHealthWrapDERDataFromString();
  CFDataRef v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    CFStringRef v8 = @"Failed to decode base64 certificate data.";
LABEL_6:
    +[NSError hk_assignError:a3 code:100 format:v8];
    BOOL v7 = 0;
    goto LABEL_7;
  }
  id v6 = SecCertificateCreateWithData(0, v5);
  self->_certificate = v6;
  if (!v6)
  {
    CFStringRef v8 = @"Failed to create certificate.";
    goto LABEL_6;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)_submitAnalyticsData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  BOOL v7 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Attempting to submit analytics data", v19, 2u);
  }
  os_unfair_lock_lock(&self->_ivarLock);
  BOOL readyForAnalyticsSubmission = self->_readyForAnalyticsSubmission;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!readyForAnalyticsSubmission)
  {
    id v17 = +[NSError hk_error:0 description:@"Not ready for submission yet"];
    id v14 = v17;
    if (v17)
    {
      if (a4)
      {
        id v14 = v17;
        unsigned __int8 v16 = 0;
        *a4 = v14;
        BOOL v11 = v14;
        goto LABEL_12;
      }
      _HKLogDroppedError();
    }
    unsigned __int8 v16 = 0;
    BOOL v11 = v14;
    goto LABEL_12;
  }
  unsigned __int8 v9 = [(HDClinicalOptInStudy *)self _healthCloudUploadDirectoryPath];
  unsigned int v10 = [(HDClinicalOptInStudy *)self _createDirectory:v9 error:a4];

  if (v10)
  {
    os_unfair_lock_lock(&self->_ivarLock);
    BOOL v11 = [(HDClinicalOptInStudy *)self healthWrapConfiguration];
    os_unfair_lock_unlock(&self->_ivarLock);
    id v12 = objc_alloc((Class)HDAnalyticsWriter);
    id v13 = [(HDClinicalOptInStudy *)self profile];
    id v14 = [v12 initWithProfile:v13];

    CFStringRef v15 = [(HDClinicalOptInStudy *)self _healthCloudUploadDirectoryPath];
    unsigned __int8 v16 = [v14 submitJSONAnalyticsData:v6 toDirectory:v15 withConfiguration:v11 error:a4];

LABEL_12:
    goto LABEL_13;
  }
  unsigned __int8 v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)_uploadSubmittedAnalyticsDataWithError:(id *)a3
{
  _HKInitializeLogging();
  CFDataRef v5 = (os_log_t *)&HKLogHealthRecords;
  id v6 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Attempting to upload submitted analytics data", buf, 2u);
  }
  os_unfair_lock_lock(&self->_ivarLock);
  BOOL readyForAnalyticsSubmission = self->_readyForAnalyticsSubmission;
  os_unfair_lock_unlock(&self->_ivarLock);
  if (!readyForAnalyticsSubmission)
  {
    id v11 = +[NSError hk_error:0 description:@"Not ready for submission yet"];
    id v10 = v11;
    if (v11)
    {
      if (a3)
      {
        id v10 = v11;
        *a3 = v10;
        CFStringRef v8 = v10;
        goto LABEL_33;
      }
      _HKLogDroppedError();
    }
    CFStringRef v8 = v10;
    goto LABEL_33;
  }
  CFStringRef v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [(HDClinicalOptInStudy *)self _healthCloudUploadDirectoryPath];
  id v49 = 0;
  v40 = [v8 contentsOfDirectoryAtPath:v9 error:&v49];
  id v10 = v49;

  if (v10)
  {
    if (a3) {
      *a3 = v10;
    }
    else {
      _HKLogDroppedError();
    }
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AA85C();
    }
  }
  id v12 = v40;
  if ([v40 count])
  {
    id v37 = v10;
    v38 = v8;
    BOOL v39 = readyForAnalyticsSubmission;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v40;
    id v13 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v46;
      uint64_t v41 = *(void *)v46;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if ([v17 hasPrefix:@"HealthWrap"])
          {
            _HKInitializeLogging();
            v18 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v17;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Start upload analytics health wrap message: %@", buf, 0xCu);
            }
            v19 = [(HDClinicalOptInStudy *)self _healthCloudUploadDirectoryPath];
            __int16 v20 = [v19 stringByAppendingPathComponent:v17];

            v21 = +[NSFileManager defaultManager];
            id v44 = 0;
            v22 = [v21 attributesOfItemAtPath:v20 error:&v44];
            id v23 = v44;

            if (v22)
            {
              v24 = [v22 objectForKeyedSubscript:NSFileSize];
              v43 = +[NSString stringWithFormat:@"%@", v24];

              v25 = [(HDClinicalOptInStudy *)self _uploadURL];
              v26 = +[NSMutableURLRequest requestWithURL:v25];

              [v26 setAllowsCellularAccess:0];
              [v26 setHTTPMethod:@"POST"];
              [v26 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
              [v26 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
              [v26 setValue:v43 forHTTPHeaderField:@"Content-Length"];
              uint64_t v27 = [(HDClinicalOptInStudy *)self authorizationKey];
              [v26 setValue:v27 forHTTPHeaderField:@"Authorization"];

              v28 = [(HDClinicalOptInStudy *)self subjectToken];
              [v26 setValue:v28 forHTTPHeaderField:@"X-HDS-Subject-Authorization"];

              v29 = [(HDClinicalOptInStudy *)self session];
              [v29 uploadTaskWithStreamedRequest:v26];
              id v30 = v23;
              v31 = self;
              id v32 = v14;
              v34 = v33 = v5;

              uint64_t v15 = v41;
              [v34 setTaskDescription:v20];
              [v34 resume];

              CFDataRef v5 = v33;
              id v14 = v32;
              self = v31;
              id v23 = v30;
            }
            else
            {
              _HKInitializeLogging();
              v35 = *v5;
              if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v51 = v20;
                __int16 v52 = 2112;
                id v53 = v23;
                _os_log_error_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "Failed to get attributes for file at path: %@, error: %@", buf, 0x16u);
              }
            }
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v14);
    }

    BOOL readyForAnalyticsSubmission = v39;
    id v10 = v37;
    CFStringRef v8 = v38;
    id v12 = v40;
  }

LABEL_33:
  return readyForAnalyticsSubmission;
}

- (BOOL)_createDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSFileManager);
  if ([v6 fileExistsAtPath:v5 isDirectory:0])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v12 = 0;
    unsigned __int8 v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v8 = v12;
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v9 = +[NSString stringWithFormat:@"Error creating submission directory %@", v5];
      id v10 = +[NSError hk_error:100 description:v9 underlyingError:v8];
      if (v10)
      {
        if (a4) {
          *a4 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }

  return v7;
}

- (BOOL)_removeDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSFileManager);
  if ([v6 fileExistsAtPath:v5 isDirectory:0]) {
    unsigned __int8 v7 = [v6 removeItemAtPath:v5 error:a4];
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [(HDClinicalOptInStudy *)self responses];
  unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 taskIdentifier]);
  id v10 = [v8 objectForKey:v9];

  if (!v10)
  {
    id v10 = objc_alloc_init((Class)NSMutableData);
    responses = self->_responses;
    id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 taskIdentifier]);
    [(NSMutableDictionary *)responses setObject:v10 forKey:v12];
  }
  [v10 appendData:v7];
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v14 = a4;
  id v7 = (void (**)(id, void *))a5;
  id v8 = [(HDClinicalOptInStudy *)self inputStreams];
  unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 taskIdentifier]);
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    id v11 = [v14 taskDescription];
    id v10 = +[NSInputStream inputStreamWithFileAtPath:v11];

    id v12 = [(HDClinicalOptInStudy *)self inputStreams];
    id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 taskIdentifier]);
    [v12 setObject:v10 forKeyedSubscript:v13];
  }
  v7[2](v7, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unsigned __int8 v9 = [v7 taskDescription];
  if ([v7 state] == (char *)&dword_0 + 3 && objc_msgSend(v9, "length"))
  {
    id v10 = [(HDClinicalOptInStudy *)self responses];
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
    id v12 = [v10 objectForKey:v11];

    id v13 = objc_alloc((Class)NSString);
    id v14 = v12;
    id v15 = objc_msgSend(v13, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 4, 0);
    unsigned __int8 v16 = [(HDClinicalOptInStudy *)self responses];
    id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
    [v16 removeObjectForKey:v17];

    v18 = [v7 response];
    v19 = (char *)[v18 statusCode];
    if ((unint64_t)(v19 - 200) >= 0x64)
    {
      v33 = v19;
      _HKInitializeLogging();
      v34 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v38 = v33;
        __int16 v39 = 2112;
        id v40 = v15;
        __int16 v41 = 2112;
        id v42 = v8;
        _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "Failed to upload analytics for opt-in study: received status code %ld, response: %@, error: %@", buf, 0x20u);
      }
    }
    else
    {
      id v35 = v15;
      __int16 v20 = [(HDClinicalOptInStudy *)self inputStreams];
      v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
      v22 = [v20 objectForKeyedSubscript:v21];

      [v22 close];
      id v23 = [(HDClinicalOptInStudy *)self inputStreams];
      v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 taskIdentifier]);
      [v23 removeObjectForKey:v24];

      v25 = +[NSFileManager defaultManager];
      id v36 = 0;
      unsigned int v26 = [v25 removeItemAtPath:v9 error:&v36];
      id v27 = v36;

      if (!v26 || v27)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_AA8C4();
        }
      }
      _HKInitializeLogging();
      v28 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        v29 = v28;
        id v30 = [v9 lastPathComponent];
        *(_DWORD *)buf = 138412290;
        v38 = v30;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Successfully uploaded analytics health wrap message: %@", buf, 0xCu);
      }
      v31 = [(HDClinicalOptInStudy *)self delegate];
      id v32 = [v9 lastPathComponent];
      [v31 clinicalOptInStudy:self hasFinishedUploadingFile:v32];

      id v15 = v35;
    }
  }
}

- (id)_keyValueDomain
{
  id v4 = [(HDClinicalOptInStudy *)self profile];
  if (!v4)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDClinicalOptInStudy.m", 517, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  id v5 = [objc_alloc((Class)HDKeyValueDomain) initWithCategory:100 domainName:@"healthrecords-study" profile:v4];

  return v5;
}

- (id)_subjectIDKey
{
  id v3 = objc_alloc((Class)NSString);
  int64_t v4 = [(HDClinicalOptInStudy *)self environment];
  CFStringRef v5 = @"staging";
  if (v4 == 1) {
    CFStringRef v5 = @"testing";
  }
  if (v4 == 2) {
    CFStringRef v5 = @"production";
  }
  id v6 = [v3 initWithFormat:@"subject-id-%@", v5];

  return v6;
}

- (id)_subjectTokenKey
{
  id v3 = objc_alloc((Class)NSString);
  int64_t v4 = [(HDClinicalOptInStudy *)self environment];
  CFStringRef v5 = @"staging";
  if (v4 == 1) {
    CFStringRef v5 = @"testing";
  }
  if (v4 == 2) {
    CFStringRef v5 = @"production";
  }
  id v6 = [v3 initWithFormat:@"subject-token-%@", v5];

  return v6;
}

- (id)_registrationURL
{
  id v3 = objc_alloc_init((Class)NSURLComponents);
  int64_t v4 = [(HDClinicalOptInStudy *)self hostname];
  [v3 setHost:v4];

  CFStringRef v5 = [(HDClinicalOptInStudy *)self studyID];
  id v6 = [@"/ingest/v2/register" stringByAppendingPathComponent:v5];
  [v3 setPath:v6];

  id v7 = [(HDClinicalOptInStudy *)self scheme];
  [v3 setScheme:v7];

  id v8 = +[NSNumber numberWithUnsignedShort:self->_port];
  [v3 setPort:v8];

  unsigned __int8 v9 = [v3 URL];

  return v9;
}

- (id)_uploadURL
{
  id v3 = objc_alloc_init((Class)NSURLComponents);
  int64_t v4 = [(HDClinicalOptInStudy *)self hostname];
  [v3 setHost:v4];

  [v3 setPath:@"/ingest/v2/submit"];
  CFStringRef v5 = [(HDClinicalOptInStudy *)self scheme];
  [v3 setScheme:v5];

  id v6 = +[NSNumber numberWithUnsignedShort:self->_port];
  [v3 setPort:v6];

  id v7 = [v3 URL];

  return v7;
}

- (id)_healthCloudUploadDirectoryPath
{
  return [(NSString *)self->_healthCloudDirectoryPath stringByAppendingPathComponent:@"Upload"];
}

- (HDClinicalOptInStudyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDClinicalOptInStudyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (int64_t)environment
{
  return self->_environment;
}

- (NSMutableDictionary)responses
{
  return self->_responses;
}

- (NSMutableDictionary)inputStreams
{
  return self->_inputStreams;
}

- (BOOL)readyForAnalyticsSubmission
{
  return self->_readyForAnalyticsSubmission;
}

- (void)setReadyForAnalyticsSubmission:(BOOL)a3
{
  self->_BOOL readyForAnalyticsSubmission = a3;
}

- (NSString)authorizationKey
{
  return self->_authorizationKey;
}

- (NSString)certString
{
  return self->_certString;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (unsigned)port
{
  return self->_port;
}

- (NSString)studyID
{
  return self->_studyID;
}

- (NSString)subjectID
{
  return self->_subjectID;
}

- (void)setSubjectID:(id)a3
{
}

- (NSString)subjectToken
{
  return self->_subjectToken;
}

- (void)setSubjectToken:(id)a3
{
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (HKHealthWrapMessageConfiguration)healthWrapConfiguration
{
  return self->_healthWrapConfiguration;
}

- (void)setHealthWrapConfiguration:(id)a3
{
}

- (NSString)healthCloudDirectoryPath
{
  return self->_healthCloudDirectoryPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthCloudDirectoryPath, 0);
  objc_storeStrong((id *)&self->_healthWrapConfiguration, 0);
  objc_storeStrong((id *)&self->_subjectToken, 0);
  objc_storeStrong((id *)&self->_subjectID, 0);
  objc_storeStrong((id *)&self->_studyID, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_certString, 0);
  objc_storeStrong((id *)&self->_authorizationKey, 0);
  objc_storeStrong((id *)&self->_inputStreams, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end