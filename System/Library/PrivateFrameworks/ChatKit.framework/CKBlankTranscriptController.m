@interface CKBlankTranscriptController
- (BOOL)wantsFullScreenLayout;
- (CKBlankTranscriptController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidUnload;
@end

@implementation CKBlankTranscriptController

- (CKBlankTranscriptController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKBlankTranscriptController;
  return [(CKBlankTranscriptController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  id v7 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v7 setAutoresizingMask:18];
  v4 = +[CKUIBehavior sharedBehaviors];
  objc_super v5 = [v4 theme];
  v6 = [v5 transcriptBackgroundColor];
  [v7 setBackgroundColor:v6];

  [(CKBlankTranscriptController *)self setView:v7];
}

- (void)viewDidUnload
{
  v2.receiver = self;
  v2.super_class = (Class)CKBlankTranscriptController;
  [(CKBlankTranscriptController *)&v2 viewDidUnload];
}

- (BOOL)wantsFullScreenLayout
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

@end