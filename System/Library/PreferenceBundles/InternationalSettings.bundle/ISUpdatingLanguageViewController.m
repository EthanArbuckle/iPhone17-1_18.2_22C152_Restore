@interface ISUpdatingLanguageViewController
+ (id)labelForString:(id)a3 languageIdentifier:(id)a4;
- (BOOL)prefersStatusBarHidden;
- (ISUpdatingLanguageViewController)initWithLabel:(id)a3 languageIdentifier:(id)a4;
- (NSString)label;
- (NSString)languageIdentifier;
- (void)setLabel:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation ISUpdatingLanguageViewController

- (ISUpdatingLanguageViewController)initWithLabel:(id)a3 languageIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISUpdatingLanguageViewController;
  v9 = [(ISUpdatingLanguageViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_languageIdentifier, a4);
  }

  return v10;
}

+ (id)labelForString:(id)a3 languageIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)UILabel);
  id v8 = objc_alloc((Class)NSAttributedString);
  CFStringRef v15 = kCTLanguageAttributeName;
  id v16 = v5;
  v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v10 = [v8 initWithString:v6 attributes:v9];

  [v7 setAttributedText:v10];
  v11 = +[UIColor blackColor];
  [v7 setBackgroundColor:v11];

  objc_super v12 = +[UIColor whiteColor];
  [v7 setTextColor:v12];

  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];

  [v7 setFont:v13];
  [v7 setNumberOfLines:0];
  [v7 sizeToFit];

  return v7;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)ISUpdatingLanguageViewController;
  [(ISUpdatingLanguageViewController *)&v26 viewDidLoad];
  v3 = +[UIWindow _applicationKeyWindow];
  [v3 setAutorotates:0];
  [v3 endEditing:1];
  id v4 = objc_alloc((Class)UIView);
  id v5 = [(ISUpdatingLanguageViewController *)self view];
  [v5 frame];
  id v6 = objc_msgSend(v4, "initWithFrame:");

  id v7 = +[UIColor blackColor];
  [v6 setBackgroundColor:v7];

  id v8 = objc_opt_class();
  v9 = [(ISUpdatingLanguageViewController *)self label];
  id v10 = [(ISUpdatingLanguageViewController *)self languageIdentifier];
  v11 = [v8 labelForString:v9 languageIdentifier:v10];

  [v11 setTextAlignment:1];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 addSubview:v11];
  objc_super v12 = [v6 layoutMarginsGuide];
  v13 = [v11 leadingAnchor];
  v14 = [v12 leadingAnchor];
  CFStringRef v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v16 = [v11 trailingAnchor];
  v17 = [v12 trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [v11 centerXAnchor];
  v20 = [v12 centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [v11 centerYAnchor];
  v23 = [v12 centerYAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [(ISUpdatingLanguageViewController *)self view];
  [v25 addSubview:v6];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageIdentifier, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end