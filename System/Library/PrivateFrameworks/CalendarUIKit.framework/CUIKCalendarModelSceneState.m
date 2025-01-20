@interface CUIKCalendarModelSceneState
- (BOOL)showDayAsList;
- (BOOL)showMonthAsDivided;
- (CUIKCalendarModelSceneState)init;
- (double)dayViewHourScale;
- (double)weekViewHourScale;
- (int)dayViewFirstVisibleSecond;
- (int64_t)lastUsedNonYearView;
- (int64_t)numDaysToShow;
- (int64_t)weekViewFirstVisibleSecond;
- (void)setDayViewFirstVisibleSecond:(int)a3;
- (void)setDayViewHourScale:(double)a3;
- (void)setLastUsedNonYearView:(int64_t)a3;
- (void)setNumDaysToShow:(int64_t)a3;
- (void)setShowDayAsList:(BOOL)a3;
- (void)setShowMonthAsDivided:(BOOL)a3;
- (void)setWeekViewFirstVisibleSecond:(int64_t)a3;
- (void)setWeekViewHourScale:(double)a3;
@end

@implementation CUIKCalendarModelSceneState

- (CUIKCalendarModelSceneState)init
{
  v8.receiver = self;
  v8.super_class = (Class)CUIKCalendarModelSceneState;
  result = [(CUIKCalendarModelSceneState *)&v8 init];
  if (result)
  {
    *(_WORD *)&result->_showDayAsList = 0;
    result->_numDaysToShow = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_dayViewHourScale = _Q0;
    result->_dayViewFirstVisibleSecond = -1;
    result->_weekViewFirstVisibleSecond = -1;
    result->_lastUsedNonYearView = -1;
  }
  return result;
}

- (BOOL)showDayAsList
{
  return self->_showDayAsList;
}

- (void)setShowDayAsList:(BOOL)a3
{
  self->_showDayAsList = a3;
}

- (int64_t)numDaysToShow
{
  return self->_numDaysToShow;
}

- (void)setNumDaysToShow:(int64_t)a3
{
  self->_numDaysToShow = a3;
}

- (BOOL)showMonthAsDivided
{
  return self->_showMonthAsDivided;
}

- (void)setShowMonthAsDivided:(BOOL)a3
{
  self->_showMonthAsDivided = a3;
}

- (double)dayViewHourScale
{
  return self->_dayViewHourScale;
}

- (void)setDayViewHourScale:(double)a3
{
  self->_dayViewHourScale = a3;
}

- (double)weekViewHourScale
{
  return self->_weekViewHourScale;
}

- (void)setWeekViewHourScale:(double)a3
{
  self->_weekViewHourScale = a3;
}

- (int)dayViewFirstVisibleSecond
{
  return self->_dayViewFirstVisibleSecond;
}

- (void)setDayViewFirstVisibleSecond:(int)a3
{
  self->_dayViewFirstVisibleSecond = a3;
}

- (int64_t)weekViewFirstVisibleSecond
{
  return self->_weekViewFirstVisibleSecond;
}

- (void)setWeekViewFirstVisibleSecond:(int64_t)a3
{
  self->_weekViewFirstVisibleSecond = a3;
}

- (int64_t)lastUsedNonYearView
{
  return self->_lastUsedNonYearView;
}

- (void)setLastUsedNonYearView:(int64_t)a3
{
  self->_lastUsedNonYearView = a3;
}

@end