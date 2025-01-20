@interface BuddyExpressSetupFeatureCardView
+ (id)formattedSubtitleStringForComponents:(id)a3;
- (BOOL)isExpanded;
- (BuddyExpressSetupFeatureCardPrimaryCell)primaryCell;
- (BuddyExpressSetupFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (NSLayoutConstraint)bottomStackViewConstraint;
- (NSMutableArray)cells;
- (UIStackView)secondaryStackView;
- (UIStackView)stackView;
- (void)_toggleExpanded;
- (void)addCardCell:(id)a3;
- (void)setBottomStackViewConstraint:(id)a3;
- (void)setCells:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setNumberOfLinesForSubtitle:(int64_t)a3;
- (void)setPrimaryCell:(id)a3;
- (void)setSecondaryStackView:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation BuddyExpressSetupFeatureCardView

- (BuddyExpressSetupFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = 0;
  objc_storeStrong(&v55, a4);
  id v54 = 0;
  objc_storeStrong(&v54, a5);
  id v7 = v57;
  id v57 = 0;
  v53.receiver = v7;
  v53.super_class = (Class)BuddyExpressSetupFeatureCardView;
  id v57 = -[BuddyExpressSetupFeatureCardView initWithFrame:](&v53, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&v57, v57);
  if (v57)
  {
    v8 = +[UIColor secondarySystemBackgroundColor];
    [v57 setBackgroundColor:v8];

    [v57 _setContinuousCornerRadius:10.0];
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = (void *)*((void *)v57 + 4);
    *((void *)v57 + 4) = v9;

    id v11 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v12 = (void *)*((void *)v57 + 2);
    *((void *)v57 + 2) = v11;

    [*((id *)v57 + 2) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v57 + 2) setAxis:1];
    [*((id *)v57 + 2) setSpacing:16.0];
    [v57 addSubview:*((void *)v57 + 2)];
    id v13 = [v57 bottomAnchor];
    id v14 = [*((id *)v57 + 2) bottomAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v16 = (void *)*((void *)v57 + 5);
    *((void *)v57 + 5) = v15;

    id v17 = v57;
    id v47 = [*((id *)v57 + 2) topAnchor];
    id v46 = [v57 topAnchor];
    id v18 = [v47 constraintEqualToAnchor:];
    v59[0] = v18;
    v59[1] = *((void *)v57 + 5);
    id v19 = [*((id *)v57 + 2) leadingAnchor];
    id v20 = [v57 leadingAnchor];
    id v21 = [v19 constraintEqualToAnchor:v20];
    v59[2] = v21;
    id v22 = [v57 trailingAnchor];
    id v23 = [*((id *)v57 + 2) trailingAnchor];
    id v24 = [v22 constraintEqualToAnchor:v23];
    v59[3] = v24;
    v25 = +[NSArray arrayWithObjects:v59 count:4];
    [v17 addConstraints:v25];

    v26 = [BuddyExpressSetupFeatureCardPrimaryCell alloc];
    v27 = [(BuddyExpressSetupFeatureCardPrimaryCell *)v26 initWithTitle:location[0] subtitle:v55 icon:v54];
    v28 = (void *)*((void *)v57 + 6);
    *((void *)v57 + 6) = v27;

    [*((id *)v57 + 6) setTranslatesAutoresizingMaskIntoConstraints:0];
    *(void *)&long long v51 = sub_1001C37C8();
    *((double *)&v51 + 1) = v29;
    *(double *)&long long v52 = v30;
    *((double *)&v52 + 1) = v31;
    v32 = (void *)*((void *)v57 + 6);
    long long v50 = v52;
    long long v49 = v51;
    [v32 setDirectionalLayoutMargins:*(double *)&v51, v29, v30, v31];
    [*((id *)v57 + 6) setChevronHidden:1];
    [*((id *)v57 + 2) addArrangedSubview:*((void *)v57 + 6)];
    id v33 = v57;
    id v34 = [*((id *)v57 + 6) heightAnchor];
    id v35 = [v34 constraintGreaterThanOrEqualToConstant:60.0];
    id v58 = v35;
    v36 = +[NSArray arrayWithObjects:&v58 count:1];
    [v33 addConstraints:v36];

    id v37 = objc_alloc((Class)UITapGestureRecognizer);
    id v48 = [v37 initWithTarget:v57 action:"_toggleExpanded"];
    [*((id *)v57 + 6) addGestureRecognizer:v48];
    id v38 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v39 = (void *)*((void *)v57 + 3);
    *((void *)v57 + 3) = v38;

    [*((id *)v57 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v57 + 3) setAxis:1];
    [*((id *)v57 + 3) setSpacing:16.0];
    [*((id *)v57 + 3) setLayoutMarginsRelativeArrangement:1];
    [*((id *)v57 + 6) directionalLayoutMargins];
    [*((id *)v57 + 3) setDirectionalLayoutMargins:v40, v41, v42, v43];
    objc_storeStrong(&v48, 0);
  }
  v44 = (BuddyExpressSetupFeatureCardView *)v57;
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v57, 0);
  return v44;
}

- (void)setExpanded:(BOOL)a3
{
  v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  self->_expanded = a3;
  v3 = [(BuddyExpressSetupFeatureCardView *)v27 primaryCell];
  [(BuddyExpressSetupFeatureCardPrimaryCell *)v3 setExpanded:v25];

  if (v25)
  {
    v4 = [(BuddyExpressSetupFeatureCardView *)v27 bottomStackViewConstraint];
    [(NSLayoutConstraint *)v4 setConstant:20.0];

    memset(__b, 0, sizeof(__b));
    v5 = [(BuddyExpressSetupFeatureCardView *)v27 cells];
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:__b objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v24 = *(void *)(__b[1] + 8 * i);
          id v9 = [(BuddyExpressSetupFeatureCardView *)v27 secondaryStackView];
          [(UIStackView *)v9 addArrangedSubview:v24];
        }
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:__b objects:v29 count:16];
      }
      while (v6);
    }

    v10 = [(BuddyExpressSetupFeatureCardView *)v27 stackView];
    id v11 = [(BuddyExpressSetupFeatureCardView *)v27 secondaryStackView];
    [(UIStackView *)v10 addArrangedSubview:v11];
  }
  else
  {
    v12 = [(BuddyExpressSetupFeatureCardView *)v27 bottomStackViewConstraint];
    [(NSLayoutConstraint *)v12 setConstant:0.0];

    memset(v21, 0, sizeof(v21));
    id v13 = [(BuddyExpressSetupFeatureCardView *)v27 cells];
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:v21 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v21[2];
      do
      {
        for (unint64_t j = 0; j < (unint64_t)v14; ++j)
        {
          if (*(void *)v21[2] != v15) {
            objc_enumerationMutation(v13);
          }
          id v22 = *(id *)(v21[1] + 8 * j);
          id v17 = [(BuddyExpressSetupFeatureCardView *)v27 secondaryStackView];
          [(UIStackView *)v17 removeArrangedSubview:v22];

          [v22 removeFromSuperview];
        }
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:v21 objects:v28 count:16];
      }
      while (v14);
    }

    id v18 = [(BuddyExpressSetupFeatureCardView *)v27 stackView];
    id v19 = [(BuddyExpressSetupFeatureCardView *)v27 secondaryStackView];
    [(UIStackView *)v18 removeArrangedSubview:v19];

    id v20 = [(BuddyExpressSetupFeatureCardView *)v27 secondaryStackView];
    [(UIStackView *)v20 removeFromSuperview];
  }
}

- (void)addCardCell:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(BuddyExpressSetupFeatureCardView *)v6 primaryCell];
  [(BuddyExpressSetupFeatureCardPrimaryCell *)v3 setChevronHidden:0];

  v4 = [(BuddyExpressSetupFeatureCardView *)v6 cells];
  [(NSMutableArray *)v4 addObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setNumberOfLinesForSubtitle:(int64_t)a3
{
  v3 = [(BuddyExpressSetupFeatureCardView *)self primaryCell];
  [(BuddyExpressSetupFeatureCardPrimaryCell *)v3 setNumberOfLinesForSubtitle:a3];
}

+ (id)formattedSubtitleStringForComponents:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)[location[0] count] <= 2)
  {
    id v10 = +[NSListFormatter localizedStringByJoiningStrings:location[0]];
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    v4 = [(NSBundle *)v3 localizedStringForKey:@"EXPRESS_SETUP_FEATURE_CARD_AND_MORE" value:&stru_1002B4E18 table:@"Localizable"];
    id v5 = [location[0] objectAtIndexedSubscript:0];
    id v6 = [location[0] objectAtIndexedSubscript:1];
    id v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v5, v6);
  }
  objc_storeStrong(location, 0);
  id v7 = v10;

  return v7;
}

- (void)_toggleExpanded
{
  v2 = [(BuddyExpressSetupFeatureCardView *)self cells];
  id v3 = [(NSMutableArray *)v2 count];

  if (v3) {
    [(BuddyExpressSetupFeatureCardView *)self setExpanded:![(BuddyExpressSetupFeatureCardView *)self isExpanded]];
  }
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)secondaryStackView
{
  return self->_secondaryStackView;
}

- (void)setSecondaryStackView:(id)a3
{
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSLayoutConstraint)bottomStackViewConstraint
{
  return self->_bottomStackViewConstraint;
}

- (void)setBottomStackViewConstraint:(id)a3
{
}

- (BuddyExpressSetupFeatureCardPrimaryCell)primaryCell
{
  return self->_primaryCell;
}

- (void)setPrimaryCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end