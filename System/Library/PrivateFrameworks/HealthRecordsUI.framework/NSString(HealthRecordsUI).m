@interface NSString(HealthRecordsUI)
- (id)removeSpecialCharactersAndWhiteSpaces;
- (id)stripHTML;
- (id)stripRTF;
- (id)stripRTFOrHTML;
- (void)stripHTML;
- (void)stripRTF;
@end

@implementation NSString(HealthRecordsUI)

- (id)removeSpecialCharactersAndWhiteSpaces
{
  v2 = [MEMORY[0x1E4F28E58] whitespaceCharacterSet];
  v3 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  v4 = objc_msgSend(a1, "hk_stringByRemovingCharactersInSet:", v2);

  return v4;
}

- (id)stripRTF
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (([a1 hasPrefix:@"{\\rtf"] & 1) == 0)
  {
    id v9 = a1;
    goto LABEL_10;
  }
  v2 = [a1 dataUsingEncoding:4];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = *MEMORY[0x1E4FB06D8];
  v13[0] = *MEMORY[0x1E4FB0750];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v11 = 0;
  v5 = (void *)[v3 initWithData:v2 options:v4 documentAttributes:0 error:&v11];
  id v6 = v11;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR))
    {
      -[NSString(HealthRecordsUI) stripRTF](v7);
      if (v5) {
        goto LABEL_5;
      }
LABEL_8:
      id v8 = a1;
      goto LABEL_9;
    }
  }
  if (!v5) {
    goto LABEL_8;
  }
LABEL_5:
  id v8 = [v5 string];
LABEL_9:
  id v9 = v8;

LABEL_10:
  return v9;
}

- (id)stripHTML
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 dataUsingEncoding:4];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = *MEMORY[0x1E4FB06D8];
  v13[0] = *MEMORY[0x1E4FB0708];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v11 = 0;
  v5 = (void *)[v3 initWithData:v2 options:v4 documentAttributes:0 error:&v11];
  id v6 = v11;

  if (v6
    && (_HKInitializeLogging(),
        v7 = (void *)*MEMORY[0x1E4F29F38],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)))
  {
    -[NSString(HealthRecordsUI) stripHTML](v7);
    if (v5) {
      goto LABEL_4;
    }
  }
  else if (v5)
  {
LABEL_4:
    id v8 = [v5 string];
    goto LABEL_7;
  }
  id v8 = a1;
LABEL_7:
  id v9 = v8;

  return v9;
}

- (id)stripRTFOrHTML
{
  if ([a1 hasPrefix:@"{\\rtf"]) {
    [a1 stripRTF];
  }
  else {
  v2 = [a1 stripHTML];
  }
  return v2;
}

- (void)stripRTF
{
  id v1 = a1;
  v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v3, v4, "NSString stripRTF: failed to create NSAttributedString from RTF: %{public}@. Error: %{public}@", v5, v6, v7, v8, v9);
}

- (void)stripHTML
{
  id v1 = a1;
  v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1C21A1000, v3, v4, "NSString stripHTML: failed to create NSAttributedString from HTML: %{public}@. Error: %{public}@", v5, v6, v7, v8, v9);
}

@end