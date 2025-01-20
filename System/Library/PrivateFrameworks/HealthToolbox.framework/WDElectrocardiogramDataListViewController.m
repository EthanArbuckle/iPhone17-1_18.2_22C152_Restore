@interface WDElectrocardiogramDataListViewController
- (BOOL)isEditEnabled;
- (WDElectrocardiogramDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6 mode:(int64_t)a7;
@end

@implementation WDElectrocardiogramDataListViewController

- (WDElectrocardiogramDataListViewController)initWithDisplayType:(id)a3 profile:(id)a4 dataProvider:(id)a5 usingInsetStyling:(BOOL)a6 mode:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)WDElectrocardiogramDataListViewController;
  result = [(WDDataListViewController *)&v9 initWithDisplayType:a3 profile:a4 dataProvider:a5 usingInsetStyling:a6];
  if (result) {
    result->_mode = a7;
  }
  return result;
}

- (BOOL)isEditEnabled
{
  v5.receiver = self;
  v5.super_class = (Class)WDElectrocardiogramDataListViewController;
  BOOL v3 = [(WDDataListViewController *)&v5 isEditEnabled];
  if (v3) {
    LOBYTE(v3) = self->_mode == 0;
  }
  return v3;
}

@end