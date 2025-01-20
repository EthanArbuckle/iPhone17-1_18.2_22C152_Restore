@interface MPArtworkColorAnalysisOperation
- (CGImage)_createImageFromSource:(CGImageSource *)a3 size:(unint64_t)a4;
- (CGImageSource)_createImageFromURL:(id)a3;
- (MPArtworkColorAnalysisOperation)initWithURL:(id)a3;
- (MSVArtworkColorAnalysis)colorAnalysis;
- (NSError)error;
- (void)cancel;
- (void)main;
@end

@implementation MPArtworkColorAnalysisOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)cancel
{
  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPArtworkColorAnalysisErrorDomain" code:2 userInfo:0];
  error = self->_error;
  self->_error = v3;

  v5.receiver = self;
  v5.super_class = (Class)MPArtworkColorAnalysisOperation;
  [(MPArtworkColorAnalysisOperation *)&v5 cancel];
}

- (CGImage)_createImageFromSource:(CGImageSource *)a3 size:(unint64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F2FF08];
  v10[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, a4, v6);

  return ImageAtIndex;
}

- (CGImageSource)_createImageFromURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  if (v3
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        [(__CFURL *)v3 path],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 fileExistsAtPath:v5],
        v5,
        v4,
        v6))
  {
    v7 = CGImageSourceCreateWithURL(v3, 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)main
{
  CFURLRef v3 = [(MPArtworkColorAnalysisOperation *)self _createImageFromURL:self->_sourceURL];
  if (v3)
  {
    v4 = v3;
    objc_super v5 = [(MPArtworkColorAnalysisOperation *)self _createImageFromSource:v3 size:0];
    v13 = (NSError *)[objc_alloc(MEMORY[0x1E4F77920]) initWithSourceImage:v5];
    int v6 = [(NSError *)v13 analyze];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      colorAnalysis = self->_colorAnalysis;
      self->_colorAnalysis = v8;
    }
    else
    {
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPArtworkColorAnalysisErrorDomain" code:1 userInfo:0];
      colorAnalysis = self->_error;
      self->_error = v12;
    }

    if (v5) {
      CFRelease(v5);
    }
    CFRelease(v4);

    error = v13;
  }
  else
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPArtworkColorAnalysisErrorDomain" code:0 userInfo:0];
    error = self->_error;
    self->_error = v10;
  }
}

- (NSError)error
{
  return self->_error;
}

- (MSVArtworkColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (MPArtworkColorAnalysisOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPArtworkColorAnalysisOperation;
  int v6 = [(MPArtworkColorAnalysisOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceURL, a3);
  }

  return v7;
}

@end