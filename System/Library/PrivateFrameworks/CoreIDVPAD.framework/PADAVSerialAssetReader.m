@interface PADAVSerialAssetReader
- (BOOL)_setupAssetReaderWithVideoURL:(id)a3 error:(id *)a4;
- (PADAVSerialAssetReader)initWithVideoURL:(id)a3 error:(id *)a4;
- (id)retrieveNextFrame;
- (void)close;
- (void)retrieveNextFrame;
@end

@implementation PADAVSerialAssetReader

- (PADAVSerialAssetReader)initWithVideoURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PADAVSerialAssetReader;
  v7 = [(PADAVSerialAssetReader *)&v11 init];
  v8 = v7;
  if (v7
    && (v7->_isReading = 0,
        ![(PADAVSerialAssetReader *)v7 _setupAssetReaderWithVideoURL:v6 error:a4]))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)_setupAssetReaderWithVideoURL:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263EFA470] assetWithURL:v6];
  v8 = [v7 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  v9 = [v8 firstObject];

  uint64_t v40 = *MEMORY[0x263F04180];
  v41[0] = &unk_26D0AB6C0;
  v10 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  objc_super v11 = (void *)[v10 mutableCopy];

  v12 = (AVAssetReaderTrackOutput *)[objc_alloc(MEMORY[0x263EFA4D8]) initWithTrack:v9 outputSettings:v11];
  output = self->_output;
  self->_output = v12;

  [(AVAssetReaderTrackOutput *)self->_output setAlwaysCopiesSampleData:0];
  v14 = (AVAssetReader *)[objc_alloc(MEMORY[0x263EFA4C0]) initWithAsset:v7 error:0];
  assetReader = self->_assetReader;
  self->_assetReader = v14;

  v16 = self->_assetReader;
  if (v16)
  {
    if ([(AVAssetReader *)v16 canAddOutput:self->_output])
    {
      a4 = (id *)MEMORY[0x263F010E0];
      CMTimeValue v17 = *MEMORY[0x263F010E0];
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      if (v7)
      {
        [v7 duration];
        uint64_t v18 = v33;
        int32_t v19 = v34;
      }
      else
      {
        int32_t v19 = 0;
        uint64_t v18 = 0;
      }
      CMTimeMake(&duration, v18 - v17, v19);
      start.value = v17;
      *(_OWORD *)&start.timescale = *(_OWORD *)(a4 + 1);
      CMTimeRangeMake(&v32, &start, &duration);
      v27 = self->_assetReader;
      CMTimeRange v29 = v32;
      [(AVAssetReader *)v27 setTimeRange:&v29];
      [(AVAssetReader *)self->_assetReader addOutput:self->_output];
      LOBYTE(a4) = 1;
    }
    else if (a4)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F07F80];
      v37 = @"Unable to add output to AVAssetReader";
      v26 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = [v25 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:1 userInfo:v26];

      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    id v20 = [NSString alloc];
    v21 = [v6 path];
    v22 = (void *)[v20 initWithFormat:@"Unable to create AVAssetReader with file at URL %@", v21];

    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F07F80];
    v39 = v22;
    v24 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a4 = [v23 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:1 userInfo:v24];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (id)retrieveNextFrame
{
  if (!self->_isReading)
  {
    self->_isReading = 1;
    [(AVAssetReader *)self->_assetReader startReading];
  }
  output = self->_output;
  v4 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  v5 = v4;
  if (!output)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PADAVSerialAssetReader retrieveNextFrame](v5);
    }

    goto LABEL_16;
  }
  if (os_signpost_enabled(v4))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_21F07C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", (uint8_t *)&buf, 2u);
  }

  id v6 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_output copyNextSampleBuffer];
  if (!v6)
  {
    objc_super v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_signpost_enabled(v11))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_21F07C000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", (uint8_t *)&buf, 2u);
    }

LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v6);
  memset(&buf, 0, sizeof(buf));
  CMSampleBufferGetPresentationTimeStamp(&buf, v7);
  CFRelease(v7);
  v9 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_21F07C000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AV.ReadFrame", "", v14, 2u);
  }

  v10 = objc_alloc_init(PADAVFrame);
  [(PADAVFrame *)v10 setPixelBuffer:ImageBuffer];
  CMTime v13 = buf;
  [(PADAVFrame *)v10 setTimestamp:&v13];
LABEL_17:
  return v10;
}

- (void)close
{
  [(AVAssetReader *)self->_assetReader cancelReading];
  assetReader = self->_assetReader;
  self->_assetReader = 0;

  output = self->_output;
  self->_output = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

- (void)retrieveNextFrame
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F07C000, log, OS_LOG_TYPE_DEBUG, "Unable to retrieve next frame; AVAssetReaderTrackOutput not set",
    v1,
    2u);
}

@end