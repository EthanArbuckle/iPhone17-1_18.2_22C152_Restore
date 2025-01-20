@interface KVProfileBuilder
+ (id)builderWithProfileInfo:(id)a3 format:(unsigned __int8)a4 error:(id *)a5;
+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 filename:(id)a5 format:(unsigned __int8)a6 error:(id *)a7;
+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 format:(unsigned __int8)a5 error:(id *)a6;
+ (void)initalize;
- (BOOL)_finishWithError:(id *)a3;
- (KVProfileBuilder)init;
- (KVProfileBuilder)initWithProfileInfo:(id)a3 outputStream:(id)a4 fileURL:(id)a5 format:(unsigned __int8)a6 provider:(id)a7 error:(id *)a8;
- (id)_buildWithError:(id *)a3;
- (id)_fileURL;
- (id)addDataset:(id)a3 error:(id *)a4;
- (id)buildWithError:(id *)a3;
- (id)finishWritingWithError:(id *)a3;
@end

@implementation KVProfileBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_activeDataset, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (id)_fileURL
{
  return self->_fileURL;
}

- (id)buildWithError:(id *)a3
{
  v7 = objc_msgSend__buildWithError_(self, a2, (uint64_t)a3, v3, v4, v5);
  if (v7)
  {
    v8 = [KVProfile alloc];
    v12 = objc_msgSend_initWithProfileData_error_(v8, v9, (uint64_t)v7, (uint64_t)a3, v10, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_buildWithError:(id *)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__finishWithError_(self, a2, (uint64_t)a3, v3, v4, v5))
  {
    fileURL = self->_fileURL;
    if (fileURL)
    {
      id v34 = 0;
      v13 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E4F1C9B8], v8, (uint64_t)fileURL, 8, (uint64_t)&v34, v11);
      id v18 = v34;
      if (!v13)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        v35[0] = *MEMORY[0x1E4F28568];
        v20 = objc_msgSend_stringWithFormat_(NSString, v14, @"Failed to load built profile from URL: %@", v15, v16, v17, self->_fileURL);
        v35[1] = *MEMORY[0x1E4F28A50];
        v36[0] = v20;
        v36[1] = v18;
        v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v36, (uint64_t)v35, 2, v22);
        v26 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v24, @"com.apple.koa.profile", 2, (uint64_t)v23, v25);
        v27 = v26;
        if (a3 && v26) {
          *a3 = v26;
        }
      }
    }
    else
    {
      v13 = objc_msgSend_propertyForKey_(self->_stream, v8, *MEMORY[0x1E4F1C4C0], v9, v10, v11);
    }
    objc_msgSend_close(self->_stream, v28, v29, v30, v31, v32);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)_finishWithError:(id *)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!self->_writer)
  {
LABEL_11:
    LOBYTE(v9) = 0;
    return v9;
  }
  activeDataset = self->_activeDataset;
  if (activeDataset)
  {
    int v9 = objc_msgSend__finishWithError_(activeDataset, a2, (uint64_t)a3, v3, v4, v5);
    if (!v9) {
      return v9;
    }
  }
  unsigned int datasetCount = self->_datasetCount;
  if (datasetCount != objc_msgSend_datasetCount(self->_profileInfo, a2, (uint64_t)a3, v3, v4, v5))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    id v18 = NSString;
    uint64_t v19 = objc_msgSend_datasetCount(self->_profileInfo, v11, v12, v13, v14, v15);
    v24 = objc_msgSend_stringWithFormat_(v18, v20, @"Expected %u datasets but %u were added.", v21, v22, v23, v19, self->_datasetCount);
    v34[0] = v24;
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v34, (uint64_t)&v33, 1, v26);
    uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v28, @"com.apple.koa.profile", 9, (uint64_t)v27, v29);
    uint64_t v31 = v30;
    if (a3 && v30) {
      *a3 = v30;
    }

    goto LABEL_11;
  }
  int v9 = objc_msgSend_finishProfile_(self->_writer, v11, (uint64_t)a3, v13, v14, v15);
  if (v9)
  {
    writer = self->_writer;
    self->_writer = 0;

    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)addDataset:(id)a3 error:(id *)a4
{
  id v10 = a3;
  if (self->_writer
    && ((activeDataset = self->_activeDataset) == 0
     || (objc_msgSend__finishWithError_(activeDataset, v6, (uint64_t)a4, v7, v8, v9) & 1) != 0)
    && (uint64_t v12 = [KVDatasetBuilder alloc],
        uint64_t v15 = (KVDatasetBuilder *)objc_msgSend_initWithDatasetInfo_writer_error_(v12, v13, (uint64_t)v10, (uint64_t)self->_writer, (uint64_t)a4, v14), v16 = self->_activeDataset, self->_activeDataset = v15, v16, (v17 = self->_activeDataset) != 0))
  {
    ++self->_datasetCount;
    id v18 = v17;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (KVProfileBuilder)initWithProfileInfo:(id)a3 outputStream:(id)a4 fileURL:(id)a5 format:(unsigned __int8)a6 provider:(id)a7 error:(id *)a8
{
  uint64_t v10 = a6;
  v103[1] = *MEMORY[0x1E4F143B8];
  id v94 = a3;
  id v95 = a4;
  id v96 = a5;
  id v15 = a7;
  v97.receiver = self;
  v97.super_class = (Class)KVProfileBuilder;
  uint64_t v16 = [(KVProfileBuilder *)&v97 init];
  uint64_t v22 = v16;
  uint64_t v23 = v16;
  if (!v16) {
    goto LABEL_10;
  }
  if ((v10 - 1) >= 3)
  {
    v58 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v102 = *MEMORY[0x1E4F28568];
    v59 = NSString;
    v60 = sub_1BC3C2E48(v10, v17, v18, v19, v20, v21);
    v65 = objc_msgSend_stringWithFormat_(v59, v61, @"Unrecognized format: %@", v62, v63, v64, v60);
    v103[0] = v65;
    v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v66, (uint64_t)v103, (uint64_t)&v102, 1, v67);
    v71 = objc_msgSend_errorWithDomain_code_userInfo_(v58, v69, @"com.apple.koa.profile", 3, (uint64_t)v68, v70);
    v72 = v71;
    if (a8 && v71) {
      *a8 = v71;
    }
    goto LABEL_14;
  }
  p_profileInfo = (uint64_t *)&v16->_profileInfo;
  objc_storeStrong((id *)&v16->_profileInfo, a3);
  if (!*p_profileInfo)
  {
    uint64_t v31 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v31 = (void *)*p_profileInfo;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v32 = objc_msgSend_buffer(v31, v25, v29, v26, v27, v28);
  BOOL v38 = objc_msgSend_length(v32, v33, v34, v35, v36, v37) == 0;

  if (v38)
  {
    uint64_t v31 = (void *)*p_profileInfo;
LABEL_17:
    v73 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v100 = *MEMORY[0x1E4F28568];
    v74 = objc_msgSend_stringWithFormat_(NSString, v25, @"Invalid ProfileInfo: %@", v26, v27, v28, v31);
    v101 = v74;
    v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v75, (uint64_t)&v101, (uint64_t)&v100, 1, v76);
    v80 = objc_msgSend_errorWithDomain_code_userInfo_(v73, v78, @"com.apple.koa.profile", 5, (uint64_t)v77, v79);
    v81 = v80;
    if (a8 && v80) {
      *a8 = v80;
    }

    goto LABEL_21;
  }
  p_stream = (void **)&v22->_stream;
  objc_storeStrong((id *)&v22->_stream, a4);
  if (objc_msgSend_streamStatus(v22->_stream, v40, v41, v42, v43, v44) != 2)
  {
    v83 = (void *)MEMORY[0x1E4F28C58];
    v98[0] = *MEMORY[0x1E4F28568];
    v60 = objc_msgSend_stringWithFormat_(NSString, v45, @"Output stream error: %@", v46, v47, v48, *p_stream);
    v99[0] = v60;
    v98[1] = *MEMORY[0x1E4F28A50];
    v65 = objc_msgSend_streamError(*p_stream, v84, v85, v86, v87, v88);
    v99[1] = v65;
    v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v89, (uint64_t)v99, (uint64_t)v98, 2, v90);
    v93 = objc_msgSend_errorWithDomain_code_userInfo_(v83, v91, @"com.apple.koa.profile", 4, (uint64_t)v68, v92);
    v72 = v93;
    if (a8 && v93) {
      *a8 = v93;
    }
LABEL_14:

LABEL_21:
    v57 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v22->_fileURL, a5);
  uint64_t v51 = objc_msgSend_profileWriterForFormat_outputStream_error_(v15, v49, v10, (uint64_t)v23->_stream, (uint64_t)a8, v50);
  writer = v23->_writer;
  v23->_writer = (KVProfileWriter *)v51;

  v56 = v23->_writer;
  if (!v56 || !objc_msgSend_startProfile_error_(v56, v53, *p_profileInfo, (uint64_t)a8, v54, v55)) {
    goto LABEL_21;
  }
  v23->_unsigned int datasetCount = 0;
LABEL_10:
  v57 = v23;
LABEL_22:

  return v57;
}

- (KVProfileBuilder)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)builderWithProfileInfo:(id)a3 format:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  uint64_t v13 = objc_msgSend_outputStreamToMemory(MEMORY[0x1E4F1CAA8], v8, v9, v10, v11, v12);
  objc_msgSend_open(v13, v14, v15, v16, v17, v18);
  id v19 = objc_alloc((Class)objc_opt_class());
  uint64_t v20 = objc_alloc_init(KVProfileWriterFactory);
  uint64_t v22 = objc_msgSend_initWithProfileInfo_outputStream_fileURL_format_provider_error_(v19, v21, (uint64_t)v7, (uint64_t)v13, 0, v6, v20, a5);

  return v22;
}

+ (void)initalize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

- (id)finishWritingWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (self->_fileURL)
  {
    if (objc_msgSend__finishWithError_(self, a2, (uint64_t)a3, v3, v4, v5))
    {
      uint64_t v13 = objc_msgSend__fileURL(self, v8, v9, v10, v11, v12);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Cannot finish writing with in-memory profile builder. use FileWriter class category to initialize builder.";
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v22, (uint64_t)&v21, 1, v5);
    uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, @"com.apple.koa.profile", 2, (uint64_t)v15, v17);
    id v19 = v18;
    if (a3 && v18) {
      *a3 = v18;
    }
  }
  uint64_t v13 = 0;
LABEL_9:
  return v13;
}

+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 format:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  uint64_t v17 = objc_msgSend_capturedTime(v9, v12, v13, v14, v15, v16);
  uint64_t v23 = v17;
  if ((v7 - 1) > 2) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = *((void *)&off_1E62AD020 + (v7 - 1));
  }
  objc_msgSend_timeIntervalSince1970(v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_stringWithFormat_(NSString, v26, @"vocabulary-profile-%llu.%@", v27, v28, v29, (unint64_t)(v25 * 1000.0), v24);
  uint64_t v32 = objc_msgSend_fileWriterWithProfileInfo_targetDirectory_filename_format_error_(v11, v31, (uint64_t)v9, (uint64_t)v10, (uint64_t)v30, v7, a6);

  return v32;
}

+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 filename:(id)a5 format:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  v64[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v60 = 0;
  uint64_t v19 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v14, v15, v16, v17, v18);
  double v25 = objc_msgSend_path(v12, v20, v21, v22, v23, v24);
  char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v19, v26, (uint64_t)v25, (uint64_t)&v60, v27, v28);

  if (isDirectory)
  {
    if (v60)
    {
      uint64_t v34 = objc_msgSend_URLByAppendingPathComponent_(v12, v30, (uint64_t)v13, v31, v32, v33);
      BOOL v38 = objc_msgSend_outputStreamWithURL_append_(MEMORY[0x1E4F1CAA8], v35, (uint64_t)v34, 0, v36, v37);
      objc_msgSend_open(v38, v39, v40, v41, v42, v43);
      id v44 = objc_alloc((Class)objc_opt_class());
      v45 = objc_alloc_init(KVProfileWriterFactory);
      uint64_t v47 = objc_msgSend_initWithProfileInfo_outputStream_fileURL_format_provider_error_(v44, v46, (uint64_t)v11, (uint64_t)v38, (uint64_t)v34, v8, v45, a7);
      goto LABEL_9;
    }
    uint64_t v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    uint64_t v34 = objc_msgSend_stringWithFormat_(NSString, v30, @"Target directory exists but is not a directory: %@", v31, v32, v33, v12);
    uint64_t v62 = v34;
    BOOL v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v55, (uint64_t)&v62, (uint64_t)&v61, 1, v56);
    objc_msgSend_errorWithDomain_code_userInfo_(v54, v57, @"com.apple.koa.profile", 1, (uint64_t)v38, v58);
    v53 = (KVProfileWriterFactory *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F28568];
    uint64_t v34 = objc_msgSend_stringWithFormat_(NSString, v30, @"No directory exists at target directory URL: %@", v31, v32, v33, v12);
    v64[0] = v34;
    BOOL v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v49, (uint64_t)v64, (uint64_t)&v63, 1, v50);
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v51, @"com.apple.koa.profile", 1, (uint64_t)v38, v52);
    v53 = (KVProfileWriterFactory *)objc_claimAutoreleasedReturnValue();
  }
  v45 = v53;
  uint64_t v47 = 0;
  if (a7 && v53)
  {
    v45 = v53;
    uint64_t v47 = 0;
    *a7 = v45;
  }
LABEL_9:

  return v47;
}

@end