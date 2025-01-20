@interface NTKFoghornPicayuneView
- (NTKFoghornPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation NTKFoghornPicayuneView

- (NTKFoghornPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKFoghornPicayuneView;
  v8 = [(CLKUITimeView *)&v21 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    v9 = [NTKFoghornTimeView alloc];
    objc_msgSend_screenBounds(v6, v10, v11, v12);
    uint64_t v14 = objc_msgSend_initWithFrame_forDevice_clockTimer_(v9, v13, (uint64_t)v6, (uint64_t)v7);
    timeView = v8->_timeView;
    v8->_timeView = (NTKFoghornTimeView *)v14;

    objc_msgSend_setInset_(v8->_timeView, v16, 0, v17);
    objc_msgSend_addSubview_(v8, v18, (uint64_t)v8->_timeView, v19);
  }

  return v8;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKFoghornPicayuneView;
  [(NTKFoghornPicayuneView *)&v10 layoutSubviews];
  uint64_t v6 = objc_msgSend_bounds(self, v3, v4, v5);
  MEMORY[0x24C541C00](v6);
  objc_msgSend_setCenter_(self->_timeView, v7, v8, v9);
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NTKFoghornPicayuneView;
  [(CLKUITimeView *)&v31 setConfiguration:v4];
  uint64_t v8 = objc_msgSend_layoutStyle(v4, v5, v6, v7);
  objc_msgSend_setLayoutStyle_(self->_timeView, v9, v8, v10);
  uint64_t v14 = objc_msgSend_minutesColor(v4, v11, v12, v13);
  objc_msgSend_setMinutesColor_(self->_timeView, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_secondsColor(v4, v17, v18, v19);
  objc_msgSend_setSecondsColor_(self->_timeView, v21, (uint64_t)v20, v22);

  if (v4)
  {
    objc_msgSend_transform(v4, v23, v24, v25);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }
  timeView = self->_timeView;
  v27[0] = v28;
  v27[1] = v29;
  v27[2] = v30;
  objc_msgSend_setTransform_(timeView, v23, (uint64_t)v27, v25);
}

- (void)setState:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKFoghornPicayuneView;
  -[CLKUITimeView setState:](&v7, sel_setState_);
  if (a3)
  {
    if (a3 == 1) {
      objc_msgSend_setFrozen_(self->_timeView, v5, 1, v6);
    }
  }
  else
  {
    objc_msgSend_setFrozen_(self->_timeView, v5, 0, v6);
  }
}

- (void)setOverrideDate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKFoghornPicayuneView;
  id v4 = a3;
  [(CLKUITimeView *)&v7 setOverrideDate:v4];
  objc_msgSend_setOverrideDate_duration_(self->_timeView, v5, (uint64_t)v4, v6, 0.0, v7.receiver, v7.super_class);
}

- (void).cxx_destruct
{
}

@end