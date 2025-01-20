@interface AMSUIWebBusinessChatAction
- (AMSUIWebBusinessChatAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)body;
- (NSString)businessGroupID;
- (NSString)businessID;
- (NSString)intentID;
- (id)makeBusinessChatDeeplink;
- (id)runAction;
- (void)setBody:(id)a3;
- (void)setBusinessGroupID:(id)a3;
- (void)setBusinessID:(id)a3;
- (void)setIntentID:(id)a3;
@end

@implementation AMSUIWebBusinessChatAction

- (AMSUIWebBusinessChatAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AMSUIWebBusinessChatAction;
  v7 = [(AMSUIWebAction *)&v21 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    body = v7->_body;
    v7->_body = v9;

    v11 = [v6 objectForKeyedSubscript:@"businessID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    businessID = v7->_businessID;
    v7->_businessID = v12;

    v14 = [v6 objectForKeyedSubscript:@"businessGroupID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    businessGroupID = v7->_businessGroupID;
    v7->_businessGroupID = v15;

    v17 = [v6 objectForKeyedSubscript:@"intentID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    intentID = v7->_intentID;
    v7->_intentID = v18;
  }
  return v7;
}

- (id)runAction
{
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebBusinessChatAction;
  id v3 = [(AMSUIWebAction *)&v13 runAction];
  v4 = [(AMSUIWebBusinessChatAction *)self businessID];

  if (!v4)
  {
    v9 = (void *)MEMORY[0x263F27E10];
    v5 = AMSError();
    uint64_t v8 = [v9 promiseWithError:v5];
    goto LABEL_6;
  }
  v5 = [(AMSUIWebBusinessChatAction *)self makeBusinessChatDeeplink];
  if (v5)
  {
    int v6 = [MEMORY[0x263F27DC8] openStandardURL:v5];
    v7 = (void *)MEMORY[0x263F27E10];
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x263F27E10] promiseWithResult:&unk_26CC73970];
LABEL_6:
      v10 = (void *)v8;
      goto LABEL_9;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x263F27E10];
  }
  v11 = AMSError();
  v10 = [v7 promiseWithError:v11];

LABEL_9:
  return v10;
}

- (id)makeBusinessChatDeeplink
{
  id v3 = [MEMORY[0x263F08BA0] componentsWithString:@"https://bcrw.apple.com/sms:open?service=iMessage"];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [(AMSUIWebBusinessChatAction *)self businessID];

  if (v5)
  {
    int v6 = NSString;
    v7 = [(AMSUIWebBusinessChatAction *)self businessID];
    uint64_t v8 = [v6 stringWithFormat:@"urn:biz:%@", v7];

    v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"recipient" value:v8];
    [v4 addObject:v9];
  }
  v10 = [(AMSUIWebBusinessChatAction *)self businessGroupID];

  if (v10)
  {
    v11 = (void *)MEMORY[0x263F08BD0];
    v12 = [(AMSUIWebBusinessChatAction *)self businessGroupID];
    objc_super v13 = [v11 queryItemWithName:@"bizgroup-id" value:v12];
    [v4 addObject:v13];
  }
  v14 = [(AMSUIWebBusinessChatAction *)self intentID];

  if (v14)
  {
    v15 = (void *)MEMORY[0x263F08BD0];
    v16 = [(AMSUIWebBusinessChatAction *)self intentID];
    v17 = [v15 queryItemWithName:@"biz-intent-id" value:v16];
    [v4 addObject:v17];
  }
  v18 = [(AMSUIWebBusinessChatAction *)self body];

  if (v18)
  {
    v19 = (void *)MEMORY[0x263F08BD0];
    v20 = [(AMSUIWebBusinessChatAction *)self body];
    objc_super v21 = [v19 queryItemWithName:@"body" value:v20];
    [v4 addObject:v21];
  }
  [v3 setQueryItems:v4];
  v22 = [v3 URL];

  return v22;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(id)a3
{
}

- (NSString)businessGroupID
{
  return self->_businessGroupID;
}

- (void)setBusinessGroupID:(id)a3
{
}

- (NSString)intentID
{
  return self->_intentID;
}

- (void)setIntentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentID, 0);
  objc_storeStrong((id *)&self->_businessGroupID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end