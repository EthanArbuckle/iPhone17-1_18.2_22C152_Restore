@interface SelectedCheckboxFromIcon__generated__Input
- (NSSet)featureNames;
- (SelectedCheckboxFromIcon__generated__Input)initWithImage:(__CVBuffer *)a3;
- (__CVBuffer)image;
- (id)featureValueForName:(id)a3;
- (void)setImage:(__CVBuffer *)a3;
@end

@implementation SelectedCheckboxFromIcon__generated__Input

- (SelectedCheckboxFromIcon__generated__Input)initWithImage:(__CVBuffer *)a3
{
  if (self) {
    self->_image = a3;
  }
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E94320];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"image"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_image];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

@end