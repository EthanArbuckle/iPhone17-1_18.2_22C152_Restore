@interface CKTranscriptGroupHeaderView
- (CKConversation)conversation;
- (CKTranscriptGroupHeaderView)initWithFrame:(CGRect)a3 conversation:(id)a4;
- (CNComposeRecipientTextView)textView;
- (UIButton)actionButton;
- (UIView)separator;
- (_UIBackdropView)backdropView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation CKTranscriptGroupHeaderView

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptGroupHeaderView;
  [(CKTranscriptGroupHeaderView *)&v4 dealloc];
}

- (CKTranscriptGroupHeaderView)initWithFrame:(CGRect)a3 conversation:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CKTranscriptGroupHeaderView;
  v10 = -[CKTranscriptGroupHeaderView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(CKTranscriptGroupHeaderView *)v10 setConversation:v9];
    [(CKTranscriptGroupHeaderView *)v11 setAutoresizingMask:2];
    [(CKTranscriptGroupHeaderView *)v11 setAutoresizesSubviews:0];
    id v12 = objc_alloc(MEMORY[0x1E4F430A8]);
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:privateStyle:", 2010, *MEMORY[0x1E4F1DB28], v14, v15, v16);
    [(CKTranscriptGroupHeaderView *)v11 setBackdropView:v17];
    [(CKTranscriptGroupHeaderView *)v11 addSubview:v17];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5A168]), "initWithFrame:", v13, v14, v15, v16);
    [v18 setBackgroundColor:0];
    [v18 setAutoresizingMask:18];
    v19 = CKFrameworkBundle();
    v20 = [v19 localizedStringForKey:@"TO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v18 setLabel:v20];

    v21 = [v18 addButton];
    [v21 setHidden:1];

    [v18 setSeparatorHidden:1];
    [v18 setEditable:0];
    [v18 setUserInteractionEnabled:0];
    v22 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [v18 setInactiveTextColor:v22];

    [(CKTranscriptGroupHeaderView *)v11 setTextView:v18];
    [(CKTranscriptGroupHeaderView *)v11 addSubview:v18];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v14, v15, v16);
    v24 = +[CKUIBehavior sharedBehaviors];
    v25 = [v24 theme];
    v26 = [v25 entryFieldDividerColor];
    [v23 setBackgroundColor:v26];

    [(CKTranscriptGroupHeaderView *)v11 setSeparator:v23];
    [(CKTranscriptGroupHeaderView *)v11 addSubview:v23];
    v27 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [v27 setBackgroundColor:0];
    [(CKTranscriptGroupHeaderView *)v11 setActionButton:v27];
    [(CKTranscriptGroupHeaderView *)v11 addSubview:v27];
  }
  return v11;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CKTranscriptGroupHeaderView;
  [(CKTranscriptGroupHeaderView *)&v18 layoutSubviews];
  [(CKTranscriptGroupHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKTranscriptGroupHeaderView *)self backdropView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(CKTranscriptGroupHeaderView *)self textView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  double v13 = [(CKTranscriptGroupHeaderView *)self actionButton];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  if (CKPixelWidth_once_16 != -1) {
    dispatch_once(&CKPixelWidth_once_16, &__block_literal_global_206);
  }
  double v14 = *(double *)&CKPixelWidth_sPixel_16;
  [(CKTranscriptGroupHeaderView *)self bounds];
  double v16 = v15;
  v17 = [(CKTranscriptGroupHeaderView *)self separator];
  objc_msgSend(v17, "setFrame:", v4, v16, v8, v14);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CNComposeRecipientTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end