@interface CKPlainStringItemProviderWriter
+ (id)writableTypeIdentifiersForItemProvider;
@end

@implementation CKPlainStringItemProviderWriter

+ (id)writableTypeIdentifiersForItemProvider
{
  if (writableTypeIdentifiersForItemProvider_onceToken != -1) {
    dispatch_once(&writableTypeIdentifiersForItemProvider_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers;

  return v2;
}

void __73__CKPlainStringItemProviderWriter_writableTypeIdentifiersForItemProvider__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F44510] identifier];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  v2 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers;
  writableTypeIdentifiersForItemProvider_sTypeIdentifiers = v1;
}

@end