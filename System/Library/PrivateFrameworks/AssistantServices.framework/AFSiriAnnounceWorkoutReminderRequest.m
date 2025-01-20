@interface AFSiriAnnounceWorkoutReminderRequest
+ (void)deactivateRequestForPredictionIdentifier:(id)a3 completion:(id)a4;
- (AFSiriAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3;
- (void)performRequestWithCompletion:(id)a3;
@end

@implementation AFSiriAnnounceWorkoutReminderRequest

- (void).cxx_destruct
{
}

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    workoutReminder = self->_workoutReminder;
    *(_DWORD *)buf = 136315394;
    v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
    __int16 v30 = 2112;
    v31 = workoutReminder;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Creating xpc for workout reminder announcement:%@", buf, 0x16u);
    if (!v4) {
      goto LABEL_20;
    }
  }
  else if (!v4)
  {
    goto LABEL_20;
  }
  v6 = self->_workoutReminder;
  id v25 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v25];
  id v8 = v25;
  if (v8 || !v7)
  {
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_workoutReminder;
      *(_DWORD *)buf = 136315650;
      v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
      __int16 v30 = 2112;
      v31 = v19;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s Failed to serialize workoutReminder %@: %@", buf, 0x20u);
    }
    v4[2](v4, 0);
    id v11 = 0;
  }
  else
  {
    id v9 = v7;
    xpc_object_t v10 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
    keys[0] = "type";
    keys[1] = "workout_reminder_announcement";
    values[0] = xpc_int64_create(12);
    id v11 = v10;
    values[1] = v11;
    xpc_object_t v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v13 = _ExternalRequestConnectionWithContext(0);
    v14 = (void *)v13;
    v15 = AFSiriLogContextConnection;
    if (v12 && v13)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        __int16 v30 = 2112;
        v31 = v20;
        _os_log_debug_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_DEBUG, "%s Sending workout reminder announcement xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __69__AFSiriAnnounceWorkoutReminderRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E592B530;
      v24 = v4;
      v23 = v14;
      xpc_connection_send_message_with_reply(v23, v12, 0, handler);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v21 = self->_workoutReminder;
        *(_DWORD *)buf = 136315394;
        v29 = "-[AFSiriAnnounceWorkoutReminderRequest performRequestWithCompletion:]";
        __int16 v30 = 2112;
        v31 = v21;
        _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Unable to send workout reminder annoucement xpc message for %@", buf, 0x16u);
      }
      v4[2](v4, 0);
      if (v14) {
        xpc_connection_cancel((xpc_connection_t)v14);
      }
    }

    for (uint64_t i = 1; i != -1; --i)
  }

LABEL_20:
}

void __69__AFSiriAnnounceWorkoutReminderRequest_performRequestWithCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict) {
    xpc_dictionary_get_BOOL(xdict, "result");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = *(_xpc_connection_s **)(a1 + 32);
  xpc_connection_cancel(v3);
}

- (AFSiriAnnounceWorkoutReminderRequest)initWithWorkoutReminder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriAnnounceWorkoutReminderRequest;
  v5 = [(AFSiriAnnounceWorkoutReminderRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    workoutReminder = v5->_workoutReminder;
    v5->_workoutReminder = (AFSiriWorkoutReminder *)v6;
  }
  return v5;
}

+ (void)deactivateRequestForPredictionIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if (AFLogInitIfNeeded_once != -1) {
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
  }
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s Creating xpc to deactivate workout reminder announcement with prediction identifier: %@", buf, 0x16u);
    if (!v6) {
      goto LABEL_22;
    }
  }
  else if (!v6)
  {
    goto LABEL_22;
  }
  id v22 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
  id v9 = v22;
  if (v9 || !v8)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s Failed to serialize workout reminder prediction identifier %@: %@", buf, 0x20u);
    }
    v6[2](v6, 0);
    id v12 = 0;
  }
  else
  {
    id v10 = v8;
    xpc_object_t v11 = xpc_data_create((const void *)[v10 bytes], objc_msgSend(v10, "length"));
    keys[0] = "type";
    keys[1] = "workout_reminder_prediction_identifier";
    values[0] = xpc_int64_create(13);
    id v12 = v11;
    values[1] = v12;
    xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v14 = _ExternalRequestConnectionWithContext(0);
    v15 = (void *)v14;
    v16 = AFSiriLogContextConnection;
    if (v13 && v14)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_debug_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_DEBUG, "%s Sending deactivate workout reminder xpc message for prediction identifier:%@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __92__AFSiriAnnounceWorkoutReminderRequest_deactivateRequestForPredictionIdentifier_completion___block_invoke;
      handler[3] = &unk_1E592B530;
      v21 = v6;
      v20 = v15;
      xpc_connection_send_message_with_reply(v20, v13, 0, handler);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[AFSiriAnnounceWorkoutReminderRequest deactivateRequestForPredictionIdentifier:completion:]";
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, "%s Unable to send deactivate request xpc message for workout prediction %@", buf, 0x16u);
      }
      v6[2](v6, 0);
      if (v15) {
        xpc_connection_cancel((xpc_connection_t)v15);
      }
    }

    for (uint64_t i = 1; i != -1; --i)
  }

LABEL_22:
}

void __92__AFSiriAnnounceWorkoutReminderRequest_deactivateRequestForPredictionIdentifier_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (xdict) {
    xpc_dictionary_get_BOOL(xdict, "result");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3 = *(_xpc_connection_s **)(a1 + 32);
  xpc_connection_cancel(v3);
}

@end