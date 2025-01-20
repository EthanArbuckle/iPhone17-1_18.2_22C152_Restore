@interface BCSCalendarEventParser
+ (id)_validatedICSString:(id)a3;
+ (id)parseString:(id)a3;
@end

@implementation BCSCalendarEventParser

+ (id)parseString:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v5) {
    +[BCSCalendarEventParser parseString:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = v4;
  if (objc_msgSend(v13, "_bcs_hasCaseInsensitivePrefix:", @"BEGIN:VEVENT"))
  {
    v14 = [NSString stringWithFormat:@"BEGIN:VCALENDAR\r\n%@\r\nEND:VCALENDAR", v13];

LABEL_6:
    v15 = [a1 _validatedICSString:v14];
    if ([v15 length]) {
      v16 = [[BCSCalendarEventData alloc] initWithICSString:v15];
    }
    else {
      v16 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:7 invalidContents:v13];
    }
    v17 = v16;

    goto LABEL_13;
  }
  v14 = v13;
  if (objc_msgSend(v13, "_bcs_hasCaseInsensitivePrefix:", @"BEGIN:VCALENDAR")) {
    goto LABEL_6;
  }
  BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v18) {
    +[BCSCalendarEventParser parseString:](v18, v19, v20, v21, v22, v23, v24, v25);
  }
  v17 = 0;
  v14 = v13;
LABEL_13:

  return v17;
}

+ (id)_validatedICSString:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)getICSDocumentClass()) initWithICSString:v3 options:0 error:0];
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 calendar];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v8 = objc_msgSend(v6, "components", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v55;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
          getICSEventClass();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v58 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        BOOL v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v23) {
          +[BCSCalendarEventParser _validatedICSString:].cold.4(v23, v24, v25, v26, v27, v28, v29, v30);
        }
        id v31 = v13;

        if (v31)
        {
          v32 = [v7 components];
          uint64_t v33 = [v32 count];

          if (v33 == 1)
          {
            id v34 = v3;
          }
          else
          {
            v51 = [v7 components];
            [v51 removeAllObjects];

            v52 = [v7 components];
            [v52 addObject:v31];

            id v34 = [v7 ICSStringWithOptions:0];
          }
          uint64_t v22 = v34;

          goto LABEL_27;
        }
      }
      else
      {
LABEL_11:
      }
      BOOL v35 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v35) {
        +[BCSCalendarEventParser _validatedICSString:](v35, v36, v37, v38, v39, v40, v41, v42);
      }
    }
    else
    {
      BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v43) {
        +[BCSCalendarEventParser _validatedICSString:](v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    uint64_t v22 = 0;
LABEL_27:
  }
  else
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v14) {
      +[BCSCalendarEventParser _validatedICSString:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v22 = 0;
  }

  return v22;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validatedICSString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end