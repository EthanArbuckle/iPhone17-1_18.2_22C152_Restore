@interface UITableViewCell(HUAdditions)
- (id)hu_forcedSeparatorStyle;
- (void)hu_setForcedSeparatorStyle:()HUAdditions;
- (void)removeMargins;
- (void)turnOffRounding;
@end

@implementation UITableViewCell(HUAdditions)

- (id)hu_forcedSeparatorStyle
{
  return objc_getAssociatedObject(a1, &_MergedGlobals_640);
}

- (void)hu_setForcedSeparatorStyle:()HUAdditions
{
  id value = a3;
  if (qword_1EBA47B10 != -1) {
    dispatch_once(&qword_1EBA47B10, &__block_literal_global_273);
  }
  objc_setAssociatedObject(a1, &_MergedGlobals_640, value, (void *)3);
  v4 = value;
  if (value)
  {
    ((void (*)(void *, char *, uint64_t))off_1EBA47B18)(a1, sel_setSeparatorStyle_, [value unsignedIntegerValue]);
    v4 = value;
  }
}

- (void)turnOffRounding
{
  v2 = [a1 layer];
  [v2 setCornerRadius:0.0];

  id v3 = [a1 layer];
  [v3 setMasksToBounds:0];
}

- (void)removeMargins
{
  v2 = [a1 contentView];
  [v2 setPreservesSuperviewLayoutMargins:0];

  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  objc_msgSend(a1, "setLayoutMargins:", *MEMORY[0x1E4F437F8], v4, v5, v6);
  id v7 = [a1 contentView];
  objc_msgSend(v7, "setLayoutMargins:", v3, v4, v5, v6);
}

@end