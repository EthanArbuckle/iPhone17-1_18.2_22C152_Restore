@interface NSError(HDSQLiteDatabase)
- (BOOL)hd_isDatabaseCorruptionError;
- (BOOL)hd_isNotADatabaseError;
- (id)hd_failingSQLStatement;
- (uint64_t)hd_isConstraintViolation;
- (uint64_t)hd_sqliteExtendedErrorCode;
@end

@implementation NSError(HDSQLiteDatabase)

- (uint64_t)hd_sqliteExtendedErrorCode
{
  id v1 = a1;
  if (objc_msgSend(v1, "hk_isErrorInDomain:code:", @"com.apple.healthd.SQLite", 2))
  {
    v2 = [v1 userInfo];
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v1 = (id)v3;
  }
  v4 = [v1 domain];
  char v5 = [v4 isEqualToString:@"com.apple.SQLite"];

  if (v5)
  {
    v6 = [v1 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"extended_error_code"];

    if (v7) {
      uint64_t v8 = [v7 intValue];
    }
    else {
      uint64_t v8 = [v1 code];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)hd_isDatabaseCorruptionError
{
  return objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 11;
}

- (BOOL)hd_isNotADatabaseError
{
  return objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 26;
}

- (uint64_t)hd_isConstraintViolation
{
  if (objc_msgSend(a1, "hk_isHealthKitError") && objc_msgSend(a1, "code") == 400
    || objc_msgSend(a1, "hd_sqliteExtendedErrorCode") == 19)
  {
    return 1;
  }
  uint64_t v3 = [a1 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v4) {
    uint64_t v2 = objc_msgSend(v4, "hd_isConstraintViolation");
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)hd_failingSQLStatement
{
  id v1 = a1;
  if (objc_msgSend(v1, "hk_isErrorInDomain:code:", @"com.apple.healthd.SQLite", 2))
  {
    uint64_t v2 = [v1 userInfo];
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v1 = (id)v3;
  }
  v4 = [v1 domain];
  char v5 = [v4 isEqualToString:@"com.apple.SQLite"];

  if (v5)
  {
    v6 = [v1 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"sql_statement"];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end