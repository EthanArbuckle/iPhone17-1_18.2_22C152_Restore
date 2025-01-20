@interface MKPublisherIcon
- (NSString)publisherName;
- (UIImage)publisherImage;
- (id)initUsingName:(id)a3 andImage:(id)a4;
@end

@implementation MKPublisherIcon

- (UIImage)publisherImage
{
  return self->_publisherImage;
}

- (id)initUsingName:(id)a3 andImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPublisherIcon;
  v9 = [(MKPublisherIcon *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisherName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);

  objc_storeStrong((id *)&self->_publisherImage, 0);
}

@end