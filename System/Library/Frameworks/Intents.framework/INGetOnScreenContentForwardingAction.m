@interface INGetOnScreenContentForwardingAction
+ (BOOL)supportsSecureCoding;
+ (Class)responseClass;
- (INGetOnScreenContentForwardingAction)initWithCoder:(id)a3;
- (INGetOnScreenContentForwardingAction)initWithSceneIdentifier:(id)a3 serviceOptions:(id)a4;
- (NSString)sceneIdentifier;
- (WFOnScreenContentServiceOptions)serviceOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INGetOnScreenContentForwardingAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOptions, 0);

  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

- (WFOnScreenContentServiceOptions)serviceOptions
{
  return self->_serviceOptions;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetOnScreenContentForwardingAction;
  id v4 = a3;
  [(INIntentForwardingAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneIdentifier, @"sceneIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_serviceOptions forKey:@"serviceOptions"];
}

- (INGetOnScreenContentForwardingAction)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v6 = (void *)getWFOnScreenContentServiceOptionsClass_softClass;
  uint64_t v15 = getWFOnScreenContentServiceOptionsClass_softClass;
  if (!getWFOnScreenContentServiceOptionsClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getWFOnScreenContentServiceOptionsClass_block_invoke;
    v11[3] = &unk_1E5520EB8;
    v11[4] = &v12;
    __getWFOnScreenContentServiceOptionsClass_block_invoke((uint64_t)v11);
    v6 = (void *)v13[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"serviceOptions"];
  if (v5)
  {
    self = [(INGetOnScreenContentForwardingAction *)self initWithSceneIdentifier:v5 serviceOptions:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (INGetOnScreenContentForwardingAction)initWithSceneIdentifier:(id)a3 serviceOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(INIntent);
  v12.receiver = self;
  v12.super_class = (Class)INGetOnScreenContentForwardingAction;
  v10 = [(INIntentForwardingAction *)&v12 initWithIntent:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v10->_serviceOptions, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end