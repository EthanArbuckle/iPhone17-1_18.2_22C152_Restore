@interface DADraftMessageRequest
- (BOOL)send;
- (DADraftMessageRequest)initWithRequestType:(int)a3 message:(id)a4 send:(BOOL)a5;
- (DAMailMessage)message;
- (id)description;
- (void)setMessage:(id)a3;
- (void)setSend:(BOOL)a3;
@end

@implementation DADraftMessageRequest

- (DADraftMessageRequest)initWithRequestType:(int)a3 message:(id)a4 send:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DADraftMessageRequest;
  v9 = [(DAMailboxRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(DAMailboxRequest *)v9 setRequestType:v6];
    [(DADraftMessageRequest *)v10 setMessage:v8];
    [(DADraftMessageRequest *)v10 setSend:v5];
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)DADraftMessageRequest;
  v4 = [(DADraftMessageRequest *)&v9 description];
  BOOL v5 = [(DADraftMessageRequest *)self message];
  uint64_t v6 = [v5 subject];
  v7 = [v3 stringWithFormat:@"%@ subject \"%@\"", v4, v6];

  return v7;
}

- (DAMailMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)send
{
  return self->_send;
}

- (void)setSend:(BOOL)a3
{
  self->_send = a3;
}

- (void).cxx_destruct
{
}

@end