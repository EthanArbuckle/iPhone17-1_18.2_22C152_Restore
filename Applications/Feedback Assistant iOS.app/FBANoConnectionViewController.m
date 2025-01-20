@interface FBANoConnectionViewController
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBANoConnectionViewController

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBANoConnectionViewController;
  [(FBANoConnectionViewController *)&v8 viewWillAppear:a3];
  v4 = +[NSBundle mainBundle];
  v5 = LocalizableGTStringKeyForKey();
  v6 = [v4 localizedStringForKey:v5 value:&stru_1000F6658 table:0];
  v7 = [(FBASimpleTextNoticeController *)self subtitleLabel];
  [v7 setText:v6];
}

@end