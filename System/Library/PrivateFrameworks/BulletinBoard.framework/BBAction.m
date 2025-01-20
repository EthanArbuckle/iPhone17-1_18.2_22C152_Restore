@interface BBAction
+ (BBAction)actionWithActivatePluginName:(id)a3 activationContext:(id)a4;
+ (BBAction)actionWithAppearance:(id)a3;
+ (BBAction)actionWithCallblock:(id)a3;
+ (BBAction)actionWithIdentifier:(id)a3;
+ (BBAction)actionWithIdentifier:(id)a3 title:(id)a4;
+ (BBAction)actionWithLaunchBundleID:(id)a3;
+ (BBAction)actionWithLaunchBundleID:(id)a3 callblock:(id)a4;
+ (BBAction)actionWithLaunchURL:(id)a3;
+ (BBAction)actionWithLaunchURL:(id)a3 callblock:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)action;
- (BBAction)init;
- (BBAction)initWithCoder:(id)a3;
- (BBAction)initWithIdentifier:(id)a3;
- (BBAppearance)appearance;
- (BOOL)deliverResponse:(id)a3;
- (BOOL)hasInteractiveAction;
- (BOOL)hasLaunchAction;
- (BOOL)hasPluginAction;
- (BOOL)hasRemoteViewAction;
- (BOOL)isAuthenticationRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)launchCanBypassPinLock;
- (BOOL)shouldDismissBulletin;
- (NSDictionary)activatePluginContext;
- (NSDictionary)behaviorParameters;
- (NSString)activatePluginName;
- (NSString)identifier;
- (NSString)launchBundleID;
- (NSString)remoteServiceBundleIdentifier;
- (NSString)remoteViewControllerClassName;
- (NSURL)launchURL;
- (id)_nameForActionType:(int64_t)a3;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)internalBlock;
- (id)partialDescription;
- (id)replacementObjectForCoder:(id)a3;
- (id)url;
- (int64_t)actionType;
- (int64_t)behavior;
- (unint64_t)activationMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setActivatePluginContext:(id)a3;
- (void)setActivatePluginName:(id)a3;
- (void)setActivationMode:(unint64_t)a3;
- (void)setAppearance:(id)a3;
- (void)setAuthenticationRequired:(BOOL)a3;
- (void)setBehavior:(int64_t)a3;
- (void)setBehaviorParameters:(id)a3;
- (void)setCallblock:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalBlock:(id)a3;
- (void)setLaunchBundleID:(id)a3;
- (void)setLaunchCanBypassPinLock:(BOOL)a3;
- (void)setLaunchURL:(id)a3;
- (void)setRemoteServiceBundleIdentifier:(id)a3;
- (void)setRemoteViewControllerClassName:(id)a3;
- (void)setShouldDismissBulletin:(BOOL)a3;
@end

@implementation BBAction

+ (id)action
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (BBAction)actionWithAppearance:(id)a3
{
  id v4 = a3;
  v5 = [a1 action];
  [v5 setAppearance:v4];

  return (BBAction *)v5;
}

+ (BBAction)actionWithCallblock:(id)a3
{
  id v4 = a3;
  v5 = [a1 action];
  [v5 setCallblock:v4];

  return (BBAction *)v5;
}

+ (BBAction)actionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return (BBAction *)v5;
}

+ (BBAction)actionWithIdentifier:(id)a3 title:(id)a4
{
  id v6 = a4;
  v7 = [a1 actionWithIdentifier:a3];
  v8 = +[BBAppearance appearanceWithTitle:v6];

  [v7 setAppearance:v8];
  return (BBAction *)v7;
}

+ (BBAction)actionWithLaunchURL:(id)a3
{
  return (BBAction *)[a1 actionWithLaunchURL:a3 callblock:0];
}

+ (BBAction)actionWithLaunchBundleID:(id)a3
{
  return (BBAction *)[a1 actionWithLaunchBundleID:a3 callblock:0];
}

+ (BBAction)actionWithLaunchURL:(id)a3 callblock:(id)a4
{
  id v6 = a3;
  v7 = [a1 actionWithCallblock:a4];
  [v7 setLaunchURL:v6];

  return (BBAction *)v7;
}

+ (BBAction)actionWithLaunchBundleID:(id)a3 callblock:(id)a4
{
  id v6 = a3;
  v7 = [a1 actionWithCallblock:a4];
  [v7 setLaunchBundleID:v6];

  return (BBAction *)v7;
}

+ (BBAction)actionWithActivatePluginName:(id)a3 activationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 action];
  [v8 setActivatePluginName:v7];

  [v8 setActivatePluginContext:v6];
  return (BBAction *)v8;
}

- (BBAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)BBAction;
  result = [(BBAction *)&v3 init];
  if (result) {
    result->_shouldDismissBulletin = 1;
  }
  return result;
}

- (BBAction)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(BBAction *)self init];
  id v6 = v5;
  if (v5) {
    [(BBAction *)v5 setIdentifier:v4];
  }

  return v6;
}

- (void)setCallblock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__BBAction_setCallblock___block_invoke;
    v7[3] = &unk_264296E00;
    id v8 = v4;
    id v6 = (void *)MEMORY[0x21D44A270](v7);
  }
  else
  {
    id v6 = 0;
  }
  [(BBAction *)self setInternalBlock:v6];
}

uint64_t __25__BBAction_setCallblock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasLaunchAction
{
  objc_super v3 = [(BBAction *)self launchBundleID];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(BBAction *)self launchURL];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)hasPluginAction
{
  id v2 = [(BBAction *)self activatePluginName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasRemoteViewAction
{
  BOOL v3 = [(BBAction *)self remoteServiceBundleIdentifier];
  if (v3)
  {
    BOOL v4 = [(BBAction *)self remoteViewControllerClassName];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasInteractiveAction
{
  return [(BBAction *)self hasRemoteViewAction] || [(BBAction *)self behavior] != 0;
}

- (id)url
{
  return self->_launchURL;
}

- (id)bundleID
{
  return self->_launchBundleID;
}

- (BOOL)deliverResponse:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(BBAction *)self internalBlock];
    id v6 = (void *)v5;
    BOOL v7 = v5 != 0;
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
    }
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    NSLog(&cfstr_Handleresponse.isa, v8);
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_nameForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return @"unknown";
  }
  else {
    return off_264296E20[a3 - 1];
  }
}

- (id)partialDescription
{
  BOOL v3 = [(BBAction *)self launchURL];

  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = [(BBAction *)self launchURL];
    BOOL v6 = [(BBAction *)self canBypassPinLock];
    BOOL v7 = @"no";
    if (v6) {
      BOOL v7 = @"yes";
    }
    [v4 stringWithFormat:@"[url] %@; bypassPin: %@", v5, v7];
LABEL_9:
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  uint64_t v8 = [(BBAction *)self launchBundleID];

  if (v8)
  {
    v9 = NSString;
    uint64_t v5 = [(BBAction *)self launchBundleID];
    BOOL v10 = [(BBAction *)self canBypassPinLock];
    v11 = @"no";
    if (v10) {
      v11 = @"yes";
    }
    [v9 stringWithFormat:@"[bundleID] %@; bypassPin: %@", v5, v11];
    goto LABEL_9;
  }
  v12 = &stru_26C7952A0;
LABEL_10:
  v13 = [(BBAction *)self activatePluginName];

  if (v13)
  {
    v14 = NSString;
    v15 = [(BBAction *)self activatePluginName];
    v16 = [(BBAction *)self activatePluginContext];
    uint64_t v17 = [v14 stringWithFormat:@"[plugin] %@ (context: %@)", v15, v16];

    v12 = (__CFString *)v17;
  }
  v18 = [(BBAction *)self remoteViewControllerClassName];

  if (v18)
  {
    v19 = NSString;
    v20 = [(BBAction *)self remoteViewControllerClassName];
    v21 = [(BBAction *)self remoteServiceBundleIdentifier];
    uint64_t v22 = [v19 stringWithFormat:@"[view service] %@; inBundle: %@", v20, v21];

    v12 = (__CFString *)v22;
  }
  v23 = [(BBAction *)self internalBlock];

  if (v23)
  {
    v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", -[BBAction internalBlock](self, "internalBlock"));
    v25 = [v24 description];
    uint64_t v26 = [(__CFString *)v12 stringByAppendingFormat:@"callblock: %@", v25];

    v12 = (__CFString *)v26;
  }
  if ([(BBAction *)self behavior] == 1)
  {
    uint64_t v27 = [(__CFString *)v12 stringByAppendingFormat:@" behavior: textInput"];

    v12 = (__CFString *)v27;
  }
  v28 = NSString;
  v29 = [(BBAction *)self identifier];
  v30 = [(BBAction *)self _nameForActionType:[(BBAction *)self actionType]];
  v31 = [v28 stringWithFormat:@"ID: %@; type: %@; action: %@", v29, v30, v12];

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBAction *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = v4;
        BOOL v6 = [(BBAction *)v5 canBypassPinLock];
        if (v6 != [(BBAction *)self canBypassPinLock]
          || (uint64_t v7 = [(BBAction *)v5 actionType], v7 != [(BBAction *)self actionType]))
        {
          LOBYTE(v10) = 0;
LABEL_48:

          goto LABEL_49;
        }
        uint64_t v8 = [(BBAction *)v5 internalBlock];
        v9 = [(BBAction *)self internalBlock];
        if (v8 != v9)
        {
          LOBYTE(v10) = 0;
LABEL_47:

          goto LABEL_48;
        }
        v11 = [(BBAction *)self identifier];
        v12 = [(BBAction *)v5 identifier];
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_46:

          goto LABEL_47;
        }
        v13 = [(BBAction *)self appearance];
        v14 = [(BBAction *)v5 appearance];
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_45:

          goto LABEL_46;
        }
        uint64_t v15 = [(BBAction *)self launchURL];
        [(BBAction *)v5 launchURL];
        v16 = v47 = (void *)v15;
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_44:

          goto LABEL_45;
        }
        v45 = v16;
        uint64_t v17 = [(BBAction *)self launchBundleID];
        [(BBAction *)v5 launchBundleID];
        v18 = v46 = (void *)v17;
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_43:

          v16 = v45;
          goto LABEL_44;
        }
        v44 = v18;
        uint64_t v19 = [(BBAction *)self activatePluginName];
        [(BBAction *)v5 activatePluginName];
        v20 = v43 = (void *)v19;
        if (!BSEqualObjects())
        {
          LOBYTE(v10) = 0;
LABEL_42:

          v18 = v44;
          goto LABEL_43;
        }
        v41 = v20;
        v42 = [(BBAction *)self activatePluginName];
        if (v42)
        {
          uint64_t v21 = [(BBAction *)self activatePluginContext];
          [(BBAction *)v5 activatePluginContext];
          uint64_t v22 = v39 = (void *)v21;
          if (!BSEqualObjects())
          {
            LOBYTE(v10) = 0;
LABEL_40:

LABEL_41:
            v20 = v41;
            goto LABEL_42;
          }
          v38 = v22;
        }
        uint64_t v23 = [(BBAction *)self remoteViewControllerClassName];
        [(BBAction *)v5 remoteViewControllerClassName];
        v24 = v40 = (void *)v23;
        if (BSEqualObjects())
        {
          v37 = v24;
          uint64_t v25 = [(BBAction *)self remoteServiceBundleIdentifier];
          [(BBAction *)v5 remoteServiceBundleIdentifier];
          uint64_t v26 = v36 = (void *)v25;
          if (BSEqualObjects())
          {
            v35 = v26;
            uint64_t v27 = [(BBAction *)v5 activationMode];
            if (v27 == [(BBAction *)self activationMode]
              && (uint64_t v28 = [(BBAction *)v5 behavior], v28 == [(BBAction *)self behavior]))
            {
              uint64_t v29 = [(BBAction *)self behaviorParameters];
              [(BBAction *)v5 behaviorParameters];
              v30 = v34 = (void *)v29;
              if (BSEqualObjects()
                && (BOOL v32 = [(BBAction *)v5 isAuthenticationRequired],
                    v32 == [(BBAction *)self isAuthenticationRequired]))
              {
                BOOL v33 = [(BBAction *)v5 shouldDismissBulletin];
                int v10 = v33 ^ [(BBAction *)self shouldDismissBulletin] ^ 1;
              }
              else
              {
                LOBYTE(v10) = 0;
              }
            }
            else
            {
              LOBYTE(v10) = 0;
            }
            uint64_t v26 = v35;
          }
          else
          {
            LOBYTE(v10) = 0;
          }
        }
        else
        {

          LOBYTE(v10) = 0;
        }
        uint64_t v22 = v38;
        if (!v42) {
          goto LABEL_41;
        }
        goto LABEL_40;
      }
    }
    LOBYTE(v10) = 0;
  }
LABEL_49:

  return v10;
}

- (unint64_t)hash
{
  BOOL v3 = [(BBAction *)self identifier];
  BOOL v29 = v3 != 0;

  id v4 = [(BBAction *)self appearance];
  BOOL v28 = v4 != 0;

  int64_t v26 = [(BBAction *)self actionType];
  uint64_t v25 = [(BBAction *)self canBypassPinLock];
  v31 = [(BBAction *)self launchURL];
  uint64_t v23 = [v31 hash];
  v30 = [(BBAction *)self launchBundleID];
  uint64_t v21 = [v30 hash];
  uint64_t v27 = [(BBAction *)self activatePluginName];
  uint64_t v20 = [v27 hash];
  v24 = [(BBAction *)self activatePluginContext];
  uint64_t v19 = [v24 hash];
  uint64_t v22 = [(BBAction *)self launchBundleID];
  uint64_t v18 = [v22 hash];
  uint64_t v5 = [(BBAction *)self internalBlock];
  uint64_t v17 = [v5 hash];
  BOOL v6 = [(BBAction *)self remoteViewControllerClassName];
  uint64_t v16 = [v6 hash];
  uint64_t v7 = [(BBAction *)self remoteServiceBundleIdentifier];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = [(BBAction *)self activationMode];
  int64_t v10 = [(BBAction *)self behavior];
  v11 = [(BBAction *)self behaviorParameters];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(BBAction *)self isAuthenticationRequired];
  unint64_t v14 = v26 ^ v25 ^ v23 ^ v21 ^ v28 ^ v29 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ [(BBAction *)self shouldDismissBulletin];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(BBAction *)self appearance];
  [v4 setAppearance:v5];

  BOOL v6 = [(BBAction *)self launchURL];
  [v4 setLaunchURL:v6];

  uint64_t v7 = [(BBAction *)self identifier];
  [v4 setIdentifier:v7];

  objc_msgSend(v4, "setActionType:", -[BBAction actionType](self, "actionType"));
  uint64_t v8 = [(BBAction *)self internalBlock];
  [v4 setInternalBlock:v8];

  unint64_t v9 = [(BBAction *)self launchBundleID];
  [v4 setLaunchBundleID:v9];

  objc_msgSend(v4, "setCanBypassPinLock:", -[BBAction canBypassPinLock](self, "canBypassPinLock"));
  int64_t v10 = [(BBAction *)self activatePluginName];
  [v4 setActivatePluginName:v10];

  v11 = [(BBAction *)self activatePluginContext];
  [v4 setActivatePluginContext:v11];

  uint64_t v12 = [(BBAction *)self remoteViewControllerClassName];
  [v4 setRemoteViewControllerClassName:v12];

  uint64_t v13 = [(BBAction *)self remoteServiceBundleIdentifier];
  [v4 setRemoteServiceBundleIdentifier:v13];

  objc_msgSend(v4, "setActivationMode:", -[BBAction activationMode](self, "activationMode"));
  objc_msgSend(v4, "setBehavior:", -[BBAction behavior](self, "behavior"));
  unint64_t v14 = [(BBAction *)self behaviorParameters];
  [v4 setBehaviorParameters:v14];

  objc_msgSend(v4, "setAuthenticationRequired:", -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired"));
  objc_msgSend(v4, "setShouldDismissBulletin:", -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BBAction;
  uint64_t v5 = [(BBAction *)&v18 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(BBAction *)v5 setIdentifier:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appearance"];
    [(BBAction *)v5 setAppearance:v7];

    -[BBAction setActionType:](v5, "setActionType:", [v4 decodeIntegerForKey:@"actionType"]);
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchURL"];
    [(BBAction *)v5 setLaunchURL:v8];

    unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchBundleID"];
    [(BBAction *)v5 setLaunchBundleID:v9];

    -[BBAction setLaunchCanBypassPinLock:](v5, "setLaunchCanBypassPinLock:", [v4 decodeBoolForKey:@"launchCanBypassPinLock"]);
    int64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activatePluginName"];
    [(BBAction *)v5 setActivatePluginName:v10];

    v11 = BBAllowedClasses();
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"activatePluginContext"];
    [(BBAction *)v5 setActivatePluginContext:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteClassName"];
    [(BBAction *)v5 setRemoteViewControllerClassName:v13];

    unint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteBundleID"];
    [(BBAction *)v5 setRemoteServiceBundleIdentifier:v14];

    -[BBAction setActivationMode:](v5, "setActivationMode:", [v4 decodeIntegerForKey:@"activation"]);
    -[BBAction setBehavior:](v5, "setBehavior:", [v4 decodeIntegerForKey:@"behavior"]);
    uint64_t v15 = BBAllowedClasses();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"behaviorParameters"];
    [(BBAction *)v5 setBehaviorParameters:v16];

    -[BBAction setAuthenticationRequired:](v5, "setAuthenticationRequired:", [v4 decodeBoolForKey:@"secure"]);
    -[BBAction setShouldDismissBulletin:](v5, "setShouldDismissBulletin:", [v4 decodeBoolForKey:@"dismiss"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = [(BBAction *)self identifier];
  [v13 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(BBAction *)self appearance];
  [v13 encodeObject:v5 forKey:@"appearance"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction actionType](self, "actionType"), @"actionType");
  BOOL v6 = [(BBAction *)self launchURL];
  [v13 encodeObject:v6 forKey:@"launchURL"];

  uint64_t v7 = [(BBAction *)self launchBundleID];
  [v13 encodeObject:v7 forKey:@"launchBundleID"];

  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction launchCanBypassPinLock](self, "launchCanBypassPinLock"), @"launchCanBypassPinLock");
  uint64_t v8 = [(BBAction *)self activatePluginName];
  [v13 encodeObject:v8 forKey:@"activatePluginName"];

  unint64_t v9 = [(BBAction *)self activatePluginContext];
  [v13 encodeObject:v9 forKey:@"activatePluginContext"];

  int64_t v10 = [(BBAction *)self remoteViewControllerClassName];
  [v13 encodeObject:v10 forKey:@"remoteClassName"];

  v11 = [(BBAction *)self remoteServiceBundleIdentifier];
  [v13 encodeObject:v11 forKey:@"remoteBundleID"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction activationMode](self, "activationMode"), @"activation");
  objc_msgSend(v13, "encodeInteger:forKey:", -[BBAction behavior](self, "behavior"), @"behavior");
  uint64_t v12 = [(BBAction *)self behaviorParameters];
  [v13 encodeObject:v12 forKey:@"behaviorParameters"];

  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction isAuthenticationRequired](self, "isAuthenticationRequired"), @"secure");
  objc_msgSend(v13, "encodeBool:forKey:", -[BBAction shouldDismissBulletin](self, "shouldDismissBulletin"), @"dismiss");
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  uint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  uint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BBAction *)self partialDescription];
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p; %@>", v4, self, v5];

  return v6;
}

- (id)internalBlock
{
  return self->_internalBlock;
}

- (void)setInternalBlock:(id)a3
{
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSString)launchBundleID
{
  return self->_launchBundleID;
}

- (void)setLaunchBundleID:(id)a3
{
}

- (BOOL)launchCanBypassPinLock
{
  return self->_launchCanBypassPinLock;
}

- (void)setLaunchCanBypassPinLock:(BOOL)a3
{
  self->_launchCanBypassPinLock = a3;
}

- (NSString)activatePluginName
{
  return self->_activatePluginName;
}

- (void)setActivatePluginName:(id)a3
{
}

- (NSDictionary)activatePluginContext
{
  return self->_activatePluginContext;
}

- (void)setActivatePluginContext:(id)a3
{
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BBAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (BOOL)isAuthenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (BOOL)shouldDismissBulletin
{
  return self->_shouldDismissBulletin;
}

- (void)setShouldDismissBulletin:(BOOL)a3
{
  self->_shouldDismissBulletin = a3;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_activationMode = a3;
}

- (NSString)remoteViewControllerClassName
{
  return self->_remoteViewControllerClassName;
}

- (void)setRemoteViewControllerClassName:(id)a3
{
}

- (NSString)remoteServiceBundleIdentifier
{
  return self->_remoteServiceBundleIdentifier;
}

- (void)setRemoteServiceBundleIdentifier:(id)a3
{
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (NSDictionary)behaviorParameters
{
  return self->_behaviorParameters;
}

- (void)setBehaviorParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_remoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activatePluginContext, 0);
  objc_storeStrong((id *)&self->_activatePluginName, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong(&self->_internalBlock, 0);
}

@end