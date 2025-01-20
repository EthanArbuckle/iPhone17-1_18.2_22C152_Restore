@interface BCSMeCardParser
+ (id)parseString:(id)a3;
@end

@implementation BCSMeCardParser

+ (id)parseString:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4) {
    +[BCSMeCardParser parseString:].cold.6(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ((unint64_t)[v3 length] <= 6)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v12) {
      +[BCSMeCardParser parseString:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_13:
    v31 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v3, "_bcs_hasCaseInsensitivePrefix:", @"MECARD:") & 1) == 0)
  {
    BOOL v32 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v32) {
      +[BCSMeCardParser parseString:].cold.5(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_13;
  }
  v20 = [getCNContactVCardSerializationClass() contactsWithMECARDString:v3 error:0];
  if ([v20 count])
  {
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v21) {
      +[BCSMeCardParser parseString:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
    v29 = [BCSContactData alloc];
    v30 = [v20 firstObject];
    v31 = [(BCSContactData *)v29 initWithContact:v30];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BCSMeCardParser parseString:]();
    }
    v31 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:2 invalidContents:v3];
  }

LABEL_18:
  return v31;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSMeCardParser: Failed to parse contact from MECARD string", v0, 2u);
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(void *)a3 .cold.4(void *a1, uint64_t a2, void *a3)
{
  id v4 = objc_begin_catch(a1);
  *a3 = v4;
  id v5 = v4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSMeCardParser: Failed to parse contact from MECARD string", v6, 2u);
  }
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end