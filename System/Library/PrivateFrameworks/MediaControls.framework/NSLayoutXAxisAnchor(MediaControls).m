@interface NSLayoutXAxisAnchor(MediaControls)
- (id)mru_constraintEqualToAnchor:()MediaControls constant:priority:;
- (id)mru_constraintEqualToAnchor:()MediaControls priority:;
- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls constant:priority:;
- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls priority:;
- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls constant:priority:;
- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls priority:;
@end

@implementation NSLayoutXAxisAnchor(MediaControls)

- (id)mru_constraintEqualToAnchor:()MediaControls priority:
{
  v3 = objc_msgSend(a1, "constraintEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls priority:
{
  v3 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls priority:
{
  v3 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

- (id)mru_constraintEqualToAnchor:()MediaControls constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

@end