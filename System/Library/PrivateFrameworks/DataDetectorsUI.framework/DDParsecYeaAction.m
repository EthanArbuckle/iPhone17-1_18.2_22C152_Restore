@interface DDParsecYeaAction
- (BOOL)hasUserInterface;
- (id)createViewController;
- (id)feedbackListener;
- (id)localizedName;
- (unint64_t)relevancy;
- (void)performFromView:(id)a3;
- (void)prepareViewControllerForActionController:(id)a3;
- (void)report;
@end

@implementation DDParsecYeaAction

- (id)createViewController
{
  v4.receiver = self;
  v4.super_class = (Class)DDParsecYeaAction;
  v2 = [(DDParsecAction *)&v4 createViewController];
  return v2;
}

- (id)localizedName
{
  return @"Report a correct hint (Internal)";
}

- (unint64_t)relevancy
{
  return 1;
}

- (id)feedbackListener
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__DDParsecYeaAction_feedbackListener__block_invoke;
  block[3] = &unk_1E5A853B0;
  block[4] = self;
  if (feedbackListener_once != -1) {
    dispatch_once(&feedbackListener_once, block);
  }
  return (id)feedbackListener__session;
}

void __37__DDParsecYeaAction_feedbackListener__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17 = [v0 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  if ([(__CFString *)v17 length])
  {
    v2 = v17;
  }
  else
  {

    v2 = @"1.0";
  }
  v18 = v2;
  double Helper_x8__kPARLookupClient = gotLoadHelper_x8__kPARLookupClient(v1);
  v7 = [v5 stringWithFormat:@"%@/%@", Helper_x8__kPARLookupClient, **(void **)(v4 + 3072), v6];
  v8 = [NSString stringWithFormat:@"com.apple.lookup"];
  gotLoadHelper_x8__OBJC_CLASS___PARSessionConfiguration(v9);
  v11 = (void *)[objc_alloc(*(Class *)(v10 + 3040)) initWithId:v8 userAgent:v7];
  double Helper_x8__OBJC_CLASS___PARSession = gotLoadHelper_x8__OBJC_CLASS___PARSession(v12);
  uint64_t v15 = objc_msgSend(*(id *)(v14 + 3032), "sessionWithConfiguration:", v11, Helper_x8__OBJC_CLASS___PARSession);
  v16 = (void *)feedbackListener__session;
  feedbackListener__session = v15;
}

- (void)report
{
  if (self->super.super.super._result)
  {
    DDResultGetParsecRawDomain();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = DDResultGetMatchedString();
    gotLoadHelper_x8__OBJC_CLASS___SFLookupHintRelevancyFeedback(v4);
    uint64_t v6 = objc_msgSend(objc_alloc(*(Class *)(v5 + 464)), "initWithContext:hintRange:domain:discarded:grade:", v3, 0, objc_msgSend(v3, "length"), v8, DDShouldUseDebugHighlightForResult(), -[DDParsecYeaAction relevancy](self, "relevancy"));
    v7 = [(DDParsecYeaAction *)self feedbackListener];
    [v7 didGradeLookupHintRelevancy:v6];
  }
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4 = a3;
  [(DDParsecYeaAction *)self report];
  v5.receiver = self;
  v5.super_class = (Class)DDParsecYeaAction;
  [(DDAction *)&v5 prepareViewControllerForActionController:v4];
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  [(DDParsecYeaAction *)self report];
  v5.receiver = self;
  v5.super_class = (Class)DDParsecYeaAction;
  [(DDAction *)&v5 performFromView:v4];
}

- (BOOL)hasUserInterface
{
  return 1;
}

@end