@interface _CKQuickImageComposition
+ (id)compositionWithMediaObject:(id)a3 subject:(id)a4;
- (BOOL)isSendAnimated;
@end

@implementation _CKQuickImageComposition

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
  v10 = [(CKComposition *)[_CKQuickImageComposition alloc] initWithText:v9 subject:v6];

  return v10;
}

- (BOOL)isSendAnimated
{
  return 0;
}

@end