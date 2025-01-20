@interface LAUIPKGlyphWrapper
+ (Class)_loadClassFromString:(id)a3;
+ (id)glyphWithStyle:(int64_t)a3 frame:(CGRect)a4;
+ (void)_loadPKUI;
- (BOOL)fastAnimations;
- (BOOL)grayedOut;
- (BOOL)hidden;
- (GlyphMethods)glyphView;
- (GlyphMethods)idleTouchID;
- (LAUIPKGlyphWrapper)initWithGlyphView:(id)a3;
- (OS_dispatch_queue)glyphQueue;
- (UIView)view;
- (double)_minimumAnimationDurationForState:(int64_t)a3;
- (void)setFastAnimations:(BOOL)a3;
- (void)setGrayedOut:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setState:(int64_t)a3 idleTouchID:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation LAUIPKGlyphWrapper

+ (id)glyphWithStyle:(int64_t)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = +[LAUIPKGlyphWrapper _loadClassFromString:@"PKGlyphView"];
  if ((unint64_t)a3 >= 4)
  {
    v11 = LA_LOG_LAUIPKGlyphWrapper();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[LAUIPKGlyphWrapper glyphWithStyle:frame:](a3, v11);
    }

    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = qword_214498A48[a3];
  }
  v12 = (void *)[[v9 alloc] initWithStyle:v10];
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  v13 = [[LAUIPKGlyphWrapper alloc] initWithGlyphView:v12];

  return v13;
}

- (LAUIPKGlyphWrapper)initWithGlyphView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LAUIPKGlyphWrapper;
  v6 = [(LAUIPKGlyphWrapper *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_glyphView, a3);
    objc_storeStrong((id *)&v7->_view, a3);
    v8 = (void *)MEMORY[0x263F52428];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = [v8 createDefaultQueueWithIdentifier:@"glyphQueue" concurrencyAttribute:v9];
    glyphQueue = v7->_glyphQueue;
    v7->_glyphQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (double)_minimumAnimationDurationForState:(int64_t)a3
{
  double result = 0.15;
  if (a3 == 1) {
    double result = 0.75;
  }
  if (a3 == 5) {
    return 0.5;
  }
  return result;
}

- (void)setState:(int64_t)a3 idleTouchID:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  BOOL v11 = [(LAUIPKGlyphWrapper *)self fastAnimations];
  objc_initWeak(&location, self);
  v12 = [(LAUIPKGlyphWrapper *)self glyphQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke;
  v14[3] = &unk_26420C888;
  BOOL v17 = !v11;
  BOOL v18 = a4;
  v14[4] = self;
  v16[1] = (id)a3;
  objc_copyWeak(v16, &location);
  BOOL v19 = a5;
  id v15 = v10;
  id v13 = v10;
  dispatch_async(v12, v14);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) glyphQueue];
    dispatch_suspend(v2);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2;
  block[3] = &unk_26420C888;
  char v7 = *(unsigned char *)(a1 + 65);
  v3 = *(void **)(a1 + 56);
  block[4] = *(void *)(a1 + 32);
  v6[1] = v3;
  char v8 = *(unsigned char *)(a1 + 64);
  objc_copyWeak(v6, (id *)(a1 + 48));
  char v9 = *(unsigned char *)(a1 + 66);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v6);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_6;
  }
  v2 = [*(id *)(a1 + 32) idleTouchID];

  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(+[LAUIPKGlyphWrapper _loadClassFromString:](LAUIPKGlyphWrapper, "_loadClassFromString:", @"PKGlyphView")), "initWithStyle:", 0);
    v4 = [*(id *)(a1 + 32) glyphView];
    [v4 frame];
    objc_msgSend(v3, "setFrame:");

    id v5 = [*(id *)(a1 + 32) glyphView];
    v6 = [v5 superview];
    [v6 addSubview:v3];

    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v3;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    char v9 = *(unsigned char **)(a1 + 32);
    BOOL v10 = 1;
  }
  else
  {
LABEL_6:
    char v9 = *(unsigned char **)(a1 + 32);
    BOOL v10 = v9[8] != 0;
  }
  BOOL v11 = [v9 glyphView];
  [v11 setHidden:v10];

  v12 = *(unsigned char **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v13 = v12[8] != 0;
  }
  else {
    BOOL v13 = 1;
  }
  v14 = [v12 idleTouchID];
  [v14 setHidden:v13];

  id v15 = [MEMORY[0x263EFF910] date];
  v16 = LA_LOG_LAUIPKGlyphWrapper();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_cold_1(a1, v16);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v18 = [WeakRetained glyphView];
  BOOL v19 = *(void **)(a1 + 56);
  uint64_t v20 = *(unsigned __int8 *)(a1 + 66);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6;
  v23[3] = &unk_26420C860;
  v27[1] = v19;
  char v28 = *(unsigned char *)(a1 + 65);
  objc_copyWeak(v27, (id *)(a1 + 48));
  id v21 = v15;
  id v24 = v21;
  id v22 = *(id *)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  id v26 = v22;
  [v18 setState:v19 animated:v20 completionHandler:v23];

  objc_destroyWeak(v27);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6(uint64_t a1, char a2)
{
  v4 = LA_LOG_LAUIPKGlyphWrapper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  if (*(unsigned char *)(a1 + 72))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _minimumAnimationDurationForState:*(void *)(a1 + 64)];
    double v13 = v12;
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    double v15 = v13 + v14;

    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    BOOL v17 = [MEMORY[0x263F52428] globalUserInitiatedConcurrentQueue];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_7;
    v19[3] = &unk_26420C838;
    uint64_t v21 = *(void *)(a1 + 64);
    id v18 = *(id *)(a1 + 48);
    char v22 = a2;
    v19[4] = *(void *)(a1 + 40);
    id v20 = v18;
    dispatch_after(v16, v17, v19);
  }
  else
  {
    if (*(void *)(a1 + 64) == 11) {
      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_12);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_7(uint64_t a1)
{
  v2 = LA_LOG_LAUIPKGlyphWrapper();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_7_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  if (*(void *)(a1 + 48) == 11) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v9 = [*(id *)(a1 + 32) glyphQueue];
  dispatch_resume(v9);
}

uint64_t __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_8()
{
  v0 = +[LAUIPKGlyphWrapper _loadClassFromString:@"PKGlyphView"];
  return [(objc_class *)v0 invokeSuccessFeedback];
}

uint64_t __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_10()
{
  v0 = +[LAUIPKGlyphWrapper _loadClassFromString:@"PKGlyphView"];
  return [(objc_class *)v0 invokeSuccessFeedback];
}

+ (void)_loadPKUI
{
  if (_loadPKUI_onceToken != -1) {
    dispatch_once(&_loadPKUI_onceToken, &__block_literal_global_15);
  }
  return (void *)_loadPKUI_libPKUI;
}

void *__31__LAUIPKGlyphWrapper__loadPKUI__block_invoke()
{
  double result = dlopen("/System/Library/PrivateFrameworks/PassKitUIFoundation.framework/PassKitUIFoundation", 1);
  _loadPKUI_libPKUI = (uint64_t)result;
  return result;
}

+ (Class)_loadClassFromString:(id)a3
{
  uint64_t v3 = (NSString *)a3;
  Class v4 = +[LAUIPKGlyphWrapper _loadPKUI];
  if (v4) {
    Class v4 = NSClassFromString(v3);
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setGrayedOut:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = LA_LOG_LAUIPKGlyphWrapper();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[LAUIPKGlyphWrapper setGrayedOut:](v3, v5, v6, v7, v8, v9, v10, v11);
  }

  if (v3) {
    double v12 = 0.5;
  }
  else {
    double v12 = 1.0;
  }
  double v13 = [(LAUIPKGlyphWrapper *)self glyphView];
  [v13 setAlpha:v12];

  self->_grayedOut = v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidden = a3;
  uint64_t v5 = [(LAUIPKGlyphWrapper *)self glyphView];
  [v5 setHidden:v3];

  id v6 = [(LAUIPKGlyphWrapper *)self idleTouchID];
  [v6 setHidden:v3];
}

- (UIView)view
{
  return self->_view;
}

- (BOOL)fastAnimations
{
  return self->_fastAnimations;
}

- (void)setFastAnimations:(BOOL)a3
{
  self->_fastAnimations = a3;
}

- (BOOL)grayedOut
{
  return self->_grayedOut;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (GlyphMethods)glyphView
{
  return self->_glyphView;
}

- (GlyphMethods)idleTouchID
{
  return self->_idleTouchID;
}

- (OS_dispatch_queue)glyphQueue
{
  return self->_glyphQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphQueue, 0);
  objc_storeStrong((id *)&self->_idleTouchID, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

+ (void)glyphWithStyle:(int)a1 frame:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214463000, a2, OS_LOG_TYPE_ERROR, "Unhandled style: %d", (uint8_t *)v2, 8u);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = *(unsigned __int8 *)(a1 + 65);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_214463000, a2, OS_LOG_TYPE_DEBUG, "setting glyph state: %d full animation: %d", (uint8_t *)v4, 0xEu);
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_6_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__LAUIPKGlyphWrapper_setState_idleTouchID_animated_completionHandler___block_invoke_7_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setGrayedOut:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end