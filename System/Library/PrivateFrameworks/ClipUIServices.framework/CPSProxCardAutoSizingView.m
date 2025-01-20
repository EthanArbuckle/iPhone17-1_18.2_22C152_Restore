@interface CPSProxCardAutoSizingView
- (CPSProxCardAutoSizingView)init;
- (void)init;
@end

@implementation CPSProxCardAutoSizingView

- (CPSProxCardAutoSizingView)init
{
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  v12 = (uint64_t (*)(double, double, double, double))getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr;
  v31 = getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr;
  if (!getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_block_invoke;
    v26 = &unk_1E6AE9048;
    v27 = &v28;
    v13 = (void *)ProxCardKitLibrary();
    v29[3] = (uint64_t)dlsym(v13, "PRXCardPreferredSizeClassForContainerBounds");
    getPRXCardPreferredSizeClassForContainerBoundsSymbolLoc_ptr = *(_UNKNOWN **)(v27[1] + 24);
    v12 = (uint64_t (*)(double, double, double, double))v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v12) {
    -[CPSProxCardAutoSizingView init]();
  }
  uint64_t v14 = v12(v5, v7, v9, v11);

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  v15 = (double (*)(void, uint64_t))getPRXCardPreferredSizeSymbolLoc_ptr;
  v31 = getPRXCardPreferredSizeSymbolLoc_ptr;
  if (!getPRXCardPreferredSizeSymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getPRXCardPreferredSizeSymbolLoc_block_invoke;
    v26 = &unk_1E6AE9048;
    v27 = &v28;
    v16 = (void *)ProxCardKitLibrary();
    v29[3] = (uint64_t)dlsym(v16, "PRXCardPreferredSize");
    getPRXCardPreferredSizeSymbolLoc_ptr = *(_UNKNOWN **)(v27[1] + 24);
    v15 = (double (*)(void, uint64_t))v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v15) {
    -[CPSProxCardAutoSizingView init]();
  }
  double v17 = *MEMORY[0x1E4F1DB28];
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v19 = v15(0, v14);
  v22.receiver = self;
  v22.super_class = (Class)CPSProxCardAutoSizingView;
  return -[CPSProxCardAutoSizingView initWithFrame:](&v22, sel_initWithFrame_, v17, v18, v19, v20);
}

- (void)init
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGSize _PRXCardPreferredSize(PRXCardStyle, PRXCardSizeClass)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSProxCardAutoSizingView.m", 11, @"%s", dlerror());

  __break(1u);
}

@end