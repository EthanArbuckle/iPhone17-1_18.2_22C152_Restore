@interface NSString(MFStringTransform)
- (__CFString)mf_applyTransform:()MFStringTransform;
@end

@implementation NSString(MFStringTransform)

- (__CFString)mf_applyTransform:()MFStringTransform
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || !*((void *)v4 + 1))
  {
LABEL_8:
    v7 = a1;
    goto LABEL_9;
  }
  if ([a1 length])
  {
    if ((unint64_t)[a1 length] < 0xF4241)
    {
      v9 = (void *)MEMORY[0x1B3E87F20]();
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__NSString_MFStringTransform__mf_applyTransform___block_invoke;
      v13[3] = &unk_1E5F89AD8;
      id v14 = v5;
      uint64_t v10 = withMutableCharactersAndPadding(a1, v13);
      v11 = (void *)v10;
      if (v10) {
        v12 = (void *)v10;
      }
      else {
        v12 = a1;
      }
      v7 = v12;

      goto LABEL_9;
    }
    v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSString(MFStringTransform) mf_applyTransform:]();
    }

    goto LABEL_8;
  }
  v7 = &stru_1F08428B0;
LABEL_9:

  return v7;
}

- (void)mf_applyTransform:()MFStringTransform .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1AFB03000, v0, v1, "MFStringTransform: Stripping code points: input length out of bounds.", v2, v3, v4, v5, v6);
}

@end