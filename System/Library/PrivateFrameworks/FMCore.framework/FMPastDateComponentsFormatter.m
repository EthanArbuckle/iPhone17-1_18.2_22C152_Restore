@interface FMPastDateComponentsFormatter
- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4;
@end

@implementation FMPastDateComponentsFormatter

- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_27;
  }
  unint64_t v8 = [(NSDateComponentsFormatter *)self allowedUnits];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  do
  {
    v9 += v8 & 1;
    BOOL v10 = v8 > 1;
    v8 >>= 1;
  }
  while (v10);
  if (v9 == 1)
  {
    v11 = v6;
    int v23 = 0;
    if ([(NSDateComponentsFormatter *)self allowedUnits] == 128)
    {
      uint64_t v13 = [v11 second];
    }
    else if ([(NSDateComponentsFormatter *)self allowedUnits] == 64)
    {
      uint64_t v13 = [v11 minute];
    }
    else
    {
      if ([(NSDateComponentsFormatter *)self allowedUnits] != 32) {
        goto LABEL_21;
      }
      uint64_t v13 = [v11 hour];
    }
    if (v13 < 0)
    {
      [(NSDateComponentsFormatter *)self unitsStyle];
      [(NSDateComponentsFormatter *)self formattingContext];
      v15 = [(NSDateComponentsFormatter *)self calendar];
      v16 = [v15 locale];
      id v17 = [v16 localeIdentifier];
      [v17 UTF8String];
      ureldatefmt_open();

      int v18 = ureldatefmt_formatNumeric();
      int v23 = 0;
      id v19 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * (v18 + 1)];
      [v19 mutableBytes];
      [v19 length];
      ureldatefmt_formatNumeric();
      ureldatefmt_close();
      id v21 = [NSString alloc];
      id v22 = v19;
      v14 = (id)objc_msgSend(v21, "initWithCharacters:length:", objc_msgSend(v22, "mutableBytes"), v18);

      v12 = v14;
LABEL_25:

      goto LABEL_26;
    }
LABEL_21:
    v14 = LogCategory_Unspecified();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:]((uint64_t)v11, v14);
    }
    v12 = 0;
    goto LABEL_25;
  }
  if (v9)
  {
    v11 = LogCategory_Unspecified();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:](v11);
    }
    goto LABEL_15;
  }
LABEL_8:
  v11 = LogCategory_Unspecified();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[FMPastDateComponentsFormatter stringForObjectValue:withReferenceDate:](v11);
  }
LABEL_15:
  v12 = 0;
LABEL_26:

LABEL_27:
  return v12;
}

- (void)stringForObjectValue:(os_log_t)log withReferenceDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "FMPastDateComponentsFormatter called with without specifying allowedUnits!", v1, 2u);
}

- (void)stringForObjectValue:(os_log_t)log withReferenceDate:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "FMPastDateComponentsFormatter called with more than one allowedUnit specified!", v1, 2u);
}

- (void)stringForObjectValue:(uint64_t)a1 withReferenceDate:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "FMPastDateComponentsFormatter called with unsupported argument: %@", (uint8_t *)&v2, 0xCu);
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stringForObjectValue:(uint64_t)a3 withReferenceDate:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end