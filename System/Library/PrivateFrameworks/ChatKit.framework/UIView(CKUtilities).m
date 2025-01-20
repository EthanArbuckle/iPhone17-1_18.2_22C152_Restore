@interface UIView(CKUtilities)
- (double)__ck_alignmentRectSizeForFrameSize:()CKUtilities;
- (double)__ck_frameSizeForAlignmentRectSize:()CKUtilities;
- (uint64_t)__ck_containsFirstResponder;
- (uint64_t)__ck_ensureMinimumTouchInsets;
- (void)__ck_makeEdgesEqualTo:()CKUtilities;
@end

@implementation UIView(CKUtilities)

- (uint64_t)__ck_containsFirstResponder
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a1 isFirstResponder]) {
    return 1;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = objc_msgSend(a1, "subviews", 0);
  uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "__ck_containsFirstResponder"))
        {
          uint64_t v2 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v2 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v2;
}

- (double)__ck_alignmentRectSizeForFrameSize:()CKUtilities
{
  objc_msgSend(a1, "alignmentRectForFrame:", 0.0, 0.0, a2, a3);
  return v3;
}

- (double)__ck_frameSizeForAlignmentRectSize:()CKUtilities
{
  objc_msgSend(a1, "frameForAlignmentRect:", 0.0, 0.0, a2, a3);
  return v3;
}

- (void)__ck_makeEdgesEqualTo:()CKUtilities
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = a3;
  v18 = [a1 leftAnchor];
  v17 = [v4 leftAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  v5 = [a1 rightAnchor];
  v6 = [v4 rightAnchor];
  long long v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  long long v8 = [a1 topAnchor];
  long long v9 = [v4 topAnchor];
  long long v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  v11 = [a1 bottomAnchor];
  uint64_t v12 = [v4 bottomAnchor];

  v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v15 activateConstraints:v14];
}

- (uint64_t)__ck_ensureMinimumTouchInsets
{
  [a1 bounds];

  return objc_msgSend(a1, "_setTouchInsets:");
}

@end