@interface SUISPresentationControllerHelper
+ (void)configureSheetPresentationController:(id)a3;
+ (void)resetSheetPresentationController:(id)a3;
+ (void)updateSheetPresentationController:(id)a3 withConfiguration:(id)a4;
@end

@implementation SUISPresentationControllerHelper

+ (void)configureSheetPresentationController:(id)a3
{
}

+ (void)updateSheetPresentationController:(id)a3 withConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSNull null];

  if (v7 != v6)
  {
    v8 = sub_100002214();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "set sheet configuration:%@", (uint8_t *)&v9, 0xCu);
    }

    [v5 _setConfiguration:v6];
  }
}

+ (void)resetSheetPresentationController:(id)a3
{
}

@end