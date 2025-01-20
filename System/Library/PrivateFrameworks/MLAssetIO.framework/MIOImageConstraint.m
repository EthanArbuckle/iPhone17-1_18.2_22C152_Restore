@interface MIOImageConstraint
- (BOOL)isEqual:(id)a3;
- (MIOImageConstraint)initWithSpecification:(const void *)a3;
- (MIOImageSize)imageSize;
- (MIOImageSizeConstraint)sizeConstraint;
- (NSString)description;
- (const)imageFeatureTypeSpecification;
- (id).cxx_construct;
- (unsigned)pixelFormatType;
- (void)pixelFormatType;
@end

@implementation MIOImageConstraint

- (MIOImageConstraint)initWithSpecification:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MIOImageConstraint;
  v4 = [(MIOImageConstraint *)&v15 init];
  v5 = (MIOImageConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::ImageFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    v6 = [[MIOImageSizeConstraint alloc] initWithSpecification:a3];
    sizeConstraint = v5->_sizeConstraint;
    v5->_sizeConstraint = v6;

    v8 = v5->_sizeConstraint;
    v9 = 0;
    if (*((void *)a3 + 2) && *((void *)a3 + 3))
    {
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      long long v17 = *((_OWORD *)a3 + 1);
      v9 = [[MIOImageSize alloc] initWithSpecification:v16];
      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
    }
    if ([(MIOImageSizeConstraint *)v8 type] == 2)
    {
      if (!v9 || ![(MIOImageSizeConstraint *)v8 allowsImageSize:v9])
      {
        v10 = [(MIOImageSizeConstraint *)v8 enumeratedImageSizes];
        uint64_t v11 = [v10 objectAtIndexedSubscript:0];

        v9 = (MIOImageSize *)v11;
        goto LABEL_13;
      }
LABEL_15:

      imageSize = v5->_imageSize;
      v5->_imageSize = v9;

      return v5;
    }
    if ([(MIOImageSizeConstraint *)v8 type] == 3)
    {
      if (v9 && [(MIOImageSizeConstraint *)v8 allowsImageSize:v9]) {
        goto LABEL_15;
      }
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      *(void *)&long long v17 = [(MIOImageSizeConstraint *)v8 pixelsWideRange];
      *((void *)&v17 + 1) = [(MIOImageSizeConstraint *)v8 pixelsHighRange];
      v12 = [[MIOImageSize alloc] initWithSpecification:v16];

      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      v9 = v12;
    }
LABEL_13:
    if (!v9)
    {
      CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
      long long v17 = 0uLL;
      v9 = [[MIOImageSize alloc] initWithSpecification:v16];
      CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v16);
    }
    goto LABEL_15;
  }
  return v5;
}

- (const)imageFeatureTypeSpecification
{
  return &self->_imageFeatureTypeParams;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(MIOImageConstraint *)self imageSize];
  int v5 = [(MIOImageConstraint *)self pixelFormatType];
  if (v5 > 1278226487)
  {
    if (v5 == 1278226488)
    {
      v6 = @"OneComponent8";
      goto LABEL_11;
    }
    if (v5 == 1278226536)
    {
      v6 = @"OneComponent16Half";
      goto LABEL_11;
    }
  }
  else
  {
    if (v5 == 32)
    {
      v6 = @"32ARGB";
      goto LABEL_11;
    }
    if (v5 == 1111970369)
    {
      v6 = @"32BGRA";
      goto LABEL_11;
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v7 = [(MIOImageConstraint *)self sizeConstraint];
  v8 = (void *)[v3 initWithFormat:@"MIOImageConstraint { imageSize: %@ format: %@ sizeConstraint: %@ }", v4, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOImageConstraint *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      v6 = [(MIOImageConstraint *)self imageSize];
      v7 = [(MIOImageConstraint *)v5 imageSize];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) != 0
        && (unsigned int v9 = [(MIOImageConstraint *)self pixelFormatType],
            v9 == [(MIOImageConstraint *)v5 pixelFormatType]))
      {
        v10 = [(MIOImageConstraint *)self sizeConstraint];
        uint64_t v11 = [(MIOImageConstraint *)v5 sizeConstraint];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unsigned)pixelFormatType
{
  unsigned int result = 1278226488;
  int colorspace = self->_imageFeatureTypeParams.colorspace_;
  p_int colorspace = &self->_imageFeatureTypeParams.colorspace_;
  int v4 = colorspace;
  if (colorspace > 29)
  {
    if (v4 == 30) {
      return 1111970369;
    }
    if (v4 == 40) {
      return 1278226536;
    }
  }
  else
  {
    if (v4 == 10) {
      return result;
    }
    if (v4 == 20) {
      return 32;
    }
  }
  unsigned int result = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (result)
  {
    -[MIOImageConstraint pixelFormatType](p_colorspace);
    return 0;
  }
  return result;
}

- (MIOImageSize)imageSize
{
  return self->_imageSize;
}

- (MIOImageSizeConstraint)sizeConstraint
{
  return self->_sizeConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeConstraint, 0);
  objc_storeStrong((id *)&self->_imageSize, 0);
  CoreML::Specification::ImageFeatureType::~ImageFeatureType((CoreML::Specification::ImageFeatureType *)&self->_imageFeatureTypeParams);
}

- (id).cxx_construct
{
  return self;
}

- (void)pixelFormatType
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image pixel type %d is not supported.", (uint8_t *)v2, 8u);
}

@end