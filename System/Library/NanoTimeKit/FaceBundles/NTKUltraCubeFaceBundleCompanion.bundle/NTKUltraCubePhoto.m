@interface NTKUltraCubePhoto
+ (BOOL)validateDictionary:(id)a3;
+ (id)decodeFromDictionary:(id)a3 forResourceDirectory:(id)a4;
- (BOOL)isParallaxFlat;
- (BOOL)isUserAdjusted;
- (CGRect)originalCrop;
- (NSDate)modificationDate;
- (NSString)localIdentifier;
- (NSString)uniqueIdentifier;
- (NSURL)backgroundImageURL;
- (NSURL)baseImageURL;
- (NSURL)maskImageURL;
- (NTKUltraCubePhoto)init;
- (double)baseImageZorder;
- (double)imageAOTBrightness;
- (double)maskedImageZorder;
- (double)parallaxScale;
- (double)timeElementUnitBaseline;
- (double)timeElementUnitHeight;
- (double)timeElementZorder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsDictionary;
- (void)setBackgroundImageURL:(id)a3;
- (void)setBaseImageURL:(id)a3;
- (void)setBaseImageZorder:(double)a3;
- (void)setImageAOTBrightness:(double)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setMaskImageURL:(id)a3;
- (void)setMaskedImageZorder:(double)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalCrop:(CGRect)a3;
- (void)setParallaxFlat:(BOOL)a3;
- (void)setParallaxScale:(double)a3;
- (void)setTimeElementUnitBaseline:(double)a3;
- (void)setTimeElementUnitHeight:(double)a3;
- (void)setTimeElementZorder:(double)a3;
- (void)setUserAdjusted:(BOOL)a3;
@end

@implementation NTKUltraCubePhoto

- (NTKUltraCubePhoto)init
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUltraCubePhoto;
  result = [(NTKUltraCubePhoto *)&v4 init];
  if (result)
  {
    CGSize size = CGRectNull.size;
    result->_originalCrop.origin = CGRectNull.origin;
    result->_originalCrop.CGSize size = size;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_localIdentifier copyWithZone:a3];
  [v5 setLocalIdentifier:v6];

  id v7 = [(NSDate *)self->_modificationDate copyWithZone:a3];
  [v5 setModificationDate:v7];

  objc_msgSend(v5, "setOriginalCrop:", self->_originalCrop.origin.x, self->_originalCrop.origin.y, self->_originalCrop.size.width, self->_originalCrop.size.height);
  id v8 = [(NSURL *)self->_baseImageURL copyWithZone:a3];
  [v5 setBaseImageURL:v8];

  id v9 = [(NSURL *)self->_maskImageURL copyWithZone:a3];
  [v5 setMaskImageURL:v9];

  id v10 = [(NSURL *)self->_backgroundImageURL copyWithZone:a3];
  [v5 setBackgroundImageURL:v10];

  [v5 setTimeElementUnitBaseline:self->_timeElementUnitBaseline];
  [v5 setTimeElementUnitHeight:self->_timeElementUnitHeight];
  [v5 setBaseImageZorder:self->_baseImageZorder];
  [v5 setMaskedImageZorder:self->_maskedImageZorder];
  [v5 setTimeElementZorder:self->_timeElementZorder];
  [v5 setImageAOTBrightness:self->_imageAOTBrightness];
  [v5 setUserAdjusted:self->_userAdjusted];
  [v5 setParallaxScale:self->_parallaxScale];
  [v5 setParallaxFlat:self->_parallaxFlat];
  return v5;
}

+ (id)decodeFromDictionary:(id)a3 forResourceDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"localIdentifier"];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [v5 objectForKeyedSubscript:@"modificationDate"];
    if (v9)
    {
      id v10 = (void *)v9;
      v11 = [v5 objectForKeyedSubscript:@"baseImageURL"];

      if (v11)
      {
        v12 = objc_opt_new();
        v13 = [v5 objectForKeyedSubscript:@"localIdentifier"];
        [v12 setLocalIdentifier:v13];

        v14 = [v5 objectForKeyedSubscript:@"modificationDate"];
        [v12 setModificationDate:v14];

        v15 = [v5 objectForKeyedSubscript:@"baseImageURL"];
        v16 = [v6 stringByAppendingPathComponent:v15];

        id v17 = [objc_alloc((Class)NSURL) initFileURLWithPath:v16 isDirectory:0];
        [v12 setBaseImageURL:v17];

        v18 = [v5 objectForKeyedSubscript:@"maskImageURL"];
        if (v18)
        {
          v19 = [v6 stringByAppendingPathComponent:v18];
          id v20 = [objc_alloc((Class)NSURL) initFileURLWithPath:v19 isDirectory:0];
          [v12 setMaskImageURL:v20];
        }
        v21 = [v5 objectForKeyedSubscript:@"backgroundImageURL"];
        if (v21)
        {
          v22 = [v6 stringByAppendingPathComponent:v21];
          id v23 = [objc_alloc((Class)NSURL) initFileURLWithPath:v22 isDirectory:0];
          [v12 setBackgroundImageURL:v23];
        }
        v24 = [v5 objectForKeyedSubscript:@"originalCropX"];
        [v24 doubleValue];
        double v26 = v25;

        v27 = [v5 objectForKeyedSubscript:@"originalCropY"];
        [v27 doubleValue];
        double v29 = v28;

        v30 = [v5 objectForKeyedSubscript:@"originalCropW"];
        [v30 doubleValue];
        double v32 = v31;

        v33 = [v5 objectForKeyedSubscript:@"originalCropH"];
        [v33 doubleValue];
        double v35 = v34;

        objc_msgSend(v12, "setOriginalCrop:", v26, v29, v32, v35);
        v36 = [v5 objectForKeyedSubscript:@"timeElementUnitBaseline"];
        [v36 floatValue];
        [v12 setTimeElementUnitBaseline:v37];

        v38 = [v5 objectForKeyedSubscript:@"timeElementUnitHeight"];
        [v38 floatValue];
        [v12 setTimeElementUnitHeight:v39];

        v40 = [v5 objectForKeyedSubscript:@"baseImageZorder"];
        [v40 floatValue];
        [v12 setBaseImageZorder:v41];

        v42 = [v5 objectForKeyedSubscript:@"maskedImageZorder"];
        [v42 floatValue];
        [v12 setMaskedImageZorder:v43];

        v44 = [v5 objectForKeyedSubscript:@"timeElementZorder"];
        [v44 floatValue];
        [v12 setTimeElementZorder:v45];

        v46 = [v5 objectForKeyedSubscript:@"imageAOTBrightness"];
        [v46 floatValue];
        [v12 setImageAOTBrightness:v47];

        v48 = [v5 objectForKeyedSubscript:@"userAdjusted"];
        v49 = v48;
        if (v48) {
          id v50 = [v48 BOOLValue];
        }
        else {
          id v50 = 0;
        }
        [v12 setUserAdjusted:v50];
        v52 = [v5 objectForKeyedSubscript:@"parallaxScale"];
        v53 = v52;
        if (v52)
        {
          [v52 floatValue];
          double v55 = v54;
        }
        else
        {
          double v55 = 0.0;
        }
        [v12 setParallaxScale:v55];
        v56 = [v5 objectForKeyedSubscript:@"parallaxFlat"];
        v57 = v56;
        if (v56) {
          id v58 = [v56 BOOLValue];
        }
        else {
          id v58 = 0;
        }
        [v12 setParallaxFlat:v58];

        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  v51 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
    sub_2BAB0((uint64_t)v5, v51);
  }

  v12 = 0;
LABEL_22:

  return v12;
}

- (id)encodeAsDictionary
{
  v3 = objc_opt_new();
  [v3 setObject:self->_localIdentifier forKeyedSubscript:@"localIdentifier"];
  [v3 setObject:self->_modificationDate forKeyedSubscript:@"modificationDate"];
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_baseImageURL, "fileSystemRepresentation"));
  id v5 = [v4 lastPathComponent];
  [v3 setObject:v5 forKeyedSubscript:@"baseImageURL"];

  if (self->_maskImageURL)
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_maskImageURL, "fileSystemRepresentation"));
    uint64_t v7 = [v6 lastPathComponent];
    [v3 setObject:v7 forKeyedSubscript:@"maskImageURL"];
  }
  if (self->_backgroundImageURL)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", -[NSURL fileSystemRepresentation](self->_backgroundImageURL, "fileSystemRepresentation"));
    uint64_t v9 = [v8 lastPathComponent];
    [v3 setObject:v9 forKeyedSubscript:@"backgroundImageURL"];
  }
  id v10 = +[NSNumber numberWithDouble:self->_originalCrop.origin.x];
  [v3 setObject:v10 forKeyedSubscript:@"originalCropX"];

  v11 = +[NSNumber numberWithDouble:self->_originalCrop.origin.y];
  [v3 setObject:v11 forKeyedSubscript:@"originalCropY"];

  v12 = +[NSNumber numberWithDouble:self->_originalCrop.size.width];
  [v3 setObject:v12 forKeyedSubscript:@"originalCropW"];

  v13 = +[NSNumber numberWithDouble:self->_originalCrop.size.height];
  [v3 setObject:v13 forKeyedSubscript:@"originalCropH"];

  v14 = +[NSNumber numberWithDouble:self->_timeElementUnitBaseline];
  [v3 setObject:v14 forKeyedSubscript:@"timeElementUnitBaseline"];

  v15 = +[NSNumber numberWithDouble:self->_timeElementUnitHeight];
  [v3 setObject:v15 forKeyedSubscript:@"timeElementUnitHeight"];

  v16 = +[NSNumber numberWithDouble:self->_baseImageZorder];
  [v3 setObject:v16 forKeyedSubscript:@"baseImageZorder"];

  id v17 = +[NSNumber numberWithDouble:self->_maskedImageZorder];
  [v3 setObject:v17 forKeyedSubscript:@"maskedImageZorder"];

  v18 = +[NSNumber numberWithDouble:self->_timeElementZorder];
  [v3 setObject:v18 forKeyedSubscript:@"timeElementZorder"];

  v19 = +[NSNumber numberWithDouble:self->_imageAOTBrightness];
  [v3 setObject:v19 forKeyedSubscript:@"imageAOTBrightness"];

  id v20 = +[NSNumber numberWithBool:self->_userAdjusted];
  [v3 setObject:v20 forKeyedSubscript:@"userAdjusted"];

  v21 = +[NSNumber numberWithDouble:self->_parallaxScale];
  [v3 setObject:v21 forKeyedSubscript:@"parallaxScale"];

  v22 = +[NSNumber numberWithBool:self->_parallaxFlat];
  [v3 setObject:v22 forKeyedSubscript:@"parallaxFlat"];

  return v3;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (CGRect)originalCrop
{
  double x = self->_originalCrop.origin.x;
  double y = self->_originalCrop.origin.y;
  double width = self->_originalCrop.size.width;
  double height = self->_originalCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalCrop:(CGRect)a3
{
  self->_originalCrop = a3;
}

- (NSURL)baseImageURL
{
  return self->_baseImageURL;
}

- (void)setBaseImageURL:(id)a3
{
}

- (NSURL)maskImageURL
{
  return self->_maskImageURL;
}

- (void)setMaskImageURL:(id)a3
{
}

- (NSURL)backgroundImageURL
{
  return self->_backgroundImageURL;
}

- (void)setBackgroundImageURL:(id)a3
{
}

- (double)timeElementUnitBaseline
{
  return self->_timeElementUnitBaseline;
}

- (void)setTimeElementUnitBaseline:(double)a3
{
  self->_timeElementUnitBaseline = a3;
}

- (double)timeElementUnitHeight
{
  return self->_timeElementUnitHeight;
}

- (void)setTimeElementUnitHeight:(double)a3
{
  self->_timeElementUnitHeight = a3;
}

- (double)baseImageZorder
{
  return self->_baseImageZorder;
}

- (void)setBaseImageZorder:(double)a3
{
  self->_baseImageZorder = a3;
}

- (double)maskedImageZorder
{
  return self->_maskedImageZorder;
}

- (void)setMaskedImageZorder:(double)a3
{
  self->_maskedImageZorder = a3;
}

- (double)timeElementZorder
{
  return self->_timeElementZorder;
}

- (void)setTimeElementZorder:(double)a3
{
  self->_timeElementZorder = a3;
}

- (double)imageAOTBrightness
{
  return self->_imageAOTBrightness;
}

- (void)setImageAOTBrightness:(double)a3
{
  self->_imageAOTBrightness = a3;
}

- (BOOL)isUserAdjusted
{
  return self->_userAdjusted;
}

- (void)setUserAdjusted:(BOOL)a3
{
  self->_userAdjusted = a3;
}

- (BOOL)isParallaxFlat
{
  return self->_parallaxFlat;
}

- (void)setParallaxFlat:(BOOL)a3
{
  self->_parallaxFlat = a3;
}

- (double)parallaxScale
{
  return self->_parallaxScale;
}

- (void)setParallaxScale:(double)a3
{
  self->_parallaxScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageURL, 0);
  objc_storeStrong((id *)&self->_maskImageURL, 0);
  objc_storeStrong((id *)&self->_baseImageURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

- (NSString)uniqueIdentifier
{
  v3 = [(NTKUltraCubePhoto *)self localIdentifier];
  id v4 = +[PHObject uuidFromLocalIdentifier:v3];

  if (!v4)
  {
    id v4 = [(NTKUltraCubePhoto *)self localIdentifier];
  }
  [(NTKUltraCubePhoto *)self maskedImageZorder];
  uint64_t v6 = v5;
  [(NTKUltraCubePhoto *)self timeElementZorder];
  uint64_t v8 = v7;
  [(NTKUltraCubePhoto *)self timeElementUnitBaseline];
  id v10 = +[NSString stringWithFormat:@"%05.1f-%05.1f-%05.1f", v6, v8, v9];
  v11 = [(NTKUltraCubePhoto *)self modificationDate];
  [v11 timeIntervalSince1970];
  v13 = +[NSString stringWithFormat:@"%@-%ld-%@", v4, (uint64_t)v12, v10];

  [(NTKUltraCubePhoto *)self originalCrop];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  if (!CGRectIsEmpty(v21))
  {
    uint64_t v18 = objc_msgSend(v13, "stringByAppendingFormat:", @"-((%05.1f-%05.1f)-(%05.1f,%05.1f))", *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);

    v13 = (void *)v18;
  }

  return (NSString *)v13;
}

+ (BOOL)validateDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();
  objc_opt_class();
  NTKValidateDictionaryValue();

  return 1;
}

@end