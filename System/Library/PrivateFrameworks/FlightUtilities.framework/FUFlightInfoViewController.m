@interface FUFlightInfoViewController
- (BOOL)_canShowWhileLocked;
- (FUFlightInfoViewController)initWithStyle:(unint64_t)a3;
- (void)loadView;
- (void)setStyle:(unint64_t)a3;
@end

@implementation FUFlightInfoViewController

- (FUFlightInfoViewController)initWithStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FUFlightInfoViewController;
  result = [(FUFlightInfoViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_style = a3;
  }
  return result;
}

- (void)loadView
{
  id v3 = +[FUFlightInfoView flightViewForStyle:self->_style compact:0];
  [(FUFlightInfoViewController *)self setView:v3];
}

- (void)setStyle:(unint64_t)a3
{
  id v4 = [(FUFlightInfoViewController *)self flightInfoView];
  [v4 setStyle:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end