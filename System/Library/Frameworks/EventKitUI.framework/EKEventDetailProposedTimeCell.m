@interface EKEventDetailProposedTimeCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hasCustomLayout;
- (BOOL)shouldDisplayForEvent;
- (BOOL)showsTopSeparator;
- (BOOL)update;
- (EKEventDetailProposedTimeCell)initWithEvent:(id)a3 andAttendee:(id)a4;
- (void)setRoundedCorners:(unint64_t)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
@end

@implementation EKEventDetailProposedTimeCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (EKEventDetailProposedTimeCell)initWithEvent:(id)a3 andAttendee:(id)a4
{
  v62[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)EKEventDetailProposedTimeCell;
  v9 = [(EKEventDetailCell *)&v56 initWithEvent:v7 editable:0 style:1];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    bgView = v9->_bgView;
    v9->_bgView = (UIView *)v11;

    [(UIView *)v9->_bgView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v9->_bgView setPreservesSuperviewLayoutMargins:1];
    v13 = EKHalfSystemGroupedBackgroundColor();
    [(UIView *)v9->_bgView setBackgroundColor:v13];

    [(EKEventDetailProposedTimeCell *)v9 addSubview:v9->_bgView];
    v14 = (void *)MEMORY[0x1E4F28DC8];
    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_bgView attribute:3 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
    v62[0] = v15;
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_bgView attribute:4 relatedBy:0 toItem:v9 attribute:4 multiplier:1.0 constant:0.0];
    v62[1] = v16;
    v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_bgView attribute:5 relatedBy:0 toItem:v9 attribute:17 multiplier:1.0 constant:0.0];
    v62[2] = v17;
    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_bgView attribute:6 relatedBy:0 toItem:v9 attribute:18 multiplier:1.0 constant:0.0];
    v62[3] = v18;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    v19 = id v55 = v8;
    [v14 activateConstraints:v19];

    objc_storeStrong((id *)&v9->_attendee, a4);
    objc_storeStrong((id *)&v9->_event, a3);
    [(EKUITableViewCell *)v9 setDrawsOwnRowSeparators:1];
    [(EKUITableViewCell *)v9 setSeparatorEdges:0];
    [(EKEventDetailProposedTimeCell *)v9 setSeparatorStyle:0];
    v9->_showsTopSeparator = 1;
    uint64_t v20 = objc_opt_new();
    control = v9->_control;
    v9->_control = (EKEventDetailsHighlightControl *)v20;

    [(EKEventDetailsHighlightControl *)v9->_control setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKEventDetailsHighlightControl *)v9->_control setEnabled:0];
    v22 = [(EKEventDetailProposedTimeCell *)v9 contentView];
    [v22 addSubview:v9->_control];

    id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
    v24 = [(EKEventDetailProposedTimeCell *)v9 traitCollection];
    v25 = TableViewDisclosureIndicatorImage(v24);
    v26 = (void *)[v23 initWithImage:v25];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(EKEventDetailProposedTimeCell *)v9 contentView];
    [v27 addSubview:v26];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_control attribute:5 relatedBy:0 toItem:v9->_bgView attribute:17 multiplier:1.0 constant:0.0];
    v61[0] = v29;
    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_control attribute:6 relatedBy:0 toItem:v26 attribute:5 multiplier:1.0 constant:-16.0];
    v61[1] = v30;
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = v9->_bgView;
    [(EKEventDetailProposedTimeCell *)v9 layoutMargins];
    v34 = [v31 constraintWithItem:v26 attribute:6 relatedBy:0 toItem:v32 attribute:18 multiplier:1.0 constant:-v33];
    v61[2] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
    [v28 activateConstraints:v35];

    v36 = _NSDictionaryOfVariableBindings(&cfstr_Control.isa, v9->_control, 0);
    v37 = [(EKEventDetailProposedTimeCell *)v9 contentView];
    v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_control(>=48)]|" options:0 metrics:0 views:v36];
    [v37 addConstraints:v38];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [MEMORY[0x1E4F28DC8] constraintWithItem:v26 attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    v60 = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    [v39 activateConstraints:v41];

    uint64_t v42 = objc_opt_new();
    topSeparator = v9->_topSeparator;
    v9->_topSeparator = (UIView *)v42;

    [(UIView *)v9->_topSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v9->_topSeparator setBackgroundColor:v44];

    [(EKEventDetailProposedTimeCell *)v9 addSubview:v9->_topSeparator];
    v45 = _NSDictionaryOfVariableBindings(&cfstr_Topseparator.isa, v9->_topSeparator, 0);

    v58 = @"separatorHeight";
    v46 = [NSNumber numberWithDouble:CalOnePixelInPoints()];
    v59 = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];

    v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_topSeparator(separatorHeight)]" options:0 metrics:v47 views:v45];
    [(EKEventDetailProposedTimeCell *)v9 addConstraints:v48];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_topSeparator attribute:5 relatedBy:0 toItem:v9->_bgView attribute:5 multiplier:1.0 constant:0.0];
    v57[0] = v50;
    v51 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9->_topSeparator attribute:6 relatedBy:0 toItem:v9->_bgView attribute:6 multiplier:1.0 constant:0.0];
    v57[1] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
    v53 = v49;
    id v8 = v55;
    [v53 activateConstraints:v52];
  }
  return v9;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailProposedTimeCell;
  [(EKEventDetailProposedTimeCell *)&v3 setSeparatorStyle:0];
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (self->_showsTopSeparator != a3)
  {
    if (a3) {
      [MEMORY[0x1E4FB1618] separatorColor];
    }
    else {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    }
    [(UIView *)self->_topSeparator setBackgroundColor:v5];

    self->_showsTopSeparator = a3;
  }
}

- (void)setRoundedCorners:(unint64_t)a3
{
  v5 = [(UIView *)self->_bgView layer];
  [v5 setMaskedCorners:a3];

  if (a3) {
    double v6 = 5.0;
  }
  else {
    double v6 = 0.0;
  }
  id v7 = [(UIView *)self->_bgView layer];
  [v7 setCornerRadius:v6];
}

- (BOOL)hasCustomLayout
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 pointSize];
  BOOL v4 = v3 >= 18.5;

  return v4;
}

- (BOOL)shouldDisplayForEvent
{
  return 1;
}

- (BOOL)update
{
  v60[2] = *MEMORY[0x1E4F143B8];
  v49 = CUIKDisplayStringForNotificationIdentity();
  -[EKEventDetailsHighlightControl setTitleText:](self->_control, "setTitleText:");
  uint64_t v58 = *MEMORY[0x1E4FB06F8];
  uint64_t v3 = v58;
  uint64_t v4 = *MEMORY[0x1E4FB28D8];
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  v60[0] = v5;
  uint64_t v59 = *MEMORY[0x1E4FB0700];
  uint64_t v6 = v59;
  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  v60[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v58 count:2];

  v56[0] = v3;
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
  v56[1] = v6;
  v57[0] = v9;
  id v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v57[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

  v12 = EventKitUIBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"Proposed a new time" value:&stru_1F0CC2140 table:0];

  v48 = (void *)v13;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13 attributes:v8];
  event = self->_event;
  uint64_t v16 = EKUIWidthSizeClassForViewHierarchy(self);
  id v54 = 0;
  id v55 = 0;
  id v52 = 0;
  id v53 = 0;
  v17 = [(EKCalendarEventInvitationNotificationAttendee *)self->_attendee proposedStartDate];
  CalDetailStringsForCalendarEvent(event, v16, &v55, &v54, &v53, &v52, v17, 0);
  id v18 = v55;
  id v50 = v54;
  id v19 = v53;
  id v20 = v52;

  v51 = v19;
  if (v18)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    v22 = [NSString stringWithFormat:@"\n%@", v18];
    id v23 = (void *)[v21 initWithString:v22 attributes:v11];

    [v14 appendAttributedString:v23];
    id v19 = v51;
  }
  v47 = v18;
  if (v50)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    v25 = [NSString stringWithFormat:@"\n%@", v50];
    v26 = (void *)[v24 initWithString:v25 attributes:v11];

    [v14 appendAttributedString:v26];
    id v19 = v51;
  }
  if (v19)
  {
    id v27 = v19;
    id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
    v29 = [NSString stringWithFormat:@"\n%@", v27];
    v30 = (void *)[v28 initWithString:v29 attributes:v11];

    [v14 appendAttributedString:v30];
  }
  if (v20)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
    v32 = [NSString stringWithFormat:@"\n%@", v20];
    double v33 = (void *)[v31 initWithString:v32 attributes:v11];

    [v14 appendAttributedString:v33];
  }
  [(EKEventDetailsHighlightControl *)self->_control setSubtitleAttributedText:v14];
  double v34 = EKUIScaleFactor();
  v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 20.0, 20.0, v34);
  [v35 setDrawBorder:1];
  v36 = (void *)MEMORY[0x1E4F57B20];
  v37 = [(EKCalendarEventInvitationNotificationAttendee *)self->_attendee proposedStartDate];
  v38 = CUIKCalendar();
  uint64_t v39 = [v36 iconDateNameFormatTypeForDateBasedOnDistanceFromNow:v37 calendar:v38];

  id v40 = objc_alloc(MEMORY[0x1E4F6F248]);
  v41 = [(EKCalendarEventInvitationNotificationAttendee *)self->_attendee proposedStartDate];
  uint64_t v42 = CUIKCalendar();
  v43 = (void *)[v40 initWithDate:v41 calendar:v42 format:v39];

  v44 = [v43 prepareImageForDescriptor:v35];
  v45 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", objc_msgSend(v44, "CGImage"), 0, v34);
  if (!v45)
  {
    v45 = [MEMORY[0x1E4FB1818] _applicationIconImageForBundleIdentifier:@"com.apple.mobilecal" format:5];
  }
  [(EKEventDetailsHighlightControl *)self->_control setIconImage:v45];
  [(EKEventDetailProposedTimeCell *)self setNeedsLayout];

  return 1;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_control, 0);

  objc_storeStrong((id *)&self->_attendee, 0);
}

@end