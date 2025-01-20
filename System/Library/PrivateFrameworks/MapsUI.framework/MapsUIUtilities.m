@interface MapsUIUtilities
+ (BOOL)deviceIsLockedAndNeedsPasscode;
+ (BOOL)isDataDetectorsProcess;
+ (BOOL)isInApplicationContext:(unint64_t)a3;
+ (BOOL)isMapsProcess;
+ (BOOL)isParsecProcess;
+ (BOOL)isSafariProcess;
+ (BOOL)isSiriProcess;
+ (BOOL)isSpotlightProcess;
+ (id)bundleIdentifierForContext:(unint64_t)a3;
+ (void)checkDeviceLockStatusWithCompletion:(id)a3;
+ (void)performOnMainIfNecessary:(id)a3;
+ (void)resizeImageIfNeeded:(id)a3 toFrameSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6;
@end

@implementation MapsUIUtilities

+ (void)performOnMainIfNecessary:(id)a3
{
  v3 = (void (**)(void))a3;
  if (v3)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v3[2](v3);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__MapsUIUtilities_performOnMainIfNecessary___block_invoke;
      block[3] = &unk_1E574EEA8;
      v5 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __44__MapsUIUtilities_performOnMainIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isMapsProcess
{
  return [a1 isInApplicationContext:1];
}

+ (BOOL)isSiriProcess
{
  return [a1 isInApplicationContext:2];
}

+ (BOOL)isSpotlightProcess
{
  return [a1 isInApplicationContext:3];
}

+ (BOOL)isSafariProcess
{
  return [a1 isInApplicationContext:4];
}

+ (BOOL)isDataDetectorsProcess
{
  return [a1 isInApplicationContext:5];
}

+ (BOOL)isParsecProcess
{
  if (([a1 isSiriProcess] & 1) != 0
    || ([a1 isSpotlightProcess] & 1) != 0
    || ([a1 isSafariProcess] & 1) != 0)
  {
    return 1;
  }
  return [a1 isDataDetectorsProcess];
}

+ (BOOL)isInApplicationContext:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  v7 = [a1 bundleIdentifierForContext:a3];
  LOBYTE(a1) = [v6 isEqualToString:v7];

  return (char)a1;
}

+ (id)bundleIdentifierForContext:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v4 = (__CFString *)(id)*MEMORY[0x1E4F64320];
      break;
    case 2uLL:
      v4 = @"com.apple.siri";
      break;
    case 3uLL:
      v4 = @"com.apple.Spotlight";
      break;
    case 4uLL:
      v4 = @"com.apple.mobilesafari";
      break;
    case 5uLL:
      v4 = @"com.apple.datadetectors.DDActionsService";
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

+ (BOOL)deviceIsLockedAndNeedsPasscode
{
  return 0;
}

+ (void)checkDeviceLockStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (qword_1EB4F7278 != -1) {
      dispatch_once(&qword_1EB4F7278, &__block_literal_global_50);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5750530;
    id v10 = a1;
    id v9 = v4;
    v5 = _Block_copy(v8);
    v6 = v5;
    if (_MergedGlobals_135)
    {
      v7 = dispatch_get_global_queue(25, 0);
      dispatch_async(v7, v6);
    }
    else
    {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

BOOL __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke()
{
  BOOL result = +[MapsUIUtilities isSpotlightProcess];
  _MergedGlobals_135 = result;
  return result;
}

void __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) deviceIsLockedAndNeedsPasscode];
  if (_MergedGlobals_135)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_3;
    v5[3] = &unk_1E5751A10;
    uint64_t v3 = *(void **)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    char v7 = v2;
    [v3 performOnMainIfNecessary:v5];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

uint64_t __55__MapsUIUtilities_checkDeviceLockStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (void)resizeImageIfNeeded:(id)a3 toFrameSize:(CGSize)a4 displayScale:(double)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a6;
  v13 = (void (**)(void, void))v12;
  if (v11)
  {
    double v14 = width * a5;
    double v15 = height * a5;
    [v11 size];
    double v17 = v16;
    [v11 size];
    double v19 = v18;
    [v11 size];
    if (v17 >= v19) {
      double v22 = v21 / v15;
    }
    else {
      double v22 = v20 / v14;
    }
    [v11 size];
    double v25 = v24;
    [v11 size];
    double v27 = v26;
    [v11 size];
    if (v28 <= v14)
    {
      [v11 size];
      if (v29 <= v15)
      {
        ((void (**)(void, id))v13)[2](v13, v11);
        goto LABEL_10;
      }
    }
    v30[1] = 3221225472;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2;
    v30[3] = &unk_1E5751A38;
    id v33 = a1;
    v32 = v13;
    id v31 = v11;
    objc_msgSend(v31, "_mapsui_prepareThumbnailOfSize:completionHandler:", v30, v25 / v22, v27 / v22);

    v23 = v32;
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke;
    v34[3] = &unk_1E574EEA8;
    id v35 = v12;
    [a1 performOnMainIfNecessary:v34];
    v23 = v35;
  }

LABEL_10:
}

uint64_t __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3;
  v6[3] = &unk_1E574ECA8;
  id v4 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 performOnMainIfNecessary:v6];
}

uint64_t __75__MapsUIUtilities_resizeImageIfNeeded_toFrameSize_displayScale_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (!v3) {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end