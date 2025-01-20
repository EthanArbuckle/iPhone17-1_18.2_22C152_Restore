@interface NSError
- (BOOL)cls_isConstraintViolation;
- (BOOL)cls_isDatabaseCorruptionError;
- (id)cls_underlyingSQLiteError;
@end

@implementation NSError

- (id)cls_underlyingSQLiteError
{
  return [(NSError *)self cls_underlyingErrorWithDomain:@"com.apple.SQLite"];
}

- (BOOL)cls_isDatabaseCorruptionError
{
  v3 = [(NSError *)self domain];
  if ([v3 isEqualToString:@"com.apple.SQLite"]) {
    BOOL v4 = (id)[(NSError *)self code] == (id)11;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)cls_isConstraintViolation
{
  v3 = [(NSError *)self domain];
  if ([v3 isEqualToString:@"com.apple.SQLite"])
  {
    NSInteger v4 = [(NSError *)self code];

    if (v4 == 19) {
      return 1;
    }
  }
  else
  {
  }
  v6 = [(NSError *)self userInfo];
  v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v7) {
    unsigned __int8 v5 = objc_msgSend(v7, "cls_isConstraintViolation");
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end