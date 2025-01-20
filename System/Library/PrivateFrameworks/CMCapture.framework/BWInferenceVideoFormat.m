@interface BWInferenceVideoFormat
+ (id)formatByResolvingRequirements:(id)a3;
- (BOOL)deviceOriented;
- (BOOL)includesInvalidContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsCompressedEquivalent;
- (BWInferenceCropDescriptor)cropDescriptor;
- (BWInferenceVideoFormat)initWithUnderlyingFormat:(id)a3 isDeviceOriented:(BOOL)a4 videoContentMode:(int64_t)a5 includesInvalidContent:(BOOL)a6 cropDescriptor:(id)a7 histogramRequest:(id)a8 rotationDegrees:(int)a9;
- (BWVideoFormat)underlyingVideoFormat;
- (NSDictionary)pixelBufferAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)histogramRequest;
- (int)colorSpaceProperties;
- (int)rotationDegrees;
- (int64_t)videoContentMode;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)extendedHeight;
- (unint64_t)extendedWidth;
- (unint64_t)hash;
- (unint64_t)height;
- (unint64_t)width;
- (unsigned)pixelFormat;
- (unsigned)uncompressedEquivalent;
- (void)dealloc;
@end

@implementation BWInferenceVideoFormat

- (NSDictionary)pixelBufferAttributes
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat pixelBufferAttributes];
}

+ (id)formatByResolvingRequirements:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id result = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:");
  if (result)
  {
    id v5 = result;
    v6 = (void *)[a3 firstObject];
    uint64_t v7 = [v6 deviceOriented];
    uint64_t v8 = [v6 videoContentMode];
    uint64_t v9 = [v6 includesInvalidContent];
    v21 = (void *)[v6 cropDescriptor];
    uint64_t v10 = [v6 histogramRequest];
    int v11 = [v6 rotationDegrees];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      uint64_t v19 = v10;
      id v20 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(a3);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (v7 == [v16 deviceOriented]
            && [v16 videoContentMode] == v8
            && v9 == [v16 includesInvalidContent])
          {
            int v17 = objc_msgSend((id)objc_msgSend(v16, "cropDescriptor"), "identifier");
            if (v17 == [v21 identifier]
              && [v16 rotationDegrees] == v11)
            {
              continue;
            }
          }
          return 0;
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
        uint64_t v10 = v19;
        id v5 = v20;
        if (v13) {
          continue;
        }
        break;
      }
    }
    LODWORD(v18) = v11;
    return [[BWInferenceVideoFormat alloc] initWithUnderlyingFormat:v5 isDeviceOriented:v7 videoContentMode:v8 includesInvalidContent:v9 cropDescriptor:v21 histogramRequest:v10 rotationDegrees:v18];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = [[BWVideoFormatRequirements alloc] initWithPixelBufferAttributes:[(BWVideoFormat *)self->_underlyingVideoFormat pixelBufferAttributes]];
  v10[0] = objc_msgSend(NSNumber, "numberWithInt:", -[BWInferenceVideoFormat colorSpaceProperties](self, "colorSpaceProperties"));
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
  uint64_t v9 = v4;
  id v5 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1]);

  v6 = [BWInferenceVideoFormat alloc];
  LODWORD(v8) = self->_rotationDegrees;
  return [(BWInferenceVideoFormat *)v6 initWithUnderlyingFormat:v5 isDeviceOriented:self->_deviceOriented videoContentMode:self->_videoContentMode includesInvalidContent:self->_includesInvalidContent cropDescriptor:self->_cropDescriptor histogramRequest:self->_histogramRequest rotationDegrees:v8];
}

- (BWInferenceVideoFormat)initWithUnderlyingFormat:(id)a3 isDeviceOriented:(BOOL)a4 videoContentMode:(int64_t)a5 includesInvalidContent:(BOOL)a6 cropDescriptor:(id)a7 histogramRequest:(id)a8 rotationDegrees:(int)a9
{
  v17.receiver = self;
  v17.super_class = (Class)BWInferenceVideoFormat;
  v15 = [(BWInferenceVideoFormat *)&v17 init];
  if (v15)
  {
    v15->_underlyingVideoFormat = (BWVideoFormat *)a3;
    v15->_deviceOriented = a4;
    v15->_videoContentMode = a5;
    v15->_includesInvalidContent = a6;
    v15->_cropDescriptor = (BWInferenceCropDescriptor *)a7;
    v15->_histogramRequest = (id)[a8 copy];
    v15->_rotationDegrees = a9;
  }
  return v15;
}

- (unint64_t)hash
{
  unsigned __int16 v3 = [(BWInferenceVideoFormat *)self pixelFormat];
  uint64_t v4 = v3 | ((unsigned __int16)[(BWInferenceVideoFormat *)self width] << 16);
  unint64_t v5 = v4 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)[(BWInferenceVideoFormat *)self height] << 32);
  unint64_t v6 = ([(BWInferenceVideoFormat *)self colorSpaceProperties] & 4uLL) >> 2;
  if ([(BWInferenceVideoFormat *)self deviceOriented]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 0x8000000000000;
  }
  if ([(BWInferenceVideoFormat *)self includesInvalidContent]) {
    uint64_t v8 = 0x10000000000000;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = (v5 | v7) & 0xFFFBFFFFFFFFFFFFLL | ((v6 & 1) << 50) | v8 | ((unint64_t)(((char)[(BWInferenceVideoFormat *)self rotationDegrees]/ 90) & 3) << 53);
  unint64_t v10 = v9 & 0xFF7FFFFFFFFFFFFFLL | (([(BWInferenceVideoFormat *)self videoContentMode] & 1) << 55);
  uint64_t v11 = v10 | (([(BWInferenceCropDescriptor *)[(BWInferenceVideoFormat *)self cropDescriptor] identifier] & 0xF) << 56);
  return v11 | ([(BWVideoFormat *)[(BWInferenceVideoFormat *)self underlyingVideoFormat] bytesPerRowAlignment] << 60);
}

- (int)colorSpaceProperties
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat colorSpaceProperties];
}

- (unsigned)pixelFormat
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat pixelFormat];
}

- (unint64_t)height
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat height];
}

- (unint64_t)width
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat width];
}

- (BOOL)deviceOriented
{
  return self->_deviceOriented;
}

- (BWVideoFormat)underlyingVideoFormat
{
  return self->_underlyingVideoFormat;
}

- (BWInferenceCropDescriptor)cropDescriptor
{
  return self->_cropDescriptor;
}

- (BOOL)includesInvalidContent
{
  return self->_includesInvalidContent;
}

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (id)histogramRequest
{
  return self->_histogramRequest;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoFormat;
  [(BWInferenceVideoFormat *)&v3 dealloc];
}

- (unsigned)uncompressedEquivalent
{
  uint64_t v2 = [(BWInferenceVideoFormat *)self pixelFormat];
  return FigCaptureUncompressedPixelFormatForPixelFormat(v2);
}

- (unint64_t)extendedWidth
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat extendedWidth];
}

- (unint64_t)extendedHeight
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat extendedHeight];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    BOOL v5 = -[BWVideoFormat isEqual:](self->_underlyingVideoFormat, "isEqual:", [a3 underlyingVideoFormat]);
    if (!v5) {
      return v5;
    }
    int deviceOriented = self->_deviceOriented;
    if (deviceOriented != [a3 deviceOriented]
      || (int64_t videoContentMode = self->_videoContentMode, videoContentMode != [a3 videoContentMode])
      || (int includesInvalidContent = self->_includesInvalidContent,
          includesInvalidContent != [a3 includesInvalidContent])
      || (int v9 = [(BWInferenceCropDescriptor *)self->_cropDescriptor identifier],
          v9 != objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier")))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    int rotationDegrees = self->_rotationDegrees;
    LOBYTE(v5) = rotationDegrees == [a3 rotationDegrees];
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> deviceOriented:%d videoContentMode:%ld includesInvalidContent:%ld cropDesciptor:%@ underlyingVideoFormat:%@ rotationDegrees:%d", objc_opt_class(), self, self->_deviceOriented, self->_videoContentMode, self->_includesInvalidContent, self->_cropDescriptor, self->_underlyingVideoFormat, self->_rotationDegrees];
}

- (opaqueCMFormatDescription)formatDescription
{
  return [(BWVideoFormat *)self->_underlyingVideoFormat formatDescription];
}

- (BOOL)representsCompressedEquivalent
{
  int v3 = FigCaptureUncompressedPixelFormatForPixelFormat([(BWInferenceVideoFormat *)self pixelFormat]);
  return [(BWInferenceVideoFormat *)self pixelFormat] != v3;
}

@end