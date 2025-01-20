@interface NSMutableAttributedString(Helper)
- (void)ck_removeAttributesNotIn:()Helper;
@end

@implementation NSMutableAttributedString(Helper)

- (void)ck_removeAttributesNotIn:()Helper
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NSMutableAttributedString_Helper__ck_removeAttributesNotIn___block_invoke;
  v7[3] = &unk_1E5624018;
  id v8 = v4;
  v9 = a1;
  id v6 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
}

@end