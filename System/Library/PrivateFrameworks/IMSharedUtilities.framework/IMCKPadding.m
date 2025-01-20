@interface IMCKPadding
+ (id)_randomDataWithLength:(int64_t)a3;
+ (id)paddingForMessageOfSize:(int64_t)a3;
+ (int64_t)_paddingForType:(int)a3 originalSize:(int64_t)a4 error:(__CFError *)a5;
@end

@implementation IMCKPadding

+ (id)_randomDataWithLength:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], a3, (void *)[v4 mutableBytes]))
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Failed to create random bytes", v7, 2u);
      }
    }

    return 0;
  }
  else
  {
    return v4;
  }
}

+ (int64_t)_paddingForType:(int)a3 originalSize:(int64_t)a4 error:(__CFError *)a5
{
  if (qword_1E94FEA00 != -1) {
    dispatch_once(&qword_1E94FEA00, &unk_1EF2BF940);
  }
  if (a3 == 3)
  {
    v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1E94FE9F8;
    if (off_1E94FE9F8)
    {
      int64_t v9 = a4;
      uint64_t v10 = 3;
      goto LABEL_11;
    }
    return 0;
  }
  if (a3 != 2)
  {
    v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1E94FE9F8;
    if (off_1E94FE9F8)
    {
      int64_t v9 = a4;
      uint64_t v10 = 1;
      goto LABEL_11;
    }
    return 0;
  }
  v8 = (uint64_t (*)(int64_t, uint64_t, __CFError **))off_1E94FE9F8;
  if (!off_1E94FE9F8) {
    return 0;
  }
  int64_t v9 = a4;
  uint64_t v10 = 2;
LABEL_11:

  return v8(v9, v10, a5);
}

+ (id)paddingForMessageOfSize:(int64_t)a3
{
  [(id)objc_opt_class() _paddingForType:2 originalSize:a3 error:0];
  uint64_t v3 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v3, sel__randomDataWithLength_);
}

@end