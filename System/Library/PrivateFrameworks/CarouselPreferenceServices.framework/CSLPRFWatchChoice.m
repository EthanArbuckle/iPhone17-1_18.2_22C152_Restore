@interface CSLPRFWatchChoice
+ (id)watchChoice:(int64_t)a3;
+ (id)watchChoices;
- (BOOL)swapForRightToLeft;
- (CSLPRFWatchChoice)initWithChoice:(int64_t)a3;
- (CSLPRFWatchChoiceImageProviding)imageProvider;
- (NSString)label;
- (NSString)screenImageName;
- (UIImage)screenImage;
- (int64_t)choice;
- (void)setImageProvider:(id)a3;
- (void)setScreenImage:(id)a3;
@end

@implementation CSLPRFWatchChoice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_screenImageName, 0);
  objc_storeStrong((id *)&self->_screenImage, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setImageProvider:(id)a3
{
}

- (CSLPRFWatchChoiceImageProviding)imageProvider
{
  return self->_imageProvider;
}

- (NSString)screenImageName
{
  return self->_screenImageName;
}

- (void)setScreenImage:(id)a3
{
}

- (UIImage)screenImage
{
  return self->_screenImage;
}

- (BOOL)swapForRightToLeft
{
  return self->_swapForRightToLeft;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)choice
{
  return self->_choice;
}

- (CSLPRFWatchChoice)initWithChoice:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFWatchChoice;
  v4 = [(CSLPRFWatchChoice *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_choice = a3;
    if (a3 == 2)
    {
      label = v4->_label;
      v4->_label = (NSString *)@"APP_VIEW_CHOICE_LIST_VIEW";

      uint64_t v10 = +[CSLPRFDeviceUtilities screenImageNameWithPrefix:@"Screen-CarouselList"];
      screenImageName = v5->_screenImageName;
      v5->_screenImageName = (NSString *)v10;

      v5->_swapForRightToLeft = 1;
    }
    else if (a3 == 1)
    {
      v6 = v4->_label;
      v4->_label = (NSString *)@"APP_VIEW_CHOICE_GRID_VIEW";

      uint64_t v7 = +[CSLPRFDeviceUtilities screenImageNameWithPrefix:@"Screen-Carousel"];
      v8 = v5->_screenImageName;
      v5->_screenImageName = (NSString *)v7;
    }
  }
  return v5;
}

+ (id)watchChoice:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithChoice:a3];
  return v3;
}

+ (id)watchChoices
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [a1 watchChoice:1];
  v7[0] = v3;
  v4 = [a1 watchChoice:2];
  v7[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return v5;
}

@end