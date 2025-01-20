@interface LexiconFilePathExtractor
- (id)lexiconFilePath:(id)a3;
@end

@implementation LexiconFilePathExtractor

- (id)lexiconFilePath:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return (id)MEMORY[0x1F4181798](v3, sel_pathForResource_ofType_);
}

@end