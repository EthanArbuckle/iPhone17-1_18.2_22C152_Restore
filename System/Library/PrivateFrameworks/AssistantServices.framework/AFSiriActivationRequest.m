@interface AFSiriActivationRequest
- (AFSiriActivationRequest)initWithContext:(id)a3;
- (void)performRequestWithCompletion:(id)a3;
- (void)performRequestWithResultHandler:(id)a3;
@end

@implementation AFSiriActivationRequest

- (void).cxx_destruct
{
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AFSiriActivationRequest_performRequestWithCompletion___block_invoke;
  v6[3] = &unk_1E592B5F8;
  id v7 = v4;
  id v5 = v4;
  [(AFSiriActivationRequest *)self performRequestWithResultHandler:v6];
}

void __56__AFSiriActivationRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, BOOL))(v2 + 16))(v2, v3 == 0);
  }
}

- (void)performRequestWithResultHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(_OWORD *)keys = xmmword_1E592B5C0;
  values[0] = xpc_int64_create(6);
  AFSiriActivationCreateXPCDictionaryFromContext(self->_context);
  values[1] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  uint64_t v6 = _ExternalRequestConnectionWithContext(0);
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke;
    v10[3] = &unk_1E592B530;
    id v12 = v4;
    v11 = v7;
    xpc_connection_send_message_with_reply(v11, v5, 0, v10);
  }
  else
  {
    if (v4)
    {
      id v8 = +[AFSiriActivationResult newWithBuilder:&__block_literal_global_88];
      (*((void (**)(id, id))v4 + 2))(v4, v8);
    }
    if (v7) {
      xpc_connection_cancel((xpc_connection_t)v7);
    }
  }

  for (uint64_t i = 1; i != -1; --i)
}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = xpc_dictionary_get_dictionary(xdict, "activation_result");
  id v4 = (void *)v3;
  if (v3)
  {
    if (MEMORY[0x19F3A5530](v3) == MEMORY[0x1E4F14590])
    {
      uint64_t v3 = AFSiriActivationCreateResultFromXPCDictionary(v4);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  id v7 = (id)v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    if (v3)
    {
      (*(void (**)(void))(v5 + 16))(*(void *)(a1 + 40));
    }
    else
    {
      id v6 = +[AFSiriActivationResult newWithBuilder:&__block_literal_global_85_43087];
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    }
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AFError errorWithCode:2504];
  [v2 setError:v3];
}

void __59__AFSiriActivationRequest_performRequestWithResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[AFError errorWithCode:2505];
  [v2 setError:v3];
}

- (AFSiriActivationRequest)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriActivationRequest;
  uint64_t v5 = [(AFSiriActivationRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (AFSiriActivationContext *)v6;
  }
  return v5;
}

@end