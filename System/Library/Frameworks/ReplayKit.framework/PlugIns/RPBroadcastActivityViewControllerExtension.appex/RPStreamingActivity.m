@interface RPStreamingActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (RPStreamingActivity)initWithApplicationExtension:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)applicationExtension;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation RPStreamingActivity

- (RPStreamingActivity)initWithApplicationExtension:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPStreamingActivity;
  v6 = [(RPStreamingActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationExtension, a3);
  }

  return v7;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)activityType
{
  return [(NSExtension *)self->_applicationExtension identifier];
}

- (id)activityTitle
{
  v2 = [(NSExtension *)self->_applicationExtension infoDictionary];
  v3 = [v2 objectForKey:_kCFBundleDisplayNameKey];

  return v3;
}

- (id)activityImage
{
  v2 = [(NSExtension *)self->_applicationExtension icons];
  v3 = [v2 firstObject];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RPStreamingActivity;
  [(RPStreamingActivity *)&v3 prepareWithActivityItems:a3];
}

- (id)applicationExtension
{
  return self->_applicationExtension;
}

- (void).cxx_destruct
{
}

@end