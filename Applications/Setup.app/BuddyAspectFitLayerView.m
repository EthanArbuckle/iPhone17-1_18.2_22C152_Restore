@interface BuddyAspectFitLayerView
- (CALayer)managedLayer;
- (CGRect)originalManagerLayerBounds;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setManagedLayer:(id)a3;
- (void)setOriginalManagerLayerBounds:(CGRect)a3;
@end

@implementation BuddyAspectFitLayerView

- (void)setFrame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyAspectFitLayerView;
  -[BuddyAspectFitLayerView setFrame:](&v3, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BuddyAspectFitLayerView *)v5 setNeedsLayout];
}

- (void)setBounds:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyAspectFitLayerView;
  -[BuddyAspectFitLayerView setBounds:](&v3, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BuddyAspectFitLayerView *)v5 setNeedsLayout];
}

- (void)setManagedLayer:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_managedLayer, location[0]);
  [location[0] bounds];
  -[BuddyAspectFitLayerView setOriginalManagerLayerBounds:](v12, "setOriginalManagerLayerBounds:", v3, v4, v5, v6);
  char v9 = 0;
  if (location[0])
  {
    id v13 = location[0];
    v7 = +[NSArray arrayWithObjects:&v13 count:1];
    v10 = v7;
    char v9 = 1;
  }
  else
  {
    v7 = 0;
  }
  id v8 = [(BuddyAspectFitLayerView *)v12 layer];
  [v8 setSublayers:v7];

  if (v9) {
  [(BuddyAspectFitLayerView *)v12 setNeedsLayout];
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  v145 = self;
  SEL v144 = a2;
  v143.receiver = self;
  v143.super_class = (Class)BuddyAspectFitLayerView;
  [(BuddyAspectFitLayerView *)&v143 layoutSubviews];
  v2 = [(BuddyAspectFitLayerView *)v145 managedLayer];

  if (v2)
  {
    double v3 = [(BuddyAspectFitLayerView *)v145 managedLayer];
    [(CALayer *)v3 bounds];
    uint64_t v139 = v4;
    uint64_t v138 = v5;
    uint64_t v141 = v6;
    double v140 = v7;
    double v8 = v7;
    char v9 = [(BuddyAspectFitLayerView *)v145 managedLayer];
    [(CALayer *)v9 bounds];
    uint64_t v135 = v10;
    uint64_t v134 = v11;
    double v137 = v12;
    uint64_t v136 = v13;
    double v14 = v8 / v12;

    double v142 = v14;
    [(BuddyAspectFitLayerView *)v145 frame];
    uint64_t v130 = v15;
    uint64_t v129 = v16;
    uint64_t v132 = v17;
    double v131 = v18;
    double v19 = v18;
    [(BuddyAspectFitLayerView *)v145 frame];
    uint64_t v126 = v20;
    uint64_t v125 = v21;
    double v128 = v22;
    uint64_t v127 = v23;
    double v133 = v19 / v22;
    double v124 = 0.0;
    double v123 = 0.0;
    if (v142 <= v19 / v22)
    {
      [(BuddyAspectFitLayerView *)v145 frame];
      uint64_t v104 = v44;
      uint64_t v103 = v45;
      double v106 = v46;
      uint64_t v105 = v47;
      double v124 = v46;
      v48 = [(BuddyAspectFitLayerView *)v145 managedLayer];
      [(CALayer *)v48 bounds];
      uint64_t v100 = v49;
      uint64_t v99 = v50;
      uint64_t v102 = v51;
      double v101 = v52;
      double v53 = v52;
      [(BuddyAspectFitLayerView *)v145 frame];
      uint64_t v96 = v54;
      uint64_t v95 = v55;
      double v98 = v56;
      uint64_t v97 = v57;
      double v58 = v53 * v56;
      v59 = [(BuddyAspectFitLayerView *)v145 managedLayer];
      [(CALayer *)v59 bounds];
      uint64_t v92 = v60;
      uint64_t v91 = v61;
      double v94 = v62;
      uint64_t v93 = v63;
      double v123 = v58 / v62;
    }
    else
    {
      v24 = [(BuddyAspectFitLayerView *)v145 managedLayer];
      [(CALayer *)v24 bounds];
      uint64_t v120 = v25;
      uint64_t v119 = v26;
      double v122 = v27;
      uint64_t v121 = v28;
      double v29 = v27;
      [(BuddyAspectFitLayerView *)v145 frame];
      uint64_t v116 = v30;
      uint64_t v115 = v31;
      uint64_t v118 = v32;
      double v117 = v33;
      double v34 = v29 * v33;
      v35 = [(BuddyAspectFitLayerView *)v145 managedLayer];
      [(CALayer *)v35 bounds];
      uint64_t v112 = v36;
      uint64_t v111 = v37;
      uint64_t v114 = v38;
      double v113 = v39;
      double v124 = v34 / v39;

      [(BuddyAspectFitLayerView *)v145 frame];
      uint64_t v108 = v40;
      uint64_t v107 = v41;
      uint64_t v110 = v42;
      double v109 = v43;
      double v123 = v43;
    }
    [(BuddyAspectFitLayerView *)v145 bounds];
    CGRect rect = v146;
    CGRectGetMidX(v146);
    [(BuddyAspectFitLayerView *)v145 bounds];
    CGRect v88 = v147;
    CGRectGetMidY(v147);
    sub_1001BF540();
    *(void *)&long long v90 = v64;
    *((void *)&v90 + 1) = v65;
    v66 = [(BuddyAspectFitLayerView *)v145 managedLayer];
    long long v87 = v90;
    [(CALayer *)v66 setPosition:v90];

    [(BuddyAspectFitLayerView *)v145 originalManagerLayerBounds];
    uint64_t v83 = v67;
    uint64_t v82 = v68;
    uint64_t v85 = v69;
    double v84 = v70;
    CGFloat v71 = v123 / v70;
    [(BuddyAspectFitLayerView *)v145 originalManagerLayerBounds];
    uint64_t v79 = v72;
    uint64_t v78 = v73;
    double v81 = v74;
    uint64_t v80 = v75;
    CATransform3DMakeScale(&__src, v71, v124 / v74, 1.0);
    v76 = [(BuddyAspectFitLayerView *)v145 managedLayer];
    memcpy(v77, &__src, sizeof(v77));
    [(CALayer *)v76 setTransform:v77];
  }
}

- (CALayer)managedLayer
{
  return self->_managedLayer;
}

- (CGRect)originalManagerLayerBounds
{
  double y = self->_originalManagerLayerBounds.origin.y;
  double x = self->_originalManagerLayerBounds.origin.x;
  double height = self->_originalManagerLayerBounds.size.height;
  double width = self->_originalManagerLayerBounds.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalManagerLayerBounds:(CGRect)a3
{
  self->_originalManagerLayerBounds = a3;
}

- (void).cxx_destruct
{
}

@end