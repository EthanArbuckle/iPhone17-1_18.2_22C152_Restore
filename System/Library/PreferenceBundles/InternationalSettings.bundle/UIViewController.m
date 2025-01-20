@interface UIViewController
- (void)showUpdatingLanguageViewWithLabel:(id)a3 languageIdentifier:(id)a4 completionBlock:(id)a5;
- (void)showUpdatingLanguageViewWithLocalizationStringKey:(id)a3 languageIdentifier:(id)a4 completionBlock:(id)a5;
@end

@implementation UIViewController

- (void)showUpdatingLanguageViewWithLocalizationStringKey:(id)a3 languageIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizations];
  id v17 = v9;
  v13 = +[NSArray arrayWithObjects:&v17 count:1];
  v14 = +[NSBundle preferredLocalizationsFromArray:v12 forPreferences:v13];
  v15 = [v14 firstObject];

  v16 = [v11 localizedStringForKey:v10 value:v10 table:@"InternationalSettings" localization:v15];

  [(UIViewController *)self showUpdatingLanguageViewWithLabel:v16 languageIdentifier:v9 completionBlock:v8];
}

- (void)showUpdatingLanguageViewWithLabel:(id)a3 languageIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[ISUpdatingLanguageViewController alloc] initWithLabel:v10 languageIdentifier:v9];

  [(ISUpdatingLanguageViewController *)v11 setModalTransitionStyle:2];
  [(ISUpdatingLanguageViewController *)v11 setModalPresentationStyle:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_C4F8;
  v13[3] = &unk_30C60;
  id v14 = v8;
  id v12 = v8;
  [(UIViewController *)self presentViewController:v11 animated:1 completion:v13];
}

@end