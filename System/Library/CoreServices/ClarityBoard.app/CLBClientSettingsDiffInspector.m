@interface CLBClientSettingsDiffInspector
- (void)observeBottomBarTransitionProgressWithHandler:(id)a3;
- (void)observeChromeVisibleWithHandler:(id)a3;
- (void)observeNavigationTitlesWithHandler:(id)a3;
@end

@implementation CLBClientSettingsDiffInspector

- (void)observeNavigationTitlesWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[CLBSceneManager navigationTitlesSetting];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000173C0;
  v7[3] = &unk_10015C840;
  id v8 = v4;
  id v6 = v4;
  [(CLBClientSettingsDiffInspector *)self observeOtherSetting:v5 withBlock:v7];
}

- (void)observeChromeVisibleWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[CLBSceneManager chromeVisibleSetting];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017488;
  v7[3] = &unk_10015C840;
  id v8 = v4;
  id v6 = v4;
  [(CLBClientSettingsDiffInspector *)self observeOtherSetting:v5 withBlock:v7];
}

- (void)observeBottomBarTransitionProgressWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[CLBSceneManager bottomBarTransitionProgressSetting];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017550;
  v7[3] = &unk_10015C840;
  id v8 = v4;
  id v6 = v4;
  [(CLBClientSettingsDiffInspector *)self observeOtherSetting:v5 withBlock:v7];
}

@end