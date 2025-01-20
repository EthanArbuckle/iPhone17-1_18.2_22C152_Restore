@interface CKDefaultPluginEntryViewController
- (BOOL)loadedContentView;
- (BOOL)showsBalloonTail;
- (BOOL)wantsClearButton;
- (BOOL)wantsEdgeToEdgeLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBalloonView)balloonView;
- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4;
- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5;
- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5 customizationPickerDelegate:(id)a6;
- (CKTranscriptBalloonPluginController)pluginBubbleViewController;
- (IMBalloonPlugin)plugin;
- (IMBalloonPluginDataSource)datasource;
- (UIContextMenuInteraction)contextMenuInteraction;
- (id)_copyActionForImageBalloonView;
- (id)_imageBalloon;
- (id)_saveActionForImageBalloonView;
- (id)_transcriptPluginBalloon;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)_loadBalloonView;
- (void)dealloc;
- (void)didFinishAnimatedBoundsChange;
- (void)loadView;
- (void)payloadWillClear;
- (void)payloadWillSend;
- (void)performHostAppResume;
- (void)performHostAppSuspend;
- (void)setBalloonView:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPluginBubbleViewController:(id)a3;
- (void)setShowsBalloonTail:(BOOL)a3;
- (void)updateConversationIDAndRecipientsForViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKDefaultPluginEntryViewController

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4
{
  return 0;
}

- (void)payloadWillClear
{
  v3 = [(CKDefaultPluginEntryViewController *)self pluginBubbleViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKDefaultPluginEntryViewController *)self pluginBubbleViewController];
    [v5 clearShelfPayload];
  }
}

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5
{
  return [(CKDefaultPluginEntryViewController *)self initWithDataSource:a3 entryViewDelegate:a4 andPlugin:a5 customizationPickerDelegate:0];
}

- (CKDefaultPluginEntryViewController)initWithDataSource:(id)a3 entryViewDelegate:(id)a4 andPlugin:(id)a5 customizationPickerDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDefaultPluginEntryViewController;
  v12 = [(CKDefaultPluginEntryViewController *)&v21 init];
  v13 = v12;
  if (v12)
  {
    [(CKDefaultPluginEntryViewController *)v12 setDatasource:v9];
    [(CKDefaultPluginEntryViewController *)v13 setPlugin:v10];
    if (CKIsRunningInMacCatalyst())
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F428F8]) initWithDelegate:v13];
      contextMenuInteraction = v13->_contextMenuInteraction;
      v13->_contextMenuInteraction = (UIContextMenuInteraction *)v14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [(CKDefaultPluginEntryViewController *)v13 plugin];
      id v17 = objc_alloc((Class)[v16 bubbleClass]);
      v18 = [(CKDefaultPluginEntryViewController *)v13 datasource];
      v19 = (void *)[v17 initWithDataSource:v18 isFromMe:1];

      if (objc_opt_respondsToSelector()) {
        [v19 setCustomizationPickerDelegate:v11];
      }
      [(CKDefaultPluginEntryViewController *)v13 setPluginBubbleViewController:v19];
    }
  }

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKDefaultPluginEntryViewController;
  [(CKDefaultPluginEntryViewController *)&v4 dealloc];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = objc_msgSend(a3, "view", a4.x, a4.y);
  v6 = [(CKDefaultPluginEntryViewController *)self balloonView];
  if (v5 != v6)
  {

LABEL_10:
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(CKDefaultPluginEntryViewController *)self _copyActionForImageBalloonView];
  id v10 = [(CKDefaultPluginEntryViewController *)self _saveActionForImageBalloonView];
  if (v9) {
    [v8 addObject:v9];
  }
  if (v10) {
    [v8 addObject:v10];
  }
  if ([v8 count])
  {
    id v11 = (void *)MEMORY[0x1E4F428F0];
    v12 = [(CKDefaultPluginEntryViewController *)self plugin];
    v13 = [v12 identifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__CKDefaultPluginEntryViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_1E56212E0;
    id v17 = v8;
    uint64_t v14 = [v11 configurationWithIdentifier:v13 previewProvider:0 actionProvider:v16];
  }
  else
  {
    uint64_t v14 = 0;
  }

LABEL_11:

  return v14;
}

uint64_t __92__CKDefaultPluginEntryViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:*(void *)(a1 + 32)];
}

- (id)_copyActionForImageBalloonView
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id location = 0;
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E4F426E8];
  objc_super v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"COPY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CKDefaultPluginEntryViewController__copyActionForImageBalloonView__block_invoke;
  v8[3] = &unk_1E5620ED8;
  objc_copyWeak(&v9, &location);
  v6 = [v3 actionWithTitle:v5 image:0 identifier:0 handler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

void __68__CKDefaultPluginEntryViewController__copyActionForImageBalloonView__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained datasource];
  v3 = [v2 mediaObject];
  objc_super v4 = [v3 pasteboardItemProvider];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F42C50] generalPasteboard];
    v7[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 setItemProviders:v6];
  }
}

- (id)_saveActionForImageBalloonView
{
  v3 = [(CKDefaultPluginEntryViewController *)self balloonView];
  if (v3)
  {
    objc_super v4 = [(CKDefaultPluginEntryViewController *)self balloonView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CKDefaultPluginEntryViewController *)self balloonView];
      v6 = [v5 image];

      if (v6)
      {
        id location = 0;
        objc_initWeak(&location, self);
        v7 = (void *)MEMORY[0x1E4F426E8];
        v8 = CKFrameworkBundle();
        id v9 = [v8 localizedStringForKey:@"SEARCH_ADD_TO_PHOTOS_LIBRARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __68__CKDefaultPluginEntryViewController__saveActionForImageBalloonView__block_invoke;
        v11[3] = &unk_1E5620ED8;
        objc_copyWeak(&v12, &location);
        v3 = [v7 actionWithTitle:v9 image:0 identifier:0 handler:v11];

        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
        goto LABEL_7;
      }
    }
    else
    {
    }
    v3 = 0;
  }
LABEL_7:

  return v3;
}

void __68__CKDefaultPluginEntryViewController__saveActionForImageBalloonView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained balloonView];

  v2 = [v8 animatedImage];
  v3 = [v2 image];

  if (v3)
  {
    objc_super v4 = [v8 animatedImage];
    id v5 = [(UIImage *)v4 image];
    UIImageWriteToSavedPhotosAlbum(v5, 0, 0, 0);
  }
  else
  {
    v6 = [v8 image];

    v7 = v8;
    if (!v6) {
      goto LABEL_6;
    }
    objc_super v4 = [v8 image];
    UIImageWriteToSavedPhotosAlbum(v4, 0, 0, 0);
  }

  v7 = v8;
LABEL_6:
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKDefaultPluginEntryViewController *)self setView:v4];
}

- (void)updateConversationIDAndRecipientsForViewController:(id)a3
{
  id v14 = a3;
  id v4 = [(CKDefaultPluginEntryViewController *)self datasource];
  id v5 = [v4 pluginPayload];
  v6 = [v5 pluginBundleID];

  v7 = IMBalloonExtensionIDWithSuffix();
  LODWORD(v5) = [v6 isEqualToString:v7];

  if (v5)
  {
    id v8 = [(CKDefaultPluginEntryViewController *)self datasource];
    id v9 = [v8 chat];

    if (v9)
    {
      id v10 = [[CKConversation alloc] initWithChat:v9];
      if (objc_opt_respondsToSelector())
      {
        id v11 = [(CKConversation *)v10 recipientStrings];
        [v14 performSelector:sel_setRecipients_ withObject:v11];
      }
      if (objc_opt_respondsToSelector())
      {
        id v12 = [(CKConversation *)v10 chat];
        v13 = [v12 guid];

        [v14 performSelector:sel_setConversationID_ withObject:v13];
      }
    }
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CKDefaultPluginEntryViewController;
  [(CKDefaultPluginEntryViewController *)&v7 viewDidLoad];
  [(CKDefaultPluginEntryViewController *)self _loadBalloonView];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(CKTranscriptBalloonPluginController *)self->_pluginBubbleViewController pluginContentViewController];
    if (v3)
    {
      [(CKDefaultPluginEntryViewController *)self updateConversationIDAndRecipientsForViewController:v3];
      [(CKDefaultPluginEntryViewController *)self addChildViewController:v3];
      [v3 didMoveToParentViewController:self];
    }
  }
  id v4 = [(CKDefaultPluginEntryViewController *)self view];
  id v5 = [(CKDefaultPluginEntryViewController *)self balloonView];
  [v4 addSubview:v5];

  v6 = [(CKDefaultPluginEntryViewController *)self view];
  [v6 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKDefaultPluginEntryViewController;
  [(CKDefaultPluginEntryViewController *)&v13 viewDidLayoutSubviews];
  id v3 = [(CKDefaultPluginEntryViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(CKDefaultPluginEntryViewController *)self balloonView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKDefaultPluginEntryViewController;
  [(CKDefaultPluginEntryViewController *)&v4 viewWillDisappear:a3];
  if (objc_opt_respondsToSelector()) {
    [(CKTranscriptBalloonPluginController *)self->_pluginBubbleViewController pluginContentViewWillDisappear];
  }
}

- (void)performHostAppResume
{
  if (objc_opt_respondsToSelector())
  {
    pluginBubbleViewController = self->_pluginBubbleViewController;
    [(CKTranscriptBalloonPluginController *)pluginBubbleViewController performHostAppResume];
  }
}

- (void)performHostAppSuspend
{
  if (objc_opt_respondsToSelector())
  {
    pluginBubbleViewController = self->_pluginBubbleViewController;
    [(CKTranscriptBalloonPluginController *)pluginBubbleViewController performHostAppSuspend];
  }
}

- (void)didFinishAnimatedBoundsChange
{
  if (objc_opt_respondsToSelector())
  {
    pluginBubbleViewController = self->_pluginBubbleViewController;
    [(CKTranscriptBalloonPluginController *)pluginBubbleViewController didFinishAnimatedBoundsChange];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(CKDefaultPluginEntryViewController *)self plugin];
  double v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CBD8]];

  if (v8)
  {
    double v9 = +[CKUIBehavior sharedBehaviors];
    [v9 entryViewMaxHandWritingPluginShelfHeight];
    double v11 = v10;

    double v12 = v11 * 2.5;
  }
  else
  {
    objc_super v13 = [(CKDefaultPluginEntryViewController *)self datasource];
    objc_msgSend(v13, "sizeThatFits:", width, height);
    double v12 = v14;
    double v11 = v15;
  }
  double v16 = v12;
  double v17 = v11;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (BOOL)wantsEdgeToEdgeLayout
{
  return 0;
}

- (void)payloadWillSend
{
  id v3 = [(CKDefaultPluginEntryViewController *)self datasource];
  [v3 setStagingContext:0];

  id v4 = [(CKDefaultPluginEntryViewController *)self datasource];
  [v4 setPayloadInShelf:0];
}

- (BOOL)wantsClearButton
{
  return 1;
}

- (BOOL)loadedContentView
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  pluginBubbleViewController = self->_pluginBubbleViewController;

  return [(CKTranscriptBalloonPluginController *)pluginBubbleViewController hasSizingInfo];
}

- (void)setShowsBalloonTail:(BOOL)a3
{
  if (self->_showsBalloonTail != a3)
  {
    BOOL v3 = a3;
    self->_showsBalloonTail = a3;
    double v5 = [(CKDefaultPluginEntryViewController *)self balloonView];
    [v5 setHasTail:v3];

    id v6 = [(CKDefaultPluginEntryViewController *)self balloonView];
    [v6 prepareForDisplay];
  }
}

- (void)_loadBalloonView
{
  if (!self->_balloonView)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v3 = [(CKDefaultPluginEntryViewController *)self _imageBalloon];
      balloonView = self->_balloonView;
      self->_balloonView = v3;

      if (!CKIsRunningInMacCatalyst()) {
        return;
      }
      double v5 = [(CKDefaultPluginEntryViewController *)self contextMenuInteraction];

      if (!v5) {
        return;
      }
      id v6 = self->_balloonView;
      uint64_t v9 = [(CKDefaultPluginEntryViewController *)self contextMenuInteraction];
      [(CKBalloonView *)v6 addInteraction:v9];
      double v7 = (CKBalloonView *)v9;
    }
    else
    {
      int v8 = [(CKDefaultPluginEntryViewController *)self _transcriptPluginBalloon];
      double v7 = self->_balloonView;
      self->_balloonView = v8;
    }
  }
}

- (id)_imageBalloon
{
  return (id)[(IMBalloonPluginDataSource *)self->_datasource imageBalloon];
}

- (id)_transcriptPluginBalloon
{
  if (self->_pluginBubbleViewController)
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    id v4 = CKBalloonViewForClass(v3);
    [v4 setCanUseOpaqueMask:0];
    [v4 setOrientation:1];
    objc_msgSend(v4, "setHasTail:", -[CKDefaultPluginEntryViewController showsBalloonTail](self, "showsBalloonTail"));
    objc_msgSend(v4, "setTextAlignmentInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    double v5 = [(CKTranscriptBalloonPluginController *)self->_pluginBubbleViewController pluginContentView];
    [v4 setPluginView:v5];

    [v4 prepareForDisplay];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)showsBalloonTail
{
  return self->_showsBalloonTail;
}

- (CKTranscriptBalloonPluginController)pluginBubbleViewController
{
  return self->_pluginBubbleViewController;
}

- (void)setPluginBubbleViewController:(id)a3
{
}

- (IMBalloonPluginDataSource)datasource
{
  return self->_datasource;
}

- (void)setDatasource:(id)a3
{
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_datasource, 0);

  objc_storeStrong((id *)&self->_pluginBubbleViewController, 0);
}

@end