@interface CHInputContextLexiconManager
- (CHInputContextLexiconManager)init;
- (NSArray)addressBookLexicon;
- (NSDictionary)textReplacements;
- (OS_dispatch_queue)lexiconQueue;
- (_LXLexicon)transientLexicon;
- (_LXLexicon)transientLexiconWithCustomEntries:(id)a3;
- (_LXLexicon)transientPhraseLexicon;
- (void)dealloc;
- (void)vocabulary;
@end

@implementation CHInputContextLexiconManager

- (CHInputContextLexiconManager)init
{
  v94[1] = *MEMORY[0x1E4F143B8];
  v79.receiver = self;
  v79.super_class = (Class)CHInputContextLexiconManager;
  v3 = [(CHInputContextLexiconManager *)&v79 init];
  v4 = v3;
  if (v3)
  {
    id contactsObserverBlock = v3->_contactsObserverBlock;
    v3->_id contactsObserverBlock = 0;

    id namedEntityObserverBlock = v4->_namedEntityObserverBlock;
    v4->_id namedEntityObserverBlock = 0;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.handwritingd.LexiconManagerQueue", attr);
    lexiconQueue = v4->_lexiconQueue;
    v4->_lexiconQueue = (OS_dispatch_queue *)v8;

    v14 = objc_msgSend_stringWithFormat_(NSString, v10, @"handwritingd-transient-lexicon-%p", v11, v12, v13, v4);
    uint64_t v93 = *MEMORY[0x1E4F72460];
    uint64_t v15 = v93;
    v94[0] = v14;
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v94, (uint64_t)&v93, 1, v17);
    v4->_transientLexicon = (_LXLexicon *)LXLexiconCreateTransient();
    v23 = objc_msgSend_stringWithFormat_(NSString, v19, @"handwritingd-transient-lexicon-with_custom_entries-%p", v20, v21, v22, v4);
    uint64_t v91 = v15;
    v92 = v23;
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)&v92, (uint64_t)&v91, 1, v25);
    uint64_t Transient = LXLexiconCreateTransient();
    lastCustomLexiconEntries = v4->_lastCustomLexiconEntries;
    v4->_transientLexiconWithCustomEntries = (_LXLexicon *)Transient;
    v4->_lastCustomLexiconEntries = 0;

    v33 = objc_msgSend_stringWithFormat_(NSString, v29, @"handwritingd-transient-phrase-lexicon-%p", v30, v31, v32, v4);
    uint64_t v89 = v15;
    v90 = v33;
    v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v34, (uint64_t)&v90, (uint64_t)&v89, 1, v35);
    v4->_transientPhraseLexicon = (_LXLexicon *)LXLexiconCreateTransient();
    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    textReplacements = v4->_textReplacements;
    v4->_textReplacements = v37;

    id location = 0;
    p_id location = &location;
    uint64_t v82 = 0x2050000000;
    id v39 = (id)qword_1EA3C91A8;
    uint64_t v83 = qword_1EA3C91A8;
    if (!qword_1EA3C91A8)
    {
      uint64_t v84 = MEMORY[0x1E4F143A8];
      uint64_t v85 = 3221225472;
      v86 = sub_1C4A2674C;
      v87 = &unk_1E64E1A88;
      v88 = &location;
      sub_1C4A2674C((uint64_t)&v84);
      id v39 = p_location[3];
    }
    v40 = (objc_class *)v39;
    _Block_object_dispose(&location, 8);
    v41 = (_KSTextReplacementClientStore *)objc_alloc_init(v40);
    textReplacementStore = v4->_textReplacementStore;
    v4->_textReplacementStore = v41;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id location = 0;
    p_id location = &location;
    uint64_t v82 = 0x2020000000;
    v44 = (CFStringRef *)qword_1EA3C91B8;
    uint64_t v83 = qword_1EA3C91B8;
    if (!qword_1EA3C91B8)
    {
      uint64_t v84 = MEMORY[0x1E4F143A8];
      uint64_t v85 = 3221225472;
      v86 = sub_1C4A26914;
      v87 = &unk_1E64E1A88;
      v88 = &location;
      sub_1C4A26914((uint64_t)&v84);
      v44 = (CFStringRef *)p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (v44)
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_1C4A242A8, *v44, 0, (CFNotificationSuspensionBehavior)0);
      sub_1C4A242B0(v4);
      v4->_vocabulary = (void *)LMVocabularyCreate();
      v45 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      addressBook = v4->_addressBook;
      v4->_addressBook = v45;

      if (!v4->_contactsObserverBlock)
      {
        objc_initWeak(&location, v4);
        uint64_t v84 = MEMORY[0x1E4F143A8];
        uint64_t v85 = 3221225472;
        v86 = sub_1C4A24E5C;
        v87 = &unk_1E64E2818;
        objc_copyWeak((id *)&v88, &location);
        uint64_t v47 = MEMORY[0x1C8786E90](&v84);
        id v48 = v4->_contactsObserverBlock;
        v4->_id contactsObserverBlock = (id)v47;

        objc_destroyWeak((id *)&v88);
        objc_destroyWeak(&location);
      }
      v2 = &qword_1EA3CA000;
      if (qword_1EA3CA000 == -1)
      {
LABEL_10:
        v49 = (id)qword_1EA3C9FB0;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(location) = 0;
          _os_log_impl(&dword_1C492D000, v49, OS_LOG_TYPE_DEBUG, "Adding contact update observer", (uint8_t *)&location, 2u);
        }

        id v50 = sub_1C4A25118();
        v56 = objc_msgSend_sharedManager(v50, v51, v52, v53, v54, v55);
        id v61 = (id)objc_msgSend_addContactObserver_(v56, v57, (uint64_t)v4->_contactsObserverBlock, v58, v59, v60);

        if (!v4->_namedEntityObserverBlock)
        {
          objc_initWeak(&location, v4);
          uint64_t v84 = MEMORY[0x1E4F143A8];
          uint64_t v85 = 3221225472;
          v86 = sub_1C4A255BC;
          v87 = &unk_1E64E1E78;
          objc_copyWeak((id *)&v88, &location);
          uint64_t v62 = MEMORY[0x1C8786E90](&v84);
          id v63 = v4->_namedEntityObserverBlock;
          v4->_id namedEntityObserverBlock = (id)v62;

          objc_destroyWeak((id *)&v88);
          objc_destroyWeak(&location);
        }
        if (*v2 == -1)
        {
          v64 = (id)qword_1EA3C9FB0;
          if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
LABEL_17:

            id v65 = sub_1C4A25118();
            v71 = objc_msgSend_sharedManager(v65, v66, v67, v68, v69, v70);
            id v76 = (id)objc_msgSend_addNamedEntitiesUpdateObserver_(v71, v72, (uint64_t)v4->_namedEntityObserverBlock, v73, v74, v75);

            return v4;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          v64 = (id)qword_1EA3C9FB0;
          if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_17;
          }
        }
        LOWORD(location) = 0;
        _os_log_impl(&dword_1C492D000, v64, OS_LOG_TYPE_DEBUG, "Adding named entity lexicon update observer", (uint8_t *)&location, 2u);
        goto LABEL_17;
      }
    }
    else
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    goto LABEL_10;
  }
  return v4;
}

- (void)dealloc
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4A244E4;
  v9[3] = &unk_1E64E0D48;
  v9[4] = self;
  v3 = (void (**)(void))MEMORY[0x1C8786E90](v9, a2);
  label = dispatch_queue_get_label(0);
  if (!strcmp(label, "com.apple.handwritingd.LexiconManagerQueue")
    || (lexiconQueue = self->_lexiconQueue) == 0)
  {
    v3[2](v3);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4A24768;
    block[3] = &unk_1E64E11B8;
    dispatch_queue_t v8 = v3;
    dispatch_sync(lexiconQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)CHInputContextLexiconManager;
  [(CHInputContextLexiconManager *)&v6 dealloc];
}

- (OS_dispatch_queue)lexiconQueue
{
  return self->_lexiconQueue;
}

- (NSDictionary)textReplacements
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1C4A24CBC;
  v10 = sub_1C4A24CCC;
  id v11 = 0;
  lexiconQueue = self->_lexiconQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4A24CD4;
  v5[3] = &unk_1E64E1168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lexiconQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (NSArray)addressBookLexicon
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1C4A24CBC;
  v10 = sub_1C4A24CCC;
  id v11 = 0;
  lexiconQueue = self->_lexiconQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4A24E10;
  v5[3] = &unk_1E64E1168;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lexiconQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (_LXLexicon)transientLexiconWithCustomEntries:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_transientLexiconWithCustomEntries)
  {
    id v10 = v4;
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v11 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_FAULT, "Transient lexicon with custom entries must be non-nil", buf, 2u);
    }

    id v4 = v10;
  }
  uint64_t v35 = v4;
  if (!objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    transientLexicon = self->_transientLexicon;
    goto LABEL_27;
  }
  if (objc_msgSend_isEqualToSet_(v35, v12, (uint64_t)self->_lastCustomLexiconEntries, v13, v14, v15)) {
    goto LABEL_25;
  }
  uint64_t v21 = (NSSet *)objc_msgSend_copy(v35, v16, v17, v18, v19, v20);
  lastCustomLexiconEntries = self->_lastCustomLexiconEntries;
  self->_lastCustomLexiconEntries = v21;

  LXLexiconClear();
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = sub_1C4A25540;
  v43 = &unk_1E64E2840;
  v44 = self;
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v24 = v35;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v36, (uint64_t)v46, 16, v26);
  if (!v27) {
    goto LABEL_24;
  }
  uint64_t v28 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v37 != v28) {
        objc_enumerationMutation(v24);
      }
      if (!LXLexiconAdd())
      {
        if (qword_1EA3CA000 == -1)
        {
          uint64_t v32 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          uint64_t v32 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
LABEL_20:
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_ERROR, "A token ID should be assigned when adding to the lexicon. Skipping lexicon entry.", buf, 2u);
          }
        }

        continue;
      }
      LXLexiconIncrementUsageCount();
      LXLexiconSetUserBitfield();
    }
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v30, (uint64_t)&v36, (uint64_t)v46, 16, v31);
  }
  while (v27);
LABEL_24:

LABEL_25:
  transientLexicon = self->_transientLexiconWithCustomEntries;
LABEL_27:

  return transientLexicon;
}

- (_LXLexicon)transientLexicon
{
  return self->_transientLexicon;
}

- (_LXLexicon)transientPhraseLexicon
{
  return self->_transientPhraseLexicon;
}

- (void)vocabulary
{
  return self->_vocabulary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCustomLexiconEntries, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
  objc_storeStrong((id *)&self->_textReplacementStore, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_recognitionProcessingQueue, 0);
  objc_storeStrong(&self->_namedEntityObserverBlock, 0);
  objc_storeStrong(&self->_contactsObserverBlock, 0);
  objc_storeStrong((id *)&self->_lexiconQueue, 0);
}

@end