@interface MCMResultOperationDelete
- (BOOL)encodeResultOntoReply:(id)a3;
- (OS_xpc_object)xpcToMerge;
- (void)mergeWithXPCResult:(id)a3;
- (void)setXpcToMerge:(id)a3;
@end

@implementation MCMResultOperationDelete

- (void).cxx_destruct
{
  p_xpcToMerge = &self->_xpcToMerge;

  objc_storeStrong((id *)p_xpcToMerge, 0);
}

- (void)setXpcToMerge:(id)a3
{
  p_xpcToMerge = &self->_xpcToMerge;

  objc_storeStrong((id *)p_xpcToMerge, a3);
}

- (OS_xpc_object)xpcToMerge
{
  return self->_xpcToMerge;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultOperationDelete;
  BOOL v5 = [(MCMResultWithContainersArrayBase *)&v14 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];
    if (!v6)
    {
      v8 = [(MCMResultOperationDelete *)self xpcToMerge];

      if (!v8) {
        goto LABEL_4;
      }
      v9 = [(MCMResultOperationDelete *)self xpcToMerge];
      v6 = xpc_dictionary_get_array(v9, "ReplyContainersArray");

      if (v6 && MEMORY[0x1D94798D0](v6) == MEMORY[0x1E4F14568])
      {
        v10 = xpc_dictionary_get_array(v4, "ReplyContainersArray");
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke;
        v12[3] = &unk_1E6A802E0;
        id v13 = v10;
        id v11 = v10;
        xpc_array_apply(v6, v12);
      }
    }
  }
LABEL_4:

  return v5;
}

uint64_t __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke(uint64_t a1, int a2, xpc_object_t value)
{
  return 1;
}

- (void)mergeWithXPCResult:(id)a3
{
  [(MCMResultOperationDelete *)self setXpcToMerge:a3];
}

@end