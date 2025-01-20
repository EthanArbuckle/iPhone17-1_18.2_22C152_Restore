@interface PHMediaFormatConversionContent
- (BOOL)isAssetBundle;
- (BOOL)isImage;
- (BOOL)isVideo;
- (NSString)fileSignature;
- (NSString)fileType;
- (NSURL)fileURL;
- (id)description;
- (id)typeFromFileExtensionWithError:(id *)a3;
- (int64_t)mediaType;
- (unint64_t)length;
- (void)setFileURL:(id)a3;
- (void)setMediaType:(int64_t)a3;
@end

@implementation PHMediaFormatConversionContent

- (BOOL)isVideo
{
  return self->_mediaType == 1;
}

- (BOOL)isImage
{
  return self->_mediaType == 2;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void)setFileURL:(id)a3
{
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PHMediaFormatConversionContent *)self fileURL];
  v7 = [v6 path];
  v8 = [v3 stringWithFormat:@"<%@ %p path=%@>", v5, self, v7];

  return v8;
}

- (NSString)fileSignature
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  fileSignature = self->_fileSignature;
  if (!fileSignature)
  {
    v4 = (void *)MEMORY[0x1E4F28CB0];
    v5 = [(PHMediaFormatConversionContent *)self fileURL];
    id v13 = 0;
    v6 = [v4 fileHandleForReadingFromURL:v5 error:&v13];
    id v7 = v13;

    if (v6)
    {
      id v12 = v7;
      objc_msgSend(MEMORY[0x1E4F8CBB8], "fingerPrintForFileDescriptor:error:", objc_msgSend(v6, "fileDescriptor"), &v12);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v9 = v12;

      v10 = self->_fileSignature;
      self->_fileSignature = v8;

      if (!self->_fileSignature && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to calculate file signature: %@", buf, 0xCu);
      }
      [v6 closeFile];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v7;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to read file for signature calculation: %@", buf, 0xCu);
      }
      id v9 = v7;
    }

    fileSignature = self->_fileSignature;
  }
  return fileSignature;
}

- (NSString)fileType
{
  v2 = [(PHMediaFormatConversionContent *)self typeFromFileExtensionWithError:0];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)typeFromFileExtensionWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v5 = [(NSURL *)self->_fileURL pathExtension];
  if ([v5 length])
  {
    if (self->_mediaType == 1) {
      id v6 = (id)*MEMORY[0x1E4F44448];
    }
    else {
      id v6 = 0;
    }
    id v9 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v5 conformingToType:v6];
    v8 = v9;
    if (v9)
    {
      id v10 = v9;
    }
    else if (a3)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      id v15 = @"Unable to determine source media type from filename extension";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *a3 = [v11 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:2 userInfo:v12];
    }
    goto LABEL_12;
  }
  if (a3)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Unable to determine source media type for filename without extension";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [v7 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:2 userInfo:v6];
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)isAssetBundle
{
  return self->_mediaType == 4;
}

- (unint64_t)length
{
  unint64_t result = self->_length;
  if (!result)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(PHMediaFormatConversionContent *)self fileURL];
    id v6 = [v5 path];
    uint64_t v8 = 0;
    id v7 = [v4 attributesOfItemAtPath:v6 error:&v8];

    self->_length = [v7 fileSize];
    return self->_length;
  }
  return result;
}

@end