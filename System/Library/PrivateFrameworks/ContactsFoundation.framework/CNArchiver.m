@interface CNArchiver
+ (id)decodeObjectOfClass:(Class)a3 associatedClasses:(id)a4 data:(id)a5 error:(id *)a6;
+ (id)decodeObjectOfClass:(Class)a3 data:(id)a4 error:(id *)a5;
+ (id)encodeObject:(id)a3 error:(id *)a4;
+ (id)os_log;
@end

@implementation CNArchiver

+ (id)os_log
{
  if (os_log_cn_once_token_1_12 != -1) {
    dispatch_once(&os_log_cn_once_token_1_12, &__block_literal_global_63);
  }
  v2 = (void *)os_log_cn_once_object_1_12;

  return v2;
}

uint64_t __20__CNArchiver_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "archiver");
  uint64_t v1 = os_log_cn_once_object_1_12;
  os_log_cn_once_object_1_12 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)decodeObjectOfClass:(Class)a3 data:(id)a4 error:(id *)a5
{
  return (id)[a1 decodeObjectOfClass:a3 associatedClasses:MEMORY[0x1E4F1CBF0] data:a4 error:a5];
}

+ (id)decodeObjectOfClass:(Class)a3 associatedClasses:(id)a4 data:(id)a5 error:(id *)a6
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v9 = a5;
  v46[0] = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:v46];
  id v11 = v46[0];
  if (v10)
  {
    v12 = [MEMORY[0x1E4F1CA80] setWithArray:v44];
    [v12 addObject:a3];
    uint64_t v13 = *MEMORY[0x1E4F284E8];
    id v45 = v11;
    v14 = [v10 decodeTopLevelObjectOfClasses:v12 forKey:v13 error:&v45];
    id v15 = v45;

    if (v14)
    {
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;
LABEL_22:

        id v11 = v15;
        [v10 finishDecoding];
        goto LABEL_23;
      }
      if ([v44 count])
      {
        v35 = objc_msgSend(v44, "_cn_map:", &__block_literal_global_9);
        v36 = [v35 componentsJoinedByString:@", "];

        v37 = (__CFString *)[[NSString alloc] initWithFormat:@"or %@, by association", v36];
      }
      else
      {
        v37 = @"no associated classes";
      }
      v38 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"The decoded object was of type %@, but an object of type %@ (%@) was expected", objc_opt_class(), a3, v37];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48[0] = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      v40 = +[CNFoundationError errorWithCode:6 userInfo:v39];
      v41 = v40;
      if (a6) {
        *a6 = v40;
      }
    }
    else
    {
      v26 = objc_msgSend(a1, "os_log");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:]((uint64_t)v15, v26, v27, v28, v29, v30, v31, v32);
      }

      v33 = +[CNFoundationError errorWithCode:6 underlyingError:v15];
      v34 = v33;
      if (a6) {
        *a6 = v33;
      }
    }
    id v16 = 0;
    goto LABEL_22;
  }
  v17 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:]((uint64_t)v11, v17, v18, v19, v20, v21, v22, v23);
  }

  v24 = +[CNFoundationError errorWithCode:6 underlyingError:v11];
  v25 = v24;
  if (a6) {
    *a6 = v24;
  }

  id v16 = 0;
LABEL_23:

  return v16;
}

NSString *__63__CNArchiver_decodeObjectOfClass_associatedClasses_data_error___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)decodeObjectOfClass:(uint64_t)a3 associatedClasses:(uint64_t)a4 data:(uint64_t)a5 error:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end