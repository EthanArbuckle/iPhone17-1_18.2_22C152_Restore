@interface EKObject(Saving)
- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving;
- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:;
- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving;
- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:;
@end

@implementation EKObject(Saving)

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving
{
  uint64_t v4 = 0;
  return objc_msgSend(a1, "CUIKEditingContext_saveWithSpan:error:", a3, &v4);
}

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:
{
  return 0;
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving
{
  uint64_t v4 = 0;
  return objc_msgSend(a1, "CUIKEditingContext_removeWithSpan:error:", a3, &v4);
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:
{
  return 0;
}

@end