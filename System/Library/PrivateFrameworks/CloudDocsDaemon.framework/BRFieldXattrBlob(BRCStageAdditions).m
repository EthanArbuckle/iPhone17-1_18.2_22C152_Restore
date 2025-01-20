@interface BRFieldXattrBlob(BRCStageAdditions)
@end

@implementation BRFieldXattrBlob(BRCStageAdditions)

+ (void)loadXattrsFromURL:()BRCStageAdditions structuralBlob:contentBlob:localBlob:withMaximumSize:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = *__error();
  v7 = [a1 path];
  v8 = objc_msgSend(v7, "fp_prettyPath");
  v9[0] = 67109634;
  v9[1] = v6;
  __int16 v10 = 2112;
  v11 = v8;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] Failed with %d opening file at: %@%@", (uint8_t *)v9, 0x1Cu);
}

+ (void)loadXattrsFromFD:()BRCStageAdditions structuralBlob:contentBlob:localBlob:withMaximumSize:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: locBlobOut == NULL%@", (uint8_t *)&v2, 0xCu);
}

@end