@interface BCSVCardParser
+ (id)parseString:(id)a3;
@end

@implementation BCSVCardParser

+ (id)parseString:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4) {
    +[BCSVCardParser parseString:].cold.5(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ((unint64_t)[v3 length] <= 0xA)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v12) {
      +[BCSVCardParser parseString:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_13:
    v33 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v3, "_bcs_hasCaseInsensitivePrefix:", @"BEGIN:VCARD") & 1) == 0)
  {
    BOOL v34 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v34) {
      +[BCSVCardParser parseString:].cold.4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_13;
  }
  id CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
  v21 = [v3 dataUsingEncoding:4];
  v22 = [CNContactVCardSerializationClass contactsWithData:v21 error:0];

  if ([v22 count])
  {
    BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v23) {
      +[BCSVCardParser parseString:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
    v31 = [BCSContactData alloc];
    v32 = [v22 firstObject];
    v33 = [(BCSContactData *)v31 initWithContact:v32];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BCSVCardParser parseString:]();
    }
    v33 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:2 invalidContents:v3];
  }

LABEL_18:
  return v33;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSVCardParser: Failed to parse contact from vCard string", v0, 2u);
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end