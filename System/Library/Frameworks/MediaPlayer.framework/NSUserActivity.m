@interface NSUserActivity
@end

@implementation NSUserActivity

void __81__NSUserActivity_MediaPlayerAdditions___setExternalMediaContentBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v7 = a5;
  v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  if (v7) {
    (*((void (**)(id, id, void *, void, void))v7 + 2))(v7, v9, v8, 0, 0);
  }
}

void __74__NSUserActivity_MediaPlayerAdditions__setExternalMediaContentIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v7 = a5;
  v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  if (v7) {
    (*((void (**)(id, id, void *, void, void))v7 + 2))(v7, v9, v8, 0, 0);
  }
}

@end