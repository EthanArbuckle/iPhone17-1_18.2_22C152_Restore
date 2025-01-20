@interface LNContinueInAppRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isThrowing;
- (BOOL)requestConfirmation;
- (LNContinueInAppRequest)initWithCoder:(id)a3;
- (LNContinueInAppRequest)initWithIdentifier:(id)a3 dialog:(id)a4 throwing:(BOOL)a5 requestConfirmation:(BOOL)a6 type:(int64_t)a7 sceneOptions:(id)a8 bundleIdentifier:(id)a9 options:(unint64_t)a10;
- (LNContinueInAppRequestSceneOptions)sceneOptions;
- (LNDialog)dialog;
- (NSString)bundleIdentifier;
- (NSUUID)identifier;
- (id)completionHandler;
- (id)description;
- (int64_t)type;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)respondWithError:(id)a3;
- (void)respondWithSuccess;
- (void)setCompletionHandler:(id)a3;
@end

@implementation LNContinueInAppRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
}

- (LNContinueInAppRequestSceneOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)requestConfirmation
{
  return self->_requestConfirmation;
}

- (BOOL)isThrowing
{
  return self->_throwing;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (LNContinueInAppRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dialog"];
  uint64_t v7 = [v4 decodeBoolForKey:@"throwing"];
  uint64_t v8 = [v4 decodeBoolForKey:@"requestConfirmation"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"type"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneOptions"];
  v11 = 0;
  if (v5 && v6)
  {
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    self = -[LNContinueInAppRequest initWithIdentifier:dialog:throwing:requestConfirmation:type:sceneOptions:bundleIdentifier:options:](self, "initWithIdentifier:dialog:throwing:requestConfirmation:type:sceneOptions:bundleIdentifier:options:", v5, v6, v7, v8, v9, v10, v12, [v4 decodeIntegerForKey:@"options"]);

    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(LNContinueInAppRequest *)self identifier];
  [v8 encodeObject:v4 forKey:@"identifier"];

  v5 = [(LNContinueInAppRequest *)self dialog];
  [v8 encodeObject:v5 forKey:@"dialog"];

  objc_msgSend(v8, "encodeBool:forKey:", -[LNContinueInAppRequest isThrowing](self, "isThrowing"), @"throwing");
  objc_msgSend(v8, "encodeBool:forKey:", -[LNContinueInAppRequest requestConfirmation](self, "requestConfirmation"), @"requestConfirmation");
  objc_msgSend(v8, "encodeInteger:forKey:", -[LNContinueInAppRequest type](self, "type"), @"type");
  v6 = [(LNContinueInAppRequest *)self sceneOptions];
  [v8 encodeObject:v6 forKey:@"sceneOptions"];

  uint64_t v7 = [(LNContinueInAppRequest *)self bundleIdentifier];
  [v8 encodeObject:v7 forKey:@"bundleIdentifier"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[LNContinueInAppRequest options](self, "options"), @"options");
}

- (id)description
{
  v17 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v3);
  id v4 = [(LNContinueInAppRequest *)self identifier];
  v5 = [(LNContinueInAppRequest *)self dialog];
  if ([(LNContinueInAppRequest *)self isThrowing]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(LNContinueInAppRequest *)self requestConfirmation]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  int64_t v8 = [(LNContinueInAppRequest *)self type];
  uint64_t v9 = @"UserInitiated";
  if (v8 == 1) {
    uint64_t v9 = @"ForegroundLaunch";
  }
  if (v8 == 2) {
    uint64_t v9 = @"ForegroundLaunchWithRunningUI";
  }
  v10 = v9;
  v11 = [(LNContinueInAppRequest *)self sceneOptions];
  v12 = [(LNContinueInAppRequest *)self bundleIdentifier];
  if ([(LNContinueInAppRequest *)self options]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v14 = [v17 stringWithFormat:@"<%@: %p, identifier: %@, dialog: %@, isThrowing: %@, requestConfirmation: %@, type: %@, sceneOptions: %@, bundleIdentifier: %@, dismissSiri: %@>", v16, self, v4, v5, v6, v7, v10, v11, v12, v13];

  return v14;
}

- (void)respondWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    id v5 = self->_completionHandler;
    self->_completionHandler = 0;
  }
  else
  {
    v6 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      int64_t v8 = [(LNContinueInAppRequest *)self identifier];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
    }
  }
}

- (void)respondWithSuccess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_completionHandler)
  {
    v3 = [LNContinueInAppResponse alloc];
    id v4 = [(LNContinueInAppRequest *)self identifier];
    int v9 = [(LNContinueInAppResponse *)v3 initWithIdentifier:v4];

    (*((void (**)(void))self->_completionHandler + 2))();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
  else
  {
    v6 = getLNLogCategoryExecution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      int64_t v8 = [(LNContinueInAppRequest *)self identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
    }
  }
}

- (LNContinueInAppRequest)initWithIdentifier:(id)a3 dialog:(id)a4 throwing:(BOOL)a5 requestConfirmation:(BOOL)a6 type:(int64_t)a7 sceneOptions:(id)a8 bundleIdentifier:(id)a9 options:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  if (!v17)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"LNContinueInAppRequest.m", 47, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)LNContinueInAppRequest;
  v21 = [(LNContinueInAppRequest *)&v32 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    uint64_t v23 = [v18 copy];
    dialog = v22->_dialog;
    v22->_dialog = (LNDialog *)v23;

    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = 0;

    v22->_throwing = a5;
    v22->_requestConfirmation = a6;
    v22->_type = a7;
    objc_storeStrong((id *)&v22->_sceneOptions, a8);
    uint64_t v26 = [v20 copy];
    bundleIdentifier = v22->_bundleIdentifier;
    v22->_bundleIdentifier = (NSString *)v26;

    v22->_options = a10;
    v28 = v22;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end