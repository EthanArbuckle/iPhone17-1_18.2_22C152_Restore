@interface CHTokenizedResult
+ (BOOL)supportsSecureCoding;
+ (id)loadFromFile:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTokenizedResult:(id)a3;
- (BOOL)isMinimalDrawingResult;
- (BOOL)isValid;
- (CHTokenizedResult)init;
- (CHTokenizedResult)initWithCoder:(id)a3;
- (CHTokenizedResult)initWithIsMinimalDrawingResult:(BOOL)a3;
- (NSIndexSet)strokeIndexes;
- (NSString)recognizerDebugDescription;
- (NSString)topTranscription;
- (double)score;
- (id)description;
- (id)writeToFile;
- (id)writeToFileInFolder:(id)a3 basename:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTokenizedResult

- (CHTokenizedResult)init
{
  return (CHTokenizedResult *)objc_msgSend_initWithIsMinimalDrawingResult_(self, a2, 0, v2, v3, v4);
}

- (CHTokenizedResult)initWithIsMinimalDrawingResult:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHTokenizedResult;
  result = [(CHTokenizedResult *)&v5 init];
  if (result) {
    result->_isMinimalDrawingResult = a3;
  }
  return result;
}

- (CHTokenizedResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_decodeBoolForKey_(v4, v5, @"isMinimalDrawingResult", v6, v7, v8);
  IsMinimalDrawingResult = (CHTokenizedResult *)objc_msgSend_initWithIsMinimalDrawingResult_(self, v10, v9, v11, v12, v13);

  return IsMinimalDrawingResult;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeBool_forKey_(a3, a2, self->_isMinimalDrawingResult, @"isMinimalDrawingResult", v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHTokenizedResult;
  uint64_t v2 = [(CHTokenizedResult *)&v4 description];
  return v2;
}

- (NSIndexSet)strokeIndexes
{
  return (NSIndexSet *)objc_msgSend_indexSet(MEMORY[0x1E4F28D60], a2, v2, v3, v4, v5);
}

- (NSString)topTranscription
{
  return (NSString *)&stru_1F20141C8;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isEqualToTokenizedResult:(id)a3
{
  uint64_t v4 = (CHTokenizedResult *)a3;
  v10 = v4;
  if (self == v4)
  {

    return 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_topTranscription(self, v5, v6, v7, v8, v9);
    v17 = objc_msgSend_topTranscription(v10, v12, v13, v14, v15, v16);
    char isEqualToString = objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20, v21);

    return isEqualToString;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTokenizedResult = objc_msgSend_isEqualToTokenizedResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_topTranscription(self, a2, v2, v3, v4, v5);
  unint64_t v12 = objc_msgSend_hash(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)writeToFile
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v4 = NSTemporaryDirectory();
  uint64_t v9 = objc_msgSend_fileURLWithPath_(v3, v5, (uint64_t)v4, v6, v7, v8);

  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v10, v11, @"dd-MM-yyyy-HH-mm-ss-SSS", v12, v13, v14);
  uint64_t v20 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v15, v16, v17, v18, v19);
  v26 = objc_msgSend_UUIDString(v20, v21, v22, v23, v24, v25);
  v31 = objc_msgSend_substringToIndex_(v26, v27, 4, v28, v29, v30);

  v37 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v32, v33, v34, v35, v36);
  v42 = objc_msgSend_stringFromDate_(v10, v38, (uint64_t)v37, v39, v40, v41);

  v47 = objc_msgSend_stringWithFormat_(NSString, v43, @"/result_%@-%@.dat", v44, v45, v46, v42, v31);
  v51 = objc_msgSend_writeToFileInFolder_basename_(self, v48, (uint64_t)v9, (uint64_t)v47, v49, v50);

  return v51;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v14 = objc_msgSend_absoluteString(v6, v9, v10, v11, v12, v13);
  char v19 = objc_msgSend_fileExistsAtPath_(v8, v15, (uint64_t)v14, v16, v17, v18);

  if (v19)
  {
    uint64_t v24 = 0;
LABEL_5:
    uint64_t v28 = objc_msgSend_URLByAppendingPathComponent_(v6, v20, (uint64_t)v7, v21, v22, v23);
    v31 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v29, (uint64_t)self, 1, 0, v30);
    id v54 = v24;
    objc_msgSend_writeToURL_options_error_(v31, v32, (uint64_t)v28, 1, (uint64_t)&v54, v33);
    id v27 = v54;

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v34 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = objc_msgSend_absoluteString(v28, v35, v36, v37, v38, v39);
      uint64_t v46 = objc_msgSend_description(v27, v41, v42, v43, v44, v45);
      *(_DWORD *)buf = 138412546;
      id v57 = v40;
      __int16 v58 = 2112;
      id v59 = v46;
      _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEFAULT, "TokenizedResult writeToFile saving drawing at URL %@, error = %@", buf, 0x16u);
    }
    if (v27)
    {
      v52 = 0;
    }
    else
    {
      v52 = objc_msgSend_absoluteString(v28, v47, v48, v49, v50, v51);
    }

    goto LABEL_18;
  }
  id v55 = 0;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v20, (uint64_t)v6, 1, 0, (uint64_t)&v55);
  id v26 = v55;
  id v27 = v26;
  if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
  {
    uint64_t v24 = v26;
    goto LABEL_5;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v28 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v6;
    __int16 v58 = 2112;
    id v59 = v27;
    _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_ERROR, "Drawing unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
  v52 = 0;
LABEL_18:

  return v52;
}

+ (id)loadFromFile:(id)a3
{
  id v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  id v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (BOOL)isMinimalDrawingResult
{
  return self->_isMinimalDrawingResult;
}

- (double)score
{
  return self->_score;
}

- (NSString)recognizerDebugDescription
{
  return self->_recognizerDebugDescription;
}

- (void).cxx_destruct
{
}

@end