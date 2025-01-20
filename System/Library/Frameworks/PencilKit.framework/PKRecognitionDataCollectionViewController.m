@interface PKRecognitionDataCollectionViewController
- (NSArray)drawingImages;
- (NSArray)drawings;
- (NSDictionary)metadata;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (PKRecognitionDataCollectionViewController)initWithDrawings:(id)a3 metadata:(id)a4;
- (UICollectionView)collectionView;
- (UILabel)descriptionLabel;
- (UIScrollView)scrollView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)saveDataForDrawings:(id)a3 baseURL:(id)a4 shouldSaveRecognitionData:(BOOL)a5;
- (id)synchronousImageForDrawing:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)adjustCollectionViewHeight;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDrawingImages:(id)a3;
- (void)setDrawings:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setScrollView:(id)a3;
- (void)submitFeedback;
- (void)viewDidLoad;
@end

@implementation PKRecognitionDataCollectionViewController

- (PKRecognitionDataCollectionViewController)initWithDrawings:(id)a3 metadata:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PKRecognitionDataCollectionViewController;
  id v5 = a4;
  id v6 = a3;
  v7 = [(PKRecognitionDataCollectionViewController *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  drawings = v7->_drawings;
  v7->_drawings = (NSArray *)v8;

  uint64_t v10 = [v5 copy];
  metadata = v7->_metadata;
  v7->_metadata = (NSDictionary *)v10;

  return v7;
}

- (void)viewDidLoad
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  v149.receiver = self;
  v149.super_class = (Class)PKRecognitionDataCollectionViewController;
  [(PKRecognitionDataCollectionViewController *)&v149 viewDidLoad];
  v3 = _PencilKitBundle();
  v4 = [v3 localizedStringForKey:@"Handwriting Feedback" value:@"Handwriting Feedback" table:@"Localizable"];
  [(PKRecognitionDataCollectionViewController *)self setTitle:v4];

  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [(PKRecognitionDataCollectionViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  [(PKRecognitionDataCollectionViewController *)self setScrollView:v12];

  objc_super v13 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  [v13 setAlwaysBounceVertical:1];

  v14 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(PKRecognitionDataCollectionViewController *)self view];
  v16 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  [v15 addSubview:v16];

  v17 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v18 = [v17 frameLayoutGuide];
  v19 = [v18 topAnchor];
  v20 = [(PKRecognitionDataCollectionViewController *)self view];
  v21 = [v20 safeAreaLayoutGuide];
  v22 = [v21 topAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v25 = [v24 frameLayoutGuide];
  v26 = [v25 leftAnchor];
  v27 = [(PKRecognitionDataCollectionViewController *)self view];
  v28 = [v27 safeAreaLayoutGuide];
  v29 = [v28 leftAnchor];
  v30 = [v26 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v32 = [v31 frameLayoutGuide];
  v33 = [v32 rightAnchor];
  v34 = [(PKRecognitionDataCollectionViewController *)self view];
  v35 = [v34 safeAreaLayoutGuide];
  v36 = [v35 rightAnchor];
  v37 = [v33 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v39 = [v38 frameLayoutGuide];
  v40 = [v39 bottomAnchor];
  v41 = [(PKRecognitionDataCollectionViewController *)self view];
  v42 = [v41 safeAreaLayoutGuide];
  v43 = [v42 bottomAnchor];
  v44 = [v40 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v46 = [v45 frameLayoutGuide];
  v47 = [v46 widthAnchor];
  v48 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v49 = [v48 contentLayoutGuide];
  v50 = [v49 widthAnchor];
  v51 = [v47 constraintEqualToAnchor:v50];
  [v51 setActive:1];

  v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
  [(PKRecognitionDataCollectionViewController *)self setDescriptionLabel:v52];

  v53 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  [v53 setNumberOfLines:0];

  v54 = _PencilKitBundle();
  v55 = [v54 localizedStringForKey:@"Help us improve handwriting recognition by submitting this drawing to Apple. If you wish to submit only a portion of your drawing, you can cancel and select the relevant region using the lasso tool. Your submission may contain strokes that were previously made in the area shown in the screenshot, but which are no longer visible.", @"Help us improve handwriting recognition by submitting this drawing to Apple. If you wish to submit only a portion of your drawing, you can cancel and select the relevant region using the lasso tool. Your submission may contain strokes that were previously made in the area shown in the screenshot, but which are no longer visible.", @"Localizable" value table];
  v56 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  [v56 setText:v55];

  v57 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v58 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  [v58 setFont:v57];

  v59 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];

  v60 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v61 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  [v60 addSubview:v61];

  id v62 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v62 setMinimumLineSpacing:20.0];
  [v62 setMinimumInteritemSpacing:20.0];
  objc_msgSend(v62, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v62, "setItemSize:", 240.0, 240.0);
  v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v62, v8, v9, v10, v11);
  [(PKRecognitionDataCollectionViewController *)self setCollectionView:v63];

  v64 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v64 setTranslatesAutoresizingMaskIntoConstraints:0];

  v65 = [MEMORY[0x1E4FB1618] whiteColor];
  v66 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v66 setBackgroundColor:v65];

  v67 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v67 setDataSource:self];

  v68 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v68 setDelegate:self];

  v69 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  uint64_t v70 = objc_opt_class();
  v71 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v71);
  [v69 registerClass:v70 forCellWithReuseIdentifier:v72];

  v73 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v74 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v73 addSubview:v74];

  v75 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v76 = [v75 contentLayoutGuide];
  v77 = [v76 topAnchor];
  v78 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  v79 = [v78 topAnchor];
  v80 = [v77 constraintEqualToAnchor:v79 constant:-20.0];
  [v80 setActive:1];

  v81 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v82 = [v81 contentLayoutGuide];
  v83 = [v82 leftAnchor];
  v84 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  v85 = [v84 leftAnchor];
  v86 = [v83 constraintEqualToAnchor:v85 constant:-20.0];
  [v86 setActive:1];

  v87 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v88 = [v87 contentLayoutGuide];
  v89 = [v88 rightAnchor];
  v90 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  v91 = [v90 rightAnchor];
  v92 = [v89 constraintEqualToAnchor:v91 constant:20.0];
  [v92 setActive:1];

  v93 = [(PKRecognitionDataCollectionViewController *)self descriptionLabel];
  v94 = [v93 bottomAnchor];
  v95 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v96 = [v95 topAnchor];
  v97 = [v94 constraintEqualToAnchor:v96 constant:-20.0];
  [v97 setActive:1];

  v98 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v99 = [v98 contentLayoutGuide];
  v100 = [v99 leftAnchor];
  v101 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v102 = [v101 leftAnchor];
  v103 = [v100 constraintEqualToAnchor:v102 constant:-20.0];
  [v103 setActive:1];

  v104 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v105 = [v104 contentLayoutGuide];
  v106 = [v105 rightAnchor];
  v107 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v108 = [v107 rightAnchor];
  v109 = [v106 constraintEqualToAnchor:v108 constant:20.0];
  [v109 setActive:1];

  v110 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  v111 = [v110 contentLayoutGuide];
  v112 = [v111 bottomAnchor];
  v113 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v114 = [v113 bottomAnchor];
  v115 = [v112 constraintEqualToAnchor:v114 constant:20.0];
  [v115 setActive:1];

  v116 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v117 = [v116 frameLayoutGuide];
  v118 = [v117 widthAnchor];
  v119 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v120 = [v119 contentLayoutGuide];
  v121 = [v120 widthAnchor];
  v122 = [v118 constraintEqualToAnchor:v121];
  [v122 setActive:1];

  v123 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v124 = [v123 frameLayoutGuide];
  v125 = [v124 centerXAnchor];
  v126 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v127 = [v126 contentLayoutGuide];
  v128 = [v127 centerXAnchor];
  v129 = [v125 constraintEqualToAnchor:v128];
  [v129 setActive:1];

  v130 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  v131 = [v130 heightAnchor];
  v132 = [v131 constraintEqualToConstant:0.0];
  [(PKRecognitionDataCollectionViewController *)self setCollectionViewHeightConstraint:v132];

  v133 = [(PKRecognitionDataCollectionViewController *)self collectionViewHeightConstraint];
  [v133 setActive:0];

  v134 = (void *)MEMORY[0x1E4F1CA48];
  v135 = [(PKRecognitionDataCollectionViewController *)self drawings];
  v136 = objc_msgSend(v134, "arrayWithCapacity:", objc_msgSend(v135, "count"));

  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v137 = [(PKRecognitionDataCollectionViewController *)self drawings];
  uint64_t v138 = [v137 countByEnumeratingWithState:&v145 objects:v150 count:16];
  if (v138)
  {
    uint64_t v139 = v138;
    uint64_t v140 = *(void *)v146;
    do
    {
      for (uint64_t i = 0; i != v139; ++i)
      {
        if (*(void *)v146 != v140) {
          objc_enumerationMutation(v137);
        }
        v142 = [(PKRecognitionDataCollectionViewController *)self synchronousImageForDrawing:*(void *)(*((void *)&v145 + 1) + 8 * i)];
        [v136 addObject:v142];
      }
      uint64_t v139 = [v137 countByEnumeratingWithState:&v145 objects:v150 count:16];
    }
    while (v139);
  }

  v143 = [MEMORY[0x1E4F1C978] arrayWithArray:v136];
  [(PKRecognitionDataCollectionViewController *)self setDrawingImages:v143];

  v144 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v144 reloadData];

  [(PKRecognitionDataCollectionViewController *)self adjustCollectionViewHeight];
}

- (void)adjustCollectionViewHeight
{
  v3 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  [v3 setNeedsLayout];

  v4 = [(PKRecognitionDataCollectionViewController *)self scrollView];
  [v4 layoutIfNeeded];

  id v5 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v5 setNeedsLayout];

  id v6 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v6 layoutIfNeeded];

  id v7 = [(PKRecognitionDataCollectionViewController *)self collectionViewHeightConstraint];
  [v7 setActive:1];

  id v11 = [(PKRecognitionDataCollectionViewController *)self collectionView];
  [v11 contentSize];
  double v9 = v8;
  double v10 = [(PKRecognitionDataCollectionViewController *)self collectionViewHeightConstraint];
  [v10 setConstant:v9];
}

- (id)saveDataForDrawings:(id)a3 baseURL:(id)a4 shouldSaveRecognitionData:(BOOL)a5
{
  BOOL v78 = a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v85 = a4;
  v81 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v7 = 0;
    id v65 = v6;
    do
    {
      double v8 = [v6 objectAtIndexedSubscript:v7];
      uint64_t v9 = [v8 serializeWithVersion:2];
      double v10 = objc_msgSend(NSString, "stringWithFormat:", @"/drawing_%d.drawing", v7);
      [v85 URLByAppendingPathComponent:v10];
      v12 = id v11 = v6;

      v83 = (void *)v9;
      objc_super v13 = (void *)v9;
      v14 = (void *)v12;
      [v13 writeToURL:v12 atomically:1];
      [v81 addObject:v12];
      v15 = [(PKRecognitionDataCollectionViewController *)self drawingImages];
      v16 = [v15 objectAtIndexedSubscript:v7];

      v82 = v16;
      v17 = UIImagePNGRepresentation(v16);
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"/image_%d.png", v7);
      v19 = [v85 URLByAppendingPathComponent:v18];

      [v17 writeToURL:v19 atomically:1];
      id v6 = v11;
      [v81 addObject:v19];
      if (v78)
      {
        v84 = v8;
        v20 = [v8 uuid];
        v21 = +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v20);

        uint64_t v22 = -[PKRecognitionSessionManager session](v21);
        if (v22
          || [v8 recognitionEnabled]
          && ([v8 recognitionSession], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v74 = v21;
          v75 = v19;
          v76 = v17;
          v77 = v14;
          v73 = (void *)v22;
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F5C050]) initWithRecognitionSession:v22];
          [v23 start];
          [v23 waitForPendingUpdates];
          v24 = [v23 indexableContent];
          v25 = [v24 indexableTextRepresentation];
          v26 = [v25 dataUsingEncoding:4];

          unint64_t v80 = v7;
          unint64_t v27 = v7;
          v28 = objc_msgSend(NSString, "stringWithFormat:", @"/indexableText_%d.txt", v7);
          uint64_t v29 = [v85 URLByAppendingPathComponent:v28];

          v71 = v26;
          [v26 writeToURL:v29 atomically:1];
          uint64_t v70 = (void *)v29;
          [v81 addObject:v29];
          v72 = v23;
          v30 = [v23 indexableContent];
          v31 = [v30 presentableTextRepresentation];
          v32 = [v31 dataUsingEncoding:4];

          v33 = objc_msgSend(NSString, "stringWithFormat:", @"/presentableText_%d.txt", v27);
          uint64_t v34 = [v85 URLByAppendingPathComponent:v33];

          v69 = v32;
          [v32 writeToURL:v34 atomically:1];
          v68 = (void *)v34;
          [v81 addObject:v34];
          id v35 = objc_alloc(MEMORY[0x1E4F5C0E0]);
          v36 = [v8 recognitionSession];
          v37 = (void *)[v35 initWithRecognitionSession:v36];

          [v37 setStatusReportingEnabled:1];
          v38 = [MEMORY[0x1E4F28E78] string];
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          v39 = [MEMORY[0x1E4F5C0E0] availableRecognitionSessionStatusKeys];
          uint64_t v40 = [v39 countByEnumeratingWithState:&v88 objects:v92 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v89;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v89 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void *)(*((void *)&v88 + 1) + 8 * i);
                v45 = [MEMORY[0x1E4F5C0E0] localizedNameForRecognitionSessionStatusKey:v44];
                [v37 setEnabled:1 forVisualizationIdentifier:v44];
                v46 = [v37 valueForRecognitionStatusKey:v44];
                [v38 appendFormat:@"*%@*\n", v45];
                if (v46) {
                  [v38 appendFormat:@"%@\n\n", v46];
                }
                else {
                  [v38 appendString:@"\n"];
                }
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v88 objects:v92 count:16];
            }
            while (v41);
          }

          v47 = objc_msgSend(NSString, "stringWithFormat:", @"/visualizationManager_%d.txt", v80);
          uint64_t v48 = [v85 URLByAppendingPathComponent:v47];

          v66 = [v38 dataUsingEncoding:4];
          [v66 writeToURL:v48 atomically:1];
          v67 = (void *)v48;
          [v81 addObject:v48];
          v49 = [v84 uuid];
          v50 = CacheFileURLForUUID(v49);

          v51 = [MEMORY[0x1E4F28CB8] defaultManager];
          v52 = [v50 path];
          LODWORD(v48) = [v51 fileExistsAtPath:v52];

          v14 = v77;
          v19 = v75;
          if (v48)
          {
            v53 = objc_msgSend(NSString, "stringWithFormat:", @"/drawing_%d.sessionCache", v80);
            v54 = [v85 URLByAppendingPathComponent:v53];

            v55 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v87 = 0;
            int v56 = [v55 copyItemAtURL:v50 toURL:v54 error:&v87];

            if (v56) {
              [v81 addObject:v54];
            }
          }
          id v6 = v65;
          unint64_t v7 = v80;
          v17 = v76;
          v21 = v74;
        }

        double v8 = v84;
      }

      ++v7;
    }
    while (v7 < [v6 count]);
  }
  v57 = v6;
  v58 = (void *)MEMORY[0x1E4F28D90];
  v59 = [(PKRecognitionDataCollectionViewController *)self metadata];
  id v86 = 0;
  v60 = [v58 dataWithJSONObject:v59 options:0 error:&v86];
  id v61 = v86;

  if (!v60) {
    NSLog(&cfstr_ErrorSavingMet.isa, v61);
  }
  id v62 = [v85 URLByAppendingPathComponent:@"/metadata.txt"];
  [v60 writeToURL:v62 atomically:1];
  [v81 addObject:v62];
  v63 = [MEMORY[0x1E4F1C978] arrayWithArray:v81];

  return v63;
}

- (id)synchronousImageForDrawing:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__29;
  v30 = __Block_byref_object_dispose__29;
  id v31 = 0;
  [v3 _canvasBounds];
  double v7 = v6;
  double MaxY = v5;
  if (v6 == *MEMORY[0x1E4F1DB30] && v5 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v3 bounds];
    double MaxY = CGRectGetMaxY(v33);
    double v7 = 768.0;
  }
  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 bounds];
  double v12 = v11;

  if (v12 < v7) {
    double v7 = v12;
  }
  objc_super v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 bounds];
  double v15 = v14;

  if (v15 < MaxY) {
    double MaxY = v15;
  }
  v16 = [PKImageRenderer alloc];
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  v19 = -[PKImageRenderer initWithSize:scale:](v16, "initWithSize:scale:", v7, MaxY, v18);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__PKRecognitionDataCollectionViewController_synchronousImageForDrawing___block_invoke;
  v23[3] = &unk_1E64C72E0;
  v25 = &v26;
  v20 = v4;
  v24 = v20;
  [(PKImageRenderer *)v19 renderDrawing:v3 completion:v23];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  id v21 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v21;
}

void __72__PKRecognitionDataCollectionViewController_synchronousImageForDrawing___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(PKRecognitionDataCollectionViewController *)self drawingImages];
  uint64_t v7 = [v5 row];

  id v10 = [v6 objectAtIndexedSubscript:v7];

  double v8 = [[PKRecognitionDrawingPreviewViewController alloc] initWithDrawingImage:v10];
  uint64_t v9 = [(PKRecognitionDataCollectionViewController *)self navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  id v10 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  double v11 = [v10 contentView];
  double v12 = [v11 subviews];
  objc_super v13 = (void *)[v12 copy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "removeFromSuperview", (void)v31);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  v19 = [(PKRecognitionDataCollectionViewController *)self drawingImages];
  v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  id v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v20];
  uint64_t v22 = [v21 layer];
  [v22 setMinificationFilter:*MEMORY[0x1E4F3A340]];

  [v21 setContentMode:1];
  v23 = [v10 contentView];
  [v23 addSubview:v21];

  v24 = [v10 contentView];
  [v24 bounds];
  objc_msgSend(v21, "setFrame:");

  id v25 = [MEMORY[0x1E4FB1618] lightGrayColor];
  uint64_t v26 = [v25 CGColor];
  unint64_t v27 = [v10 layer];
  [v27 setBorderColor:v26];

  uint64_t v28 = [v10 layer];
  [v28 setBorderWidth:0.5];

  uint64_t v29 = [v10 layer];
  [v29 setCornerRadius:8.0];

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(PKRecognitionDataCollectionViewController *)self drawingImages];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)submitFeedback
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  int64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = NSTemporaryDirectory();
  id v7 = [v5 fileURLWithPath:v6];
  double v8 = [v7 URLByAppendingPathComponent:v4];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v18 = 0;
  char v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v11 = v18;
  double v12 = v11;
  if (v10)
  {
    objc_super v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v14 = [v13 BOOLForKey:@"PKShouldForceFeedbackAssistant"];

    BOOL v15 = (v14 & 1) == 0 && (os_variant_has_internal_diagnostics() & 1) != 0;
    uint64_t v16 = [(PKRecognitionDataCollectionViewController *)self drawings];
    uint64_t v17 = [(PKRecognitionDataCollectionViewController *)self saveDataForDrawings:v16 baseURL:v8 shouldSaveRecognitionData:v15];

    +[PKHandwritingDebugUtility submitFeedbackWithAttachments:v17 title:@"Handwriting Feedback: "];
  }
  else
  {
    NSLog(&cfstr_Error.isa, v11);
  }
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
}

- (NSArray)drawingImages
{
  return self->_drawingImages;
}

- (void)setDrawingImages:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_drawingImages, 0);

  objc_storeStrong((id *)&self->_drawings, 0);
}

@end