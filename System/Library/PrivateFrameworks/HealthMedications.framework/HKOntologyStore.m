@interface HKOntologyStore
- (void)_markShardRequiredWithIdentifier:(void *)a3 completion:;
@end

@implementation HKOntologyStore

- (void)_markShardRequiredWithIdentifier:(void *)a3 completion:
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v9 = a2;
    v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = a2;
    v8 = [v5 arrayWithObjects:&v9 count:1];

    objc_msgSend(a1, "markShardsWithIdentifiers:options:completion:", v8, 5, v6, v9, v10);
  }
}

@end