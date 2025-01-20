@interface ICDocCamThumbnailCollectionViewLayout
- (BOOL)compactLayout;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)transitioning;
- (CGRect)compactFrameForThumbnailAtIndexPath:(id)a3 withSize:(CGSize)a4;
- (CGRect)frameForThumbnailAtIndexPath:(id)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)frameSizeForImageSize:(CGSize)a3;
- (CGSize)itemSize;
- (ICDocCamThumbnailCollectionViewLayout)init;
- (ICDocCamThumbnailCollectionViewLayout)initWithCoder:(id)a3;
- (ICDocCamThumbnailViewLayoutDelegate)delegate;
- (NSDictionary)layoutInfo;
- (NSMutableArray)deleteIndexPaths;
- (NSMutableArray)insertIndexPaths;
- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)prepareLayout:(BOOL)a3;
- (void)setCompactLayout:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteIndexPaths:(id)a3;
- (void)setInsertIndexPaths:(id)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setLayoutInfo:(id)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setup;
@end

@implementation ICDocCamThumbnailCollectionViewLayout

- (ICDocCamThumbnailCollectionViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  v2 = [(ICDocCamThumbnailCollectionViewLayout *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICDocCamThumbnailCollectionViewLayout *)v2 setup];
  }
  return v3;
}

- (ICDocCamThumbnailCollectionViewLayout)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  v3 = [(ICDocCamThumbnailCollectionViewLayout *)&v6 init];
  v4 = v3;
  if (v3) {
    [(ICDocCamThumbnailCollectionViewLayout *)v3 setup];
  }
  return v4;
}

- (void)setup
{
  v5.size.width = 46.3636364;
  v5.size.height = 60.0;
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  CGRect v6 = CGRectIntegral(v5);
  -[ICDocCamThumbnailCollectionViewLayout setItemSize:](self, "setItemSize:", v6.size.width, v6.size.height);
  uint64_t v3 = objc_opt_class();

  [(ICDocCamThumbnailCollectionViewLayout *)self registerClass:v3 forDecorationViewOfKind:@"DecorationIdentifier"];
}

- (void)prepareLayout
{
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 0;

  [(ICDocCamThumbnailCollectionViewLayout *)self setCompactLayout:v4];
  BOOL v5 = [(ICDocCamThumbnailCollectionViewLayout *)self compactLayout];

  [(ICDocCamThumbnailCollectionViewLayout *)self prepareLayout:v5];
}

- (void)prepareLayout:(BOOL)a3
{
  BOOL v55 = a3;
  id v52 = [MEMORY[0x263EFF9A0] dictionary];
  v54 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  uint64_t v5 = [v4 numberOfSections];

  uint64_t v53 = v5;
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0x263F08000uLL;
    v8 = v54;
    do
    {
      v9 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
      uint64_t v10 = [v9 numberOfItemsInSection:v6];

      uint64_t v11 = v10 - 1;
      if (v10 >= 1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          v13 = [*(id *)(v7 + 2248) indexPathForItem:i inSection:v6];
          v14 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v13];
          objc_opt_class();
          objc_opt_isKindOfClass();
          if (v55)
          {
            v15 = [*(id *)(v7 + 2248) indexPathForItem:v10 - 1 inSection:v6];
            v16 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
            v17 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
            objc_msgSend(v16, "collectionView:imageSizeAtIndex:", v17, objc_msgSend(v15, "item"));
            double v19 = v18;
            double v21 = v20;

            v8 = v54;
            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v19, v21);
            double v23 = v22;
            double v25 = v24;
            -[ICDocCamThumbnailCollectionViewLayout compactFrameForThumbnailAtIndexPath:withSize:](self, "compactFrameForThumbnailAtIndexPath:withSize:", v13);
            objc_msgSend(v14, "setFrame:");
            [v14 setImageWidth:v23];
            [v14 setImageHeight:v25];
            BOOL v26 = v10 - 2 != i && v11 != i;
            [v14 setRenderShadow:v11 == i];
            BOOL v27 = v26;
            unint64_t v7 = 0x263F08000;
            [v14 setHidden:v27];
          }
          else
          {
            v28 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
            v29 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
            objc_msgSend(v28, "collectionView:imageSizeAtIndex:", v29, objc_msgSend(v13, "item"));
            double v31 = v30;
            double v33 = v32;

            unint64_t v7 = 0x263F08000;
            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v31, v33);
            double v35 = v34;
            double v37 = v36;
            [(ICDocCamThumbnailCollectionViewLayout *)self frameForThumbnailAtIndexPath:v13];
            objc_msgSend(v14, "setFrame:");
            [v14 setImageWidth:v35];
            [v14 setImageHeight:v37];
            [v14 setRenderShadow:1];
            [v14 setHidden:0];
          }
          objc_msgSend(v14, "setZIndex:", objc_msgSend(v13, "item"));
          [v8 setObject:v14 forKeyedSubscript:v13];
        }
      }
      ++v6;
    }
    while (v6 != v53);
    if (!v55 && v53 >= 1)
    {
      uint64_t v38 = 0;
      while (2)
      {
        v39 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
        uint64_t v40 = [v39 numberOfItemsInSection:v38];

        uint64_t v41 = v40 - 2;
        if (v40 >= 2)
        {
          uint64_t v42 = 0;
          do
          {
            v43 = [MEMORY[0x263F088C8] indexPathForItem:v42 inSection:v38];
            v44 = [MEMORY[0x263F088C8] indexPathForItem:++v42 inSection:v38];
            v45 = [v54 objectForKeyedSubscript:v43];
            v46 = [v54 objectForKeyedSubscript:v44];
            [v45 frame];
            double v48 = v47;
            [v46 frame];
            double v50 = v48 - v49;
            if (v50 < 0.0) {
              double v50 = -v50;
            }
            if (v50 < 8.0)
            {
              [(ICDocCamThumbnailCollectionViewLayout *)self setCompactLayout:1];
              [(ICDocCamThumbnailCollectionViewLayout *)self prepareLayout:1];

              v51 = v54;
              goto LABEL_25;
            }
          }
          while (v42 - 1 != v41);
          if (++v38 != v53) {
            continue;
          }
        }
        break;
      }
    }
  }
  v51 = v54;
  [v52 setObject:v54 forKeyedSubscript:@"ICDocCamThumbnailCellKind"];
  [(ICDocCamThumbnailCollectionViewLayout *)self setLayoutInfo:v52];
LABEL_25:
}

- (CGSize)frameSizeForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ICDocCamThumbnailCollectionViewLayout *)self itemSize];
  double v8 = v7;
  if (width > height)
  {
    [(ICDocCamThumbnailCollectionViewLayout *)self itemSize];
    double v10 = v9;
    double v6 = v8;
    double v8 = v10;
  }
  double v11 = v8;
  result.double height = v11;
  result.double width = v6;
  return result;
}

- (CGRect)compactFrameForThumbnailAtIndexPath:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = 0.0;
  if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL", a3))
  {
    double v8 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    [v8 frame];
    double v10 = v9;

    double v7 = v10 - width;
  }
  [(ICDocCamThumbnailCollectionViewLayout *)self itemSize];
  double v12 = v11 - height + 0.0;
  double v13 = v7;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGRect)frameForThumbnailAtIndexPath:(id)a3
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  uint64_t v6 = [v5 numberOfItemsInSection:0];

  if (v6)
  {
    double v7 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
    double v8 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    objc_msgSend(v7, "collectionView:imageSizeAtIndex:", v8, objc_msgSend(v4, "item"));
    double v10 = v9;
    double v12 = v11;

    -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v10, v12);
    double v14 = v13;
    double v16 = v15;
    v17 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
    double v18 = [v17 rootView];

    [v18 frame];
    double v20 = v19 * 0.5;
    double v22 = v21 * 0.5;
    double v23 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
    double v25 = v24;

    if (objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL"))
    {
      BOOL v26 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
      [v26 frame];
      double v28 = v27;

      if ((DCDebugInterfaceEnabled() & 1) != 0
        || ([MEMORY[0x263F1C5C0] currentDevice],
            v29 = objc_claimAutoreleasedReturnValue(),
            uint64_t v30 = [v29 userInterfaceIdiom],
            v29,
            v30 == 1))
      {
        MEMORY[0x270FA5388]();
        double v31 = (double *)(&v164 - 2 * v6);
        uint64_t v32 = v6 - 1;
        if (v6 < 1)
        {
          double v44 = 0.0;
        }
        else
        {
          v165 = v18;
          v166 = &v164;
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          double v35 = v31 + 1;
          do
          {
            double v36 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
            double v37 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
            [v36 collectionView:v37 imageSizeAtIndex:v34];
            double v39 = v38;
            double v41 = v40;

            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v39, v41);
            *(v35 - 1) = v42;
            *(void *)double v35 = v43;
            uint64_t v33 = (uint64_t)(v42 + (double)v33);
            ++v34;
            v35 += 2;
          }
          while (v6 != v34);
          double v44 = (double)v33;
          double v18 = v165;
        }
        v63 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
        [v63 frame];
        double v65 = v64;

        double v66 = fmin((v65 - v44) / (double)v32, 10.0);
        double v46 = v25 + (double)((uint64_t)(v44 + v66 * (double)v32) / 2) - *v31;
        uint64_t v67 = [v4 item];
        if (v67 >= v32) {
          uint64_t v68 = v32;
        }
        else {
          uint64_t v68 = v67;
        }
        if (v68 >= 1)
        {
          uint64_t v69 = 0;
          v70 = v31 + 2;
          do
          {
            double v71 = *v70;
            v70 += 2;
            double v46 = v46 - (v66 + v71);
            uint64_t v72 = [v4 item];
            if (v72 >= v32) {
              uint64_t v73 = v32;
            }
            else {
              uint64_t v73 = v72;
            }
            ++v69;
          }
          while (v69 < v73);
        }
      }
      else
      {
        v166 = &v164;
        MEMORY[0x270FA5388]();
        v84 = (double *)(&v164 - 2 * v6);
        uint64_t v85 = v6 - 1;
        if (v6 < 1)
        {
          double v97 = 0.0;
        }
        else
        {
          v165 = v18;
          uint64_t v86 = 0;
          uint64_t v87 = 0;
          v88 = v84 + 1;
          do
          {
            v89 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
            v90 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
            [v89 collectionView:v90 imageSizeAtIndex:v87];
            double v92 = v91;
            double v94 = v93;

            -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v92, v94);
            *(v88 - 1) = v95;
            *(void *)v88 = v96;
            uint64_t v86 = (uint64_t)(v95 + (double)v86);
            ++v87;
            v88 += 2;
          }
          while (v6 != v87);
          double v97 = (double)v86;
          double v18 = v165;
        }
        uint64_t v112 = (uint64_t)(v97 + (double)v85 * 10.0);
        v113 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
        [v113 frame];
        double v115 = v114;

        if (v112 >= 0) {
          uint64_t v116 = v112;
        }
        else {
          uint64_t v116 = v112 + 1;
        }
        uint64_t v117 = v116 >> 1;
        double v118 = v25 + (double)v117;
        if (v25 - (double)v117 >= 0.0 && v118 <= v115)
        {
          double v46 = v118 - *v84;
          uint64_t v129 = [v4 item];
          if (v129 >= v85) {
            uint64_t v130 = v85;
          }
          else {
            uint64_t v130 = v129;
          }
          if (v130 >= 1)
          {
            uint64_t v131 = 0;
            v132 = v84 + 2;
            do
            {
              double v133 = *v132;
              v132 += 2;
              double v46 = v46 - (v133 + 10.0);
              uint64_t v134 = [v4 item];
              if (v134 >= v85) {
                uint64_t v135 = v85;
              }
              else {
                uint64_t v135 = v134;
              }
              ++v131;
            }
            while (v131 < v135);
          }
        }
        else
        {
          double v46 = v28 - *v84;
          uint64_t v120 = [v4 item];
          if (v120 >= v85) {
            uint64_t v121 = v85;
          }
          else {
            uint64_t v121 = v120;
          }
          if (v121 >= 1)
          {
            uint64_t v122 = 0;
            double v123 = fmin((v115 - (double)(uint64_t)((double)v112 - (double)v85 * 10.0)) / (double)v85, 10.0);
            v124 = v84 + 2;
            do
            {
              double v125 = *v124;
              v124 += 2;
              double v126 = v46 - (v123 + v125);
              if (v126 <= (double)(uint64_t)v46) {
                double v46 = v126;
              }
              else {
                double v46 = (double)(uint64_t)v46;
              }
              uint64_t v127 = [v4 item];
              if (v127 >= v85) {
                uint64_t v128 = v85;
              }
              else {
                uint64_t v128 = v127;
              }
              ++v122;
            }
            while (v122 < v128);
          }
        }
      }
    }
    else if ((DCDebugInterfaceEnabled() & 1) != 0 {
           || ([MEMORY[0x263F1C5C0] currentDevice],
    }
               double v47 = objc_claimAutoreleasedReturnValue(),
               uint64_t v48 = [v47 userInterfaceIdiom],
               v47,
               v48 == 1))
    {
      MEMORY[0x270FA5388]();
      double v49 = (double *)(&v164 - 2 * v6);
      uint64_t v50 = v6 - 1;
      if (v6 < 1)
      {
        double v62 = 0.0;
      }
      else
      {
        v165 = v18;
        v166 = &v164;
        uint64_t v51 = 0;
        uint64_t v52 = 0;
        uint64_t v53 = v49 + 1;
        do
        {
          v54 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
          BOOL v55 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
          [v54 collectionView:v55 imageSizeAtIndex:v51];
          double v57 = v56;
          double v59 = v58;

          -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v57, v59);
          *(v53 - 1) = v60;
          *(void *)uint64_t v53 = v61;
          uint64_t v52 = (uint64_t)(v60 + (double)v52);
          ++v51;
          v53 += 2;
        }
        while (v6 != v51);
        double v62 = (double)v52;
        double v18 = v165;
      }
      v74 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
      [v74 frame];
      double v76 = v75;

      double v77 = fmin((v76 - v62) / (double)v50, 10.0);
      double v46 = v25 - (double)((uint64_t)(v62 + v77 * (double)v50) / 2);
      uint64_t v78 = [v4 item];
      if (v78 >= v6) {
        uint64_t v79 = v6;
      }
      else {
        uint64_t v79 = v78;
      }
      if (v79 >= 1)
      {
        for (uint64_t i = 0; i < v83; ++i)
        {
          double v81 = *v49;
          v49 += 2;
          double v46 = v46 + v77 + v81;
          uint64_t v82 = [v4 item];
          if (v82 >= v6) {
            uint64_t v83 = v6;
          }
          else {
            uint64_t v83 = v82;
          }
        }
      }
    }
    else
    {
      v166 = &v164;
      MEMORY[0x270FA5388]();
      v98 = (double *)(&v164 - 2 * v6);
      uint64_t v99 = v6 - 1;
      if (v6 < 1)
      {
        double v111 = 0.0;
      }
      else
      {
        v165 = v18;
        uint64_t v100 = 0;
        uint64_t v101 = 0;
        v102 = v98 + 1;
        do
        {
          v103 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
          v104 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
          [v103 collectionView:v104 imageSizeAtIndex:v100];
          double v106 = v105;
          double v108 = v107;

          -[ICDocCamThumbnailCollectionViewLayout frameSizeForImageSize:](self, "frameSizeForImageSize:", v106, v108);
          *(v102 - 1) = v109;
          *(void *)v102 = v110;
          uint64_t v101 = (uint64_t)(v109 + (double)v101);
          ++v100;
          v102 += 2;
        }
        while (v6 != v100);
        double v111 = (double)v101;
        double v18 = v165;
      }
      double v136 = v111 + (double)v99 * 10.0;
      uint64_t v137 = (uint64_t)v136;
      if ((uint64_t)v136 >= 0) {
        uint64_t v138 = (uint64_t)v136;
      }
      else {
        uint64_t v138 = v137 + 1;
      }
      double v139 = (double)(v138 >> 1);
      double v46 = v25 - v139;
      v140 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
      [v140 frame];
      double v142 = v141;

      double v143 = v25 + v139;
      if (v25 - v139 >= 0.0 && v143 <= v142)
      {
        uint64_t v153 = objc_msgSend(v4, "item", v143);
        if (v153 >= v6) {
          uint64_t v154 = v6;
        }
        else {
          uint64_t v154 = v153;
        }
        if (v154 >= 1)
        {
          for (uint64_t j = 0; j < v158; ++j)
          {
            double v156 = *v98;
            v98 += 2;
            double v46 = v46 + v156 + 10.0;
            uint64_t v157 = [v4 item];
            if (v157 >= v6) {
              uint64_t v158 = v6;
            }
            else {
              uint64_t v158 = v157;
            }
          }
        }
      }
      else
      {
        uint64_t v145 = objc_msgSend(v4, "item", v143);
        if (v145 >= v6) {
          uint64_t v146 = v6;
        }
        else {
          uint64_t v146 = v145;
        }
        if (v146 < 1)
        {
          double v46 = 0.0;
        }
        else
        {
          uint64_t v147 = 0;
          double v148 = fmin((v142 - (double)(uint64_t)((double)v137 - (double)v99 * 10.0)) / (double)v99, 10.0);
          double v46 = 0.0;
          do
          {
            double v149 = *v98;
            v98 += 2;
            double v150 = v46 + v148 + v149;
            if (v150 >= (double)(uint64_t)v46) {
              double v46 = v150;
            }
            else {
              double v46 = (double)(uint64_t)v46;
            }
            uint64_t v151 = [v4 item];
            if (v151 >= v6) {
              uint64_t v152 = v6;
            }
            else {
              uint64_t v152 = v151;
            }
            ++v147;
          }
          while (v147 < v152);
        }
      }
    }
    [(ICDocCamThumbnailCollectionViewLayout *)self itemSize];
    double v45 = v159 - v16 + 0.0;
  }
  else
  {
    double v46 = *MEMORY[0x263F001A8];
    double v45 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v160 = v46;
  double v161 = v45;
  double v162 = v14;
  double v163 = v16;
  result.size.double height = v163;
  result.size.double width = v162;
  result.origin.y = v161;
  result.origin.x = v160;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__6;
  double v24 = __Block_byref_object_dispose__6;
  double v8 = (void *)MEMORY[0x263EFF980];
  double v9 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutInfo];
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  double v10 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutInfo];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke;
  v19[3] = &unk_2642AA700;
  *(CGFloat *)&v19[5] = x;
  *(CGFloat *)&v19[6] = y;
  *(CGFloat *)&v19[7] = width;
  *(CGFloat *)&v19[8] = height;
  v19[4] = &v20;
  [v10 enumerateKeysAndObjectsUsingBlock:v19];

  double v11 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  uint64_t v12 = [v11 numberOfItemsInSection:0];

  BOOL v13 = [(ICDocCamThumbnailCollectionViewLayout *)self compactLayout];
  if (v12 > 1 && v13)
  {
    double v15 = [MEMORY[0x263F088C8] indexPathForItem:v12 - 1 inSection:0];
    double v16 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutAttributesForDecorationViewOfKind:@"DecorationIdentifier" atIndexPath:v15];

    if (v16) {
      [(id)v21[5] addObject:v16];
    }
  }
  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

uint64_t __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2;
  v5[3] = &unk_2642AA6D8;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  v5[4] = *(void *)(a1 + 32);
  return [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __75__ICDocCamThumbnailCollectionViewLayout_layoutAttributesForElementsInRect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [v8 frame];
  v10.origin.CGFloat x = v4;
  v10.origin.CGFloat y = v5;
  v10.size.CGFloat width = v6;
  v10.size.CGFloat height = v7;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v10)) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutInfo];
  CGFloat v6 = [v5 objectForKeyedSubscript:@"ICDocCamThumbnailCellKind"];
  CGFloat v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  uint64_t v9 = [v8 numberOfItemsInSection:0];

  CGRect v10 = 0;
  if ([(ICDocCamThumbnailCollectionViewLayout *)self compactLayout] && v9 >= 2)
  {
    CGRect v10 = [MEMORY[0x263F1C520] layoutAttributesForDecorationViewOfKind:v6 withIndexPath:v7];
    double v11 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"ICDocCamThumbnailCellKind"];
    BOOL v13 = [v12 objectForKeyedSubscript:v7];

    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    int v22 = objc_msgSend(MEMORY[0x263F1C358], "dc_isRTL");
    double v23 = -2.0;
    if (v22) {
      double v23 = 2.0;
    }
    objc_msgSend(v10, "setFrame:", v15 + v23, v17 + 2.0, v19, v21);
    [v10 setZIndex:-1];
  }

  return v10;
}

- (CGSize)collectionViewContentSize
{
  long long v3 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  [v6 bounds];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (![(ICDocCamThumbnailCollectionViewLayout *)self transitioning]) {
    return 1;
  }
  double v8 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v17 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = v10;
  v20.origin.CGFloat y = v12;
  v20.size.CGFloat width = v14;
  v20.size.CGFloat height = v16;
  return v17 != CGRectGetWidth(v20);
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  [(ICDocCamThumbnailCollectionViewLayout *)&v20 prepareForCollectionViewUpdates:v4];
  double v5 = [MEMORY[0x263EFF980] array];
  [(ICDocCamThumbnailCollectionViewLayout *)self setDeleteIndexPaths:v5];

  id v6 = [MEMORY[0x263EFF980] array];
  [(ICDocCamThumbnailCollectionViewLayout *)self setInsertIndexPaths:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (void)v16) == 1)
        {
          double v13 = [(ICDocCamThumbnailCollectionViewLayout *)self deleteIndexPaths];
          uint64_t v14 = [v12 indexPathBeforeUpdate];
        }
        else
        {
          if ([v12 updateAction]) {
            continue;
          }
          double v13 = [(ICDocCamThumbnailCollectionViewLayout *)self insertIndexPaths];
          uint64_t v14 = [v12 indexPathAfterUpdate];
        }
        double v15 = (void *)v14;
        [v13 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  [(ICDocCamThumbnailCollectionViewLayout *)&v3 finalizeCollectionViewUpdates];
  [(ICDocCamThumbnailCollectionViewLayout *)self setDeleteIndexPaths:0];
  [(ICDocCamThumbnailCollectionViewLayout *)self setInsertIndexPaths:0];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  double v5 = [(ICDocCamThumbnailCollectionViewLayout *)&v36 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  id v6 = [(ICDocCamThumbnailCollectionViewLayout *)self insertIndexPaths];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    if (!v5)
    {
      double v5 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v4];
    }
    [v5 setAlpha:1.0];
    uint64_t v8 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
    uint64_t v9 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    objc_msgSend(v8, "collectionView:imageSizeAtIndex:", v9, objc_msgSend(v4, "item"));
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = [(ICDocCamThumbnailCollectionViewLayout *)self delegate];
    [v14 targetViewRect];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    objc_msgSend(MEMORY[0x263F1C6B0], "dc_aspectFitImageFrameForViewWithFrame:imageSize:", v16, v18, v20, v22, v11, v13);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v31 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    uint64_t v32 = [v31 superview];
    uint64_t v33 = [v32 superview];

    uint64_t v34 = [(ICDocCamThumbnailCollectionViewLayout *)self collectionView];
    objc_msgSend(v33, "convertRect:toView:", v34, v24, v26, v28, v30);
    objc_msgSend(v5, "setFrame:");
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  double v5 = [(ICDocCamThumbnailCollectionViewLayout *)&v11 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  id v6 = [(ICDocCamThumbnailCollectionViewLayout *)self deleteIndexPaths];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    if (!v5)
    {
      double v5 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v4];
    }
    [v5 setAlpha:0.0];
    objc_msgSend(v5, "setCenter:", 0.0, 0.0);
    CATransform3DMakeScale(&v10, 0.1, 0.1, 1.0);
    CATransform3D v9 = v10;
    [v5 setTransform3D:&v9];
  }

  return 0;
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  uint64_t v8 = [(ICDocCamThumbnailCollectionViewLayout *)&v17 initialLayoutAttributesForAppearingDecorationElementOfKind:v6 atIndexPath:v7];
  if ([v6 isEqualToString:@"DecorationIdentifier"])
  {
    if (!v8)
    {
      uint64_t v8 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
    }
    [v8 setAlpha:1.0];
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v16[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v16[5] = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v16[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v16[7] = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v16[0] = *MEMORY[0x263F15740];
    v16[1] = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v16[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v16[3] = v12;
    [v8 setTransform3D:v16];
    [v8 frame];
    double v14 = v13;
    [v8 frame];
    [v8 setFrame:v14];
  }

  return 0;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamThumbnailCollectionViewLayout;
  uint64_t v8 = [(ICDocCamThumbnailCollectionViewLayout *)&v19 finalLayoutAttributesForDisappearingDecorationElementOfKind:v6 atIndexPath:v7];
  long long v9 = [(ICDocCamThumbnailCollectionViewLayout *)self deleteIndexPaths];
  int v10 = [v9 containsObject:v7];

  if (v10 && [v6 isEqualToString:@"DecorationIdentifier"])
  {
    if (!v8)
    {
      uint64_t v8 = [(ICDocCamThumbnailCollectionViewLayout *)self layoutAttributesForDecorationViewOfKind:v6 atIndexPath:v7];
    }
    [v8 setAlpha:0.0];
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v18[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v18[5] = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v18[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v18[7] = v12;
    long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v18[0] = *MEMORY[0x263F15740];
    v18[1] = v13;
    long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v18[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v18[3] = v14;
    [v8 setTransform3D:v18];
    [v8 frame];
    double v16 = v15;
    [v8 frame];
    [v8 setFrame:v16];
  }

  return v8;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (ICDocCamThumbnailViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamThumbnailViewLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)compactLayout
{
  return self->_compactLayout;
}

- (void)setCompactLayout:(BOOL)a3
{
  self->_compactLayout = a3;
}

- (NSDictionary)layoutInfo
{
  return self->_layoutInfo;
}

- (void)setLayoutInfo:(id)a3
{
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_layoutInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end