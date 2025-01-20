@interface UITableViewCell(HUCheckmarkAdditions)
+ (id)hu_emptyCheckmarkPlaceholderImage;
- (void)hu_configureCheckmarkForImageView:()HUCheckmarkAdditions checked:;
@end

@implementation UITableViewCell(HUCheckmarkAdditions)

+ (id)hu_emptyCheckmarkPlaceholderImage
{
  if (qword_1EBA46930 != -1) {
    dispatch_once(&qword_1EBA46930, &__block_literal_global_187);
  }
  v0 = (void *)_MergedGlobals_1_4;

  return v0;
}

- (void)hu_configureCheckmarkForImageView:()HUCheckmarkAdditions checked:
{
  if (a4)
  {
    v4 = (void *)MEMORY[0x1E4F42A80];
    id v5 = a3;
    v6 = objc_msgSend(v4, "hu_cellCheckmarkImage");
    [v5 setImage:v6];

    objc_msgSend(MEMORY[0x1E4F42A80], "hu_cellCheckmarkImage");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightedImage:");
  }
  else
  {
    id v8 = a3;
    v7 = objc_msgSend((id)objc_opt_class(), "hu_emptyCheckmarkPlaceholderImage");
    [v8 setImage:v7];

    [v8 setHighlightedImage:0];
  }
}

@end