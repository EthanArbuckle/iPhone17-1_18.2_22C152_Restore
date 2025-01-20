@interface EKUIInviteesViewTimeSlotCell
+ (BOOL)_layoutManagerReportsExcessLines:(id)a3;
+ (double)_leftBuffer;
+ (double)_rightBuffer;
+ (id)_andMoreLeftSpacing;
+ (id)_generateAndMoreStringWithCount:(unint64_t)a3 attributes:(id)a4;
+ (id)_generateParticipantTextView;
+ (id)_interParticipantSpacing;
+ (id)_nonBreakingSpace;
+ (id)_participantsTextViewFont;
+ (id)_proposedByFont;
+ (id)_replaceSpacesWithNonBreakingSpaces:(id)a3;
+ (id)_timeLabelFont;
+ (void)_setRequiredHuggingAndCompression:(id)a3;
- (BOOL)_everyoneCanAttend;
- (BOOL)_shouldDisplayTimeZone;
- (BOOL)_textWillFit:(id)a3;
- (BOOL)checked;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)searchInProgress;
- (BOOL)showAllParticipants;
- (BOOL)updateFontBasedConstraints;
- (BOOL)updateParticipantsText;
- (BOOL)updateTimeText;
- (CGRect)andMoreBoundingRect;
- (EKUIInviteesViewTimeSlotCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)busyParticipants;
- (NSArray)persistentConstraints;
- (NSArray)proposedBy;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)andMoreStringCache;
- (NSLayoutConstraint)bottomTimeLabelHeightConstraint;
- (NSLayoutConstraint)bottomTimeLabelToTopTimeLabelConstraint;
- (NSLayoutConstraint)participantsViewToBottomTimeLabelConstraint;
- (NSLayoutConstraint)participantsViewToContentViewConstraint;
- (NSLayoutConstraint)proposedByMaxHeightConstraint;
- (NSLayoutConstraint)proposedByMinHeightConstraint;
- (NSLayoutConstraint)proposedTimeLabelToBottomTimeLabelConstraint;
- (NSLayoutConstraint)timeZoneTimeLabelHeightConstraint;
- (NSLayoutConstraint)timeZoneTimeLabelToBottomTimeLabelConstraint;
- (NSLayoutConstraint)topTimeLabelHeightConstraint;
- (NSLayoutConstraint)topTimeLabelToTopContentViewConstraint;
- (NSMutableDictionary)colorToBusyImageAttributedString;
- (NSTimeZone)timeZone;
- (UIButton)showPreviewButton;
- (UIColor)participantsTextColor;
- (UIColor)timeTextColor;
- (UIImageView)checkmarkImageView;
- (UILabel)bottomTimeLabel;
- (UILabel)labelForTextSizeTesting;
- (UILabel)proposedByLabel;
- (UILabel)timeZoneTimeLabel;
- (UILabel)topTimeLabel;
- (UITapGestureRecognizer)tappedMoreRecognizer;
- (UITextView)participantsTextView;
- (UITextView)textViewForTextSizeTesting;
- (UIView)andMoreDebugOverlay;
- (double)_preferredMaxLayoutWidth;
- (id)_busyImageAttributedStringForColor:(id)a3;
- (id)_generateStringForAllParticipants:(id)a3;
- (id)_generateStringForSomeParticipantsAndStampMoreBoundingRect:(id)a3;
- (id)_textForParticipant:(id)a3 color:(id)a4;
- (id)showAllConflictedParticipantsTapped;
- (id)showPreviewOfEventAtTime;
- (void)_andMoreTapped:(id)a3;
- (void)_resetFonts;
- (void)_resetParticipantsTextIfNeeded;
- (void)_resetPreferredMaxLayoutWidths;
- (void)_resetTimeTextIfNeeded;
- (void)_showPreviewButtonTapped:(id)a3;
- (void)dealloc;
- (void)setAndMoreBoundingRect:(CGRect)a3;
- (void)setAndMoreDebugOverlay:(id)a3;
- (void)setAndMoreStringCache:(id)a3;
- (void)setBottomTimeLabel:(id)a3;
- (void)setBottomTimeLabelHeightConstraint:(id)a3;
- (void)setBottomTimeLabelToTopTimeLabelConstraint:(id)a3;
- (void)setBusyParticipants:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setColorToBusyImageAttributedString:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLabelForTextSizeTesting:(id)a3;
- (void)setParticipantsTextView:(id)a3;
- (void)setParticipantsViewToBottomTimeLabelConstraint:(id)a3;
- (void)setParticipantsViewToContentViewConstraint:(id)a3;
- (void)setPersistentConstraints:(id)a3;
- (void)setProposedBy:(id)a3;
- (void)setProposedByLabel:(id)a3;
- (void)setProposedByMaxHeightConstraint:(id)a3;
- (void)setProposedByMinHeightConstraint:(id)a3;
- (void)setProposedTimeLabelToBottomTimeLabelConstraint:(id)a3;
- (void)setSearchInProgress:(BOOL)a3;
- (void)setShowAllConflictedParticipantsTapped:(id)a3;
- (void)setShowAllParticipants:(BOOL)a3;
- (void)setShowPreviewButton:(id)a3;
- (void)setShowPreviewOfEventAtTime:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTappedMoreRecognizer:(id)a3;
- (void)setTextViewForTextSizeTesting:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTimeZoneTimeLabel:(id)a3;
- (void)setTimeZoneTimeLabelHeightConstraint:(id)a3;
- (void)setTimeZoneTimeLabelToBottomTimeLabelConstraint:(id)a3;
- (void)setTopTimeLabel:(id)a3;
- (void)setTopTimeLabelHeightConstraint:(id)a3;
- (void)setTopTimeLabelToTopContentViewConstraint:(id)a3;
- (void)setUpdateFontBasedConstraints:(BOOL)a3;
- (void)setUpdateParticipantsText:(BOOL)a3;
- (void)setUpdateTimeText:(BOOL)a3;
- (void)updateConstraints;
- (void)updateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 busyParticipants:(id)a6 showAllParticipants:(BOOL)a7 checked:(BOOL)a8;
@end

@implementation EKUIInviteesViewTimeSlotCell

- (EKUIInviteesViewTimeSlotCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  v4 = [(EKUIInviteesViewTimeSlotCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](v4, "setAndMoreBoundingRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(id)objc_opt_class() _leftBuffer];
    -[EKUIInviteesViewTimeSlotCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, v6, 0.0, 0.0);
    v7 = [(EKUIInviteesViewTimeSlotCell *)v5 contentView];
    v8 = [(EKUIInviteesViewTimeSlotCell *)v5 traitCollection];
    uint64_t v9 = TableViewCheckmarkImage(v8);

    v29 = (void *)v9;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    [(id)objc_opt_class() _setRequiredHuggingAndCompression:v10];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setContentMode:4];
    [v10 setHidden:1];
    [v7 addSubview:v10];
    [(EKUIInviteesViewTimeSlotCell *)v5 setCheckmarkImageView:v10];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v11];
    v28 = v11;
    [(EKUIInviteesViewTimeSlotCell *)v5 setTopTimeLabel:v11];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v12];
    v27 = v12;
    [(EKUIInviteesViewTimeSlotCell *)v5 setBottomTimeLabel:v12];
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v13];
    [(EKUIInviteesViewTimeSlotCell *)v5 setTimeZoneTimeLabel:v13];
    id v14 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v14 setNumberOfLines:4];
    [v7 addSubview:v14];
    [(EKUIInviteesViewTimeSlotCell *)v5 setProposedByLabel:v14];
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = v15;
    [(EKUIInviteesViewTimeSlotCell *)v5 setLabelForTextSizeTesting:v15];
    v16 = [(id)objc_opt_class() _generateParticipantTextView];
    [v7 addSubview:v16];
    [(EKUIInviteesViewTimeSlotCell *)v5 setParticipantsTextView:v16];
    v25 = [(id)objc_opt_class() _generateParticipantTextView];
    -[EKUIInviteesViewTimeSlotCell setTextViewForTextSizeTesting:](v5, "setTextViewForTextSizeTesting:");
    v17 = [MEMORY[0x1E4FB14D0] buttonWithType:3];
    [(id)objc_opt_class() _setRequiredHuggingAndCompression:v17];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addTarget:v5 action:sel__showPreviewButtonTapped_ forControlEvents:64];
    v18 = [(EKUIInviteesViewTimeSlotCell *)v5 contentView];
    [v18 addSubview:v17];

    [(EKUIInviteesViewTimeSlotCell *)v5 setShowPreviewButton:v17];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v5 action:sel__andMoreTapped_];
    [v19 setDelegate:v5];
    v20 = [(EKUIInviteesViewTimeSlotCell *)v5 contentView];
    [v20 addGestureRecognizer:v19];

    [(EKUIInviteesViewTimeSlotCell *)v5 setTappedMoreRecognizer:v19];
    v21 = +[EKUIDebugPreferences shared];
    int v22 = [v21 showInviteesAndMoreRegion];

    if (v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v16 addSubview:v23];
      [(EKUIInviteesViewTimeSlotCell *)v5 setAndMoreDebugOverlay:v23];
    }
    [(EKUIInviteesViewTimeSlotCell *)v5 _resetFonts];
    [(EKUIInviteesViewTimeSlotCell *)v5 _resetPreferredMaxLayoutWidths];
    [(EKUIInviteesViewTimeSlotCell *)v5 setUpdateFontBasedConstraints:1];
    [(EKUIInviteesViewTimeSlotCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(EKUIInviteesViewTimeSlotCell *)self tappedMoreRecognizer];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  [(EKUIInviteesViewTimeSlotCell *)&v4 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(EKUIInviteesViewTimeSlotCell *)self frame];
  double v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  -[EKUIInviteesViewTimeSlotCell setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if (vabdd_f64(v9, width) >= 2.22044605e-16) {
    [(EKUIInviteesViewTimeSlotCell *)self _resetPreferredMaxLayoutWidths];
  }
}

- (void)updateConstraints
{
  v3 = [(EKUIInviteesViewTimeSlotCell *)self persistentConstraints];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = (void *)MEMORY[0x1E4F28DC8];
    double v6 = [(EKUIInviteesViewTimeSlotCell *)self checkmarkImageView];
    v7 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    double v8 = [v5 constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v7 attribute:17 multiplier:1.0 constant:20.0];
    [v4 addObject:v8];

    double v9 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v10 = [(EKUIInviteesViewTimeSlotCell *)self checkmarkImageView];
    id v11 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    id v12 = [v9 constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v11 attribute:10 multiplier:1.0 constant:0.0];
    [v4 addObject:v12];

    id v13 = (void *)MEMORY[0x1E4F28DC8];
    id v14 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    id v15 = [(EKUIInviteesViewTimeSlotCell *)self checkmarkImageView];
    v16 = [v13 constraintWithItem:v14 attribute:5 relatedBy:0 toItem:v15 attribute:9 multiplier:1.0 constant:30.0];
    [v4 addObject:v16];

    v17 = (void *)MEMORY[0x1E4F28DC8];
    v18 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v19 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [(id)objc_opt_class() _rightBuffer];
    v21 = [v17 constraintWithItem:v18 attribute:6 relatedBy:0 toItem:v19 attribute:6 multiplier:1.0 constant:-v20];
    [v4 addObject:v21];

    int v22 = (void *)MEMORY[0x1E4F28DC8];
    id v23 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    v24 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v25 = [v22 constraintWithItem:v23 attribute:5 relatedBy:0 toItem:v24 attribute:5 multiplier:1.0 constant:0.0];
    [v4 addObject:v25];

    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    v28 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [(id)objc_opt_class() _rightBuffer];
    objc_super v30 = [v26 constraintWithItem:v27 attribute:6 relatedBy:0 toItem:v28 attribute:6 multiplier:1.0 constant:-v29];
    [v4 addObject:v30];

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    v33 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v34 = [v31 constraintWithItem:v32 attribute:5 relatedBy:0 toItem:v33 attribute:5 multiplier:1.0 constant:0.0];
    [v4 addObject:v34];

    v35 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    v37 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [(id)objc_opt_class() _rightBuffer];
    v39 = [v35 constraintWithItem:v36 attribute:6 relatedBy:0 toItem:v37 attribute:6 multiplier:1.0 constant:-v38];
    [v4 addObject:v39];

    v40 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v42 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v43 = [v40 constraintWithItem:v41 attribute:5 relatedBy:0 toItem:v42 attribute:5 multiplier:1.0 constant:0.0];
    [v4 addObject:v43];

    v44 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v46 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [(id)objc_opt_class() _rightBuffer];
    v48 = [v44 constraintWithItem:v45 attribute:6 relatedBy:0 toItem:v46 attribute:6 multiplier:1.0 constant:-v47];
    [v4 addObject:v48];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    v51 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v52 = [v49 constraintWithItem:v50 attribute:5 relatedBy:0 toItem:v51 attribute:5 multiplier:1.0 constant:0.0];
    [v4 addObject:v52];

    v53 = (void *)MEMORY[0x1E4F28DC8];
    v54 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    v55 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [(id)objc_opt_class() _rightBuffer];
    v57 = [v53 constraintWithItem:v54 attribute:6 relatedBy:0 toItem:v55 attribute:6 multiplier:1.0 constant:-v56];
    [v4 addObject:v57];

    v58 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    v60 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    v61 = [v58 constraintWithItem:v59 attribute:4 relatedBy:-1 toItem:v60 attribute:4 multiplier:1.0 constant:0.0];
    [v4 addObject:v61];

    v62 = (void *)MEMORY[0x1E4F28DC8];
    v63 = [(EKUIInviteesViewTimeSlotCell *)self showPreviewButton];
    v64 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    v65 = [v62 constraintWithItem:v63 attribute:6 relatedBy:0 toItem:v64 attribute:6 multiplier:1.0 constant:-16.0];
    [v4 addObject:v65];

    v66 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [(EKUIInviteesViewTimeSlotCell *)self showPreviewButton];
    v68 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    v69 = [v66 constraintWithItem:v67 attribute:10 relatedBy:0 toItem:v68 attribute:10 multiplier:1.0 constant:0.0];
    [v4 addObject:v69];

    v70 = (void *)MEMORY[0x1E4F28DC8];
    v71 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v72 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    v73 = [v70 constraintWithItem:v71 attribute:12 relatedBy:0 toItem:v72 attribute:3 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setTopTimeLabelToTopContentViewConstraint:v73];

    v74 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabelToTopContentViewConstraint];
    [v4 addObject:v74];

    v75 = (void *)MEMORY[0x1E4F28DC8];
    v76 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    v77 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v78 = [v75 constraintWithItem:v76 attribute:12 relatedBy:0 toItem:v77 attribute:11 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setBottomTimeLabelToTopTimeLabelConstraint:v78];

    v79 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabelToTopTimeLabelConstraint];
    [v4 addObject:v79];

    v80 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    v82 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    v83 = [v80 constraintWithItem:v81 attribute:12 relatedBy:0 toItem:v82 attribute:11 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setTimeZoneTimeLabelToBottomTimeLabelConstraint:v83];

    v84 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabelToBottomTimeLabelConstraint];
    [v4 addObject:v84];

    v85 = (void *)MEMORY[0x1E4F28DC8];
    v86 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v87 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    v88 = [v85 constraintWithItem:v86 attribute:12 relatedBy:0 toItem:v87 attribute:11 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setProposedTimeLabelToBottomTimeLabelConstraint:v88];

    v89 = [(EKUIInviteesViewTimeSlotCell *)self proposedTimeLabelToBottomTimeLabelConstraint];
    [v4 addObject:v89];

    v90 = (void *)MEMORY[0x1E4F28DC8];
    v91 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    v92 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v93 = [v90 constraintWithItem:v91 attribute:12 relatedBy:0 toItem:v92 attribute:11 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setParticipantsViewToBottomTimeLabelConstraint:v93];

    v94 = [(EKUIInviteesViewTimeSlotCell *)self participantsViewToBottomTimeLabelConstraint];
    [v4 addObject:v94];

    v95 = (void *)MEMORY[0x1E4F28DC8];
    v96 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    v97 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    v98 = [v95 constraintWithItem:v96 attribute:4 relatedBy:1 toItem:v97 attribute:11 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setParticipantsViewToContentViewConstraint:v98];

    v99 = [(EKUIInviteesViewTimeSlotCell *)self participantsViewToContentViewConstraint];
    [v4 addObject:v99];

    v100 = (void *)MEMORY[0x1E4F28DC8];
    v101 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v102 = [v100 constraintWithItem:v101 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setTopTimeLabelHeightConstraint:v102];

    v103 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabelHeightConstraint];
    [v4 addObject:v103];

    v104 = (void *)MEMORY[0x1E4F28DC8];
    v105 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    v106 = [v104 constraintWithItem:v105 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setBottomTimeLabelHeightConstraint:v106];

    v107 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabelHeightConstraint];
    [v4 addObject:v107];

    v108 = (void *)MEMORY[0x1E4F28DC8];
    v109 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    v110 = [v108 constraintWithItem:v109 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setTimeZoneTimeLabelHeightConstraint:v110];

    v111 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabelHeightConstraint];
    [v4 addObject:v111];

    v112 = (void *)MEMORY[0x1E4F28DC8];
    v113 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v114 = [v112 constraintWithItem:v113 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setProposedByMinHeightConstraint:v114];

    v115 = (void *)MEMORY[0x1E4F28DC8];
    v116 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    v117 = [v115 constraintWithItem:v116 attribute:8 relatedBy:-1 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    [(EKUIInviteesViewTimeSlotCell *)self setProposedByMaxHeightConstraint:v117];

    v118 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMinHeightConstraint];
    [v4 addObject:v118];

    v119 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMaxHeightConstraint];
    [v4 addObject:v119];

    v120 = [(EKUIInviteesViewTimeSlotCell *)self contentView];
    [v120 addConstraints:v4];

    [(EKUIInviteesViewTimeSlotCell *)self setPersistentConstraints:v4];
  }
  v121 = [(id)objc_opt_class() _proposedByFont];
  v122 = [(id)objc_opt_class() _timeLabelFont];
  v123 = [(id)objc_opt_class() _participantsTextViewFont];
  if ([(EKUIInviteesViewTimeSlotCell *)self updateFontBasedConstraints])
  {
    [(EKUIInviteesViewTimeSlotCell *)self setUpdateFontBasedConstraints:0];
    [v122 _scaledValueForValue:24.0];
    double v125 = v124;
    v126 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabelToTopContentViewConstraint];
    [v126 setConstant:v125];

    [v122 _scaledValueForValue:22.0];
    double v128 = v127;
    v129 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabelToTopTimeLabelConstraint];
    [v129 setConstant:v128];

    [v122 _scaledValueForValue:22.0];
    double v131 = v130;
    v132 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabelToBottomTimeLabelConstraint];
    [v132 setConstant:v131];

    [v121 _scaledValueForValue:20.0];
    double v134 = v133;
    v135 = [(EKUIInviteesViewTimeSlotCell *)self proposedTimeLabelToBottomTimeLabelConstraint];
    [v135 setConstant:v134];

    [v123 _scaledValueForValue:20.0];
    double v137 = v136;
    v138 = [(EKUIInviteesViewTimeSlotCell *)self participantsViewToBottomTimeLabelConstraint];
    [v138 setConstant:v137];

    [v122 _scaledValueForValue:12.0];
    double v140 = v139;
    v141 = [(EKUIInviteesViewTimeSlotCell *)self participantsViewToContentViewConstraint];
    [v141 setConstant:v140];

    [v122 lineHeight];
    double v143 = v142;
    v144 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabelHeightConstraint];
    [v144 setConstant:v143];

    [v122 lineHeight];
    double v146 = v145;
    v147 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabelHeightConstraint];
    [v147 setConstant:v146];
  }
  if ([(EKUIInviteesViewTimeSlotCell *)self _shouldDisplayTimeZone])
  {
    [v122 lineHeight];
    double v149 = v148;
    v150 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabelHeightConstraint];
    v151 = v150;
    double v152 = v149;
  }
  else
  {
    v150 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabelHeightConstraint];
    v151 = v150;
    double v152 = 0.0;
  }
  [v150 setConstant:v152];

  v153 = [(EKUIInviteesViewTimeSlotCell *)self proposedBy];
  uint64_t v154 = [v153 count];

  if (v154)
  {
    [v121 lineHeight];
    double v156 = v155;
    v157 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMinHeightConstraint];
    [v157 setConstant:v156];

    [v121 lineHeight];
    double v159 = v158 * 4.0;
    v160 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMaxHeightConstraint];
    v161 = v160;
    double v162 = v159;
  }
  else
  {
    v163 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMinHeightConstraint];
    [v163 setConstant:0.0];

    v160 = [(EKUIInviteesViewTimeSlotCell *)self proposedByMaxHeightConstraint];
    v161 = v160;
    double v162 = 0.0;
  }
  [v160 setConstant:v162];

  v164.receiver = self;
  v164.super_class = (Class)EKUIInviteesViewTimeSlotCell;
  [(EKUIInviteesViewTimeSlotCell *)&v164 updateConstraints];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  [(EKUIInviteesViewTimeSlotCell *)self andMoreBoundingRect];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  if (CGRectIsNull(v18))
  {
    BOOL v10 = 0;
  }
  else
  {
    id v11 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    [v5 locationInView:v11];
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    v17.CGFloat x = v13;
    v17.CGFloat y = v15;
    BOOL v10 = CGRectContainsPoint(v19, v17);
  }

  return v10;
}

- (void)updateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 busyParticipants:(id)a6 showAllParticipants:(BOOL)a7 checked:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  [(EKUIInviteesViewTimeSlotCell *)self setStartDate:a3];
  [(EKUIInviteesViewTimeSlotCell *)self setEndDate:v16];

  [(EKUIInviteesViewTimeSlotCell *)self setTimeZone:v15];
  [(EKUIInviteesViewTimeSlotCell *)self setBusyParticipants:v14];

  [(EKUIInviteesViewTimeSlotCell *)self setShowAllParticipants:v9];
  [(EKUIInviteesViewTimeSlotCell *)self setChecked:v8];
  [(EKUIInviteesViewTimeSlotCell *)self _resetTimeTextIfNeeded];

  [(EKUIInviteesViewTimeSlotCell *)self _resetParticipantsTextIfNeeded];
}

- (UIColor)participantsTextColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

- (UIColor)timeTextColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

- (void)setProposedBy:(id)a3
{
  id v25 = a3;
  objc_storeStrong((id *)&self->_proposedBy, a3);
  if ([v25 count] == 1)
  {
    id v5 = NSString;
    double v6 = EventKitUIBundle();
    v7 = [v6 localizedStringForKey:@"Proposed by %@" value:&stru_1F0CC2140 table:0];
    BOOL v8 = [v25 objectAtIndexedSubscript:0];
    BOOL v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
    BOOL v10 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    [v10 setText:v9];

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  if ([v25 count] == 2)
  {
    id v11 = NSString;
    double v6 = EventKitUIBundle();
    v7 = [v6 localizedStringForKey:@"Proposed by %@ and %@" value:&stru_1F0CC2140 table:0];
    BOOL v8 = [v25 objectAtIndexedSubscript:0];
    double v12 = [v25 objectAtIndexedSubscript:1];
    CGFloat v13 = objc_msgSend(v11, "localizedStringWithFormat:", v7, v8, v12);
    id v14 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    [v14 setText:v13];

    goto LABEL_5;
  }
  if ((unint64_t)[v25 count] >= 3)
  {
    id v15 = EventKitUIBundle();
    id v16 = [v15 localizedStringForKey:@"Proposed by " value:&stru_1F0CC2140 table:0];

    if ([v25 count] == 1)
    {
      CGPoint v17 = v16;
    }
    else
    {
      unint64_t v18 = 0;
      do
      {
        CGRect v19 = NSString;
        double v20 = EventKitUIBundle();
        v21 = [v20 localizedStringForKey:@"%@, ", &stru_1F0CC2140, 0 value table];
        int v22 = [v25 objectAtIndexedSubscript:v18];
        id v23 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v22);
        CGPoint v17 = [v16 stringByAppendingString:v23];

        ++v18;
        id v16 = v17;
      }
      while (v18 < [v25 count] - 1);
    }
    v24 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v25, "count") - 1);
    double v6 = [v17 stringByAppendingString:v24];

    v7 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
    [v7 setText:v6];
    goto LABEL_6;
  }
LABEL_7:
  [(EKUIInviteesViewTimeSlotCell *)self updateConstraints];
}

- (void)setStartDate:(id)a3
{
  id v5 = (NSDate *)a3;
  startDate = self->_startDate;
  if (startDate != v5)
  {
    BOOL v8 = v5;
    if (!startDate || (v7 = [(NSDate *)startDate isEqualToDate:v5], id v5 = v8, !v7))
    {
      objc_storeStrong((id *)&self->_startDate, a3);
      [(EKUIInviteesViewTimeSlotCell *)self setUpdateTimeText:1];
      id v5 = v8;
    }
  }
}

- (void)setEndDate:(id)a3
{
  id v5 = (NSDate *)a3;
  endDate = self->_endDate;
  if (endDate != v5)
  {
    BOOL v8 = v5;
    if (!endDate || (v7 = [(NSDate *)endDate isEqualToDate:v5], id v5 = v8, !v7))
    {
      objc_storeStrong((id *)&self->_endDate, a3);
      [(EKUIInviteesViewTimeSlotCell *)self setUpdateTimeText:1];
      id v5 = v8;
    }
  }
}

- (void)setBusyParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_busyParticipants, a3);

  [(EKUIInviteesViewTimeSlotCell *)self setUpdateParticipantsText:1];
}

- (void)setShowAllParticipants:(BOOL)a3
{
  if (self->_showAllParticipants != a3)
  {
    self->_showAllParticipants = a3;
    [(EKUIInviteesViewTimeSlotCell *)self setUpdateParticipantsText:1];
  }
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    BOOL v3 = !a3;
    id v4 = [(EKUIInviteesViewTimeSlotCell *)self checkmarkImageView];
    [v4 setHidden:v3];
  }
}

- (void)setAndMoreBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_andMoreBoundingRect = &self->_andMoreBoundingRect;
  if (!CGRectEqualToRect(self->_andMoreBoundingRect, a3))
  {
    p_andMoreBoundingRect->origin.CGFloat x = x;
    p_andMoreBoundingRect->origin.CGFloat y = y;
    p_andMoreBoundingRect->size.CGFloat width = width;
    p_andMoreBoundingRect->size.CGFloat height = height;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    if (CGRectIsNull(v20))
    {
      double v9 = *MEMORY[0x1E4F1DB28];
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v13 = [(EKUIInviteesViewTimeSlotCell *)self andMoreDebugOverlay];
      id v18 = v13;
      double v14 = v9;
      double v15 = v10;
      double v16 = v11;
      double v17 = v12;
    }
    else
    {
      CGFloat v13 = [(EKUIInviteesViewTimeSlotCell *)self andMoreDebugOverlay];
      id v18 = v13;
      double v14 = x;
      double v15 = y;
      double v16 = width;
      double v17 = height;
    }
    objc_msgSend(v13, "setFrame:", v14, v15, v16, v17);
  }
}

- (void)_showPreviewButtonTapped:(id)a3
{
  id v4 = [(EKUIInviteesViewTimeSlotCell *)self showPreviewOfEventAtTime];

  if (v4)
  {
    BOOL v7 = [(EKUIInviteesViewTimeSlotCell *)self showPreviewOfEventAtTime];
    id v5 = [(EKUIInviteesViewTimeSlotCell *)self startDate];
    double v6 = [(EKUIInviteesViewTimeSlotCell *)self endDate];
    v7[2](v7, v5, v6);
  }
}

- (void)_andMoreTapped:(id)a3
{
  [(EKUIInviteesViewTimeSlotCell *)self setShowAllParticipants:1];
  id v4 = [(EKUIInviteesViewTimeSlotCell *)self _tableView];
  [v4 beginUpdates];

  [(EKUIInviteesViewTimeSlotCell *)self _resetParticipantsTextIfNeeded];
  id v5 = [(EKUIInviteesViewTimeSlotCell *)self _tableView];
  [v5 endUpdates];

  double v6 = [(EKUIInviteesViewTimeSlotCell *)self showAllConflictedParticipantsTapped];

  if (v6)
  {
    BOOL v7 = [(EKUIInviteesViewTimeSlotCell *)self showAllConflictedParticipantsTapped];
    v7[2]();
  }
}

+ (id)_timeLabelFont
{
  return +[EKUIConstrainedFontUtilities constrainedBodyBoldTextLabelFont];
}

+ (id)_proposedByFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)_participantsTextViewFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (double)_leftBuffer
{
  return 66.0;
}

+ (double)_rightBuffer
{
  return 47.0;
}

- (double)_preferredMaxLayoutWidth
{
  [(id)objc_opt_class() _leftBuffer];
  double v4 = v3;
  [(id)objc_opt_class() _rightBuffer];
  double v6 = v4 + v5;
  [(EKUIInviteesViewTimeSlotCell *)self frame];

  CalRoundToScreenScale(v7 - v6);
  return result;
}

- (void)_resetFonts
{
  id v12 = [(id)objc_opt_class() _timeLabelFont];
  double v3 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
  [v3 setFont:v12];

  double v4 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
  [v4 setFont:v12];

  double v5 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
  [v5 setFont:v12];

  double v6 = [(id)objc_opt_class() _proposedByFont];
  double v7 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
  [v7 setFont:v6];

  BOOL v8 = [(EKUIInviteesViewTimeSlotCell *)self labelForTextSizeTesting];
  [v8 setFont:v12];

  double v9 = [(id)objc_opt_class() _participantsTextViewFont];
  double v10 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
  [v10 setFont:v9];

  double v11 = [(EKUIInviteesViewTimeSlotCell *)self textViewForTextSizeTesting];
  [v11 setFont:v9];

  [(EKUIInviteesViewTimeSlotCell *)self setUpdateTimeText:1];
  [(EKUIInviteesViewTimeSlotCell *)self _resetTimeTextIfNeeded];
  [(EKUIInviteesViewTimeSlotCell *)self setUpdateParticipantsText:1];
  [(EKUIInviteesViewTimeSlotCell *)self _resetParticipantsTextIfNeeded];
  [(EKUIInviteesViewTimeSlotCell *)self setUpdateFontBasedConstraints:1];
  [(EKUIInviteesViewTimeSlotCell *)self setNeedsUpdateConstraints];
}

- (void)_resetPreferredMaxLayoutWidths
{
  [(EKUIInviteesViewTimeSlotCell *)self _preferredMaxLayoutWidth];
  double v4 = v3;
  double v5 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
  [v5 setPreferredMaxLayoutWidth:v4];

  double v6 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
  [v6 setPreferredMaxLayoutWidth:v4];

  double v7 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
  [v7 setPreferredMaxLayoutWidth:v4];

  BOOL v8 = [(EKUIInviteesViewTimeSlotCell *)self proposedByLabel];
  [v8 setPreferredMaxLayoutWidth:v4];

  double v9 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
  [v9 _setPreferredMaxLayoutWidth:v4];

  [(EKUIInviteesViewTimeSlotCell *)self setUpdateTimeText:1];
  [(EKUIInviteesViewTimeSlotCell *)self _resetTimeTextIfNeeded];
  [(EKUIInviteesViewTimeSlotCell *)self setUpdateParticipantsText:1];
  [(EKUIInviteesViewTimeSlotCell *)self _resetParticipantsTextIfNeeded];

  [(EKUIInviteesViewTimeSlotCell *)self setNeedsUpdateConstraints];
}

- (BOOL)_shouldDisplayTimeZone
{
  double v3 = [(EKUIInviteesViewTimeSlotCell *)self timeZone];
  if (v3)
  {
    double v4 = [(EKUIInviteesViewTimeSlotCell *)self timeZone];
    double v5 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
    int v6 = [v4 isEquivalentTo:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_resetTimeTextIfNeeded
{
  if ([(EKUIInviteesViewTimeSlotCell *)self updateTimeText])
  {
    [(EKUIInviteesViewTimeSlotCell *)self setUpdateTimeText:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__EKUIInviteesViewTimeSlotCell__resetTimeTextIfNeeded__block_invoke;
    aBlock[3] = &unk_1E608A078;
    aBlock[4] = self;
    double v3 = _Block_copy(aBlock);
    double v4 = [(EKUIInviteesViewTimeSlotCell *)self startDate];
    double v5 = [(EKUIInviteesViewTimeSlotCell *)self endDate];
    int v6 = (void (*)(void *, void *, void *, id *, id *))v3[2];
    id v31 = 0;
    id v32 = 0;
    v6(v3, v4, v5, &v32, &v31);
    id v7 = v32;
    id v8 = v31;

    double v9 = 0;
    if ([(EKUIInviteesViewTimeSlotCell *)self _shouldDisplayTimeZone])
    {
      double v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      double v11 = [(EKUIInviteesViewTimeSlotCell *)self timeZone];
      [v10 setTimeZone:v11];

      id v12 = [(EKUIInviteesViewTimeSlotCell *)self startDate];
      v27 = [v10 components:252 fromDate:v12];

      CGFloat v13 = [(EKUIInviteesViewTimeSlotCell *)self endDate];
      [v10 components:252 fromDate:v13];
      double v14 = v29 = v7;

      double v15 = CUIKCalendar();
      [v15 dateFromComponents:v27];
      double v16 = v28 = v8;

      double v17 = CUIKCalendar();
      id v18 = [v17 dateFromComponents:v14];

      id v30 = 0;
      ((void (*)(void *, void *, void *, void, id *))v3[2])(v3, v16, v18, 0, &v30);
      id v19 = v30;
      CGRect v20 = NSString;
      v21 = [(EKUIInviteesViewTimeSlotCell *)self timeZone];
      int v22 = CUIKShortTZString();
      double v9 = [v20 stringWithFormat:@"%@ (%@)", v19, v22];

      id v8 = v28;
      id v7 = v29;
    }
    id v23 = [(EKUIInviteesViewTimeSlotCell *)self topTimeLabel];
    v24 = [(EKUIInviteesViewTimeSlotCell *)self bottomTimeLabel];
    id v25 = [(EKUIInviteesViewTimeSlotCell *)self timeZoneTimeLabel];
    [v23 setText:v7];
    [v24 setText:v8];
    [v25 setText:v9];
    v26 = [(EKUIInviteesViewTimeSlotCell *)self timeTextColor];
    [v23 setTextColor:v26];
    [v24 setTextColor:v26];
    [v25 setTextColor:v26];
  }
}

void __54__EKUIInviteesViewTimeSlotCell__resetTimeTextIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v29 = a2;
  id v9 = a3;
  if (v29)
  {
    if (v9)
    {
      [*(id *)(a1 + 32) frame];
      if (fabs(v10) >= 2.22044605e-16)
      {
        double v11 = [MEMORY[0x1E4F1C9C8] date];
        id v12 = CUIKCalendar();
        int v13 = [v12 isDate:v29 equalToDate:v11 toUnitGranularity:4];

        double v14 = CUIKCalendar();
        int v15 = [v14 isDate:v29 inSameDayAsDate:v9];

        if (!v15)
        {
          CGRect v20 = EventKitUIBundle();
          v21 = [v20 localizedStringForKey:@"%@ -" value:&stru_1F0CC2140 table:0];

          if (a4) {
            int v22 = v13;
          }
          else {
            int v22 = 1;
          }
          if (v22 == 1)
          {
            id v23 = CUIKLongStringForDateAndTime();
            v24 = CUIKLongStringForDateAndTime();
            if (a4)
            {
              *a4 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v21, v23);
              CUIKLongStringForDateAndTime();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else if (a5)
            {
              v27 = EventKitUIBundle();
              id v28 = [v27 localizedStringForKey:@"%@ - %@" value:&stru_1F0CC2140 table:0];

              *a5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v28, v23, v24);
            }
          }
          else
          {
            id v23 = CUIKStringMonthDayYearTime();
            *a4 = (id)objc_msgSend([NSString alloc], "initWithFormat:", v21, v23);
            if (a5)
            {
              CUIKStringMonthDayYearTime();
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

          goto LABEL_29;
        }
        if (a4)
        {
          if (v13)
          {
            CUIKStringForWeekdayNoYear();
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            *a4 = v16;
            if (([*(id *)(a1 + 32) _textWillFit:v16] & 1) == 0)
            {
              CUIKLongDayStringForDateNoYear();
              id v17 = (id)objc_claimAutoreleasedReturnValue();
              *a4 = v17;
              if (([*(id *)(a1 + 32) _textWillFit:v17] & 1) == 0)
              {
                CUIKStringForDateAndDayOfWeekInCalendarTimezone();
                id v18 = (id)objc_claimAutoreleasedReturnValue();
                *a4 = v18;
                if (([*(id *)(a1 + 32) _textWillFit:v18] & 1) == 0)
                {
                  id v19 = CUIKStringForDate();
LABEL_22:
                  *a4 = v19;
                }
              }
            }
          }
          else
          {
            CUIKLongDayStringForDate();
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            *a4 = v25;
            if (([*(id *)(a1 + 32) _textWillFit:v25] & 1) == 0)
            {
              CUIKStringForDateAndDayOfWeekInCalendarTimezone();
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              *a4 = v26;
              if (([*(id *)(a1 + 32) _textWillFit:v26] & 1) == 0)
              {
                id v19 = CUIKStringMonthDayYearWithComma();
                goto LABEL_22;
              }
            }
          }
        }
        if (a5)
        {
          CUIKTimeIntervalStringForDates();
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_29:
      }
    }
  }
}

- (void)_resetParticipantsTextIfNeeded
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if ([(EKUIInviteesViewTimeSlotCell *)self updateParticipantsText])
  {
    [(EKUIInviteesViewTimeSlotCell *)self setUpdateParticipantsText:0];
    -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](self, "setAndMoreBoundingRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(EKUIInviteesViewTimeSlotCell *)self frame];
    if (fabs(v3) < 2.22044605e-16 || [(EKUIInviteesViewTimeSlotCell *)self searchInProgress])
    {
      double v4 = 0;
    }
    else
    {
      if ([(EKUIInviteesViewTimeSlotCell *)self _everyoneCanAttend])
      {
        id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
        int v6 = EventKitUIBundle();
        id v7 = [v6 localizedStringForKey:@"Everyone can attend" value:&stru_1F0CC2140 table:0];
        v13[0] = *MEMORY[0x1E4FB0700];
        id v8 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextColor];
        v14[0] = v8;
        v13[1] = *MEMORY[0x1E4FB06F8];
        id v9 = [(id)objc_opt_class() _participantsTextViewFont];
        v14[1] = v9;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
        double v4 = (void *)[v5 initWithString:v7 attributes:v10];
      }
      else
      {
        double v11 = [(EKUIInviteesViewTimeSlotCell *)self busyParticipants];
        int v6 = [v11 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_44];

        if ([(EKUIInviteesViewTimeSlotCell *)self showAllParticipants]) {
          [(EKUIInviteesViewTimeSlotCell *)self _generateStringForAllParticipants:v6];
        }
        else {
        double v4 = [(EKUIInviteesViewTimeSlotCell *)self _generateStringForSomeParticipantsAndStampMoreBoundingRect:v6];
        }
      }
    }
    id v12 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextView];
    [v12 setAttributedText:v4];
  }
}

uint64_t __62__EKUIInviteesViewTimeSlotCell__resetParticipantsTextIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_generateStringForAllParticipants:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  double v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextColor];
  id v8 = [(id)objc_opt_class() _interParticipantSpacing];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__EKUIInviteesViewTimeSlotCell__generateStringForAllParticipants___block_invoke;
  v17[3] = &unk_1E608A0A0;
  id v9 = v6;
  id v18 = v9;
  id v19 = v8;
  CGRect v20 = self;
  v21 = v7;
  id v10 = v7;
  id v11 = v8;
  [v5 enumerateObjectsUsingBlock:v17];

  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  id v12 = [(id)objc_opt_class() _participantsTextViewFont];
  v23[0] = v12;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  objc_msgSend(v9, "addAttributes:range:", v13, 0, objc_msgSend(v9, "length"));

  double v14 = v21;
  id v15 = v9;

  return v15;
}

void __66__EKUIInviteesViewTimeSlotCell__generateStringForAllParticipants___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 48) _textForParticipant:v6 color:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) appendAttributedString:v5];
}

- (id)_generateStringForSomeParticipantsAndStampMoreBoundingRect:(id)a3
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  double v4 = [(EKUIInviteesViewTimeSlotCell *)self participantsTextColor];
  id v5 = [(id)objc_opt_class() _interParticipantSpacing];
  v37 = [(id)objc_opt_class() _andMoreLeftSpacing];
  unint64_t v6 = [v38 count];
  id v7 = [(EKUIInviteesViewTimeSlotCell *)self textViewForTextSizeTesting];
  [(EKUIInviteesViewTimeSlotCell *)self _preferredMaxLayoutWidth];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v8, 0.0);
  uint64_t v66 = *MEMORY[0x1E4FB0700];
  id v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v67[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];

  id v11 = [v7 layoutManager];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__15;
  v62 = __Block_byref_object_dispose__15;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__15;
  double v56 = __Block_byref_object_dispose__15;
  id v57 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __91__EKUIInviteesViewTimeSlotCell__generateStringForSomeParticipantsAndStampMoreBoundingRect___block_invoke;
  v39[3] = &unk_1E608A0C8;
  id v36 = v12;
  id v40 = v36;
  id v35 = v5;
  id v41 = v35;
  v42 = self;
  id v34 = v4;
  id v43 = v34;
  unint64_t v50 = v6 - 1;
  unint64_t v51 = v6;
  id v13 = v10;
  id v44 = v13;
  id v14 = v37;
  id v45 = v14;
  id v15 = v7;
  id v46 = v15;
  id v16 = v11;
  id v47 = v16;
  v48 = &v52;
  v49 = &v58;
  [v38 enumerateObjectsUsingBlock:v39];
  id v17 = (void *)v53[5];
  uint64_t v64 = *MEMORY[0x1E4FB06F8];
  id v18 = [(id)objc_opt_class() _participantsTextViewFont];
  v65 = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  objc_msgSend(v17, "addAttributes:range:", v19, 0, objc_msgSend((id)v53[5], "length"));

  [v15 setAttributedText:v53[5]];
  double v20 = *MEMORY[0x1E4F1DB20];
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v6 >= 2 && v59[5])
  {
    uint64_t v24 = [(id)v53[5] length];
    uint64_t v25 = objc_msgSend(v16, "glyphIndexForCharacterAtIndex:", v24 - objc_msgSend((id)v59[5], "length"));
    uint64_t v26 = [v16 numberOfGlyphs];
    v27 = [v15 textContainer];
    objc_msgSend(v16, "boundingRectForGlyphRange:inTextContainer:", v25, v26 - v25, v27);
    double v20 = v28;
    double v21 = v29;
    double v22 = v30;
    double v23 = v31;
  }
  -[EKUIInviteesViewTimeSlotCell setAndMoreBoundingRect:](self, "setAndMoreBoundingRect:", v20, v21, v22, v23);
  id v32 = (id)v53[5];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

void __91__EKUIInviteesViewTimeSlotCell__generateStringForSomeParticipantsAndStampMoreBoundingRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 40)];
  }
  double v8 = [*(id *)(a1 + 48) _textForParticipant:v7 color:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) appendAttributedString:v8];
  if (*(void *)(a1 + 112) == a3)
  {
    id v9 = *(id *)(a1 + 32);
    id v10 = 0;
  }
  else
  {
    id v10 = [(id)objc_opt_class() _generateAndMoreStringWithCount:*(void *)(a1 + 120) + ~a3 attributes:*(void *)(a1 + 64)];
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:*(void *)(a1 + 32)];
    [v9 appendAttributedString:*(void *)(a1 + 72)];
    [v9 appendAttributedString:v10];
  }
  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  id v11 = [(id)objc_opt_class() _participantsTextViewFont];
  v23[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  objc_msgSend(v9, "addAttributes:range:", v12, 0, objc_msgSend(v9, "length"));

  [*(id *)(a1 + 80) setAttributedText:v9];
  if ([(id)objc_opt_class() _layoutManagerReportsExcessLines:*(void *)(a1 + 88)])
  {
    *a4 = 1;
    if (*(void *)(a1 + 120) == 1)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v9);
      uint64_t v13 = *(void *)(*(void *)(a1 + 104) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;
    }
    else
    {
      if (a3) {
        goto LABEL_11;
      }
      id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
      id v18 = EventKitUIBundle();
      id v19 = [v18 localizedStringForKey:@"Show All…" value:&stru_1F0CC2140 table:0];
      double v20 = (void *)[v17 initWithString:v19 attributes:*(void *)(a1 + 64)];

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v20);
      uint64_t v21 = *(void *)(*(void *)(a1 + 104) + 8);
      id v14 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v9);
    uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
    id v16 = v10;
    id v14 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }

LABEL_11:
}

+ (BOOL)_layoutManagerReportsExcessLines:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = [v3 numberOfGlyphs];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__EKUIInviteesViewTimeSlotCell__layoutManagerReportsExcessLines___block_invoke;
  v7[3] = &unk_1E608A0F0;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(v3, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v7);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __65__EKUIInviteesViewTimeSlotCell__layoutManagerReportsExcessLines___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= 3uLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (id)_textForParticipant:(id)a3 color:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [(EKUIInviteesViewTimeSlotCell *)self _busyImageAttributedStringForColor:v6];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v8];
  id v10 = objc_opt_class();
  uint64_t v11 = [v7 displayName];

  char v12 = [v10 _replaceSpacesWithNonBreakingSpaces:v11];

  id v13 = [NSString alloc];
  id v14 = [(id)objc_opt_class() _nonBreakingSpace];
  uint64_t v15 = (void *)[v13 initWithFormat:@"%@%@", v14, v12];

  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v20 = *MEMORY[0x1E4FB0700];
  v21[0] = v6;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  id v18 = (void *)[v16 initWithString:v15 attributes:v17];
  [v9 appendAttributedString:v18];

  return v9;
}

- (id)_busyImageAttributedStringForColor:(id)a3
{
  id v4 = a3;
  char v5 = [(EKUIInviteesViewTimeSlotCell *)self colorToBusyImageAttributedString];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(EKUIInviteesViewTimeSlotCell *)self setColorToBusyImageAttributedString:v6];
  }
  id v7 = [(EKUIInviteesViewTimeSlotCell *)self colorToBusyImageAttributedString];
  double v8 = [v7 objectForKey:v4];

  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle" withConfiguration:v9];
    uint64_t v11 = [v10 imageWithTintColor:v4 renderingMode:1];

    char v12 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v11];
    double v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v12];
    id v13 = [(EKUIInviteesViewTimeSlotCell *)self colorToBusyImageAttributedString];
    [v13 setObject:v8 forKey:v4];
  }

  return v8;
}

- (BOOL)_textWillFit:(id)a3
{
  id v4 = a3;
  char v5 = [(EKUIInviteesViewTimeSlotCell *)self labelForTextSizeTesting];
  [v5 setText:v4];

  [v5 sizeToFit];
  [v5 frame];
  double v7 = v6;
  [(EKUIInviteesViewTimeSlotCell *)self _preferredMaxLayoutWidth];
  LOBYTE(self) = v7 <= v8;

  return (char)self;
}

+ (id)_generateAndMoreStringWithCount:(unint64_t)a3 attributes:(id)a4
{
  id v4 = a4;
  char v5 = CUIKLocalizedStringForInteger();
  double v6 = NSString;
  double v7 = EventKitUIBundle();
  double v8 = [v7 localizedStringForKey:@"& %@ more…" value:&stru_1F0CC2140 table:0];
  uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);

  id v10 = [(id)objc_opt_class() _replaceSpacesWithNonBreakingSpaces:v9];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10 attributes:v4];

  return v11;
}

+ (id)_replaceSpacesWithNonBreakingSpaces:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _nonBreakingSpace];
  char v5 = [v3 stringByReplacingOccurrencesOfString:@" " withString:v4];

  return v5;
}

+ (id)_nonBreakingSpace
{
  return @" ";
}

+ (id)_interParticipantSpacing
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"   "];

  return v2;
}

+ (id)_andMoreLeftSpacing
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];

  return v2;
}

- (BOOL)_everyoneCanAttend
{
  v2 = [(EKUIInviteesViewTimeSlotCell *)self busyParticipants];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

+ (id)_generateParticipantTextView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  id v3 = objc_msgSend(v2, "initWithFrame:textContainer:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  BOOL v4 = [v3 layoutManager];
  [v4 setLimitsLayoutForSuspiciousContents:1];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v5];

  [v3 setUserInteractionEnabled:0];
  [v3 setScrollEnabled:0];
  [v3 setSelectable:0];
  [v3 setEditable:0];
  double v6 = [v3 textContainer];
  [v6 setLineFragmentPadding:0.0];

  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v3;
}

+ (void)_setRequiredHuggingAndCompression:(id)a3
{
  id v7 = a3;
  LODWORD(v3) = 1148846080;
  [v7 setContentHuggingPriority:0 forAxis:v3];
  LODWORD(v4) = 1148846080;
  [v7 setContentHuggingPriority:1 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v7 setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v7 setContentCompressionResistancePriority:1 forAxis:v6];
}

- (id)showPreviewOfEventAtTime
{
  return self->_showPreviewOfEventAtTime;
}

- (void)setShowPreviewOfEventAtTime:(id)a3
{
}

- (id)showAllConflictedParticipantsTapped
{
  return self->_showAllConflictedParticipantsTapped;
}

- (void)setShowAllConflictedParticipantsTapped:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (NSDictionary)andMoreStringCache
{
  return self->_andMoreStringCache;
}

- (void)setAndMoreStringCache:(id)a3
{
}

- (NSArray)proposedBy
{
  return self->_proposedBy;
}

- (BOOL)searchInProgress
{
  return self->_searchInProgress;
}

- (void)setSearchInProgress:(BOOL)a3
{
  self->_searchInProgress = a3;
}

- (UILabel)labelForTextSizeTesting
{
  return self->_labelForTextSizeTesting;
}

- (void)setLabelForTextSizeTesting:(id)a3
{
}

- (UITextView)textViewForTextSizeTesting
{
  return self->_textViewForTextSizeTesting;
}

- (void)setTextViewForTextSizeTesting:(id)a3
{
}

- (UILabel)topTimeLabel
{
  return self->_topTimeLabel;
}

- (void)setTopTimeLabel:(id)a3
{
}

- (UILabel)bottomTimeLabel
{
  return self->_bottomTimeLabel;
}

- (void)setBottomTimeLabel:(id)a3
{
}

- (UILabel)timeZoneTimeLabel
{
  return self->_timeZoneTimeLabel;
}

- (void)setTimeZoneTimeLabel:(id)a3
{
}

- (UILabel)proposedByLabel
{
  return self->_proposedByLabel;
}

- (void)setProposedByLabel:(id)a3
{
}

- (UIView)andMoreDebugOverlay
{
  return self->_andMoreDebugOverlay;
}

- (void)setAndMoreDebugOverlay:(id)a3
{
}

- (UITextView)participantsTextView
{
  return self->_participantsTextView;
}

- (void)setParticipantsTextView:(id)a3
{
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (UIButton)showPreviewButton
{
  return self->_showPreviewButton;
}

- (void)setShowPreviewButton:(id)a3
{
}

- (NSArray)persistentConstraints
{
  return self->_persistentConstraints;
}

- (void)setPersistentConstraints:(id)a3
{
}

- (NSMutableDictionary)colorToBusyImageAttributedString
{
  return self->_colorToBusyImageAttributedString;
}

- (void)setColorToBusyImageAttributedString:(id)a3
{
}

- (NSLayoutConstraint)topTimeLabelToTopContentViewConstraint
{
  return self->_topTimeLabelToTopContentViewConstraint;
}

- (void)setTopTimeLabelToTopContentViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomTimeLabelToTopTimeLabelConstraint
{
  return self->_bottomTimeLabelToTopTimeLabelConstraint;
}

- (void)setBottomTimeLabelToTopTimeLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeZoneTimeLabelToBottomTimeLabelConstraint
{
  return self->_timeZoneTimeLabelToBottomTimeLabelConstraint;
}

- (void)setTimeZoneTimeLabelToBottomTimeLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)proposedTimeLabelToBottomTimeLabelConstraint
{
  return self->_proposedTimeLabelToBottomTimeLabelConstraint;
}

- (void)setProposedTimeLabelToBottomTimeLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewToBottomTimeLabelConstraint
{
  return self->_participantsViewToBottomTimeLabelConstraint;
}

- (void)setParticipantsViewToBottomTimeLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)participantsViewToContentViewConstraint
{
  return self->_participantsViewToContentViewConstraint;
}

- (void)setParticipantsViewToContentViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)topTimeLabelHeightConstraint
{
  return self->_topTimeLabelHeightConstraint;
}

- (void)setTopTimeLabelHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomTimeLabelHeightConstraint
{
  return self->_bottomTimeLabelHeightConstraint;
}

- (void)setBottomTimeLabelHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)timeZoneTimeLabelHeightConstraint
{
  return self->_timeZoneTimeLabelHeightConstraint;
}

- (void)setTimeZoneTimeLabelHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)proposedByMinHeightConstraint
{
  return self->_proposedByMinHeightConstraint;
}

- (void)setProposedByMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)proposedByMaxHeightConstraint
{
  return self->_proposedByMaxHeightConstraint;
}

- (void)setProposedByMaxHeightConstraint:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)updateFontBasedConstraints
{
  return self->_updateFontBasedConstraints;
}

- (void)setUpdateFontBasedConstraints:(BOOL)a3
{
  self->_updateFontBasedConstraints = a3;
}

- (BOOL)updateTimeText
{
  return self->_updateTimeText;
}

- (void)setUpdateTimeText:(BOOL)a3
{
  self->_updateTimeText = a3;
}

- (BOOL)updateParticipantsText
{
  return self->_updateParticipantsText;
}

- (void)setUpdateParticipantsText:(BOOL)a3
{
  self->_updateParticipantsText = a3;
}

- (BOOL)showAllParticipants
{
  return self->_showAllParticipants;
}

- (NSArray)busyParticipants
{
  return self->_busyParticipants;
}

- (UITapGestureRecognizer)tappedMoreRecognizer
{
  return self->_tappedMoreRecognizer;
}

- (void)setTappedMoreRecognizer:(id)a3
{
}

- (CGRect)andMoreBoundingRect
{
  double x = self->_andMoreBoundingRect.origin.x;
  double y = self->_andMoreBoundingRect.origin.y;
  double width = self->_andMoreBoundingRect.size.width;
  double height = self->_andMoreBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tappedMoreRecognizer, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_proposedByMaxHeightConstraint, 0);
  objc_storeStrong((id *)&self->_proposedByMinHeightConstraint, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topTimeLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_participantsViewToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_proposedTimeLabelToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabelToBottomTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabelToTopTimeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_topTimeLabelToTopContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_colorToBusyImageAttributedString, 0);
  objc_storeStrong((id *)&self->_persistentConstraints, 0);
  objc_storeStrong((id *)&self->_showPreviewButton, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_participantsTextView, 0);
  objc_storeStrong((id *)&self->_andMoreDebugOverlay, 0);
  objc_storeStrong((id *)&self->_proposedByLabel, 0);
  objc_storeStrong((id *)&self->_timeZoneTimeLabel, 0);
  objc_storeStrong((id *)&self->_bottomTimeLabel, 0);
  objc_storeStrong((id *)&self->_topTimeLabel, 0);
  objc_storeStrong((id *)&self->_textViewForTextSizeTesting, 0);
  objc_storeStrong((id *)&self->_labelForTextSizeTesting, 0);
  objc_storeStrong((id *)&self->_proposedBy, 0);
  objc_storeStrong((id *)&self->_andMoreStringCache, 0);
  objc_storeStrong(&self->_showAllConflictedParticipantsTapped, 0);

  objc_storeStrong(&self->_showPreviewOfEventAtTime, 0);
}

@end