@interface NTKSquallFaceView
- (NTKSquallFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_verticalPaddingForStatusBar;
- (id)colorPalette;
- (id)createFaceColorPalette;
- (int64_t)faceViewState;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_createTimeView;
- (void)_loadSnapshotContentViews;
- (void)_removeTimeView;
- (void)_removeViews;
- (void)_setupViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateViewColorsWithPalette:(id)a3 isTritiumPalette:(BOOL)a4;
- (void)layoutSubviews;
- (void)setFaceViewState:(int64_t)a3;
@end

@implementation NTKSquallFaceView

- (NTKSquallFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSquallFaceView;
  return [(NTKSquallFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSquallFaceView;
  [(NTKSquallFaceView *)&v6 layoutSubviews];
  v3 = [(NTKSquallFaceView *)self timeView];
  [(NTKSquallFaceView *)self bounds];
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");

  backgroundView = self->_backgroundView;
  [(NTKSquallFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](backgroundView, "ntk_setBoundsAndPositionFromFrame:");
  cornerView = self->_cornerView;
  [(NTKSquallFaceView *)self bounds];
  -[NTKRoundedCornerOverlayView ntk_setBoundsAndPositionFromFrame:](cornerView, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)_loadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSquallFaceView;
  [(NTKSquallFaceView *)&v3 _loadSnapshotContentViews];
  [(NTKSquallFaceView *)self _createTimeView];
  [(NTKSquallFaceView *)self _setupViews];
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKSquallFaceView;
  [(NTKSquallFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKSquallFaceView *)self _removeTimeView];
  [(NTKSquallFaceView *)self _removeViews];
}

- (void)_setupViews
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc((Class)UIView);
    [(NTKSquallFaceView *)self bounds];
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    objc_super v6 = [(NTKSquallFaceView *)self contentView];
    [v6 addSubview:self->_backgroundView];
  }
  if (!self->_cornerView)
  {
    id v7 = objc_alloc((Class)NTKRoundedCornerOverlayView);
    [(NTKSquallFaceView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(NTKSquallFaceView *)self device];
    v17 = (NTKRoundedCornerOverlayView *)objc_msgSend(v7, "initWithFrame:forDeviceCornerRadius:", v16, v9, v11, v13, v15);
    cornerView = self->_cornerView;
    self->_cornerView = v17;

    v19 = [(NTKSquallFaceView *)self contentView];
    [v19 addSubview:self->_cornerView];
  }
  v20 = [(NTKSquallFaceView *)self contentView];
  [v20 sendSubviewToBack:self->_backgroundView];

  v21 = [(NTKSquallFaceView *)self contentView];
  v22 = [(NTKSquallFaceView *)self timeView];
  [v21 bringSubviewToFront:v22];

  id v23 = [(NTKSquallFaceView *)self contentView];
  [v23 bringSubviewToFront:self->_cornerView];
}

- (void)_removeViews
{
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_createTimeView
{
  id v3 = [(NTKSquallFaceView *)self timeView];

  if (!v3)
  {
    v4 = [NTKSquallDigitalTimeView alloc];
    v5 = [(NTKSquallFaceView *)self device];
    id v7 = [(NTKSquallDigitalTimeView *)v4 initWithDevice:v5];

    [(NTKSquallFaceView *)self setTimeView:v7];
    objc_super v6 = [(NTKSquallFaceView *)self contentView];
    [v6 addSubview:v7];
  }
}

- (void)_removeTimeView
{
  id v3 = [(NTKSquallFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKSquallFaceView *)self setTimeView:0];
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSquallFaceView;
  [(NTKSquallFaceView *)&v5 _applyDataMode];
  id v3 = [(NTKSquallFaceView *)self dataMode];
  v4 = [(NTKSquallFaceView *)self timeView];
  [v4 setFaceDataMode:v3];
}

- (double)_verticalPaddingForStatusBar
{
  id v2 = [(NTKSquallFaceView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12D10);
  id WeakRetained = objc_loadWeakRetained(&qword_12D18);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v4 = WeakRetained;
  id v5 = objc_loadWeakRetained(&qword_12D18);
  if (v5 != v2)
  {

LABEL_5:
    id v8 = objc_storeWeak(&qword_12D18, v2);
    qword_12D20 = (uint64_t)[v2 version];

    qword_12D08 = 0x4030000000000000;
    goto LABEL_6;
  }
  id v6 = [v2 version];
  uint64_t v7 = qword_12D20;

  if (v6 != (id)v7) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12D10);
  double v9 = *(double *)&qword_12D08;

  return v9;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    id v7 = [(NTKSquallFaceView *)self colorPalette];
    [(NTKSquallFaceView *)self _updateViewColorsWithPalette:v7 isTritiumPalette:0];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v11 = a5;
  if (a6 == 10) {
    [(NTKSquallFaceView *)self _applyTransitionFraction:v12 fromColor:v11 toColor:a3];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromColor:(id)a4 toColor:(id)a5
{
  id v6 = [(NTKSquallFaceView *)self interpolatedColorPalette];
  [(NTKSquallFaceView *)self _updateViewColorsWithPalette:v6 isTritiumPalette:0];
}

- (void)_updateViewColorsWithPalette:(id)a3 isTritiumPalette:(BOOL)a4
{
  id v10 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v6 = [(UIView *)self->_backgroundView layer];
  id v7 = [v10 background];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  id v8 = [(NTKSquallFaceView *)self timeView];
  double v9 = v8;
  if (!a4) {
    [v8 applyColorPalette:v10];
  }
  +[CATransaction commit];
}

- (id)createFaceColorPalette
{
  id v2 = [[NTKSquallFaceColorPalette alloc] initWithFaceClass:objc_opt_class()];

  return v2;
}

- (id)colorPalette
{
  return [(NTKSquallFaceView *)self faceColorPalette];
}

- (int64_t)faceViewState
{
  return self->_faceViewState;
}

- (void)setFaceViewState:(int64_t)a3
{
  self->_faceViewState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end