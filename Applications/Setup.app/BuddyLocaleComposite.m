@interface BuddyLocaleComposite
- (BOOL)initialPanePostLanguageReboot;
- (BOOL)showLocalizedCountryName;
- (BYLocaleDataSource)dataSource;
- (NSString)language;
- (double)scrollOffset;
- (void)setDataSource:(id)a3;
- (void)setInitialPanePostLanguageReboot:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setScrollOffset:(double)a3;
- (void)setShowLocalizedCountryName:(BOOL)a3;
@end

@implementation BuddyLocaleComposite

- (void)setLanguage:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_language, location[0]);
  v3 = [(BuddyLocaleComposite *)v8 dataSource];

  if (v3)
  {
    id v5 = location[0];
    v6 = [(BuddyLocaleComposite *)v8 dataSource];
    [(BYLocaleDataSource *)v6 setLanguage:v5];
  }
  else
  {
    id v4 = +[BYLocaleDataSource newWithLanguage:location[0]];
    [(BuddyLocaleComposite *)v8 setDataSource:v4];
  }
  objc_storeStrong(location, 0);
}

- (NSString)language
{
  return self->_language;
}

- (double)scrollOffset
{
  return self->_scrollOffset;
}

- (void)setScrollOffset:(double)a3
{
  self->_scrollOffset = a3;
}

- (BYLocaleDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)showLocalizedCountryName
{
  return self->_showLocalizedCountryName;
}

- (void)setShowLocalizedCountryName:(BOOL)a3
{
  self->_showLocalizedCountryName = a3;
}

- (BOOL)initialPanePostLanguageReboot
{
  return self->_initialPanePostLanguageReboot;
}

- (void)setInitialPanePostLanguageReboot:(BOOL)a3
{
  self->_initialPanePostLanguageReboot = a3;
}

- (void).cxx_destruct
{
}

@end