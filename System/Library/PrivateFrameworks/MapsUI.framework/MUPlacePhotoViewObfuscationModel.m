@interface MUPlacePhotoViewObfuscationModel
- (MUPlacePhotoViewObfuscationModel)initWithProviderName:(id)a3;
- (NSString)providerName;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (void)setProviderName:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
@end

@implementation MUPlacePhotoViewObfuscationModel

- (MUPlacePhotoViewObfuscationModel)initWithProviderName:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    v10.receiver = self;
    v10.super_class = (Class)MUPlacePhotoViewObfuscationModel;
    v6 = [(MUPlacePhotoViewObfuscationModel *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_providerName, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
}

@end