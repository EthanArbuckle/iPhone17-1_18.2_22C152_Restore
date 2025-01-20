@interface BCSDocomoEmailParser
+ (id)parseString:(id)a3;
@end

@implementation BCSDocomoEmailParser

+ (id)parseString:(id)a3
{
  id v3 = a3;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v4) {
    +[BCSDocomoEmailParser parseString:].cold.8(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if ((unint64_t)[v3 length] > 6)
  {
    v21 = [v3 substringToIndex:7];
    v22 = [v21 lowercaseString];

    if (([v22 isEqualToString:@"matmsg:"] & 1) == 0)
    {
      BOOL v40 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v40) {
        +[BCSDocomoEmailParser parseString:].cold.7(v40, v41, v42, v43, v44, v45, v46, v47);
      }
      v20 = 0;
      goto LABEL_36;
    }
    v23 = [[BCSKeyValueParser alloc] initWithString:v3 startIndex:7];
    v24 = [(BCSKeyValueParser *)v23 keyValuePairs];
    v25 = [v24 objectForKeyedSubscript:@"TO"];
    v26 = objc_msgSend(v25, "_bcs_trimmedString");

    v27 = [v24 objectForKeyedSubscript:@"SUB"];
    v28 = [v24 objectForKeyedSubscript:@"BODY"];
    uint64_t v29 = [v27 length];
    uint64_t v30 = [v28 length];
    v31 = [MEMORY[0x263F089D8] stringWithString:@"mailto:"];
    if ([v26 length] && objc_msgSend(v26, "_bcs_looksLikeEmailAddress"))
    {
      [v31 appendString:v26];
      BOOL v32 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v32) {
        +[BCSDocomoEmailParser parseString:].cold.6(v32, v33, v34, v35, v36, v37, v38, v39);
      }
    }
    else if (!(v29 | v30))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BCSDocomoEmailParser parseString:].cold.5();
      }
      v20 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:3 invalidContents:v3];
      goto LABEL_35;
    }
    if (v29 | v30)
    {
      [v31 appendString:@"?"];
      if (v29)
      {
        v48 = objc_msgSend(v27, "_bcs_urlEncodedQueryValue");
        [v31 appendFormat:@"subject=%@", v48];

        BOOL v49 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v49)
        {
          +[BCSDocomoEmailParser parseString:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
          if (v30) {
            goto LABEL_20;
          }
        }
        else if (v30)
        {
LABEL_20:
          [v31 appendString:@"&"];
          goto LABEL_25;
        }
      }
      else if (v30)
      {
LABEL_25:
        v57 = objc_msgSend(v28, "_bcs_urlEncodedQueryValue");
        [v31 appendFormat:@"body=%@", v57];

        BOOL v58 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v58) {
          +[BCSDocomoEmailParser parseString:](v58, v59, v60, v61, v62, v63, v64, v65);
        }
      }
    }
    v66 = [NSURL URLWithString:v31];
    if (v66)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSDocomoEmailParser: Successfully converted matmsg data to mailto link", buf, 2u);
      }
      v67 = [[BCSParsedURLData alloc] initWithURL:v66 type:3];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        +[BCSDocomoEmailParser parseString:]();
      }
      v67 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:3 invalidContents:v3];
    }
    v20 = (BCSInvalidParsedData *)v67;

LABEL_35:
LABEL_36:

    goto LABEL_37;
  }
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v12) {
    +[BCSDocomoEmailParser parseString:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  v20 = 0;
LABEL_37:

  return v20;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSDocomoEmailParser: Converted mailto URL cannot be constructed", v0, 2u);
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:.cold.5()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSDocomoEmailParser: matmsg has no valid email address, subject, or body", v0, 2u);
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end