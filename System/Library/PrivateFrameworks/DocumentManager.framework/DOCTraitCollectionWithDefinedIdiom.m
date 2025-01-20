@interface DOCTraitCollectionWithDefinedIdiom
@end

@implementation DOCTraitCollectionWithDefinedIdiom

void ___DOCTraitCollectionWithDefinedIdiom_block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F82670];
  id v3 = a2;
  id v4 = [v2 currentDevice];
  objc_msgSend(v3, "setUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
}

@end