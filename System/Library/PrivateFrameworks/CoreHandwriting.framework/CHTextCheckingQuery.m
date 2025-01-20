@interface CHTextCheckingQuery
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (BOOL)q_resultWantedForCompleteness:(int64_t)a3;
- (CHTextCheckingQuery)initWithRecognitionSession:(id)a3;
- (NSArray)foundItems;
- (id)debugName;
- (void)q_updateQueryResult;
@end

@implementation CHTextCheckingQuery

- (CHTextCheckingQuery)initWithRecognitionSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHTextCheckingQuery;
  v5 = [(CHQuery *)&v9 initWithRecognitionSession:v4];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    foundItems = v5->_foundItems;
    v5->_foundItems = v6;

    if (qword_1EA3C9F78 != -1) {
      dispatch_once(&qword_1EA3C9F78, &unk_1F2012E90);
    }
  }

  return v5;
}

- (void)q_updateQueryResult
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (CHHasPersonalizedSynthesisModelReady((uint64_t)self, a2, v2, v3, v4, v5))
  {
    if (!self) {
      goto LABEL_12;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v12 = objc_msgSend_recognitionSession(self, v7, v8, v9, v10, v11);
    v18 = objc_msgSend_preferredLocales(v12, v13, v14, v15, v16, v17);

    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v60, (uint64_t)buf, 16, v20);
    if (!v21) {
      goto LABEL_11;
    }
    uint64_t v22 = *(void *)v61;
LABEL_5:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v61 != v22) {
        objc_enumerationMutation(v18);
      }
      if (CHHasPersonalizedSynthesisSupportForLocale(*(void **)(*((void *)&v60 + 1) + 8 * v23))) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v60, (uint64_t)buf, 16, v25);
        if (v21) {
          goto LABEL_5;
        }
LABEL_11:

LABEL_12:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v26 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v27 = "CHTextCheckingQuery not running because this device does not have any supported locales enabled.";
          goto LABEL_20;
        }
        goto LABEL_46;
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v28 = (id)qword_1EA3C9FC8;
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    if (qword_1EA3CA000 == -1)
    {
      v30 = (id)qword_1EA3C9FC8;
      unint64_t v31 = v29 - 1;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v30 = (id)qword_1EA3C9FC8;
      unint64_t v31 = v29 - 1;
      if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_27;
      }
    }
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C492D000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v29, "CHTextCheckingQuery_update", "", buf, 2u);
    }
LABEL_27:

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v32 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextCheckingQuery_update\"", buf, 2u);
    }

    v59.receiver = self;
    v59.super_class = (Class)CHTextCheckingQuery;
    [(CHQuery *)&v59 q_updateQueryResult];
    v26 = objc_msgSend_q_sessionResult(self, v33, v34, v35, v36, v37);
    if (objc_msgSend_completeness(v26, v38, v39, v40, v41, v42) == 2)
    {
      sub_1C4B1F6B8((void **)&self->super.super.isa, v26);
      v43 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      p_super = &v43->super;
      if (self->_foundItems != v43)
      {
        v50 = (NSArray *)objc_msgSend_copy(v43, v44, v45, v46, v47, v48);
        foundItems = self->_foundItems;
        self->_foundItems = v50;

        objc_msgSend_q_queryResultDidChange(self, v52, v53, v54, v55, v56);
      }

LABEL_38:
      if (qword_1EA3CA000 == -1)
      {
        v57 = (id)qword_1EA3C9FC8;
        if (v31 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        v57 = (id)qword_1EA3C9FC8;
        if (v31 > 0xFFFFFFFFFFFFFFFDLL) {
          goto LABEL_42;
        }
      }
      if (os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v57, OS_SIGNPOST_INTERVAL_END, v29, "CHTextCheckingQuery_update", "", buf, 2u);
      }
LABEL_42:

      if (qword_1EA3CA000 == -1)
      {
        v58 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
LABEL_45:

          goto LABEL_46;
        }
      }
      else
      {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        v58 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_45;
        }
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v58, OS_LOG_TYPE_DEFAULT, "END \"CHTextCheckingQuery_update\"", buf, 2u);
      goto LABEL_45;
    }
    if (qword_1EA3CA000 == -1)
    {
      p_super = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      p_super = (id)qword_1EA3C9F90[0];
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, p_super, OS_LOG_TYPE_DEFAULT, "CHTextCheckingQuery not running because principal lines are not ready.", buf, 2u);
    goto LABEL_38;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v26 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v27 = "CHTextCheckingQuery not running because this device does not support personalized synthesis.";
LABEL_20:
    _os_log_impl(&dword_1C492D000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
  }
LABEL_46:
}

- (NSArray)foundItems
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1C4B21774;
  uint64_t v15 = sub_1C4B21784;
  id v16 = 0;
  v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4B230FC;
  v10[3] = &unk_1E64E1168;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Text Checking Query %p", v2, v3, v4, self);
}

- (void).cxx_destruct
{
}

@end