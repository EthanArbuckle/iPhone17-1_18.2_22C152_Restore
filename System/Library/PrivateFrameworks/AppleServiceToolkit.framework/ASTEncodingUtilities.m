@interface ASTEncodingUtilities
+ (id)MD5ForFileHandle:(id)a3;
+ (id)SHA256HashForString:(id)a3;
+ (id)jsonSerializeObject:(id)a3 error:(id *)a4;
+ (id)parseJSONResponseWithData:(id)a3 error:(id *)a4;
@end

@implementation ASTEncodingUtilities

+ (id)parseJSONResponseWithData:(id)a3 error:(id *)a4
{
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:a4];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
  }

  return v4;
}

+ (id)jsonSerializeObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![MEMORY[0x263F08900] isValidJSONObject:v5]
    || ([MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:a4],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ASTEncodingUtilities jsonSerializeObject:error:]((uint64_t)v5, v7);
    }

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-4001 userInfo:0];
    }
    v6 = [MEMORY[0x263EFF8F8] data];
  }

  return v6;
}

+ (id)SHA256HashForString:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v8 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ASTEncodingUtilities SHA256HashForString:](v8);
    }
    goto LABEL_13;
  }
  *(_OWORD *)md = 0u;
  long long v13 = 0u;
  id v5 = v3;
  v6 = (const void *)[v5 UTF8String];
  uint64_t v7 = [v5 lengthOfBytesUsingEncoding:4];
  if ((unint64_t)(v7 - 0x80000000) <= 0xFFFFFFFF80000000)
  {
    v8 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ASTEncodingUtilities SHA256HashForString:v8];
    }
LABEL_13:

    v9 = 0;
    goto LABEL_14;
  }
  if (!v6)
  {
    v8 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ASTEncodingUtilities SHA256HashForString:](v8);
    }
    goto LABEL_13;
  }
  CC_SHA256(v6, v7, md);
  v9 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v9, "appendFormat:", @"%02X", md[i]);
LABEL_14:

  return v9;
}

+ (id)MD5ForFileHandle:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 offsetInFile];
  [v3 seekToFileOffset:0];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  do
  {
    id v5 = [v3 readDataOfLength:0x10000];
    uint64_t v6 = [v5 length];
    id v7 = v5;
    CC_MD5_Update(&c, (const void *)[v7 bytes], v6);
  }
  while (v6);
  [v3 seekToFileOffset:v4];
  CC_MD5_Final(md, &c);
  v8 = [MEMORY[0x263F089D8] stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", @"%02x", md[i]);

  return v8;
}

+ (void)jsonSerializeObject:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, " [INVALID_JSON_DATA] Bad json data: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)SHA256HashForString:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "SHA256HashForString: input string is nil", v1, 2u);
}

+ (void)SHA256HashForString:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "SHA256HashForString: Invalid stride length %lu for string %@", (uint8_t *)&v3, 0x16u);
}

+ (void)SHA256HashForString:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23CA80000, log, OS_LOG_TYPE_ERROR, "SHA256HashForString: C string is nil", v1, 2u);
}

+ (void)MD5ForFileHandle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "Exception occurred trying to determine MD5 for file: %@", (uint8_t *)&v2, 0xCu);
}

@end