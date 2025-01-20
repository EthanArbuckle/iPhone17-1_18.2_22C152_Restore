@interface MobileTimerAssistantAlarmSnippetCell
- (MTAlarm)alarm;
- (MTUIAlarmView)alarmView;
- (MTUISleepMetadata)sleepMetaData;
- (MobileTimerAssistantAlarmSnippetCell)initWithFrame:(CGRect)a3;
- (MobileTimerAssistantAlarmSnippetCellDelegate)delegate;
- (id)reuseIdentifier;
- (void)alarmActiveChanged:(id)a3;
- (void)refreshWithSleepMetadata:(id)a3;
- (void)setAlarm:(id)a3;
- (void)setAlarmView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSleepMetaData:(id)a3;
- (void)setupConstraints;
@end

@implementation MobileTimerAssistantAlarmSnippetCell

- (MobileTimerAssistantAlarmSnippetCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MobileTimerAssistantAlarmSnippetCell;
  v3 = -[MobileTimerAssistantAlarmSnippetCell initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)MTUIAlarmView);
    [(MobileTimerAssistantAlarmSnippetCell *)v3 bounds];
    v5 = (MTUIAlarmView *)objc_msgSend(v4, "initWithFrame:");
    alarmView = v3->_alarmView;
    v3->_alarmView = v5;

    [(MTUIAlarmView *)v3->_alarmView setShouldAddLayoutConstraints:1];
    v7 = +[UIColor siriui_textColor];
    v8 = [(MTUIAlarmView *)v3->_alarmView timeLabel];
    [v8 setTextColor:v7];

    v9 = +[UIColor siriui_keylineColor];
    v10 = [(MTUIAlarmView *)v3->_alarmView enabledSwitch];
    [v10 setTintColor:v9];

    [(MobileTimerAssistantAlarmSnippetCell *)v3 textAndAccessoryInsets];
    [(MTUIAlarmView *)v3->_alarmView setLayoutMargins:"setLayoutMargins:"];
    v11 = [(MTUIAlarmView *)v3->_alarmView enabledSwitch];
    [v11 addTarget:v3 action:"alarmActiveChanged:" forControlEvents:4096];

    [(MobileTimerAssistantAlarmSnippetCell *)v3 addSubview:v3->_alarmView];
    [(MobileTimerAssistantAlarmSnippetCell *)v3 setupConstraints];
  }
  return v3;
}

- (void)setupConstraints
{
  id v23 = (id)objc_opt_new();
  v3 = [(MobileTimerAssistantAlarmSnippetCell *)self contentView];
  id v4 = [v3 leadingAnchor];
  v5 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
  v6 = [v5 leadingAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  [v23 addObject:v7];

  v8 = [(MobileTimerAssistantAlarmSnippetCell *)self contentView];
  v9 = [v8 trailingAnchor];
  v10 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v23 addObject:v12];

  objc_super v13 = [(MobileTimerAssistantAlarmSnippetCell *)self contentView];
  v14 = [v13 topAnchor];
  v15 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v23 addObject:v17];

  v18 = [(MobileTimerAssistantAlarmSnippetCell *)self contentView];
  v19 = [v18 bottomAnchor];
  v20 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v23];
}

- (id)reuseIdentifier
{
  return @"AlSn";
}

- (void)alarmActiveChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(MobileTimerAssistantAlarmSnippetCell *)self delegate];
  id v5 = [v4 isOn];

  [v6 setAlarmActive:v5 forCell:self];
}

- (void)setAlarm:(id)a3
{
  id v5 = (MTAlarm *)a3;
  p_alarm = &self->_alarm;
  alarm = self->_alarm;
  if (alarm != v5)
  {
    v19 = v5;
    v8 = alarm;
    objc_storeStrong((id *)&self->_alarm, a3);
    if ([(MTAlarm *)*p_alarm isSleepAlarm] && MTShouldHandleForEucalyptus())
    {
      v9 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
      v10 = [v9 enabledSwitch];
      [v10 setHidden:1];

      v11 = [(MobileTimerAssistantAlarmSnippetCell *)self sleepMetaData];
      [(MobileTimerAssistantAlarmSnippetCell *)self refreshWithSleepMetadata:v11];
    }
    else
    {
      v12 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
      objc_super v13 = [v12 enabledSwitch];
      objc_msgSend(v13, "setOn:animated:", -[MTAlarm isEnabled](*p_alarm, "isEnabled"), v8 != 0);

      if ([(MTAlarm *)*p_alarm repeatSchedule])
      {
        v11 = DateMaskToString();
      }
      else
      {
        v11 = 0;
      }
      v14 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
      v15 = [(MTAlarm *)*p_alarm displayTitle];
      v16 = +[UIColor siriui_textColor];
      [v14 setName:v15 andRepeatText:v11 textColor:v16];

      v17 = [(MobileTimerAssistantAlarmSnippetCell *)self alarmView];
      v18 = [v17 timeLabel];
      objc_msgSend(v18, "setHour:minute:", -[MTAlarm hour](*p_alarm, "hour"), -[MTAlarm minute](*p_alarm, "minute"));
    }
    id v5 = v19;
  }
}

- (void)refreshWithSleepMetadata:(id)a3
{
  id v14 = a3;
  unsigned int v4 = [v14 displaysTime];
  id v5 = [(MTUIAlarmView *)self->_alarmView timeLabel];
  if (v4)
  {
    id v6 = [v14 alarmComponents];
    id v7 = [v6 hour];
    v8 = [v14 alarmComponents];
    objc_msgSend(v5, "setHour:minute:", v7, objc_msgSend(v8, "minute"));
  }
  else
  {
    id v6 = [v14 mainDescription];
    [v5 setTimeLabelText:v6];
  }

  v9 = +[UIColor siriui_textColor];
  v10 = [(MTUIAlarmView *)self->_alarmView timeLabel];
  [v10 setTextColor:v9];

  alarmView = self->_alarmView;
  v12 = [v14 detailedDescription];
  objc_super v13 = +[UIColor siriui_textColor];
  [(MTUIAlarmView *)alarmView setName:0 andRepeatText:v12 textColor:v13];

  [(MTUIAlarmView *)self->_alarmView setNeedsLayout];
}

- (MobileTimerAssistantAlarmSnippetCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MobileTimerAssistantAlarmSnippetCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (MTUISleepMetadata)sleepMetaData
{
  return self->_sleepMetaData;
}

- (void)setSleepMetaData:(id)a3
{
}

- (MTUIAlarmView)alarmView
{
  return self->_alarmView;
}

- (void)setAlarmView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmView, 0);
  objc_storeStrong((id *)&self->_sleepMetaData, 0);
  objc_storeStrong((id *)&self->_alarm, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end