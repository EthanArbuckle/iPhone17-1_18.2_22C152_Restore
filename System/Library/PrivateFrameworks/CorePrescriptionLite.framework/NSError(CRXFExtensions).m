@interface NSError(CRXFExtensions)
+ (__CFString)crxf_descriptionForErrorCode:()CRXFExtensions;
+ (id)crxf_errorWithCode:()CRXFExtensions file:line:userInfo:;
- (__CFString)crxf_errorToken;
@end

@implementation NSError(CRXFExtensions)

- (__CFString)crxf_errorToken
{
  unint64_t v1 = [a1 code];
  if (v1 > 0x30) {
    return @"UnknownError";
  }
  else {
    return off_2652E1A68[v1];
  }
}

+ (id)crxf_errorWithCode:()CRXFExtensions file:line:userInfo:
{
  v10 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a6];
  v11 = objc_msgSend(a1, "crxf_descriptionForErrorCode:", a3);
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08320]];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F07F80]];
  v12 = strrchr(a4, 47);
  if (v12) {
    v13 = v12 + 1;
  }
  else {
    v13 = a4;
  }
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", v13, a5);
  [v10 setObject:v14 forKeyedSubscript:@"sourceLocation"];
  v17.receiver = a1;
  v17.super_class = (Class)off_26FED1230;
  v15 = objc_msgSend(objc_msgSendSuper2(&v17, sel_alloc), "initWithDomain:code:userInfo:", @"com.apple.CorePrescription", a3, v10);

  return v15;
}

+ (__CFString)crxf_descriptionForErrorCode:()CRXFExtensions
{
  if (a3 > 0x30) {
    return @"Unknown error";
  }
  else {
    return off_2652E1BF0[a3];
  }
}

@end