@interface NSPredicate(WFPhotoLibraryFilteringPredicate)
- (id)wf_photoLibraryFilteringPredicate;
@end

@implementation NSPredicate(WFPhotoLibraryFilteringPredicate)

- (id)wf_photoLibraryFilteringPredicate
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (objc_class *)MEMORY[0x263F08730];
    id v3 = a1;
    id v4 = [v2 alloc];
    uint64_t v5 = [v3 compoundPredicateType];
    v6 = [v3 subpredicates];

    v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_255);
    id v8 = (id)[v4 initWithType:v5 subpredicates:v7];
  }
  else
  {
    id v8 = a1;
  }
  return v8;
}

@end