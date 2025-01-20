@interface PKAutorefineDataCollectionViewController
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)initWithDrawings:(id *)a1;
- (id)makeDrawingForOriginalStrokes:(void *)a3 refinedStrokes:(void *)a4 contextStrokes:(double)a5 bounds:(double)a6;
- (id)makeDrawingForStrokes:(id *)a1;
- (id)makeImageForDrawing:(uint64_t)a1;
- (id)saveDrawing:(void *)a1 toBaseURL:(void *)a2 withName:(void *)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)updateTableViewHeight;
- (void)submitFeedback;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKAutorefineDataCollectionViewController

- (id)initWithDrawings:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKAutorefineDataCollectionViewController;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 122, a2);
    }
  }

  return a1;
}

- (void)viewDidLoad
{
  v236[3] = *MEMORY[0x1E4F143B8];
  v229.receiver = self;
  v229.super_class = (Class)PKAutorefineDataCollectionViewController;
  [(PKAutorefineDataCollectionViewController *)&v229 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  id v4 = [(PKAutorefineDataCollectionViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (self)
  {
    objc_storeStrong((id *)&self->_scrollView, v10);

    v12 = self->_scrollView;
    [(UIScrollView *)v12 setAlwaysBounceVertical:1];

    scrollView = self->_scrollView;
  }
  else
  {

    [0 setAlwaysBounceVertical:1];
    scrollView = 0;
  }
  v14 = scrollView;
  [(UIScrollView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(PKAutorefineDataCollectionViewController *)self view];
  v16 = v15;
  if (self)
  {
    v17 = self->_scrollView;
    [v16 addSubview:v17];

    v18 = self->_scrollView;
  }
  else
  {
    [v15 addSubview:0];

    v18 = 0;
  }
  v19 = v18;
  v20 = [(UIScrollView *)v19 frameLayoutGuide];
  v21 = [v20 topAnchor];
  v22 = [(PKAutorefineDataCollectionViewController *)self view];
  v23 = [v22 safeAreaLayoutGuide];
  v24 = [v23 topAnchor];
  v25 = [v21 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  if (self) {
    v26 = self->_scrollView;
  }
  else {
    v26 = 0;
  }
  v27 = v26;
  v28 = [(UIScrollView *)v27 frameLayoutGuide];
  v29 = [v28 leftAnchor];
  v30 = [(PKAutorefineDataCollectionViewController *)self view];
  v31 = [v30 safeAreaLayoutGuide];
  v32 = [v31 leftAnchor];
  v33 = [v29 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  if (self) {
    v34 = self->_scrollView;
  }
  else {
    v34 = 0;
  }
  v35 = v34;
  v36 = [(UIScrollView *)v35 frameLayoutGuide];
  v37 = [v36 rightAnchor];
  v38 = [(PKAutorefineDataCollectionViewController *)self view];
  v39 = [v38 safeAreaLayoutGuide];
  v40 = [v39 rightAnchor];
  v41 = [v37 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  if (self) {
    v42 = self->_scrollView;
  }
  else {
    v42 = 0;
  }
  v43 = v42;
  v44 = [(UIScrollView *)v43 frameLayoutGuide];
  v45 = [v44 bottomAnchor];
  v46 = [(PKAutorefineDataCollectionViewController *)self view];
  v47 = [v46 safeAreaLayoutGuide];
  v48 = [v47 bottomAnchor];
  v49 = [v45 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  if (self) {
    v50 = self->_scrollView;
  }
  else {
    v50 = 0;
  }
  v51 = v50;
  v52 = [(UIScrollView *)v51 frameLayoutGuide];
  v53 = [v52 widthAnchor];
  if (self) {
    v54 = self->_scrollView;
  }
  else {
    v54 = 0;
  }
  v55 = v54;
  v56 = [(UIScrollView *)v55 contentLayoutGuide];
  v57 = [v56 widthAnchor];
  v58 = [v53 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
  v60 = v59;
  if (self)
  {
    objc_storeStrong((id *)&self->_descriptionLabel, v59);

    descriptionLabel = self->_descriptionLabel;
  }
  else
  {

    descriptionLabel = 0;
  }
  v62 = descriptionLabel;
  [(UILabel *)v62 setNumberOfLines:0];

  v63 = +[PKAutoRefineLogger sharedAutoRefineLogger]();
  v64 = -[PKAutoRefineLogger entries](v63);

  uint64_t v65 = [v64 count];
  v66 = _PencilKitBundle();
  v67 = v66;
  v216 = v64;
  if (v65) {
    v68 = @"Please select all auto-refine entries you want to submit. If you make no selection and click submit, all entries will be sent to Apple.";
  }
  else {
    v68 = @"No auto-refine entries available.";
  }
  v69 = [v66 localizedStringForKey:v68 value:v68 table:@"Localizable"];
  if (self) {
    v70 = self->_descriptionLabel;
  }
  else {
    v70 = 0;
  }
  v71 = v70;
  [(UILabel *)v71 setText:v69];

  v72 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  if (self)
  {
    v73 = self->_descriptionLabel;
    [(UILabel *)v73 setFont:v72];

    v74 = self->_descriptionLabel;
  }
  else
  {
    [0 setFont:v72];

    v74 = 0;
  }
  v75 = v74;
  [(UILabel *)v75 setTranslatesAutoresizingMaskIntoConstraints:0];

  if (self)
  {
    v76 = self->_scrollView;
    v77 = self->_descriptionLabel;
  }
  else
  {
    v76 = 0;
    v77 = 0;
  }
  v78 = v77;
  [(UIScrollView *)v76 addSubview:v78];

  if (self) {
    v79 = self->_descriptionLabel;
  }
  else {
    v79 = 0;
  }
  v80 = (void *)MEMORY[0x1E4F28DC8];
  v81 = v79;
  v82 = [(UILabel *)v81 topAnchor];
  v205 = v80;
  if (self) {
    v83 = self->_scrollView;
  }
  else {
    v83 = 0;
  }
  v84 = v83;
  uint64_t v85 = [(UIScrollView *)v84 topAnchor];
  v236[0] = [v82 constraintEqualToAnchor:v85 constant:20.0];
  v207 = (void *)v236[0];
  if (self) {
    v86 = self->_descriptionLabel;
  }
  else {
    v86 = 0;
  }
  v87 = v86;
  v88 = [(UILabel *)v87 leadingAnchor];
  id obj = v82;
  v203 = v87;
  if (self) {
    v89 = self->_scrollView;
  }
  else {
    v89 = 0;
  }
  v90 = v89;
  v91 = [(UIScrollView *)v90 leadingAnchor];
  v92 = [v88 constraintEqualToAnchor:v91 constant:20.0];
  v236[1] = v92;
  v218 = v81;
  v211 = v84;
  if (self) {
    v93 = self->_descriptionLabel;
  }
  else {
    v93 = 0;
  }
  v94 = v93;
  v95 = [(UILabel *)v94 trailingAnchor];
  v209 = (void *)v85;
  v201 = v88;
  if (self) {
    v96 = self->_scrollView;
  }
  else {
    v96 = 0;
  }
  v97 = v96;
  v98 = [(UIScrollView *)v97 trailingAnchor];
  v99 = [v95 constraintEqualToAnchor:v98 constant:-20.0];
  v236[2] = v99;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v236 count:3];
  [v205 activateConstraints:v100];

  id v101 = objc_alloc_init(MEMORY[0x1E4FB1D00]);
  v102 = v101;
  if (self)
  {
    objc_storeStrong((id *)&self->_tableView, v101);

    v103 = self->_tableView;
    [(UITableView *)v103 setTranslatesAutoresizingMaskIntoConstraints:0];

    tableView = self->_tableView;
  }
  else
  {

    [0 setTranslatesAutoresizingMaskIntoConstraints:0];
    tableView = 0;
  }
  v105 = tableView;
  [(UITableView *)v105 setDelegate:self];

  if (self)
  {
    v106 = self->_tableView;
    [(UITableView *)v106 setDataSource:self];

    v107 = self->_tableView;
  }
  else
  {
    [0 setDataSource:0];
    v107 = 0;
  }
  v108 = v107;
  [(UITableView *)v108 setSeparatorStyle:0];

  if (self)
  {
    v109 = self->_tableView;
    [(UITableView *)v109 setAllowsMultipleSelection:1];

    v110 = self->_tableView;
  }
  else
  {
    [0 setAllowsMultipleSelection:1];
    v110 = 0;
  }
  v111 = v110;
  [(UITableView *)v111 registerClass:objc_opt_class() forCellReuseIdentifier:@"ImageCell"];

  if (self)
  {
    v112 = self->_scrollView;
    v113 = self->_tableView;
  }
  else
  {
    v112 = 0;
    v113 = 0;
  }
  v114 = v113;
  [(UIScrollView *)v112 addSubview:v114];

  if (self) {
    v115 = self->_tableView;
  }
  else {
    v115 = 0;
  }
  v116 = (void *)MEMORY[0x1E4F28DC8];
  v117 = v115;
  v118 = [(UITableView *)v117 topAnchor];
  v202 = v116;
  if (self) {
    v119 = self->_descriptionLabel;
  }
  else {
    v119 = 0;
  }
  v120 = v119;
  uint64_t v121 = [(UILabel *)v120 bottomAnchor];
  uint64_t v232 = [v118 constraintEqualToAnchor:v121 constant:20.0];
  v206 = (void *)v232;
  if (self) {
    v122 = self->_tableView;
  }
  else {
    v122 = 0;
  }
  v123 = v122;
  v124 = [(UITableView *)v123 leadingAnchor];
  if (self) {
    v125 = self->_scrollView;
  }
  else {
    v125 = 0;
  }
  v126 = v125;
  v198 = [(UIScrollView *)v126 leadingAnchor];
  uint64_t v233 = objc_msgSend(v124, "constraintEqualToAnchor:constant:", 20.0);
  v197 = (void *)v233;
  if (self) {
    v127 = self->_tableView;
  }
  else {
    v127 = 0;
  }
  v196 = v127;
  v219 = [(UITableView *)v196 trailingAnchor];
  v208 = (void *)v121;
  v210 = v120;
  v204 = v123;
  if (self) {
    v128 = self->_scrollView;
  }
  else {
    v128 = 0;
  }
  v129 = v128;
  v130 = [(UIScrollView *)v129 trailingAnchor];
  v131 = [v219 constraintEqualToAnchor:v130 constant:-20.0];
  v234 = v131;
  obja = v117;
  v199 = v126;
  if (self) {
    v132 = self->_tableView;
  }
  else {
    v132 = 0;
  }
  v133 = v132;
  v134 = [(UITableView *)v133 bottomAnchor];
  v212 = v118;
  v200 = v124;
  if (self) {
    v135 = self->_scrollView;
  }
  else {
    v135 = 0;
  }
  v136 = v135;
  v137 = [(UIScrollView *)v136 bottomAnchor];
  v138 = [v134 constraintEqualToAnchor:v137 constant:-20.0];
  v235 = v138;
  v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v232 count:4];
  [v202 activateConstraints:v139];

  if (self)
  {
    v140 = self->_tableView;
    v141 = [(UITableView *)v140 heightAnchor];
    v142 = [v141 constraintEqualToConstant:0.0];
    objc_storeStrong((id *)&self->_tableViewHeightConstraint, v142);

    tableViewHeightConstraint = self->_tableViewHeightConstraint;
  }
  else
  {
    v195 = [0 heightAnchor];
    [v195 constraintEqualToConstant:0.0];

    tableViewHeightConstraint = 0;
  }
  v144 = tableViewHeightConstraint;
  [(NSLayoutConstraint *)v144 setActive:1];

  v145 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v216, "count"));
  if (self) {
    objc_storeStrong((id *)&self->_tableDataEntries, v145);
  }

  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id objb = v216;
  uint64_t v220 = [objb countByEnumeratingWithState:&v225 objects:v231 count:16];
  if (v220)
  {
    uint64_t v217 = *(void *)v226;
    do
    {
      uint64_t v146 = 0;
      do
      {
        if (*(void *)v226 != v217) {
          objc_enumerationMutation(objb);
        }
        v147 = *(void **)(*((void *)&v225 + 1) + 8 * v146);
        v148 = [MEMORY[0x1E4F1CA48] array];
        v149 = [v147 originalStrokes];
        [v148 addObjectsFromArray:v149];

        v150 = [v147 refinedStrokes];
        [v148 addObjectsFromArray:v150];

        v151 = [v147 unchangedStrokes];
        [v148 addObjectsFromArray:v151];

        long long v223 = 0u;
        long long v224 = 0u;
        long long v221 = 0u;
        long long v222 = 0u;
        id v152 = v148;
        uint64_t v153 = [v152 countByEnumeratingWithState:&v221 objects:v230 count:16];
        double v154 = v6;
        double v155 = v7;
        if (v153)
        {
          uint64_t v156 = v153;
          uint64_t v157 = *(void *)v222;
          CGFloat v158 = v9;
          CGFloat v159 = v8;
          double v155 = v7;
          double v154 = v6;
          do
          {
            for (uint64_t i = 0; i != v156; ++i)
            {
              if (*(void *)v222 != v157) {
                objc_enumerationMutation(v152);
              }
              v161 = *(void **)(*((void *)&v221 + 1) + 8 * i);
              v238.origin.x = v154;
              v238.origin.y = v155;
              v238.size.width = v159;
              v238.size.height = v158;
              v240.origin.x = v6;
              v240.origin.y = v7;
              v240.size.width = v8;
              v240.size.height = v9;
              BOOL v162 = CGRectEqualToRect(v238, v240);
              [v161 renderBounds];
              double v167 = v163;
              double v168 = v164;
              double v169 = v165;
              double v170 = v166;
              if (!v162)
              {
                v239.origin.x = v154;
                v239.origin.y = v155;
                v239.size.width = v159;
                v239.size.height = v158;
                *(CGRect *)&double v163 = CGRectUnion(v239, *(CGRect *)&v167);
              }
              double v154 = v163;
              double v155 = v164;
              CGFloat v159 = v165;
              CGFloat v158 = v166;
            }
            uint64_t v156 = [v152 countByEnumeratingWithState:&v221 objects:v230 count:16];
          }
          while (v156);
        }

        v171 = [v147 originalStrokes];
        v172 = [v147 unchangedStrokes];
        v173 = [(PKAutorefineDataCollectionViewController *)(id *)&self->super.super.super.isa makeDrawingForOriginalStrokes:0 refinedStrokes:v172 contextStrokes:v154 bounds:v155];

        v174 = -[PKAutorefineDataCollectionViewController makeImageForDrawing:]((uint64_t)self, v173);
        v175 = [v147 refinedStrokes];
        v176 = [v147 unchangedStrokes];
        v177 = [(PKAutorefineDataCollectionViewController *)(id *)&self->super.super.super.isa makeDrawingForOriginalStrokes:v175 refinedStrokes:v176 contextStrokes:v154 bounds:v155];

        v178 = -[PKAutorefineDataCollectionViewController makeImageForDrawing:]((uint64_t)self, v177);
        [v174 size];
        double v180 = v179;
        [v178 size];
        if (v180 < v181) {
          double v180 = v181;
        }
        [v174 size];
        double v183 = v182;
        [v178 size];
        v237.height = v183 + v184;
        v237.width = v180;
        UIGraphicsBeginImageContextWithOptions(v237, 0, 0.0);
        [v174 size];
        objc_msgSend(v174, "drawInRect:", 0.0, 0.0, v180, v185);
        [v174 size];
        double v187 = v186;
        [v178 size];
        objc_msgSend(v178, "drawInRect:", 0.0, v187, v180, v188);
        v189 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        uint64_t v190 = objc_opt_new();
        v191 = (id *)v190;
        if (v190)
        {
          objc_storeStrong((id *)(v190 + 32), v147);
          objc_storeStrong(v191 + 3, v189);
          objc_storeStrong(v191 + 1, v173);
          objc_storeStrong(v191 + 2, v177);
        }
        if (self) {
          tableDataEntries = self->_tableDataEntries;
        }
        else {
          tableDataEntries = 0;
        }
        v193 = tableDataEntries;
        [(NSMutableArray *)v193 addObject:v191];

        ++v146;
      }
      while (v146 != v220);
      uint64_t v194 = [objb countByEnumeratingWithState:&v225 objects:v231 count:16];
      uint64_t v220 = v194;
    }
    while (v194);
  }

  -[PKAutorefineDataCollectionViewController updateTableViewHeight]((uint64_t)self);
}

- (id)makeDrawingForOriginalStrokes:(void *)a3 refinedStrokes:(void *)a4 contextStrokes:(double)a5 bounds:(double)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (a1)
  {
    if ([a1[122] count])
    {
      v38 = [a1[122] objectAtIndexedSubscript:0];
      a1 = (id *)objc_alloc_init((Class)objc_opt_class());
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v40 = v11;
      id v14 = v11;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v69 count:16];
      double v16 = -a5;
      double v17 = -a6;
      v18 = (long long *)MEMORY[0x1E4F1DAB8];
      if (v15)
      {
        uint64_t v19 = v15;
        uint64_t v20 = *(void *)v64;
        long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        long long v48 = *MEMORY[0x1E4F1DAB8];
        long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v64 != v20) {
              objc_enumerationMutation(v14);
            }
            v22 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * i) copyForMutation];
            *(_OWORD *)&v61.a = v48;
            *(_OWORD *)&v61.c = v45;
            *(_OWORD *)&v61.tx = v42;
            CGAffineTransformTranslate(&v62, &v61, v16, v17);
            [v22 _applyTransform:&v62];
            [a1 addNewStroke:v22];
          }
          uint64_t v19 = [v14 countByEnumeratingWithState:&v63 objects:v69 count:16];
        }
        while (v19);
      }

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v23 = v12;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v58;
        long long v46 = v18[1];
        long long v49 = *v18;
        long long v43 = v18[2];
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v58 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * j) copyForMutation];
            *(_OWORD *)&v61.a = v49;
            *(_OWORD *)&v61.c = v46;
            *(_OWORD *)&v61.tx = v43;
            CGAffineTransformTranslate(&v56, &v61, v16, v17);
            [v28 _applyTransform:&v56];
            [a1 addNewStroke:v28];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v68 count:16];
        }
        while (v25);
      }
      id v39 = v12;

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = v13;
      uint64_t v29 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v53;
        long long v47 = v18[1];
        long long v50 = *v18;
        long long v44 = v18[2];
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v53 != v31) {
              objc_enumerationMutation(obj);
            }
            v33 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * k) copyForMutation];
            *(_OWORD *)&v61.a = v50;
            *(_OWORD *)&v61.c = v47;
            *(_OWORD *)&v61.tx = v44;
            CGAffineTransformTranslate(&v51, &v61, v16, v17);
            [v33 _applyTransform:&v51];
            v34 = [v33 ink];
            v35 = [MEMORY[0x1E4FB1618] lightGrayColor];
            v36 = +[PKInk inkFromInk:v34 color:v35];
            [v33 setInk:v36];

            [a1 addNewStroke:v33];
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
        }
        while (v30);
      }

      id v12 = v39;
      id v11 = v40;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)makeImageForDrawing:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__34;
    uint64_t v30 = __Block_byref_object_dispose__34;
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
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 bounds];
    double v12 = v11;

    if (v12 < v7) {
      double v7 = v12;
    }
    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 bounds];
    double v15 = v14;

    if (v15 < MaxY) {
      double MaxY = v15;
    }
    double v16 = [PKImageRenderer alloc];
    double v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    uint64_t v19 = -[PKImageRenderer initWithSize:scale:](v16, "initWithSize:scale:", v7, MaxY, v18);

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__PKAutorefineDataCollectionViewController_makeImageForDrawing___block_invoke;
    v23[3] = &unk_1E64C72E0;
    uint64_t v25 = &v26;
    uint64_t v20 = v4;
    uint64_t v24 = v20;
    [(PKImageRenderer *)v19 renderDrawing:v3 completion:v23];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    id v21 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (uint64_t)updateTableViewHeight
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = *(id *)(result + 984);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      double v6 = 0.0;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
          if (v8) {
            double v9 = *(void **)(v8 + 24);
          }
          else {
            double v9 = 0;
          }
          objc_msgSend(v9, "size", (void)v12);
          double v6 = v6 + v10 + 40.0 + 20.0;
          ++v7;
        }
        while (v4 != v7);
        uint64_t v11 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v4 = v11;
      }
      while (v11);
    }
    else
    {
      double v6 = 0.0;
    }

    return [*(id *)(v1 + 1016) setConstant:v6];
  }
  return result;
}

- (id)makeDrawingForStrokes:(id *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CGFloat v4 = *MEMORY[0x1E4F1DB28];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    CGFloat v11 = v7;
    CGFloat v12 = v6;
    double v13 = v5;
    double v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v3);
        }
        double v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v35.origin.x = v14;
        v35.origin.y = v13;
        v35.size.width = v12;
        v35.size.height = v11;
        v37.origin.x = v4;
        v37.origin.y = v5;
        v37.size.width = v6;
        v37.size.height = v7;
        BOOL v17 = CGRectEqualToRect(v35, v37);
        [v16 renderBounds];
        double v22 = v18;
        double v23 = v19;
        double v24 = v20;
        double v25 = v21;
        if (!v17)
        {
          v36.origin.x = v14;
          v36.origin.y = v13;
          v36.size.width = v12;
          v36.size.height = v11;
          *(CGRect *)&double v18 = CGRectUnion(v36, *(CGRect *)&v22);
        }
        double v14 = v18;
        double v13 = v19;
        CGFloat v12 = v20;
        CGFloat v11 = v21;
      }
      uint64_t v9 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }
  else
  {
    double v13 = v5;
    double v14 = v4;
  }
  uint64_t v26 = [(PKAutorefineDataCollectionViewController *)a1 makeDrawingForOriginalStrokes:0 refinedStrokes:0 contextStrokes:v14 bounds:v13];

  return v26;
}

void __64__PKAutorefineDataCollectionViewController_makeImageForDrawing___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)saveDrawing:(void *)a1 toBaseURL:(void *)a2 withName:(void *)a3
{
  id v5 = a3;
  id v6 = a2;
  CGFloat v7 = [a1 serializeWithVersion:2];
  uint64_t v8 = [v6 URLByAppendingPathComponent:v5];

  [v7 writeToURL:v8 atomically:1];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self) {
    self = (PKAutorefineDataCollectionViewController *)self->_tableDataEntries;
  }
  return [(PKAutorefineDataCollectionViewController *)self count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  CGFloat v7 = [a3 dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:v6];
  uint64_t v8 = [v7 contentView];
  uint64_t v9 = [v8 subviews];
  [v9 makeObjectsPerformSelector:sel_removeFromSuperview];

  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  CGFloat v11 = [v7 contentView];
  [v11 bounds];
  CGFloat v12 = objc_msgSend(v10, "initWithFrame:");

  [v12 setAutoresizingMask:18];
  double v13 = [v12 layer];
  [v13 setCornerRadius:15.0];

  double v14 = [v12 layer];
  [v14 setMasksToBounds:1];

  long long v15 = [v12 layer];
  [v15 setBorderWidth:0.8];

  id v16 = [MEMORY[0x1E4FB1618] grayColor];
  uint64_t v17 = [v16 CGColor];
  double v18 = [v12 layer];
  [v18 setBorderColor:v17];

  if (self) {
    tableDataEntries = self->_tableDataEntries;
  }
  else {
    tableDataEntries = 0;
  }
  double v20 = tableDataEntries;
  uint64_t v21 = [v6 row];

  uint64_t v22 = [(NSMutableArray *)v20 objectAtIndexedSubscript:v21];
  double v23 = (void *)v22;
  if (v22) {
    double v24 = *(void **)(v22 + 24);
  }
  else {
    double v24 = 0;
  }

  id v25 = v24;
  [v25 size];
  double v27 = v26;
  long long v28 = [v7 contentView];
  [v28 bounds];
  double v30 = v29 + -40.0;

  long long v31 = [v7 contentView];
  [v31 bounds];
  double v33 = (v32 - v30) * 0.5;

  v34 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v25];
  [v34 setContentMode:1];
  objc_msgSend(v34, "setFrame:", v33, 20.0, v30, v27);
  [v12 addSubview:v34];
  CGRect v35 = [v7 contentView];
  [v35 addSubview:v12];

  CGRect v36 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v36];

  id v37 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v7 bounds];
  v38 = objc_msgSend(v37, "initWithFrame:");
  id v39 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v40 = [v39 colorWithAlphaComponent:0.4];
  [v38 setBackgroundColor:v40];

  v41 = [v38 layer];
  [v41 setCornerRadius:15.0];

  long long v42 = [v38 layer];
  [v42 setMasksToBounds:1];

  [v7 setSelectedBackgroundView:v38];

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (self) {
    tableDataEntries = self->_tableDataEntries;
  }
  else {
    tableDataEntries = 0;
  }
  id v6 = tableDataEntries;
  uint64_t v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", [a4 row]);
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = *(void **)(v7 + 24);
  }
  else {
    uint64_t v9 = 0;
  }

  id v10 = v9;
  [v10 size];
  double v12 = v11;

  return v12 + 40.0 + 20.0;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAutorefineDataCollectionViewController;
  [(PKAutorefineDataCollectionViewController *)&v3 viewDidLayoutSubviews];
  -[PKAutorefineDataCollectionViewController updateTableViewHeight]((uint64_t)self);
}

- (void)submitFeedback
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];

  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = NSTemporaryDirectory();
  uint64_t v7 = [v5 fileURLWithPath:v6];
  uint64_t v8 = [(id)v7 URLByAppendingPathComponent:v4];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v66 = 0;
  LOBYTE(v7) = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v66];
  id v10 = v66;
  double v11 = v10;
  if (v7)
  {
    id v65 = v8;
    CGAffineTransform v56 = v8;
    long long v57 = v4;
    long long v54 = v11;
    id v55 = v9;
    if (self)
    {
      long long v64 = [MEMORY[0x1E4F1CA48] array];
      double v12 = [(UITableView *)self->_tableView indexPathsForSelectedRows];
      if ([v12 count])
      {
        double v13 = (NSMutableArray *)objc_opt_new();
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v68 objects:v72 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v69;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v69 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = *(void **)(*((void *)&v68 + 1) + 8 * v18);
              double v20 = self->_tableDataEntries;
              uint64_t v21 = -[NSMutableArray objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", [v19 row]);

              [(NSMutableArray *)v13 addObject:v21];
              ++v18;
            }
            while (v16 != v18);
            uint64_t v16 = [v14 countByEnumeratingWithState:&v68 objects:v72 count:16];
          }
          while (v16);
        }
      }
      else
      {
        double v13 = self->_tableDataEntries;
      }

      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v61 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v61)
      {
        uint64_t v62 = 0;
        uint64_t v58 = *(void *)v69;
        long long v59 = v13;
        long long v60 = self;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v69 != v58) {
              objc_enumerationMutation(v13);
            }
            uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * v22);
            if (v23) {
              double v24 = *(void **)(v23 + 32);
            }
            else {
              double v24 = 0;
            }
            id v25 = [v24 originalStrokes];
            double v26 = -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v25);

            if (v23) {
              double v27 = *(void **)(v23 + 32);
            }
            else {
              double v27 = 0;
            }
            long long v28 = [v27 refinedStrokes];
            double v29 = -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v28);

            if (v23) {
              double v30 = *(void **)(v23 + 32);
            }
            else {
              double v30 = 0;
            }
            uint64_t v31 = v62 + v22;
            double v32 = [v30 unchangedStrokes];
            double v33 = -[PKAutorefineDataCollectionViewController makeDrawingForStrokes:]((id *)&self->super.super.super.isa, v32);

            v34 = objc_msgSend(NSString, "stringWithFormat:", @"/drawing_%ld_original.drawing", v62 + v22);
            long long v63 = v26;
            CGRect v35 = -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v26, v65, v34);
            [v64 addObject:v35];

            CGRect v36 = objc_msgSend(NSString, "stringWithFormat:", @"/drawing_%ld_refined.drawing", v62 + v22);
            id v37 = -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v29, v65, v36);
            [v64 addObject:v37];

            v38 = objc_msgSend(NSString, "stringWithFormat:", @"/drawing_%ld_context.drawing", v62 + v22);
            id v39 = -[PKAutorefineDataCollectionViewController saveDrawing:toBaseURL:withName:](v33, v65, v38);
            [v64 addObject:v39];

            if (v23) {
              id v40 = *(UIImage **)(v23 + 24);
            }
            else {
              id v40 = 0;
            }
            v41 = UIImagePNGRepresentation(v40);
            long long v42 = objc_msgSend(NSString, "stringWithFormat:", @"/image_%ld.png", v31);
            long long v43 = [v65 URLByAppendingPathComponent:v42];

            [v41 writeToURL:v43 atomically:1];
            [v64 addObject:v43];
            long long v44 = (void *)MEMORY[0x1E4F28D90];
            if (v23) {
              long long v45 = *(void **)(v23 + 32);
            }
            else {
              long long v45 = 0;
            }
            id v46 = v45;
            long long v47 = [v46 debugInfo];
            id v67 = 0;
            long long v48 = [v44 dataWithJSONObject:v47 options:0 error:&v67];
            id v49 = v67;

            if (!v48) {
              NSLog(&cfstr_ErrorSavingDeb.isa, v49);
            }
            long long v50 = objc_msgSend(NSString, "stringWithFormat:", @"debug_info_%ld.json", v31);
            CGAffineTransform v51 = [v65 URLByAppendingPathComponent:v50];

            [v48 writeToURL:v51 atomically:1];
            [v64 addObject:v51];

            ++v22;
            self = v60;
            double v13 = v59;
          }
          while (v61 != v22);
          uint64_t v52 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v68 objects:v72 count:16];
          uint64_t v61 = v52;
          v62 += v22;
        }
        while (v52);
      }
      long long v53 = [MEMORY[0x1E4F1C978] arrayWithArray:v64];
    }
    else
    {
      long long v53 = 0;
    }

    +[PKHandwritingDebugUtility submitFeedbackWithAttachments:v53 title:@"Autorefine Feedback: "];
    uint64_t v8 = v56;
    id v4 = v57;
    double v11 = v54;
    id v9 = v55;
  }
  else
  {
    NSLog(&cfstr_Error.isa, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tableDataEntries, 0);

  objc_storeStrong((id *)&self->_allDrawings, 0);
}

@end