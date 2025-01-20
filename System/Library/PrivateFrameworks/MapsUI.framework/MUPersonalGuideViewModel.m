@interface MUPersonalGuideViewModel
- (MUPersonalGuideViewModel)initWithGuideID:(id)a3 title:(id)a4 numberOfPlaces:(unint64_t)a5 image:(id)a6;
- (NSString)guideID;
- (NSString)image;
- (NSString)title;
- (unint64_t)numberOfPlaces;
@end

@implementation MUPersonalGuideViewModel

- (MUPersonalGuideViewModel)initWithGuideID:(id)a3 title:(id)a4 numberOfPlaces:(unint64_t)a5 image:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MUPersonalGuideViewModel;
  v14 = [(MUPersonalGuideViewModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guideID, a3);
    objc_storeStrong((id *)&v15->_title, a4);
    v15->_numberOfPlaces = a5;
    objc_storeStrong((id *)&v15->_image, a6);
  }

  return v15;
}

- (NSString)guideID
{
  return self->_guideID;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)numberOfPlaces
{
  return self->_numberOfPlaces;
}

- (NSString)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_guideID, 0);
}

@end