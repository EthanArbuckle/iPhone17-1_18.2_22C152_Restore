@interface SGSuggestedEventLaunchInfo
+ (BOOL)supportsSecureCoding;
- (INIntent)intent;
- (NSString)bundleId;
- (NSString)localizedShowInString;
- (NSString)userActivityString;
- (NSURL)sourceURL;
- (NSUserActivity)userActivity;
- (SGSuggestedEventLaunchInfo)initWithBundleId:(id)a3 localizedShowInString:(id)a4 userActivity:(id)a5 intent:(id)a6 sourceURL:(id)a7;
- (SGSuggestedEventLaunchInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUserActivityString:(id)a3;
@end

@implementation SGSuggestedEventLaunchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_userActivityString, 0);

  objc_storeStrong((id *)&self->_localizedShowInString, 0);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setUserActivityString:(id)a3
{
}

- (NSString)userActivityString
{
  return self->_userActivityString;
}

- (NSString)localizedShowInString
{
  return self->_localizedShowInString;
}

- (NSUserActivity)userActivity
{
  if (self->_userActivityString) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:self->_userActivityString secondaryString:0 optionalData:0];
  }
  else {
    v2 = 0;
  }

  return (NSUserActivity *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  bundleId = self->_bundleId;
  id v5 = a3;
  [v5 encodeObject:bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_localizedShowInString forKey:@"localizedShowInString"];
  [v5 encodeObject:self->_userActivityString forKey:@"userActivityString"];
  [v5 encodeObject:self->_intent forKey:@"intent"];
  [v5 encodeObject:self->_sourceURL forKey:@"sourceURL"];
}

- (SGSuggestedEventLaunchInfo)initWithCoder:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SGSuggestedEventLaunchInfo;
  v6 = [(SGSuggestedEventLaunchInfo *)&v25 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"bundleId"];

    if (v8)
    {
      v9 = v8;
      bundleId = v6->_bundleId;
      v6->_bundleId = v9;
    }
    else
    {
      bundleId = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(bundleId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGSuggestedEventLaunchInfo.m", 53, @"nonnull property %s *%s was null when decoded", "NSString", "bundleId");
    }

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"localizedShowInString"];

    if (v12)
    {
      v13 = v12;
      localizedShowInString = v6->_localizedShowInString;
      v6->_localizedShowInString = v13;
    }
    else
    {
      localizedShowInString = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(localizedShowInString, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGSuggestedEventLaunchInfo.m", 54, @"nonnull property %s *%s was null when decoded", "NSString", "localizedShowInString");
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v5 decodeObjectOfClasses:v15 forKey:@"userActivityString"];
    userActivityString = v6->_userActivityString;
    v6->_userActivityString = (NSString *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v5 decodeObjectOfClasses:v18 forKey:@"intent"];
    intent = v6->_intent;
    v6->_intent = (INIntent *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v5 decodeObjectOfClasses:v21 forKey:@"sourceURL"];
    sourceURL = v6->_sourceURL;
    v6->_sourceURL = (NSURL *)v22;
  }
  return v6;
}

- (SGSuggestedEventLaunchInfo)initWithBundleId:(id)a3 localizedShowInString:(id)a4 userActivity:(id)a5 intent:(id)a6 sourceURL:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SGSuggestedEventLaunchInfo;
  v18 = [(SGSuggestedEventLaunchInfo *)&v23 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bundleId, a3);
    objc_storeStrong((id *)&v19->_localizedShowInString, a4);
    objc_storeStrong((id *)&v19->_intent, a6);
    objc_storeStrong((id *)&v19->_sourceURL, a7);
    if (v15)
    {
      uint64_t v20 = objc_msgSend(v15, "sg_serialize");
      userActivityString = v19->_userActivityString;
      v19->_userActivityString = (NSString *)v20;
    }
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end