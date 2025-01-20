@interface CNSNaPSuggestionsGalleryName
- (CNSNaPSuggestionsGalleryName)initWithGivenName:(id)a3 familyName:(id)a4;
- (NSString)family;
- (NSString)given;
- (void)setFamily:(id)a3;
- (void)setGiven:(id)a3;
@end

@implementation CNSNaPSuggestionsGalleryName

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_family, 0);

  objc_storeStrong((id *)&self->_given, 0);
}

- (void)setFamily:(id)a3
{
}

- (NSString)family
{
  return self->_family;
}

- (void)setGiven:(id)a3
{
}

- (NSString)given
{
  return self->_given;
}

- (CNSNaPSuggestionsGalleryName)initWithGivenName:(id)a3 familyName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSNaPSuggestionsGalleryName;
  v9 = [(CNSNaPSuggestionsGalleryName *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_given, a3);
    objc_storeStrong((id *)&v10->_family, a4);
    v11 = v10;
  }

  return v10;
}

@end