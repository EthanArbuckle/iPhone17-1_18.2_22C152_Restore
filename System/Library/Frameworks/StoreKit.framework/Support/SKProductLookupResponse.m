@interface SKProductLookupResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEntitled;
- (NSDictionary)parameters;
- (NSDictionary)resultDictionary;
- (NSString)extensionBundleID;
- (NSURL)deepLinkURL;
- (NSURL)productURL;
- (SKProductLookupResponse)initWithCoder:(id)a3;
- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKProductLookupResponse

- (SKProductLookupResponse)initWithResult:(id)a3 extensionID:(id)a4 productURL:(id)a5 isEntitled:(BOOL)a6 parameters:(id)a7 deepLinkURL:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SKProductLookupResponse;
  v18 = [(SKProductLookupResponse *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resultDictionary, a3);
    objc_storeStrong((id *)&v19->_extensionBundleID, a4);
    objc_storeStrong((id *)&v19->_productURL, a5);
    v19->_isEntitled = a6;
    objc_storeStrong((id *)&v19->_parameters, a7);
    objc_storeStrong((id *)&v19->_deepLinkURL, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  resultDictionary = self->_resultDictionary;
  id v12 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:resultDictionary requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  [v4 encodeObject:v6 forKey:@"resultDictionary"];
  if (v7)
  {
    if (qword_10039F760 != -1) {
      dispatch_once(&qword_10039F760, &stru_100357688);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F758, OS_LOG_TYPE_ERROR)) {
      sub_1002C11C8();
    }
  }

  parameters = self->_parameters;
  id v11 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:parameters requiringSecureCoding:1 error:&v11];
  id v10 = v11;
  if (v10)
  {
    if (qword_10039F760 != -1) {
      dispatch_once(&qword_10039F760, &stru_100357688);
    }
    if (os_log_type_enabled((os_log_t)qword_10039F758, OS_LOG_TYPE_ERROR)) {
      sub_1002C1160();
    }
  }
  [v4 encodeObject:v9 forKey:@"parameters"];
  [v4 encodeObject:self->_extensionBundleID forKey:@"extensionBundleID"];
  [v4 encodeObject:self->_productURL forKey:@"productURL"];
  [v4 encodeObject:self->_deepLinkURL forKey:@"deepLinkURL"];
  [v4 encodeBool:self->_isEntitled forKey:@"isEntitled"];
}

- (SKProductLookupResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SKProductLookupResponse;
  v5 = [(SKProductLookupResponse *)&v32 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resultDictionary"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    id v31 = 0;
    id v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v6 error:&v31];
    id v15 = v31;
    if (v15)
    {
      if (qword_10039F760 != -1) {
        dispatch_once(&qword_10039F760, &stru_100357688);
      }
      if (os_log_type_enabled((os_log_t)qword_10039F758, OS_LOG_TYPE_ERROR)) {
        sub_1002C1298();
      }
    }

    id v16 = (NSDictionary *)[v14 copy];
    resultDictionary = v5->_resultDictionary;
    v5->_resultDictionary = v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleID"];
    extensionBundleID = v5->_extensionBundleID;
    v5->_extensionBundleID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productURL"];
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deepLinkURL"];
    deepLinkURL = v5->_deepLinkURL;
    v5->_deepLinkURL = (NSURL *)v22;

    v5->_isEntitled = [v4 decodeBoolForKey:@"isEntitled"];
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameters"];
    id v30 = 0;
    v25 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v24 error:&v30];
    id v26 = v30;
    if (v26)
    {
      if (qword_10039F760 != -1) {
        dispatch_once(&qword_10039F760, &stru_100357688);
      }
      if (os_log_type_enabled((os_log_t)qword_10039F758, OS_LOG_TYPE_ERROR)) {
        sub_1002C1230();
      }
    }
    v27 = (NSDictionary *)[v25 copy];
    parameters = v5->_parameters;
    v5->_parameters = v27;
  }
  return v5;
}

- (NSDictionary)resultDictionary
{
  return self->_resultDictionary;
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (BOOL)isEntitled
{
  return self->_isEntitled;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);

  objc_storeStrong((id *)&self->_resultDictionary, 0);
}

@end