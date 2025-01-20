@interface AFSiriActivationHandlerCoreSpeechDaemon
- (BOOL)handleContext:(id)a3 completion:(id)a4;
@end

@implementation AFSiriActivationHandlerCoreSpeechDaemon

- (BOOL)handleContext:(id)a3 completion:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    __int16 v58 = 2112;
    id v59 = v5;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  uint64_t v8 = [v5 source];
  uint64_t v9 = [v5 event];
  uint64_t v10 = v9;
  if (v8 == 5)
  {
    v16 = [v5 deviceID];
    if (v16)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v17 = [getCSActivationEventNotifierClass() sharedNotifier];
        id CSActivationEventClass = getCSActivationEventClass();
        v19 = [v5 userInfo];
        v20 = objc_msgSend(CSActivationEventClass, "jarvisVoiceTriggerEvent:activationInfo:hostTime:", v16, v19, objc_msgSend(v5, "timestamp"));
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_7;
        v44[3] = &unk_1E59288F0;
        id v45 = v5;
        id v46 = v6;
        [v17 notifyActivationEvent:v20 completion:v44];

        BOOL v15 = 1;
LABEL_24:

        goto LABEL_35;
      }
      v29 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        BOOL v15 = 0;
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      __int16 v58 = 2112;
      id v59 = v5;
      v30 = "%s Unexpected event in context %@.";
    }
    else
    {
      v29 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      __int16 v58 = 2112;
      id v59 = v5;
      v30 = "%s No device ID is provided in context %@.";
    }
    _os_log_error_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);
    goto LABEL_23;
  }
  if (v8 == 4)
  {
    v21 = [v5 deviceID];
    if (v21)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v22 = [getCSActivationEventNotifierClass() sharedNotifier];
        id v23 = getCSActivationEventClass();
        v24 = [v5 userInfo];
        v25 = objc_msgSend(v23, "remoteMicVoiceTriggerEvent:activationInfo:hostTime:", v21, v24, objc_msgSend(v5, "timestamp"));
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_3;
        v50[3] = &unk_1E59288F0;
        id v51 = v5;
        id v52 = v6;
        [v22 notifyActivationEvent:v25 completion:v50];

        int v26 = 1;
LABEL_34:

        BOOL v15 = v26 != 0;
        goto LABEL_35;
      }
      if (v10 == 6)
      {
        v33 = [v5 userInfo];
        v34 = [v33 objectForKey:@"score"];

        if (v34)
        {
          v35 = [getCSActivationEventNotifierClass() sharedNotifier];
          id v36 = getCSActivationEventClass();
          [v34 floatValue];
          int v38 = v37;
          uint64_t v39 = [v5 timestamp];
          LODWORD(v40) = v38;
          v41 = [v36 remoteMicVADEvent:v21 vadScore:v39 hostTime:v40];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_2;
          v47[3] = &unk_1E59288F0;
          id v48 = v5;
          id v49 = v6;
          [v35 notifyActivationEvent:v41 completion:v47];

          int v26 = 1;
        }
        else
        {
          v42 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
            __int16 v58 = 2112;
            id v59 = v5;
            _os_log_error_impl(&dword_19CF1D000, v42, OS_LOG_TYPE_ERROR, "%s No score is provided in context %@.", buf, 0x16u);
          }
          int v26 = 0;
        }

        goto LABEL_34;
      }
      v31 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        int v26 = 0;
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      __int16 v58 = 2112;
      id v59 = v5;
      v32 = "%s Unexpected event in context %@.";
    }
    else
    {
      v31 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      __int16 v58 = 2112;
      id v59 = v5;
      v32 = "%s No device ID is provided in context %@.";
    }
    _os_log_error_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
    goto LABEL_29;
  }
  if (v8 != 1)
  {
    v27 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v15 = 0;
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    __int16 v58 = 2112;
    id v59 = v5;
    v28 = "%s Unexpected source in context %@.";
LABEL_37:
    _os_log_error_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_17;
  }
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v27 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    __int16 v58 = 2112;
    id v59 = v5;
    v28 = "%s Unexpected event in context %@.";
    goto LABEL_37;
  }
  v11 = [getCSActivationEventNotifierClass() sharedNotifier];
  id v12 = getCSActivationEventClass();
  v13 = [v5 userInfo];
  v14 = objc_msgSend(v12, "builtInMicVoiceTriggerEvent:hostTime:", v13, objc_msgSend(v5, "timestamp"));
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke;
  v53[3] = &unk_1E59288F0;
  id v54 = v5;
  id v55 = v6;
  [v11 notifyActivationEvent:v14 completion:v53];

  BOOL v15 = 1;
LABEL_35:

  return v15;
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_1;
    v9[3] = &unk_1E59294E8;
    id v10 = v4;
    id v7 = +[AFSiriActivationResult newWithBuilder:v9];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_4;
    v9[3] = &unk_1E59294E8;
    id v10 = v4;
    id v7 = +[AFSiriActivationResult newWithBuilder:v9];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_6;
    v9[3] = &unk_1E59294E8;
    id v10 = v4;
    id v7 = +[AFSiriActivationResult newWithBuilder:v9];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_8;
    v9[3] = &unk_1E59294E8;
    id v10 = v4;
    id v7 = +[AFSiriActivationResult newWithBuilder:v9];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:4];
  [v3 setError:*(void *)(a1 + 32)];
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:4];
  [v3 setError:*(void *)(a1 + 32)];
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:4];
  [v3 setError:*(void *)(a1 + 32)];
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setActionType:4];
  [v3 setError:*(void *)(a1 + 32)];
}

@end