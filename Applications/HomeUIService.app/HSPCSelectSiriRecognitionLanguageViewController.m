@interface HSPCSelectSiriRecognitionLanguageViewController
- (HSPCSelectSiriRecognitionLanguageViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)recognitionLanguages;
- (NSDictionary)localizedLanguageToLanguageCodeMap;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)selectedSiriRecognitionLanguage;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setLocalizedLanguageToLanguageCodeMap:(id)a3;
- (void)setRecognitionLanguages:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCSelectSiriRecognitionLanguageViewController

- (id)hu_preloadContent
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019314;
  v4[3] = &unk_1000A96F8;
  v4[4] = self;
  v2 = +[NAFuture futureWithBlock:v4];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HSPCSelectSiriRecognitionLanguageViewController;
  [(HSPCSelectSiriRecognitionLanguageViewController *)&v6 viewWillAppear:a3];
  v4 = [(HSPCSelectSiriRecognitionLanguageViewController *)self contentView];
  v5 = [v4 pickerView];
  [v5 selectRow:0 inComponent:0 animated:0];
}

- (id)selectedSiriRecognitionLanguage
{
  v3 = [(HSPCSelectSiriRecognitionLanguageViewController *)self contentView];
  v4 = [v3 pickerView];
  id v5 = [v4 selectedRowInComponent:0];

  objc_super v6 = [(HSPCSelectSiriRecognitionLanguageViewController *)self recognitionLanguages];
  v7 = 0;
  if (v5 < [v6 count])
  {
    v8 = [(HSPCSelectSiriRecognitionLanguageViewController *)self recognitionLanguages];
    v7 = [v8 objectAtIndexedSubscript:v5];
  }
  v9 = [(HSPCSelectSiriRecognitionLanguageViewController *)self localizedLanguageToLanguageCodeMap];
  v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (HSPCSelectSiriRecognitionLanguageViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HSPCSelectSiriRecognitionLanguageViewController;
  v9 = [(HSPCSelectSiriRecognitionLanguageViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    v11 = HULocalizedString();
    [(HSPCSelectSiriRecognitionLanguageViewController *)v10 setTitle:v11];

    id v12 = [(HSPCSelectSiriRecognitionLanguageViewController *)v10 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v10 futureSelector:"commitConfiguration"];
  }

  return v10;
}

- (id)commitConfiguration
{
  v3 = [(HSPCSelectSiriRecognitionLanguageViewController *)self selectedSiriRecognitionLanguage];
  v4 = [(HSPCSelectSiriRecognitionLanguageViewController *)self config];
  [v4 setRecognitionLanguage:v3];

  return +[NAFuture futureWithResult:&off_1000B0070];
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  v4 = [(HSPCSelectSiriRecognitionLanguageViewController *)self recognitionLanguages];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  objc_super v6 = [(HSPCSelectSiriRecognitionLanguageViewController *)self recognitionLanguages];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  return v7;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
}

- (NSDictionary)localizedLanguageToLanguageCodeMap
{
  return self->_localizedLanguageToLanguageCodeMap;
}

- (void)setLocalizedLanguageToLanguageCodeMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLanguageToLanguageCodeMap, 0);
  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end