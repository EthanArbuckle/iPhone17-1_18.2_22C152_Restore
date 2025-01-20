@interface KVPodcastItemBuilder
+ (void)initialize;
- (KVPodcastItemBuilder)init;
- (id)_buildItemWithError:(id *)a3;
- (id)playlistItemWithName:(id)a3 itemId:(id)a4 error:(id *)a5;
- (id)podcastItemWithTitle:(id)a3 itemId:(id)a4 artistName:(id)a5 error:(id *)a6;
@end

@implementation KVPodcastItemBuilder

- (void).cxx_destruct
{
}

- (id)_buildItemWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  builder = self->_builder;
  id v13 = 0;
  v8 = objc_msgSend_buildItemWithError_(builder, a2, (uint64_t)&v13, v3, v4, v5);
  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
    goto LABEL_7;
  }
  v11 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[KVPodcastItemBuilder _buildItemWithError:]";
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_error_impl(&dword_1BC3B6000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    if (!a3) {
      goto LABEL_7;
    }
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  if (v9) {
    *a3 = v9;
  }
LABEL_7:

  return v8;
}

- (id)playlistItemWithName:(id)a3 itemId:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  builder = self->_builder;
  id v27 = 0;
  v12 = objc_msgSend_setItemType_itemId_error_(builder, v10, 16, (uint64_t)a4, (uint64_t)&v27, v11);
  id v15 = v27;
  if (v12)
  {
    __int16 v16 = self->_builder;
    id v26 = v15;
    id v17 = objc_msgSend_addFieldWithType_value_error_(v16, v13, 702, (uint64_t)v8, (uint64_t)&v26, v14);
    id v18 = v26;

    if (v17)
    {
      v23 = objc_msgSend__buildItemWithError_(self, v19, (uint64_t)a5, v20, v21, v22);
      goto LABEL_11;
    }
    id v15 = v18;
  }
  v24 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[KVPodcastItemBuilder playlistItemWithName:itemId:error:]";
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_error_impl(&dword_1BC3B6000, v24, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v23 = 0;
  if (a5 && v15)
  {
    id v18 = v15;
    v23 = 0;
    *a5 = v18;
  }
  else
  {
    id v18 = v15;
  }
LABEL_11:

  return v23;
}

- (id)podcastItemWithTitle:(id)a3 itemId:(id)a4 artistName:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  builder = self->_builder;
  id v35 = 0;
  id v15 = objc_msgSend_setItemType_itemId_error_(builder, v13, 16, (uint64_t)a4, (uint64_t)&v35, v14);
  id v18 = v35;
  if (v15)
  {
    v19 = self->_builder;
    id v34 = v18;
    uint64_t v20 = objc_msgSend_addFieldWithType_value_error_(v19, v16, 700, (uint64_t)v10, (uint64_t)&v34, v17);
    id v21 = v34;

    if (!v20)
    {

      goto LABEL_7;
    }
    v24 = self->_builder;
    id v33 = v21;
    v25 = objc_msgSend_addFieldWithType_value_error_(v24, v22, 701, (uint64_t)v11, (uint64_t)&v33, v23);
    id v18 = v33;

    if (v25)
    {
      __int16 v30 = objc_msgSend__buildItemWithError_(self, v26, (uint64_t)a6, v27, v28, v29);
      goto LABEL_13;
    }
  }
  id v21 = v18;
LABEL_7:
  id v31 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[KVPodcastItemBuilder podcastItemWithTitle:itemId:artistName:error:]";
    __int16 v38 = 2112;
    id v39 = v21;
    _os_log_error_impl(&dword_1BC3B6000, v31, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  __int16 v30 = 0;
  if (a6 && v21)
  {
    id v18 = v21;
    __int16 v30 = 0;
    *a6 = v18;
  }
  else
  {
    id v18 = v21;
  }
LABEL_13:

  return v30;
}

- (KVPodcastItemBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)KVPodcastItemBuilder;
  v2 = [(KVPodcastItemBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end