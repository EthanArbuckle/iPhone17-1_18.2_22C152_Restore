@interface MUPlaceDescriptionConfiguration
+ (id)configurationWithEncyclopedicInfo:(id)a3;
- (BOOL)showSectionTitle;
- (GEOMapItemAttribution)attribution;
- (MUPlaceDescriptionConfiguration)initWithTitle:(id)a3 descriptionText:(id)a4 attribution:(id)a5;
- (NSString)textBlockText;
- (NSString)titleText;
- (void)setShowSectionTitle:(BOOL)a3;
@end

@implementation MUPlaceDescriptionConfiguration

- (MUPlaceDescriptionConfiguration)initWithTitle:(id)a3 descriptionText:(id)a4 attribution:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceDescriptionConfiguration;
  v12 = [(MUPlaceDescriptionConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v13->_textBlockText, a4);
    objc_storeStrong((id *)&v13->_attribution, a5);
    v13->_showSectionTitle = 1;
  }

  return v13;
}

+ (id)configurationWithEncyclopedicInfo:(id)a3
{
  id v3 = a3;
  v4 = [MUPlaceDescriptionConfiguration alloc];
  v5 = [v3 textBlockTitle];
  v6 = [v3 textBlockText];
  v7 = [v3 encyclopedicAttribution];

  v8 = [(MUPlaceDescriptionConfiguration *)v4 initWithTitle:v5 descriptionText:v6 attribution:v7];
  return v8;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)textBlockText
{
  return self->_textBlockText;
}

- (GEOMapItemAttribution)attribution
{
  return self->_attribution;
}

- (BOOL)showSectionTitle
{
  return self->_showSectionTitle;
}

- (void)setShowSectionTitle:(BOOL)a3
{
  self->_showSectionTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_textBlockText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end