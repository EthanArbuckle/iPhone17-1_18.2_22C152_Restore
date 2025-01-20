@interface EKUILabeledAvatarView
+ (id)_createAvatarView;
+ (id)contactKeysToFetch;
+ (id)sortedAvatarListFromParticipants:(id)a3;
- (BOOL)loadContactsAsynchronously;
- (CNAvatarView)avatar;
- (CNContact)contact;
- (EKUILabeledAvatarView)init;
- (EKUILabeledAvatarView)initWithContact:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5;
- (EKUILabeledAvatarView)initWithEmail:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 placement:(unint64_t)a7 options:(unint64_t)a8;
- (EKUILabeledAvatarView)initWithIdentity:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5;
- (EKUILabeledAvatarView)initWithPlacement:(unint64_t)a3 options:(unint64_t)a4;
- (EKUILabeledAvatarViewDelegate)delegate;
- (UILabel)label;
- (UIView)pressedAccentOverlay;
- (UIViewController)viewController;
- (unint64_t)labelPlacement;
- (unint64_t)options;
- (unint64_t)selectionState;
- (void)didLongPress;
- (void)didTap;
- (void)setAvatar:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelPlacement:(unint64_t)a3;
- (void)setLoadContactsAsynchronously:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPressedAccentOverlay:(id)a3;
- (void)setSelectionState:(unint64_t)a3;
- (void)setViewController:(id)a3;
- (void)setup;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateAvatarViewWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6;
- (void)updateLabel;
- (void)updateWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6;
- (void)updateWithContacts:(id)a3;
- (void)updateWithParticipant:(id)a3;
@end

@implementation EKUILabeledAvatarView

- (EKUILabeledAvatarView)init
{
  return [(EKUILabeledAvatarView *)self initWithContact:0 placement:0 options:0];
}

- (EKUILabeledAvatarView)initWithPlacement:(unint64_t)a3 options:(unint64_t)a4
{
  return [(EKUILabeledAvatarView *)self initWithContact:0 placement:a3 options:a4];
}

- (EKUILabeledAvatarView)initWithIdentity:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5
{
  id v7 = a3;
  v8 = [v7 phoneNumber];
  v9 = v8;
  if (!v8)
  {
    v9 = [v7 emailAddress];
  }
  v10 = [v7 name];
  v11 = [v7 firstName];
  v12 = [v7 lastName];
  v13 = [(id)objc_opt_class() contactKeysToFetch];
  v14 = +[ContactsUtils contactForAddress:v9 fullName:v10 firstName:v11 lastName:v12 keysToFetch:v13];

  if (!v8) {
  v15 = [(EKUILabeledAvatarView *)self initWithContact:v14 placement:a4 options:a5];
  }

  return v15;
}

- (EKUILabeledAvatarView)initWithEmail:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 placement:(unint64_t)a7 options:(unint64_t)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(id)objc_opt_class() contactKeysToFetch];
  v19 = +[ContactsUtils contactForAddress:v17 fullName:v16 firstName:v15 lastName:v14 keysToFetch:v18];

  v20 = [(EKUILabeledAvatarView *)self initWithContact:v19 placement:a7 options:a8];
  return v20;
}

- (EKUILabeledAvatarView)initWithContact:(id)a3 placement:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKUILabeledAvatarView;
  v9 = -[EKUILabeledAvatarView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v9)
  {
    uint64_t v10 = [(id)objc_opt_class() _createAvatarView];
    avatar = v9->_avatar;
    v9->_avatar = (CNAvatarView *)v10;

    v9->_labelPlacement = a4;
    v9->_options = a5;
    if (v8) {
      [(CNAvatarView *)v9->_avatar setContact:v8];
    }
    [(EKUILabeledAvatarView *)v9 setup];
  }

  return v9;
}

+ (id)contactKeysToFetch
{
  if (contactKeysToFetch_onceToken != -1) {
    dispatch_once(&contactKeysToFetch_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)contactKeysToFetch_keysToFetch;

  return v2;
}

void __43__EKUILabeledAvatarView_contactKeysToFetch__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [(id)EKWeakLinkClass() descriptorForRequiredKeys];
  v1 = objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys", v0);
  v5[1] = v1;
  v2 = [(id)EKWeakLinkClass() descriptorForRequiredKeys];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v4 = (void *)contactKeysToFetch_keysToFetch;
  contactKeysToFetch_keysToFetch = v3;
}

+ (id)_createAvatarView
{
  EKWeakLinkClass();
  v2 = objc_opt_new();
  EKWeakLinkClass();
  uint64_t v3 = objc_opt_new();
  [v2 setContact:v3];

  [v2 setShowsContactOnTap:0];
  [v2 setThreeDTouchEnabled:0];

  return v2;
}

- (void)setup
{
  v133[1] = *MEMORY[0x1E4F143B8];
  self->_selectionState = 0;
  if ((self->_options & 4) != 0)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTap];
    [(EKUILabeledAvatarView *)self addGestureRecognizer:v3];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_didLongPress];
    [(EKUILabeledAvatarView *)self addGestureRecognizer:v4];
  }
  v5 = [(EKUILabeledAvatarView *)self avatar];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(EKUILabeledAvatarView *)self avatar];
  [(EKUILabeledAvatarView *)self addSubview:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(EKUILabeledAvatarView *)self setPressedAccentOverlay:v7];

  id v8 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  uint64_t v10 = [v9 layer];
  [v10 setCornerRadius:22.0];

  v11 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  v12 = [v11 layer];
  [v12 setMasksToBounds:1];

  objc_super v13 = CalendarAppTintColor();
  id v14 = [v13 colorWithAlphaComponent:0.3];
  id v15 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  [v15 setBackgroundColor:v14];

  id v16 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  [v16 setHidden:1];

  id v17 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
  [(EKUILabeledAvatarView *)self addSubview:v17];

  id v18 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v132 = @"avatar";
  v19 = [(EKUILabeledAvatarView *)self avatar];
  v133[0] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:&v132 count:1];
  v21 = (void *)[v18 initWithDictionary:v20];

  if ([(EKUILabeledAvatarView *)self labelPlacement])
  {
    v22 = objc_opt_new();
    [(EKUILabeledAvatarView *)self setLabel:v22];

    v23 = [(EKUILabeledAvatarView *)self label];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = [(EKUILabeledAvatarView *)self label];
    [(EKUILabeledAvatarView *)self addSubview:v24];

    v25 = [(EKUILabeledAvatarView *)self label];
    LODWORD(v26) = 1148846080;
    [v25 setContentHuggingPriority:1 forAxis:v26];

    v27 = [(EKUILabeledAvatarView *)self label];
    LODWORD(v28) = 1148846080;
    [v27 setContentHuggingPriority:0 forAxis:v28];

    v29 = [(EKUILabeledAvatarView *)self label];
    LODWORD(v30) = 1148846080;
    [v29 setContentCompressionResistancePriority:1 forAxis:v30];

    v31 = [(EKUILabeledAvatarView *)self label];
    LODWORD(v32) = 1148846080;
    [v31 setContentCompressionResistancePriority:0 forAxis:v32];

    id v33 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v130[0] = @"avatar";
    v34 = [(EKUILabeledAvatarView *)self avatar];
    v130[1] = @"label";
    v131[0] = v34;
    v35 = [(EKUILabeledAvatarView *)self label];
    v131[1] = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:2];
    v37 = (void *)[v33 initWithDictionary:v36];

    switch([(EKUILabeledAvatarView *)self labelPlacement])
    {
      case 1uLL:
        v38 = [(EKUILabeledAvatarView *)self label];
        [v38 setTextAlignment:2];

        v39 = (void *)MEMORY[0x1E4F28DC8];
        v40 = [(EKUILabeledAvatarView *)self avatar];
        v41 = [(EKUILabeledAvatarView *)self avatar];
        v42 = [v39 constraintWithItem:v40 attribute:7 relatedBy:0 toItem:v41 attribute:8 multiplier:1.0 constant:0.0];
        [v42 setActive:1];

        v43 = (void *)MEMORY[0x1E4F28DC8];
        v44 = [(EKUILabeledAvatarView *)self avatar];
        v45 = [(EKUILabeledAvatarView *)self label];
        v46 = [v43 constraintWithItem:v44 attribute:8 relatedBy:0 toItem:v45 attribute:8 multiplier:1.0 constant:0.0];
        [v46 setActive:1];

        v47 = (void *)MEMORY[0x1E4F28DC8];
        v48 = @"H:|-(>=0)-[label]-[avatar]|";
        goto LABEL_8;
      case 2uLL:
        v60 = [(EKUILabeledAvatarView *)self label];
        [v60 setTextAlignment:0];

        v61 = (void *)MEMORY[0x1E4F28DC8];
        v62 = [(EKUILabeledAvatarView *)self avatar];
        v63 = [(EKUILabeledAvatarView *)self avatar];
        v64 = [v61 constraintWithItem:v62 attribute:7 relatedBy:0 toItem:v63 attribute:8 multiplier:1.0 constant:0.0];
        [v64 setActive:1];

        v65 = (void *)MEMORY[0x1E4F28DC8];
        v66 = [(EKUILabeledAvatarView *)self avatar];
        v67 = [(EKUILabeledAvatarView *)self label];
        v68 = [v65 constraintWithItem:v66 attribute:8 relatedBy:0 toItem:v67 attribute:8 multiplier:1.0 constant:0.0];
        [v68 setActive:1];

        v47 = (void *)MEMORY[0x1E4F28DC8];
        v48 = @"H:|[avatar]-[label]-(>=0)-|";
LABEL_8:
        v69 = [v47 constraintsWithVisualFormat:v48 options:1024 metrics:0 views:v37];
        [v47 activateConstraints:v69];

        v70 = (void *)MEMORY[0x1E4F28DC8];
        v71 = @"V:|-(>=0)-[avatar]-(>=0)-|";
        goto LABEL_10;
      case 3uLL:
        v72 = [(EKUILabeledAvatarView *)self label];
        [v72 setTextAlignment:4];

        v73 = (void *)MEMORY[0x1E4F28DC8];
        v74 = [(EKUILabeledAvatarView *)self avatar];
        v75 = [(EKUILabeledAvatarView *)self avatar];
        v76 = [v73 constraintWithItem:v74 attribute:7 relatedBy:0 toItem:v75 attribute:8 multiplier:1.0 constant:0.0];
        [v76 setActive:1];

        v77 = (void *)MEMORY[0x1E4F28DC8];
        v78 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[avatar]-[label]|" options:1024 metrics:0 views:v37];
        [v77 activateConstraints:v78];

        v70 = (void *)MEMORY[0x1E4F28DC8];
        v71 = @"V:|-[avatar]-|";
LABEL_10:
        v79 = [v70 constraintsWithVisualFormat:v71 options:0 metrics:0 views:v37];
        [v70 activateConstraints:v79];

        v80 = (void *)MEMORY[0x1E4F28DC8];
        v81 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(>=0)-[label]-(>=0)-|" options:0 metrics:0 views:v37];
        [v80 activateConstraints:v81];

        v82 = (void *)MEMORY[0x1E4F28DC8];
        v83 = [(EKUILabeledAvatarView *)self avatar];
        double v84 = 1.0;
        v85 = v82;
        v86 = v83;
        uint64_t v87 = 10;
        v88 = self;
        uint64_t v89 = 10;
        goto LABEL_12;
      case 4uLL:
        v90 = (void *)MEMORY[0x1E4F28DC8];
        v91 = [(EKUILabeledAvatarView *)self avatar];
        v92 = [(EKUILabeledAvatarView *)self avatar];
        v93 = [v90 constraintWithItem:v91 attribute:7 relatedBy:0 toItem:v92 attribute:8 multiplier:1.0 constant:0.0];
        [v93 setActive:1];

        v94 = (void *)MEMORY[0x1E4F28DC8];
        v95 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[label][avatar]|" options:512 metrics:0 views:v37];
        [v94 activateConstraints:v95];

        v96 = (void *)MEMORY[0x1E4F28DC8];
        v97 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[avatar]-(>=0)-|" options:0 metrics:0 views:v37];
        [v96 activateConstraints:v97];

        v98 = (void *)MEMORY[0x1E4F28DC8];
        v99 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[label]-(>=0)-|" options:0 metrics:0 views:v37];
        [v98 activateConstraints:v99];

        v100 = (void *)MEMORY[0x1E4F28DC8];
        v83 = [(EKUILabeledAvatarView *)self avatar];
        double v84 = 1.0;
        v85 = v100;
        v86 = v83;
        uint64_t v87 = 9;
        v88 = self;
        uint64_t v89 = 9;
LABEL_12:
        v101 = [v85 constraintWithItem:v86 attribute:v87 relatedBy:0 toItem:v88 attribute:v89 multiplier:v84 constant:0.0];
        [v101 setActive:1];
        goto LABEL_14;
      case 5uLL:
        v102 = [(EKUILabeledAvatarView *)self label];
        [v102 setTextAlignment:1];

        v103 = (void *)MEMORY[0x1E4F28DC8];
        v104 = [(EKUILabeledAvatarView *)self avatar];
        v105 = [(EKUILabeledAvatarView *)self avatar];
        v106 = [v103 constraintWithItem:v104 attribute:7 relatedBy:0 toItem:v105 attribute:8 multiplier:1.0 constant:0.0];
        [v106 setActive:1];

        v107 = (void *)MEMORY[0x1E4F28DC8];
        v108 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[avatar][label]|" options:512 metrics:&unk_1F0D03DD0 views:v37];
        [v107 activateConstraints:v108];

        v109 = (void *)MEMORY[0x1E4F28DC8];
        v110 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[avatar]-(>=0)-|" options:0 metrics:&unk_1F0D03DD0 views:v37];
        [v109 activateConstraints:v110];

        v111 = (void *)MEMORY[0x1E4F28DC8];
        v112 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(>=0)-[label]-(>=0)-|" options:0 metrics:&unk_1F0D03DD0 views:v37];
        [v111 activateConstraints:v112];

        v113 = (void *)MEMORY[0x1E4F28DC8];
        v114 = [(EKUILabeledAvatarView *)self avatar];
        v115 = [v113 constraintWithItem:v114 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
        [v115 setActive:1];

        v116 = (void *)MEMORY[0x1E4F28DC8];
        v117 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
        v118 = [(EKUILabeledAvatarView *)self avatar];
        v119 = [v116 constraintWithItem:v117 attribute:5 relatedBy:0 toItem:v118 attribute:5 multiplier:1.0 constant:0.0];
        [v119 setActive:1];

        v120 = (void *)MEMORY[0x1E4F28DC8];
        v121 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
        v122 = [(EKUILabeledAvatarView *)self avatar];
        v123 = [v120 constraintWithItem:v121 attribute:6 relatedBy:0 toItem:v122 attribute:6 multiplier:1.0 constant:0.0];
        [v123 setActive:1];

        v124 = (void *)MEMORY[0x1E4F28DC8];
        v125 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
        v126 = [(EKUILabeledAvatarView *)self avatar];
        v127 = [v124 constraintWithItem:v125 attribute:3 relatedBy:0 toItem:v126 attribute:3 multiplier:1.0 constant:0.0];
        [v127 setActive:1];

        v128 = (void *)MEMORY[0x1E4F28DC8];
        v83 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
        v101 = [(EKUILabeledAvatarView *)self avatar];
        v129 = [v128 constraintWithItem:v83 attribute:4 relatedBy:0 toItem:v101 attribute:4 multiplier:1.0 constant:0.0];
        [v129 setActive:1];

LABEL_14:
        break;
      default:
        break;
    }
    [(EKUILabeledAvatarView *)self updateLabel];
  }
  else
  {
    v49 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[avatar]|" options:0 metrics:0 views:v21];
    [v49 activateConstraints:v50];

    v51 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[avatar]-(0@999)-|" options:0 metrics:0 views:v21];
    [v51 activateConstraints:v52];

    v53 = (void *)MEMORY[0x1E4F28DC8];
    v54 = [(EKUILabeledAvatarView *)self avatar];
    v55 = [v53 constraintWithItem:v54 attribute:8 relatedBy:0 toItem:self attribute:8 multiplier:1.0 constant:0.0];
    [v55 setActive:1];

    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = [(EKUILabeledAvatarView *)self avatar];
    v58 = [(EKUILabeledAvatarView *)self avatar];
    v59 = [v56 constraintWithItem:v57 attribute:7 relatedBy:0 toItem:v58 attribute:8 multiplier:1.0 constant:0.0];
    [v59 setActive:1];

    v37 = v21;
  }
}

- (CNContact)contact
{
  v2 = [(EKUILabeledAvatarView *)self avatar];
  uint64_t v3 = [v2 contact];

  return (CNContact *)v3;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  v5 = [(EKUILabeledAvatarView *)self avatar];
  [v5 setContact:v4];

  [(EKUILabeledAvatarView *)self updateLabel];
}

- (void)updateLabel
{
  if (![(EKUILabeledAvatarView *)self labelPlacement]) {
    return;
  }
  if ([(EKUILabeledAvatarView *)self options])
  {
    objc_super v13 = (void *)EKWeakLinkClass();
    id v16 = [(EKUILabeledAvatarView *)self avatar];
    v5 = [v16 contact];
    uint64_t v12 = [v13 stringFromContact:v5 style:0];
    goto LABEL_12;
  }
  char v3 = [(EKUILabeledAvatarView *)self options];
  id v16 = [(EKUILabeledAvatarView *)self avatar];
  id v4 = [v16 contact];
  v5 = v4;
  if ((v3 & 2) == 0)
  {
LABEL_11:
    uint64_t v12 = [v4 givenName];
    goto LABEL_12;
  }
  uint64_t v6 = [v4 nickname];
  if (!v6)
  {

    goto LABEL_10;
  }
  id v7 = (void *)v6;
  id v8 = [(EKUILabeledAvatarView *)self avatar];
  v9 = [v8 contact];
  uint64_t v10 = [v9 nickname];
  char v11 = [v10 isEqual:&stru_1F0CC2140];

  if (v11)
  {
LABEL_10:
    id v16 = [(EKUILabeledAvatarView *)self avatar];
    id v4 = [v16 contact];
    v5 = v4;
    goto LABEL_11;
  }
  id v16 = [(EKUILabeledAvatarView *)self avatar];
  v5 = [v16 contact];
  uint64_t v12 = [v5 nickname];
LABEL_12:
  id v14 = (void *)v12;
  id v15 = [(EKUILabeledAvatarView *)self label];
  [v15 setText:v14];
}

- (void)updateWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  [(EKUILabeledAvatarView *)self updateAvatarViewWithAddress:a3 fullName:a4 firstName:a5 lastName:a6];

  [(EKUILabeledAvatarView *)self updateLabel];
}

- (void)updateWithParticipant:(id)a3
{
  id v13 = a3;
  v5 = [v13 emailAddress];
  uint64_t v6 = v5;
  if (!v5)
  {
    char v3 = [v13 URL];
    uint64_t v6 = [v3 resourceSpecifier];
  }
  id v7 = [v13 name];
  id v8 = [v13 firstName];
  v9 = [v13 lastName];
  [(EKUILabeledAvatarView *)self updateAvatarViewWithAddress:v6 fullName:v7 firstName:v8 lastName:v9];

  if (!v5)
  {
  }
  [(EKUILabeledAvatarView *)self updateLabel];
  if ((self->_options & 8) != 0)
  {
    uint64_t v10 = [v13 participantStatus];
    double v11 = 0.3;
    if (v10 == 2) {
      double v11 = 1.0;
    }
    [(EKUILabeledAvatarView *)self setAlpha:v11];
  }
  uint64_t v12 = [(EKUILabeledAvatarView *)self avatar];
  [v12 setNeedsLayout];
}

- (void)updateWithContacts:(id)a3
{
  id v4 = a3;
  v5 = [(EKUILabeledAvatarView *)self avatar];
  [v5 setContacts:v4];

  [(EKUILabeledAvatarView *)self updateLabel];
  id v6 = [(EKUILabeledAvatarView *)self avatar];
  [v6 setNeedsLayout];
}

- (void)updateAvatarViewWithAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__10;
  v32[4] = __Block_byref_object_dispose__10;
  id v33 = 0;
  BOOL v14 = [(EKUILabeledAvatarView *)self loadContactsAsynchronously];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke;
  aBlock[3] = &unk_1E6089688;
  double v30 = v32;
  id v15 = v10;
  id v25 = v15;
  id v16 = v11;
  id v26 = v16;
  id v17 = v12;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  v29 = self;
  BOOL v31 = v14;
  v19 = _Block_copy(aBlock);
  v20 = v19;
  if (v14)
  {
    v21 = dispatch_get_global_queue(0, 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_3;
    v22[3] = &unk_1E6087BD8;
    id v23 = v20;
    dispatch_async(v21, v22);
  }
  else
  {
    (*((void (**)(void *))v19 + 2))(v19);
  }

  _Block_object_dispose(v32, 8);
}

void __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [(id)objc_opt_class() contactKeysToFetch];
  uint64_t v7 = +[ContactsUtils contactForAddress:v2 fullName:v3 firstName:v4 lastName:v5 keysToFetch:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(unsigned char *)(a1 + 80))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_2;
    block[3] = &unk_1E6089660;
    long long v14 = *(_OWORD *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v10 = *(void **)(a1 + 64);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v12 = [v10 avatar];
    [v12 setContact:v11];
  }
}

void __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v2 = [*(id *)(a1 + 32) avatar];
  [v2 setContact:v1];
}

uint64_t __81__EKUILabeledAvatarView_updateAvatarViewWithAddress_fullName_firstName_lastName___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSelectionState:(unint64_t)a3
{
  if (self->_selectionState == a3) {
    return;
  }
  self->_selectionState = a3;
  switch(a3)
  {
    case 2uLL:
      [(EKUILabeledAvatarView *)self setAlpha:0.3];
      break;
    case 1uLL:
      [(EKUILabeledAvatarView *)self setAlpha:1.0];
      uint64_t v7 = [(EKUILabeledAvatarView *)self avatar];
      [v7 setAlpha:0.5];

      uint64_t v5 = [(EKUILabeledAvatarView *)self label];
      id v8 = v5;
      double v6 = 0.5;
      goto LABEL_11;
    case 0uLL:
      [(EKUILabeledAvatarView *)self setAlpha:1.0];
      uint64_t v4 = [(EKUILabeledAvatarView *)self avatar];
      [v4 setAlpha:1.0];

      uint64_t v5 = [(EKUILabeledAvatarView *)self label];
      id v8 = v5;
      double v6 = 1.0;
LABEL_11:
      [v5 setAlpha:v6];

      return;
  }

  [(EKUILabeledAvatarView *)self setAlpha:1.0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(EKUILabeledAvatarView *)self options] & 4) != 0)
  {
    id v8 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
    [v8 setHidden:0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    [(EKUILabeledAvatarView *)&v9 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(EKUILabeledAvatarView *)self options] & 4) != 0)
  {
    id v8 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
    [v8 setHidden:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    [(EKUILabeledAvatarView *)&v9 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(EKUILabeledAvatarView *)self options] & 4) != 0)
  {
    id v8 = [(EKUILabeledAvatarView *)self pressedAccentOverlay];
    [v8 setHidden:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EKUILabeledAvatarView;
    [(EKUILabeledAvatarView *)&v9 touchesCancelled:v6 withEvent:v7];
  }
}

- (void)didTap
{
  if ([(EKUILabeledAvatarView *)self selectionState])
  {
    if ([(EKUILabeledAvatarView *)self selectionState] != 1) {
      goto LABEL_6;
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  [(EKUILabeledAvatarView *)self setSelectionState:v3];
LABEL_6:
  uint64_t v4 = [(EKUILabeledAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(EKUILabeledAvatarView *)self delegate];
    [v6 avatarViewTapped:self];
  }
}

- (void)didLongPress
{
  uint64_t v3 = [(EKUILabeledAvatarView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(EKUILabeledAvatarView *)self delegate];
    [v5 avatarViewLongPressed:self];
  }
}

+ (id)sortedAvatarListFromParticipants:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [EKUILabeledAvatarView alloc];
        id v12 = -[EKUILabeledAvatarView initWithIdentity:placement:options:](v11, "initWithIdentity:placement:options:", v10, 5, 0, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_83];

  return v4;
}

uint64_t __58__EKUILabeledAvatarView_sortedAvatarListFromParticipants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 contact];
  uint64_t v6 = [v5 givenName];
  uint64_t v7 = [v4 contact];

  uint64_t v8 = [v7 givenName];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (EKUILabeledAvatarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKUILabeledAvatarViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLabel:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (BOOL)loadContactsAsynchronously
{
  return self->_loadContactsAsynchronously;
}

- (void)setLoadContactsAsynchronously:(BOOL)a3
{
  self->_loadContactsAsynchronously = a3;
}

- (CNAvatarView)avatar
{
  return (CNAvatarView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setAvatar:(id)a3
{
}

- (UIView)pressedAccentOverlay
{
  return (UIView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setPressedAccentOverlay:(id)a3
{
}

- (unint64_t)labelPlacement
{
  return self->_labelPlacement;
}

- (void)setLabelPlacement:(unint64_t)a3
{
  self->_labelPlacement = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressedAccentOverlay, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end