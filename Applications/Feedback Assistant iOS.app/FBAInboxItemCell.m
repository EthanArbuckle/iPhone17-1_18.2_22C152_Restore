@interface FBAInboxItemCell
- (NSLayoutConstraint)unreadImageViewHeightConstraint;
- (UIImageView)fauxAccessoryView;
- (UIImageView)orphanImageView;
- (UIImageView)unreadImageView;
- (UILabel)closedLabel;
- (UILabel)dateLabel;
- (UILabel)subtitleLabel;
- (UILabel)teamInfoLabel;
- (UILabel)titleLabel;
- (void)awakeFromNib;
- (void)setClosedLabel:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setFauxAccessoryView:(id)a3;
- (void)setOrphanImageView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTeamInfoLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUnreadImageView:(id)a3;
- (void)setUnreadImageViewHeightConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLabelLinesForContentSizeCategory:(id)a3;
- (void)updateWithEnhancedLoggingSession:(id)a3;
- (void)updateWithItem:(id)a3 showingTeamName:(BOOL)a4;
@end

@implementation FBAInboxItemCell

- (void)awakeFromNib
{
  v10.receiver = self;
  v10.super_class = (Class)FBAInboxItemCell;
  [(FBAInboxItemCell *)&v10 awakeFromNib];
  v3 = +[UIColor secondaryLabelColor];
  v4 = [(FBAInboxItemCell *)self fauxAccessoryView];
  [v4 setTintColor:v3];

  v5 = [(FBAInboxItemCell *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(FBAInboxItemCell *)self subtitleLabel];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(FBAInboxItemCell *)self teamInfoLabel];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(FBAInboxItemCell *)self unreadImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(FBAInboxItemCell *)self orphanImageView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)updateWithItem:(id)a3 showingTeamName:(BOOL)a4
{
  BOOL v4 = a4;
  id v53 = a3;
  v6 = [v53 displayTitle];
  v7 = [(FBAInboxItemCell *)self titleLabel];
  [v7 setText:v6];

  v8 = [v53 imageForNeedsAction];
  v9 = [(FBAInboxItemCell *)self unreadImageView];
  [v9 setImage:v8];

  uint64_t v10 = [v53 needsAction] ^ 1;
  v11 = [(FBAInboxItemCell *)self unreadImageView];
  [v11 setHidden:v10];

  v12 = [v53 needsActionTintColor];
  v13 = [(FBAInboxItemCell *)self unreadImageView];
  [v13 setTintColor:v12];

  uint64_t v14 = [v53 isOrphaned] ^ 1;
  v15 = [(FBAInboxItemCell *)self orphanImageView];
  [v15 setHidden:v14];

  v16 = [v53 orphanBadgeTintColor];
  v17 = [(FBAInboxItemCell *)self orphanImageView];
  [v17 setTintColor:v16];

  v18 = [(FBAInboxItemCell *)self traitCollection];
  v19 = [v18 preferredContentSizeCategory];
  [(FBAInboxItemCell *)self updateLabelLinesForContentSizeCategory:v19];

  v20 = [v53 itemSubtitle];
  id v21 = [(__CFString *)v20 length];
  v22 = [(FBAInboxItemCell *)self subtitleLabel];
  v23 = v22;
  if (v21) {
    CFStringRef v24 = v20;
  }
  else {
    CFStringRef v24 = @" ";
  }
  [v22 setText:v24];

  if ([v53 shouldShowAssigneeLabel])
  {
    v25 = [v53 assignee];
    v26 = [v25 fullName];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      v29 = +[NSBundle mainBundle];
      id v28 = [v29 localizedStringForKey:@"UNASSIGNED" value:&stru_1000F6658 table:FBKCommonStrings];
    }
    if (v4)
    {
      v30 = [v53 singleTeam];
      v31 = [v30 name];
      uint64_t v32 = [v28 stringByAppendingFormat:@", %@", v31];

      id v28 = (id)v32;
    }
    v33 = [(FBAInboxItemCell *)self teamInfoLabel];
    [v33 setText:v28];
  }
  else
  {
    id v28 = [(FBAInboxItemCell *)self teamInfoLabel];
    [v28 setText:0];
  }

  v34 = [v53 formattedMailboxSortDate];
  v35 = [(FBAInboxItemCell *)self dateLabel];
  [v35 setText:v34];

  v36 = sub_100020AE4();
  v37 = [v53 mailboxSortDate];
  v38 = [v36 stringFromDate:v37];
  v39 = [(FBAInboxItemCell *)self dateLabel];
  [v39 setAccessibilityLabel:v38];

  v40 = [v53 visibleFeedbackClosedStatus];
  v41 = [(FBAInboxItemCell *)self closedLabel];
  [v41 setText:v40];

  v42 = [v53 itemTitleColor];
  v43 = [(FBAInboxItemCell *)self titleLabel];
  [v43 setTextColor:v42];

  v44 = [v53 itemTitleColor];
  v45 = [(FBAInboxItemCell *)self teamInfoLabel];
  [v45 setTextColor:v44];

  v46 = +[UIColor secondaryLabelColor];
  v47 = [(FBAInboxItemCell *)self subtitleLabel];
  [v47 setTextColor:v46];

  v48 = +[UIColor secondaryLabelColor];
  v49 = [(FBAInboxItemCell *)self dateLabel];
  [v49 setTextColor:v48];

  v50 = +[UIColor secondaryLabelColor];
  v51 = [(FBAInboxItemCell *)self closedLabel];
  [v51 setTextColor:v50];

  unint64_t v52 = (unint64_t)[(FBAInboxItemCell *)self accessibilityTraits];
  [(FBAInboxItemCell *)self setAccessibilityTraits:UIAccessibilityTraitButton | v52];
}

- (void)updateWithEnhancedLoggingSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [(FBAInboxItemCell *)self titleLabel];
  [v6 setText:v5];

  v7 = [v4 subtitle];
  v8 = [(FBAInboxItemCell *)self subtitleLabel];
  [v8 setText:v7];

  v9 = [(FBAInboxItemCell *)self dateLabel];
  [v9 setText:&stru_1000F6658];

  uint64_t v10 = sub_100020AE4();
  v11 = [v4 updatedAt];

  v12 = [v10 stringFromDate:v11];
  v13 = [(FBAInboxItemCell *)self dateLabel];
  [v13 setAccessibilityLabel:v12];

  [(FBAInboxItemCell *)self setTeamInfoLabel:0];
  uint64_t v14 = [(FBAInboxItemCell *)self traitCollection];
  v15 = [v14 preferredContentSizeCategory];
  [(FBAInboxItemCell *)self updateLabelLinesForContentSizeCategory:v15];

  v16 = [(FBAInboxItemCell *)self closedLabel];
  [v16 setText:0];

  v17 = +[UIColor labelColor];
  v18 = [(FBAInboxItemCell *)self titleLabel];
  [v18 setTextColor:v17];

  v19 = +[UIColor secondaryLabelColor];
  v20 = [(FBAInboxItemCell *)self subtitleLabel];
  [v20 setTextColor:v19];

  id v21 = +[UIColor secondaryLabelColor];
  v22 = [(FBAInboxItemCell *)self dateLabel];
  [v22 setTextColor:v21];

  v23 = +[UIColor secondaryLabelColor];
  CFStringRef v24 = [(FBAInboxItemCell *)self closedLabel];
  [v24 setTextColor:v23];

  unint64_t v25 = (unint64_t)[(FBAInboxItemCell *)self accessibilityTraits];
  UIAccessibilityTraits v26 = UIAccessibilityTraitButton | v25;

  [(FBAInboxItemCell *)self setAccessibilityTraits:v26];
}

- (void)updateLabelLinesForContentSizeCategory:(id)a3
{
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  v5 = [(FBAInboxItemCell *)self titleLabel];
  v6 = v5;
  if (IsAccessibilityCategory)
  {
    [v5 setNumberOfLines:0];

    v7 = [(FBAInboxItemCell *)self subtitleLabel];
    [v7 setNumberOfLines:0];

    v8 = [(FBAInboxItemCell *)self teamInfoLabel];
    [v8 setNumberOfLines:0];

    v9 = [(FBAInboxItemCell *)self unreadImageViewHeightConstraint];
    double v10 = 20.0;
  }
  else
  {
    [v5 setNumberOfLines:2];

    v11 = [(FBAInboxItemCell *)self subtitleLabel];
    [v11 setNumberOfLines:1];

    v12 = [(FBAInboxItemCell *)self teamInfoLabel];
    [v12 setNumberOfLines:1];

    v9 = [(FBAInboxItemCell *)self unreadImageViewHeightConstraint];
    double v10 = 13.0;
  }
  id v13 = v9;
  [v9 setConstant:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = [(FBAInboxItemCell *)self traitCollection];
  id v4 = [v5 preferredContentSizeCategory];
  [(FBAInboxItemCell *)self updateLabelLinesForContentSizeCategory:v4];
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)teamInfoLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_teamInfoLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTeamInfoLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)unreadImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unreadImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setUnreadImageView:(id)a3
{
}

- (UIImageView)fauxAccessoryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fauxAccessoryView);

  return (UIImageView *)WeakRetained;
}

- (void)setFauxAccessoryView:(id)a3
{
}

- (UILabel)closedLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closedLabel);

  return (UILabel *)WeakRetained;
}

- (void)setClosedLabel:(id)a3
{
}

- (UIImageView)orphanImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_orphanImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setOrphanImageView:(id)a3
{
}

- (NSLayoutConstraint)unreadImageViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unreadImageViewHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setUnreadImageViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unreadImageViewHeightConstraint);
  objc_destroyWeak((id *)&self->_orphanImageView);
  objc_destroyWeak((id *)&self->_closedLabel);
  objc_destroyWeak((id *)&self->_fauxAccessoryView);
  objc_destroyWeak((id *)&self->_unreadImageView);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_teamInfoLabel);
  objc_destroyWeak((id *)&self->_subtitleLabel);

  objc_destroyWeak((id *)&self->_titleLabel);
}

@end