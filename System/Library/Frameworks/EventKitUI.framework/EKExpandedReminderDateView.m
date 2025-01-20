@interface EKExpandedReminderDateView
+ (id)exampleHeader;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CAFilter)blurFilter;
- (EKExpandedReminderDateView)initWithFrame:(CGRect)a3;
- (EKExpandedReminderDayCircleView)dateNumberView;
- (UILabel)dateLabel;
- (UILabel)monthYearLabel;
- (UILabel)weekdayLabel;
- (void)setBlurFilter:(id)a3;
- (void)setBlurFilterRadius:(double)a3;
- (void)setDateLabel:(id)a3;
- (void)setDateNumberView:(id)a3;
- (void)setMonthYearLabel:(id)a3;
- (void)setWeekdayLabel:(id)a3;
- (void)setupWithDate:(id)a3;
@end

@implementation EKExpandedReminderDateView

+ (id)exampleHeader
{
  v2 = [EKExpandedReminderDateView alloc];
  v3 = -[EKExpandedReminderDateView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = [MEMORY[0x1E4F1C9C8] now];
  [(EKExpandedReminderDateView *)v3 setupWithDate:v4];

  return v3;
}

- (EKExpandedReminderDateView)initWithFrame:(CGRect)a3
{
  v87[9] = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)EKExpandedReminderDateView;
  v3 = -[EKExpandedReminderDateView initWithFrame:](&v84, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKExpandedReminderDateView *)v3 setBackgroundColor:v4];

    v5 = [EKExpandedReminderDayCircleView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[EKExpandedReminderDayCircleView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(EKExpandedReminderDateView *)v3 setDateNumberView:v10];

    v11 = [(EKExpandedReminderDateView *)v3 dateNumberView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    v13 = [(EKExpandedReminderDateView *)v3 dateNumberView];
    [v13 setBackgroundColor:v12];

    v14 = [(EKExpandedReminderDateView *)v3 dateNumberView];
    [(EKExpandedReminderDateView *)v3 addSubview:v14];

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 62.0, 62.0);
    [(EKExpandedReminderDateView *)v3 setDateLabel:v15];

    v16 = [(EKExpandedReminderDateView *)v3 dateLabel];
    [v16 setTextAlignment:1];

    v17 = [(EKExpandedReminderDateView *)v3 dateLabel];
    [v17 setNumberOfLines:1];

    v18 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:34.0];
    v19 = [(EKExpandedReminderDateView *)v3 dateLabel];
    [v19 setFont:v18];

    v20 = CalendarAppCircleTextColor();
    v21 = [(EKExpandedReminderDateView *)v3 dateLabel];
    [v21 setTextColor:v20];

    v22 = [(EKExpandedReminderDateView *)v3 dateNumberView];
    v23 = [(EKExpandedReminderDateView *)v3 dateLabel];
    [v22 addSubview:v23];

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    [(EKExpandedReminderDateView *)v3 setWeekdayLabel:v24];

    v25 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2988]];
    v79 = [v25 fontDescriptorWithSymbolicTraits:2];

    v78 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v79 size:26.0];
    v26 = [(EKExpandedReminderDateView *)v3 weekdayLabel];
    [v26 setFont:v78];

    v27 = [(EKExpandedReminderDateView *)v3 weekdayLabel];
    [v27 setNumberOfLines:1];

    v28 = [MEMORY[0x1E4FB1618] labelColor];
    v29 = [(EKExpandedReminderDateView *)v3 weekdayLabel];
    [v29 setTextColor:v28];

    v30 = [(EKExpandedReminderDateView *)v3 weekdayLabel];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

    v31 = [(EKExpandedReminderDateView *)v3 weekdayLabel];
    [(EKExpandedReminderDateView *)v3 addSubview:v31];

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    [(EKExpandedReminderDateView *)v3 setMonthYearLabel:v32];

    v33 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
    v77 = [v33 fontDescriptorWithSymbolicTraits:2];

    v76 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v77 size:15.0];
    v34 = [(EKExpandedReminderDateView *)v3 monthYearLabel];
    [v34 setFont:v76];

    v35 = [(EKExpandedReminderDateView *)v3 monthYearLabel];
    [v35 setNumberOfLines:1];

    v36 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v37 = [(EKExpandedReminderDateView *)v3 monthYearLabel];
    [v37 setTextColor:v36];

    v38 = [(EKExpandedReminderDateView *)v3 monthYearLabel];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(EKExpandedReminderDateView *)v3 monthYearLabel];
    [(EKExpandedReminderDateView *)v3 addSubview:v39];

    v40 = [(EKExpandedReminderDayCircleView *)v3->_dateNumberView topAnchor];
    v41 = [(EKExpandedReminderDateView *)v3 topAnchor];
    v80 = [v40 constraintEqualToAnchor:v41];

    LODWORD(v42) = 1132068864;
    [v80 setPriority:v42];
    v61 = (void *)MEMORY[0x1E4F28DC8];
    v87[0] = v80;
    v75 = [(EKExpandedReminderDayCircleView *)v3->_dateNumberView centerXAnchor];
    v74 = [(EKExpandedReminderDateView *)v3 centerXAnchor];
    v73 = [v75 constraintEqualToAnchor:v74];
    v87[1] = v73;
    v72 = [(EKExpandedReminderDayCircleView *)v3->_dateNumberView widthAnchor];
    v71 = [v72 constraintEqualToConstant:62.0];
    v87[2] = v71;
    v70 = [(EKExpandedReminderDayCircleView *)v3->_dateNumberView heightAnchor];
    v69 = [v70 constraintEqualToConstant:62.0];
    v87[3] = v69;
    v68 = [(UILabel *)v3->_weekdayLabel firstBaselineAnchor];
    v67 = [(EKExpandedReminderDayCircleView *)v3->_dateNumberView bottomAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 constant:32.0];
    v87[4] = v66;
    v65 = [(UILabel *)v3->_weekdayLabel centerXAnchor];
    v64 = [(EKExpandedReminderDateView *)v3 centerXAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v87[5] = v63;
    v62 = [(UILabel *)v3->_monthYearLabel firstBaselineAnchor];
    v43 = [(UILabel *)v3->_weekdayLabel firstBaselineAnchor];
    v44 = [v62 constraintEqualToAnchor:v43 constant:26.0];
    v87[6] = v44;
    v45 = [(UILabel *)v3->_monthYearLabel centerXAnchor];
    v46 = [(EKExpandedReminderDateView *)v3 centerXAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v87[7] = v47;
    v48 = [(UILabel *)v3->_monthYearLabel bottomAnchor];
    v49 = [(EKExpandedReminderDateView *)v3 bottomAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v87[8] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:9];
    [v61 activateConstraints:v51];

    id v52 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v53 = (void *)[v52 initWithType:*MEMORY[0x1E4F3A0D0]];
    [(EKExpandedReminderDateView *)v3 setBlurFilter:v53];

    v54 = [(EKExpandedReminderDateView *)v3 blurFilter];
    [v54 setValue:0 forKey:*MEMORY[0x1E4F3A1D8]];

    v55 = [(EKExpandedReminderDateView *)v3 blurFilter];
    v86 = v55;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    v57 = [(EKExpandedReminderDateView *)v3 layer];
    [v57 setFilters:v56];

    objc_initWeak(&location, v3);
    uint64_t v85 = objc_opt_class();
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __44__EKExpandedReminderDateView_initWithFrame___block_invoke;
    v81[3] = &unk_1E60874F8;
    objc_copyWeak(&v82, &location);
    id v59 = (id)[(EKExpandedReminderDateView *)v3 registerForTraitChanges:v58 withHandler:v81];

    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __44__EKExpandedReminderDateView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dateNumberView];
  [v1 setNeedsDisplay];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EKExpandedReminderDateView;
    BOOL v5 = [(EKExpandedReminderDateView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setBlurFilterRadius:(double)a3
{
  id v5 = [(EKExpandedReminderDateView *)self layer];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)setupWithDate:(id)a3
{
  id v21 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v6 = [v21 isSameDayAsDate:v4 inCalendar:v5];

  if (v6)
  {
    objc_super v7 = CalendarAppTintColor();
    double v8 = [(EKExpandedReminderDateView *)self dateNumberView];
    [v8 setCircleColor:v7];

    double v9 = [MEMORY[0x1E4FB1618] whiteColor];
    v10 = [(EKExpandedReminderDateView *)self dateLabel];
    [v10 setTextColor:v9];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F57838]);
  v12 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
  v13 = (void *)[v11 initWithDate:v21 timeZone:v12];

  [v13 day];
  v14 = CUIKLocalizedStringForInteger();
  v15 = [(EKExpandedReminderDateView *)self dateLabel];
  [v15 setText:v14];

  v16 = CUIKLongStringForWeekday();
  v17 = [(EKExpandedReminderDateView *)self weekdayLabel];
  [v17 setText:v16];

  v18 = CUIKStringForMonthYear();
  v19 = [v18 localizedUppercaseString];
  v20 = [(EKExpandedReminderDateView *)self monthYearLabel];
  [v20 setText:v19];
}

- (EKExpandedReminderDayCircleView)dateNumberView
{
  return self->_dateNumberView;
}

- (void)setDateNumberView:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)weekdayLabel
{
  return self->_weekdayLabel;
}

- (void)setWeekdayLabel:(id)a3
{
}

- (UILabel)monthYearLabel
{
  return self->_monthYearLabel;
}

- (void)setMonthYearLabel:(id)a3
{
}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (void)setBlurFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_monthYearLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_dateNumberView, 0);
}

@end