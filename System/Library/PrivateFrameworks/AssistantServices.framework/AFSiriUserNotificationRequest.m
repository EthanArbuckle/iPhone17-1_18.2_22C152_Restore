@interface AFSiriUserNotificationRequest
+ (BOOL)canBeHandled;
+ (BOOL)supportedForApplicationWithBundleId:(id)a3;
+ (BOOL)supportedOnPlatform;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6;
- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7;
- (void)deactivateRequestForReason:(int64_t)a3 completion:(id)a4;
- (void)deliverSummary:(id)a3 completion:(id)a4;
- (void)performRequestWithCompletion:(id)a3;
- (void)withdrawalRequestWithCompletion:(id)a3;
@end

@implementation AFSiriUserNotificationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

- (void)deliverSummary:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v33 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v33];
  id v9 = v33;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10)
  {
    notification = self->_notification;
    id v32 = 0;
    v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:notification requiringSecureCoding:1 error:&v32];
    id v15 = v32;
    v16 = v15;
    if (v15 || !v14)
    {
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v28;
        *(_WORD *)&keys[22] = 2112;
        id v40 = v16;
        _os_log_error_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
      }
      v7[2](v7, 0);
      id v21 = 0;
      id v12 = 0;
      goto LABEL_27;
    }
    id v17 = v14;
    xpc_object_t v18 = xpc_data_create((const void *)[v17 bytes], objc_msgSend(v17, "length"));
    id v19 = v8;
    xpc_object_t v20 = xpc_data_create((const void *)[v19 bytes], objc_msgSend(v19, "length"));
    *(void *)keys = "type";
    *(void *)&keys[8] = "summary";
    *(void *)&keys[16] = "notification";
    values[0] = xpc_int64_create(16);
    id v12 = v20;
    values[1] = v12;
    id v21 = v18;
    values[2] = v21;
    xpc_object_t v22 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    uint64_t v23 = _ExternalRequestConnectionWithContext(0);
    v24 = (void *)v23;
    v25 = AFSiriLogContextConnection;
    if (v22 && v23)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_debug_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __59__AFSiriUserNotificationRequest_deliverSummary_completion___block_invoke;
      handler[3] = &unk_1E592B530;
      v31 = v7;
      v30 = v24;
      xpc_connection_send_message_with_reply(v30, v22, 0, handler);

LABEL_24:
      for (uint64_t i = 2; i != -1; --i)

      v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v7)
      {
LABEL_22:
        if (v24) {
          xpc_connection_cancel((xpc_connection_t)v24);
        }
        goto LABEL_24;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    v7[2](v7, 0);
    goto LABEL_22;
  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)keys = 136315650;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deliverSummary:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v6;
    *(_WORD *)&keys[22] = 2112;
    id v40 = v9;
    _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize summary %@: %@", keys, 0x20u);
  }
  v7[2](v7, 0);
  id v12 = 0;
LABEL_28:
}

void __59__AFSiriUserNotificationRequest_deliverSummary_completion___block_invoke(uint64_t a1, void *a2)
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

- (void)withdrawalRequestWithCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)buf = 136315394;
    v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    __int16 v31 = 2112;
    id v32 = notification;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }
  id v6 = self->_notification;
  id v26 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v26];
  id v8 = v26;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    id v11 = v7;
    xpc_object_t v12 = xpc_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"));
    keys[0] = "type";
    keys[1] = "notification";
    values[0] = xpc_int64_create(10);
    id v13 = v12;
    values[1] = v13;
    xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    uint64_t v15 = _ExternalRequestConnectionWithContext(0);
    v16 = (void *)v15;
    id v17 = AFSiriLogContextConnection;
    if (v14 && v15)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        id v21 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
        __int16 v31 = 2112;
        id v32 = v21;
        _os_log_debug_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __65__AFSiriUserNotificationRequest_withdrawalRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E592B530;
      id v25 = v4;
      v24 = v16;
      xpc_connection_send_message_with_reply(v24, v14, 0, handler);

LABEL_21:
      for (uint64_t i = 1; i != -1; --i)

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      xpc_object_t v22 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_19:
        if (v16) {
          xpc_connection_cancel((xpc_connection_t)v16);
        }
        goto LABEL_21;
      }
    }
    else if (!v4)
    {
      goto LABEL_19;
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    goto LABEL_19;
  }
  BOOL v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    xpc_object_t v20 = self->_notification;
    *(_DWORD *)buf = 136315650;
    v30 = "-[AFSiriUserNotificationRequest withdrawalRequestWithCompletion:]";
    __int16 v31 = 2112;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", buf, 0x20u);
  }
  (*((void (**)(id, void))v4 + 2))(v4, 0);
  id v13 = 0;
LABEL_23:
}

void __65__AFSiriUserNotificationRequest_withdrawalRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)deactivateRequestForReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    xpc_object_t v22 = v7;
    if ((unint64_t)a3 > 0x14) {
      uint64_t v23 = @"(unknown)";
    }
    else {
      uint64_t v23 = off_1E59287D8[a3];
    }
    v24 = v23;
    *(_DWORD *)keys = 136315394;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v24;
    _os_log_debug_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_DEBUG, "%s reason: %@", keys, 0x16u);
  }
  if (self->_platform == 2)
  {
    if ((unint64_t)(a3 - 1) < 0x14)
    {
      notification = self->_notification;
      id v29 = 0;
      BOOL v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:notification requiringSecureCoding:1 error:&v29];
      BOOL v10 = (char *)v29;
      if (!v10 && v9)
      {
        id v11 = v9;
        xpc_object_t v12 = xpc_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"));
        *(void *)keys = "type";
        *(void *)&keys[8] = "notification";
        *(void *)&keys[16] = "source_app_id";
        id v34 = "announcement_platform";
        uint64_t v35 = "deactivation_reason";
        values[0] = xpc_int64_create(9);
        id v13 = v12;
        values[1] = v13;
        xpc_object_t values[2] = xpc_string_create([(NSString *)self->_sourceAppId UTF8String]);
        xpc_object_t values[3] = xpc_int64_create(self->_platform);
        values[4] = xpc_int64_create(a3);
        xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
        uint64_t v15 = _ExternalRequestConnectionWithContext(0);
        v16 = (void *)v15;
        id v17 = AFSiriLogContextConnection;
        if (v14 && v15)
        {
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v31 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
            _os_log_debug_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for request deactivation.", buf, 0xCu);
          }
          handler[0] = MEMORY[0x1E4F143A8];
          handler[1] = 3221225472;
          handler[2] = __71__AFSiriUserNotificationRequest_deactivateRequestForReason_completion___block_invoke;
          handler[3] = &unk_1E592B530;
          id v28 = v6;
          v27 = v16;
          xpc_connection_send_message_with_reply(v27, v14, 0, handler);

LABEL_26:
          for (uint64_t i = 4; i != -1; --i)

          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v31 = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
          _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for request deactivation.", buf, 0xCu);
          if (!v6)
          {
LABEL_24:
            if (v16) {
              xpc_connection_cancel((xpc_connection_t)v16);
            }
            goto LABEL_26;
          }
        }
        else if (!v6)
        {
          goto LABEL_24;
        }
        (*((void (**)(id, void))v6 + 2))(v6, 0);
        goto LABEL_24;
      }
      xpc_object_t v20 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        id v25 = self->_notification;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v25;
        *(_WORD *)&keys[22] = 2112;
        id v34 = v10;
        _os_log_error_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
        if (!v6) {
          goto LABEL_20;
        }
      }
      else if (!v6)
      {
LABEL_20:
        id v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
      (*((void (**)(id, void))v6 + 2))(v6, 0);
      goto LABEL_20;
    }
    id v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)keys = 136315394;
      *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      *(_WORD *)&keys[12] = 2048;
      *(void *)&keys[14] = a3;
      _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s unspecified deactivation reason %li. Ignoring.", keys, 0x16u);
      if (!v6) {
        goto LABEL_29;
      }
      goto LABEL_16;
    }
  }
  else
  {
    xpc_object_t v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)keys = 136315138;
      *(void *)&keys[4] = "-[AFSiriUserNotificationRequest deactivateRequestForReason:completion:]";
      _os_log_error_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_ERROR, "%s deactivation requests are currently only supported for CarPlay.", keys, 0xCu);
      if (!v6) {
        goto LABEL_29;
      }
      goto LABEL_16;
    }
  }
  if (v6) {
LABEL_16:
  }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
LABEL_29:
}

void __71__AFSiriUserNotificationRequest_deactivateRequestForReason_completion___block_invoke(uint64_t a1, void *a2)
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

- (void)performRequestWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    notification = self->_notification;
    *(_DWORD *)keys = 136315394;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = notification;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s %@", keys, 0x16u);
  }
  id v6 = self->_notification;
  id v36 = 0;
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v36];
  id v8 = (char *)v36;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    id v11 = v7;
    xpc_object_t v12 = xpc_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"));
    summary = self->_summary;
    id v35 = 0;
    xpc_object_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:summary requiringSecureCoding:1 error:&v35];
    uint64_t v15 = (char *)v35;
    v16 = v15;
    if (v15 || !v14)
    {
      v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        id v28 = self->_summary;
        *(_DWORD *)keys = 136315650;
        *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        *(_WORD *)&keys[12] = 2112;
        *(void *)&keys[14] = v28;
        *(_WORD *)&keys[22] = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_ERROR, "%s Failed to serialize summary %@: %@", keys, 0x20u);
      }
      v4[2](v4, 0);
      id v19 = 0;
      goto LABEL_29;
    }
    __int16 v31 = v14;
    id v17 = v14;
    xpc_object_t v18 = xpc_data_create((const void *)[v17 bytes], objc_msgSend(v17, "length"));
    *(void *)keys = "type";
    *(void *)&keys[8] = "notification";
    *(void *)&keys[16] = "source_app_id";
    v43 = "announcement_platform";
    v44 = "summary_decision";
    v45 = "summary";
    values[0] = xpc_int64_create(2);
    values[1] = v12;
    xpc_object_t values[2] = xpc_string_create([(NSString *)self->_sourceAppId UTF8String]);
    xpc_object_t values[3] = xpc_int64_create(self->_platform);
    values[4] = xpc_int64_create(self->_summaryDecision);
    id v19 = v18;
    xpc_object_t values[5] = v19;
    xpc_object_t v20 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    uint64_t v21 = _ExternalRequestConnectionWithContext(0);
    xpc_object_t v22 = (void *)v21;
    uint64_t v23 = AFSiriLogContextConnection;
    if (v20 && v21)
    {
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        id v29 = self->_notification;
        *(_DWORD *)buf = 136315394;
        v38 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
        __int16 v39 = 2112;
        id v40 = v29;
        _os_log_debug_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_DEBUG, "%s Sending xpc message for %@", buf, 0x16u);
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __62__AFSiriUserNotificationRequest_performRequestWithCompletion___block_invoke;
      handler[3] = &unk_1E592B530;
      id v34 = v4;
      __int16 v33 = v22;
      xpc_connection_send_message_with_reply(v33, v20, 0, handler);

LABEL_26:
      for (uint64_t i = 5; i != -1; --i)

      v16 = 0;
      xpc_object_t v14 = v31;
LABEL_29:

      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v30 = self->_notification;
      *(_DWORD *)buf = 136315394;
      v38 = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
      __int16 v39 = 2112;
      id v40 = v30;
      _os_log_error_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_ERROR, "%s Unable to send xpc message for %@", buf, 0x16u);
      if (!v4)
      {
LABEL_24:
        if (v22) {
          xpc_connection_cancel((xpc_connection_t)v22);
        }
        goto LABEL_26;
      }
    }
    else if (!v4)
    {
      goto LABEL_24;
    }
    v4[2](v4, 0);
    goto LABEL_24;
  }
  BOOL v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v27 = self->_notification;
    *(_DWORD *)keys = 136315650;
    *(void *)&keys[4] = "-[AFSiriUserNotificationRequest performRequestWithCompletion:]";
    *(_WORD *)&keys[12] = 2112;
    *(void *)&keys[14] = v27;
    *(_WORD *)&keys[22] = 2112;
    v43 = v8;
    _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Failed to serialize notification %@: %@", keys, 0x20u);
  }
  v4[2](v4, 0);
  xpc_object_t v12 = 0;
LABEL_30:
}

void __62__AFSiriUserNotificationRequest_performRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
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

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6 summary:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriUserNotificationRequest;
  v16 = [(AFSiriUserNotificationRequest *)&v19 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_notification, a3);
    objc_storeStrong((id *)&v17->_sourceAppId, a4);
    v17->_platform = a5;
    v17->_summaryDecision = a6;
    objc_storeStrong((id *)&v17->_summary, a7);
  }

  return v17;
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5 summaryDecision:(int64_t)a6
{
  return [(AFSiriUserNotificationRequest *)self initWithUserNotification:a3 sourceAppId:a4 platform:a5 summaryDecision:a6 summary:0];
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4 platform:(int64_t)a5
{
  return [(AFSiriUserNotificationRequest *)self initWithUserNotification:a3 sourceAppId:a4 platform:a5 summaryDecision:0 summary:0];
}

- (AFSiriUserNotificationRequest)initWithUserNotification:(id)a3 sourceAppId:(id)a4
{
  return [(AFSiriUserNotificationRequest *)self initWithUserNotification:a3 sourceAppId:a4 platform:1];
}

+ (BOOL)supportedForApplicationWithBundleId:(id)a3
{
  return +[AFSiriUserNotificationRequestCapabilityManager supportedByApplicationWithBundleID:a3];
}

+ (BOOL)supportedOnPlatform
{
  v2 = +[AFSiriUserNotificationRequestCapabilityManager sharedManager];
  char v3 = [v2 hasEligibleSetup];

  return v3;
}

+ (BOOL)canBeHandled
{
  v2 = +[AFSiriUserNotificationRequestCapabilityManager sharedManager];
  char v3 = [v2 requestCanBeHandled];

  return v3;
}

@end