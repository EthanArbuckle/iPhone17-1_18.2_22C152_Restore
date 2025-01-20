@interface ENRegionServerAgencyExposureNotificationConfiguration
+ (BOOL)getNotificationConfiguration:(id *)a3 fromDictionary:(id)a4 locale:(id)a5 index:(unsigned __int8)a6;
+ (BOOL)supportsSecureCoding;
- (ENRegionServerAgencyExposureNotificationConfiguration)initWithCoder:(id)a3;
- (NSString)classificationName;
- (NSString)localizedExposureDetailBody;
- (NSString)localizedNotificationBody;
- (NSString)localizedNotificationSubject;
- (NSURL)classificationURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionServerAgencyExposureNotificationConfiguration

+ (BOOL)getNotificationConfiguration:(id *)a3 fromDictionary:(id)a4 locale:(id)a5 index:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = [v10 localeIdentifier];
    v12 = [v11 uppercaseString];

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __114__ENRegionServerAgencyExposureNotificationConfiguration_getNotificationConfiguration_fromDictionary_locale_index___block_invoke;
    v43[3] = &unk_264244A30;
    char v46 = v6;
    id v13 = v12;
    id v44 = v13;
    id v14 = v9;
    id v45 = v14;
    v15 = (void (**)(void, void))MEMORY[0x2166BC8A0](v43);
    v16 = (void *)[[NSString alloc] initWithFormat:@"%@_%d", @"classificationName", v6];
    CFStringGetTypeID();
    v42 = CFDictionaryGetTypedValue();
    if (v42)
    {
      id v40 = v10;
      id v41 = v9;
      v17 = (void *)[[NSString alloc] initWithFormat:@"%@_%d", @"classificationURL", v6];
      CFStringGetTypeID();
      v18 = CFDictionaryGetTypedValue();
      if (v18)
      {
        v19 = [NSURL URLWithString:v18];
        if (!v19) {
          LogInvalidValueForKey(v14, v17);
        }
      }
      else
      {
        v19 = 0;
      }

      v20 = ((void (**)(void, __CFString *))v15)[2](v15, @"exposureDetailsBodyText");
      if (v20)
      {
        v21 = ((void (**)(void, __CFString *))v15)[2](v15, @"notificationBody");
        if (v21)
        {
          v39 = v17;
          v22 = v16;
          id v23 = v13;
          v24 = ((void (**)(void, __CFString *))v15)[2](v15, @"notificationSubject");
          BOOL v25 = v24 != 0;
          if (v24)
          {
            v26 = objc_alloc_init(ENRegionServerAgencyExposureNotificationConfiguration);
            uint64_t v27 = [v42 copy];
            classificationName = v26->_classificationName;
            v26->_classificationName = (NSString *)v27;

            uint64_t v29 = [v19 copy];
            classificationURL = v26->_classificationURL;
            v26->_classificationURL = (NSURL *)v29;

            uint64_t v31 = [v20 copy];
            localizedExposureDetailBody = v26->_localizedExposureDetailBody;
            v26->_localizedExposureDetailBody = (NSString *)v31;

            uint64_t v33 = [v21 copy];
            localizedNotificationBody = v26->_localizedNotificationBody;
            v26->_localizedNotificationBody = (NSString *)v33;

            uint64_t v35 = [v24 copy];
            localizedNotificationSubject = v26->_localizedNotificationSubject;
            v26->_localizedNotificationSubject = (NSString *)v35;

            v37 = v26;
            *a3 = v37;
          }
          id v13 = v23;
          v16 = v22;
          v17 = v39;
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }

      id v10 = v40;
      id v9 = v41;
    }
    else
    {
      *a3 = 0;
      BOOL v25 = 1;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

id __114__ENRegionServerAgencyExposureNotificationConfiguration_getNotificationConfiguration_fromDictionary_locale_index___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithFormat:@"%@_%d_%@", v4, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32)];

  CFStringGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  classificationName = self->_classificationName;
  id v5 = a3;
  [v5 encodeObject:classificationName forKey:@"name"];
  [v5 encodeObject:self->_classificationURL forKey:@"URL"];
  [v5 encodeObject:self->_localizedExposureDetailBody forKey:@"expB"];
  [v5 encodeObject:self->_localizedNotificationBody forKey:@"noteB"];
  [v5 encodeObject:self->_localizedNotificationSubject forKey:@"noteT"];
}

- (ENRegionServerAgencyExposureNotificationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expB"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noteB"];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noteT"];
        if (v8
          && (v14.receiver = self,
              v14.super_class = (Class)ENRegionServerAgencyExposureNotificationConfiguration,
              id v9 = [(ENRegionServerAgencyExposureNotificationConfiguration *)&v14 init],
              (self = v9) != 0))
        {
          objc_storeStrong((id *)&v9->_classificationName, v5);
          id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
          classificationURL = self->_classificationURL;
          self->_classificationURL = v10;

          objc_storeStrong((id *)&self->_localizedExposureDetailBody, v6);
          objc_storeStrong((id *)&self->_localizedNotificationBody, v7);
          objc_storeStrong((id *)&self->_localizedNotificationSubject, v8);
          self = self;
          v12 = self;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)classificationName
{
  return self->_classificationName;
}

- (NSURL)classificationURL
{
  return self->_classificationURL;
}

- (NSString)localizedExposureDetailBody
{
  return self->_localizedExposureDetailBody;
}

- (NSString)localizedNotificationSubject
{
  return self->_localizedNotificationSubject;
}

- (NSString)localizedNotificationBody
{
  return self->_localizedNotificationBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNotificationBody, 0);
  objc_storeStrong((id *)&self->_localizedNotificationSubject, 0);
  objc_storeStrong((id *)&self->_localizedExposureDetailBody, 0);
  objc_storeStrong((id *)&self->_classificationURL, 0);

  objc_storeStrong((id *)&self->_classificationName, 0);
}

@end