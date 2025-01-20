@interface NSExtension(IntentsCore)
- (void)_intents_startExtensionConnectionWithExtensionInputItems:()IntentsCore intent:queue:completion:;
@end

@implementation NSExtension(IntentsCore)

- (void)_intents_startExtensionConnectionWithExtensionInputItems:()IntentsCore intent:queue:completion:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v42 = [a1 _plugIn];
  __int16 v14 = [v42 userElection];
  v15 = (os_log_t *)MEMORY[0x1E4F30240];
  v43 = v11;
  if ((v14 & 0x100) != 0)
  {
    v19 = *MEMORY[0x1E4F30240];
    v17 = v10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      __int16 v55 = 2112;
      id v56 = a1;
      _os_log_impl(&dword_1BC57D000, v19, OS_LOG_TYPE_INFO, "%s Extension loading timeout disabled for %@ for debugging.", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F30840]);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke;
    v48[3] = &unk_1E62BBB28;
    v17 = v10;
    id v49 = v10;
    id v50 = v12;
    v18 = (void *)[v16 initWithTimeoutInterval:v11 onQueue:v48 timeoutHandler:10.0];
  }
  [v18 start];
  os_signpost_id_t v20 = os_signpost_id_generate(*v15);
  v21 = *v15;
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v23 = [a1 identifier];
    *(_DWORD *)buf = 138412290;
    v54 = v23;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "INSignpostExtensionLaunch", "%@", buf, 0xCu);
  }
  id v47 = 0;
  v24 = [a1 beginExtensionRequestWithOptions:1 inputItems:v13 error:&v47];

  id v25 = v47;
  v26 = *v15;
  v27 = v26;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    v28 = [a1 identifier];
    *(_DWORD *)buf = 138412290;
    v54 = v28;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v27, OS_SIGNPOST_INTERVAL_END, v20, "INSignpostExtensionLaunch", "%@", buf, 0xCu);
  }
  [v18 cancel];
  if (!v25)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_22;
    }
    v34 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      __int16 v55 = 2114;
      id v56 = v24;
      _os_log_error_impl(&dword_1BC57D000, v34, OS_LOG_TYPE_ERROR, "%s UNEXPECTED: requestIdentifier should be of class NSUUID: %{public}@", buf, 0x16u);
    }
    v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300D0] code:5001 userInfo:0];
    if (!v33) {
      goto LABEL_22;
    }
LABEL_21:
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v33);
    goto LABEL_30;
  }
  v29 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
    __int16 v55 = 2114;
    id v56 = v25;
    _os_log_error_impl(&dword_1BC57D000, v29, OS_LOG_TYPE_ERROR, "%s Error with extension request %{public}@", buf, 0x16u);
  }
  v30 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v31 = *MEMORY[0x1E4F300D0];
  uint64_t v51 = *MEMORY[0x1E4F28A50];
  id v52 = v25;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v33 = [v30 errorWithDomain:v31 code:5001 userInfo:v32];

  if (v33) {
    goto LABEL_21;
  }
LABEL_22:
  v35 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
    __int16 v55 = 2112;
    id v56 = v24;
    _os_log_impl(&dword_1BC57D000, v35, OS_LOG_TYPE_INFO, "%s Extension successfully brought up with request identifier %@", buf, 0x16u);
  }
  v36 = [a1 _extensionContextForUUID:v24];
  v37 = v36;
  if (v36)
  {
    v38 = [v36 _auxiliaryConnection];
    v39 = [v38 remoteObjectProxy];

    v40 = [v17 identifier];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __109__NSExtension_IntentsCore___intents_startExtensionConnectionWithExtensionInputItems_intent_queue_completion___block_invoke_4;
    v44[3] = &unk_1E62BBB28;
    id v46 = v12;
    id v45 = v24;
    [v39 beginTransactionWithIntentIdentifier:v40 completion:v44];

    v33 = 0;
  }
  else
  {
    v41 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[NSExtension(IntentsCore) _intents_startExtensionConnectionWithExtensionInputItems:intent:queue:completion:]";
      __int16 v55 = 2114;
      id v56 = v24;
      _os_log_error_impl(&dword_1BC57D000, v41, OS_LOG_TYPE_ERROR, "%s UNEXPECTED: extension context host is nil: %{public}@", buf, 0x16u);
    }
    v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F300D0] code:5001 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v33);
  }

LABEL_30:
}

@end