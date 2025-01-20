@interface LNContinueInAppRequestSceneOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsNotices;
- (LNContinueInAppRequestSceneOptions)initWithActions:(id)a3 supportsNotices:(BOOL)a4 targetContentIdentifier:(id)a5;
- (LNContinueInAppRequestSceneOptions)initWithCoder:(id)a3;
- (NSArray)actions;
- (NSString)targetContentIdentifier;
- (id)fbsOpenApplicationOptionsWithActionExecutorOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNContinueInAppRequestSceneOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (BOOL)supportsNotices
{
  return self->_supportsNotices;
}

- (NSArray)actions
{
  return self->_actions;
}

- (LNContinueInAppRequestSceneOptions)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"actions"];

  uint64_t v9 = [v5 decodeBoolForKey:@"supportsNotices"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentIdentifier"];

  if (v8)
  {
    self = [(LNContinueInAppRequestSceneOptions *)self initWithActions:v8 supportsNotices:v9 targetContentIdentifier:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNContinueInAppRequestSceneOptions *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNContinueInAppRequestSceneOptions supportsNotices](self, "supportsNotices"), @"supportsNotices");
  id v6 = [(LNContinueInAppRequestSceneOptions *)self targetContentIdentifier];
  [v4 encodeObject:v6 forKey:@"targetContentIdentifier"];
}

- (id)fbsOpenApplicationOptionsWithActionExecutorOptions:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(LNContinueInAppRequestSceneOptions *)self actions];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F625E0]];

  id v6 = [(LNContinueInAppRequestSceneOptions *)self targetContentIdentifier];
  [v4 setValue:v6 forKey:@"__TargetContentIdentifier"];

  return v4;
}

- (LNContinueInAppRequestSceneOptions)initWithActions:(id)a3 supportsNotices:(BOOL)a4 targetContentIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNContinueInAppRequest.m", 155, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNContinueInAppRequest.m", 156, @"Invalid parameter not satisfying: %@", @"targetContentIdentifier" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNContinueInAppRequestSceneOptions;
  v13 = [(LNContinueInAppRequestSceneOptions *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_actions, a3);
    v14->_supportsNotices = a4;
    objc_storeStrong((id *)&v14->_targetContentIdentifier, a5);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end