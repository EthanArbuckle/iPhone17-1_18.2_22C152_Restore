@interface AXMMediaAnalysisCaptionsResult
+ (BOOL)supportsSecureCoding;
- (AXMMediaAnalysisCaptionsResult)initWithCoder:(id)a3;
- (NSArray)imageCaptionResults;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImageCaptionResults:(id)a3;
@end

@implementation AXMMediaAnalysisCaptionsResult

- (NSArray)imageCaptionResults
{
  return self->_imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMMediaAnalysisCaptionsResult<%p>", self);
  v4 = [(AXMMediaAnalysisCaptionsResult *)self imageCaptionResults];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [v3 appendString:@" Image Caption results:\n"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(AXMMediaAnalysisCaptionsResult *)self imageCaptionResults];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v12 = [v11 text];
          v13 = NSNumber;
          [v11 confidence];
          v14 = objc_msgSend(v13, "numberWithDouble:");
          [v3 appendFormat:@"  - Text: '%@' Confidence: %@\n", v12, v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [v3 appendString:@" [no image caption results]"];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AXMMediaAnalysisCaptionsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMMediaAnalysisCaptionsResult;
  uint64_t v5 = [(AXMMediaAnalysisCaptionsResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageCaptionResults"];
    imageCaptionResults = v5->_imageCaptionResults;
    v5->_imageCaptionResults = (NSArray *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end