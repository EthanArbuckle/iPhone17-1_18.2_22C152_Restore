@interface MCMResultRelay
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultRelay)initWithXPCReplyFromRelay:(id)a3;
- (OS_xpc_object)xpcReplyFromRelay;
@end

@implementation MCMResultRelay

- (void).cxx_destruct
{
  p_xpcReplyFromRelay = &self->_xpcReplyFromRelay;

  objc_storeStrong((id *)p_xpcReplyFromRelay, 0);
}

- (OS_xpc_object)xpcReplyFromRelay
{
  return self->_xpcReplyFromRelay;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultRelay;
  BOOL v5 = [(MCMResultBase *)&v11 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      v7 = [(MCMResultRelay *)self xpcReplyFromRelay];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__MCMResultRelay_encodeResultOntoReply___block_invoke;
      v9[3] = &unk_1E6A80840;
      id v10 = v4;
      xpc_dictionary_apply(v7, v9);
    }
  }

  return v5;
}

uint64_t __40__MCMResultRelay_encodeResultOntoReply___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (MCMResultRelay)initWithXPCReplyFromRelay:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultRelay;
  v6 = [(MCMResultBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcReplyFromRelay, a3);
  }

  return v7;
}

@end