@interface CSTrackingNumberTag
- (void)encodeWithCSCoder:(id)a3;
@end

@implementation CSTrackingNumberTag

- (void)encodeWithCSCoder:(id)a3
{
  id v8 = a3;
  [v8 beginType:"CSTrackingNumberTag"];
  id v4 = [(CSExternalAnalysisTag *)self label];
  objc_msgSend(v8, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  uint64_t v5 = [(CSExternalAnalysisTag *)self synonyms];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v8 encodeObject:v7];

  [(CSExternalAnalysisTag *)self confidence];
  objc_msgSend(v8, "encodeDouble:");
  [v8 endType];
}

@end