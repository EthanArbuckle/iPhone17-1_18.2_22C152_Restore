@interface DRSDecisionServerRequestReply
- (BOOL)requestAccepted;
- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 reply:(id)a4;
- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 requestAccepted:(BOOL)a4 rejectionReason:(id)a5;
- (NSString)rejectionReason;
- (id)request;
@end

@implementation DRSDecisionServerRequestReply

- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    if ([v6 hasAccepted]) {
      uint64_t v8 = [v6 accepted];
    }
    else {
      uint64_t v8 = 0;
    }
    v10 = [v6 rejectionReason];
    v11 = [(DRSDecisionServerRequestReply *)self initWithOriginalRequest:v7 requestAccepted:v8 rejectionReason:v10];

    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (DRSDecisionServerRequestReply)initWithOriginalRequest:(id)a3 requestAccepted:(BOOL)a4 rejectionReason:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)DRSDecisionServerRequestReply;
    v11 = [(DRSDecisionServerRequestReply *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong(&v11->_request, a3);
      v12->_requestAccepted = a4;
      objc_storeStrong((id *)&v12->_rejectionReason, a5);
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)request
{
  return self->_request;
}

- (BOOL)requestAccepted
{
  return self->_requestAccepted;
}

- (NSString)rejectionReason
{
  return self->_rejectionReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectionReason, 0);

  objc_storeStrong(&self->_request, 0);
}

@end