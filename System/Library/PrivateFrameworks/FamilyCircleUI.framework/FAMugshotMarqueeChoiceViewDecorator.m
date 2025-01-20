@interface FAMugshotMarqueeChoiceViewDecorator
+ (BOOL)shouldProcessElement:(id)a3;
+ (BOOL)shouldProcessObjectModel:(id)a3;
- (FAMugshotMarqueeChoiceViewDecorator)initWithElement:(id)a3 pictureStore:(id)a4;
- (FAMugshotMarqueeChoiceViewDecorator)initWithObjectModel:(id)a3 pictureStore:(id)a4;
- (FAProfilePictureStore)pictureStore;
- (RUIElement)element;
- (id)altDSIDsFromString:(id)a3;
- (id)imageWithAltDSIDs:(id)a3 familyCircle:(id)a4;
- (void)applyImage;
- (void)setElement:(id)a3;
- (void)setPictureStore:(id)a3;
@end

@implementation FAMugshotMarqueeChoiceViewDecorator

+ (BOOL)shouldProcessObjectModel:(id)a3
{
  v4 = [a3 defaultPages];
  v5 = [v4 firstObject];

  if ([v5 hasChoiceView])
  {
    v6 = [v5 primaryElement];
    char v7 = [a1 shouldProcessElement:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldProcessElement:(id)a3
{
  id v3 = a3;
  v4 = [v3 attributes];
  v5 = [v4 objectForKeyedSubscript:@"familyAction"];
  if ([v5 isEqual:@"InjectProfileImages"])
  {
    v6 = [v3 attributes];
    char v7 = [v6 objectForKeyedSubscript:@"altDSIDs"];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (FAMugshotMarqueeChoiceViewDecorator)initWithObjectModel:(id)a3 pictureStore:(id)a4
{
  id v6 = a4;
  char v7 = [a3 defaultPages];
  BOOL v8 = [v7 firstObject];

  v9 = [v8 primaryElement];
  v10 = [(FAMugshotMarqueeChoiceViewDecorator *)self initWithElement:v9 pictureStore:v6];

  return v10;
}

- (FAMugshotMarqueeChoiceViewDecorator)initWithElement:(id)a3 pictureStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAMugshotMarqueeChoiceViewDecorator;
  v9 = [(FAMugshotMarqueeChoiceViewDecorator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeStrong((id *)&v10->_pictureStore, a4);
  }

  return v10;
}

- (id)altDSIDsFromString:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_26CA2C800];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [v3 componentsSeparatedByString:@","];
  id v6 = [v4 setWithArray:v5];

  return v6;
}

- (id)imageWithAltDSIDs:(id)a3 familyCircle:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__FAMugshotMarqueeChoiceViewDecorator_imageWithAltDSIDs_familyCircle___block_invoke;
  v10[3] = &unk_2643494F0;
  id v11 = v5;
  id v6 = v5;
  id v7 = [(FAMugshotMarqueeChoiceViewDecorator *)self pictureStore];
  id v8 = +[FAMugshotMarqueeView imageWithMemberFilter:v10 profilePictureStore:v7];

  return v8;
}

uint64_t __70__FAMugshotMarqueeChoiceViewDecorator_imageWithAltDSIDs_familyCircle___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 altDSID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)applyImage
{
  id v3 = [(FAMugshotMarqueeChoiceViewDecorator *)self element];
  uint64_t v4 = [v3 attributes];
  id v11 = [v4 objectForKeyedSubscript:@"altDSIDs"];

  id v5 = [(FAMugshotMarqueeChoiceViewDecorator *)self altDSIDsFromString:v11];
  if ([v5 count])
  {
    id v6 = [(FAMugshotMarqueeChoiceViewDecorator *)self pictureStore];
    id v7 = [v6 familyCircle];
    id v8 = [(FAMugshotMarqueeChoiceViewDecorator *)self imageWithAltDSIDs:v5 familyCircle:v7];

    v9 = [(FAMugshotMarqueeChoiceViewDecorator *)self element];
    [v8 size];
    objc_msgSend(v9, "setImageSize:");

    v10 = [(FAMugshotMarqueeChoiceViewDecorator *)self element];
    [v10 setImage:v8];
  }
}

- (RUIElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (FAProfilePictureStore)pictureStore
{
  return self->_pictureStore;
}

- (void)setPictureStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end