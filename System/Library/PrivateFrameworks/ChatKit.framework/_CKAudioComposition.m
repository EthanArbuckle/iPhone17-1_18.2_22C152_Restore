@interface _CKAudioComposition
+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4;
- (BOOL)isAudioComposition;
- (BOOL)isSendAnimated;
- (_CKAudioComposition)initWithText:(id)a3 subject:(id)a4 powerLevels:(id)a5;
@end

@implementation _CKAudioComposition

- (_CKAudioComposition)initWithText:(id)a3 subject:(id)a4 powerLevels:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CKAudioComposition;
  v9 = [(CKComposition *)&v22 initWithText:a3 subject:a4];
  v10 = v9;
  if (v9)
  {
    v11 = [(CKComposition *)v9 mediaObjects];
    v12 = [v11 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 setPowerLevels:v8];
    }
    else
    {
      v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_CKAudioComposition initWithText:subject:powerLevels:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

  return v10;
}

- (BOOL)isAudioComposition
{
  return 1;
}

+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v12 = @"MediaObjectForTextAttachment";
    v13[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    v9 = (void *)[v8 initWithString:*MEMORY[0x1E4F6C110] attributes:v7];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(CKComposition *)[_CKAudioComposition alloc] initWithText:v9 subject:v6];

  return v10;
}

- (BOOL)isSendAnimated
{
  return 1;
}

- (void)initWithText:(uint64_t)a3 subject:(uint64_t)a4 powerLevels:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end