@interface EKSubscribedCalendarEditItemViewController
- (CGSize)preferredContentSize;
- (EKSubscribedCalendarEditItemViewController)initWithFrame:(CGRect)a3 calendar:(id)a4;
- (void)loadView;
- (void)save;
@end

@implementation EKSubscribedCalendarEditItemViewController

- (EKSubscribedCalendarEditItemViewController)initWithFrame:(CGRect)a3 calendar:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKSubscribedCalendarEditItemViewController;
  v11 = -[EKEditItemViewController initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_calendar, a4);
    v13 = EventKitUIBundle();
    v14 = [v13 localizedStringForKey:@"Edit Calendar" value:&stru_1F0CC2140 table:0];
    [(EKSubscribedCalendarEditItemViewController *)v12 setTitle:v14];

    [(EKEditItemViewController *)v12 setShowsDoneButton:1];
    [(EKEditItemViewController *)v12 setModal:1];
  }

  return v12;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v19 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [v19 setAutoresizingMask:18];
  v4 = [EKSubscribedCalendarEditor alloc];
  calendar = self->_calendar;
  v6 = [(EKCalendar *)calendar eventStore];
  v7 = [(EKSubscribedCalendarEditor *)v4 initWithCalendar:calendar eventStore:v6 entityType:0 limitedToSource:0];
  calendarEditor = self->_calendarEditor;
  self->_calendarEditor = v7;

  [(EKSubscribedCalendarEditItemViewController *)self addChildViewController:self->_calendarEditor];
  [(EKAbstractCalendarEditor *)self->_calendarEditor didMoveToParentViewController:self];
  v9 = [(EKAbstractCalendarEditor *)self->_calendarEditor view];
  [v19 addSubview:v9];

  [v19 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(EKAbstractCalendarEditor *)self->_calendarEditor view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  [(EKSubscribedCalendarEditItemViewController *)self setView:v19];
}

- (CGSize)preferredContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)EKSubscribedCalendarEditItemViewController;
  [(EKEditItemViewController *)&v14 preferredContentSize];
  double v4 = v3;
  v5 = [(EKAbstractCalendarEditor *)self->_calendarEditor view];
  objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v7 = v6;

  v8 = [(EKSubscribedCalendarEditItemViewController *)self navigationController];
  v9 = [v8 navigationBar];
  [v9 frame];
  double v11 = v7 + v10;

  double v12 = v4;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)save
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarEditor, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end