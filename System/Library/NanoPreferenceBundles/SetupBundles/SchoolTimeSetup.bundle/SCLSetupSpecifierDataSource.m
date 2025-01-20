@interface SCLSetupSpecifierDataSource
- (SCLActiveSpecifierDataSource)activeDataSource;
- (SCLDaySettingsSpecifierSource)daySettingsDataSource;
- (SCLSetupSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActiveDataSource:(id)a3;
- (void)setDaySettingsDataSource:(id)a3;
@end

@implementation SCLSetupSpecifierDataSource

- (SCLSetupSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SCLSetupSpecifierDataSource;
  v8 = [(SCLSetupSpecifierDataSource *)&v15 initWithListController:v6 viewModel:v7];
  if (v8)
  {
    v9 = (SCLActiveSpecifierDataSource *)[objc_alloc((Class)SCLActiveSpecifierDataSource) initWithListController:v6 viewModel:v7 options:3];
    activeDataSource = v8->_activeDataSource;
    v8->_activeDataSource = v9;

    [(SCLActiveSpecifierDataSource *)v8->_activeDataSource setActive:1];
    v11 = (SCLDaySettingsSpecifierSource *)[objc_alloc((Class)SCLDaySettingsSpecifierSource) initWithListController:v6 viewModel:v7];
    daySettingsDataSource = v8->_daySettingsDataSource;
    v8->_daySettingsDataSource = v11;

    [v7 addObserver:v8 forKeyPath:@"enabled" options:5 context:off_CFA0];
    v16[0] = v8->_activeDataSource;
    v16[1] = v8->_daySettingsDataSource;
    v13 = +[NSArray arrayWithObjects:v16 count:2];
    [(SCLSetupSpecifierDataSource *)v8 setChildDataSources:v13];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(SCLSetupSpecifierDataSource *)self viewModel];
  [v3 removeObserver:self forKeyPath:@"enabled" context:off_CFA0];

  v4.receiver = self;
  v4.super_class = (Class)SCLSetupSpecifierDataSource;
  [(SCLSetupSpecifierDataSource *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_CFA0 == a6)
  {
    id v7 = objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey, a4);
    id v8 = [v7 BOOLValue];

    id v9 = [(SCLSetupSpecifierDataSource *)self daySettingsDataSource];
    [v9 setActive:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SCLSetupSpecifierDataSource;
    -[SCLSetupSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v10, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (SCLActiveSpecifierDataSource)activeDataSource
{
  return self->_activeDataSource;
}

- (void)setActiveDataSource:(id)a3
{
}

- (SCLDaySettingsSpecifierSource)daySettingsDataSource
{
  return self->_daySettingsDataSource;
}

- (void)setDaySettingsDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daySettingsDataSource, 0);

  objc_storeStrong((id *)&self->_activeDataSource, 0);
}

@end