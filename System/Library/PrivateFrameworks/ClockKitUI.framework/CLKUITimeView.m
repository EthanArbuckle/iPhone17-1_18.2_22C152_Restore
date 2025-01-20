@interface CLKUITimeView
- (CGAffineTransform)aodTransform;
- (CLKClockTimer)clockTimer;
- (CLKDevice)device;
- (CLKUITimeView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (CLKUITimeViewConfiguration)configuration;
- (CLKUITimeViewDelegate)delegate;
- (NSDate)overrideDate;
- (UIColor)timeColor;
- (UIEdgeInsets)paddingInsets;
- (double)dialInset;
- (unint64_t)state;
- (void)dealloc;
- (void)setAodTransform:(CGAffineTransform *)a3;
- (void)setClockTimer:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDialInset:(double)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPaddingInsets:(UIEdgeInsets)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimeColor:(id)a3;
@end

@implementation CLKUITimeView

- (CLKUITimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLKUITimeView;
  v9 = [(CLKUITimeView *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_clockTimer, a4);
    v11 = self;
    v17[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    uint64_t v13 = [(CLKUITimeView *)v10 registerForTraitChanges:v12 withAction:sel_traitCollectionDidChange_previousTraitCollection_];
    traitChangeRegistration = v10->_traitChangeRegistration;
    v10->_traitChangeRegistration = (UITraitChangeRegistration *)v13;
  }
  return v10;
}

- (void)dealloc
{
  [(CLKUITimeView *)self unregisterForTraitChanges:self->_traitChangeRegistration];
  v3.receiver = self;
  v3.super_class = (Class)CLKUITimeView;
  [(CLKUITimeView *)&v3 dealloc];
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CLKUITimeViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CLKUITimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLKUITimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (CLKClockTimer)clockTimer
{
  return self->_clockTimer;
}

- (void)setClockTimer:(id)a3
{
}

- (double)dialInset
{
  return self->_dialInset;
}

- (void)setDialInset:(double)a3
{
  self->_dialInset = a3;
}

- (CGAffineTransform)aodTransform
{
  long long v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (void)setAodTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_aodTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_aodTransform.c = v4;
  *(_OWORD *)&self->_aodTransform.tx = v3;
}

- (UIEdgeInsets)paddingInsets
{
  double top = self->_paddingInsets.top;
  double left = self->_paddingInsets.left;
  double bottom = self->_paddingInsets.bottom;
  double right = self->_paddingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPaddingInsets:(UIEdgeInsets)a3
{
  self->_paddingInsets = a3;
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_clockTimer, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
}

@end