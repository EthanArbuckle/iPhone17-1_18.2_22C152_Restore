@interface UIView(MUHairlineView)
- (MUHairlineView)_addHairlineAtBottom:()MUHairlineView leadingMargin:trailingMargin:;
- (uint64_t)_mapsui_addHairlineAtBottomWithLeadingMargin:()MUHairlineView trailingMargin:;
- (uint64_t)_mapsui_addHairlineAtBottomWithMargin:()MUHairlineView;
- (uint64_t)_mapsui_addHairlineAtTopWithLeadingMargin:()MUHairlineView trailingMargin:;
- (uint64_t)_mapsui_addHairlineAtTopWithMargin:()MUHairlineView;
@end

@implementation UIView(MUHairlineView)

- (uint64_t)_mapsui_addHairlineAtTopWithMargin:()MUHairlineView
{
  return objc_msgSend(a1, "_mapsui_addHairlineAtTopWithLeadingMargin:trailingMargin:", a3, a3);
}

- (uint64_t)_mapsui_addHairlineAtTopWithLeadingMargin:()MUHairlineView trailingMargin:
{
  return objc_msgSend(a1, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 0);
}

- (uint64_t)_mapsui_addHairlineAtBottomWithMargin:()MUHairlineView
{
  return objc_msgSend(a1, "_mapsui_addHairlineAtBottomWithLeadingMargin:trailingMargin:", a3, a3);
}

- (uint64_t)_mapsui_addHairlineAtBottomWithLeadingMargin:()MUHairlineView trailingMargin:
{
  return objc_msgSend(a1, "_addHairlineAtBottom:leadingMargin:trailingMargin:", 1);
}

- (MUHairlineView)_addHairlineAtBottom:()MUHairlineView leadingMargin:trailingMargin:
{
  v9 = objc_alloc_init(MUHairlineView);
  [(MUHairlineView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  v11 = [(MUHairlineView *)v9 leadingAnchor];
  v12 = [a1 leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:a2];
  [(MUHairlineView *)v9 setLeadingMarginConstraint:v13];

  v14 = [(MUHairlineView *)v9 leadingMarginConstraint];
  [v10 addObject:v14];

  v15 = [a1 trailingAnchor];
  v16 = [(MUHairlineView *)v9 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:a3];
  [(MUHairlineView *)v9 setTrailingMarginConstraint:v17];

  v18 = [(MUHairlineView *)v9 trailingMarginConstraint];
  [v10 addObject:v18];

  if (a5)
  {
    v19 = [(MUHairlineView *)v9 bottomAnchor];
    [a1 bottomAnchor];
  }
  else
  {
    v19 = [(MUHairlineView *)v9 topAnchor];
    [a1 topAnchor];
  v20 = };
  v21 = [v19 constraintEqualToAnchor:v20];
  [v10 addObject:v21];

  [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  return v9;
}

@end