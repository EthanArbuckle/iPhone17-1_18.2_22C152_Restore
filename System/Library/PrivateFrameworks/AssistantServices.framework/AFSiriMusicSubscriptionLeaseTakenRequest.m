@interface AFSiriMusicSubscriptionLeaseTakenRequest
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriMusicSubscriptionLeaseTakenRequest

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  *(_OWORD *)keys = xmmword_1E592B550;
  values[0] = xpc_int64_create(3);
  values[1] = xpc_int64_create(1);
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  uint64_t v5 = _ExternalRequestConnectionWithContext(0);
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__AFSiriMusicSubscriptionLeaseTakenRequest_performRequestWithCompletion___block_invoke;
    v8[3] = &unk_1E592B530;
    id v10 = v3;
    v9 = v6;
    xpc_connection_send_message_with_reply(v9, v4, 0, v8);
  }
  else
  {
    if (v3) {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
    if (v6) {
      xpc_connection_cancel((xpc_connection_t)v6);
    }
  }

  for (uint64_t i = 1; i != -1; --i)
}

void __73__AFSiriMusicSubscriptionLeaseTakenRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3) {
    BOOL v4 = xpc_dictionary_get_BOOL(v3, "result");
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v4);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

@end