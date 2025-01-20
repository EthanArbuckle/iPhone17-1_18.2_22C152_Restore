@interface HUControlPanelCell
- (HFItem)item;
- (NSLayoutConstraint)minHeightConstraint;
- (NSSet)allControlViews;
- (void)setItem:(id)a3;
- (void)setMinHeightConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation HUControlPanelCell

- (NSSet)allControlViews
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUControlPanelCell.m", 25, @"%s is an abstract method that must be overriden by subclass %@", "-[HUControlPanelCell allControlViews]", objc_opt_class() object file lineNumber description];

  v5 = (void *)MEMORY[0x1E4F1CAD0];

  return (NSSet *)[v5 set];
}

- (void)updateConstraints
{
  v3 = [(HUControlPanelCell *)self minHeightConstraint];

  if (!v3)
  {
    v4 = [(HUControlPanelCell *)self contentView];
    v5 = [v4 heightAnchor];
    v6 = [v5 constraintGreaterThanOrEqualToConstant:44.0];
    [(HUControlPanelCell *)self setMinHeightConstraint:v6];

    v7 = [(HUControlPanelCell *)self minHeightConstraint];
    LODWORD(v8) = 1148829696;
    [v7 setPriority:v8];

    v9 = [(HUControlPanelCell *)self minHeightConstraint];
    [v9 setActive:1];
  }
  v10.receiver = self;
  v10.super_class = (Class)HUControlPanelCell;
  [(HUControlPanelCell *)&v10 updateConstraints];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSLayoutConstraint)minHeightConstraint
{
  return self->_minHeightConstraint;
}

- (void)setMinHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end