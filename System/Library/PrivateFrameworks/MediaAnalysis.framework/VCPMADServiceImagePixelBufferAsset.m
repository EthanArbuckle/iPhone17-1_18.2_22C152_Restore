@interface VCPMADServiceImagePixelBufferAsset
- (BOOL)hasCachedParseData;
- (BOOL)isHighResDecoded;
- (CGSize)resolution;
- (VCPMADServiceImagePixelBufferAsset)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 andIdentifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7;
- (id).cxx_construct;
- (id)cachedParseData;
- (id)documentObservations;
- (id)identifier;
- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4;
- (unint64_t)assetType;
- (unsigned)orientation;
- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4;
- (void)setDocumentObservations:(id)a3;
@end

@implementation VCPMADServiceImagePixelBufferAsset

- (VCPMADServiceImagePixelBufferAsset)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 andIdentifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VCPMADServiceImagePixelBufferAsset;
  v14 = [(VCPMADServiceImageAsset *)&v18 initWithClientBundleID:a6 clientTeamID:a7];
  if (v14)
  {
    if (a3) {
      CFTypeRef v15 = CFRetain(a3);
    }
    else {
      CFTypeRef v15 = 0;
    }
    v17 = v15;
    CF<__CVBuffer *>::operator=((const void **)&v14->_pixelBuffer.value_, &v17);
    CF<opaqueCMSampleBuffer *>::~CF(&v17);
    v14->_orientation = a4;
    objc_storeStrong((id *)&v14->_identifier, a5);
  }

  return v14;
}

- (unint64_t)assetType
{
  return 1;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGSize)resolution
{
  double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer.value_);
  double Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer.value_);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return 1;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  value = self->_pixelBuffer.value_;
  if (value) {
    value = (void *)CFRetain(value);
  }
  *a3 = (__CVBuffer *)value;
  *a4 = self->_orientation;
  return 0;
}

- (id)documentObservations
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_documentObservations && (int)MediaAnalysisLogLevel() >= 7)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v7 = 138412290;
      v8 = identifier;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[OCR][%@] Re-using cached results", (uint8_t *)&v7, 0xCu);
    }
  }
  documentObservations = self->_documentObservations;
  return documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  documentObservations = self->_documentObservations;
  self->_documentObservations = v4;
}

- (BOOL)hasCachedParseData
{
  return self->_hasCachedParseData;
}

- (id)cachedParseData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_hasCachedParseData && (int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      int v7 = 138412290;
      v8 = identifier;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[VS][%@] Re-using cached results", (uint8_t *)&v7, 0xCu);
    }
  }
  cachedParseData = self->_cachedParseData;
  return cachedParseData;
}

- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4
{
  id v7 = a3;
  double v5 = (NSData *)[v7 copy];
  cachedParseData = self->_cachedParseData;
  self->_cachedParseData = v5;

  self->_hasCachedParseData = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBuffer.value_);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

@end