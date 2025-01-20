@interface IMBDateTableViewCell
- (UIButton)showMoreButton;
- (UIButton)viewInCalendarButton;
- (UILabel)conflictsLabel;
- (UILabel)dateLabel;
- (_TtC8Business20IMBDateTableViewCell)initWithCoder:(id)a3;
- (_TtC8Business20IMBDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC8Business25IMBTimeslotsContainerView)timeslotContainerView;
- (void)setConflictsLabel:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setShowMoreButton:(id)a3;
- (void)toggleMoreLess;
- (void)viewInCalendar;
@end

@implementation IMBDateTableViewCell

- (UILabel)dateLabel
{
  v2 = self;
  id v3 = sub_100076378();

  return (UILabel *)v3;
}

- (void)setDateLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)conflictsLabel
{
  v2 = self;
  id v3 = sub_1000764E8();

  return (UILabel *)v3;
}

- (void)setConflictsLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel) = (Class)a3;
  id v3 = a3;
}

- (UIButton)showMoreButton
{
  v2 = self;
  id v3 = sub_10007668C();

  return (UIButton *)v3;
}

- (void)setShowMoreButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)viewInCalendarButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_viewInCalendarButton));
}

- (_TtC8Business25IMBTimeslotsContainerView)timeslotContainerView
{
  return (_TtC8Business25IMBTimeslotsContainerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotContainerView));
}

- (_TtC8Business20IMBDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1000BBAC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8Business20IMBDateTableViewCell *)sub_100076AB8(a3, (uint64_t)a4, v6);
}

- (_TtC8Business20IMBDateTableViewCell)initWithCoder:(id)a3
{
  return (_TtC8Business20IMBDateTableViewCell *)sub_100076CC0(a3);
}

- (void)toggleMoreLess
{
  v2 = self;
  sub_100078124();
}

- (void)viewInCalendar
{
  v2 = self;
  sub_100078500();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___conflictsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___showMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_viewInCalendarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotContainerView));
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeSelectionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_timeslotViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_conflictHeigthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_calendarButtonHeigthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_calendarButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_showMoreButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_showMoreButtonWidth));
  swift_release();
  sub_10000FE60((uint64_t)self + OBJC_IVAR____TtC8Business20IMBDateTableViewCell_urlHelper);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business20IMBDateTableViewCell____lazy_storage___separatorView);
}

@end