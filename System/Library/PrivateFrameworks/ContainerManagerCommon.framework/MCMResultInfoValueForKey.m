@interface MCMResultInfoValueForKey
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultInfoValueForKey)initWithValue:(id)a3;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation MCMResultInfoValueForKey

- (void).cxx_destruct
{
  p_value = &self->_value;

  objc_storeStrong(p_value, 0);
}

- (void)setValue:(id)a3
{
  p_value = &self->_value;

  objc_storeStrong(p_value, a3);
}

- (id)value
{
  return self->_value;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MCMResultInfoValueForKey;
  BOOL v5 = [(MCMResultBase *)&v10 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];
    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    v7 = [(MCMResultInfoValueForKey *)self value];

    if (v7)
    {
      v6 = [(MCMResultInfoValueForKey *)self value];
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v4, "ReplyInfoValue", v8);

      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (MCMResultInfoValueForKey)initWithValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultInfoValueForKey;
  v6 = [(MCMResultBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_value, a3);
  }

  return v7;
}

@end