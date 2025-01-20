@interface MCMResultFetchPersonaUniqueStrings
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultFetchPersonaUniqueStrings)initWithPersonaUniqueStrings:(id)a3;
- (NSSet)personaUniqueStrings;
- (void)setPersonaUniqueStrings:(id)a3;
@end

@implementation MCMResultFetchPersonaUniqueStrings

- (void).cxx_destruct
{
  p_personaUniqueStrings = &self->_personaUniqueStrings;

  objc_storeStrong((id *)p_personaUniqueStrings, 0);
}

- (void)setPersonaUniqueStrings:(id)a3
{
  p_personaUniqueStrings = &self->_personaUniqueStrings;

  objc_storeStrong((id *)p_personaUniqueStrings, a3);
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultFetchPersonaUniqueStrings;
  BOOL v5 = [(MCMResultBase *)&v11 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      v7 = [(MCMResultFetchPersonaUniqueStrings *)self personaUniqueStrings];
      v8 = [v7 allObjects];
      v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v9) {
        xpc_dictionary_set_value(v4, "ReplyPersonaUniqueStringsArray", v9);
      }
    }
  }

  return v5;
}

- (MCMResultFetchPersonaUniqueStrings)initWithPersonaUniqueStrings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultFetchPersonaUniqueStrings;
  v6 = [(MCMResultBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personaUniqueStrings, a3);
  }

  return v7;
}

@end