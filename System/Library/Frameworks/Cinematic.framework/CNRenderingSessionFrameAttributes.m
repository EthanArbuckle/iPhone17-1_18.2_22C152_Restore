@interface CNRenderingSessionFrameAttributes
- (CNRenderingSessionFrameAttributes)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes;
- (CNRenderingSessionFrameAttributes)initWithTimedMetadataGroup:(AVTimedMetadataGroup *)metadataGroup sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes;
- (PTTimedRenderingMetadata)internalMetadata;
- (float)fNumber;
- (float)focusDisparity;
- (float)originalFNumber;
- (float)originalFocusDisparity;
- (id)_initJustWithPTTimedRenderingMetadata:(id)a3;
- (id)_initWithPTTimedRenderingMetadata:(id)a3;
- (id)_initWithTimedData:(id)a3 sessionAttributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (void)setFNumber:(float)fNumber;
- (void)setFocusDisparity:(float)focusDisparity;
@end

@implementation CNRenderingSessionFrameAttributes

- (CNRenderingSessionFrameAttributes)initWithSampleBuffer:(CMSampleBufferRef)sampleBuffer sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes
{
  v6 = (objc_class *)MEMORY[0x263EFA8C0];
  v7 = sessionAttributes;
  v8 = (void *)[[v6 alloc] initWithSampleBuffer:sampleBuffer];
  v9 = [(CNRenderingSessionFrameAttributes *)self initWithTimedMetadataGroup:v8 sessionAttributes:v7];

  return v9;
}

- (CNRenderingSessionFrameAttributes)initWithTimedMetadataGroup:(AVTimedMetadataGroup *)metadataGroup sessionAttributes:(CNRenderingSessionAttributes *)sessionAttributes
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v6 = sessionAttributes;
  if (metadataGroup)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = [(AVTimedMetadataGroup *)metadataGroup items];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v13 = [v12 key];
          int v14 = [v13 isEqual:0x26F895690];

          if (v14)
          {
            v16 = [v12 value];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v18 = [v12 value];
              self = (CNRenderingSessionFrameAttributes *)[(CNRenderingSessionFrameAttributes *)self _initWithTimedData:v18 sessionAttributes:v6];
              v15 = self;
            }
            else
            {
              v18 = _CNLogSystem();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                -[CNRenderingSessionFrameAttributes initWithTimedMetadataGroup:sessionAttributes:](0x26F895690, v12, v18);
              }
              v15 = 0;
            }

            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_18:
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)majorVersion
{
  return [(PTTimedRenderingMetadata *)self->_internalMetadata majorVersion];
}

- (int64_t)minorVersion
{
  return [(PTTimedRenderingMetadata *)self->_internalMetadata minorVersion];
}

- (float)originalFocusDisparity
{
  int64_t v3 = [(CNRenderingSessionFrameAttributes *)self majorVersion];
  if (v3 == 2)
  {
    internalMetadata = self->_internalMetadata;
    [(PTTimedRenderingMetadata *)internalMetadata focusDisparity];
  }
  else if (v3 == 1)
  {
    v4 = self->_internalMetadata;
    [(PTTimedRenderingMetadata *)v4 focusDistance];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (float)originalFNumber
{
  int64_t v3 = [(CNRenderingSessionFrameAttributes *)self majorVersion];
  if (v3 == 2)
  {
    internalMetadata = self->_internalMetadata;
    [(PTTimedRenderingMetadata *)internalMetadata fNumber];
  }
  else if (v3 == 1)
  {
    v4 = self->_internalMetadata;
    [(PTTimedRenderingMetadata *)v4 aperture];
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(CNRenderingSessionFrameAttributes *)self mutableCopyWithZone:a3];

  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initJustWithPTTimedRenderingMetadata:self->_internalMetadata];
  [(CNRenderingSessionFrameAttributes *)self focusDisparity];
  objc_msgSend(v4, "setFocusDisparity:");
  [(CNRenderingSessionFrameAttributes *)self fNumber];
  objc_msgSend(v4, "setFNumber:");
  return v4;
}

- (id)_initWithPTTimedRenderingMetadata:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNRenderingSessionFrameAttributes;
  v6 = [(CNRenderingSessionFrameAttributes *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalMetadata, a3);
    [(CNRenderingSessionFrameAttributes *)v7 originalFocusDisparity];
    v7->_focusDisparity = v8;
    [(CNRenderingSessionFrameAttributes *)v7 originalFNumber];
    v7->_fNumber = v9;
  }

  return v7;
}

- (id)_initJustWithPTTimedRenderingMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRenderingSessionFrameAttributes;
  v6 = [(CNRenderingSessionFrameAttributes *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalMetadata, a3);
  }

  return v7;
}

- (id)_initWithTimedData:(id)a3 sessionAttributes:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F5F308];
  id v8 = a4;
  uint64_t v9 = [v8 majorVersion];
  uint64_t v10 = [v8 minorVersion];

  objc_super v11 = [v7 objectFromData:v6 withMajorVersion:v9 minorVersion:v10];
  if (v11)
  {
    self = (CNRenderingSessionFrameAttributes *)[(CNRenderingSessionFrameAttributes *)self _initWithPTTimedRenderingMetadata:v11];
    v12 = self;
  }
  else
  {
    v13 = _CNLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CNRenderingSessionFrameAttributes _initWithTimedData:sessionAttributes:]((uint64_t)v6, v13);
    }

    v12 = 0;
  }

  return v12;
}

- (float)focusDisparity
{
  return self->_focusDisparity;
}

- (void)setFocusDisparity:(float)focusDisparity
{
  self->_focusDisparity = focusDisparity;
}

- (float)fNumber
{
  return self->_fNumber;
}

- (void)setFNumber:(float)fNumber
{
  self->_fNumber = fNumber;
}

- (PTTimedRenderingMetadata)internalMetadata
{
  return (PTTimedRenderingMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithTimedMetadataGroup:(NSObject *)a3 sessionAttributes:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [a2 value];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  objc_super v11 = v7;
  _os_log_error_impl(&dword_243267000, a3, OS_LOG_TYPE_ERROR, "error: metadata item %@ of class %@ (expected NSData) -- skipping", (uint8_t *)&v8, 0x16u);
}

- (void)_initWithTimedData:(uint64_t)a1 sessionAttributes:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243267000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize timed rendering metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end