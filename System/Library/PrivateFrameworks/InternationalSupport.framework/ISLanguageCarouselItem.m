@interface ISLanguageCarouselItem
- (ISLanguageCarouselItem)initWithLanguageIdentifier:(id)a3 data:(id)a4;
- (ISLanguageCarouselItem)initWithLocale:(id)a3 data:(id)a4;
- (NSLocale)locale;
- (NSString)languageIdentifier;
- (id)data;
- (id)description;
- (void)setData:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
@end

@implementation ISLanguageCarouselItem

- (ISLanguageCarouselItem)initWithLocale:(id)a3 data:(id)a4
{
  id v6 = a4;
  v7 = [a3 languageIdentifier];
  v8 = [(ISLanguageCarouselItem *)self initWithLanguageIdentifier:v7 data:v6];

  return v8;
}

- (ISLanguageCarouselItem)initWithLanguageIdentifier:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ISLanguageCarouselItem;
  v8 = [(ISLanguageCarouselItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ISLanguageCarouselItem *)v8 setLanguageIdentifier:v6];
    [(ISLanguageCarouselItem *)v9 setData:v7];
  }

  return v9;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)ISLanguageCarouselItem;
  v3 = [(ISLanguageCarouselItem *)&v8 description];
  v4 = [(ISLanguageCarouselItem *)self languageIdentifier];
  v5 = [(ISLanguageCarouselItem *)self data];
  id v6 = [v3 stringByAppendingFormat:@", language = %@, data = %@", v4, v5];

  return v6;
}

- (NSLocale)locale
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [(ISLanguageCarouselItem *)self languageIdentifier];
  v4 = [v2 localeWithLocaleIdentifier:v3];

  return (NSLocale *)v4;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);

  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end