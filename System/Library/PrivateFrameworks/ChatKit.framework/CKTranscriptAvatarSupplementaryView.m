@interface CKTranscriptAvatarSupplementaryView
+ (id)supplementaryViewKindPrefix;
- (CKAvatarView)avatarView;
- (CKTranscriptAvatarSupplementaryView)initWithFrame:(CGRect)a3;
- (void)configureForChatItem:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)setAvatarView:(id)a3;
@end

@implementation CKTranscriptAvatarSupplementaryView

- (CKTranscriptAvatarSupplementaryView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptAvatarSupplementaryView;
  v3 = -[CKTranscriptAvatarSupplementaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKAvatarView alloc];
    v5 = +[CKUIBehavior sharedBehaviors];
    [v5 transcriptContactImageDiameter];
    double v7 = v6;
    v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptContactImageDiameter];
    v10 = -[CKAvatarView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, v7, v9);

    [(CNAvatarView *)v10 setShowsContactOnTap:0];
    [(CNAvatarView *)v10 setForcePressView:v10];
    [(CKTranscriptAvatarSupplementaryView *)v3 addSubview:v10];
    [(CKTranscriptAvatarSupplementaryView *)v3 setAvatarView:v10];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(CKTranscriptAvatarSupplementaryView *)self avatarView];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptAvatarSupplementaryView;
  [(CKTranscriptAvatarSupplementaryView *)&v4 dealloc];
}

+ (id)supplementaryViewKindPrefix
{
  return @"a:";
}

- (void)configureForChatItem:(id)a3 context:(id)a4
{
  id v15 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v6 = v15;
  if (isKindOfClass & 1) != 0 || (objc_opt_class(), v7 = objc_opt_isKindOfClass(), double v6 = v15, (v7))
  {
    v8 = [v6 contact];
    if (objc_opt_respondsToSelector())
    {
      double v9 = [v15 sender];
      v10 = [v9 ID];
    }
    else
    {
      v10 = 0;
    }
    v11 = [(CKTranscriptAvatarSupplementaryView *)self avatarView];
    [v11 setPreferredHandle:v10];

    objc_super v12 = [(CKTranscriptAvatarSupplementaryView *)self avatarView];
    [v12 setContact:v8];

    uint64_t v13 = [v15 hasTail] ^ 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = v13 & ([v15 wantsTranscriptGroupMonograms] ^ 1);
    }
    v14 = [(CKTranscriptAvatarSupplementaryView *)self avatarView];
    [v14 setHidden:v13];

    double v6 = v15;
  }
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end