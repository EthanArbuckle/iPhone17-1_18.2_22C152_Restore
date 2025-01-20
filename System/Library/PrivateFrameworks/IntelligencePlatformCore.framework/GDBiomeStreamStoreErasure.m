@interface GDBiomeStreamStoreErasure
+ (BOOL)validateBookmark:(id)a3 publisher:(id)a4 error:(id *)a5;
+ (id)_createOrLookupStreamWithIdentifier:(id)a3;
+ (id)_streamWithIdentifier:(id)a3 error:(id *)a4;
+ (id)deletedEventTimestampsForStream:(id)a3 account:(id)a4 device:(id)a5 from:(id)a6 error:(id *)a7;
+ (id)iterateStream:(id)a3 device:(id)a4 account:(id)a5 bookmark:(id)a6 startTime:(id)a7 endTime:(id)a8 maxEvents:(id)a9 lastN:(id)a10 reversed:(BOOL)a11 body:(id)a12;
+ (id)publisherForStream:(id)a3 device:(id)a4 account:(id)a5 startTime:(id)a6 endTime:(id)a7 maxEvents:(id)a8 lastN:(id)a9 reversed:(BOOL)a10;
+ (void)clearCache;
+ (void)pruneStream:(id)a3 withReason:(unint64_t)a4;
@end

@implementation GDBiomeStreamStoreErasure

+ (void)clearCache
{
  sub_1C6E4C64C();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearCache(v5, v2, v3, v4);
}

+ (id)_streamWithIdentifier:(id)a3 error:(id *)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = BiomeLibrary();
  id v33 = 0;
  v8 = objc_msgSend_streamWithIdentifier_error_(v6, v7, (uint64_t)v5, (uint64_t)&v33);
  id v9 = v33;

  if (v8)
  {
    id v10 = 0;
    goto LABEL_22;
  }
  if (!sub_1C7919168())
  {
    id v10 = 0;
    v8 = 0;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_10;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  v11 = (void (*)(void))off_1EA4F60C8;
  v38 = off_1EA4F60C8;
  if (!off_1EA4F60C8)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C7919238;
    v34[3] = &unk_1E6537050;
    v34[4] = &v35;
    sub_1C7919238(v34);
    v11 = (void (*)(void))v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v11)
  {
    v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v12, v13, v14);
    v29 = objc_msgSend_stringWithUTF8String_(NSString, v27, (uint64_t)"id<BMIRootLibrary> _GDBiomeLibraryInternal(void)", v28);
    v30 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v26, v31, (uint64_t)v29, @"GDBiomeStreamStoreErasure.m", 30, @"%s", v30);

    __break(1u);
  }
  v15 = v11();
  id v32 = 0;
  v8 = objc_msgSend_streamWithIdentifier_error_(v15, v16, (uint64_t)v5, (uint64_t)&v32);
  id v10 = v32;

  if (a4)
  {
LABEL_10:
    if (!v8)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      v39[0] = @"libraryError";
      if (v9)
      {
        objc_msgSend_localizedDescription(v9, v17, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = &stru_1F220ACF8;
      }
      v40[0] = v21;
      v39[1] = @"internalError";
      if (v10)
      {
        objc_msgSend_localizedDescription(v10, v17, v18, v19);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = &stru_1F220ACF8;
      }
      v40[1] = v22;
      v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v40, (uint64_t)v39, 2);
      *a4 = (id)objc_msgSend_initWithDomain_code_userInfo_(v20, v24, *MEMORY[0x1E4F70628], 1, v23);

      if (v10) {
      if (v9)
      }

      v8 = 0;
    }
  }
LABEL_22:

  return v8;
}

+ (id)publisherForStream:(id)a3 device:(id)a4 account:(id)a5 startTime:(id)a6 endTime:(id)a7 maxEvents:(id)a8 lastN:(id)a9 reversed:(BOOL)a10
{
  id v61 = a3;
  id v59 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v60 = a9;
  context = (void *)MEMORY[0x1C87B9E80]();
  if (v16)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    objc_msgSend_doubleValue(v16, v20, v21, v22);
    v26 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v19, v23, v24, v25);
    if (v17)
    {
LABEL_3:
      id v27 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      objc_msgSend_doubleValue(v17, v28, v29, v30);
      v34 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v27, v31, v32, v33);
      goto LABEL_6;
    }
  }
  else
  {
    v26 = 0;
    if (v17) {
      goto LABEL_3;
    }
  }
  v34 = 0;
LABEL_6:
  id v35 = objc_alloc(MEMORY[0x1E4F503E8]);
  v36 = v18;
  uint64_t v40 = objc_msgSend_unsignedIntegerValue(v18, v37, v38, v39);
  uint64_t v44 = objc_msgSend_unsignedIntegerValue(v60, v41, v42, v43);
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v35, v45, (uint64_t)v26, (uint64_t)v34, v40, v44, a10);
  v49 = objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v47, (uint64_t)v61, v48);
  v52 = v49;
  if (v15)
  {
    v53 = v59;
    uint64_t v54 = objc_msgSend_publisherForAccount_device_withUseCase_options_(v49, v50, (uint64_t)v15, (uint64_t)v59, *MEMORY[0x1E4F4FAF8], started);
  }
  else
  {
    v53 = v59;
    if (v59) {
      objc_msgSend_publisherForDevice_withUseCase_options_(v49, v50, (uint64_t)v59, *MEMORY[0x1E4F4FAF8], started);
    }
    else {
    uint64_t v54 = objc_msgSend_publisherWithOptions_(v49, v50, (uint64_t)started, v51);
    }
  }
  v55 = (void *)v54;

  return v55;
}

+ (id)_createOrLookupStreamWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = sub_1C6E4C64C();
  id v11 = 0;
  v6 = objc_msgSend_getLibraryStreamWithIdentifier_error_(v4, v5, (uint64_t)v3, (uint64_t)&v11);
  id v7 = v11;

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = GDDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_1C6DE6000, v9, OS_LOG_TYPE_ERROR, "GDBiomeStreamStoreErasure: _streamWithIdentifier: failed to retrieve stream %@. Error: %@", buf, 0x16u);
    }
  }
  return v6;
}

+ (id)deletedEventTimestampsForStream:(id)a3 account:(id)a4 device:(id)a5 from:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = objc_opt_new();
  uint64_t v16 = (void *)MEMORY[0x1C87B9E80]();
  id v19 = objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v17, (uint64_t)v11, v18);
  v23 = objc_msgSend_dateByAddingTimeInterval_(v14, v20, v21, v22, -3600.0);

  id v24 = objc_alloc(MEMORY[0x1E4F503E8]);
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v24, v25, (uint64_t)v23, 0, 0, 0, 0);
  uint64_t v28 = *MEMORY[0x1E4F4FAF0];
  if (v12)
  {
    uint64_t v29 = objc_msgSend_tombstonePublisherWithUseCase_account_device_options_(v19, v26, v28, (uint64_t)v12, v13, started);
  }
  else
  {
    if (v13) {
      objc_msgSend_tombstonePublisherWithUseCase_device_options_(v19, v26, v28, (uint64_t)v13, started);
    }
    else {
    uint64_t v29 = objc_msgSend_tombstonePublisherWithUseCase_options_(v19, v26, v28, (uint64_t)started);
    }
  }
  uint64_t v30 = (void *)v29;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1C79195D4;
  v35[3] = &unk_1E6536E88;
  id v31 = v15;
  id v36 = v31;
  id v33 = (id)objc_msgSend_sinkWithCompletion_receiveInput_(v30, v32, (uint64_t)&unk_1F220AA78, (uint64_t)v35);

  return v31;
}

+ (BOOL)validateBookmark:(id)a3 publisher:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_msgSend_validateBookmarkNode_(v8, v9, (uint64_t)v7, v10);
    id v12 = v11;
    if (a5 && v11) {
      *a5 = v11;
    }
    LOBYTE(a5) = v12 == 0;
  }
  else if (a5)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F70628];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v15 = [NSString alloc];
    uint64_t v16 = objc_opt_class();
    id v19 = objc_msgSend_initWithFormat_(v15, v17, @"Bookmark of unexpected type: %@", v18, v16, v24);
    v25[0] = v19;
    uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v25, (uint64_t)&v24, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v22, v14, 15, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

+ (void)pruneStream:(id)a3 withReason:(unint64_t)a4
{
  id v15 = a3;
  id v7 = objc_msgSend__createOrLookupStreamWithIdentifier_(a1, v5, (uint64_t)v15, v6);
  id v8 = (void *)MEMORY[0x1C87B9E80]();
  id v12 = objc_msgSend_pruner(v7, v9, v10, v11);
  objc_msgSend_deleteEventsPassingTest_(v12, v13, (uint64_t)&unk_1F220AA58, v14);
}

+ (id)iterateStream:(id)a3 device:(id)a4 account:(id)a5 bookmark:(id)a6 startTime:(id)a7 endTime:(id)a8 maxEvents:(id)a9 lastN:(id)a10 reversed:(BOOL)a11 body:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1C7919B20;
  v50 = sub_1C7919B30;
  id v51 = 0;
  context = (void *)MEMORY[0x1C87B9E80]();
  id v26 = a1;
  uint64_t v40 = v21;
  uint64_t v42 = v18;
  uint64_t v27 = (uint64_t)v18;
  uint64_t v28 = v19;
  id v29 = v21;
  uint64_t v30 = v22;
  uint64_t v32 = objc_msgSend_publisherForStream_device_account_startTime_endTime_maxEvents_lastN_reversed_(v26, v31, (uint64_t)v17, v27, v19, v29, v22, v23, v24, a11);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1C7919B38;
  v45[3] = &unk_1E6536E18;
  v45[4] = &v46;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C7919B4C;
  v43[3] = &unk_1E6536E40;
  id v33 = v25;
  id v44 = v33;
  id v35 = (id)objc_msgSend_sinkWithBookmark_completion_receiveInput_(v32, v34, (uint64_t)v20, (uint64_t)v45, v43);

  id v36 = (id)v47[5];
  _Block_object_dispose(&v46, 8);

  return v36;
}

@end