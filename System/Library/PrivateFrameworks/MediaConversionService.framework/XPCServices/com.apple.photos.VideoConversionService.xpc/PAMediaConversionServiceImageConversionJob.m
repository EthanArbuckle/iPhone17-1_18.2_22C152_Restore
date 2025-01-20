@interface PAMediaConversionServiceImageConversionJob
- (BOOL)_validateMetadata;
- (BOOL)_validateOrientation;
- (BOOL)_validateOutputSize;
- (BOOL)_validateSource;
- (BOOL)applySourceOrientationTransform;
- (BOOL)canAccessSourceImageProperties;
- (BOOL)formatConversionOnly;
- (BOOL)hasLivePhotoSourceURLs;
- (BOOL)hasPhotosAdjustments;
- (BOOL)isRAWSourceUTI;
- (BOOL)shouldCheckForOutputCorruption;
- (BOOL)shouldUseEmbeddedImageAsSource;
- (BOOL)sourceRequiresRasterization;
- (BOOL)valid;
- (BOOL)validateSourceAndOptions;
- (CGImage)sourceImageRef;
- (CGImageDestination)imageDestination;
- (CGImageSource)imageSource;
- (CGSize)outputImageSize;
- (CGSize)sourceImageSize;
- (NSData)destinationData;
- (NSData)photosAdjustmentData;
- (NSDictionary)adjustmentInformation;
- (NSDictionary)sourceImageProperties;
- (NSError)error;
- (NSMutableData)imageDestinationData;
- (NSMutableDictionary)destinationImageProperties;
- (NSNumber)candidacy;
- (NSString)inputFileType;
- (NSString)outputFileType;
- (NSString)photosAdjustmentFormatIdentifier;
- (NSString)photosAdjustmentFormatVersion;
- (NSString)requestIdentifier;
- (NSString)sourceUTI;
- (NSURL)adjustmentSidecarDataResourceURL;
- (NSURL)mainSourceResourceURL;
- (PAMediaConversionServiceImageConversionJob)initWithRequestIdentifier:(id)a3 sourceResourceURLCollection:(id)a4 outputFileType:(id)a5;
- (PAMediaConversionServiceImageMetadataPolicy)metadataPolicy;
- (PAMediaConversionServiceResourceURLCollection)destinationResourceURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceResourceURLCollection;
- (double)scaleFactor;
- (int64_t)colorspaceMode;
- (int64_t)orientation;
- (int64_t)rasterizationDPI;
- (int64_t)requestedMaximumLongSideLength;
- (int64_t)requestedMaximumPixelCount;
- (int64_t)requestedOrCalculatedMaximumLongSideLength;
- (int64_t)sourceOrientation;
- (unint64_t)orientationTransformBehavior;
- (unint64_t)status;
- (unint64_t)validationState;
- (void)_validate;
- (void)dealloc;
- (void)setAdjustmentInformation:(id)a3;
- (void)setApplySourceOrientationTransform:(BOOL)a3;
- (void)setCandidacy:(id)a3;
- (void)setColorspaceMode:(int64_t)a3;
- (void)setDestinationData:(id)a3;
- (void)setDestinationResourceURLCollection:(id)a3;
- (void)setError:(id)a3;
- (void)setFormatConversionOnly:(BOOL)a3;
- (void)setImageDestination:(CGImageDestination *)a3;
- (void)setImageDestinationData:(id)a3;
- (void)setImageSource:(CGImageSource *)a3;
- (void)setInputFileType:(id)a3;
- (void)setMetadataPolicy:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOutputFileType:(id)a3;
- (void)setOutputImageSize:(CGSize)a3;
- (void)setRasterizationDPI:(int64_t)a3;
- (void)setRequestedMaximumLongSideLength:(int64_t)a3;
- (void)setRequestedMaximumPixelCount:(int64_t)a3;
- (void)setScaleFactor:(double)a3;
- (void)setShouldCheckForOutputCorruption:(BOOL)a3;
- (void)setShouldUseEmbeddedImageAsSource:(BOOL)a3;
- (void)setSourceResourceURLCollection:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setValidationState:(unint64_t)a3;
@end

@implementation PAMediaConversionServiceImageConversionJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDestinationData, 0);
  objc_storeStrong((id *)&self->_candidacy, 0);
  objc_storeStrong((id *)&self->_metadataPolicy, 0);
  objc_storeStrong((id *)&self->_outputFileType, 0);
  objc_storeStrong((id *)&self->_inputFileType, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_adjustmentInformation, 0);
  objc_storeStrong((id *)&self->_destinationData, 0);
  objc_storeStrong((id *)&self->_destinationResourceURLCollection, 0);
  objc_storeStrong((id *)&self->_sourceResourceURLCollection, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationImageProperties, 0);
  objc_storeStrong((id *)&self->_sourceImageProperties, 0);
}

- (void)setValidationState:(unint64_t)a3
{
  self->_validationState = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (void)setImageDestination:(CGImageDestination *)a3
{
  self->_imageDestination = a3;
}

- (CGImageDestination)imageDestination
{
  return self->_imageDestination;
}

- (void)setImageDestinationData:(id)a3
{
}

- (NSMutableData)imageDestinationData
{
  return (NSMutableData *)objc_getProperty(self, a2, 192, 1);
}

- (void)setImageSource:(CGImageSource *)a3
{
  self->_imageSource = a3;
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setShouldUseEmbeddedImageAsSource:(BOOL)a3
{
  self->_shouldUseEmbeddedImageAsSource = a3;
}

- (BOOL)shouldUseEmbeddedImageAsSource
{
  return self->_shouldUseEmbeddedImageAsSource;
}

- (void)setCandidacy:(id)a3
{
}

- (NSNumber)candidacy
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOutputImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_outputImageSize, &v3, 16, 1, 0);
}

- (CGSize)outputImageSize
{
  objc_copyStruct(v4, &self->_outputImageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMetadataPolicy:(id)a3
{
}

- (PAMediaConversionServiceImageMetadataPolicy)metadataPolicy
{
  return (PAMediaConversionServiceImageMetadataPolicy *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOutputFileType:(id)a3
{
}

- (NSString)outputFileType
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputFileType:(id)a3
{
}

- (NSString)inputFileType
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAdjustmentInformation:(id)a3
{
}

- (NSDictionary)adjustmentInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setShouldCheckForOutputCorruption:(BOOL)a3
{
  self->_shouldCheckForOutputCorruption = a3;
}

- (BOOL)shouldCheckForOutputCorruption
{
  return self->_shouldCheckForOutputCorruption;
}

- (void)setFormatConversionOnly:(BOOL)a3
{
  self->_formatConversionOnly = a3;
}

- (BOOL)formatConversionOnly
{
  return self->_formatConversionOnly;
}

- (void)setColorspaceMode:(int64_t)a3
{
  self->_colorspaceMode = a3;
}

- (int64_t)colorspaceMode
{
  return self->_colorspaceMode;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setApplySourceOrientationTransform:(BOOL)a3
{
  self->_applySourceOrientationTransform = a3;
}

- (BOOL)applySourceOrientationTransform
{
  return self->_applySourceOrientationTransform;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setRequestedMaximumLongSideLength:(int64_t)a3
{
  self->_requestedMaximumLongSideLength = a3;
}

- (int64_t)requestedMaximumLongSideLength
{
  return self->_requestedMaximumLongSideLength;
}

- (void)setRequestedMaximumPixelCount:(int64_t)a3
{
  self->_requestedMaximumPixelCount = a3;
}

- (int64_t)requestedMaximumPixelCount
{
  return self->_requestedMaximumPixelCount;
}

- (void)setDestinationData:(id)a3
{
}

- (NSData)destinationData
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDestinationResourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)destinationResourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSourceResourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceResourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)requestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRasterizationDPI:(int64_t)a3
{
  self->_rasterizationDPI = a3;
}

- (int64_t)rasterizationDPI
{
  return self->_rasterizationDPI;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  imageDestination = self->_imageDestination;
  if (imageDestination) {
    CFRelease(imageDestination);
  }
  sourceImageRef = self->_sourceImageRef;
  if (sourceImageRef) {
    CGImageRelease(sourceImageRef);
  }
  v6.receiver = self;
  v6.super_class = (Class)PAMediaConversionServiceImageConversionJob;
  [(PAMediaConversionServiceImageConversionJob *)&v6 dealloc];
}

- (CGSize)sourceImageSize
{
  if ([(PAMediaConversionServiceImageConversionJob *)self canAccessSourceImageProperties])
  {
    double v3 = [(PAMediaConversionServiceImageConversionJob *)self sourceImageProperties];
    +[PFMediaUtilities maximumImageSizeFromProperties:v3];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double Height = v7;
  }
  else
  {
    v10 = [(PAMediaConversionServiceImageConversionJob *)self sourceImageRef];
    double Width = (double)CGImageGetWidth(v10);
    double Height = (double)CGImageGetHeight(v10);
    double v8 = Width;
  }
  result.height = Height;
  result.width = v8;
  return result;
}

- (int64_t)sourceOrientation
{
  if (![(PAMediaConversionServiceImageConversionJob *)self canAccessSourceImageProperties])return 1; {
  double v3 = [(PAMediaConversionServiceImageConversionJob *)self sourceImageProperties];
  }
  double v4 = [v3 objectForKeyedSubscript:kCGImagePropertyOrientation];

  if (!v4) {
    return 1;
  }
  id v5 = [v4 integerValue];

  return (int64_t)v5;
}

- (BOOL)isRAWSourceUTI
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self sourceUTI];
  double v3 = +[PFUniformTypeUtilities typeWithIdentifier:v2];
  unsigned __int8 v4 = [v3 conformsToType:UTTypeRAWImage];

  return v4;
}

- (NSString)sourceUTI
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self sourceResourceURLCollection];
  double v3 = [v2 typeIdentifierForResourceURLWithRole:@"PAMediaConversionResourceRoleMainResource"];

  return (NSString *)v3;
}

- (BOOL)sourceRequiresRasterization
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self sourceUTI];
  double v3 = +[PFUniformTypeUtilities typeWithIdentifier:v2];
  unsigned __int8 v4 = +[PFMediaUtilities typeRequiresRasterizationDPI:v3];

  return v4;
}

- (NSDictionary)sourceImageProperties
{
  sourceImageProperties = self->_sourceImageProperties;
  if (sourceImageProperties)
  {
LABEL_2:
    double v3 = sourceImageProperties;
    goto LABEL_3;
  }
  if ([(PAMediaConversionServiceImageConversionJob *)self canAccessSourceImageProperties])
  {
    double v6 = [(PAMediaConversionServiceImageConversionJob *)self sourceResourceURLCollection];
    unsigned int v7 = [v6 isBlastDoorAccessRequired];

    if (v7)
    {
      double v8 = [(PAMediaConversionServiceImageConversionJob *)self sourceResourceURLCollection];
      v9 = [v8 blastDoorMainSourceProperties];
      v10 = self->_sourceImageProperties;
      self->_sourceImageProperties = v9;
    }
    else
    {
      v11 = +[PFMediaUtilities imagePropertiesFromImageSource:self->_imageSource];
      double v8 = self->_sourceImageProperties;
      self->_sourceImageProperties = v11;
    }

    sourceImageProperties = self->_sourceImageProperties;
    if (!sourceImageProperties)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v13 = [(PAMediaConversionServiceImageConversionJob *)self mainSourceResourceURL];
        int v14 = 138412290;
        v15 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get source image properties for %@", (uint8_t *)&v14, 0xCu);

        sourceImageProperties = self->_sourceImageProperties;
      }
      else
      {
        sourceImageProperties = 0;
      }
    }
    goto LABEL_2;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v12 = [(PAMediaConversionServiceImageConversionJob *)self mainSourceResourceURL];
    int v14 = 138412290;
    v15 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get source image properties for input image: %@", (uint8_t *)&v14, 0xCu);
  }
  double v3 = 0;
LABEL_3:
  return v3;
}

- (NSMutableDictionary)destinationImageProperties
{
  if (![(PAMediaConversionServiceImageConversionJob *)self valid])
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1195 description:@"Invalid job"];
  }
  destinationImageProperties = self->_destinationImageProperties;
  return destinationImageProperties;
}

- (BOOL)canAccessSourceImageProperties
{
  return ![(PAMediaConversionServiceImageConversionJob *)self sourceRequiresRasterization];
}

- (CGImage)sourceImageRef
{
  CGSize result = self->_sourceImageRef;
  if (!result)
  {
    if ([(PAMediaConversionServiceImageConversionJob *)self sourceRequiresRasterization])
    {
      uint64_t v11 = kCGImageSourceRasterizationDPI;
      unsigned __int8 v4 = +[NSNumber numberWithInteger:self->_rasterizationDPI];
      v12 = v4;
      CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    }
    else
    {
      CFDictionaryRef v5 = 0;
    }
    ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, 0, v5);
    self->_sourceImageRef = ImageAtIndex;
    if (!ImageAtIndex && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unsigned int v7 = [(PAMediaConversionServiceImageConversionJob *)self mainSourceResourceURL];
      double v8 = [v7 path];
      int v9 = 138412290;
      v10 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image ref from %@", (uint8_t *)&v9, 0xCu);
    }
    return self->_sourceImageRef;
  }
  return result;
}

- (NSURL)adjustmentSidecarDataResourceURL
{
  return (NSURL *)[(PAMediaConversionServiceResourceURLCollection *)self->_sourceResourceURLCollection resourceURLForRole:@"PAMediaConversionResourceRoleCompositionSidecarDataFile"];
}

- (NSURL)mainSourceResourceURL
{
  unsigned __int8 v4 = [(PAMediaConversionServiceResourceURLCollection *)self->_sourceResourceURLCollection resourceURLForRole:@"PAMediaConversionResourceRoleMainResource"];
  if ([(PAMediaConversionServiceResourceURLCollection *)self->_sourceResourceURLCollection isBlastDoorAccessRequired])
  {
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Unexpected nil main resource URL for blastDoorAccess", v7, 2u);
    }
  }
  else if (!v4)
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1160 description:@"Unexpected nil main resource URL"];
  }
  return (NSURL *)v4;
}

- (unint64_t)orientationTransformBehavior
{
  if (![(PAMediaConversionServiceImageConversionJob *)self valid])
  {
    CFDictionaryRef v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1148 description:@"Invalid job"];
  }
  return self->_orientationTransformBehavior;
}

- (NSString)photosAdjustmentFormatVersion
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self adjustmentInformation];
  double v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatVersionKey"];

  return (NSString *)v3;
}

- (NSString)photosAdjustmentFormatIdentifier
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self adjustmentInformation];
  double v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentFormatIdentifierKey"];

  return (NSString *)v3;
}

- (NSData)photosAdjustmentData
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self adjustmentInformation];
  double v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceAdjustmentDataKey"];

  return (NSData *)v3;
}

- (BOOL)hasLivePhotoSourceURLs
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self sourceResourceURLCollection];
  v6[0] = @"PAMediaConversionResourceRoleMainResource";
  v6[1] = @"PAMediaConversionResourceRoleVideoComplement";
  double v3 = +[NSArray arrayWithObjects:v6 count:2];
  unsigned __int8 v4 = [v2 containsAllRoles:v3];

  return v4;
}

- (BOOL)hasPhotosAdjustments
{
  double v2 = [(PAMediaConversionServiceImageConversionJob *)self photosAdjustmentData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)valid
{
  unint64_t validationState = self->_validationState;
  if (!validationState)
  {
    double v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceSharedUtilitiesServiceSide.m" lineNumber:1117 description:@"Call validateSourceAndOptions on job before calling valid"];

    unint64_t validationState = self->_validationState;
  }
  return validationState == 2;
}

- (int64_t)requestedOrCalculatedMaximumLongSideLength
{
  if ([(PAMediaConversionServiceImageConversionJob *)self requestedMaximumLongSideLength])
  {
    return [(PAMediaConversionServiceImageConversionJob *)self requestedMaximumLongSideLength];
  }
  else
  {
    [(PAMediaConversionServiceImageConversionJob *)self sourceImageSize];
    double v5 = v4;
    double v7 = v6;
    [(PAMediaConversionServiceImageConversionJob *)self scaleFactor];
    if (v5 >= v7) {
      double v9 = v5;
    }
    else {
      double v9 = v7;
    }
    int64_t v10 = llround(v8 * v9);
    return v10 - ((v10 > 1) & v10);
  }
}

- (BOOL)_validateOutputSize
{
  [(PAMediaConversionServiceImageConversionJob *)self sourceImageSize];
  BOOL v5 = v4 != 0.0 && v3 != 0.0;
  if (v5)
  {
    double v6 = v3;
    double v7 = v4;
    if ([(PAMediaConversionServiceImageConversionJob *)self requestedMaximumPixelCount])
    {
      [(PAMediaConversionServiceImageConversionJob *)self requestedMaximumPixelCount];
      PFScaleFactorForMaximumPixelCount();
    }
    else
    {
      if (![(PAMediaConversionServiceImageConversionJob *)self requestedMaximumLongSideLength])
      {
LABEL_15:
        [(PAMediaConversionServiceImageConversionJob *)self scaleFactor];
        if (v11 > 1.0) {
          double v11 = 1.0;
        }
        [(PAMediaConversionServiceImageConversionJob *)self setScaleFactor:v11];
        return v5;
      }
      uint64_t v9 = [(PAMediaConversionServiceImageConversionJob *)self requestedMaximumLongSideLength];
      if (v6 >= v7) {
        double v10 = v6;
      }
      else {
        double v10 = v7;
      }
      double v8 = (double)v9 / v10;
    }
    [(PAMediaConversionServiceImageConversionJob *)self setScaleFactor:v8];
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to determine input image size", v13, 2u);
  }
  return v5;
}

- (BOOL)_validateOrientation
{
  int64_t v3 = [(PAMediaConversionServiceImageConversionJob *)self sourceOrientation];
  if ([(PAMediaConversionServiceImageConversionJob *)self applySourceOrientationTransform])
  {
    [(PAMediaConversionServiceImageConversionJob *)self setOrientation:v3];
  }
  int64_t v4 = [(PAMediaConversionServiceImageConversionJob *)self orientation];
  self->_orientationTransformBehavior = 0;
  if (IPAOrientationIsValid())
  {
    if (v4 == v3)
    {
      if (v3 == 1)
      {
LABEL_12:
        [(NSMutableDictionary *)self->_destinationImageProperties removeObjectForKey:kCGImagePropertyOrientation];
        goto LABEL_13;
      }
      unint64_t v5 = 1;
    }
    else
    {
      unint64_t v5 = 2;
    }
    self->_orientationTransformBehavior = v5;
    goto LABEL_12;
  }
  if (!v4)
  {
LABEL_13:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    int v8 = 134217984;
    int64_t v9 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid orientation request option %ld", (uint8_t *)&v8, 0xCu);
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_validateMetadata
{
  if ([(PAMediaConversionServiceImageConversionJob *)self canAccessSourceImageProperties])
  {
    int64_t v3 = [(PAMediaConversionServiceImageConversionJob *)self metadataPolicy];

    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No metadata policy provided, defaulting to standard policy", v13, 2u);
      }
      int64_t v4 = +[PAMediaConversionServiceImageMetadataPolicy standardPolicy];
      [(PAMediaConversionServiceImageConversionJob *)self setMetadataPolicy:v4];
    }
    unint64_t v5 = [(PAMediaConversionServiceImageConversionJob *)self metadataPolicy];
    BOOL v6 = [(PAMediaConversionServiceImageConversionJob *)self sourceImageProperties];
    double v7 = [v5 processMetadata:v6];
    int v8 = (NSMutableDictionary *)[v7 mutableCopy];
    destinationImageProperties = self->_destinationImageProperties;
    self->_destinationImageProperties = v8;
  }
  else
  {
    double v10 = +[NSMutableDictionary dictionary];
    double v11 = self->_destinationImageProperties;
    self->_destinationImageProperties = v10;
  }
  return 1;
}

- (BOOL)_validateSource
{
  CFURLRef v3 = [(PAMediaConversionServiceImageConversionJob *)self mainSourceResourceURL];
  v14[0] = &__kCFBooleanFalse;
  v13[0] = kCGImageSourceShouldCache;
  v13[1] = kCGImageSourceRasterizationDPI;
  int64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[PFMediaUtilities defaultRasterizationDPI]);
  v14[1] = v4;
  self->_imageSource = CGImageSourceCreateWithURL(v3, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2]);

  if (!self->_imageSource)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v10 = [(__CFURL *)v3 path];
      int v11 = 138412290;
      v12 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image source from %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_7;
  }
  unint64_t v5 = +[NSMutableData data];
  imageDestinationData = self->_imageDestinationData;
  self->_imageDestinationData = v5;

  BOOL v7 = 1;
  int v8 = CGImageDestinationCreateWithData((CFMutableDataRef)self->_imageDestinationData, (CFStringRef)self->_outputFileType, 1uLL, 0);
  self->_imageDestination = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create output image destination", (uint8_t *)&v11, 2u);
    }
LABEL_7:
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_validate
{
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, self);
  id v4 = &_os_log_default;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, v3, "com.apple.photos.mediaconversion.service.validate", (const char *)&unk_10003D619, buf, 2u);
  }

  if ([(PAMediaConversionServiceImageConversionJob *)self _validateSource]
    && [(PAMediaConversionServiceImageConversionJob *)self _validateMetadata]
    && [(PAMediaConversionServiceImageConversionJob *)self _validateOrientation])
  {
    unsigned int v5 = [(PAMediaConversionServiceImageConversionJob *)self _validateOutputSize];
    unint64_t v6 = 1;
    if (v5) {
      unint64_t v6 = 2;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }
  self->_unint64_t validationState = v6;
  id v7 = &_os_log_default;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)int v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, v3, "com.apple.photos.mediaconversion.service.validate", (const char *)&unk_10003D619, v8, 2u);
  }
}

- (BOOL)validateSourceAndOptions
{
  if (!self->_validationState) {
    [(PAMediaConversionServiceImageConversionJob *)self _validate];
  }
  return [(PAMediaConversionServiceImageConversionJob *)self valid];
}

- (PAMediaConversionServiceImageConversionJob)initWithRequestIdentifier:(id)a3 sourceResourceURLCollection:(id)a4 outputFileType:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 980, @"Invalid parameter not satisfying: %@", @"resourceURLCollection" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PAMediaConversionServiceImageConversionJob;
  v13 = [(PAMediaConversionServiceImageConversionJob *)&v17 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestIdentifier, a3);
    objc_storeStrong((id *)&v14->_sourceResourceURLCollection, a4);
    objc_storeStrong((id *)&v14->_outputFileType, a5);
    v14->_rasterizationDPI = (int64_t)+[PFMediaUtilities defaultRasterizationDPI];
  }

  return v14;
}

@end