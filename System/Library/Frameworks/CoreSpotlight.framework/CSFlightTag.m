@interface CSFlightTag
- (CSFlightTag)initWithFlight:(id)a3 synonyms:(id)a4 confidence:(double)a5;
- (void)encodeWithCSCoder:(id)a3;
@end

@implementation CSFlightTag

- (void)encodeWithCSCoder:(id)a3
{
  id v8 = a3;
  [v8 beginType:"CSFlightTag"];
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

- (CSFlightTag)initWithFlight:(id)a3 synonyms:(id)a4 confidence:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CSFlightTag;
  return [(CSExternalAnalysisTag *)&v6 initWithLabel:a3 synonyms:a4 confidence:a5];
}

@end