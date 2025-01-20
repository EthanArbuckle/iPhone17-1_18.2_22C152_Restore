@interface UIScrollView(FMCoreUI)
- (BOOL)isContentLargerThanBounds;
- (uint64_t)centerContent;
- (uint64_t)centerContentIfNecessary;
- (uint64_t)centerContentWithOffset:()FMCoreUI animated:;
- (uint64_t)scrollSubviewToVisible:()FMCoreUI animated:;
@end

@implementation UIScrollView(FMCoreUI)

- (BOOL)isContentLargerThanBounds
{
  [a1 layoutIfNeeded];
  [a1 bounds];
  double v3 = v2;
  double v5 = v4;
  [a1 contentSize];
  return v7 > v5 || v6 > v3;
}

- (uint64_t)centerContentIfNecessary
{
  uint64_t result = [a1 isContentLargerThanBounds];
  if ((result & 1) == 0)
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
    return objc_msgSend(a1, "centerContentWithOffset:animated:", 0, v3, v4);
  }
  return result;
}

- (uint64_t)centerContent
{
  return objc_msgSend(a1, "centerContentWithOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (uint64_t)centerContentWithOffset:()FMCoreUI animated:
{
  [a1 layoutIfNeeded];
  [a1 contentSize];
  double v10 = v9;
  double v12 = v11 * 0.5;
  [a1 bounds];
  double v14 = v12 - v13 * 0.5;
  [a1 bounds];
  return objc_msgSend(a1, "setContentOffset:animated:", a5, v14 - a2, v10 * 0.5 - v15 * 0.5 - a3);
}

- (uint64_t)scrollSubviewToVisible:()FMCoreUI animated:
{
  id v6 = a3;
  double v7 = [v6 superview];
  [v6 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v7, "convertRect:toView:", a1, v9, v11, v13, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  return objc_msgSend(a1, "scrollRectToVisible:animated:", a4, v17, v19, v21, v23);
}

@end