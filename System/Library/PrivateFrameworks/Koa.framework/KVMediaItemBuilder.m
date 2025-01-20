@interface KVMediaItemBuilder
+ (void)initialize;
- (KVMediaItemBuilder)init;
- (id)_buildMediaItemWithId:(id)a3 otherFields:(id)a4;
- (id)albumArtistItemWithName:(id)a3 itemId:(id)a4;
- (id)albumItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5;
- (id)audioBookArtistItemWithName:(id)a3 itemId:(id)a4;
- (id)audioBookItemWithName:(id)a3 itemId:(id)a4 artistId:(id)a5;
- (id)genreItemWithName:(id)a3 itemId:(id)a4;
- (id)movieItemWithName:(id)a3 itemId:(id)a4;
- (id)musicVideoItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8;
- (id)playlistItemWithName:(id)a3 itemId:(id)a4;
- (id)songArtistItemWithName:(id)a3 itemId:(id)a4;
- (id)songItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8;
- (id)tvEpisodeItemWithName:(id)a3 itemId:(id)a4 showId:(id)a5;
- (id)tvShowItemWithName:(id)a3 itemId:(id)a4;
@end

@implementation KVMediaItemBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (id)playlistItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 216, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)audioBookItemWithName:(id)a3 itemId:(id)a4 artistId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  fields = self->_fields;
  id v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14, v15, v16);
  v17 = self->_fields;
  uint64_t v18 = [KVFieldValue alloc];
  v22 = objc_msgSend_initWithFieldType_value_(v18, v19, 208, (uint64_t)v11, v20, v21);

  objc_msgSend_addObject_(v17, v23, (uint64_t)v22, v24, v25, v26);
  if (v9)
  {
    v30 = self->_fields;
    v31 = [KVFieldValue alloc];
    v35 = objc_msgSend_initWithFieldType_value_(v31, v32, 205, (uint64_t)v9, v33, v34);
    objc_msgSend_addObject_(v30, v36, (uint64_t)v35, v37, v38, v39);
  }
  v40 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v27, (uint64_t)v8, (uint64_t)self->_fields, v28, v29);

  return v40;
}

- (id)audioBookArtistItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 206, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  uint64_t v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)movieItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 212, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  uint64_t v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)tvEpisodeItemWithName:(id)a3 itemId:(id)a4 showId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  fields = self->_fields;
  id v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14, v15, v16);
  v17 = self->_fields;
  uint64_t v18 = [KVFieldValue alloc];
  v22 = objc_msgSend_initWithFieldType_value_(v18, v19, 230, (uint64_t)v11, v20, v21);

  objc_msgSend_addObject_(v17, v23, (uint64_t)v22, v24, v25, v26);
  if (v9)
  {
    v30 = self->_fields;
    v31 = [KVFieldValue alloc];
    v35 = objc_msgSend_initWithFieldType_value_(v31, v32, 231, (uint64_t)v9, v33, v34);
    objc_msgSend_addObject_(v30, v36, (uint64_t)v35, v37, v38, v39);
  }
  v40 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v27, (uint64_t)v8, (uint64_t)self->_fields, v28, v29);

  return v40;
}

- (id)tvShowItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 232, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  uint64_t v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)musicVideoItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  fields = self->_fields;
  id v20 = a3;
  objc_msgSend_removeAllObjects(fields, v21, v22, v23, v24, v25);
  uint64_t v26 = self->_fields;
  v27 = [KVFieldValue alloc];
  v31 = objc_msgSend_initWithFieldType_value_(v27, v28, 214, (uint64_t)v20, v29, v30);

  objc_msgSend_addObject_(v26, v32, (uint64_t)v31, v33, v34, v35);
  if (v15)
  {
    uint64_t v39 = self->_fields;
    v40 = [KVFieldValue alloc];
    v44 = objc_msgSend_initWithFieldType_value_(v40, v41, 201, (uint64_t)v15, v42, v43);
    objc_msgSend_addObject_(v39, v45, (uint64_t)v44, v46, v47, v48);
  }
  if (v16)
  {
    v49 = self->_fields;
    v50 = [KVFieldValue alloc];
    v54 = objc_msgSend_initWithFieldType_value_(v50, v51, 225, (uint64_t)v16, v52, v53);
    objc_msgSend_addObject_(v49, v55, (uint64_t)v54, v56, v57, v58);
  }
  if (v17)
  {
    v59 = self->_fields;
    v60 = [KVFieldValue alloc];
    v64 = objc_msgSend_initWithFieldType_value_(v60, v61, 203, (uint64_t)v17, v62, v63);
    objc_msgSend_addObject_(v59, v65, (uint64_t)v64, v66, v67, v68);
  }
  if (v18)
  {
    v69 = self->_fields;
    v70 = [KVFieldValue alloc];
    v74 = objc_msgSend_initWithFieldType_value_(v70, v71, 209, (uint64_t)v18, v72, v73);
    objc_msgSend_addObject_(v69, v75, (uint64_t)v74, v76, v77, v78);
  }
  v79 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v36, (uint64_t)v14, (uint64_t)self->_fields, v37, v38);

  return v79;
}

- (id)songItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5 songArtistId:(id)a6 albumId:(id)a7 genreId:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  fields = self->_fields;
  id v20 = a3;
  objc_msgSend_removeAllObjects(fields, v21, v22, v23, v24, v25);
  uint64_t v26 = self->_fields;
  v27 = [KVFieldValue alloc];
  v31 = objc_msgSend_initWithFieldType_value_(v27, v28, 228, (uint64_t)v20, v29, v30);

  objc_msgSend_addObject_(v26, v32, (uint64_t)v31, v33, v34, v35);
  if (v15)
  {
    uint64_t v39 = self->_fields;
    v40 = [KVFieldValue alloc];
    v44 = objc_msgSend_initWithFieldType_value_(v40, v41, 201, (uint64_t)v15, v42, v43);
    objc_msgSend_addObject_(v39, v45, (uint64_t)v44, v46, v47, v48);
  }
  if (v16)
  {
    v49 = self->_fields;
    v50 = [KVFieldValue alloc];
    v54 = objc_msgSend_initWithFieldType_value_(v50, v51, 225, (uint64_t)v16, v52, v53);
    objc_msgSend_addObject_(v49, v55, (uint64_t)v54, v56, v57, v58);
  }
  if (v17)
  {
    v59 = self->_fields;
    v60 = [KVFieldValue alloc];
    v64 = objc_msgSend_initWithFieldType_value_(v60, v61, 203, (uint64_t)v17, v62, v63);
    objc_msgSend_addObject_(v59, v65, (uint64_t)v64, v66, v67, v68);
  }
  if (v18)
  {
    v69 = self->_fields;
    v70 = [KVFieldValue alloc];
    v74 = objc_msgSend_initWithFieldType_value_(v70, v71, 209, (uint64_t)v18, v72, v73);
    objc_msgSend_addObject_(v69, v75, (uint64_t)v74, v76, v77, v78);
  }
  v79 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v36, (uint64_t)v14, (uint64_t)self->_fields, v37, v38);

  return v79;
}

- (id)genreItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 210, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  id v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  id v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)albumItemWithName:(id)a3 itemId:(id)a4 albumArtistId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  fields = self->_fields;
  id v11 = a3;
  objc_msgSend_removeAllObjects(fields, v12, v13, v14, v15, v16);
  id v17 = self->_fields;
  uint64_t v18 = [KVFieldValue alloc];
  uint64_t v22 = objc_msgSend_initWithFieldType_value_(v18, v19, 204, (uint64_t)v11, v20, v21);

  objc_msgSend_addObject_(v17, v23, (uint64_t)v22, v24, v25, v26);
  if (v9)
  {
    uint64_t v30 = self->_fields;
    v31 = [KVFieldValue alloc];
    uint64_t v35 = objc_msgSend_initWithFieldType_value_(v31, v32, 201, (uint64_t)v9, v33, v34);
    objc_msgSend_addObject_(v30, v36, (uint64_t)v35, v37, v38, v39);
  }
  v40 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v27, (uint64_t)v8, (uint64_t)self->_fields, v28, v29);

  return v40;
}

- (id)songArtistItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 226, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  uint64_t v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)albumArtistItemWithName:(id)a3 itemId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [KVFieldValue alloc];
  v12 = objc_msgSend_initWithFieldType_value_(v8, v9, 202, (uint64_t)v7, v10, v11);

  v22[0] = v12;
  uint64_t v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v22, 1, v14, v15);
  uint64_t v20 = objc_msgSend__buildMediaItemWithId_otherFields_(self, v17, (uint64_t)v6, (uint64_t)v16, v18, v19);

  return v20;
}

- (id)_buildMediaItemWithId:(id)a3 otherFields:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  builder = self->_builder;
  id v64 = 0;
  uint64_t v11 = objc_msgSend_setItemType_itemId_error_(builder, v9, 5, (uint64_t)v6, (uint64_t)&v64, v10);
  id v12 = v64;

  if (v11)
  {
    id v56 = v7;
    id v57 = v6;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v13 = v7;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v60, (uint64_t)v73, 16, v15);
    if (v16)
    {
      uint64_t v22 = v16;
      uint64_t v23 = *(void *)v61;
      uint64_t v24 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v61 != v23) {
            objc_enumerationMutation(v13);
          }
          uint64_t v26 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v27 = objc_msgSend_value(v26, v17, v18, v19, v20, v21, v56);

          if (v27)
          {
            uint64_t v28 = self->_builder;
            uint64_t v29 = objc_msgSend_fieldType(v26, v17, v18, v19, v20, v21);
            uint64_t v35 = objc_msgSend_value(v26, v30, v31, v32, v33, v34);
            id v59 = v24;
            uint64_t v38 = objc_msgSend_addFieldWithType_value_error_(v28, v36, v29, (uint64_t)v35, (uint64_t)&v59, v37);
            id v12 = v59;

            if (!v38)
            {
              v41 = (void *)qword_1EB5EE458;
              id v6 = v57;
              if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
              {
                v49 = v41;
                v55 = objc_msgSend_value(v26, v50, v51, v52, v53, v54);
                *(_DWORD *)buf = 136315906;
                uint64_t v66 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
                __int16 v67 = 2112;
                id v68 = v57;
                __int16 v69 = 2112;
                id v70 = v55;
                __int16 v71 = 2112;
                id v72 = v12;
                _os_log_error_impl(&dword_1BC3B6000, v49, OS_LOG_TYPE_ERROR, "%s Failed to add field to media item: %@ field: %@ error: %@", buf, 0x2Au);
              }
              uint64_t v42 = 0;
              id v7 = v56;
              goto LABEL_25;
            }
            uint64_t v24 = v12;
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v60, (uint64_t)v73, 16, v21);
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v24 = v12;
    }

    uint64_t v43 = self->_builder;
    id v58 = v24;
    uint64_t v42 = objc_msgSend_buildItemWithError_(v43, v44, (uint64_t)&v58, v45, v46, v47);
    id v12 = v58;

    if (v42)
    {
      id v7 = v56;
      id v6 = v57;
      goto LABEL_25;
    }
    uint64_t v39 = qword_1EB5EE458;
    id v7 = v56;
    id v6 = v57;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v66 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
      __int16 v67 = 2112;
      id v68 = v57;
      __int16 v69 = 2112;
      id v70 = v12;
      v40 = "%s Failed to build media item: %@ error: %@";
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v39 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v66 = "-[KVMediaItemBuilder _buildMediaItemWithId:otherFields:]";
      __int16 v67 = 2112;
      id v68 = v6;
      __int16 v69 = 2112;
      id v70 = v12;
      v40 = "%s Failed to set item type for media item: %@ error: %@";
LABEL_23:
      _os_log_error_impl(&dword_1BC3B6000, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x20u);
    }
  }
  uint64_t v42 = 0;
LABEL_25:

  return v42;
}

- (KVMediaItemBuilder)init
{
  v8.receiver = self;
  v8.super_class = (Class)KVMediaItemBuilder;
  v2 = [(KVMediaItemBuilder *)&v8 init];
  if (v2)
  {
    if (qword_1EB5EE450 != -1) {
      dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
    }
    v3 = objc_alloc_init(KVItemBuilder);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fields = v2->_fields;
    v2->_fields = v5;
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