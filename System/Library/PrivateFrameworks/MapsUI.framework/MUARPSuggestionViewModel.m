@interface MUARPSuggestionViewModel
- (BOOL)isPhotoSuggesion;
- (BOOL)isRatingSuggestion;
- (MUARPSuggestionViewModel)initWithTitle:(id)a3 subtitle:(id)a4 isRatingSuggestion:(BOOL)a5 isPhotoSuggestion:(BOOL)a6;
- (NSString)subtitle;
- (NSString)title;
- (NSString)userImage;
@end

@implementation MUARPSuggestionViewModel

- (MUARPSuggestionViewModel)initWithTitle:(id)a3 subtitle:(id)a4 isRatingSuggestion:(BOOL)a5 isPhotoSuggestion:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MUARPSuggestionViewModel;
  v13 = [(MUARPSuggestionViewModel *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_title, a3);
    objc_storeStrong((id *)&v14->_subtitle, a4);
    v14->_isRatingSuggestion = a5;
    v14->_isPhotoSuggesion = a6;
  }

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)userImage
{
  return self->_userImage;
}

- (BOOL)isRatingSuggestion
{
  return self->_isRatingSuggestion;
}

- (BOOL)isPhotoSuggesion
{
  return self->_isPhotoSuggesion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end