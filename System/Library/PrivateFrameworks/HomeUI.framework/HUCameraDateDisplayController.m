@interface HUCameraDateDisplayController
- (BOOL)_isSameMinuteAsDate:(id)a3;
- (BOOL)_isSameSecondAsDate:(id)a3;
- (BOOL)_shouldUpdateDisplayWithDate:(id)a3;
- (BOOL)dayHasChanged;
- (HUActsAsLabel)dayLabel;
- (HUActsAsLabel)timeLabel;
- (HUCameraDateDisplayController)initWithDayOfWeekLabel:(id)a3 timeLabel:(id)a4;
- (NSCalendar)calendar;
- (NSDate)currentDate;
- (NSDateComponents)currentDateComponents;
- (unint64_t)dateDisplayType;
- (unsigned)minuteUnitFlags;
- (unsigned)secondUnitFlags;
- (void)_resetLabels;
- (void)_updateDayLabel;
- (void)_updateTimeLabel;
- (void)setCalendar:(id)a3;
- (void)setCurrentDate:(id)a3;
- (void)setCurrentDateComponents:(id)a3;
- (void)setDateDisplayType:(unint64_t)a3;
- (void)setDayHasChanged:(BOOL)a3;
- (void)setDayLabel:(id)a3;
- (void)setMinuteUnitFlags:(unsigned int)a3;
- (void)setSecondUnitFlags:(unsigned int)a3;
- (void)setTimeLabel:(id)a3;
- (void)updateDisplayDateWithDate:(id)a3 forType:(unint64_t)a4;
@end

@implementation HUCameraDateDisplayController

- (HUCameraDateDisplayController)initWithDayOfWeekLabel:(id)a3 timeLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraDateDisplayController;
  v8 = [(HUCameraDateDisplayController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(HUCameraDateDisplayController *)v8 setDayLabel:v6];
    [(HUCameraDateDisplayController *)v9 setTimeLabel:v7];
    [(HUCameraDateDisplayController *)v9 setDateDisplayType:1];
    [(HUCameraDateDisplayController *)v9 setDayHasChanged:1];
    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [(HUCameraDateDisplayController *)v9 setCalendar:v10];

    [(HUCameraDateDisplayController *)v9 setSecondUnitFlags:764];
    [(HUCameraDateDisplayController *)v9 setMinuteUnitFlags:636];
  }

  return v9;
}

- (void)updateDisplayDateWithDate:(id)a3 forType:(unint64_t)a4
{
  id v6 = a3;
  if ([(HUCameraDateDisplayController *)self dateDisplayType] != a4)
  {
    [(HUCameraDateDisplayController *)self setDateDisplayType:a4];
    [(HUCameraDateDisplayController *)self setDayHasChanged:1];
    goto LABEL_5;
  }
  if ([(HUCameraDateDisplayController *)self _shouldUpdateDisplayWithDate:v6]) {
LABEL_5:
  }
    [(HUCameraDateDisplayController *)self setCurrentDate:v6];
}

- (BOOL)_shouldUpdateDisplayWithDate:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraDateDisplayController *)self currentDate];
  char v6 = [v5 isEqualToDate:v4];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    if ([(HUCameraDateDisplayController *)self dateDisplayType]) {
      BOOL v8 = [(HUCameraDateDisplayController *)self _isSameMinuteAsDate:v4];
    }
    else {
      BOOL v8 = [(HUCameraDateDisplayController *)self _isSameSecondAsDate:v4];
    }
    BOOL v7 = !v8;
  }

  return v7;
}

- (BOOL)_isSameSecondAsDate:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraDateDisplayController *)self calendar];
  char v6 = objc_msgSend(v5, "components:fromDate:", -[HUCameraDateDisplayController secondUnitFlags](self, "secondUnitFlags"), v4);

  BOOL v7 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v8 = [v7 year];
  if (v8 != [v6 year]) {
    goto LABEL_11;
  }
  v9 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v10 = [v9 month];
  if (v10 != [v6 month])
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  v11 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v12 = [v11 day];
  if (v12 != [v6 day])
  {

    goto LABEL_10;
  }
  v13 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v14 = [v13 weekday];
  uint64_t v15 = [v6 weekday];

  if (v14 != v15)
  {
LABEL_12:
    [(HUCameraDateDisplayController *)self setDayHasChanged:1];
    goto LABEL_13;
  }
  v16 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v17 = [v16 hour];
  if (v17 != [v6 hour])
  {
LABEL_16:

    goto LABEL_13;
  }
  v18 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v19 = [v18 minute];
  if (v19 != [v6 minute])
  {

    goto LABEL_16;
  }
  v20 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v21 = [v20 second];
  uint64_t v22 = [v6 second];

  if (v21 != v22)
  {
LABEL_13:
    BOOL v23 = 0;
    goto LABEL_14;
  }
  BOOL v23 = 1;
LABEL_14:

  return v23;
}

- (BOOL)_isSameMinuteAsDate:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraDateDisplayController *)self calendar];
  char v6 = objc_msgSend(v5, "components:fromDate:", -[HUCameraDateDisplayController minuteUnitFlags](self, "minuteUnitFlags"), v4);

  BOOL v7 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v8 = [v7 year];
  if (v8 != [v6 year]) {
    goto LABEL_10;
  }
  v9 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v10 = [v9 month];
  if (v10 != [v6 month])
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v11 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v12 = [v11 day];
  if (v12 != [v6 day])
  {

    goto LABEL_9;
  }
  v13 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v14 = [v13 weekday];
  uint64_t v15 = [v6 weekday];

  if (v14 != v15)
  {
LABEL_11:
    [(HUCameraDateDisplayController *)self setDayHasChanged:1];
    goto LABEL_12;
  }
  v16 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v17 = [v16 hour];
  if (v17 != [v6 hour])
  {

    goto LABEL_12;
  }
  v18 = [(HUCameraDateDisplayController *)self currentDateComponents];
  uint64_t v19 = [v18 minute];
  uint64_t v20 = [v6 minute];

  if (v19 != v20)
  {
LABEL_12:
    BOOL v21 = 0;
    goto LABEL_13;
  }
  BOOL v21 = 1;
LABEL_13:

  return v21;
}

- (void)setCurrentDate:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_currentDate, a3);
  if (self->_currentDate)
  {
    unint64_t v5 = [(HUCameraDateDisplayController *)self dateDisplayType];
    char v6 = [(HUCameraDateDisplayController *)self calendar];
    if (v5) {
      unsigned int v7 = [(HUCameraDateDisplayController *)self minuteUnitFlags];
    }
    else {
      unsigned int v7 = [(HUCameraDateDisplayController *)self secondUnitFlags];
    }
    uint64_t v8 = [v6 components:v7 fromDate:self->_currentDate];
    [(HUCameraDateDisplayController *)self setCurrentDateComponents:v8];

    [(HUCameraDateDisplayController *)self _updateTimeLabel];
    [(HUCameraDateDisplayController *)self _updateDayLabel];
  }
  else
  {
    [(HUCameraDateDisplayController *)self _resetLabels];
  }
}

- (void)_resetLabels
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F18F92B8];
  id v4 = [(HUCameraDateDisplayController *)self timeLabel];
  [v4 setAttributedText:v3];

  id v5 = [(HUCameraDateDisplayController *)self dayLabel];
  [v5 setText:&stru_1F18F92B8];
}

- (void)_updateTimeLabel
{
  unint64_t v3 = [(HUCameraDateDisplayController *)self dateDisplayType];
  id v4 = (void *)MEMORY[0x1E4F68FF8];
  id v7 = [(HUCameraDateDisplayController *)self currentDate];
  if (v3) {
    [v4 attributedShortTimeStringFromDate:v7];
  }
  else {
  id v5 = [v4 attributedFullTimeStringFromDate:v7];
  }
  char v6 = [(HUCameraDateDisplayController *)self timeLabel];
  [v6 setAttributedText:v5];
}

- (void)_updateDayLabel
{
  if ([(HUCameraDateDisplayController *)self dayHasChanged])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F68FF8];
    id v4 = [(HUCameraDateDisplayController *)self currentDate];
    id v5 = [v3 dayStringFromDate:v4];
    char v6 = [(HUCameraDateDisplayController *)self dayLabel];
    [v6 setText:v5];

    [(HUCameraDateDisplayController *)self setDayHasChanged:0];
  }
}

- (HUActsAsLabel)dayLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dayLabel);

  return (HUActsAsLabel *)WeakRetained;
}

- (void)setDayLabel:(id)a3
{
}

- (HUActsAsLabel)timeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeLabel);

  return (HUActsAsLabel *)WeakRetained;
}

- (void)setTimeLabel:(id)a3
{
}

- (unint64_t)dateDisplayType
{
  return self->_dateDisplayType;
}

- (void)setDateDisplayType:(unint64_t)a3
{
  self->_dateDisplayType = a3;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (BOOL)dayHasChanged
{
  return self->_dayHasChanged;
}

- (void)setDayHasChanged:(BOOL)a3
{
  self->_dayHasChanged = a3;
}

- (NSDateComponents)currentDateComponents
{
  return self->_currentDateComponents;
}

- (void)setCurrentDateComponents:(id)a3
{
}

- (unsigned)secondUnitFlags
{
  return self->_secondUnitFlags;
}

- (void)setSecondUnitFlags:(unsigned int)a3
{
  self->_secondUnitFlags = a3;
}

- (unsigned)minuteUnitFlags
{
  return self->_minuteUnitFlags;
}

- (void)setMinuteUnitFlags:(unsigned int)a3
{
  self->_minuteUnitFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateComponents, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_timeLabel);

  objc_destroyWeak((id *)&self->_dayLabel);
}

@end