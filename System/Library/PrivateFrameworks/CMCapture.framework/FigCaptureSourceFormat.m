@interface FigCaptureSourceFormat
- ($2825F4736939C4A6D3AD43837233062D)defaultHighResStillImageDimensions;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- ($2825F4736939C4A6D3AD43837233062D)soleHighResStillImageDimensions;
- (BOOL)isDefaultActiveFormat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExperimental;
- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3;
- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4;
- (NSArray)highResStillImageDimensions;
- (NSString)uniqueID;
- (float)maxSupportedFrameRate;
- (float)minSupportedFrameRate;
- (id)description;
- (id)formatDictionary;
- (int)maxPoints;
- (opaqueCMFormatDescription)formatDescription;
- (unsigned)format;
- (unsigned)mediaType;
- (void)dealloc;
@end

@implementation FigCaptureSourceFormat

- (opaqueCMFormatDescription)formatDescription
{
  v9[2] = *MEMORY[0x1E4F143B8];
  CFTypeRef arg = 0;
  $2825F4736939C4A6D3AD43837233062D v3 = [(FigCaptureSourceFormat *)self dimensions];
  if ([(FigCaptureSourceFormat *)self format] == 1785950320)
  {
    v8[0] = *MEMORY[0x1E4F21640];
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureSourceFormat maxPoints](self, "maxPoints"));
    v8[1] = *MEMORY[0x1E4F1EE20];
    v9[0] = v4;
    v9[1] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v5 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(FigCaptureSourceFormat *)self mediaType], [(FigCaptureSourceFormat *)self format], v5, (CMFormatDescriptionRef *)&arg);
  }
  else
  {
    CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(FigCaptureSourceFormat *)self format], v3.var0, v3.var1, 0, (CMVideoFormatDescriptionRef *)&arg);
  }
  result = (opaqueCMFormatDescription *)arg;
  if (arg) {
    return (opaqueCMFormatDescription *)CFAutorelease(arg);
  }
  return result;
}

- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4
{
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FigCaptureSourceFormat;
    v6 = [(FigCaptureSourceFormat *)&v10 init];
    v7 = v6;
    if (v6)
    {
      v6->_pixelFormatOverride = a4;
      v8 = (NSDictionary *)[a3 copy];
      v7->_formatDictionary = v8;
      if (![(NSDictionary *)v8 objectForKeyedSubscript:@"Name"]) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Format is missing FigCaptureSourceFormatKey_Name.", 0 reason userInfo]);
      }
      v7->_uniqueID = (NSString *)[[NSString alloc] initWithFormat:@"%@_%c%c%c%c", -[NSDictionary objectForKeyedSubscript:](v7->_formatDictionary, "objectForKeyedSubscript:", @"Name", -[FigCaptureSourceFormat format](v7, "format") >> 24, (-[FigCaptureSourceFormat format](v7, "format") >> 16), ((unsigned __int16)-[FigCaptureSourceFormat format](v7, "format") >> 8), -[FigCaptureSourceFormat format](v7, "format")];
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (unsigned)format
{
  if (self->_pixelFormatOverride) {
    return self->_pixelFormatOverride;
  }
  id v3 = [(NSDictionary *)self->_formatDictionary objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  return [v3 unsignedIntValue];
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue") << 32));
}

- (FigCaptureSourceFormat)initWithFigCaptureStreamFormatDictionary:(id)a3
{
  return [(FigCaptureSourceFormat *)self initWithFigCaptureStreamFormatDictionary:a3 pixelFormatOverride:0];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_pixelFormatOverride != *((_DWORD *)a3 + 6)) {
    return 0;
  }
  formatDictionary = self->_formatDictionary;
  if (formatDictionary == *((NSDictionary **)a3 + 1)) {
    return 1;
  }
  return -[NSDictionary isEqual:](formatDictionary, "isEqual:");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceFormat;
  [(FigCaptureSourceFormat *)&v3 dealloc];
}

- (id)formatDictionary
{
  v2 = (void *)[(NSDictionary *)self->_formatDictionary copy];
  return v2;
}

- (BOOL)isExperimental
{
  id v2 = [(NSDictionary *)self->_formatDictionary objectForKeyedSubscript:@"Experimental"];
  return [v2 BOOLValue];
}

- (float)minSupportedFrameRate
{
  id v2 = [(NSDictionary *)self->_formatDictionary objectForKeyedSubscript:@"VideoMinFrameRate"];
  [v2 floatValue];
  return result;
}

- (float)maxSupportedFrameRate
{
  id v2 = [(NSDictionary *)self->_formatDictionary objectForKeyedSubscript:@"VideoMaxFrameRate"];
  [v2 floatValue];
  return result;
}

- (BOOL)isDefaultActiveFormat
{
  int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_formatDictionary, "objectForKeyedSubscript:", @"DefaultActiveFormat"), "BOOLValue");
  if (v3) {
    LOBYTE(v3) = self->_pixelFormatOverride == 0;
  }
  return v3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- ($2825F4736939C4A6D3AD43837233062D)soleHighResStillImageDimensions
{
  id v2 = [(FigCaptureSourceFormat *)self highResStillImageDimensions];
  [(NSArray *)v2 count];
  id v3 = [(NSArray *)v2 firstObject];
  return ($2825F4736939C4A6D3AD43837233062D)[v3 dimensions];
}

- ($2825F4736939C4A6D3AD43837233062D)defaultHighResStillImageDimensions
{
  id v2 = [(NSArray *)[(FigCaptureSourceFormat *)self highResStillImageDimensions] firstObject];
  return ($2825F4736939C4A6D3AD43837233062D)[v2 dimensions];
}

- (int)maxPoints
{
  id v2 = [(NSDictionary *)self->_formatDictionary objectForKeyedSubscript:@"MaxPoints"];
  return [v2 intValue];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p> %@", NSStringFromClass(v4), self, -[FigCaptureSourceFormat formatDescription](self, "formatDescription")];
}

- (unsigned)mediaType
{
}

- (NSArray)highResStillImageDimensions
{
  return self->_highResStillImageDimensions;
}

@end