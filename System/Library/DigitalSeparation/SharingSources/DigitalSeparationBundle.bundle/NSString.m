@interface NSString
- (BOOL)hmds_isEmail;
- (BOOL)hmds_isPhoneNumber;
@end

@implementation NSString

- (BOOL)hmds_isEmail
{
  if (qword_11DE0 != -1) {
    dispatch_once(&qword_11DE0, &stru_C700);
  }
  v3 = (void *)qword_11DD8;

  return [v3 evaluateWithObject:self];
}

- (BOOL)hmds_isPhoneNumber
{
  if (![(NSString *)self length]) {
    return 0;
  }
  v3 = +[NSMutableCharacterSet decimalDigitCharacterSet];
  [v3 addCharactersInString:@"+()-"];
  v4 = +[NSCharacterSet controlCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v5];

  v6 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];
  v7 = [v6 componentsJoinedByString:&stru_C8B0];

  BOOL v8 = [v7 length] == 0;
  return v8;
}

@end