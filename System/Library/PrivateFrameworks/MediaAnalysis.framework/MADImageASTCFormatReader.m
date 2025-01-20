@interface MADImageASTCFormatReader
+ (BOOL)isValidASTCExtension:(id)a3;
- (CGImageSource)readNextImageSource;
- (CGImageSource)readOneImageSource;
- (MADImageASTCFormatReader)initWithData:(id)a3;
- (int)readDataToBuffer:(void *)a3 Position:(unint64_t)a4 Length:(unint64_t)a5;
- (int)readPList;
@end

@implementation MADImageASTCFormatReader

+ (BOOL)isValidASTCExtension:(id)a3
{
  return [a3 isEqualToString:@"ktx"];
}

- (MADImageASTCFormatReader)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADImageASTCFormatReader;
  v6 = [(MADImageASTCFormatReader *)&v15 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  p_dataStream = (void **)&v6->_dataStream;
  objc_storeStrong((id *)&v6->_dataStream, a3);
  v9 = *p_dataStream;
  if (*p_dataStream)
  {
    v7->_start = 0;
    v7->_end = [v9 length];
    v7->_numImagesRemaining = 0;
LABEL_4:
    v10 = v7;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      id v13 = v12;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[%@] initWithFilePath: Invalid data stream", buf, 0xCu);
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (int)readDataToBuffer:(void *)a3 Position:(unint64_t)a4 Length:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self->_start > a4 || ((unint64_t end = self->_end, end > a4) ? (v6 = a5 + a4 > end) : (v6 = 1), v6))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v7 = VCPLogInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v12 = 138412290;
          id v13 = (id)objc_opt_class();
          id v8 = v13;
          _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[%@] readDataToBuffer:Position:Length: Attempt to read beyond data limit", (uint8_t *)&v12, 0xCu);
        }
      }
      return -18;
    }
    else
    {
      -[NSData getBytes:range:](self->_dataStream, "getBytes:range:");
      return 0;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = (id)objc_opt_class();
        id v10 = v13;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] readDataToBuffer:Position:Length: Invalid output buffer", (uint8_t *)&v12, 0xCu);
      }
    }
    return -50;
  }
}

- (int)readPList
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t end = self->_end;
  int v27 = 0;
  int v4 = [(MADImageASTCFormatReader *)self readDataToBuffer:&v27 Position:end - 4 Length:4];
  if (v4) {
    return v4;
  }
  if (v27 != 1129005385)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v29 = v10;
        id v11 = v10;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] readPList: Failed magic check", buf, 0xCu);
      }
    }
    return -18;
  }
  unint64_t v26 = 0;
  int v4 = [(MADImageASTCFormatReader *)self readDataToBuffer:&v26 Position:end - 12 Length:8];
  if (v4) {
    return v4;
  }
  if (v26 == -1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v29 = v14;
        id v15 = v14;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid numImagesRemaining", buf, 0xCu);
      }
    }
    return -18;
  }
  unint64_t v25 = 0;
  unint64_t v5 = end - 20;
  int v4 = [(MADImageASTCFormatReader *)self readDataToBuffer:&v25 Position:end - 20 Length:8];
  if (!v4)
  {
    if (v5 >= v25)
    {
      BOOL v6 = [(NSData *)self->_dataStream subdataWithRange:v5 - v25];
      if (v6)
      {
        unint64_t v16 = v25;
        id v24 = 0;
        v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v24];
        uint64_t v18 = v24;
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          self->_unint64_t end = v5 - v16;
          objc_storeStrong((id *)&self->_plist, v17);
          int v4 = 0;
          self->_numImagesRemaining = v26;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v19 = VCPLogInstance();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v29 = v20;
              __int16 v30 = 2112;
              v31 = v18;
              id v21 = v20;
              _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[%@] readPList: Failed to create plist with err: %@", buf, 0x16u);
            }
          }
          int v4 = -18;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_35:
          int v4 = -18;
          goto LABEL_36;
        }
        uint64_t v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          id v23 = v22;
          _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid plistData", buf, 0xCu);
        }
        int v4 = -18;
      }

LABEL_36:
      return v4;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v29 = v7;
        id v8 = v7;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[%@] readPList: Invalid plistLength", buf, 0xCu);
      }
      goto LABEL_35;
    }
    return -18;
  }
  return v4;
}

- (CGImageSource)readOneImageSource
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_numImagesRemaining)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = (id)objc_opt_class();
        id v9 = v21;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[%@] readOneImage: Already read out all images", buf, 0xCu);
      }
    }
    return 0;
  }
  unint64_t start = self->_start;
  uint64_t v19 = 0;
  if (![(MADImageASTCFormatReader *)self readDataToBuffer:&v19 Position:start Length:8])
  {
    unint64_t v4 = start + 8;
    if (v19 + start + 8 > self->_end)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unint64_t v5 = VCPLogInstance();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          BOOL v6 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v21 = v6;
          id v7 = v6;
          _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[%@] readOneImage: Invalid imageLength", buf, 0xCu);
        }
        goto LABEL_24;
      }
      return 0;
    }
    CFDataRef v12 = [(NSData *)self->_dataStream subdataWithRange:start + 8];
    unint64_t v5 = v12;
    if (v12)
    {
      uint64_t v13 = v19;
      id v10 = CGImageSourceCreateWithData(v12, 0);
      if (v10)
      {
        --self->_numImagesRemaining;
        self->_unint64_t start = v13 + v4;
LABEL_25:

        return v10;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v17 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v21 = v17;
          id v18 = v17;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[%@] readOneImage: Failed to create imageSource", buf, 0xCu);
        }
LABEL_23:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v21 = v15;
        id v16 = v15;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[%@] readOneImage: Invalid imageData", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_24:
    id v10 = 0;
    goto LABEL_25;
  }
  return 0;
}

- (CGImageSource)readNextImageSource
{
  if (!self->_plist && [(MADImageASTCFormatReader *)self readPList]) {
    return 0;
  }
  return [(MADImageASTCFormatReader *)self readOneImageSource];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_dataStream, 0);
}

@end