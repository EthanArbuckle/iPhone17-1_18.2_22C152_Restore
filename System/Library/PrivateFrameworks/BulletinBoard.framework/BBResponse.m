@interface BBResponse
+ (BOOL)supportsSecureCoding;
- (BBResponse)initWithCoder:(id)a3;
- (BOOL)activated;
- (BOOL)didOpenApplication;
- (BSServiceConnectionEndpoint)endpoint;
- (NSArray)lifeAssertions;
- (NSDictionary)context;
- (NSString)actionID;
- (NSString)bulletinID;
- (NSString)buttonID;
- (NSString)originID;
- (NSString)replyText;
- (NSURL)actionLaunchURL;
- (id)sendBlock;
- (int64_t)actionBehavior;
- (int64_t)actionType;
- (unint64_t)actionActivationMode;
- (void)encodeWithCoder:(id)a3;
- (void)send;
- (void)setActionActivationMode:(unint64_t)a3;
- (void)setActionBehavior:(int64_t)a3;
- (void)setActionID:(id)a3;
- (void)setActionLaunchURL:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setActivated:(BOOL)a3;
- (void)setBulletinID:(id)a3;
- (void)setButtonID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDidOpenApplication:(BOOL)a3;
- (void)setEndpoint:(id)a3;
- (void)setLifeAssertions:(id)a3;
- (void)setOriginID:(id)a3;
- (void)setReplyText:(id)a3;
- (void)setSendBlock:(id)a3;
@end

@implementation BBResponse

- (void)send
{
  if (!self->_sent)
  {
    v3 = [(BBResponse *)self sendBlock];
    if (v3)
    {
      id v4 = v3;
      ((void (**)(void, BBResponse *))v3)[2](v3, self);
      v3 = (void (**)(void, void))v4;
      self->_sent = 1;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BBResponse;
  v5 = [(BBResponse *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinID"];
    [(BBResponse *)v5 setBulletinID:v6];

    -[BBResponse setActionActivationMode:](v5, "setActionActivationMode:", [v4 decodeIntegerForKey:@"actionActivationMode"]);
    -[BBResponse setActionBehavior:](v5, "setActionBehavior:", [v4 decodeIntegerForKey:@"actionBehavior"]);
    -[BBResponse setActionType:](v5, "setActionType:", [v4 decodeIntegerForKey:@"actionType"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replyText"];
    [(BBResponse *)v5 setReplyText:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonID"];
    [(BBResponse *)v5 setButtonID:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionID"];
    [(BBResponse *)v5 setActionID:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionLaunchURL"];
    [(BBResponse *)v5 setActionLaunchURL:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originID"];
    [(BBResponse *)v5 setOriginID:v11];

    v12 = BBAllowedClasses();
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"context"];
    [(BBResponse *)v5 setContext:v13];

    -[BBResponse setActivated:](v5, "setActivated:", [v4 decodeBoolForKey:@"activated"]);
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    [(BBResponse *)v5 setEndpoint:v14];

    -[BBResponse setDidOpenApplication:](v5, "setDidOpenApplication:", [v4 decodeBoolForKey:@"didOpenApplication"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(BBResponse *)self bulletinID];
  [v12 encodeObject:v4 forKey:@"bulletinID"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionActivationMode](self, "actionActivationMode"), @"actionActivationMode");
  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionBehavior](self, "actionBehavior"), @"actionBehavior");
  objc_msgSend(v12, "encodeInteger:forKey:", -[BBResponse actionType](self, "actionType"), @"actionType");
  v5 = [(BBResponse *)self replyText];
  [v12 encodeObject:v5 forKey:@"replyText"];

  v6 = [(BBResponse *)self buttonID];
  [v12 encodeObject:v6 forKey:@"buttonID"];

  v7 = [(BBResponse *)self actionID];
  [v12 encodeObject:v7 forKey:@"actionID"];

  v8 = [(BBResponse *)self actionLaunchURL];
  [v12 encodeObject:v8 forKey:@"actionLaunchURL"];

  v9 = [(BBResponse *)self originID];
  [v12 encodeObject:v9 forKey:@"originID"];

  v10 = [(BBResponse *)self context];
  [v12 encodeObject:v10 forKey:@"context"];

  objc_msgSend(v12, "encodeBool:forKey:", -[BBResponse activated](self, "activated"), @"activated");
  v11 = [(BBResponse *)self endpoint];
  [v12 encodeObject:v11 forKey:@"endpoint"];

  objc_msgSend(v12, "encodeBool:forKey:", -[BBResponse didOpenApplication](self, "didOpenApplication"), @"didOpenApplication");
}

- (NSArray)lifeAssertions
{
  return self->_lifeAssertions;
}

- (void)setLifeAssertions:(id)a3
{
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void)setSendBlock:(id)a3
{
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
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

- (NSString)replyText
{
  return self->_replyText;
}

- (void)setReplyText:(id)a3
{
}

- (NSString)buttonID
{
  return self->_buttonID;
}

- (void)setButtonID:(id)a3
{
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

- (NSString)originID
{
  return self->_originID;
}

- (void)setOriginID:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
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

- (BSServiceConnectionEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (BOOL)didOpenApplication
{
  return self->_didOpenApplication;
}

- (void)setDidOpenApplication:(BOOL)a3
{
  self->_didOpenApplication = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_originID, 0);
  objc_storeStrong((id *)&self->_actionLaunchURL, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
  objc_storeStrong((id *)&self->_buttonID, 0);
  objc_storeStrong((id *)&self->_lifeAssertions, 0);
  objc_storeStrong((id *)&self->_replyText, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong(&self->_sendBlock, 0);
  objc_storeStrong((id *)&self->_lifeAssertion, 0);
}

@end