@interface NSString
@end

@implementation NSString

void __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke()
{
  v0 = (void *)_IS_imageMetadataFromFileName_regexp;
  _IS_imageMetadataFromFileName_regexp = @"^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+)?(?:x[0-9]+)?(?:@([1|2|3])x)?$";

  if (!_IS_imageMetadataFromFileName_matcher)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+)?(?:x[0-9]+)?(?:@([1|2|3])x)?$" options:0 error:0];
    v2 = (void *)_IS_imageMetadataFromFileName_matcher;
    _IS_imageMetadataFromFileName_matcher = v1;

    if (!_IS_imageMetadataFromFileName_matcher) {
      __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke_cold_1();
    }
  }
}

void __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke()
{
  v0 = (void *)_IS_scaleableResourceMetadataFromFileName_regexp;
  _IS_scaleableResourceMetadataFromFileName_regexp = @"^(.+?)(?:_\\[(selected)\\])?$";

  if (!_IS_scaleableResourceMetadataFromFileName_matcher)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^(.+?)(?:_\\[(selected)\\])?$" options:0 error:0];
    v2 = (void *)_IS_scaleableResourceMetadataFromFileName_matcher;
    _IS_scaleableResourceMetadataFromFileName_matcher = v1;

    if (!_IS_scaleableResourceMetadataFromFileName_matcher) {
      __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke_cold_1();
    }
  }
}

void __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke_cold_1()
{
}

void __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke_cold_1()
{
}

@end