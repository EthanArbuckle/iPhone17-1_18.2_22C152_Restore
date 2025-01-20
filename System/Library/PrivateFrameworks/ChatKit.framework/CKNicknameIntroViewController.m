@interface CKNicknameIntroViewController
- (CKNicknamePreviewView)nicknamePreviewView;
- (double)_contentViewHeight;
- (void)setNicknamePreviewView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKNicknameIntroViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKNicknameIntroViewController;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(CKNicknameIntroViewController *)self contentView];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKNicknameIntroViewController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  v4 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v4 setShouldStopAnimation:0];

  objc_super v5 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v5 beginAnimation];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKNicknameIntroViewController;
  [(CKNicknameIntroViewController *)&v5 viewWillDisappear:a3];
  v4 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v4 setShouldStopAnimation:1];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CKNicknameIntroViewController;
  [(OBBaseWelcomeController *)&v14 viewDidLayoutSubviews];
  v3 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v3 frame];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [(CKNicknameIntroViewController *)self contentView];
  [v10 frame];
  double Width = CGRectGetWidth(v15);
  v16.origin.y = 15.0;
  v16.origin.x = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  double v12 = (Width - CGRectGetWidth(v16)) * 0.5;

  v13 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  objc_msgSend(v13, "setFrame:", v12, 15.0, v7, v9);
}

- (double)_contentViewHeight
{
  v3 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v3 sizeToFit];

  double v4 = [(CKNicknameIntroViewController *)self nicknamePreviewView];
  [v4 frame];
  double v6 = v5 + 15.0 + 20.0;

  return v6;
}

- (CKNicknamePreviewView)nicknamePreviewView
{
  return self->_nicknamePreviewView;
}

- (void)setNicknamePreviewView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end