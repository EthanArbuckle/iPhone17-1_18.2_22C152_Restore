@interface GEOWalletCategoryStylingMapResource
+ (id)styleAttributesForWalletCategory:(id)a3;
@end

@implementation GEOWalletCategoryStylingMapResource

+ (id)styleAttributesForWalletCategory:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_327 != -1) {
    dispatch_once(&_MergedGlobals_327, &__block_literal_global_189);
  }
  if ([(id)qword_1EB2A06B0 mappingsCount])
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [(id)qword_1EB2A06B0 mappings];
      v6 = [v5 objectAtIndexedSubscript:v4];

      v7 = [v6 walletCategory];
      int v8 = [v3 isEqualToString:v7];

      if (v8) {
        break;
      }

      if (++v4 >= (unint64_t)[(id)qword_1EB2A06B0 mappingsCount]) {
        goto LABEL_7;
      }
    }
    v10 = [v6 stylesAttributes];
    v9 = (void *)[v10 copy];
  }
  else
  {
LABEL_7:
    v9 = 0;
  }

  return v9;
}

void __72__GEOWalletCategoryStylingMapResource_styleAttributesForWalletCategory___block_invoke()
{
  v0 = +[GEOResourceManager sharedManager];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v0 dataForResourceWithName:@"WalletCategoryStylingMap" fallbackBundle:v1];

  v2 = [[GEOWalletCategoryStylingMap alloc] initWithData:v4];
  id v3 = (void *)qword_1EB2A06B0;
  qword_1EB2A06B0 = (uint64_t)v2;
}

@end