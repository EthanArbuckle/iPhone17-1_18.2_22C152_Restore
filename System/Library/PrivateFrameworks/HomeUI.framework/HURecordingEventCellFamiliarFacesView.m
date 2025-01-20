@interface HURecordingEventCellFamiliarFacesView
+ (id)faceCropImageView;
+ (id)placeholderImage;
- (HURecordingEventCellFamiliarFacesView)initWithFrame:(CGRect)a3;
- (NSArray)imageViews;
- (NSArray)sortedPeople;
- (NSLayoutConstraint)leftTitleConstraint;
- (UILabel)titleLabel;
- (UIView)pointerView;
- (double)maxWidthForNames;
- (id)faceCropImageViews;
- (void)manager:(id)a3 didFindFaceCrop:(id)a4 forClip:(id)a5 usingPersonName:(id)a6;
- (void)manager:(id)a3 failedToFindFaceCropForPersonName:(id)a4;
- (void)resizeWithMaxWidth:(double)a3;
- (void)setLeftTitleConstraint:(id)a3;
- (void)setMaxWidthForNames:(double)a3;
- (void)setPointerView:(id)a3;
- (void)setSortedPeople:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateTitleLabel;
- (void)updateWithPersonEvents:(id)a3 forCameraClip:(id)a4;
@end

@implementation HURecordingEventCellFamiliarFacesView

- (HURecordingEventCellFamiliarFacesView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)HURecordingEventCellFamiliarFacesView;
  v3 = -[HURecordingEventCellFamiliarFacesView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(HURecordingEventCellFamiliarFacesView *)v3 setBackgroundColor:v4];

    v5 = [(HURecordingEventCellFamiliarFacesView *)v3 layer];
    [v5 setCornerRadius:20.0];

    v6 = [(HURecordingEventCellFamiliarFacesView *)v3 titleLabel];
    [(HURecordingEventCellFamiliarFacesView *)v3 addSubview:v6];

    uint64_t v7 = [(HURecordingEventCellFamiliarFacesView *)v3 faceCropImageViews];
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSArray *)v7;

    v9 = [(HURecordingEventCellFamiliarFacesView *)v3 pointerView];
    [(HURecordingEventCellFamiliarFacesView *)v3 addSubview:v9];

    v10 = [(HURecordingEventCellFamiliarFacesView *)v3 pointerView];
    [(HURecordingEventCellFamiliarFacesView *)v3 sendSubviewToBack:v10];

    v11 = [(HURecordingEventCellFamiliarFacesView *)v3 titleLabel];
    v12 = [v11 rightAnchor];
    v13 = [(HURecordingEventCellFamiliarFacesView *)v3 rightAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:-5.0];
    [v14 setActive:1];

    v15 = [(HURecordingEventCellFamiliarFacesView *)v3 titleLabel];
    v16 = [v15 centerYAnchor];
    v17 = [(HURecordingEventCellFamiliarFacesView *)v3 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [(HURecordingEventCellFamiliarFacesView *)v3 titleLabel];
    v20 = [v19 leftAnchor];
    v21 = [(HURecordingEventCellFamiliarFacesView *)v3 leftAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21 constant:40.0];
    leftTitleConstraint = v3->_leftTitleConstraint;
    v3->_leftTitleConstraint = (NSLayoutConstraint *)v22;

    [(NSLayoutConstraint *)v3->_leftTitleConstraint setActive:1];
  }
  return v3;
}

- (void)updateWithPersonEvents:(id)a3 forCameraClip:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v47 = a4;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v7 = [(HURecordingEventCellFamiliarFacesView *)self imageViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * i) setHidden:1];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v9);
  }
  v48 = self;

  v12 = [MEMORY[0x1E4F68F90] sharedManager];
  uint64_t v13 = [v6 count];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
    {
      v16 = [v6 objectAtIndexedSubscript:j];
      v17 = [v16 faceClassification];
      v18 = [v17 person];
      v19 = [v18 name];
      v20 = [v12 faceCropForPersonName:v19];

      if (!v20)
      {
        v21 = [v6 objectAtIndexedSubscript:j];
        [v12 addFaceCropImageObserver:v48 forClip:v47 usingSignificantEvent:v21];
      }
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v23 = v6;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v52 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v51 + 1) + 8 * k);
        v29 = [v28 faceClassification];
        v30 = [v29 person];
        v31 = [v30 name];

        [v22 setObject:v28 forKey:v31];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v25);
  }

  v32 = [v22 allValues];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __78__HURecordingEventCellFamiliarFacesView_updateWithPersonEvents_forCameraClip___block_invoke;
  v49[3] = &unk_1E6386D88;
  id v33 = v12;
  id v50 = v33;
  v34 = [v32 sortedArrayUsingComparator:v49];
  [(HURecordingEventCellFamiliarFacesView *)v48 setSortedPeople:v34];

  v35 = [(HURecordingEventCellFamiliarFacesView *)v48 sortedPeople];
  unint64_t v36 = [v35 count];

  if (v36 >= 3) {
    uint64_t v37 = 3;
  }
  else {
    uint64_t v37 = v36;
  }
  if (v37)
  {
    for (uint64_t m = 0; m != v37; ++m)
    {
      v39 = [(HURecordingEventCellFamiliarFacesView *)v48 sortedPeople];
      v40 = [v39 objectAtIndexedSubscript:m];
      v41 = [v40 faceClassification];
      v42 = [v41 person];

      v43 = [v42 name];
      v44 = [v33 faceCropForPersonName:v43];

      if (!v44)
      {
        v44 = +[HURecordingEventCellFamiliarFacesView placeholderImage];
      }
      v45 = [(HURecordingEventCellFamiliarFacesView *)v48 imageViews];
      v46 = [v45 objectAtIndexedSubscript:m];

      [v46 setImage:v44];
      [v46 setHidden:0];
    }
  }
  [(HURecordingEventCellFamiliarFacesView *)v48 resizeWithMaxWidth:118.0];
}

uint64_t __78__HURecordingEventCellFamiliarFacesView_updateWithPersonEvents_forCameraClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 faceClassification];
  uint64_t v8 = [v7 person];
  uint64_t v9 = [v8 name];
  uint64_t v10 = [v5 faceCropForPersonName:v9];

  v11 = *(void **)(a1 + 32);
  v12 = [v6 faceClassification];

  uint64_t v13 = [v12 person];
  uint64_t v14 = [v13 name];
  v15 = [v11 faceCropForPersonName:v14];

  uint64_t v16 = -1;
  if (v15) {
    uint64_t v16 = 1;
  }
  if (v10) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = v16;
  }

  return v17;
}

- (void)updateTitleLabel
{
  v2 = self;
  v111[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HURecordingEventCellFamiliarFacesView *)self titleLabel];
  v4 = [v3 font];

  v5 = [(HURecordingEventCellFamiliarFacesView *)v2 sortedPeople];
  uint64_t v6 = [v5 count];

  uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionTimelineSeparator", @"HUFaceRecognitionTimelineSeparator", 1);
  uint64_t v8 = (void *)v7;
  uint64_t v104 = v6;
  if (v6)
  {
    v103 = (void *)v7;
    v107 = v4;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *MEMORY[0x1E4F42508];
    do
    {
      v12 = v2;
      uint64_t v13 = [(HURecordingEventCellFamiliarFacesView *)v2 sortedPeople];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v10];
      v15 = [v14 faceClassification];
      uint64_t v16 = [v15 person];
      uint64_t v17 = [v16 name];

      uint64_t v110 = v11;
      v111[0] = v107;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:&v110 count:1];
      [v17 sizeWithAttributes:v18];
      double v20 = ceil(v19);

      double v21 = v20 + 0.0;
      if (v9 == 1)
      {
        uint64_t v108 = v11;
        v109 = v107;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        [v103 sizeWithAttributes:v22];
        double v21 = v21 + ceil(v23);
      }
      v2 = v12;
      [(HURecordingEventCellFamiliarFacesView *)v12 maxWidthForNames];
      if (v21 < v24) {
        ++v9;
      }

      ++v10;
    }
    while (v6 != v10);
    uint64_t v25 = [(HURecordingEventCellFamiliarFacesView *)v12 leftTitleConstraint];
    [v25 setConstant:40.0];

    v4 = v107;
    uint64_t v8 = v103;
    switch(v9)
    {
      case 0:
        goto LABEL_12;
      case 1:
        unint64_t v26 = v6 - 1;
        if (v6 == 1)
        {
          v27 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
          v28 = [v27 objectAtIndexedSubscript:0];
          v29 = [v28 faceClassification];
          v30 = [v29 person];
          v31 = [v30 name];
          v32 = [(HURecordingEventCellFamiliarFacesView *)v2 titleLabel];
          [v32 setText:v31];

          uint64_t v8 = v103;
        }
        else
        {
          v74 = NSString;
          v106 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
          v75 = [v106 objectAtIndexedSubscript:0];
          v76 = [v75 faceClassification];
          v77 = [v76 person];
          v78 = [v77 name];
          v79 = [v74 stringWithFormat:@"%@%@+%lu", v78, v103, v26];
          v80 = [(HURecordingEventCellFamiliarFacesView *)v12 titleLabel];
          [v80 setText:v79];

          if (v26 >= 2) {
            unint64_t v26 = 2;
          }
          v27 = [(HURecordingEventCellFamiliarFacesView *)v12 leftTitleConstraint];
          double v81 = (double)v26;
          uint64_t v8 = v103;
          [v27 constant];
          double v64 = v82 + v81 * 15.0;
LABEL_20:
          [v27 setConstant:v64];
        }
        break;
      case 2:
        v39 = NSString;
        v101 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v99 = [v101 objectAtIndexedSubscript:0];
        v97 = [v99 faceClassification];
        v95 = [v97 person];
        uint64_t v40 = [v95 name];
        v41 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v42 = [v41 objectAtIndexedSubscript:1];
        v43 = [v42 faceClassification];
        [v43 person];
        v45 = v44 = v12;
        uint64_t v46 = [v45 name];
        id v47 = (void *)v46;
        if (v104 == 2)
        {
          [v39 stringWithFormat:@"%@%@%@", v40, v103, v46];
          v49 = v48 = (void *)v40;
          id v50 = [(HURecordingEventCellFamiliarFacesView *)v12 titleLabel];
          [v50 setText:v49];

          v27 = [(HURecordingEventCellFamiliarFacesView *)v44 leftTitleConstraint];
          [v27 constant];
          double v52 = 15.0;
        }
        else
        {
          [v39 stringWithFormat:@"%@, %@%@+%lu", v40, v46, v103, v104 - 2];
          v84 = v83 = (void *)v40;
          v85 = [(HURecordingEventCellFamiliarFacesView *)v12 titleLabel];
          [v85 setText:v84];

LABEL_22:
          v27 = [(HURecordingEventCellFamiliarFacesView *)v44 leftTitleConstraint];
          [v27 constant];
          double v52 = 30.0;
        }
        [v27 setConstant:v51 + v52];
        v4 = v107;
        break;
      case 3:
        long long v53 = NSString;
        v105 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v102 = [v105 objectAtIndexedSubscript:0];
        v100 = [v102 faceClassification];
        v98 = [v100 person];
        v87 = [v98 name];
        v96 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v93 = [v96 objectAtIndexedSubscript:1];
        v91 = [v93 faceClassification];
        v89 = [v91 person];
        long long v54 = [v89 name];
        long long v55 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        [v55 objectAtIndexedSubscript:2];
        v57 = long long v56 = v12;
        long long v58 = [v57 faceClassification];
        v59 = [v58 person];
        v60 = [v59 name];
        uint64_t v61 = [v53 stringWithFormat:@"%@, %@,%@%@", v87, v54, v103, v60];
        v62 = [(HURecordingEventCellFamiliarFacesView *)v56 titleLabel];
        [v62 setText:v61];

        v4 = v107;
        v27 = [(HURecordingEventCellFamiliarFacesView *)v56 leftTitleConstraint];
        [v27 constant];
        double v64 = v63 + 30.0;
        goto LABEL_20;
      default:
        v65 = NSString;
        v101 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v99 = [v101 objectAtIndexedSubscript:0];
        v97 = [v99 faceClassification];
        v95 = [v97 person];
        v86 = [v95 name];
        v94 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v92 = [v94 objectAtIndexedSubscript:1];
        v90 = [v92 faceClassification];
        v88 = [v90 person];
        [v88 name];
        v66 = v44 = v12;
        v67 = [(HURecordingEventCellFamiliarFacesView *)v12 sortedPeople];
        v68 = [v67 objectAtIndexedSubscript:2];
        v69 = [v68 faceClassification];
        v70 = [v69 person];
        v71 = [v70 name];
        uint64_t v8 = v103;
        v72 = [v65 stringWithFormat:@"%@, %@, %@%@+%lu", v86, v66, v71, v103, v104 - 3];
        v73 = [(HURecordingEventCellFamiliarFacesView *)v44 titleLabel];
        [v73 setText:v72];

        goto LABEL_22;
    }
  }
  else
  {
    id v33 = [(HURecordingEventCellFamiliarFacesView *)v2 leftTitleConstraint];
    [v33 setConstant:40.0];

LABEL_12:
    v27 = [(HURecordingEventCellFamiliarFacesView *)v2 sortedPeople];
    v34 = [v27 objectAtIndexedSubscript:0];
    v35 = [v34 faceClassification];
    unint64_t v36 = [v35 person];
    uint64_t v37 = [v36 name];
    v38 = [(HURecordingEventCellFamiliarFacesView *)v2 titleLabel];
    [v38 setText:v37];
  }
}

- (void)resizeWithMaxWidth:(double)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  [(HURecordingEventCellFamiliarFacesView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(HURecordingEventCellFamiliarFacesView *)self imageViews];
  v12 = [v11 objectAtIndexedSubscript:1];
  int v13 = [v12 isHidden];

  if (v13) {
    double v14 = 40.0;
  }
  else {
    double v14 = 55.0;
  }
  v15 = [(HURecordingEventCellFamiliarFacesView *)self imageViews];
  uint64_t v16 = [v15 objectAtIndexedSubscript:2];
  int v17 = [v16 isHidden];

  double v18 = v14 + 15.0;
  if (v17) {
    double v18 = v14;
  }
  double v19 = v18 + 10.0;
  [(HURecordingEventCellFamiliarFacesView *)self setMaxWidthForNames:a3 - (v18 + 10.0)];
  [(HURecordingEventCellFamiliarFacesView *)self updateTitleLabel];
  double v20 = [(HURecordingEventCellFamiliarFacesView *)self titleLabel];
  double v21 = [v20 text];
  uint64_t v42 = *MEMORY[0x1E4F42508];
  uint64_t v22 = [(HURecordingEventCellFamiliarFacesView *)self titleLabel];
  double v23 = [v22 font];
  v43[0] = v23;
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  [v21 sizeWithAttributes:v24];
  double v26 = ceil(v25);

  if (v19 + v26 <= a3) {
    double v27 = v19 + v26;
  }
  else {
    double v27 = a3;
  }
  -[HURecordingEventCellFamiliarFacesView setFrame:](self, "setFrame:", v6, v8, v27, v10);
  v28 = HFLogForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = [(HURecordingEventCellFamiliarFacesView *)self titleLabel];
    v30 = [v29 text];
    [(HURecordingEventCellFamiliarFacesView *)self maxWidthForNames];
    uint64_t v32 = v31;
    [(HURecordingEventCellFamiliarFacesView *)self frame];
    int v34 = 138413058;
    v35 = v30;
    __int16 v36 = 2048;
    uint64_t v37 = v32;
    __int16 v38 = 2048;
    uint64_t v39 = v33;
    __int16 v40 = 2048;
    double v41 = v19 + -10.0;
    _os_log_debug_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEBUG, "FF: Title text - %@. MaxWidth:%.0f CellWidth:%.0f ImageOffset:%.0f", (uint8_t *)&v34, 0x2Au);
  }
}

- (void)manager:(id)a3 didFindFaceCrop:(id)a4 forClip:(id)a5 usingPersonName:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  double v10 = [(HURecordingEventCellFamiliarFacesView *)self sortedPeople];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HURecordingEventCellFamiliarFacesView_manager_didFindFaceCrop_forClip_usingPersonName___block_invoke;
  v13[3] = &unk_1E6386DB0;
  id v14 = v9;
  v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __89__HURecordingEventCellFamiliarFacesView_manager_didFindFaceCrop_forClip_usingPersonName___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v7 = [a2 faceClassification];
  id v8 = [v7 person];
  id v9 = [v8 name];
  int v10 = [v9 isEqual:*(void *)(a1 + 32)];

  if (a3 <= 2 && v10)
  {
    id v11 = [*(id *)(a1 + 40) imageViews];
    id v12 = [v11 objectAtIndexedSubscript:a3];

    [v12 setImage:*(void *)(a1 + 48)];
    int v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v16 = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Did find face crop. Updated face crop image for %@ using personName:%@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else if (a3 >= 3)
  {
    *a4 = 1;
  }
}

- (void)manager:(id)a3 failedToFindFaceCropForPersonName:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Failed to find face crop for personName:%@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)faceCropImageViews
{
  imageViews = self->_imageViews;
  if (!imageViews)
  {
    int v4 = 3;
    double v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    double v6 = 0.0;
    do
    {
      id v7 = +[HURecordingEventCellFamiliarFacesView faceCropImageView];
      objc_msgSend(v7, "setFrame:", v6 * 30.0 * 0.5 + 5.0, 5.0, 30.0, 30.0);
      [(NSArray *)v5 addObject:v7];
      [(HURecordingEventCellFamiliarFacesView *)self addSubview:v7];
      [(HURecordingEventCellFamiliarFacesView *)self sendSubviewToBack:v7];

      double v6 = v6 + 1.0;
      --v4;
    }
    while (v4);
    uint64_t v8 = self->_imageViews;
    self->_imageViews = v5;

    imageViews = self->_imageViews;
  }

  return imageViews;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    int v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    -[UILabel setFrame:](v4, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UILabel *)v4 setLineBreakMode:5];
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(UILabel *)v4 setTextColor:v5];

    double v6 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
    [(UILabel *)v4 setFont:v6];

    id v7 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UIView)pointerView
{
  pointerView = self->_pointerView;
  if (!pointerView)
  {
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
    double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v4 setBackgroundColor:v5];

    CGAffineTransformMakeRotation(&v12, 0.785398163);
    CGAffineTransform v11 = v12;
    [v4 setTransform:&v11];
    double v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
    id v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v6 setBackgroundColor:v7];

    uint64_t v8 = [(UIView *)v6 layer];
    [v8 setCornerRadius:15.0];

    [(UIView *)v6 setOpaque:0];
    [(UIView *)v6 addSubview:v4];
    [(UIView *)v6 center];
    objc_msgSend(v4, "setCenter:");
    [(UIView *)v6 frame];
    -[UIView setFrame:](v6, "setFrame:", 32.0, 28.0);
    id v9 = self->_pointerView;
    self->_pointerView = v6;

    pointerView = self->_pointerView;
  }

  return pointerView;
}

+ (id)faceCropImageView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v2 setBackgroundColor:v3];

  int v4 = [v2 layer];
  [v4 setCornerRadius:15.0];

  id v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  uint64_t v6 = [v5 CGColor];
  id v7 = [v2 layer];
  [v7 setBorderColor:v6];

  uint64_t v8 = [v2 layer];
  [v8 setBorderWidth:2.0];

  [v2 setClipsToBounds:1];
  [v2 setContentMode:2];

  return v2;
}

+ (id)placeholderImage
{
  if (qword_1EA12DF50 != -1) {
    dispatch_once(&qword_1EA12DF50, &__block_literal_global_31);
  }
  id v2 = (void *)_MergedGlobals_3_1;

  return v2;
}

void __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke()
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 26.0, 26.0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke_2;
  v8[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #26.0 }
  long long v9 = _Q0;
  uint64_t v6 = [v0 imageWithActions:v8];
  id v7 = (void *)_MergedGlobals_3_1;
  _MergedGlobals_3_1 = v6;
}

void __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke_2(uint64_t a1)
{
  HUImageNamed(@"CameraFamiliarFacePlaceholder");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setPointerView:(id)a3
{
}

- (NSLayoutConstraint)leftTitleConstraint
{
  return self->_leftTitleConstraint;
}

- (void)setLeftTitleConstraint:(id)a3
{
}

- (double)maxWidthForNames
{
  return self->_maxWidthForNames;
}

- (void)setMaxWidthForNames:(double)a3
{
  self->_maxWidthForNames = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (void)setSortedPeople:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_leftTitleConstraint, 0);
  objc_storeStrong((id *)&self->_pointerView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end