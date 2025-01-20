@interface ATXSecureCodedTuple
+ (BOOL)supportsSecureCoding;
+ (id)allowedClassNames;
- (ATXSecureCodedTuple)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXSecureCodedTuple

+ (id)allowedClassNames
{
  v2 = (void *)MEMORY[0x1D25F3B80](a1, a2);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"INSendMessageIntent", @"ATXProactiveSuggestionUIFeedbackSession", @"ATXUIFeedbackSessionContext", @"ATXPartialIntentHandlingContext", @"ATXUnifiedInferredActivityTransition", @"ATXUserNotificationLoggingEvent", 0);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(_PASTuple2 *)self first];
  [v14 encodeObject:v4 forKey:@"first"];

  v5 = [(_PASTuple2 *)self first];

  if (v5)
  {
    v6 = [(_PASTuple2 *)self first];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);

    [v14 encodeObject:v8 forKey:@"firstCls"];
  }
  v9 = [(_PASTuple2 *)self second];
  [v14 encodeObject:v9 forKey:@"second"];

  v10 = [(_PASTuple2 *)self second];

  if (v10)
  {
    v11 = [(_PASTuple2 *)self second];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);

    [v14 encodeObject:v13 forKey:@"secondCls"];
  }
}

- (ATXSecureCodedTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_default();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"firstCls" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXSecureCodedTuple" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (!v9)
  {
    if (v8
      && ([(id)objc_opt_class() allowedClassNames],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 containsObject:v8],
          v11,
          v12))
    {
      v13 = NSClassFromString(v8);
      if (v13)
      {
        id v14 = (void *)MEMORY[0x1E4F93B90];
        v15 = __atxlog_handle_default();
        v13 = [v14 robustDecodeObjectOfClass:v13 forKey:@"first" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXSecureCodedTuple" errorCode:-1 logHandle:v15];

        if (!v13
          || ([v4 error], v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
        {
          v10 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    else
    {
      v13 = 0;
    }
    v17 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v18 = objc_opt_class();
    v19 = __atxlog_handle_default();
    v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"secondCls" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXSecureCodedTuple" errorCode:-1 logHandle:v19];

    v21 = [v4 error];

    if (v21)
    {
      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    if (v20
      && ([(id)objc_opt_class() allowedClassNames],
          v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 containsObject:v20],
          v22,
          v23)
      && (Class v24 = NSClassFromString((NSString *)v20)) != 0)
    {
      Class v25 = v24;
      v26 = (void *)MEMORY[0x1E4F93B90];
      v27 = __atxlog_handle_default();
      v28 = [v26 robustDecodeObjectOfClass:v25 forKey:@"second" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXSecureCodedTuple" errorCode:-1 logHandle:v27];

      if (!v28
        || ([v4 error], v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
      {
        v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v28 = 0;
    }
    self = [(_PASTuple2 *)self initWithFirst:v13 second:v28];
    v10 = self;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_23:

  return v10;
}

@end