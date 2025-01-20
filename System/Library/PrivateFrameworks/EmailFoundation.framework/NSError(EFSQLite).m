@interface NSError(EFSQLite)
+ (id)ef_SQLiteErrorWithCode:()EFSQLite;
@end

@implementation NSError(EFSQLite)

+ (id)ef_SQLiteErrorWithCode:()EFSQLite
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (_registerSQLiteErrorDomainUserInfoValueProvider_onceToken != -1) {
    dispatch_once(&_registerSQLiteErrorDomainUserInfoValueProvider_onceToken, &__block_literal_global_162);
  }
  if (a3 < 0x100)
  {
    v7 = 0;
  }
  else
  {
    v10 = @"EFSQLiteExtendedErrorCodeKey";
    v5 = [NSNumber numberWithInt:a3];
    v11[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    v7 = (void *)v6;
  }
  v8 = (void *)[[a1 alloc] initWithDomain:@"EFSQLiteErrorDomain" code:a3 userInfo:v7];

  return v8;
}

@end