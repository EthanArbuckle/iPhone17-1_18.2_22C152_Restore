@interface CKAppIconView
- (CKAppIconView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4;
- (NSMutableArray)constraints;
- (UIView)activityItemView;
- (UIView)contactItemView;
- (int64_t)appName;
- (void)setActivityItemView:(id)a3;
- (void)setAppName:(int64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setContactItemView:(id)a3;
- (void)setUpSubviews;
- (void)updateConstraints;
@end

@implementation CKAppIconView

- (CKAppIconView)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKAppIconView;
  v5 = -[CKAppIconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKAppIconView *)v5 setAppName:a4];
    [(CKAppIconView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CKAppIconView *)v6 setUpSubviews];
  }
  return v6;
}

- (void)setUpSubviews
{
  switch([(CKAppIconView *)self appName])
  {
    case 0:
      v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"Syndication_Avatar1";
      goto LABEL_7;
    case 1:
      v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"Syndication_Avatar2";
      goto LABEL_7;
    case 2:
      v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightPhotos"];
      v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Syndication_Avatar3"];
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
      [(CKAppIconView *)self setActivityItemView:v7];

      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v6];
      [(CKAppIconView *)self setContactItemView:v8];

      goto LABEL_11;
    case 3:
      v9 = (void *)MEMORY[0x1E4F42A80];
      v10 = @"Syndication_Avatar4";
      goto LABEL_9;
    case 4:
      v3 = (void *)MEMORY[0x1E4F42A80];
      v4 = @"Syndication_Avatar5";
LABEL_7:
      v5 = [v3 ckImageNamed:v4];
      v11 = [CKAppIconLinkView alloc];
      int64_t v12 = [(CKAppIconView *)self appName];
      v13 = -[CKAppIconLinkView initWithFrame:withAppName:](v11, "initWithFrame:withAppName:", v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKAppIconView *)self setActivityItemView:v13];

      goto LABEL_10;
    case 5:
      v9 = (void *)MEMORY[0x1E4F42A80];
      v10 = @"Syndication_Avatar6";
LABEL_9:
      v5 = [v9 ckImageNamed:v10];
      [(CKAppIconView *)self setActivityItemView:0];
LABEL_10:
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
      [(CKAppIconView *)self setContactItemView:v6];
LABEL_11:

      break;
    default:
      break;
  }
  v14 = [(CKAppIconView *)self activityItemView];

  if (v14)
  {
    v15 = [(CKAppIconView *)self activityItemView];
    [(CKAppIconView *)self addSubview:v15];

    v16 = [(CKAppIconView *)self activityItemView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v17 = [(CKAppIconView *)self contactItemView];
  [(CKAppIconView *)self addSubview:v17];

  id v18 = [(CKAppIconView *)self contactItemView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)updateConstraints
{
  v90[8] = *MEMORY[0x1E4F143B8];
  v3 = [(CKAppIconView *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(CKAppIconView *)self constraints];
    [v5 deactivateConstraints:v6];
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  [(CKAppIconView *)self setConstraints:v7];

  switch([(CKAppIconView *)self appName])
  {
    case 0:
      v72 = [(CKAppIconView *)self constraints];
      v71 = [(CKAppIconView *)self activityItemView];
      v70 = [v71 widthAnchor];
      uint64_t v67 = [(CKAppIconView *)self heightAnchor];
      uint64_t v65 = [v70 constraintEqualToAnchor:v67 multiplier:2.8];
      v90[0] = v65;
      v69 = [(CKAppIconView *)self activityItemView];
      v64 = [v69 heightAnchor];
      uint64_t v63 = [(CKAppIconView *)self heightAnchor];
      v83 = [v64 constraintEqualToAnchor:v63 multiplier:0.98];
      v90[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      objc_super v8 = [v82 widthAnchor];
      uint64_t v62 = [(CKAppIconView *)self heightAnchor];
      v81 = v8;
      v80 = [v8 constraintEqualToAnchor:v62 multiplier:0.35];
      v90[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v9 = [v79 heightAnchor];
      v77 = [(CKAppIconView *)self heightAnchor];
      v78 = v9;
      v76 = objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", 0.35);
      v90[3] = v76;
      v75 = [(CKAppIconView *)self contactItemView];
      v61 = [v75 leadingAnchor];
      v60 = [(CKAppIconView *)self leadingAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v90[4] = v59;
      v58 = [(CKAppIconView *)self contactItemView];
      v57 = [v58 bottomAnchor];
      v56 = [(CKAppIconView *)self bottomAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v90[5] = v55;
      v54 = [(CKAppIconView *)self activityItemView];
      v52 = [v54 leadingAnchor];
      v53 = [(CKAppIconView *)self contactItemView];
      v10 = [v53 leadingAnchor];
      v11 = [v52 constraintEqualToAnchor:v10];
      v90[6] = v11;
      int64_t v12 = [(CKAppIconView *)self activityItemView];
      v13 = [v12 bottomAnchor];
      v14 = [(CKAppIconView *)self contactItemView];
      v15 = [v14 topAnchor];
      v16 = [v13 constraintEqualToAnchor:v15 constant:-3.0];
      v90[7] = v16;
      v17 = (void *)MEMORY[0x1E4F1C978];
      id v18 = v90;
      goto LABEL_9;
    case 1:
      v72 = [(CKAppIconView *)self constraints];
      v71 = [(CKAppIconView *)self activityItemView];
      v70 = [v71 widthAnchor];
      uint64_t v67 = [(CKAppIconView *)self heightAnchor];
      uint64_t v65 = [v70 constraintEqualToAnchor:v67 multiplier:2.17];
      v89[0] = v65;
      v69 = [(CKAppIconView *)self activityItemView];
      v64 = [v69 heightAnchor];
      uint64_t v63 = [(CKAppIconView *)self heightAnchor];
      v83 = [v64 constraintEqualToAnchor:v63 multiplier:0.98];
      v89[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      v19 = [v82 widthAnchor];
      uint64_t v62 = [(CKAppIconView *)self heightAnchor];
      v81 = v19;
      v80 = [v19 constraintEqualToAnchor:v62 multiplier:0.35];
      v89[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v20 = [v79 heightAnchor];
      v77 = [(CKAppIconView *)self heightAnchor];
      v78 = v20;
      v76 = objc_msgSend(v20, "constraintEqualToAnchor:multiplier:", 0.35);
      v89[3] = v76;
      v75 = [(CKAppIconView *)self activityItemView];
      v61 = [v75 leadingAnchor];
      v60 = [(CKAppIconView *)self leadingAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v89[4] = v59;
      v58 = [(CKAppIconView *)self activityItemView];
      v57 = [v58 bottomAnchor];
      v56 = [(CKAppIconView *)self bottomAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v89[5] = v55;
      v54 = [(CKAppIconView *)self activityItemView];
      v52 = [v54 trailingAnchor];
      v53 = [(CKAppIconView *)self contactItemView];
      v10 = [v53 trailingAnchor];
      v11 = [v52 constraintEqualToAnchor:v10];
      v89[6] = v11;
      int64_t v12 = [(CKAppIconView *)self activityItemView];
      v13 = [v12 topAnchor];
      v14 = [(CKAppIconView *)self contactItemView];
      v15 = [v14 bottomAnchor];
      v16 = [v13 constraintEqualToAnchor:v15 constant:5.0];
      v89[7] = v16;
      v17 = (void *)MEMORY[0x1E4F1C978];
      id v18 = v89;
      goto LABEL_9;
    case 2:
      v73 = [(CKAppIconView *)self constraints];
      v71 = [(CKAppIconView *)self activityItemView];
      v70 = [v71 widthAnchor];
      uint64_t v68 = [(CKAppIconView *)self heightAnchor];
      uint64_t v66 = [v70 constraintEqualToAnchor:v68 multiplier:2.45];
      v88[0] = v66;
      v69 = [(CKAppIconView *)self activityItemView];
      v64 = [v69 heightAnchor];
      uint64_t v63 = [(CKAppIconView *)self heightAnchor];
      v83 = [v64 constraintEqualToAnchor:v63 multiplier:2.1];
      v88[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      v21 = [v82 widthAnchor];
      uint64_t v62 = [(CKAppIconView *)self heightAnchor];
      v81 = v21;
      v80 = [v21 constraintEqualToAnchor:v62 multiplier:0.35];
      v88[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v22 = [v79 heightAnchor];
      v77 = [(CKAppIconView *)self heightAnchor];
      v78 = v22;
      v76 = objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", 0.35);
      v88[3] = v76;
      v75 = [(CKAppIconView *)self contactItemView];
      v61 = [v75 bottomAnchor];
      v60 = [(CKAppIconView *)self bottomAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v88[4] = v59;
      v58 = [(CKAppIconView *)self contactItemView];
      v57 = [v58 trailingAnchor];
      v56 = [(CKAppIconView *)self trailingAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v88[5] = v55;
      v54 = [(CKAppIconView *)self activityItemView];
      v52 = [v54 trailingAnchor];
      v53 = [(CKAppIconView *)self contactItemView];
      v10 = [v53 trailingAnchor];
      v11 = [v52 constraintEqualToAnchor:v10 constant:30.0];
      v88[6] = v11;
      int64_t v12 = [(CKAppIconView *)self activityItemView];
      v13 = [v12 centerYAnchor];
      v14 = [(CKAppIconView *)self contactItemView];
      v23 = [v14 topAnchor];
      v24 = [v13 constraintEqualToAnchor:v23 constant:-25.0];
      v88[7] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:8];
      v26 = v73;
      [v73 addObjectsFromArray:v25];

      v27 = (void *)v66;
      v28 = (void *)v68;

      goto LABEL_10;
    case 3:
      v74 = [(CKAppIconView *)self constraints];
      v29 = [(CKAppIconView *)self contactItemView];
      v30 = [v29 widthAnchor];
      v28 = [(CKAppIconView *)self heightAnchor];
      v27 = [v30 constraintEqualToAnchor:v28 multiplier:0.35];
      v87[0] = v27;
      v31 = [(CKAppIconView *)self contactItemView];
      v32 = [v31 heightAnchor];
      v33 = [(CKAppIconView *)self heightAnchor];
      v83 = [v32 constraintEqualToAnchor:v33 multiplier:0.35];
      v87[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      uint64_t v34 = [v82 centerXAnchor];
      uint64_t v35 = [(CKAppIconView *)self centerXAnchor];
      v81 = (void *)v34;
      v36 = (void *)v34;
      v37 = (void *)v35;
      v80 = [v36 constraintEqualToAnchor:v35];
      v87[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v38 = [v79 centerYAnchor];
      v77 = [(CKAppIconView *)self centerYAnchor];
      v78 = v38;
      v76 = objc_msgSend(v38, "constraintEqualToAnchor:");
      v87[3] = v76;
      v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v87;
      goto LABEL_12;
    case 4:
      v72 = [(CKAppIconView *)self constraints];
      v71 = [(CKAppIconView *)self activityItemView];
      v70 = [v71 widthAnchor];
      uint64_t v67 = [(CKAppIconView *)self heightAnchor];
      uint64_t v65 = [v70 constraintEqualToAnchor:v67 multiplier:2.345];
      v86[0] = v65;
      v69 = [(CKAppIconView *)self activityItemView];
      v64 = [v69 heightAnchor];
      uint64_t v63 = [(CKAppIconView *)self heightAnchor];
      v83 = [v64 constraintEqualToAnchor:v63 multiplier:0.98];
      v86[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      v41 = [v82 widthAnchor];
      uint64_t v62 = [(CKAppIconView *)self heightAnchor];
      v81 = v41;
      v80 = [v41 constraintEqualToAnchor:v62 multiplier:0.35];
      v86[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v42 = [v79 heightAnchor];
      v77 = [(CKAppIconView *)self heightAnchor];
      v78 = v42;
      v76 = objc_msgSend(v42, "constraintEqualToAnchor:multiplier:", 0.35);
      v86[3] = v76;
      v75 = [(CKAppIconView *)self contactItemView];
      v61 = [v75 leadingAnchor];
      v60 = [(CKAppIconView *)self leadingAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v86[4] = v59;
      v58 = [(CKAppIconView *)self contactItemView];
      v57 = [v58 topAnchor];
      v56 = [(CKAppIconView *)self topAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v86[5] = v55;
      v54 = [(CKAppIconView *)self activityItemView];
      v52 = [v54 leadingAnchor];
      v53 = [(CKAppIconView *)self contactItemView];
      v10 = [v53 leadingAnchor];
      v11 = [v52 constraintEqualToAnchor:v10];
      v86[6] = v11;
      int64_t v12 = [(CKAppIconView *)self activityItemView];
      v13 = [v12 topAnchor];
      v14 = [(CKAppIconView *)self contactItemView];
      v15 = [v14 bottomAnchor];
      v16 = [v13 constraintEqualToAnchor:v15 constant:3.0];
      v86[7] = v16;
      v17 = (void *)MEMORY[0x1E4F1C978];
      id v18 = v86;
LABEL_9:
      v43 = [v17 arrayWithObjects:v18 count:8];
      v26 = v72;
      [v72 addObjectsFromArray:v43];

      v27 = (void *)v65;
      v28 = (void *)v67;
LABEL_10:

      v33 = (void *)v63;
      v30 = v70;

      v32 = v64;
      v29 = v71;

      v31 = v69;
      v37 = (void *)v62;

      goto LABEL_13;
    case 5:
      v74 = [(CKAppIconView *)self constraints];
      v29 = [(CKAppIconView *)self contactItemView];
      v30 = [v29 widthAnchor];
      v28 = [(CKAppIconView *)self heightAnchor];
      v27 = [v30 constraintEqualToAnchor:v28 multiplier:0.35];
      v85[0] = v27;
      v31 = [(CKAppIconView *)self contactItemView];
      v32 = [v31 heightAnchor];
      v33 = [(CKAppIconView *)self heightAnchor];
      v83 = [v32 constraintEqualToAnchor:v33 multiplier:0.35];
      v85[1] = v83;
      v82 = [(CKAppIconView *)self contactItemView];
      uint64_t v44 = [v82 centerXAnchor];
      uint64_t v45 = [(CKAppIconView *)self centerXAnchor];
      v81 = (void *)v44;
      v46 = (void *)v44;
      v37 = (void *)v45;
      v80 = [v46 constraintEqualToAnchor:v45];
      v85[2] = v80;
      v79 = [(CKAppIconView *)self contactItemView];
      v47 = [v79 centerYAnchor];
      v77 = [(CKAppIconView *)self centerYAnchor];
      v78 = v47;
      v76 = objc_msgSend(v47, "constraintEqualToAnchor:");
      v85[3] = v76;
      v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v85;
LABEL_12:
      [v39 arrayWithObjects:v40 count:4];
      v75 = v26 = v74;
      objc_msgSend(v74, "addObjectsFromArray:");
LABEL_13:

      break;
    default:
      break;
  }
  v48 = [(CKAppIconView *)self constraints];
  uint64_t v49 = [v48 count];

  if (v49)
  {
    v50 = (void *)MEMORY[0x1E4F28DC8];
    v51 = [(CKAppIconView *)self constraints];
    [v50 activateConstraints:v51];
  }
  v84.receiver = self;
  v84.super_class = (Class)CKAppIconView;
  [(CKAppIconView *)&v84 updateConstraints];
}

- (UIView)contactItemView
{
  return self->_contactItemView;
}

- (void)setContactItemView:(id)a3
{
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (UIView)activityItemView
{
  return self->_activityItemView;
}

- (void)setActivityItemView:(id)a3
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
  objc_storeStrong((id *)&self->_activityItemView, 0);

  objc_storeStrong((id *)&self->_contactItemView, 0);
}

@end