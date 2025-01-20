@interface LPAudio
+ (BOOL)supportsSecureCoding;
- (AVAsset)_asset;
- (BOOL)_canEncodeWithoutComputation;
- (BOOL)_isSubstitute;
- (BOOL)isEqual:(id)a3;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (LPAudio)init;
- (LPAudio)initWithCoder:(id)a3;
- (LPAudio)initWithStreamingURL:(id)a3 properties:(id)a4;
- (LPAudioProperties)properties;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)fileURL;
- (NSURL)streamingURL;
- (id)_initWithAudio:(id)a3;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (unint64_t)_encodedSize;
- (void)data;
- (void)encodeWithCoder:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation LPAudio

- (LPAudio)init
{
  return 0;
}

- (id)_initWithAudio:(id)a3
{
  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)LPAudio;
  v5 = [(LPAudio *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_streamingURL, v4[6]);
    uint64_t v7 = [v4[1] copy];
    data = v6->_data;
    v6->_data = (NSData *)v7;

    uint64_t v9 = [v4[7] copy];
    MIMEType = v6->_MIMEType;
    v6->_MIMEType = (NSString *)v9;

    objc_storeStrong((id *)&v6->_fileURL, v4[5]);
    uint64_t v11 = [v4[4] copy];
    properties = v6->_properties;
    v6->_properties = (LPAudioProperties *)v11;

    v13 = v6;
  }

  return v6;
}

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LPAudio;
  uint64_t v11 = [(LPAudio *)&v16 init];
  if (v11 && [v8 isFileURL])
  {
    [(LPAudio *)v11 setFileURL:v8];
    objc_storeStrong((id *)&v11->_MIMEType, a4);
    uint64_t v12 = [v10 copy];
    properties = v11->_properties;
    v11->_properties = (LPAudioProperties *)v12;

    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LPAudio)initWithStreamingURL:(id)a3 properties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LPAudio;
  id v9 = [(LPAudio *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_streamingURL, a3);
    objc_storeStrong((id *)&v10->_properties, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAudio)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPAudio;
  v5 = [(LPAudio *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"streamingURL");
    streamingURL = v5->_streamingURL;
    v5->_streamingURL = (NSURL *)v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v10;

    uint64_t v12 = objc_alloc_init(LPAudioProperties);
    properties = v5->_properties;
    v5->_properties = v12;

    v14 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
    [(LPAudioProperties *)v5->_properties setAccessibilityText:v14];

    objc_super v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_streamingURL, @"streamingURL");
  if (![(LPAudio *)self _isSubstitute])
  {
    id v4 = [(LPAudio *)self data];
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, @"data");
  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  v5 = [(LPAudioProperties *)self->_properties accessibilityText];
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", v5, @"accessibilityText");
}

- (BOOL)_canEncodeWithoutComputation
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_data) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2->_streamingURL != 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAudio;
  if ([(LPAudio *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void **)v4;
      if ((objectsAreEqual_2(v6[6], self->_streamingURL) & 1) != 0
        && objectsAreEqual_2(v6[1], self->_data)
        && objectsAreEqual_2(v6[7], self->_MIMEType)
        && objectsAreEqual_2(v6[5], self->_fileURL))
      {
        char v5 = objectsAreEqual_2(v6[4], self->_properties);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_encodedSize
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = [(NSData *)v2->_data length];
  objc_sync_exit(v2);

  return v3;
}

- (void)setFileURL:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([v7 isFileURL]) {
    char v5 = (NSURL *)v7;
  }
  else {
    char v5 = 0;
  }
  fileURL = v4->_fileURL;
  v4->_fileURL = v5;

  objc_sync_exit(v4);
}

- (NSData)data
{
  v2 = self;
  objc_sync_enter(v2);
  data = v2->_data;
  if (!data)
  {
    fileURL = v2->_fileURL;
    if (fileURL)
    {
      id v11 = 0;
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:fileURL options:1 error:&v11];
      id v6 = v11;
      id v7 = v2->_data;
      v2->_data = (NSData *)v5;

      if (v6)
      {
        objc_super v8 = LPLogChannelUI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(LPAudio *)(uint64_t)v6 data];
        }
      }

      data = v2->_data;
    }
    else
    {
      data = 0;
    }
  }
  id v9 = data;
  objc_sync_exit(v2);

  return v9;
}

- (LPAudioProperties)properties
{
  v2 = (void *)[(LPAudioProperties *)self->_properties copy];

  return (LPAudioProperties *)v2;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (AVAsset)_asset
{
  asset = self->_asset;
  if (asset)
  {
    unint64_t v3 = asset;
    goto LABEL_13;
  }
  streamingURL = self->_streamingURL;
  if (streamingURL)
  {
    id v6 = streamingURL;
    id v7 = +[LPTestingOverrides customLoader];

    if (v7)
    {
      objc_super v8 = +[LPTestingOverrides customLoader];
      uint64_t v9 = [v8 overrideURLForMediaURL:v6];

      id v6 = (NSURL *)v9;
    }
    uint64_t v10 = [MEMORY[0x1E4F166C8] assetWithURL:v6];
    id v11 = self->_asset;
    self->_asset = v10;

    uint64_t v12 = +[LPTestingOverrides customLoader];

    if (v12)
    {
      objc_super v13 = +[LPTestingOverrides customLoader];
      v14 = [(AVURLAsset *)self->_asset resourceLoader];
      [v13 installCustomMediaLoader:v14];
    }
LABEL_12:
    unint64_t v3 = self->_asset;

    goto LABEL_13;
  }
  objc_super v15 = [(LPAudio *)self data];

  if (v15)
  {
    objc_super v16 = (void *)MEMORY[0x1E4F166C8];
    objc_super v17 = (void *)MEMORY[0x1E4F1CB10];
    v18 = NSString;
    v19 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v19 UUIDString];
    v21 = [v18 stringWithFormat:@"link-presentation-audio://audio/%@", v20];
    v22 = [v17 URLWithString:v21];
    v23 = [v16 URLAssetWithURL:v22 options:0];

    if (!self->_mediaLoadingQueue)
    {
      v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.LinkPresentation.AudioFetching", v24);
      mediaLoadingQueue = self->_mediaLoadingQueue;
      self->_mediaLoadingQueue = v25;
    }
    v27 = [(AVURLAsset *)v23 resourceLoader];
    [v27 setDelegate:self queue:self->_mediaLoadingQueue];

    v28 = self->_asset;
    self->_asset = v23;
    id v6 = v23;

    goto LABEL_12;
  }
  unint64_t v3 = 0;
LABEL_13:

  return (AVAsset *)v3;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 contentInformationRequest];

  if (v8)
  {
    uint64_t v9 = +[LPMIMETypeRegistry UTIForMIMEType:self->_MIMEType];
    uint64_t v10 = [v7 contentInformationRequest];
    [v10 setContentType:v9];

    NSUInteger v11 = [(NSData *)self->_data length];
    uint64_t v12 = [v7 contentInformationRequest];
    [v12 setContentLength:v11];

    objc_super v13 = [v7 contentInformationRequest];
    [v13 setByteRangeAccessSupported:1];
  }
  v14 = [v7 dataRequest];

  if (v14)
  {
    objc_super v15 = [v7 dataRequest];
    uint64_t v16 = [v15 requestedOffset];
    NSUInteger v17 = [(NSData *)self->_data length];
    NSUInteger v18 = v17 - [v15 requestedOffset];
    if (!v18) {
      goto LABEL_11;
    }
    if (([v15 requestsAllDataToEndOfResource] & 1) == 0)
    {
      unint64_t v19 = [v15 requestedLength];
      if (v19 < v18) {
        NSUInteger v18 = v19;
      }
    }
    v20 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v16, v18);
    if (!v20)
    {
LABEL_11:

      BOOL v21 = 0;
      goto LABEL_12;
    }
    [v15 respondWithData:v20];
  }
  [v7 finishLoading];
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaLoadingQueue, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)data
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPAudio: Failed to load data: %@", (uint8_t *)&v2, 0xCu);
}

@end