@interface BBActionResponse
+ (BOOL)supportsSecureCoding;
+ (id)actionResponseForResponse:(id)a3 bulletinRequest:(id)a4;
- (BBActionResponse)initWithCoder:(id)a3;
- (BOOL)didOpenApplication;
- (BSServiceConnectionEndpoint)endpoint;
- (NSDictionary)bulletinContext;
- (NSDictionary)context;
- (NSString)actionID;
- (NSString)bulletinButtonID;
- (NSString)bulletinPublisherID;
- (NSString)bulletinRecordID;
- (NSString)originID;
- (NSURL)actionLaunchURL;
- (id)description;
- (int64_t)actionBehavior;
- (int64_t)actionType;
- (unint64_t)actionActivationMode;
- (void)encodeWithCoder:(id)a3;
- (void)setActionActivationMode:(unint64_t)a3;
- (void)setActionBehavior:(int64_t)a3;
- (void)setActionID:(id)a3;
- (void)setActionLaunchURL:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setBulletinButtonID:(id)a3;
- (void)setBulletinContext:(id)a3;
- (void)setBulletinPublisherID:(id)a3;
- (void)setBulletinRecordID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDidOpenApplication:(BOOL)a3;
- (void)setEndpoint:(id)a3;
- (void)setOriginID:(id)a3;
@end

@implementation BBActionResponse

+ (id)actionResponseForResponse:(id)a3 bulletinRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  v9 = [v7 actionID];
  [v8 setActionID:v9];

  v10 = [v7 actionLaunchURL];
  [v8 setActionLaunchURL:v10];

  objc_msgSend(v8, "setActionType:", objc_msgSend(v7, "actionType"));
  objc_msgSend(v8, "setActionActivationMode:", objc_msgSend(v7, "actionActivationMode"));
  objc_msgSend(v8, "setActionBehavior:", objc_msgSend(v7, "actionBehavior"));
  objc_msgSend(v8, "setDidOpenApplication:", objc_msgSend(v7, "didOpenApplication"));
  v11 = [v6 context];
  [v8 setBulletinContext:v11];

  v12 = [v7 buttonID];
  [v8 setBulletinButtonID:v12];

  v13 = [v6 recordID];
  [v8 setBulletinRecordID:v13];

  v14 = [v6 publisherBulletinID];

  [v8 setBulletinPublisherID:v14];
  v15 = [v7 context];
  [v8 setContext:v15];

  v16 = [v7 originID];
  [v8 setOriginID:v16];

  v17 = [v7 endpoint];

  [v8 setEndpoint:v17];
  return v8;
}

- (id)description
{
  v17 = NSString;
  uint64_t v16 = objc_opt_class();
  int64_t v15 = [(BBActionResponse *)self actionType];
  unint64_t v14 = [(BBActionResponse *)self actionActivationMode];
  int64_t v3 = [(BBActionResponse *)self actionBehavior];
  v4 = [(BBActionResponse *)self actionID];
  v5 = [(BBActionResponse *)self actionLaunchURL];
  uint64_t v6 = [(BBActionResponse *)self didOpenApplication];
  id v7 = [(BBActionResponse *)self bulletinButtonID];
  id v8 = [(BBActionResponse *)self originID];
  v9 = [(BBActionResponse *)self endpoint];
  v10 = [(BBActionResponse *)self bulletinRecordID];
  v11 = [(BBActionResponse *)self bulletinPublisherID];
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; type = %ld; activationMode = %ld behavior = %ld actionID = %@; actionLaunchURL = %@; activated: %ld buttonID = %@; originID = %@; endpoint = %@; recordID = %@; publisherID = %@>",
    v16,
    self,
    v15,
    v14,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  v12 = v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BBActionResponse;
  v5 = [(BBActionResponse *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionID"];
    [(BBActionResponse *)v5 setActionID:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionLaunchURL"];
    [(BBActionResponse *)v5 setActionLaunchURL:v7];

    -[BBActionResponse setActionType:](v5, "setActionType:", [v4 decodeIntegerForKey:@"actionType"]);
    -[BBActionResponse setActionActivationMode:](v5, "setActionActivationMode:", [v4 decodeIntegerForKey:@"actionActiviationMode"]);
    -[BBActionResponse setActionBehavior:](v5, "setActionBehavior:", [v4 decodeIntegerForKey:@"actionBehavior"]);
    -[BBActionResponse setDidOpenApplication:](v5, "setDidOpenApplication:", [v4 decodeBoolForKey:@"didOpenApplication"]);
    id v8 = BBAllowedClasses();
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bulletinContext"];
    [(BBActionResponse *)v5 setBulletinContext:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinButtonID"];
    [(BBActionResponse *)v5 setBulletinButtonID:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinRecordID"];
    [(BBActionResponse *)v5 setBulletinRecordID:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinPublisherID"];
    [(BBActionResponse *)v5 setBulletinPublisherID:v12];

    v13 = BBAllowedClasses();
    unint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"context"];
    [(BBActionResponse *)v5 setContext:v14];

    int64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originID"];
    [(BBActionResponse *)v5 setOriginID:v15];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    [(BBActionResponse *)v5 setEndpoint:v16];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BBActionResponse *)self actionID];
  [v4 encodeObject:v5 forKey:@"actionID"];

  uint64_t v6 = [(BBActionResponse *)self actionLaunchURL];
  [v4 encodeObject:v6 forKey:@"actionLaunchURL"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionType](self, "actionType"), @"actionType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionActivationMode](self, "actionActivationMode"), @"actionActiviationMode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBActionResponse actionBehavior](self, "actionBehavior"), @"actionBehavior");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBActionResponse didOpenApplication](self, "didOpenApplication"), @"didOpenApplication");
  id v7 = [(BBActionResponse *)self bulletinContext];
  [v4 encodeObject:v7 forKey:@"bulletinContext"];

  id v8 = [(BBActionResponse *)self bulletinButtonID];
  [v4 encodeObject:v8 forKey:@"bulletinButtonID"];

  v9 = [(BBActionResponse *)self bulletinRecordID];
  [v4 encodeObject:v9 forKey:@"bulletinRecordID"];

  v10 = [(BBActionResponse *)self bulletinPublisherID];
  [v4 encodeObject:v10 forKey:@"bulletinPublisherID"];

  v11 = [(BBActionResponse *)self context];
  [v4 encodeObject:v11 forKey:@"context"];

  v12 = [(BBActionResponse *)self originID];
  [v4 encodeObject:v12 forKey:@"originID"];

  id v13 = [(BBActionResponse *)self endpoint];
  [v4 encodeObject:v13 forKey:@"endpoint"];
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (unint64_t)actionActivationMode
{
  return self->_actionActivationMode;
}

- (void)setActionActivationMode:(unint64_t)a3
{
  self->_actionActivationMode = a3;
}

- (int64_t)actionBehavior
{
  return self->_actionBehavior;
}

- (void)setActionBehavior:(int64_t)a3
{
  self->_actionBehavior = a3;
}

- (BOOL)didOpenApplication
{
  return self->_didOpenApplication;
}

- (void)setDidOpenApplication:(BOOL)a3
{
  self->_didOpenApplication = a3;
}

- (NSString)actionID
{
  return self->_actionID;
}

- (void)setActionID:(id)a3
{
}

- (NSURL)actionLaunchURL
{
  return self->_actionLaunchURL;
}

- (void)setActionLaunchURL:(id)a3
{
}

- (NSString)bulletinRecordID
{
  return self->_bulletinRecordID;
}

- (void)setBulletinRecordID:(id)a3
{
}

- (NSString)bulletinPublisherID
{
  return self->_bulletinPublisherID;
}

- (void)setBulletinPublisherID:(id)a3
{
}

- (NSDictionary)bulletinContext
{
  return self->_bulletinContext;
}

- (void)setBulletinContext:(id)a3
{
}

- (NSString)bulletinButtonID
{
  return self->_bulletinButtonID;
}

- (void)setBulletinButtonID:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)originID
{
  return self->_originID;
}

- (void)setOriginID:(id)a3
{
}

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_originID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bulletinButtonID, 0);
  objc_storeStrong((id *)&self->_bulletinContext, 0);
  objc_storeStrong((id *)&self->_bulletinPublisherID, 0);
  objc_storeStrong((id *)&self->_bulletinRecordID, 0);
  objc_storeStrong((id *)&self->_actionLaunchURL, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
}

@end