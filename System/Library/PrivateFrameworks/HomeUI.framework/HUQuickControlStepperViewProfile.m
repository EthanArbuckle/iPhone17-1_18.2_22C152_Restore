@interface HUQuickControlStepperViewProfile
- (BOOL)showSegmentTitles;
- (BOOL)supportsTouchContinuation;
- (NSArray)segmentTitles;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfSegments;
- (unint64_t)stepperBehavior;
- (unint64_t)stepperStyle;
- (void)setNumberOfSegments:(unint64_t)a3;
- (void)setSegmentTitles:(id)a3;
- (void)setShowSegmentTitles:(BOOL)a3;
- (void)setStepperBehavior:(unint64_t)a3;
- (void)setStepperStyle:(unint64_t)a3;
@end

@implementation HUQuickControlStepperViewProfile

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlStepperViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v7 copyWithZone:a3];
  objc_msgSend(v4, "setNumberOfSegments:", -[HUQuickControlStepperViewProfile numberOfSegments](self, "numberOfSegments"));
  objc_msgSend(v4, "setStepperBehavior:", -[HUQuickControlStepperViewProfile stepperBehavior](self, "stepperBehavior"));
  objc_msgSend(v4, "setShowSegmentTitles:", -[HUQuickControlStepperViewProfile showSegmentTitles](self, "showSegmentTitles"));
  v5 = [(HUQuickControlStepperViewProfile *)self segmentTitles];
  [v4 setSegmentTitles:v5];

  objc_msgSend(v4, "setStepperStyle:", -[HUQuickControlStepperViewProfile stepperStyle](self, "stepperStyle"));
  return v4;
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (unint64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (void)setNumberOfSegments:(unint64_t)a3
{
  self->_numberOfSegments = a3;
}

- (unint64_t)stepperBehavior
{
  return self->_stepperBehavior;
}

- (void)setStepperBehavior:(unint64_t)a3
{
  self->_stepperBehavior = a3;
}

- (BOOL)showSegmentTitles
{
  return self->_showSegmentTitles;
}

- (void)setShowSegmentTitles:(BOOL)a3
{
  self->_showSegmentTitles = a3;
}

- (unint64_t)stepperStyle
{
  return self->_stepperStyle;
}

- (void)setStepperStyle:(unint64_t)a3
{
  self->_stepperStyle = a3;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (void)setSegmentTitles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end