@interface HUDiagnosticsCameraTimelineView
- (HUDiagnosticsCameraTimelineView)initWithFrame:(CGRect)a3;
- (UIButton)moreButton;
- (UILabel)cameraStatusLabel;
- (UILabel)currentEventLabel;
- (UILabel)currentPositionLabel;
- (UILabel)currentTimelineStateLabel;
- (void)setCameraStatusLabel:(id)a3;
- (void)setCurrentEventLabel:(id)a3;
- (void)setCurrentPositionLabel:(id)a3;
- (void)setCurrentTimelineStateLabel:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)updateWithPlaybackEngine:(id)a3;
@end

@implementation HUDiagnosticsCameraTimelineView

- (HUDiagnosticsCameraTimelineView)initWithFrame:(CGRect)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)HUDiagnosticsCameraTimelineView;
  v3 = -[HUDiagnosticsCameraTimelineView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    cameraStatusLabel = v3->_cameraStatusLabel;
    v3->_cameraStatusLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    currentPositionLabel = v3->_currentPositionLabel;
    v3->_currentPositionLabel = v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    currentEventLabel = v3->_currentEventLabel;
    v3->_currentEventLabel = v8;

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    currentTimelineStateLabel = v3->_currentTimelineStateLabel;
    v3->_currentTimelineStateLabel = v10;

    v12 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    [(UIButton *)v12 setTitle:@"Event Details" forState:0];
    v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIButton *)v12 setTitleColor:v13 forState:0];

    v14 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
    [(UIButton *)v12 setBackgroundColor:v14];

    moreButton = v3->_moreButton;
    v3->_moreButton = v12;
    v16 = v12;

    id v17 = objc_alloc(MEMORY[0x1E4F42E20]);
    v22[0] = v3->_cameraStatusLabel;
    v22[1] = v3->_currentTimelineStateLabel;
    v22[2] = v3->_currentPositionLabel;
    v22[3] = v3->_currentEventLabel;
    v22[4] = v3->_moreButton;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

    v19 = (void *)[v17 initWithArrangedSubviews:v18];
    [v19 setAxis:1];
    [v19 setDistribution:1];
    [(HUDiagnosticsCameraTimelineView *)v3 bounds];
    objc_msgSend(v19, "setFrame:");
    [v19 setAutoresizingMask:18];
    [(HUDiagnosticsCameraTimelineView *)v3 addSubview:v19];
  }
  return v3;
}

- (void)updateWithPlaybackEngine:(id)a3
{
  id v26 = a3;
  v4 = [v26 timeControlStatusDescription];
  v5 = [(HUDiagnosticsCameraTimelineView *)self cameraStatusLabel];
  [v5 setText:v4];

  v6 = [v26 timelineStateDescription];
  v7 = [(HUDiagnosticsCameraTimelineView *)self currentTimelineStateLabel];
  [v7 setText:v6];

  v8 = [v26 playbackPosition];
  v9 = [v8 clipPlaybackDate];
  v10 = [v9 description];
  v11 = [(HUDiagnosticsCameraTimelineView *)self currentPositionLabel];
  [v11 setText:v10];

  v12 = [v26 currentClip];
  v13 = [v12 uniqueIdentifier];
  v14 = [v13 description];
  v15 = [(HUDiagnosticsCameraTimelineView *)self currentEventLabel];
  [v15 setText:v14];

  -[HUDiagnosticsCameraTimelineView setHidden:](self, "setHidden:", [v26 engineMode] == 0);
  if ([v26 timelineState] == 2)
  {
    objc_opt_class();
    v16 = [v26 clipPlayer];
    id v17 = [v16 player];
    v18 = [v17 currentItem];
    v19 = [v18 asset];
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    v22 = [v21 resourceLoader];

    v23 = [v22 delegate];

    if (v23) {
      [MEMORY[0x1E4F428B8] systemOrangeColor];
    }
    else {
    uint64_t v24 = [MEMORY[0x1E4F428B8] systemGreenColor];
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
  }
  v25 = (void *)v24;
  [(UIButton *)self->_moreButton setBackgroundColor:v24];
}

- (UILabel)cameraStatusLabel
{
  return self->_cameraStatusLabel;
}

- (void)setCameraStatusLabel:(id)a3
{
}

- (UILabel)currentPositionLabel
{
  return self->_currentPositionLabel;
}

- (void)setCurrentPositionLabel:(id)a3
{
}

- (UILabel)currentEventLabel
{
  return self->_currentEventLabel;
}

- (void)setCurrentEventLabel:(id)a3
{
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (UILabel)currentTimelineStateLabel
{
  return self->_currentTimelineStateLabel;
}

- (void)setCurrentTimelineStateLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimelineStateLabel, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_currentEventLabel, 0);
  objc_storeStrong((id *)&self->_currentPositionLabel, 0);

  objc_storeStrong((id *)&self->_cameraStatusLabel, 0);
}

@end