@interface _DKChangeSet(CoreData)
@end

@implementation _DKChangeSet(CoreData)

- (void)initWithManagedObject:()CoreData .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Dropping change set due to previous error.", v1, 2u);
}

- (void)initWithManagedObject:()CoreData .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 version];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Dropping change set, unknown version number: %@", (uint8_t *)&v4, 0xCu);
}

+ (void)dataFromCompressedChangeSet:()CoreData .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Unable to decode change set due to invalid data", v1, 2u);
}

+ (void)dataFromCompressedChangeSet:()CoreData .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = [NSNumber numberWithUnsignedLong:a1];
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:-[_DKPRCompressedChangeSet uncompressedLength](a2)];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "Change set uncompressed size %@ does not match uncompressed length %@", (uint8_t *)&v7, 0x16u);
}

@end