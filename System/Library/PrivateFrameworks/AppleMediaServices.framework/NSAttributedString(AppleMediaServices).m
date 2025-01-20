@interface NSAttributedString(AppleMediaServices)
- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices;
- (id)ams_replaceOccurrencesOfString:()AppleMediaServices withString:options:;
@end

@implementation NSAttributedString(AppleMediaServices)

- (id)ams_replaceAccountPatternWithUsername:()AppleMediaServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1EDCA7308;
  }
  v6 = [a1 string];
  uint64_t v7 = [v6 rangeOfString:0x1EDCC6868 options:1];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = a1;
  }
  else
  {
    v9 = [MEMORY[0x1E4F4F0E0] formattedUsernameFromUsername:v5];
    if (!v9)
    {
      v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = AMSLogKey();
        int v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "NSAttributedString+AppleMediaServices: [%{public}@] Failed to determine display username", (uint8_t *)&v14, 0xCu);
      }
      v9 = v5;
    }
    objc_msgSend(a1, "ams_replaceOccurrencesOfString:withString:options:", 0x1EDCC6868, v9, 1);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)ams_replaceOccurrencesOfString:()AppleMediaServices withString:options:
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[a1 mutableCopy];
  v11 = [a1 string];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __92__NSAttributedString_AppleMediaServices__ams_replaceOccurrencesOfString_withString_options___block_invoke;
  v19 = &unk_1E55A8828;
  id v20 = v10;
  id v21 = v8;
  id v12 = v8;
  id v13 = v10;
  objc_msgSend(v11, "ams_enumerateRangesOfString:options:usingBlock:", v9, a5 & 4, &v16);

  int v14 = objc_msgSend(v13, "copy", v16, v17, v18, v19);
  return v14;
}

@end