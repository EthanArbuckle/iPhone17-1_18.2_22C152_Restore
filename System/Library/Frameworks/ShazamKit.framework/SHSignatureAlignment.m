@interface SHSignatureAlignment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SHRange)queryTimeRange;
- (SHRange)referenceTimeRange;
- (SHSignatureAlignment)initWithCoder:(id)a3;
- (SHSignatureAlignment)initWithQueryRange:(id)a3 referenceRange:(id)a4 alignmentConfidence:(float)a5;
- (SHSignatureAlignment)initWithSerializedRepresentation:(id)a3;
- (float)alignmentConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHSignatureAlignment

- (SHSignatureAlignment)initWithQueryRange:(id)a3 referenceRange:(id)a4 alignmentConfidence:(float)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHSignatureAlignment;
  v11 = [(SHSignatureAlignment *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queryTimeRange, a3);
    objc_storeStrong((id *)&v12->_referenceTimeRange, a4);
    v12->_alignmentConfidence = a5;
  }

  return v12;
}

- (SHSignatureAlignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureAlignmentQueryRangeKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHSignatureAlignmentReferenceRangeKey"];
  [v4 decodeFloatForKey:@"SHSignatureAlignmentConfidenceKey"];
  int v8 = v7;

  LODWORD(v9) = v8;
  id v10 = [(SHSignatureAlignment *)self initWithQueryRange:v5 referenceRange:v6 alignmentConfidence:v9];

  return v10;
}

- (SHSignatureAlignment)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 count];

  int v7 = (void *)MEMORY[0x263EFF4A0];
  if (v6 != 3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Signature alignment must have a query range, reference range and alignment confidence, not %@", v4 format];
  }
  int v8 = [v4 objectForKeyedSubscript:@"SHSignatureAlignmentQueryRangeKey"];
  double v9 = [v4 objectForKeyedSubscript:@"SHSignatureAlignmentReferenceRangeKey"];
  id v10 = [v4 objectForKeyedSubscript:@"SHSignatureAlignmentConfidenceKey"];
  if (![v8 count] || !objc_msgSend(v9, "count") || !v10) {
    [MEMORY[0x263EFF940] raise:*v7 format:@"Invalid serialization format for signature alignment."];
  }
  v11 = [[SHRange alloc] initWithSerializedRepresentation:v8];
  v12 = [[SHRange alloc] initWithSerializedRepresentation:v9];
  [v10 floatValue];
  v13 = -[SHSignatureAlignment initWithQueryRange:referenceRange:alignmentConfidence:](self, "initWithQueryRange:referenceRange:alignmentConfidence:", v11, v12);

  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SHSignatureAlignment *)self queryTimeRange];
  v5 = [v4 description];
  uint64_t v6 = [(SHSignatureAlignment *)self referenceTimeRange];
  int v7 = [v6 description];
  int v8 = [v3 stringWithFormat:@"Query: %@, Reference: %@", v5, v7];

  return v8;
}

- (id)serializedRepresentation
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"SHSignatureAlignmentQueryRangeKey";
  v3 = [(SHSignatureAlignment *)self queryTimeRange];
  id v4 = [v3 serializedRepresentation];
  v12[0] = v4;
  v11[1] = @"SHSignatureAlignmentReferenceRangeKey";
  v5 = [(SHSignatureAlignment *)self referenceTimeRange];
  uint64_t v6 = [v5 serializedRepresentation];
  v12[1] = v6;
  v11[2] = @"SHSignatureAlignmentConfidenceKey";
  int v7 = NSNumber;
  [(SHSignatureAlignment *)self alignmentConfidence];
  int v8 = objc_msgSend(v7, "numberWithFloat:");
  v12[2] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(SHSignatureAlignment *)self queryTimeRange];
  [v6 encodeObject:v4 forKey:@"SHSignatureAlignmentQueryRangeKey"];

  v5 = [(SHSignatureAlignment *)self referenceTimeRange];
  [v6 encodeObject:v5 forKey:@"SHSignatureAlignmentReferenceRangeKey"];

  [(SHSignatureAlignment *)self alignmentConfidence];
  objc_msgSend(v6, "encodeFloat:forKey:", @"SHSignatureAlignmentConfidenceKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(SHSignatureAlignment *)self queryTimeRange];
  id v6 = (void *)[v5 copyWithZone:a3];

  int v7 = [(SHSignatureAlignment *)self referenceTimeRange];
  int v8 = (void *)[v7 copyWithZone:a3];

  [(SHSignatureAlignment *)self alignmentConfidence];
  int v10 = v9;
  v11 = +[SHSignatureAlignment allocWithZone:a3];
  LODWORD(v12) = v10;
  v13 = [(SHSignatureAlignment *)v11 initWithQueryRange:v6 referenceRange:v8 alignmentConfidence:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = NSNumber;
  v22 = [(SHSignatureAlignment *)self queryTimeRange];
  [v22 lowerBound];
  v21 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v4 = [v21 hash];
  v5 = NSNumber;
  id v6 = [(SHSignatureAlignment *)self queryTimeRange];
  [v6 upperBound];
  int v7 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v8 = [v7 hash] ^ v4;
  int v9 = NSNumber;
  int v10 = [(SHSignatureAlignment *)self referenceTimeRange];
  [v10 lowerBound];
  v11 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v12 = [v11 hash];
  v13 = NSNumber;
  objc_super v14 = [(SHSignatureAlignment *)self referenceTimeRange];
  [v14 upperBound];
  v15 = objc_msgSend(v13, "numberWithDouble:");
  uint64_t v16 = v8 ^ v12 ^ [v15 hash];
  v17 = NSNumber;
  [(SHSignatureAlignment *)self alignmentConfidence];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  unint64_t v19 = v16 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SHSignatureAlignment *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(SHSignatureAlignment *)self queryTimeRange];
      int v7 = [(SHSignatureAlignment *)v5 queryTimeRange];
      int v8 = [v6 isEqualToRange:v7 withTolerance:0.01];

      int v9 = [(SHSignatureAlignment *)self referenceTimeRange];
      int v10 = [(SHSignatureAlignment *)v5 referenceTimeRange];
      int v11 = [v9 isEqualToRange:v10 withTolerance:0.01];

      BOOL v12 = 0;
      if (v8 && v11)
      {
        [(SHSignatureAlignment *)self alignmentConfidence];
        float v14 = v13;
        [(SHSignatureAlignment *)v5 alignmentConfidence];
        BOOL v12 = vabds_f32(v14, v15) < 0.01;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (SHRange)queryTimeRange
{
  return self->_queryTimeRange;
}

- (SHRange)referenceTimeRange
{
  return self->_referenceTimeRange;
}

- (float)alignmentConfidence
{
  return self->_alignmentConfidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceTimeRange, 0);

  objc_storeStrong((id *)&self->_queryTimeRange, 0);
}

@end