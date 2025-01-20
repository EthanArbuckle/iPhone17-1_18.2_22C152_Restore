@interface DOCIconPromise
- (BOOL)hasFinishedTryingToFetchCorrectThumbnail;
- (BOOL)isLoading;
- (BOOL)isRepresentativeIcon;
- (BOOL)registerGenerationCompletionHandler:(id)a3;
- (DOCIconPromise)initWithRequest:(id)a3;
- (UIImage)thumbnail;
- (id)averageColorInRect:(CGRect)a3;
@end

@implementation DOCIconPromise

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

- (UIImage)thumbnail
{
  v2 = self;
  objc_sync_enter(v2);
  icon = v2->_icon;
  if (!icon)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    id v13 = 0;
    request = v2->_request;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__DOCIconPromise_thumbnail__block_invoke;
    v7[3] = &unk_264674950;
    v7[4] = &v14;
    v7[5] = &v8;
    [(DOCThumbnailRequest *)request generateThumbnailWithCompletionHandler:v7];
    if (!*((unsigned char *)v15 + 24)) {
      __assert_rtn("-[DOCIconPromise thumbnail]", "DOCThumbnail.m", 445, "blockWasCalled");
    }
    objc_storeStrong((id *)&v2->_icon, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    _Block_object_dispose(&v14, 8);
    icon = v2->_icon;
  }
  v5 = icon;
  objc_sync_exit(v2);

  return v5;
}

void __27__DOCIconPromise_thumbnail__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3) {
    __27__DOCIconPromise_thumbnail__block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)isRepresentativeIcon
{
  return 0;
}

- (DOCIconPromise)initWithRequest:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"DOCThumbnail.m", 423, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)DOCIconPromise;
  v7 = [(DOCIconPromise *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_request, a3);
  }

  return v8;
}

- (BOOL)hasFinishedTryingToFetchCorrectThumbnail
{
  return 1;
}

- (BOOL)registerGenerationCompletionHandler:(id)a3
{
  return 0;
}

- (BOOL)isLoading
{
  return 0;
}

- (id)averageColorInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(DOCIconPromise *)self isRepresentativeIcon])
  {
    uint64_t v8 = [(DOCIconPromise *)self thumbnail];
    v9 = objc_msgSend(v8, "doc_averageColorInRect:", x, y, width, height);
  }
  else
  {
    v9 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v9;
}

void __27__DOCIconPromise_thumbnail__block_invoke_cold_1()
{
  __assert_rtn("-[DOCIconPromise thumbnail]_block_invoke", "DOCThumbnail.m", 440, "error == nil");
}

@end