@interface NSBundle
@end

@implementation NSBundle

void __42__NSBundle_MPAdditions__mediaPlayerBundle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Mpnowplayingin.isa)];
  v3 = (void *)mediaPlayerBundle___mediaPlayerBundle;
  mediaPlayerBundle___mediaPlayerBundle = v2;

  if (!mediaPlayerBundle___mediaPlayerBundle)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSBundle_MPAdditions.m" lineNumber:18 description:@"unable to find MediaPlayer bundle"];
  }
}

@end