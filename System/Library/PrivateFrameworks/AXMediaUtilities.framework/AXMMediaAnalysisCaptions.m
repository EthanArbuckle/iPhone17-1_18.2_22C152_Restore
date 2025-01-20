@interface AXMMediaAnalysisCaptions
+ (BOOL)supportsSecureCoding;
- (AXMMediaAnalysisCaptions)initWithCoder:(id)a3;
- (AXMMediaAnalysisCaptions)initWithText:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 classificationIdentifiers:(id)a6;
- (BOOL)isLowConfidence;
- (NSArray)classificationIdentifiers;
- (NSString)text;
- (double)confidence;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXMMediaAnalysisCaptions

- (AXMMediaAnalysisCaptions)initWithText:(id)a3 confidence:(double)a4 isLowConfidence:(BOOL)a5 classificationIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AXMMediaAnalysisCaptions;
  v13 = [(AXMMediaAnalysisCaptions *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_text, a3);
    v14->_confidence = a4;
    v14->_isLowConfidence = a5;
    objc_storeStrong((id *)&v14->_classificationIdentifiers, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSArray)classificationIdentifiers
{
  return self->_classificationIdentifiers;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMMediaAnalysisCaptions *)self text];
  [v4 encodeObject:v5 forKey:@"text"];

  [(AXMMediaAnalysisCaptions *)self confidence];
  objc_msgSend(v4, "encodeDouble:forKey:", @"confidence");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMMediaAnalysisCaptions isLowConfidence](self, "isLowConfidence"), @"isLowConfidence");
  id v6 = [(AXMMediaAnalysisCaptions *)self classificationIdentifiers];
  [v4 encodeObject:v6 forKey:@"classificationIdentifiers"];
}

- (AXMMediaAnalysisCaptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMMediaAnalysisCaptions;
  v5 = [(AXMMediaAnalysisCaptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v8;
    v5->_isLowConfidence = [v4 decodeBoolForKey:@"isLowConfidence"];
    v9 = AXMSecureCodingClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"classificationIdentifiers"];
    classificationIdentifiers = v5->_classificationIdentifiers;
    v5->_classificationIdentifiers = (NSArray *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMMediaAnalysisCaptions<%p>", self);
  id v4 = [(AXMMediaAnalysisCaptions *)self text];
  v5 = NSNumber;
  [(AXMMediaAnalysisCaptions *)self confidence];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [(AXMMediaAnalysisCaptions *)self isLowConfidence];
  double v8 = [(AXMMediaAnalysisCaptions *)self classificationIdentifiers];
  [v3 appendFormat:@"  - Text: '%@' Confidence: %@ isLowConfidence : %ld classificationIdentifiers : %@\n", v4, v6, v7, v8];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationIdentifiers, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end