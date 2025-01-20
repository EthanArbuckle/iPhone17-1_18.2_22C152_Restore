@interface UITableViewCell
@end

@implementation UITableViewCell

void __74__UITableViewCell_HUCheckmarkAdditions__hu_emptyCheckmarkPlaceholderImage__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F42A80], "hu_cellCheckmarkImage");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v1 = [v3 imageWithTintColor:v0 renderingMode:1];
  v2 = (void *)_MergedGlobals_1_4;
  _MergedGlobals_1_4 = v1;
}

IMP __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_setSeparatorStyle_);
  off_1EBA47B18 = (uint64_t (*)(void, void, void))method_getImplementation(InstanceMethod);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e11_v24__0_8q16l;
  aBlock[4] = sel_setSeparatorStyle_;
  v2 = _Block_copy(aBlock);
  id v3 = imp_implementationWithBlock(v2);

  return method_setImplementation(InstanceMethod, v3);
}

void __59__UITableViewCell_HUAdditions__hu_setForcedSeparatorStyle___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = objc_getAssociatedObject(v6, &_MergedGlobals_640);
  if (!v5) {
    off_1EBA47B18(v6, *(void *)(a1 + 32), a3);
  }
}

@end