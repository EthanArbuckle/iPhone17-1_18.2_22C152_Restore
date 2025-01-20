@interface BUZipFileWriter
+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7;
+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6;
- (BUZipFileWriter)initWithURL:(id)a3 error:(id *)a4;
- (BUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4;
- (BUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3;
- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4;
@end

@implementation BUZipFileWriter

- (BUZipFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  return (BUZipFileWriter *)MEMORY[0x270F9A6D0](self, sel_initWithURL_options_error_, a3);
}

- (BUZipFileWriter)initWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BUZipFileWriter;
  v9 = [(BUZipWriter *)&v23 initWithOptions:a4];
  if (v9)
  {
    objc_initWeak(&location, v9);
    v10 = [BUFileIOChannel alloc];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = sub_21E1DB734;
    v20 = &unk_26449DD38;
    objc_copyWeak(&v21, &location);
    uint64_t v12 = objc_msgSend_initForRandomWritingURL_error_cleanupHandler_(v10, v11, (uint64_t)v8, a5, &v17);
    writeChannel = v9->_writeChannel;
    v9->_writeChannel = (BURandomWriteChannel *)v12;

    v15 = v9->_writeChannel;
    if (v15)
    {
      objc_msgSend_setLowWater_(v15, v14, -1, v17, v18, v19, v20);
    }
    else
    {

      v9 = 0;
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (BUZipFileWriter)initWithZipFileArchive:(id)a3 error:(id *)a4
{
  return (BUZipFileWriter *)MEMORY[0x270F9A6D0](self, sel_initWithZipFileArchive_options_error_, a3);
}

- (BUZipFileWriter)initWithZipFileArchive:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v11 = objc_msgSend_URL(v8, v9, v10);
  uint64_t v45 = 0;
  v46 = (id *)&v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_21E1DBB08;
  v49 = sub_21E1DBB18;
  id v50 = 0;
  v44.receiver = self;
  v44.super_class = (Class)BUZipFileWriter;
  uint64_t v12 = [(BUZipWriter *)&v44 initWithOptions:a4];
  if (!v12)
  {
    v13 = 0;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = sub_21E1DBB20;
  v42[3] = &unk_26449DD60;
  v13 = v12;
  v43 = v13;
  objc_msgSend_enumerateEntriesUsingBlock_(v8, v14, (uint64_t)v42);
  uint64_t Entry = objc_msgSend_endOfLastEntry(v8, v15, v16);
  objc_msgSend_setEntryInsertionOffset_(v13, v18, Entry);
  objc_initWeak(&location, v13);
  v19 = [BUFileIOChannel alloc];
  v20 = v46;
  id obj = v46[5];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = sub_21E1DBB28;
  v38[3] = &unk_26449DD38;
  objc_copyWeak(&v39, &location);
  uint64_t v22 = objc_msgSend_initForRandomReadingWritingURL_error_cleanupHandler_(v19, v21, (uint64_t)v11, &obj, v38);
  objc_storeStrong(v20 + 5, obj);
  writeChannel = v13->_writeChannel;
  v13->_writeChannel = (BURandomWriteChannel *)v22;

  v25 = v13->_writeChannel;
  if (v25)
  {
    objc_msgSend_setLowWater_(v25, v24, -1);
    v26 = dispatch_group_create();
    dispatch_group_enter(v26);
    v27 = v13->_writeChannel;
    uint64_t v30 = objc_msgSend_endOfLastEntry(v8, v28, v29);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_21E1DBBAC;
    v35[3] = &unk_26449DD88;
    v37 = &v45;
    v31 = v26;
    v36 = v31;
    objc_msgSend_truncateToLength_completion_(v27, v32, v30, v35);
    dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v46[5])
  {

    v13 = 0;
  }
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  if (a5) {
LABEL_7:
  }
    *a5 = v46[5];
LABEL_8:
  v33 = v13;
  _Block_object_dispose(&v45, 8);

  return v33;
}

- (void)copyEntriesFromZipFileWriter:(id)a3 readingFromURL:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (objc_msgSend_isClosed(v10, v13, v14))
  {
    v15 = [BUZipFileArchive alloc];
    id v45 = 0;
    uint64_t v17 = objc_msgSend_initWithWriter_forReadingFromURL_options_error_(v15, v16, (uint64_t)v10, v11, a5, &v45);
    id v18 = v45;
    if (v17)
    {
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      id v19 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v22 = objc_msgSend_entriesCount(v17, v20, v21);
      v24 = objc_msgSend_initWithCapacity_(v19, v23, v22);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_21E1DBE90;
      v38[3] = &unk_26449DDB0;
      id v25 = v24;
      id v39 = v25;
      v40 = &v41;
      objc_msgSend_enumerateEntriesUsingBlock_(v17, v26, (uint64_t)v38);
      objc_msgSend_sortUsingComparator_(v25, v27, (uint64_t)&unk_26CF10AF8);
      uint64_t v29 = objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x263F08AB8], v28, v42[3]);
      objc_msgSend_copyRemainingEntries_fromArchive_progress_completionHandler_(self, v30, (uint64_t)v25, v17, v29, v12);

      _Block_object_dispose(&v41, 8);
    }
    else
    {
      uint64_t v34 = MEMORY[0x223C22A70](v12);
      v36 = (void (**)(void, void))v34;
      if (v34)
      {
        if (v18)
        {
          (*(void (**)(uint64_t, id))(v34 + 16))(v34, v18);
        }
        else
        {
          v37 = objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v35, 0);
          ((void (**)(void, void *))v36)[2](v36, v37);
        }
      }
    }
  }
  else
  {
    v32 = (void (**)(void, void))MEMORY[0x223C22A70](v12);
    if (v32)
    {
      v33 = objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v31, 0);
      ((void (**)(void, void *))v32)[2](v32, v33);
    }
  }
}

- (void)copyRemainingEntries:(id)a3 fromArchive:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_firstObject(v10, v14, v15);
  if (v17)
  {
    objc_msgSend_removeObjectAtIndex_(v10, v16, 0);
    uint64_t v21 = objc_msgSend_streamReadChannelForEntry_(v11, v18, (uint64_t)v17);
    if (v21)
    {
      uint64_t v22 = objc_msgSend_name(v17, v19, v20);
      id v25 = objc_msgSend_lastModificationDate(v17, v23, v24);
      uint64_t v36 = objc_msgSend_size(v17, v26, v27);
      unsigned int v35 = objc_msgSend_CRC(v17, v28, v29);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = sub_21E1DC178;
      v37[3] = &unk_26449DDF8;
      id v43 = v13;
      id v38 = v12;
      id v39 = v17;
      v40 = self;
      id v41 = v10;
      id v42 = v11;
      objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion_(self, v30, (uint64_t)v22, 0, v25, v36, v35, v21, v37);
    }
    else
    {
      v33 = (void (**)(void, void))MEMORY[0x223C22A70](v13);
      if (v33)
      {
        uint64_t v34 = objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v32, 0);
        ((void (**)(void, void *))v33)[2](v33, v34);
      }
    }
  }
  else
  {
    uint64_t v31 = MEMORY[0x223C22A70](v13);
    uint64_t v21 = (void *)v31;
    if (v31) {
      (*(void (**)(uint64_t, void))(v31 + 16))(v31, 0);
    }
  }
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  v4 = objc_msgSend_copy(a3, a2, (uint64_t)a3);
  id writeChannelCompletionHandler = self->_writeChannelCompletionHandler;
  self->_id writeChannelCompletionHandler = v4;

  writeChannel = self->_writeChannel;

  return writeChannel;
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E1DC378;
  v13[3] = &unk_26449DE20;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_zipDirectoryAtURL_customDirectoryFilename_toURL_queue_progressHandler_(a1, v12, (uint64_t)a3, 0, a4, a5, v13);
}

+ (void)zipDirectoryAtURL:(id)a3 customDirectoryFilename:(id)a4 toURL:(id)a5 queue:(id)a6 progressHandler:(id)a7
{
  v142[2] = *MEMORY[0x263EF8340];
  id v96 = a3;
  id v103 = a4;
  id v11 = a5;
  queue = a6;
  id v102 = a7;
  id v12 = [BUZipFileWriter alloc];
  id v139 = 0;
  v93 = v11;
  v104 = objc_msgSend_initWithURL_error_(v12, v13, (uint64_t)v11, &v139);
  id v14 = v139;
  v94 = v14;
  if (v104)
  {
    uint64_t v17 = objc_msgSend_path(v96, v15, v16);
    uint64_t v20 = v17;
    if (!v103)
    {
      uint64_t v21 = objc_msgSend_stringByDeletingLastPathComponent(v17, v18, v19);

      uint64_t v20 = (void *)v21;
    }
    uint64_t v22 = objc_msgSend_stringByStandardizingPath(v20, v18, v19);
    v92 = objc_msgSend_precomposedStringWithCanonicalMapping(v22, v23, v24);

    uint64_t v100 = objc_msgSend_length(v92, v25, v26);
    uint64_t v29 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v27, v28);
    uint64_t v30 = *MEMORY[0x263EFF6A8];
    uint64_t v31 = *MEMORY[0x263EFF688];
    v142[0] = *MEMORY[0x263EFF6A8];
    v142[1] = v31;
    uint64_t v105 = v31;
    v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v142, 2);
    unsigned int v35 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v29, v34, (uint64_t)v96, v33, 0, 0);

    v135[0] = 0;
    v135[1] = v135;
    v135[2] = 0x2020000000;
    v135[3] = 0;
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v37 = v35;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v131, v141, 16);
    if (v40)
    {
      uint64_t v106 = 0;
      uint64_t v41 = *(void *)v132;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v132 != v41) {
            objc_enumerationMutation(v37);
          }
          id v43 = *(void **)(*((void *)&v131 + 1) + 8 * i);
          id v130 = 0;
          int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v43, v39, (uint64_t)&v130, v30, 0);
          id v45 = v130;
          v48 = v45;
          if (ResourceValue_forKey_error && (objc_msgSend_BOOLValue(v45, v46, v47) & 1) == 0)
          {
            id v129 = 0;
            int v50 = objc_msgSend_getResourceValue_forKey_error_(v43, v49, (uint64_t)&v129, v105, 0);
            id v51 = v129;
            v54 = v51;
            if (v50) {
              v106 += objc_msgSend_unsignedLongLongValue(v51, v52, v53);
            }
            objc_msgSend_addObject_(v36, v52, (uint64_t)v43);
          }
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v39, (uint64_t)&v131, v141, 16);
      }
      while (v40);
    }
    else
    {
      uint64_t v106 = 0;
    }

    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x3032000000;
    v126 = sub_21E1DBB08;
    v127 = sub_21E1DBB18;
    id v128 = 0;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id obj = v36;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v119, v140, 16);
    if (v58)
    {
      uint64_t v99 = v100 + 1;
      uint64_t v101 = *(void *)v120;
      uint64_t v98 = *MEMORY[0x263EFF5F8];
      while (2)
      {
        uint64_t v61 = v58;
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v120 != v101) {
            objc_enumerationMutation(obj);
          }
          v63 = *(void **)(*((void *)&v119 + 1) + 8 * j);
          v64 = objc_msgSend_path(v63, v59, v60);
          v67 = objc_msgSend_stringByStandardizingPath(v64, v65, v66);
          v70 = objc_msgSend_precomposedStringWithCanonicalMapping(v67, v68, v69);

          v73 = objc_msgSend_substringFromIndex_(v70, v71, v99);
          if (v103)
          {
            uint64_t v74 = objc_msgSend_stringByAppendingPathComponent_(v103, v72, (uint64_t)v73);

            v73 = (void *)v74;
          }
          v75 = [BUFileIOChannel alloc];
          v76 = (id *)(v124 + 5);
          id v118 = (id)v124[5];
          v78 = objc_msgSend_initForReadingURL_error_(v75, v77, (uint64_t)v63, &v118);
          objc_storeStrong(v76, v118);
          if (!v78)
          {

            goto LABEL_35;
          }
          id v117 = 0;
          char v80 = objc_msgSend_getResourceValue_forKey_error_(v63, v79, (uint64_t)&v117, v105, 0);
          id v81 = v117;
          v83 = v81;
          if ((v80 & 1) == 0)
          {

            v83 = 0;
          }
          id v116 = 0;
          char v84 = objc_msgSend_getResourceValue_forKey_error_(v63, v82, (uint64_t)&v116, v98, 0);
          id v85 = v116;
          v88 = v85;
          if ((v84 & 1) == 0)
          {

            v88 = 0;
          }
          uint64_t v89 = objc_msgSend_unsignedLongLongValue(v83, v86, v87);
          v111[0] = MEMORY[0x263EF8330];
          v111[1] = 3221225472;
          v111[2] = sub_21E1DCB9C;
          v111[3] = &unk_26449DE48;
          v113 = v135;
          id v112 = v102;
          v114 = &v123;
          uint64_t v115 = v106;
          objc_msgSend_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler_(v104, v90, (uint64_t)v73, 0, v88, v89, 0, v78, v111);
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v119, v140, 16);
        if (v58) {
          continue;
        }
        break;
      }
    }
LABEL_35:

    v107[0] = MEMORY[0x263EF8330];
    v107[1] = 3221225472;
    v107[2] = sub_21E1DCC8C;
    v107[3] = &unk_26449DE70;
    id v108 = v102;
    v109 = &v123;
    uint64_t v110 = v106;
    objc_msgSend_closeWithQueue_completion_(v104, v91, (uint64_t)queue, v107);

    _Block_object_dispose(&v123, 8);
    _Block_object_dispose(v135, 8);

    v56 = v92;
  }
  else
  {
    v55 = v14;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1DCB58;
    block[3] = &unk_26449D6A0;
    id v138 = v102;
    id v137 = v55;
    dispatch_async(queue, block);

    v56 = v138;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeChannelCompletionHandler, 0);

  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end