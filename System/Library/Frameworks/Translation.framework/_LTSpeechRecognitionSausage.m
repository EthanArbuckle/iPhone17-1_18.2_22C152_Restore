@interface _LTSpeechRecognitionSausage
+ (BOOL)supportsSecureCoding;
- (NSArray)bins;
- (_LTSpeechRecognitionSausage)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBins:(id)a3;
@end

@implementation _LTSpeechRecognitionSausage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_LTSpeechRecognitionSausage)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTSpeechRecognitionSausage;
  v5 = [(_LTSpeechRecognitionSausage *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bins"];
    bins = v5->_bins;
    v5->_bins = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (NSArray)bins
{
  return self->_bins;
}

- (void)setBins:(id)a3
{
}

- (void).cxx_destruct
{
}

@end