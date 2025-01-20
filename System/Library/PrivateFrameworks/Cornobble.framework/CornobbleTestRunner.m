@interface CornobbleTestRunner
+ (BOOL)isCornobbleAvailable;
+ (void)performFingerOnGlassScrollTestNamed:(id)a3 withParameters:(id)a4 completionHandler:(id)a5;
+ (void)performFingerOnGlassScrollWithParameters:(id)a3;
+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4;
+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5;
+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6;
+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6 completionHandler:(id)a7;
+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 pages:(unint64_t)a6 direction:(int64_t)a7 canFlick:(BOOL)a8 completionHandler:(id)a9;
+ (void)performTestNamed:(id)a3 usingComposer:(id)a4;
+ (void)performTestNamed:(id)a3 usingComposer:(id)a4 completionHandler:(id)a5;
+ (void)performTestNamed:(id)a3 withEventStream:(id)a4;
+ (void)performTestNamed:(id)a3 withEventStream:(id)a4 completionHandler:(id)a5;
+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5;
+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5 completionHandler:(id)a6;
+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5;
+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5 completionHandler:(id)a6;
+ (void)playInteraction:(id)a3 completionHandler:(id)a4;
@end

@implementation CornobbleTestRunner

+ (void)performFingerOnGlassScrollWithParameters:(id)a3
{
  id v7 = a3;
  if (RecapLibraryCore())
  {
    v4 = [v7 testName];
    v5 = [v7 eventStream];
    v6 = [v7 completionHandler];
    [a1 performTestNamed:v4 withEventStream:v5 completionHandler:v6];
  }
}

uint64_t __74__CornobbleTestRunner_performTestNamed_withEventStream_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x263F1C408] sharedApplication];
    [v2 finishedTest:*(void *)(a1 + 32) waitForCommit:1 extraResults:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 pages:(unint64_t)a6 direction:(int64_t)a7 canFlick:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  v19 = [v17 superview];
  [v17 frame];
  objc_msgSend(v19, "convertRect:toView:", 0);
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = CRNAxisFromScrollDirection(a7);
  id v25 = +[CRNStandardScrollTestParameters parametersForTestName:v18 scrollView:v17 iterations:a5 amplitude:a7 direction:0 preventDismissalGestures:v9 canUseFlicks:CRNSizeAlongAxis(v24, v21, v23) * (double)a6 completionHandler:v16];

  [a1 performFingerOnGlassScrollWithParameters:v25];
}

+ (BOOL)isCornobbleAvailable
{
  return RecapLibraryCore() != 0;
}

+ (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 composerBlock];
  [a1 performTestNamed:0 usingComposer:v7 completionHandler:v6];
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4
{
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5
{
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = CRNQuadrantOfContentOffsetFor(v13);
  id v16 = +[CRNStandardScrollTestParameters parametersForTestName:v14 scrollView:v13 iterations:a5 direction:CRNOppositeDirectionFrom(v15) preventDismissalGestures:0 canUseFlicks:v7 completionHandler:v12];

  [a1 performFingerOnGlassScrollWithParameters:v16];
}

+ (void)performTestNamed:(id)a3 withEventStream:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (RecapLibraryCore())
  {
    if (v7)
    {
      v10 = [MEMORY[0x263F1C408] sharedApplication];
      [v10 startedTest:v7];
    }
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v11 = (void *)getRCPPlayerPlaybackOptionsClass_softClass;
    uint64_t v27 = getRCPPlayerPlaybackOptionsClass_softClass;
    if (!getRCPPlayerPlaybackOptionsClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      double v21 = __getRCPPlayerPlaybackOptionsClass_block_invoke;
      double v22 = &unk_264CC1198;
      double v23 = &v24;
      __getRCPPlayerPlaybackOptionsClass_block_invoke((uint64_t)&v19);
      v11 = (void *)v25[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v24, 8);
    id v13 = objc_alloc_init(v12);
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v14 = (void *)getRCPInlinePlayerClass_softClass;
    uint64_t v27 = getRCPInlinePlayerClass_softClass;
    if (!getRCPInlinePlayerClass_softClass)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      double v21 = __getRCPInlinePlayerClass_block_invoke;
      double v22 = &unk_264CC1198;
      double v23 = &v24;
      __getRCPInlinePlayerClass_block_invoke((uint64_t)&v19);
      id v14 = (void *)v25[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v24, 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__CornobbleTestRunner_performTestNamed_withEventStream_completionHandler___block_invoke;
    v16[3] = &unk_264CC1138;
    id v17 = v7;
    id v18 = v9;
    [v15 playEventStream:v8 options:v13 completion:v16];
  }
  else
  {
    id v13 = [MEMORY[0x263F1C408] sharedApplication];
    [v13 failedTest:v7 withFailure:@"Recap unavaliable"];
  }
}

+ (void)performTestNamed:(id)a3 usingComposer:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (RecapLibraryCore())
  {
    v10 = [getRCPSyntheticEventStreamClass() eventStreamWithEventActions:v8];
  }
  else
  {
    v10 = 0;
  }
  [a1 performTestNamed:v11 withEventStream:v10 completionHandler:v9];
}

+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5 completionHandler:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a6;
  if (RecapLibraryCore())
  {
    id v11 = [getRCPSyntheticEventStreamClass() eventStreamWithFileURL:v9 error:0];
  }
  else
  {
    id v11 = 0;
  }
  [a1 performTestNamed:v12 withEventStream:v11 completionHandler:v10];
}

+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a6;
  if (RecapLibraryCore())
  {
    id RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    id v12 = [v9 componentsSeparatedByString:@" "];
    id v13 = [RCPSyntheticEventStreamClass eventStreamWithCLIArguments:v12];
  }
  else
  {
    id v13 = 0;
  }
  [a1 performTestNamed:v14 withEventStream:v13 completionHandler:v10];
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6
{
}

+ (void)performTestNamed:(id)a3 usingComposer:(id)a4
{
}

+ (void)performTestNamed:(id)a3 withEventStream:(id)a4
{
}

+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5
{
}

+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5
{
}

+ (void)performFingerOnGlassScrollTestNamed:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v6 = +[CRNGroupScrollTestParameters parametersByCombining:a4 testName:a3 completionHandler:a5];
  [a1 performFingerOnGlassScrollWithParameters:v6];
}

@end