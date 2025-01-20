@interface BuddyMultilineButton
- (NSLayoutConstraint)labelBottomConstraint;
- (NSLayoutConstraint)labelTopConstraint;
- (void)setLabelBottomConstraint:(id)a3;
- (void)setLabelTopConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation BuddyMultilineButton

- (void)updateConstraints
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableArray);
  v2 = [(BuddyMultilineButton *)v32 labelTopConstraint];

  if (!v2)
  {
    id v3 = [(BuddyMultilineButton *)v32 titleLabel];
    id v4 = [v3 topAnchor];
    id v5 = [(BuddyMultilineButton *)v32 topAnchor];
    [(BuddyMultilineButton *)v32 contentEdgeInsets];
    double v27 = v6;
    uint64_t v28 = v7;
    uint64_t v29 = v8;
    uint64_t v30 = v9;
    id v10 = [v4 constraintEqualToAnchor:v5 constant:v6];
    [(BuddyMultilineButton *)v32 setLabelTopConstraint:v10];

    v11 = [(BuddyMultilineButton *)v32 labelTopConstraint];
    [location[0] addObject:v11];
  }
  v12 = [(BuddyMultilineButton *)v32 labelBottomConstraint];

  if (!v12)
  {
    id v13 = [(BuddyMultilineButton *)v32 bottomAnchor];
    id v14 = [(BuddyMultilineButton *)v32 titleLabel];
    id v15 = [v14 bottomAnchor];
    [(BuddyMultilineButton *)v32 contentEdgeInsets];
    uint64_t v23 = v16;
    uint64_t v24 = v17;
    double v25 = v18;
    uint64_t v26 = v19;
    id v20 = [v13 constraintEqualToAnchor:v15 constant:v18];
    [(BuddyMultilineButton *)v32 setLabelBottomConstraint:v20];

    v21 = [(BuddyMultilineButton *)v32 labelBottomConstraint];
    [location[0] addObject:v21];
  }
  +[NSLayoutConstraint activateConstraints:location[0]];
  v22.receiver = v32;
  v22.super_class = (Class)BuddyMultilineButton;
  [(BuddyMultilineButton *)&v22 updateConstraints];
  objc_storeStrong(location, 0);
}

- (NSLayoutConstraint)labelTopConstraint
{
  return self->_labelTopConstraint;
}

- (void)setLabelTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelBottomConstraint
{
  return self->_labelBottomConstraint;
}

- (void)setLabelBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end