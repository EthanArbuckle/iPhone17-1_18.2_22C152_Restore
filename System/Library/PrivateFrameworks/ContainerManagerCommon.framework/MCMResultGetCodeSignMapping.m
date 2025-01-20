@interface MCMResultGetCodeSignMapping
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultGetCodeSignMapping)initWithInfo:(id)a3;
- (NSDictionary)info;
@end

@implementation MCMResultGetCodeSignMapping

- (void).cxx_destruct
{
  p_info = &self->_info;

  objc_storeStrong((id *)p_info, 0);
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMResultGetCodeSignMapping;
  BOOL v5 = [(MCMResultBase *)&v10 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      v7 = [(MCMResultGetCodeSignMapping *)self info];
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v8) {
        xpc_dictionary_set_value(v4, "ReplyInfoDictionary", v8);
      }
    }
  }

  return v5;
}

- (MCMResultGetCodeSignMapping)initWithInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultGetCodeSignMapping;
  v6 = [(MCMResultBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v7;
}

@end