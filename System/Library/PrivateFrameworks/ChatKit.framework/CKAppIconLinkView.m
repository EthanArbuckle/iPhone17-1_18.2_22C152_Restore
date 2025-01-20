@interface CKAppIconLinkView
- (CGRect)linkFrame;
- (CKAppIconLinkView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4;
- (CKSyndicationOnboardingTailedBubble)tailedBubble;
- (NSMutableArray)constraints;
- (NSString)previewString;
- (UIView)previewView;
- (id)generateCroppedImageFromPreviewImage:(id)a3;
- (int64_t)appName;
- (void)setAppName:(int64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setLinkFrame:(CGRect)a3;
- (void)setPreviewImageForImage:(id)a3;
- (void)setPreviewString:(id)a3;
- (void)setPreviewView:(id)a3;
- (void)setTailedBubble:(id)a3;
- (void)setUpViewsForApp:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation CKAppIconLinkView

- (void)setUpViewsForApp:(int64_t)a3
{
  -[CKAppIconLinkView setAppName:](self, "setAppName:");
  if (a3 == 4)
  {
    v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightTV"];
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"WHATS_NEW_SYNDICATION_TV_FULL";
  }
  else if (a3 == 1)
  {
    v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightMusic"];
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"WHATS_NEW_SYNDICATION_MUSIC_FULL";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightSafari"];
    v6 = CKFrameworkBundle();
    v7 = v6;
    v8 = @"WHATS_NEW_SYNDICATION_SAFARI_FULL";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];
  previewString = self->_previewString;
  self->_previewString = v9;

  [(CKAppIconLinkView *)self setPreviewImageForImage:v5];
LABEL_8:
  id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
  v12 = [(CKAppIconLinkView *)self previewString];
  id v37 = (id)[v11 initWithString:v12];

  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E4F43870], 10.0);
  objc_msgSend(v37, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v37, "length"));

  int64_t v15 = [(CKAppIconLinkView *)self appName];
  switch(v15)
  {
    case 4:
      v20 = CKFrameworkBundle();
      v17 = [v20 localizedStringForKey:@"WHATS_NEW_SYNDICATION_TV_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v18 = (void *)MEMORY[0x1E4F1CB10];
      v19 = @"https://tv.apple.com/us/show/mythic-quest/umc.cmc.1nfdfd5zlk05fo1bwwetzldy3?ctx_brand=tvs.sbd.4000";
      goto LABEL_14;
    case 1:
      v21 = CKFrameworkBundle();
      v17 = [v21 localizedStringForKey:@"WHATS_NEW_SYNDICATION_MUSIC_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v18 = (void *)MEMORY[0x1E4F1CB10];
      v19 = @"https://music.apple.com/us/album/green-eyes/1534718812?i=1534719300";
      goto LABEL_14;
    case 0:
      v16 = CKFrameworkBundle();
      v17 = [v16 localizedStringForKey:@"WHATS_NEW_SYNDICATION_SAFARI_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v18 = (void *)MEMORY[0x1E4F1CB10];
      v19 = @"https://www.azuremagazine.com/article/atelier-schwimmer-completes-a-lake-cabin-for-two-fun-loving-brothers/";
LABEL_14:
      v22 = [v18 URLWithString:v19];
      uint64_t v23 = 0;
      goto LABEL_16;
  }
  uint64_t v23 = [v37 length];
  v22 = 0;
  v17 = 0;
LABEL_16:
  unint64_t v24 = [v17 length];
  if (v24 <= [v37 length]) {
    uint64_t v23 = [v17 length];
  }
  if (v23)
  {
    v25 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:10.0];
    objc_msgSend(v37, "addAttribute:value:range:", v13, v25, 0, v23);
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v26 setOriginalURL:v22];
  [v26 setURL:v22];
  v27 = [v22 absoluteString];
  if ([v27 hasPrefix:@"https://tv"])
  {
    uint64_t v28 = +[CKSyndicationOnboardingLinkBalloonView tvSpecialization];
LABEL_24:
    v29 = (void *)v28;
    [v26 setSpecialization:v28];
    goto LABEL_26;
  }
  if ([v27 hasPrefix:@"https://music"])
  {
    uint64_t v28 = +[CKSyndicationOnboardingLinkBalloonView musicSpecialization];
    goto LABEL_24;
  }
  v30 = CKFrameworkBundle();
  v31 = [v30 localizedStringForKey:@"WHATS_NEW_SYNDICATION_SAFARI_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v26 setTitle:v31];

  v32 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightSafari"];
  v29 = UIImagePNGRepresentation(v32);

  v33 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v29 MIMEType:@"image/jpeg"];
  [v26 setImage:v33];

LABEL_26:
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:v26];
  [v34 _setPreferredSizeClass:7];
  [v34 _setApplyCornerRadius:0];
  [v34 _setDisableTapGesture:1];
  [v34 _setDisableAnimations:1];
  [v34 _setForceFlexibleWidth:1];
  v35 = [CKSyndicationOnboardingTailedBubble alloc];
  v36 = -[CKSyndicationOnboardingTailedBubble initWithFrame:withAppName:withLPLinkView:](v35, "initWithFrame:withAppName:withLPLinkView:", a3, v34, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKSyndicationOnboardingTailedBubble *)v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKAppIconLinkView *)self setTailedBubble:v36];
  [(CKAppIconLinkView *)self addSubview:v36];
}

- (CKAppIconLinkView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CKAppIconLinkView;
  v9 = -[CKAppIconLinkView initWithFrame:](&v12, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    [(CKAppIconLinkView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CKAppIconLinkView *)v10 setUpViewsForApp:a4];
    -[CKAppIconLinkView setLinkFrame:](v10, "setLinkFrame:", x, y, width, height);
  }
  return v10;
}

- (void)updateConstraints
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CKAppIconLinkView *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(CKAppIconLinkView *)self constraints];
    [v5 deactivateConstraints:v6];
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  [(CKAppIconLinkView *)self setConstraints:v7];

  v22 = [(CKAppIconLinkView *)self constraints];
  v29 = [(CKAppIconLinkView *)self tailedBubble];
  uint64_t v28 = [v29 widthAnchor];
  v27 = [(CKAppIconLinkView *)self widthAnchor];
  id v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  v25 = [(CKAppIconLinkView *)self tailedBubble];
  unint64_t v24 = [v25 heightAnchor];
  uint64_t v23 = [(CKAppIconLinkView *)self heightAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v31[1] = v21;
  v20 = [(CKAppIconLinkView *)self tailedBubble];
  v8 = [v20 leadingAnchor];
  v9 = [(CKAppIconLinkView *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v31[2] = v10;
  id v11 = [(CKAppIconLinkView *)self tailedBubble];
  objc_super v12 = [v11 topAnchor];
  uint64_t v13 = [(CKAppIconLinkView *)self topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v31[3] = v14;
  int64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v22 addObjectsFromArray:v15];

  v16 = [(CKAppIconLinkView *)self constraints];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(CKAppIconLinkView *)self constraints];
    [v18 activateConstraints:v19];
  }
  v30.receiver = self;
  v30.super_class = (Class)CKAppIconLinkView;
  [(CKAppIconLinkView *)&v30 updateConstraints];
}

- (id)generateCroppedImageFromPreviewImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F42A60] preferredFormat];
    v6 = [(CKAppIconLinkView *)self traitCollection];
    [v6 displayScale];
    objc_msgSend(v5, "setScale:");

    [v5 setPreferredRange:0];
    [v4 size];
    double v8 = v7;
    [v4 size];
    float v10 = v8 * (23.0 / v9);
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v5, v10, 23.0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke;
    v22[3] = &unk_1E5626FF0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    id v23 = v4;
    double v26 = v10;
    uint64_t v27 = 0x4037000000000000;
    objc_super v12 = [v11 imageWithActions:v22];
    uint64_t v13 = [v12 imageWithRenderingMode:0];

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 23.0, 23.0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke_2;
    v19[3] = &unk_1E562B148;
    id v20 = v13;
    float v21 = v10;
    id v15 = v13;
    v16 = [v14 imageWithActions:v19];
    uint64_t v17 = [v16 imageWithRenderingMode:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __58__CKAppIconLinkView_generateCroppedImageFromPreviewImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", (float)((float)(*(float *)(a1 + 40) + -20.0) * -0.5), 0.0);
}

- (void)setPreviewImageForImage:(id)a3
{
  id v9 = [(CKAppIconLinkView *)self generateCroppedImageFromPreviewImage:a3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v9];
  [(CKAppIconLinkView *)self setPreviewView:v4];

  v5 = [(CKAppIconLinkView *)self previewView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(CKAppIconLinkView *)self previewView];
  double v7 = [v6 layer];
  [v7 setCornerRadius:6.0];

  double v8 = [(CKAppIconLinkView *)self previewView];
  [v8 setClipsToBounds:1];
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (CGRect)linkFrame
{
  double x = self->_linkFrame.origin.x;
  double y = self->_linkFrame.origin.y;
  double width = self->_linkFrame.size.width;
  double height = self->_linkFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLinkFrame:(CGRect)a3
{
  self->_linkFrame = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (NSString)previewString
{
  return self->_previewString;
}

- (void)setPreviewString:(id)a3
{
}

- (CKSyndicationOnboardingTailedBubble)tailedBubble
{
  return self->_tailedBubble;
}

- (void)setTailedBubble:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_tailedBubble, 0);
  objc_storeStrong((id *)&self->_previewString, 0);

  objc_storeStrong((id *)&self->_previewView, 0);
}

@end