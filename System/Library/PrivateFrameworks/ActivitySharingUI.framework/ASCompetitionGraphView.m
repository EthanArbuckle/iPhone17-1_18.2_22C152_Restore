@interface ASCompetitionGraphView
+ (id)companionGraph;
+ (id)gizmoGraph;
- (ASCompetition)competition;
- (ASCompetitionGraphView)initWithFrame:(CGRect)a3;
- (BOOL)drawsDailyScoreLabels;
- (BOOL)drawsFutureScoreDots;
- (BOOL)highlightsCurrentDay;
- (BOOL)showsBackgroundDateGuide;
- (BOOL)showsBackgroundScoreGuide;
- (NSString)dateFormat;
- (UIColor)dateColor;
- (UIColor)highlightedDateColor;
- (UIFont)currentDateFont;
- (UIFont)dateFont;
- (double)_firstBarOriginXForDateLabelOriginX:(double)result dateLabelWidth:(double)a4;
- (double)_percentForScoreAtIndex:(unint64_t)a3 scores:(id)a4 maxScore:(unint64_t)a5;
- (double)barWidth;
- (double)bottomPadding;
- (double)dayLabelBaselineOffset;
- (double)horizontalInset;
- (double)lastBaselineY;
- (double)maxBarHeight;
- (double)preferredHeight;
- (double)spaceBetweenBars;
- (id)_allScores;
- (id)_attributesForDateLabelWithDate:(id)a3;
- (int64_t)alignment;
- (unint64_t)_maxDailyScore;
- (unint64_t)_minDailyScore;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAlignment:(int64_t)a3;
- (void)setBarWidth:(double)a3;
- (void)setBottomPadding:(double)a3;
- (void)setCompetition:(id)a3;
- (void)setCurrentDateFont:(id)a3;
- (void)setDateColor:(id)a3;
- (void)setDateFont:(id)a3;
- (void)setDateFormat:(id)a3;
- (void)setDayLabelBaselineOffset:(double)a3;
- (void)setDrawsDailyScoreLabels:(BOOL)a3;
- (void)setDrawsFutureScoreDots:(BOOL)a3;
- (void)setHighlightedDateColor:(id)a3;
- (void)setHighlightsCurrentDay:(BOOL)a3;
- (void)setHorizontalInset:(double)a3;
- (void)setMaxBarHeight:(double)a3;
- (void)setShowsBackgroundDateGuide:(BOOL)a3;
- (void)setShowsBackgroundScoreGuide:(BOOL)a3;
- (void)setSpaceBetweenBars:(double)a3;
@end

@implementation ASCompetitionGraphView

+ (id)companionGraph
{
  v2 = [ASCompetitionGraphView alloc];
  v3 = -[ASCompetitionGraphView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v4 = [MEMORY[0x263F825C8] clearColor];
  [(ASCompetitionGraphView *)v3 setBackgroundColor:v4];

  [(ASCompetitionGraphView *)v3 setAlignment:1];
  [(ASCompetitionGraphView *)v3 setDateFormat:@"EEE"];
  [(ASCompetitionGraphView *)v3 setHorizontalInset:0.0];
  [(ASCompetitionGraphView *)v3 setBarWidth:5.0];
  [(ASCompetitionGraphView *)v3 setSpaceBetweenBars:1.0];
  [(ASCompetitionGraphView *)v3 setMaxBarHeight:76.0];
  [(ASCompetitionGraphView *)v3 setBottomPadding:1.0];
  [(ASCompetitionGraphView *)v3 setHighlightsCurrentDay:0];
  [(ASCompetitionGraphView *)v3 setShowsBackgroundDateGuide:1];
  [(ASCompetitionGraphView *)v3 setShowsBackgroundScoreGuide:1];
  [(ASCompetitionGraphView *)v3 setDrawsDailyScoreLabels:1];
  [(ASCompetitionGraphView *)v3 setDrawsFutureScoreDots:1];
  uint64_t v5 = *MEMORY[0x263F83588];
  v6 = [MEMORY[0x263F81708] defaultFontForTextStyle:*MEMORY[0x263F83588]];
  [(ASCompetitionGraphView *)v3 setCurrentDateFont:v6];

  v7 = [MEMORY[0x263F81708] defaultFontForTextStyle:v5];
  [(ASCompetitionGraphView *)v3 setDateFont:v7];

  v8 = [(ASCompetitionGraphView *)v3 currentDateFont];
  [v8 _scaledValueForValue:13.0];
  -[ASCompetitionGraphView setDayLabelBaselineOffset:](v3, "setDayLabelBaselineOffset:");

  v9 = objc_msgSend(MEMORY[0x263F825C8], "fu_systemTextGreyColor");
  [(ASCompetitionGraphView *)v3 setDateColor:v9];

  return v3;
}

+ (id)gizmoGraph
{
  v2 = [ASCompetitionGraphView alloc];
  v3 = -[ASCompetitionGraphView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(ASCompetitionGraphView *)v3 setAlignment:0];
  [(ASCompetitionGraphView *)v3 setDateFormat:@"EEEEE"];
  [(ASCompetitionGraphView *)v3 setHorizontalInset:0.0];
  [(ASCompetitionGraphView *)v3 setBarWidth:5.0];
  [(ASCompetitionGraphView *)v3 setSpaceBetweenBars:1.0];
  [(ASCompetitionGraphView *)v3 setMaxBarHeight:28.5];
  [(ASCompetitionGraphView *)v3 setDayLabelBaselineOffset:14.0];
  [(ASCompetitionGraphView *)v3 setHighlightsCurrentDay:1];
  v4 = objc_msgSend(MEMORY[0x263F81708], "fu_heavySausageFontOfSize:", 9.5);
  [(ASCompetitionGraphView *)v3 setCurrentDateFont:v4];

  uint64_t v5 = objc_msgSend(MEMORY[0x263F81708], "fu_mediumSausageFontOfSize:", 11.0);
  [(ASCompetitionGraphView *)v3 setDateFont:v5];

  v6 = [MEMORY[0x263F825C8] whiteColor];
  [(ASCompetitionGraphView *)v3 setDateColor:v6];

  v7 = [MEMORY[0x263F825C8] blackColor];
  [(ASCompetitionGraphView *)v3 setHighlightedDateColor:v7];

  [(ASCompetitionGraphView *)v3 setBottomPadding:5.0];
  return v3;
}

- (ASCompetitionGraphView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCompetitionGraphView;
  v3 = -[ASCompetitionGraphView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    [(ASCompetitionGraphView *)v3 setClearsContextBeforeDrawing:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionGraphView;
  [(ASCompetitionGraphView *)&v4 layoutSubviews];
  v3 = [(ASCompetitionGraphView *)self layer];
  [v3 setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v151 = *MEMORY[0x263EF8340];
  v8 = [(ASCompetition *)self->_competition durationDateComponents];
  unint64_t v9 = [v8 day];

  if ([(ASCompetition *)self->_competition isDailyScoreCapped])
  {
    uint64_t v134 = [(ASCompetition *)self->_competition maximumNumberOfPointsPerDay];
  }
  else
  {
    unint64_t v10 = [(ASCompetitionGraphView *)self _maxDailyScore];
    uint64_t v11 = 100;
    if (v10 > 0x64) {
      uint64_t v11 = v10;
    }
    uint64_t v134 = v11;
  }
  double barWidth = self->_barWidth;
  double v13 = 0.5;
  [(ASCompetitionGraphView *)self bounds];
  double v14 = CGRectGetWidth(v154) + self->_horizontalInset * -2.0;
  Mutable = CGPathCreateMutable();
  v128 = CGPathCreateMutable();
  path = CGPathCreateMutable();
  v136 = CGPathCreateMutable();
  v127 = CGPathCreateMutable();
  v124 = CGPathCreateMutable();
  v135 = CGPathCreateMutable();
  v123 = objc_msgSend(MEMORY[0x263F825C8], "as_competitionGraphBackgroundGold");
  v139 = objc_msgSend(MEMORY[0x263F825C8], "as_colorForParticipant:competition:", 0, self->_competition);
  v122 = [v139 colorWithAlphaComponent:0.5];
  v137 = objc_msgSend(MEMORY[0x263F825C8], "as_colorForParticipant:competition:", 1, self->_competition);
  v121 = [v137 colorWithAlphaComponent:0.5];
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v155.origin.CGFloat x = x;
  v155.origin.CGFloat y = y;
  v155.size.CGFloat width = width;
  v155.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v155);
  CGContextSetLineWidth(CurrentContext, self->_barWidth);
  c = CurrentContext;
  CGContextSetLineCap(CurrentContext, kCGLineCapButt);
  uint64_t v17 = [(ASCompetition *)self->_competition startDate];
  v18 = (void *)v17;
  double v120 = v14;
  if (v9)
  {
    uint64_t v19 = 0;
    double v20 = v14 / (double)v9;
    uint64_t v129 = *MEMORY[0x263F814F0];
    uint64_t v130 = *MEMORY[0x263F81500];
    v21 = (void *)v17;
    unint64_t v133 = v9;
    double v131 = v20;
    double v132 = barWidth * 0.5;
    do
    {
      v22 = [MEMORY[0x263EFF910] date];
      int v142 = objc_msgSend(v21, "hk_isAfterDate:", v22);

      double horizontalInset = self->_horizontalInset;
      uint64_t v24 = [(ASCompetitionGraphView *)self _attributesForDateLabelWithDate:v21];
      v143 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v21];
      [v143 sizeWithAttributes:v24];
      double v26 = v25;
      double v28 = v27;
      double v29 = (v20 - v25) * v13;
      if (self->_alignment) {
        double v30 = -0.0;
      }
      else {
        double v30 = v29;
      }
      if (self->_highlightsCurrentDay)
      {
        v31 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
        int v32 = [v31 isDateInToday:v21];

        v33 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
        if (v32) {
          v33 = &OBJC_IVAR___ASCompetitionGraphView__currentDateFont;
        }
      }
      else
      {
        int v32 = 0;
        v33 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
      }
      double v34 = horizontalInset + (double)v19 * v20 + v30;
      id v35 = *(id *)((char *)&self->super.super.super.isa + *v33);
      double maxBarHeight = self->_maxBarHeight;
      if (self->_showsBackgroundScoreGuide) {
        double maxBarHeight = maxBarHeight + 5.0;
      }
      double v37 = maxBarHeight + self->_dayLabelBaselineOffset;
      v140 = v35;
      [v35 ascender];
      double v39 = v37 - v38;
      v141 = (void *)v24;
      if (v32)
      {
        id v40 = v139;
        id v41 = v137;
        v156.origin.CGFloat x = v34;
        v156.origin.CGFloat y = v39;
        v156.size.CGFloat width = v26;
        v156.size.CGFloat height = v28;
        CGFloat v42 = CGRectGetMidX(v156) + -6.5;
        v157.origin.CGFloat x = v34;
        v157.origin.CGFloat y = v39;
        v157.size.CGFloat width = v26;
        v157.size.CGFloat height = v28;
        double v138 = v39;
        CGFloat v43 = CGRectGetMidY(v157) + -6.5;
        id v44 = v40;
        uint64_t v45 = [v44 CGColor];

        uint64_t v149 = v45;
        id v46 = v41;
        uint64_t v47 = [v46 CGColor];

        uint64_t v150 = v47;
        CFArrayRef v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v149 count:2];
        v49 = CGGradientCreateWithColors(0, v48, 0);

        uint64_t v24 = (uint64_t)v141;
        CGContextSaveGState(c);
        v158.size.CGFloat width = 13.0;
        v158.size.CGFloat height = 13.0;
        v158.origin.CGFloat x = v42;
        v158.origin.CGFloat y = v43;
        CGContextAddEllipseInRect(c, v158);
        CGContextClip(c);
        v159.size.CGFloat width = 13.0;
        v159.size.CGFloat height = 13.0;
        v159.origin.CGFloat x = v42;
        v159.origin.CGFloat y = v43;
        CGFloat MinX = CGRectGetMinX(v159);
        v160.size.CGFloat width = 13.0;
        v160.size.CGFloat height = 13.0;
        v160.origin.CGFloat x = v42;
        v160.origin.CGFloat y = v43;
        CGFloat MidY = CGRectGetMidY(v160);
        v161.size.CGFloat width = 13.0;
        v161.size.CGFloat height = 13.0;
        v161.origin.CGFloat x = v42;
        v161.origin.CGFloat y = v43;
        CGFloat MaxX = CGRectGetMaxX(v161);
        v162.size.CGFloat width = 13.0;
        v162.size.CGFloat height = 13.0;
        v162.origin.CGFloat x = v42;
        v162.origin.CGFloat y = v43;
        double v39 = v138;
        v153.CGFloat y = CGRectGetMidY(v162);
        v152.CGFloat x = MinX;
        double v13 = 0.5;
        v152.CGFloat y = MidY;
        v153.CGFloat x = MaxX;
        CGContextDrawLinearGradient(c, v49, v152, v153, 0);
        CGGradientRelease(v49);
        CGContextRestoreGState(c);
      }
      objc_msgSend(v143, "drawInRect:withAttributes:", v24, v34, v39, v26, v28);
      if (self->_drawsDailyScoreLabels)
      {
        uint64_t v53 = [(ASCompetition *)self->_competition dailyScoreForParticipant:0 onDate:v21];
        uint64_t v54 = [(ASCompetition *)self->_competition dailyScoreForParticipant:1 onDate:v21];
        if (v142)
        {
          v55 = ActivitySharingBundle();
          v56 = [v55 localizedStringForKey:@"COMPETITION_FUTURE_EMPTY_POINTS" value:&stru_26E8035F0 table:@"Localizable"];

          v57 = ActivitySharingBundle();
          v58 = [v57 localizedStringForKey:@"COMPETITION_FUTURE_EMPTY_POINTS" value:&stru_26E8035F0 table:@"Localizable"];
        }
        else
        {
          uint64_t v59 = v54;
          v56 = ASCompetitionZeroPaddedScoreString(v53);
          v58 = ASCompetitionZeroPaddedScoreString(v59);
        }
        v146[0] = v130;
        v146[1] = v129;
        dateFont = self->_dateFont;
        v147[0] = v139;
        v147[1] = dateFont;
        v61 = [NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];
        v144[0] = v130;
        v144[1] = v129;
        v62 = self->_dateFont;
        v145[0] = v137;
        v145[1] = v62;
        v63 = [NSDictionary dictionaryWithObjects:v145 forKeys:v144 count:2];
        [v56 sizeWithAttributes:v61];
        double v65 = v64;
        double v67 = v66;
        [v58 sizeWithAttributes:v63];
        double v69 = v68;
        double v71 = v70;
        [(UIFont *)self->_dateFont _scaledValueForValue:13.0];
        double v73 = v39 + v72;
        [(UIFont *)self->_dateFont _scaledValueForValue:13.0];
        objc_msgSend(v56, "drawInRect:withAttributes:", v61, v34, v73 + v74, v65, v67);
        objc_msgSend(v58, "drawInRect:withAttributes:", v63, v34, v73, v69, v71);
      }
      [(ASCompetitionGraphView *)self _firstBarOriginXForDateLabelOriginX:v34 dateLabelWidth:v26];
      CGFloat v76 = v75;
      if (self->_showsBackgroundScoreGuide) {
        double v77 = 2.5;
      }
      else {
        double v77 = 0.0;
      }
      double v78 = self->_maxBarHeight + v77;
      double v79 = v75 + self->_barWidth + self->_spaceBetweenBars;
      v80 = [(ASCompetition *)self->_competition opponentScores];
      [(ASCompetitionGraphView *)self _percentForScoreAtIndex:v19 scores:v80 maxScore:v134];
      double v82 = v81;

      v83 = [(ASCompetition *)self->_competition scores];
      [(ASCompetitionGraphView *)self _percentForScoreAtIndex:v19 scores:v83 maxScore:v134];
      double v85 = v84;

      float v86 = v82 * self->_maxBarHeight;
      float v87 = self->_barWidth;
      *(float *)&double v82 = fmaxf(v86, v87);
      [(ASCompetitionGraphView *)self maxBarHeight];
      *(float *)&double v88 = v88;
      double v89 = fminf(*(float *)&v82, *(float *)&v88);
      *(float *)&double v88 = v85 * self->_maxBarHeight;
      float v90 = self->_barWidth;
      *(float *)&double v82 = fmaxf(*(float *)&v88, v90);
      [(ASCompetitionGraphView *)self maxBarHeight];
      *(float *)&double v91 = v91;
      double v92 = fminf(*(float *)&v82, *(float *)&v91);
      double v93 = v78 - v89;
      double v94 = v78 - v92;
      double v95 = self->_barWidth;
      if (v142)
      {
        unint64_t v96 = v133;
        if (self->_drawsFutureScoreDots)
        {
          double v97 = v79;
          double v98 = self->_barWidth;
          CGPathAddRoundedRect(path, 0, *(CGRect *)(&v94 - 1), v132, v132);
          v163.origin.CGFloat x = v76;
          v163.origin.CGFloat y = v93;
          v163.size.CGFloat width = v95;
          CGFloat v99 = v132;
          v163.size.CGFloat height = v89;
          CGPathAddRoundedRect(v124, 0, v163, v99, v99);
        }
        else
        {
          CGFloat v99 = v132;
        }
      }
      else
      {
        double v100 = v79;
        double v101 = self->_barWidth;
        CGPathAddRoundedRect(v128, 0, *(CGRect *)(&v94 - 1), v132, v132);
        v164.origin.CGFloat x = v76;
        v164.origin.CGFloat y = v93;
        v164.size.CGFloat width = v95;
        CGFloat v99 = v132;
        v164.size.CGFloat height = v89;
        CGPathAddRoundedRect(v127, 0, v164, v99, v99);
        unint64_t v96 = v133;
      }
      double v20 = v131;
      double v102 = self->_barWidth;
      double v103 = self->_maxBarHeight;
      v165.origin.CGFloat x = v79;
      v165.origin.CGFloat y = v77;
      v165.size.CGFloat width = v102;
      v165.size.CGFloat height = v103;
      CGPathAddRoundedRect(v136, 0, v165, v99, v99);
      v166.origin.CGFloat x = v76;
      v166.origin.CGFloat y = v77;
      v166.size.CGFloat width = v102;
      v166.size.CGFloat height = v103;
      CGPathAddRoundedRect(v135, 0, v166, v99, v99);
      v104 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
      v18 = [v104 dateByAddingUnit:16 value:1 toDate:v21 options:0];

      ++v19;
      v21 = v18;
    }
    while (v96 != v19);
  }
  if (self->_showsBackgroundScoreGuide)
  {
    [(ASCompetitionGraphView *)self maxBarHeight];
    uint64_t v105 = 0;
    double v107 = 0.0;
    double v108 = (v106 + 3.5) / 3.0;
    do
    {
      if (v120 > 0.0)
      {
        double v109 = 0.0;
        do
        {
          v167.size.CGFloat width = 1.5;
          v167.size.CGFloat height = 1.5;
          v167.origin.CGFloat x = v109;
          v167.origin.CGFloat y = v107;
          CGPathAddEllipseInRect(Mutable, 0, v167);
          double v109 = v109 + 3.5;
        }
        while (v109 < v120);
      }
      double v107 = v108 + v107;
      ++v105;
    }
    while (v105 != 4);
    [(ASCompetitionGraphView *)self maxBarHeight];
    v110 = (void *)MEMORY[0x263F81708];
    id v111 = v123;
    v112 = objc_msgSend(v110, "fu_sausageFontOfSize:", 13.0);
    v113 = ASCompetitionZeroPaddedScoreString(v134);
    id v114 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v115 = *MEMORY[0x263F81500];
    v148[0] = *MEMORY[0x263F814F0];
    v148[1] = v115;
    uint64_t v149 = (uint64_t)v112;
    uint64_t v150 = (uint64_t)v111;
    v116 = [NSDictionary dictionaryWithObjects:&v149 forKeys:v148 count:2];

    v117 = (void *)[v114 initWithString:v113 attributes:v116];
    [v117 size];
    objc_msgSend(v117, "drawInRect:", v120 - v118 + -1.0, 0.0, v118, v119);
  }
  _DrawPathWithColor(c, Mutable, v123);
  _DrawPathWithColor(c, v136, v123);
  _DrawPathWithColor(c, v135, v123);
  _DrawPathWithColor(c, v128, v139);
  _DrawPathWithColor(c, path, v122);
  _DrawPathWithColor(c, v127, v137);
  _DrawPathWithColor(c, v124, v121);
  CGPathRelease(Mutable);
  CGPathRelease(v128);
  CGPathRelease(v127);
  CGPathRelease(path);
  CGPathRelease(v124);
  CGPathRelease(v136);
  CGPathRelease(v135);
  UIGraphicsPopContext();
}

- (void)setCompetition:(id)a3
{
  objc_storeStrong((id *)&self->_competition, a3);
  [(ASCompetitionGraphView *)self setNeedsLayout];
}

- (void)setDateFormat:(id)a3
{
  [(NSDateFormatter *)self->_dateFormatter setDateFormat:a3];
  [(ASCompetitionGraphView *)self setNeedsLayout];
}

- (NSString)dateFormat
{
  return [(NSDateFormatter *)self->_dateFormatter dateFormat];
}

- (double)preferredHeight
{
  [(ASCompetitionGraphView *)self lastBaselineY];
  return v3 + self->_bottomPadding;
}

- (double)lastBaselineY
{
  double v3 = 0.0;
  double v4 = 0.0;
  if ([(ASCompetitionGraphView *)self drawsDailyScoreLabels])
  {
    [(UIFont *)self->_dateFont _scaledValueForValue:13.0];
    double v4 = v5 + v5;
  }
  if ([(ASCompetitionGraphView *)self showsBackgroundScoreGuide]) {
    double v3 = 5.0;
  }
  double maxBarHeight = self->_maxBarHeight;
  [(UIFont *)self->_dateFont _scaledValueForValue:self->_dayLabelBaselineOffset];
  return v3 + v4 + maxBarHeight + v7;
}

- (id)_attributesForDateLabelWithDate:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = &OBJC_IVAR___ASCompetitionGraphView__dateFont;
  v6 = &OBJC_IVAR___ASCompetitionGraphView__dateColor;
  if (self->_highlightsCurrentDay)
  {
    double v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    int v8 = [v7 isDateInToday:v4];

    if (v8)
    {
      v6 = &OBJC_IVAR___ASCompetitionGraphView__highlightedDateColor;
      double v5 = &OBJC_IVAR___ASCompetitionGraphView__currentDateFont;
    }
  }
  id v9 = *(id *)((char *)&self->super.super.super.isa + *v6);
  unint64_t v10 = *(Class *)((char *)&self->super.super.super.isa + *v5);
  uint64_t v11 = *MEMORY[0x263F814F0];
  v16[0] = *MEMORY[0x263F81500];
  v16[1] = v11;
  v17[0] = v9;
  v17[1] = v10;
  v12 = NSDictionary;
  id v13 = v10;
  double v14 = [v12 dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v14;
}

- (double)_firstBarOriginXForDateLabelOriginX:(double)result dateLabelWidth:(double)a4
{
  if (!self->_alignment) {
    result = a4 * 0.5 + result - self->_barWidth - self->_spaceBetweenBars * 0.5;
  }
  if (self->_showsBackgroundDateGuide) {
    return result + 1.0 + 1.0;
  }
  return result;
}

- (unint64_t)_maxDailyScore
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [(ASCompetitionGraphView *)self _allScores];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedIntegerValue];
        if (v5 <= v8) {
          unint64_t v5 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_minDailyScore
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(ASCompetitionGraphView *)self _allScores];
  if ([v2 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      unint64_t v7 = -1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntegerValue", (void)v11);
          if (v7 >= v9) {
            unint64_t v7 = v9;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v7 = -1;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_allScores
{
  id v3 = [(ASCompetition *)self->_competition scores];
  uint64_t v4 = [(ASCompetition *)self->_competition opponentScores];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (double)_percentForScoreAtIndex:(unint64_t)a3 scores:(id)a4 maxScore:(unint64_t)a5
{
  id v7 = a4;
  double v8 = 0.0;
  if ([v7 count] > a3)
  {
    unint64_t v9 = [v7 objectAtIndexedSubscript:a3];
    unint64_t v10 = [v9 unsignedIntegerValue];

    if (v10) {
      double v8 = (double)v10 / (double)a5;
    }
  }

  return v8;
}

- (ASCompetition)competition
{
  return self->_competition;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (double)horizontalInset
{
  return self->_horizontalInset;
}

- (void)setHorizontalInset:(double)a3
{
  self->_double horizontalInset = a3;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (void)setBarWidth:(double)a3
{
  self->_double barWidth = a3;
}

- (double)spaceBetweenBars
{
  return self->_spaceBetweenBars;
}

- (void)setSpaceBetweenBars:(double)a3
{
  self->_spaceBetweenBars = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (double)dayLabelBaselineOffset
{
  return self->_dayLabelBaselineOffset;
}

- (void)setDayLabelBaselineOffset:(double)a3
{
  self->_dayLabelBaselineOffset = a3;
}

- (double)maxBarHeight
{
  return self->_maxBarHeight;
}

- (void)setMaxBarHeight:(double)a3
{
  self->_double maxBarHeight = a3;
}

- (UIFont)currentDateFont
{
  return self->_currentDateFont;
}

- (void)setCurrentDateFont:(id)a3
{
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (void)setDateFont:(id)a3
{
}

- (UIColor)dateColor
{
  return self->_dateColor;
}

- (void)setDateColor:(id)a3
{
}

- (UIColor)highlightedDateColor
{
  return self->_highlightedDateColor;
}

- (void)setHighlightedDateColor:(id)a3
{
}

- (BOOL)highlightsCurrentDay
{
  return self->_highlightsCurrentDay;
}

- (void)setHighlightsCurrentDay:(BOOL)a3
{
  self->_highlightsCurrentDaCGFloat y = a3;
}

- (BOOL)showsBackgroundDateGuide
{
  return self->_showsBackgroundDateGuide;
}

- (void)setShowsBackgroundDateGuide:(BOOL)a3
{
  self->_showsBackgroundDateGuide = a3;
}

- (BOOL)showsBackgroundScoreGuide
{
  return self->_showsBackgroundScoreGuide;
}

- (void)setShowsBackgroundScoreGuide:(BOOL)a3
{
  self->_showsBackgroundScoreGuide = a3;
}

- (BOOL)drawsDailyScoreLabels
{
  return self->_drawsDailyScoreLabels;
}

- (void)setDrawsDailyScoreLabels:(BOOL)a3
{
  self->_drawsDailyScoreLabels = a3;
}

- (BOOL)drawsFutureScoreDots
{
  return self->_drawsFutureScoreDots;
}

- (void)setDrawsFutureScoreDots:(BOOL)a3
{
  self->_drawsFutureScoreDots = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedDateColor, 0);
  objc_storeStrong((id *)&self->_dateColor, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_currentDateFont, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_competition, 0);
}

@end