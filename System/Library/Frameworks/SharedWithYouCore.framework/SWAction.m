@interface SWAction
+ (BOOL)supportsSecureCoding;
+ (SWAction)actionWithDestinationAction:(id)a3;
- (BOOL)hasSentResponse;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAction:(id)a3;
- (BSAction)destinationBSAction;
- (BSAction)sourceBSAction;
- (NSUUID)uuid;
- (SWAction)init;
- (SWAction)initWithCoder:(id)a3;
- (SWAction)initWithDestinationAction:(id)a3;
- (_SWActionResponse)response;
- (_SWActionResponseHandler)responseHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)responseHandlerBlock;
- (void)_processResponse;
- (void)encodeWithBSActionSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fail;
- (void)failWithResponse:(id)a3;
- (void)fulfill;
- (void)fulfillWithResponse:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setHasSentResponse:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setResponseHandlerBlock:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation SWAction

- (SWAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)SWAction;
  v2 = [(SWAction *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    *(_WORD *)&v2->_complete = 0;
  }
  return v2;
}

- (SWAction)initWithDestinationAction:(id)a3
{
  id v5 = a3;
  objc_super v6 = [v5 info];
  v7 = [v6 objectForSetting:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)SWAction;
    v8 = [(SWAction *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_destinationBSAction, a3);
      objc_storeStrong((id *)&v9->_uuid, v7);
      *(_WORD *)&v9->_complete = 0;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (SWAction)actionWithDestinationAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 info];
  id v5 = [v4 objectForSetting:51729];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_super v6 = NSClassFromString(v5),
        [(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
    && [(objc_class *)v6 instancesRespondToSelector:sel_initWithDestinationAction_])
  {
    v7 = (void *)[[v6 alloc] initWithDestinationAction:v3];
  }
  else
  {
    v7 = 0;
  }

  return (SWAction *)v7;
}

- (BSAction)sourceBSAction
{
  sourceBSAction = self->_sourceBSAction;
  if (!sourceBSAction)
  {
    v4 = objc_alloc_init(_SWBSActionSettings);
    [(SWAction *)self encodeWithBSActionSettings:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __26__SWAction_sourceBSAction__block_invoke;
    v11[3] = &unk_1E54D85B0;
    v11[4] = self;
    id v5 = [MEMORY[0x1E4F4F670] responderWithHandler:v11];
    id v6 = objc_alloc(MEMORY[0x1E4F4F668]);
    v7 = [(_SWBSActionSettings *)v4 bsSettings];
    v8 = (BSAction *)[v6 initWithInfo:v7 responder:v5];
    v9 = self->_sourceBSAction;
    self->_sourceBSAction = v8;

    sourceBSAction = self->_sourceBSAction;
  }

  return sourceBSAction;
}

void __26__SWAction_sourceBSAction__block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_SWActionResponse responseWithDestinationResponse:v3];
  if (v4)
  {
    id v5 = v4;
    int v6 = [v4 success];
    v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 fulfillWithResponse:v5];
    }
    else {
      [v7 failWithResponse:v5];
    }
  }
  else
  {
    v8 = [v3 error];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28798];
      uint64_t v14 = *MEMORY[0x1E4F28228];
      v15[0] = @"Did not get a valid BSActionResponse back from remote BSAction";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v10 = [v11 errorWithDomain:v12 code:2 userInfo:v13];
    }
    id v5 = +[_SWActionResponse responseWithSuccess:0 error:v10];
    [*(id *)(a1 + 32) failWithResponse:v5];
  }
}

- (void)encodeWithBSActionSettings:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forSetting:51729];

  id v7 = [(SWAction *)self uuid];
  [v4 setObject:v7 forSetting:1];
}

- (void)fail
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (![(SWAction *)self isComplete])
  {
    [(SWAction *)self setComplete:1];
    id v3 = [(SWAction *)self response];

    if (!v3)
    {
      v11[0] = *MEMORY[0x1E4F28568];
      id v4 = [MEMORY[0x1E4F28B50] mainBundle];
      id v5 = [v4 localizedStringForKey:@"SWAction was explicitly failed" value:&stru_1ED99C438 table:0];
      v12[0] = v5;
      v11[1] = *MEMORY[0x1E4F28588];
      int v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 localizedStringForKey:@"SWAction was explicitly failed" value:&stru_1ED99C438 table:0];
      v12[1] = v7;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SharedWithYouCore._SWActionResponseErrorDomain" code:1 userInfo:v8];
      id v10 = +[_SWActionResponse responseWithSuccess:0 error:v9];
      [(SWAction *)self setResponse:v10];
    }
    [(SWAction *)self _processResponse];
  }
}

- (void)fulfill
{
  if (![(SWAction *)self isComplete])
  {
    [(SWAction *)self setComplete:1];
    id v3 = [(SWAction *)self response];

    if (!v3)
    {
      id v4 = +[_SWActionResponse responseWithSuccess:1 error:0];
      [(SWAction *)self setResponse:v4];
    }
    [(SWAction *)self _processResponse];
  }
}

- (void)fulfillWithResponse:(id)a3
{
  id v4 = a3;
  if (![(SWAction *)self isComplete])
  {
    [(SWAction *)self setResponse:v4];
    [(SWAction *)self fulfill];
  }
}

- (void)failWithResponse:(id)a3
{
  id v4 = a3;
  if (![(SWAction *)self isComplete])
  {
    [(SWAction *)self setResponse:v4];
    [(SWAction *)self fail];
  }
}

- (void)setResponseHandler:(id)a3
{
  id obj = a3;
  id v4 = [(SWAction *)self responseHandler];

  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_responseHandler, obj);
    if ([(SWAction *)self isComplete])
    {
      if (![(SWAction *)self hasSentResponse]) {
        [(SWAction *)self _processResponse];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setResponseHandlerBlock:(id)a3
{
  id v7 = a3;
  id v4 = [(SWAction *)self responseHandlerBlock];

  if (v4 != v7)
  {
    id v5 = (void *)MEMORY[0x18C13CAC0](v7);
    id responseHandlerBlock = self->_responseHandlerBlock;
    self->_id responseHandlerBlock = v5;

    if ([(SWAction *)self isComplete])
    {
      if (![(SWAction *)self hasSentResponse]) {
        [(SWAction *)self _processResponse];
      }
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)_processResponse
{
  if ([(SWAction *)self hasSentResponse]) {
    return;
  }
  id v3 = [(SWAction *)self response];

  if (!v3) {
    return;
  }
  uint64_t v4 = [(SWAction *)self responseHandler];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [(SWAction *)self responseHandler];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(SWAction *)self responseHandler];
      v9 = [(SWAction *)self response];
      [v8 handleResponse:v9 forAction:self];
LABEL_8:

      [(SWAction *)self setHasSentResponse:1];
      return;
    }
  }
  id v10 = [(SWAction *)self responseHandlerBlock];

  if (v10)
  {
    v8 = [(SWAction *)self responseHandlerBlock];
    v9 = [(SWAction *)self response];
    ((void (**)(void, void *))v8)[2](v8, v9);
    goto LABEL_8;
  }
  v11 = [(SWAction *)self destinationBSAction];

  if (v11)
  {
    uint64_t v12 = [(SWAction *)self response];
    id v14 = [v12 sourceBSActionResponse];

    v13 = [(SWAction *)self destinationBSAction];
    [v13 sendResponse:v14];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SWAction;
  id v5 = [(SWAction *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    char v7 = NSStringFromSelector(sel_uuid);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    id v10 = NSStringFromSelector(sel_isComplete);
    v5->_complete = [v4 decodeBoolForKey:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_response);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    response = v5->_response;
    v5->_response = (_SWActionResponse *)v13;

    v15 = NSStringFromSelector(sel_hasSentResponse);
    v5->_hasSentResponse = [v4 decodeBoolForKey:v15];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SWAction *)self uuid];
  uint64_t v6 = NSStringFromSelector(sel_uuid);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(SWAction *)self isComplete];
  uint64_t v8 = NSStringFromSelector(sel_isComplete);
  [v4 encodeBool:v7 forKey:v8];

  v9 = [(SWAction *)self response];
  id v10 = NSStringFromSelector(sel_response);
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(SWAction *)self hasSentResponse];
  NSStringFromSelector(sel_hasSentResponse);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v11 forKey:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    id v5 = [(SWAction *)self uuid];
    [v4 setUuid:v5];

    objc_msgSend(v4, "setComplete:", -[SWAction isComplete](self, "isComplete"));
    uint64_t v6 = [(SWAction *)self response];
    [v4 setResponse:v6];

    objc_msgSend(v4, "setHasSentResponse:", -[SWAction hasSentResponse](self, "hasSentResponse"));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SWAction *)self isEqualToAction:v4];

  return v5;
}

- (BOOL)isEqualToAction:(id)a3
{
  v9 = (SWAction *)a3;
  if (v9 == self)
  {
    LOBYTE(v12) = 1;
    goto LABEL_15;
  }
  id v10 = [(SWAction *)self uuid];
  if (v10 || ([(SWAction *)v9 uuid], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(SWAction *)self uuid];
    BOOL v5 = [(SWAction *)v9 uuid];
    if (![v4 isEqual:v5])
    {
      LOBYTE(v12) = 0;
LABEL_11:

      goto LABEL_12;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  BOOL v13 = [(SWAction *)self isComplete];
  if (v13 == [(SWAction *)v9 isComplete])
  {
    v15 = [(SWAction *)self response];
    if (v15 || ([(SWAction *)v9 response], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v6 = [(SWAction *)self response];
      BOOL v7 = [(SWAction *)v9 response];
      if (![v6 isEqual:v7])
      {
        LOBYTE(v12) = 0;
        goto LABEL_24;
      }
      v20 = v3;
      int v16 = 1;
    }
    else
    {
      v19 = 0;
      v20 = v3;
      int v16 = 0;
    }
    BOOL v17 = [(SWAction *)self hasSentResponse];
    BOOL v12 = v17 ^ [(SWAction *)v9 hasSentResponse] ^ 1;
    if (!v16)
    {
      id v3 = v20;
      if (v15)
      {
LABEL_25:

        if ((v11 & 1) == 0) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
LABEL_28:

      if ((v11 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    id v3 = v20;
LABEL_24:

    if (v15) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  LOBYTE(v12) = 0;
  if (v11) {
    goto LABEL_11;
  }
LABEL_12:
  if (!v10) {

  }
LABEL_15:
  return v12;
}

- (_SWActionResponseHandler)responseHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responseHandler);

  return (_SWActionResponseHandler *)WeakRetained;
}

- (id)responseHandlerBlock
{
  return self->_responseHandlerBlock;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)hasSentResponse
{
  return self->_hasSentResponse;
}

- (void)setHasSentResponse:(BOOL)a3
{
  self->_hasSentResponse = a3;
}

- (_SWActionResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (BSAction)destinationBSAction
{
  return self->_destinationBSAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationBSAction, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_responseHandlerBlock, 0);
  objc_destroyWeak((id *)&self->_responseHandler);

  objc_storeStrong((id *)&self->_sourceBSAction, 0);
}

@end