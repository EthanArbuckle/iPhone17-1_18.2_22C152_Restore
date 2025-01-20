@interface ITKImageDataRequirements
+ (ITKImageDataRequirements)stickerRequirements;
+ (ITKImageDataRequirements)stickerThumbnailRequirements;
- (NSString)uti;
- (unint64_t)maxDataLength;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (void)setMaxDataLength:(unint64_t)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setUti:(id)a3;
@end

@implementation ITKImageDataRequirements

+ (ITKImageDataRequirements)stickerRequirements
{
  v2 = objc_alloc_init(ITKImageDataRequirements);
  v3 = [(id)*MEMORY[0x263F1DAE8] identifier];
  [(ITKImageDataRequirements *)v2 setUti:v3];

  [(ITKImageDataRequirements *)v2 setMaxLength:900];
  [(ITKImageDataRequirements *)v2 setMinLength:300];
  [(ITKImageDataRequirements *)v2 setMaxDataLength:500000];
  return v2;
}

+ (ITKImageDataRequirements)stickerThumbnailRequirements
{
  v2 = objc_alloc_init(ITKImageDataRequirements);
  v3 = [(id)*MEMORY[0x263F1DC08] identifier];
  [(ITKImageDataRequirements *)v2 setUti:v3];

  [(ITKImageDataRequirements *)v2 setMaxLength:100];
  [(ITKImageDataRequirements *)v2 setMinLength:50];
  [(ITKImageDataRequirements *)v2 setMaxDataLength:500000];
  return v2;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxDataLength
{
  return self->_maxDataLength;
}

- (void)setMaxDataLength:(unint64_t)a3
{
  self->_maxDataLength = a3;
}

- (void).cxx_destruct
{
}

@end