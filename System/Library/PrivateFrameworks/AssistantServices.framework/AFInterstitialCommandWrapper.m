@interface AFInterstitialCommandWrapper
- (AFInterstitialCommandWrapper)initWithCommand:(id)a3 defaultReply:(id)a4 completion:(id)a5;
- (SAAceCommand)command;
- (SAAceCommand)defaultReply;
- (void)dealloc;
- (void)dispatchCompletionWithReply:(id)a3 error:(id)a4;
@end

@implementation AFInterstitialCommandWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultReply, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (SAAceCommand)defaultReply
{
  return self->_defaultReply;
}

- (SAAceCommand)command
{
  return self->_command;
}

- (void)dispatchCompletionWithReply:(id)a3 error:(id)a4
{
  completion = (void (**)(id, id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    id v6 = self->_completion;
    self->_completion = 0;
  }
}

- (AFInterstitialCommandWrapper)initWithCommand:(id)a3 defaultReply:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AFInterstitialCommandWrapper;
  v11 = [(AFInterstitialCommandWrapper *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    command = v11->_command;
    v11->_command = (SAAceCommand *)v12;

    uint64_t v14 = [v9 copy];
    defaultReply = v11->_defaultReply;
    v11->_defaultReply = (SAAceCommand *)v14;

    uint64_t v16 = MEMORY[0x19F3A50D0](v10);
    id completion = v11->_completion;
    v11->_id completion = (id)v16;
  }
  return v11;
}

- (void)dealloc
{
  [(AFInterstitialCommandWrapper *)self dispatchCompletionWithReply:self->_defaultReply error:0];
  v3.receiver = self;
  v3.super_class = (Class)AFInterstitialCommandWrapper;
  [(AFInterstitialCommandWrapper *)&v3 dealloc];
}

@end