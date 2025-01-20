@interface FPItemID(BRAdditions)
+ (id)br_fpItemIDFromItemIdentifier:()BRAdditions;
@end

@implementation FPItemID(BRAdditions)

+ (id)br_fpItemIDFromItemIdentifier:()BRAdditions
{
  id v3 = a3;
  uint64_t v4 = +[BRFileProviderHelper br_getProviderDomainIDForCurrentPersona];
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4) {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F25D28]) initWithProviderDomainID:v4 itemIdentifier:v3];
  }

  return v6;
}

@end