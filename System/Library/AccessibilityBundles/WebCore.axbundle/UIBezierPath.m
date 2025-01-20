@interface UIBezierPath
@end

@implementation UIBezierPath

void __43__UIBezierPath_OBAdditions__ax_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ax_descriptionForPathElement:", a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"    %@\n", v3];
}

@end