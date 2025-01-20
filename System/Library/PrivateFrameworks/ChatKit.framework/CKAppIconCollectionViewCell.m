@interface CKAppIconCollectionViewCell
+ (id)reuseIdentifier;
- (CKAppIconView)appContentView;
- (NSMutableArray)constraints;
- (UIImageView)appIconView;
- (id)appIconForBundleID:(id)a3;
- (int64_t)appName;
- (void)configureWithAppName:(int64_t)a3;
- (void)prepareForReuse;
- (void)setAppContentView:(id)a3;
- (void)setAppIconView:(id)a3;
- (void)setAppName:(int64_t)a3;
- (void)setConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation CKAppIconCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKAppIconCollectionViewCell_reuseIdentifier";
}

- (void)configureWithAppName:(int64_t)a3
{
  -[CKAppIconCollectionViewCell setAppName:](self, "setAppName:");
  if ((unint64_t)a3 > 5)
  {
    id v23 = 0;
  }
  else
  {
    id v23 = [(CKAppIconCollectionViewCell *)self appIconForBundleID:off_1E562B078[a3]];
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v23];
  [(CKAppIconCollectionViewCell *)self setAppIconView:v5];

  v6 = [(CKAppIconCollectionViewCell *)self appIconView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(CKAppIconCollectionViewCell *)self appIconView];
  v8 = [v7 layer];
  id v9 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v8, "setShadowColor:", objc_msgSend(v9, "CGColor"));

  v10 = [(CKAppIconCollectionViewCell *)self appIconView];
  v11 = [v10 layer];
  LODWORD(v12) = 1050253722;
  [v11 setShadowOpacity:v12];

  v13 = [(CKAppIconCollectionViewCell *)self appIconView];
  v14 = [v13 layer];
  [v14 setShadowRadius:4.0];

  v15 = [(CKAppIconCollectionViewCell *)self appIconView];
  v16 = [v15 layer];
  objc_msgSend(v16, "setShadowOffset:", 0.0, 1.0);

  v17 = [(CKAppIconCollectionViewCell *)self contentView];
  v18 = [(CKAppIconCollectionViewCell *)self appIconView];
  [v17 addSubview:v18];

  v19 = [CKAppIconView alloc];
  int64_t v20 = [(CKAppIconCollectionViewCell *)self appName];
  v21 = -[CKAppIconView initWithFrame:withAppName:](v19, "initWithFrame:withAppName:", v20, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKAppIconView *)v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKAppIconView *)v21 setSemanticContentAttribute:3];
  [(CKAppIconCollectionViewCell *)self setAppContentView:v21];
  v22 = [(CKAppIconCollectionViewCell *)self contentView];
  [v22 addSubview:v21];

  [(CKAppIconCollectionViewCell *)self bringSubviewToFront:v21];
  [(CKAppIconCollectionViewCell *)self setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)updateConstraints
{
  v75[6] = *MEMORY[0x1E4F143B8];
  v3 = [(CKAppIconCollectionViewCell *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v6 = [(CKAppIconCollectionViewCell *)self constraints];
    [v5 deactivateConstraints:v6];
  }
  v7 = [MEMORY[0x1E4F1CA48] array];
  [(CKAppIconCollectionViewCell *)self setConstraints:v7];

  v66 = [(CKAppIconCollectionViewCell *)self constraints];
  v63 = [(CKAppIconCollectionViewCell *)self appIconView];
  v59 = [v63 widthAnchor];
  v61 = [(CKAppIconCollectionViewCell *)self contentView];
  v58 = [v61 widthAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v75[0] = v57;
  v56 = [(CKAppIconCollectionViewCell *)self appIconView];
  v54 = [v56 heightAnchor];
  v55 = [(CKAppIconCollectionViewCell *)self contentView];
  v53 = [v55 heightAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v75[1] = v52;
  v51 = [(CKAppIconCollectionViewCell *)self appIconView];
  v49 = [v51 centerXAnchor];
  v50 = [(CKAppIconCollectionViewCell *)self contentView];
  v48 = [v50 centerXAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v75[2] = v47;
  v46 = [(CKAppIconCollectionViewCell *)self appIconView];
  v44 = [v46 centerYAnchor];
  v45 = [(CKAppIconCollectionViewCell *)self contentView];
  v43 = [v45 centerYAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v75[3] = v42;
  v41 = [(CKAppIconCollectionViewCell *)self appContentView];
  v8 = [v41 widthAnchor];
  id v9 = [(CKAppIconCollectionViewCell *)self contentView];
  v10 = [v9 widthAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v75[4] = v11;
  double v12 = [(CKAppIconCollectionViewCell *)self appContentView];
  v13 = [v12 heightAnchor];
  v14 = [(CKAppIconCollectionViewCell *)self contentView];
  v15 = [v14 heightAnchor];
  [v13 constraintEqualToAnchor:v15];
  v16 = v65 = self;
  v75[5] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:6];
  [v66 addObjectsFromArray:v17];

  v18 = v65;
  switch([(CKAppIconCollectionViewCell *)v65 appName])
  {
    case 0:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      int64_t v20 = [v64 centerXAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 centerXAnchor];
      v62 = v20;
      v22 = [v20 constraintEqualToAnchor:v21];
      v74[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 centerYAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 topAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v74[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v74;
      goto LABEL_10;
    case 1:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      v31 = [v64 centerXAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 trailingAnchor];
      v62 = v31;
      v22 = [v31 constraintEqualToAnchor:v21];
      v73[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 centerYAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 centerYAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v73[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v73;
      goto LABEL_10;
    case 2:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      v32 = [v64 trailingAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 trailingAnchor];
      v62 = v32;
      v22 = [v32 constraintEqualToAnchor:v21];
      v72[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 centerYAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 topAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v72[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v72;
      goto LABEL_10;
    case 3:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      v33 = [v64 leadingAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 leadingAnchor];
      v62 = v33;
      v22 = [v33 constraintEqualToAnchor:v21];
      v71[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 topAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 topAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v71[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v71;
      goto LABEL_10;
    case 4:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      v34 = [v64 leadingAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 leadingAnchor];
      v62 = v34;
      v22 = [v34 constraintEqualToAnchor:v21];
      v70[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 bottomAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 bottomAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v70[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v70;
      goto LABEL_10;
    case 5:
      v19 = [(CKAppIconCollectionViewCell *)v65 constraints];
      v67 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v64 = [v67 contactItemView];
      v35 = [v64 leadingAnchor];
      v60 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v21 = [v60 leadingAnchor];
      v62 = v35;
      v22 = [v35 constraintEqualToAnchor:v21];
      v69[0] = v22;
      id v23 = [(CKAppIconCollectionViewCell *)v65 appContentView];
      v24 = [v23 contactItemView];
      v25 = [v24 topAnchor];
      v26 = [(CKAppIconCollectionViewCell *)v65 appIconView];
      v27 = [v26 centerYAnchor];
      v28 = [v25 constraintEqualToAnchor:v27];
      v69[1] = v28;
      v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = v69;
LABEL_10:
      v36 = [v29 arrayWithObjects:v30 count:2];
      [v19 addObjectsFromArray:v36];

      v18 = v65;
      break;
    default:
      break;
  }
  v37 = [(CKAppIconCollectionViewCell *)v18 constraints];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    v39 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(CKAppIconCollectionViewCell *)v18 constraints];
    [v39 activateConstraints:v40];
  }
  v68.receiver = v18;
  v68.super_class = (Class)CKAppIconCollectionViewCell;
  [(CKAppIconCollectionViewCell *)&v68 updateConstraints];
}

- (id)appIconForBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F42D90];
  id v4 = a3;
  v5 = [v3 mainScreen];
  [v5 scale];
  double v7 = v6;

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v4];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 60.0, 60.0, v7);
  id v10 = (id)[v8 prepareImageForDescriptor:v9];
  v11 = [v8 imageForDescriptor:v9];
  double v12 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(v11, "CGImage"), 0, v7);

  return v12;
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)CKAppIconCollectionViewCell;
  [(CKAppIconCollectionViewCell *)&v9 prepareForReuse];
  v3 = [(CKAppIconCollectionViewCell *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DC8];
    double v6 = [(CKAppIconCollectionViewCell *)self constraints];
    [v5 deactivateConstraints:v6];
  }
  double v7 = [(CKAppIconCollectionViewCell *)self appIconView];
  [v7 removeFromSuperview];

  v8 = [(CKAppIconCollectionViewCell *)self appContentView];
  [v8 removeFromSuperview];

  [(CKAppIconCollectionViewCell *)self setAppIconView:0];
  [(CKAppIconCollectionViewCell *)self setAppContentView:0];
  [(CKAppIconCollectionViewCell *)self setAppName:-1];
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (CKAppIconView)appContentView
{
  return self->_appContentView;
}

- (void)setAppContentView:(id)a3
{
}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (void)setAppIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_appContentView, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end