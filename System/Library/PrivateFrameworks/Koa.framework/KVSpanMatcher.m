@interface KVSpanMatcher
+ (id)indexMatcher;
+ (id)itemMatcher:(id)a3 locale:(id)a4;
+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5;
- (BOOL)setItems:(id)a3 error:(id *)a4;
- (KVSpanMatcher)initWithSpanMatcher:(id)a3;
- (id)_convertResults:(id)a3;
- (id)indexLocaleWithError:(id *)a3;
- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4;
- (id)matchSpans:(id)a3 error:(id *)a4;
- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5;
@end

@implementation KVSpanMatcher

- (void).cxx_destruct
{
}

- (id)_convertResults:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9);
  v15 = objc_msgSend_initWithCapacity_(v4, v11, v10, v12, v13, v14);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v3;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v41, 16, v18);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v24 = [KVSpanMatchResult alloc];
        matched = objc_msgSend_initWithSpanMatchResult_(v24, v25, v23, v26, v27, v28, (void)v37);
        if (matched) {
          objc_msgSend_addObject_(v15, v29, (uint64_t)matched, v30, v31, v32);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v34, (uint64_t)&v37, (uint64_t)v41, 16, v35);
    }
    while (v20);
  }

  return v15;
}

- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5
{
  spanMatcher = self->_spanMatcher;
  id v9 = a4;
  v15 = objc_msgSend_query(a3, v10, v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_matchSpans_userId_error_(spanMatcher, v16, (uint64_t)v15, (uint64_t)v9, (uint64_t)a5, v17);

  uint64_t v23 = objc_msgSend__convertResults_(self, v19, (uint64_t)v18, v20, v21, v22);

  return v23;
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  spanMatcher = self->_spanMatcher;
  id v9 = objc_msgSend_query(a3, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  uint64_t v13 = objc_msgSend_matchSpans_error_(spanMatcher, v10, (uint64_t)v9, (uint64_t)a4, v11, v12);

  uint64_t v18 = objc_msgSend__convertResults_(self, v14, (uint64_t)v13, v15, v16, v17);

  return v18;
}

- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(SEMSpanMatcher *, char *, id, id *))MEMORY[0x1F4181798])(self->_spanMatcher, sel_indexLocaleWithUserId_error_, a3, a4);
}

- (id)indexLocaleWithError:(id *)a3
{
  return (id)((uint64_t (*)(SEMSpanMatcher *, char *, id *))MEMORY[0x1F4181798])(self->_spanMatcher, sel_indexLocale_, a3);
}

- (BOOL)setItems:(id)a3 error:(id *)a4
{
  return ((uint64_t (*)(SEMSpanMatcher *, char *, id, id *))MEMORY[0x1F4181798])(self->_spanMatcher, sel_setItems_error_, a3, a4);
}

- (KVSpanMatcher)initWithSpanMatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanMatcher;
  uint64_t v6 = [(KVSpanMatcher *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spanMatcher, a3);
  }

  return v7;
}

+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_1BC3C4DB8();
  uint64_t v15 = objc_msgSend_tokenizer(v7, v10, v11, v12, v13, v14);

  uint64_t v18 = objc_msgSend_itemMatcher_tokenizer_error_(v9, v16, (uint64_t)v8, (uint64_t)v15, (uint64_t)a5, v17);

  id v19 = objc_alloc((Class)objc_opt_class());
  v24 = objc_msgSend_initWithSpanMatcher_(v19, v20, (uint64_t)v18, v21, v22, v23);

  return v24;
}

+ (id)itemMatcher:(id)a3 locale:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v7 = (void *)qword_1E9F97000;
  uint64_t v32 = qword_1E9F97000;
  if (!qword_1E9F97000)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1BC3C52A8;
    v34 = &unk_1E62AD708;
    uint64_t v35 = &v29;
    sub_1BC3C52A8((uint64_t)buf);
    id v7 = (void *)v30[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v29, 8);
  id v9 = [v8 alloc];
  uint64_t v14 = objc_msgSend_initWithLocale_(v9, v10, (uint64_t)v6, v11, v12, v13);
  id v15 = sub_1BC3C4DB8();
  id v28 = 0;
  uint64_t v18 = objc_msgSend_itemMatcher_tokenizer_error_(v15, v16, (uint64_t)v5, (uint64_t)v14, (uint64_t)&v28, v17);
  id v19 = v28;
  if (!v18)
  {
    uint64_t v20 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[KVSpanMatcher itemMatcher:locale:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_error_impl(&dword_1BC3B6000, v20, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
  }
  id v21 = objc_alloc((Class)objc_opt_class());
  uint64_t v26 = objc_msgSend_initWithSpanMatcher_(v21, v22, (uint64_t)v18, v23, v24, v25);

  return v26;
}

+ (id)indexMatcher
{
  id v2 = objc_alloc((Class)objc_opt_class());
  id v3 = sub_1BC3C4DB8();
  id v9 = objc_msgSend_indexMatcher(v3, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_initWithSpanMatcher_(v2, v10, (uint64_t)v9, v11, v12, v13);

  return v14;
}

@end