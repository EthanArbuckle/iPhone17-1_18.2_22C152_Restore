@interface VCPMADServiceImageURLAsset
- (BOOL)hasCachedParseData;
- (BOOL)isHighResDecoded;
- (CGSize)resolution;
- (VCPMADServiceImageURLAsset)initWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6;
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

@implementation VCPMADServiceImageURLAsset

- (VCPMADServiceImageURLAsset)initWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VCPMADServiceImageURLAsset;
  v13 = [(VCPMADServiceImageAsset *)&v16 initWithClientBundleID:a5 clientTeamID:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v14->_identifier, a4);
    v14->_orientation = 1;
  }

  return v14;
}

- (unint64_t)assetType
{
  return 2;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGSize)resolution
{
  value = self->_pixelBuffer.value_;
  if (value)
  {
    v4 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(value)];
    v5 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(self->_pixelBuffer.value_)];
    v6 = [NSNumber numberWithUnsignedInt:self->_orientation];
    double Size = CGSizeWithOrientation(v4, v5, v6);
    double v9 = v8;
  }
  else
  {
    v13 = CGImageSourceCreateWithURL((CFURLRef)self->_url, 0);
    double Size = CGImageSourceGetSize(v13);
    double v9 = v10;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v13);
  }
  double v11 = Size;
  double v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_pixelBuffer.value_ != 0;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_pixelBuffer = &self->_pixelBuffer;
  value = self->_pixelBuffer.value_;
  if (!value)
  {
    double v9 = VCPSignPostLog();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    double v11 = VCPSignPostLog();
    double v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = [(VCPMADServiceImageAsset *)self signpostPayload];
      *(_DWORD *)v20 = 138412290;
      *(void *)&v20[4] = v13;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPMADServiceImageURLAsset_Decode", "%@", v20, 0xCu);
    }
    v14 = +[VCPImageManager sharedImageManager];
    *(void *)v20 = [v14 pixelBufferWithFormat:875704422 fromImageURL:self->_url flushCache:1 orientation:&self->_orientation];
    CF<__CVBuffer *>::operator=((const void **)&p_pixelBuffer->value_, (const void **)v20);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)v20);

    v15 = VCPSignPostLog();
    objc_super v16 = v15;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
    {
      v17 = [(VCPMADServiceImageAsset *)self signpostPayload];
      *(_DWORD *)v20 = 138412290;
      *(void *)&v20[4] = v17;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v10, "VCPMADServiceImageURLAsset_Decode", "%@", v20, 0xCu);
    }
    value = p_pixelBuffer->value_;
    if (!p_pixelBuffer->value_) {
      return -18;
    }
  }
  v18 = (__CVBuffer *)CFRetain(value);
  int result = 0;
  *a3 = v18;
  *a4 = self->_orientation;
  return result;
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
      double v8 = identifier;
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
      double v8 = identifier;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "[VS][%@] Re-using cached results", (uint8_t *)&v7, 0xCu);
    }
  }
  cachedParseData = self->_cachedParseData;
  return cachedParseData;
}

- (void)setCachedParseData:(id)a3 overwriteExisting:(BOOL)a4
{
  id v7 = a3;
  v5 = (NSData *)[v7 copy];
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
  objc_storeStrong((id *)&self->_url, 0);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  return self;
}

@end