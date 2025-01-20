@interface FUDatePicker
- (BOOL)scrollWheelShouldBecomeFirstResponder:(id)a3;
- (FUDatePicker)initWithFrame:(CGRect)a3;
- (FUDatePicker)initWithFrame:(CGRect)a3 tintColor:(id)a4 initialWheelType:(int64_t)a5 shouldEnableCrown:(BOOL)a6 minimumDate:(id)a7 maximumDate:(id)a8;
- (FUDatePickerDelegate)delegate;
- (FUScrollWheel)dayWheel;
- (FUScrollWheel)monthWheel;
- (FUScrollWheel)yearWheel;
- (NSDate)date;
- (id)_enumerateDayValues;
- (id)_enumerateDayValuesFromFormatter:(id)a3;
- (id)_wheelOfType:(int64_t)a3;
- (id)dateWheel;
- (id)scrollWheel:(id)a3 titleForItemAtIndex:(unint64_t)a4;
- (unint64_t)numberOfRowsInScrollWheel:(id)a3;
- (void)_updateDayRangeReloadingWheel:(BOOL)a3;
- (void)_updateSpinnersAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)scrollWheel:(id)a3 didChangeCurrentIndexTo:(unint64_t)a4;
- (void)setDate:(id)a3;
- (void)setDate:(id)a3 animated:(BOOL)a4;
- (void)setDayWheel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMonthWheel:(id)a3;
- (void)setYearWheel:(id)a3;
- (void)tappedScrollWheel:(id)a3;
@end

@implementation FUDatePicker

- (FUDatePicker)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [MEMORY[0x263F825C8] systemGreenColor];
  v9 = -[FUDatePicker initWithFrame:tintColor:initialWheelType:shouldEnableCrown:minimumDate:maximumDate:](self, "initWithFrame:tintColor:initialWheelType:shouldEnableCrown:minimumDate:maximumDate:", v8, 2, 0, 0, 0, x, y, width, height);

  return v9;
}

- (FUDatePicker)initWithFrame:(CGRect)a3 tintColor:(id)a4 initialWheelType:(int64_t)a5 shouldEnableCrown:(BOOL)a6 minimumDate:(id)a7 maximumDate:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v149.receiver = self;
  v149.super_class = (Class)FUDatePicker;
  v20 = -[FUDatePicker initWithFrame:](&v149, sel_initWithFrame_, x, y, width, height);
  v21 = v20;
  if (v20)
  {
    id v142 = v19;
    id v143 = v18;
    id v145 = v17;
    objc_storeStrong((id *)&v20->_tintColor, a4);
    v21->_initialWheelType = a5;
    objc_storeStrong((id *)&v21->_minimumDate, a7);
    objc_storeStrong((id *)&v21->_maximumDate, a8);
    char v22 = 1;
    v21->_firstResponderShouldChange = 1;
    v23 = [MEMORY[0x263EFF8F0] currentCalendar];
    v24 = [MEMORY[0x263EFF960] currentLocale];
    v25 = [v24 localeIdentifier];

    v26 = [MEMORY[0x263EFF910] date];
    uint64_t v27 = [v23 dateByAddingUnit:4 value:-30 toDate:v26 options:0];
    date = v21->_date;
    v21->_date = (NSDate *)v27;

    v21->_monthOffset = 1;
    v21->_dayOffset = 1;
    v21->_numRowsMonth = 12;
    v21->_numRowsDate = 31;
    v21->_numRowsYear = 150;
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v21->_dateFormatter;
    v21->_dateFormatter = v29;

    [(NSDateFormatter *)v21->_dateFormatter setDateFormat:@"y"];
    v144 = v25;
    if (([v25 isEqualToString:@"ja_JP_TRADITIONAL"] & 1) == 0) {
      char v22 = [v25 containsString:@"calendar=japanese"];
    }
    v21->_displayEra = v22;
    v31 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v32 = *MEMORY[0x263EFF508];
    v33 = [v31 objectForKey:*MEMORY[0x263EFF508]];
    int v34 = [v33 isEqualToString:@"ja"];

    if (v34)
    {
      uint64_t v35 = [(NSDateFormatter *)v21->_dateFormatter veryShortMonthSymbols];
      monthNames = v21->_monthNames;
      v21->_monthNames = (NSArray *)v35;

      uint64_t v37 = [(FUDatePicker *)v21 _enumerateDayValues];
      dayValues = v21->_dayValues;
      v21->_dayValues = (NSArray *)v37;
    }
    else
    {
      v39 = [MEMORY[0x263EFF960] currentLocale];
      v40 = [v39 objectForKey:v32];
      int v41 = [v40 isEqualToString:@"fi"];

      v42 = v21->_dateFormatter;
      if (v41) {
        [(NSDateFormatter *)v42 shortStandaloneMonthSymbols];
      }
      else {
      uint64_t v43 = [(NSDateFormatter *)v42 shortMonthSymbols];
      }
      v44 = v21->_monthNames;
      v21->_monthNames = (NSArray *)v43;

      dayValues = (NSArray *)objc_alloc_init(MEMORY[0x263F08790]);
      v45 = (void *)MEMORY[0x263F08790];
      v46 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v144];
      v47 = [v45 dateFormatFromTemplate:@"d" options:0 locale:v46];
      [(NSArray *)dayValues setDateFormat:v47];

      uint64_t v48 = [(FUDatePicker *)v21 _enumerateDayValuesFromFormatter:dayValues];
      v49 = v21->_dayValues;
      v21->_dayValues = (NSArray *)v48;
    }
    uint64_t v50 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v21->_numRowsYear];
    yearsWithNames = v21->_yearsWithNames;
    v21->_yearsWithNames = (NSMutableArray *)v50;

    v52 = [MEMORY[0x263EFF910] date];
    uint64_t v53 = [v23 dateByAddingUnit:4 value:-150 toDate:v52 options:0];

    v141 = (void *)v53;
    v54 = [v23 components:6 fromDate:v53];
    uint64_t v55 = 150;
    do
    {
      objc_msgSend(v54, "setYear:", objc_msgSend(v54, "year") + 1);
      v56 = v21->_yearsWithNames;
      v57 = [v23 dateFromComponents:v54];
      [(NSMutableArray *)v56 addObject:v57];

      --v55;
    }
    while (v55);
    v148[0] = 0;
    v148[1] = 0;
    v147[0] = 0;
    v147[1] = 0;
    v146[0] = 0;
    v146[1] = 0;
    v58 = [MEMORY[0x263EFF960] currentLocale];
    id v59 = GetFormatAndDateFieldRangesFor_yMMMMd(v58, v148, v147, v146);

    unint64_t v60 = v147[0];
    unint64_t v61 = v148[0];
    unint64_t v62 = v146[0];
    if (v147[0] < (unint64_t)v146[0] || v147[0] < (unint64_t)v148[0]) {
      uint64_t v64 = 1;
    }
    else {
      uint64_t v64 = 2;
    }
    if (v147[0] < (unint64_t)v148[0] && v147[0] < (unint64_t)v146[0]) {
      int64_t v65 = 0;
    }
    else {
      int64_t v65 = v64;
    }
    v21->_int64_t monthOrder = v65;
    if (v61 < v62 || v61 < v60) {
      uint64_t v67 = 1;
    }
    else {
      uint64_t v67 = 2;
    }
    if (v61 < v60 && v61 < v62) {
      int64_t v68 = 0;
    }
    else {
      int64_t v68 = v67;
    }
    v21->_int64_t yearOrder = v68;
    BOOL v69 = v62 < v61;
    BOOL v70 = v62 >= v60;
    BOOL v71 = v62 < v60;
    if (!v70 || v69) {
      uint64_t v73 = 1;
    }
    else {
      uint64_t v73 = 2;
    }
    if (v69 && v71) {
      int64_t v74 = 0;
    }
    else {
      int64_t v74 = v73;
    }
    v21->_int64_t dayOrder = v74;
    if (objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[FUDatePicker semanticContentAttribute](v21, "semanticContentAttribute")) == 1)
    {
      int64_t monthOrder = v21->_monthOrder;
      if (monthOrder == 1) {
        uint64_t v76 = 1;
      }
      else {
        uint64_t v76 = 2 * (monthOrder == 0);
      }
      v21->_int64_t monthOrder = v76;
      int64_t yearOrder = v21->_yearOrder;
      if (yearOrder == 1) {
        uint64_t v78 = 1;
      }
      else {
        uint64_t v78 = 2 * (yearOrder == 0);
      }
      v21->_int64_t yearOrder = v78;
      int64_t dayOrder = v21->_dayOrder;
      if (dayOrder == 1) {
        uint64_t v80 = 1;
      }
      else {
        uint64_t v80 = 2 * (dayOrder == 0);
      }
      v21->_int64_t dayOrder = v80;
    }
    v81 = [MEMORY[0x263F82B60] mainScreen];
    [v81 scale];
    double v83 = v82;

    v84 = objc_alloc_init(FUScrollWheel);
    monthWheel = v21->_monthWheel;
    v21->_monthWheel = v84;

    [(FUScrollWheel *)v21->_monthWheel setDataSource:v21];
    [(FUScrollWheel *)v21->_monthWheel setDelegate:v21];
    [(FUScrollWheel *)v21->_monthWheel setItemTitleAligmnent:1];
    v86 = [(FUScrollWheel *)v21->_monthWheel layer];
    double v87 = 12.0 / v83;
    [v86 setCornerRadius:12.0 / v83];

    v88 = [(FUScrollWheel *)v21->_monthWheel layer];
    id v89 = v17;
    objc_msgSend(v88, "setBorderColor:", objc_msgSend(v89, "CGColor"));

    v90 = [(FUScrollWheel *)v21->_monthWheel layer];
    [v90 setBorderWidth:1.0];

    v91 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    monthLabel = v21->_monthLabel;
    v21->_monthLabel = v91;

    v93 = v21->_monthLabel;
    v94 = FUBundle();
    v95 = [v94 localizedStringForKey:@"MONTH" value:&stru_26CF5F1B8 table:@"Localizable"];
    [(UILabel *)v93 setText:v95];

    [(UILabel *)v21->_monthLabel setTextAlignment:1];
    v96 = v21->_monthLabel;
    double v97 = *MEMORY[0x263F81800];
    v98 = [MEMORY[0x263F81708] systemFontOfSize:10.0 weight:*MEMORY[0x263F81800]];
    [(UILabel *)v96 setFont:v98];

    v99 = [(UILabel *)v21->_monthLabel layer];
    id v100 = v89;
    objc_msgSend(v99, "setBackgroundColor:", objc_msgSend(v100, "CGColor"));

    v101 = [(UILabel *)v21->_monthLabel layer];
    [v101 setCornerRadius:3.0];

    v102 = v21->_monthLabel;
    v103 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v102 setTextColor:v103];

    [(FUDatePicker *)v21 addSubview:v21->_monthLabel];
    [(FUDatePicker *)v21 addSubview:v21->_monthWheel];
    v104 = objc_alloc_init(FUScrollWheel);
    dayWheel = v21->_dayWheel;
    v21->_dayWheel = v104;

    [(FUScrollWheel *)v21->_dayWheel setDataSource:v21];
    [(FUScrollWheel *)v21->_dayWheel setDelegate:v21];
    [(FUScrollWheel *)v21->_dayWheel setItemTitleAligmnent:1];
    v106 = [(FUScrollWheel *)v21->_dayWheel layer];
    [v106 setCornerRadius:v87];

    v107 = [(FUScrollWheel *)v21->_dayWheel layer];
    id v108 = [MEMORY[0x263F825C8] grayColor];
    objc_msgSend(v107, "setBorderColor:", objc_msgSend(v108, "CGColor"));

    v109 = [(FUScrollWheel *)v21->_dayWheel layer];
    [v109 setBorderWidth:1.0];

    v110 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    dayLabel = v21->_dayLabel;
    v21->_dayLabel = v110;

    v112 = v21->_dayLabel;
    v113 = FUBundle();
    v114 = [v113 localizedStringForKey:@"DAY" value:&stru_26CF5F1B8 table:@"Localizable"];
    [(UILabel *)v112 setText:v114];

    [(UILabel *)v21->_dayLabel setTextAlignment:1];
    v115 = v21->_dayLabel;
    v116 = [MEMORY[0x263F81708] systemFontOfSize:10.0 weight:v97];
    [(UILabel *)v115 setFont:v116];

    v117 = [(UILabel *)v21->_dayLabel layer];
    id v118 = v100;
    objc_msgSend(v117, "setBackgroundColor:", objc_msgSend(v118, "CGColor"));

    v119 = [(UILabel *)v21->_dayLabel layer];
    [v119 setCornerRadius:3.0];

    v120 = v21->_dayLabel;
    v121 = [MEMORY[0x263F825C8] blackColor];
    [(UILabel *)v120 setTextColor:v121];

    [(FUDatePicker *)v21 addSubview:v21->_dayLabel];
    [(FUDatePicker *)v21 addSubview:v21->_dayWheel];
    v122 = objc_alloc_init(FUScrollWheel);
    yearWheel = v21->_yearWheel;
    v21->_yearWheel = v122;

    [(FUScrollWheel *)v21->_yearWheel setDataSource:v21];
    [(FUScrollWheel *)v21->_yearWheel setDelegate:v21];
    [(FUScrollWheel *)v21->_yearWheel setItemTitleAligmnent:1];
    v124 = [(FUScrollWheel *)v21->_yearWheel layer];
    [v124 setCornerRadius:v87];

    v125 = [(FUScrollWheel *)v21->_yearWheel layer];
    id v126 = [MEMORY[0x263F825C8] grayColor];
    objc_msgSend(v125, "setBorderColor:", objc_msgSend(v126, "CGColor"));

    v127 = [(FUScrollWheel *)v21->_yearWheel layer];
    [v127 setBorderWidth:1.0];

    v128 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    yearLabel = v21->_yearLabel;
    v21->_yearLabel = v128;

    v130 = v21->_yearLabel;
    v131 = FUBundle();
    v132 = [v131 localizedStringForKey:@"YEAR" value:&stru_26CF5F1B8 table:@"Localizable"];
    [(UILabel *)v130 setText:v132];

    [(UILabel *)v21->_yearLabel setTextAlignment:1];
    v133 = v21->_yearLabel;
    v134 = [MEMORY[0x263F81708] systemFontOfSize:10.0 weight:v97];
    [(UILabel *)v133 setFont:v134];

    v135 = [(UILabel *)v21->_yearLabel layer];
    objc_msgSend(v135, "setBackgroundColor:", objc_msgSend(v118, "CGColor"));

    v136 = [(UILabel *)v21->_yearLabel layer];
    [v136 setCornerRadius:3.0];

    v137 = v21->_yearLabel;
    v138 = [MEMORY[0x263F825C8] blackColor];
    v139 = v137;
    id v17 = v145;
    [(UILabel *)v139 setTextColor:v138];

    [(FUDatePicker *)v21 addSubview:v21->_yearLabel];
    [(FUDatePicker *)v21 addSubview:v21->_yearWheel];
    [(FUDatePicker *)v21 _updateDayRangeReloadingWheel:1];
    [(FUDatePicker *)v21 _updateSpinnersAnimated:0];

    id v19 = v142;
    id v18 = v143;
  }

  return v21;
}

- (id)_wheelOfType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *off_2644A7BC8[a3]);
  }
  return (id)(id)a2;
}

- (id)_enumerateDayValuesFromFormatter:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setDay:1];
  [v6 setMonth:1];
  v7 = [v5 dateFromComponents:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_numRowsDate];
  v9 = [MEMORY[0x263EFF960] currentLocale];
  v10 = [v9 objectForKey:*MEMORY[0x263EFF508]];
  int v11 = [v10 isEqualToString:@"fi"];

  if (self->_numRowsDate)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [v4 stringFromDate:v7];
      v14 = v13;
      if (v11)
      {
        v15 = [v13 stringByAppendingString:@"."];
        [v8 addObject:v15];
      }
      else
      {
        [v8 addObject:v13];
      }

      v16 = [v5 dateByAddingUnit:16 value:1 toDate:v7 options:0];

      ++v12;
      v7 = v16;
    }
    while (v12 < self->_numRowsDate);
  }
  else
  {
    v16 = v7;
  }

  return v8;
}

- (id)_enumerateDayValues
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_numRowsDate];
  if (self->_numRowsDate)
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%d", ++v4);
      [v3 addObject:v5];
    }
    while (self->_numRowsDate > v4);
  }
  return v3;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)FUDatePicker;
  [(FUDatePicker *)&v34 layoutSubviews];
  [(FUDatePicker *)self bounds];
  double v4 = v3;
  double v33 = v5;
  double v6 = floor((v3 + -10.0) / 3.0);
  [(UILabel *)self->_dayLabel sizeToFit];
  dayLabel = self->_dayLabel;
  [(UILabel *)dayLabel frame];
  CGRect v36 = CGRectInset(v35, -3.0, -1.5);
  -[UILabel setFrame:](dayLabel, "setFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  [(UILabel *)self->_dayLabel frame];
  CGFloat v10 = v8;
  CGFloat v11 = v9;
  int64_t dayOrder = self->_dayOrder;
  double v13 = 0.0;
  double v14 = 0.0;
  if (dayOrder)
  {
    if (dayOrder == 1)
    {
      double v14 = v4 * 0.5 - v8 * 0.5;
      double v13 = v4 * 0.5 - v6 * 0.5;
    }
    else
    {
      double v14 = v4 - v8;
      double v13 = v4 - v6;
    }
  }
  -[UILabel setFrame:](self->_dayLabel, "setFrame:", v14, 0.0, v8, v9);
  v37.origin.double y = 0.0;
  v37.origin.double x = v14;
  v37.size.double width = v10;
  v37.size.double height = v11;
  CGFloat v15 = CGRectGetMaxY(v37) + 2.0;
  v38.origin.double y = 0.0;
  v38.origin.double x = v14;
  v38.size.double width = v10;
  v38.size.double height = v11;
  -[FUScrollWheel setFrame:](self->_dayWheel, "setFrame:", v13, v15, v6, v33 - (CGRectGetMaxY(v38) + 2.0));
  [(UILabel *)self->_yearLabel sizeToFit];
  yearLabel = self->_yearLabel;
  [(UILabel *)yearLabel frame];
  CGRect v40 = CGRectInset(v39, -3.0, -1.5);
  -[UILabel setFrame:](yearLabel, "setFrame:", v40.origin.x, v40.origin.y, v40.size.width, v40.size.height);
  [(UILabel *)self->_yearLabel frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  int64_t yearOrder = self->_yearOrder;
  if (yearOrder) {
    double v22 = v4 - v17;
  }
  else {
    double v22 = 0.0;
  }
  if (yearOrder) {
    double v23 = v4 - v6;
  }
  else {
    double v23 = 0.0;
  }
  [(UILabel *)self->_yearLabel setFrame:v22];
  v41.origin.double y = 0.0;
  v41.origin.double x = v22;
  v41.size.double width = v18;
  v41.size.double height = v20;
  double v32 = v4;
  CGFloat v24 = CGRectGetMaxY(v41) + 2.0;
  v42.origin.double y = 0.0;
  v42.origin.double x = v22;
  v42.size.double width = v18;
  v42.size.double height = v20;
  -[FUScrollWheel setFrame:](self->_yearWheel, "setFrame:", v23, v24, v6, v33 - (CGRectGetMaxY(v42) + 2.0));
  [(UILabel *)self->_monthLabel sizeToFit];
  monthLabel = self->_monthLabel;
  [(UILabel *)monthLabel frame];
  CGRect v44 = CGRectInset(v43, -3.0, -1.5);
  -[UILabel setFrame:](monthLabel, "setFrame:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
  [(UILabel *)self->_monthLabel frame];
  int64_t monthOrder = self->_monthOrder;
  if (monthOrder)
  {
    double v28 = v4 - v26;
    if (monthOrder == 1) {
      double v29 = v4 * 0.5 - v6 * 0.5;
    }
    else {
      double v29 = v4 - v6;
    }
    if (monthOrder == 1) {
      double v28 = v32 * 0.5 - v26 * 0.5;
    }
  }
  else
  {
    double v28 = 0.0;
    double v29 = 0.0;
  }
  -[UILabel setFrame:](self->_monthLabel, "setFrame:", v28, 0.0);
  v45.origin.double y = 0.0;
  v45.origin.double x = v22;
  v45.size.double width = v18;
  v45.size.double height = v20;
  CGFloat v30 = CGRectGetMaxY(v45) + 2.0;
  v46.origin.double y = 0.0;
  v46.origin.double x = v22;
  v46.size.double width = v18;
  v46.size.double height = v20;
  -[FUScrollWheel setFrame:](self->_monthWheel, "setFrame:", v29, v30, v6, v33 - (CGRectGetMaxY(v46) + 2.0));
  [(FUScrollWheel *)self->_monthWheel reloadData];
  [(FUScrollWheel *)self->_dayWheel reloadData];
  [(FUScrollWheel *)self->_yearWheel reloadData];
  v31 = [(FUDatePicker *)self _wheelOfType:self->_initialWheelType];
  [v31 setActiveScrollWheel];
}

- (void)setDate:(id)a3
{
}

- (void)setDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (NSDate *)[a3 copy];
  date = self->_date;
  self->_date = v6;

  [(FUDatePicker *)self _updateDayRangeReloadingWheel:0];
  [(FUDatePicker *)self _updateSpinnersAnimated:v4];
}

- (id)dateWheel
{
  return self->_dayWheel;
}

- (void)_updateSpinnersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = [v5 components:30 fromDate:self->_date];

  -[FUScrollWheel setCurrentIndex:animated:](self->_monthWheel, "setCurrentIndex:animated:", [v9 month] - self->_monthOffset, v3);
  -[FUScrollWheel setCurrentIndex:animated:](self->_dayWheel, "setCurrentIndex:animated:", [v9 day] - self->_dayOffset, v3);
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  objc_msgSend(v6, "setYear:", objc_msgSend(v9, "year"));
  objc_msgSend(v6, "setEra:", objc_msgSend(v9, "era"));
  v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v8 = [v7 dateFromComponents:v6];

  [(FUScrollWheel *)self->_yearWheel setCurrentIndex:[(NSMutableArray *)self->_yearsWithNames indexOfObject:v8] animated:v3];
}

- (void)_updateDayRangeReloadingWheel:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v5 rangeOfUnit:16 inUnit:8 forDate:self->_date];
  unint64_t v7 = v6;

  self->_numRowsDate = v7;
  if (v3)
  {
    self->_firstResponderShouldChange = 0;
    [(FUScrollWheel *)self->_dayWheel reloadData];
    self->_firstResponderShouldChange = 1;
  }
}

- (id)scrollWheel:(id)a3 titleForItemAtIndex:(unint64_t)a4
{
  unint64_t v6 = (FUScrollWheel *)a3;
  unint64_t v7 = v6;
  if (self->_monthWheel == v6)
  {
    id v9 = [(NSArray *)self->_monthNames objectAtIndexedSubscript:a4];
    uint64_t v10 = [v9 localizedUppercaseString];
    goto LABEL_6;
  }
  if (self->_dayWheel != v6)
  {
    if (self->_yearWheel != v6)
    {
      double v8 = &stru_26CF5F1B8;
      goto LABEL_9;
    }
    id v9 = [(NSMutableArray *)self->_yearsWithNames objectAtIndexedSubscript:a4];
    if (self->_displayEra)
    {
      unint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v13 = [v12 components:2 fromDate:v9];

      double v14 = [MEMORY[0x263EFF8F0] currentCalendar];
      CGFloat v15 = [v14 eraSymbols];
      v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v13, "era"));
      double v17 = [v16 substringToIndex:1];

      CGFloat v18 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v9];
      double v8 = [v17 stringByAppendingString:v18];

      goto LABEL_7;
    }
    uint64_t v10 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v9];
LABEL_6:
    double v8 = (__CFString *)v10;
LABEL_7:

    goto LABEL_9;
  }
  double v8 = [(NSArray *)self->_dayValues objectAtIndexedSubscript:a4];
LABEL_9:

  return v8;
}

- (unint64_t)numberOfRowsInScrollWheel:(id)a3
{
  if (self->_dayWheel == a3)
  {
    BOOL v3 = &OBJC_IVAR___FUDatePicker__numRowsDate;
  }
  else if (self->_monthWheel == a3)
  {
    BOOL v3 = &OBJC_IVAR___FUDatePicker__numRowsMonth;
  }
  else
  {
    BOOL v3 = &OBJC_IVAR___FUDatePicker__numRowsYear;
  }
  return *(unint64_t *)((char *)&self->super.super.super.isa + *v3);
}

- (void)tappedScrollWheel:(id)a3
{
  v25 = (FUScrollWheel *)a3;
  BOOL v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;

  monthWheel = self->_monthWheel;
  if (monthWheel != v25)
  {
    double v8 = [(FUScrollWheel *)self->_monthWheel layer];
    [v8 setCornerRadius:6.0];

    id v9 = [(FUScrollWheel *)self->_monthWheel layer];
    id v10 = [MEMORY[0x263F825C8] grayColor];
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    CGFloat v11 = [(FUScrollWheel *)self->_monthWheel layer];
    [v11 setBorderWidth:2.0 / v6];
  }
  [(UILabel *)self->_monthLabel setHidden:monthWheel != v25];
  dayWheel = self->_dayWheel;
  if (dayWheel != v25)
  {
    double v13 = [(FUScrollWheel *)self->_dayWheel layer];
    [v13 setCornerRadius:6.0];

    double v14 = [(FUScrollWheel *)self->_dayWheel layer];
    id v15 = [MEMORY[0x263F825C8] grayColor];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    v16 = [(FUScrollWheel *)self->_dayWheel layer];
    [v16 setBorderWidth:2.0 / v6];
  }
  [(UILabel *)self->_dayLabel setHidden:dayWheel != v25];
  yearWheel = self->_yearWheel;
  if (yearWheel != v25)
  {
    CGFloat v18 = [(FUScrollWheel *)self->_yearWheel layer];
    [v18 setCornerRadius:6.0];

    double v19 = [(FUScrollWheel *)self->_yearWheel layer];
    id v20 = [MEMORY[0x263F825C8] grayColor];
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    v21 = [(FUScrollWheel *)self->_yearWheel layer];
    [v21 setBorderWidth:2.0 / v6];
  }
  [(UILabel *)self->_yearLabel setHidden:yearWheel != v25];
  double v22 = [(FUScrollWheel *)v25 layer];
  [v22 setCornerRadius:6.0];

  double v23 = [(FUScrollWheel *)v25 layer];
  objc_msgSend(v23, "setBorderColor:", -[UIColor CGColor](self->_tintColor, "CGColor"));

  CGFloat v24 = [(FUScrollWheel *)v25 layer];
  [v24 setBorderWidth:3.0 / v6];
}

- (void)scrollWheel:(id)a3 didChangeCurrentIndexTo:(unint64_t)a4
{
  v25 = (FUScrollWheel *)a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  double v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v5 setCalendar:v6];

  objc_msgSend(v5, "setMonth:", self->_monthOffset + -[FUScrollWheel currentIndex](self->_monthWheel, "currentIndex"));
  unint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v8 = [(NSMutableArray *)self->_yearsWithNames objectAtIndex:[(FUScrollWheel *)self->_yearWheel currentIndex]];
  id v9 = [v7 components:6 fromDate:v8];

  objc_msgSend(v5, "setYear:", objc_msgSend(v9, "year"));
  objc_msgSend(v5, "setEra:", objc_msgSend(v9, "era"));
  [v5 setDay:1];
  id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  CGFloat v11 = [v10 dateFromComponents:v5];

  unint64_t v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v12 rangeOfUnit:16 inUnit:8 forDate:v11];
  unint64_t v14 = v13;

  unint64_t v15 = [(FUScrollWheel *)self->_dayWheel currentIndex];
  if (v14 >= self->_dayOffset + v15) {
    unint64_t v16 = self->_dayOffset + v15;
  }
  else {
    unint64_t v16 = v14;
  }
  [v5 setDay:v16];
  double v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  CGFloat v18 = [v17 dateFromComponents:v5];
  p_date = &self->_date;
  date = self->_date;
  self->_date = v18;

  uint64_t v21 = 544;
  minimumDate = self->_minimumDate;
  if (minimumDate && [(NSDate *)minimumDate compare:*p_date] == NSOrderedDescending
    || (uint64_t v21 = 552, (maximumDate = self->_maximumDate) != 0)
    && [(NSDate *)maximumDate compare:*p_date] == NSOrderedAscending)
  {
    objc_storeStrong((id *)&self->_date, *(id *)((char *)&self->super.super.super.isa + v21));
    [(FUDatePicker *)self _updateDayRangeReloadingWheel:1];
    [(FUDatePicker *)self _updateSpinnersAnimated:1];
  }
  else if (self->_monthWheel == v25 || self->_yearWheel == v25)
  {
    [(FUDatePicker *)self _updateDayRangeReloadingWheel:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained datePicker:self didSelectDate:*p_date];
}

- (BOOL)scrollWheelShouldBecomeFirstResponder:(id)a3
{
  return self->_firstResponderShouldChange;
}

- (FUDatePickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FUDatePickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (FUScrollWheel)monthWheel
{
  return self->_monthWheel;
}

- (void)setMonthWheel:(id)a3
{
}

- (FUScrollWheel)dayWheel
{
  return self->_dayWheel;
}

- (void)setDayWheel:(id)a3
{
}

- (FUScrollWheel)yearWheel
{
  return self->_yearWheel;
}

- (void)setYearWheel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearWheel, 0);
  objc_storeStrong((id *)&self->_dayWheel, 0);
  objc_storeStrong((id *)&self->_monthWheel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_monthLabel, 0);
  objc_storeStrong((id *)&self->_yearLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_yearsWithNames, 0);
  objc_storeStrong((id *)&self->_dayValues, 0);
  objc_storeStrong((id *)&self->_monthNames, 0);
}

@end