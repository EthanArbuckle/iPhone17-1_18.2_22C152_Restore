@interface CLKUIStackedDigitalTimeView
- (CLKUIStackedDigitalTimeView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (CLKUITimeLabel)hourLabel;
- (CLKUITimeLabel)inactiveHourLabel;
- (CLKUITimeLabel)inactiveMinuteLabel;
- (CLKUITimeLabel)minuteLabel;
- (void)enumerateLabelsWithBlock:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CLKUIStackedDigitalTimeView

- (CLKUIStackedDigitalTimeView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CLKUIStackedDigitalTimeView;
  v8 = [(CLKUITimeView *)&v20 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    v9 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:1024 forDevice:v6 clockTimer:v7];
    hourLabel = v8->_hourLabel;
    v8->_hourLabel = v9;

    [(CLKUIStackedDigitalTimeView *)v8 addSubview:v8->_hourLabel];
    v11 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:2048 forDevice:v6 clockTimer:v7];
    minuteLabel = v8->_minuteLabel;
    v8->_minuteLabel = v11;

    v13 = [(CLKUITimeLabel *)v8->_minuteLabel timeFormatter];
    [v13 setIncludeSeparatorInTimeSubstringFromSeparatorText:0];

    [(CLKUIStackedDigitalTimeView *)v8 addSubview:v8->_minuteLabel];
    v14 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:1024 forDevice:v6 clockTimer:v7];
    inactiveHourLabel = v8->_inactiveHourLabel;
    v8->_inactiveHourLabel = v14;

    [(CLKUITimeLabel *)v8->_inactiveHourLabel setAlpha:0.0];
    [(CLKUIStackedDigitalTimeView *)v8 addSubview:v8->_inactiveHourLabel];
    v16 = [[CLKUITimeLabel alloc] initWithTimeLabelOptions:2048 forDevice:v6 clockTimer:v7];
    inactiveMinuteLabel = v8->_inactiveMinuteLabel;
    v8->_inactiveMinuteLabel = v16;

    [(CLKUITimeLabel *)v8->_inactiveMinuteLabel setAlpha:0.0];
    v18 = [(CLKUITimeLabel *)v8->_inactiveMinuteLabel timeFormatter];
    [v18 setIncludeSeparatorInTimeSubstringFromSeparatorText:0];

    [(CLKUIStackedDigitalTimeView *)v8 addSubview:v8->_inactiveMinuteLabel];
  }

  return v8;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLKUIStackedDigitalTimeView;
  [(CLKUITimeView *)&v23 setConfiguration:v4];
  v5 = [v4 timeLabelFont];

  if (v5)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke;
    v21[3] = &unk_1E697BC60;
    id v22 = v4;
    [(CLKUIStackedDigitalTimeView *)self enumerateLabelsWithBlock:v21];
  }
  id v6 = [v4 timeLabelColor];

  if (v6)
  {
    id v7 = [v4 timeLabelColor];
    [(CLKUITimeLabel *)self->_hourLabel setTextColor:v7];

    v8 = [v4 timeLabelColor];
    [(CLKUITimeLabel *)self->_minuteLabel setTextColor:v8];
  }
  v9 = [v4 forcedNumberSystem];

  if (v9)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke_2;
    v19 = &unk_1E697BC60;
    id v20 = v4;
    [(CLKUIStackedDigitalTimeView *)self enumerateLabelsWithBlock:&v16];
  }
  v10 = objc_msgSend(v4, "minuteTimeLabelAttributes", v16, v17, v18, v19);

  if (v10)
  {
    v11 = [v4 minuteTimeLabelAttributes];
    [(CLKUITimeLabel *)self->_minuteLabel setStringAttributes:v11];

    v12 = [v4 minuteTimeLabelAttributes];
    [(CLKUITimeLabel *)self->_inactiveMinuteLabel setStringAttributes:v12];
  }
  v13 = [v4 hourTimeLabelAttributes];

  if (v13)
  {
    v14 = [v4 hourTimeLabelAttributes];
    [(CLKUITimeLabel *)self->_hourLabel setStringAttributes:v14];

    v15 = [v4 hourTimeLabelAttributes];
    [(CLKUITimeLabel *)self->_inactiveHourLabel setStringAttributes:v15];
  }
}

void __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 timeLabelFont];
  [v3 setFont:v4];
}

void __48__CLKUIStackedDigitalTimeView_setConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 forcedNumberSystem];
  objc_msgSend(v3, "setForcedNumberSystem:", objc_msgSend(v4, "unsignedIntegerValue"));
}

- (void)setState:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIStackedDigitalTimeView;
  -[CLKUITimeView setState:](&v6, sel_setState_);
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    v5 = &__block_literal_global_6;
  }
  else
  {
    v5 = &__block_literal_global_6;
  }
  [(CLKUIStackedDigitalTimeView *)self enumerateLabelsWithBlock:v5];
}

uint64_t __40__CLKUIStackedDigitalTimeView_setState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:0];
}

uint64_t __40__CLKUIStackedDigitalTimeView_setState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPaused:1];
}

- (void)setOverrideDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKUIStackedDigitalTimeView;
  [(CLKUITimeView *)&v8 setOverrideDate:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CLKUIStackedDigitalTimeView_setOverrideDate___block_invoke;
  v6[3] = &unk_1E697BC60;
  id v7 = v4;
  id v5 = v4;
  [(CLKUIStackedDigitalTimeView *)self enumerateLabelsWithBlock:v6];
}

void __47__CLKUIStackedDigitalTimeView_setOverrideDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 timeFormatter];
  [v3 setOverrideDate:v2];
}

- (void)enumerateLabelsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CLKUITimeLabel *))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_minuteLabel);
  (*v4)(v6, self->_inactiveHourLabel);
  (*v4)(v6, self->_inactiveMinuteLabel);
}

- (CLKUITimeLabel)hourLabel
{
  return self->_hourLabel;
}

- (CLKUITimeLabel)minuteLabel
{
  return self->_minuteLabel;
}

- (CLKUITimeLabel)inactiveHourLabel
{
  return self->_inactiveHourLabel;
}

- (CLKUITimeLabel)inactiveMinuteLabel
{
  return self->_inactiveMinuteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveMinuteLabel, 0);
  objc_storeStrong((id *)&self->_inactiveHourLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
}

@end