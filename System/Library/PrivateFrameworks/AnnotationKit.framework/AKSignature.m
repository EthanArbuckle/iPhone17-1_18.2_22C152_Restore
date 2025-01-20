@interface AKSignature
+ (BOOL)supportsSecureCoding;
- (AKSignature)init;
- (AKSignature)initWithCoder:(id)a3;
- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5;
- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6;
- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6 descriptionTag:(int64_t)a7 customDescription:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPersist;
- (CGPath)path;
- (CGRect)pathBounds;
- (NSDate)creationDate;
- (NSString)accessibilityLabel;
- (NSString)customDescription;
- (NSUUID)uniqueID;
- (PKDrawing)drawing;
- (double)baselineOffset;
- (id)accessibilityValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForTesting;
- (int64_t)descriptionTag;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCreationDate:(id)a3;
- (void)setCustomDescription:(id)a3;
- (void)setDescriptionTag:(int64_t)a3;
- (void)setPath:(CGPath *)a3;
- (void)setShouldPersist:(BOOL)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation AKSignature

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6 descriptionTag:(int64_t)a7 customDescription:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)AKSignature;
  v17 = [(AKSignature *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    uniqueID = v17->_uniqueID;
    v17->_uniqueID = (NSUUID *)v18;

    v17->_baselineOffset = a5;
    objc_storeStrong((id *)&v17->_creationDate, a6);
    uint64_t v20 = [v14 copy];
    drawing = v17->_drawing;
    v17->_drawing = (PKDrawing *)v20;

    if (a4) {
      CGMutablePathRef MutableCopy = CGPathCreateMutableCopy(a4);
    }
    else {
      CGMutablePathRef MutableCopy = 0;
    }
    v17->_path = MutableCopy;
    v17->_descriptionTag = a7;
    if (a7 == -1) {
      v23 = v16;
    }
    else {
      v23 = 0;
    }
    objc_storeStrong((id *)&v17->_customDescription, v23);
  }

  return v17;
}

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6
{
  v9 = (void *)MEMORY[0x263EFF910];
  id v10 = a3;
  v11 = [v9 date];
  v12 = [(AKSignature *)self initWithDrawing:v10 path:a4 baselineOffset:v11 creationDate:0 descriptionTag:0 customDescription:a5];

  return v12;
}

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5
{
  v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a3;
  id v10 = [v8 date];
  v11 = [(AKSignature *)self initWithDrawing:v9 path:a4 baselineOffset:v10 creationDate:a5];

  return v11;
}

- (id)initForTesting
{
  v2 = [(AKSignature *)self init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"12345678-1234-1234-1234-123456789012"];
    uniqueID = v2->_uniqueID;
    v2->_uniqueID = (NSUUID *)v3;
  }
  return v2;
}

- (AKSignature)init
{
  return (AKSignature *)MEMORY[0x270F9A6D0](self, sel_initWithDrawing_path_baselineOffset_);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AKSignature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = [(AKSignature *)self uniqueID];
        v8 = [(AKSignature *)v6 uniqueID];
        int v9 = [v7 isEqual:v8];

        if (!v9
          || (int64_t v10 = [(AKSignature *)self descriptionTag],
              v10 != [(AKSignature *)v6 descriptionTag]))
        {
          char v16 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v11 = [(AKSignature *)self customDescription];
        if (v11
          || ([(AKSignature *)v6 customDescription],
              (v17 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v12 = [(AKSignature *)self customDescription];
          if (v12)
          {
            v13 = [(AKSignature *)self customDescription];
            id v14 = [(AKSignature *)v6 customDescription];
            int v15 = [v13 isEqualToString:v14] ^ 1;
          }
          else
          {
            LOBYTE(v15) = 0;
          }

          if (v11) {
            goto LABEL_18;
          }
          v17 = 0;
        }
        else
        {
          LOBYTE(v15) = 1;
        }

LABEL_18:
        char v16 = v15 ^ 1;
        goto LABEL_19;
      }
    }
    char v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)dealloc
{
  path = self->_path;
  if (path) {
    CGPathRelease(path);
  }
  v4.receiver = self;
  v4.super_class = (Class)AKSignature;
  [(AKSignature *)&v4 dealloc];
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (CGRect)pathBounds
{
  drawing = self->_drawing;
  if (drawing)
  {
    [(PKDrawing *)drawing bounds];
  }
  else
  {
    path = self->_path;
    if (path)
    {
      *(CGRect *)&CGFloat v4 = CGPathGetBoundingBox(path);
    }
    else
    {
      CGFloat v4 = *MEMORY[0x263F001A8];
      double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setPath:(CGPath *)a3
{
  path = self->_path;
  if (path != a3)
  {
    if (path) {
      CGPathRelease(path);
    }
    self->_path = a3;
    if (a3)
    {
      CGPathRetain(a3);
    }
  }
}

- (CGPath)path
{
  return self->_path;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  CGFloat v4 = [(AKSignature *)self uniqueID];
  [v13 encodeObject:v4 forKey:@"uniqueID"];

  [(AKSignature *)self baselineOffset];
  objc_msgSend(v13, "encodeDouble:forKey:", @"baselineOffset");
  double v5 = [(AKSignature *)self creationDate];
  [v13 encodeObject:v5 forKey:@"creationDate"];

  objc_msgSend(v13, "encodeBool:forKey:", -[AKSignature shouldPersist](self, "shouldPersist"), @"shouldPersist");
  if ([(AKSignature *)self descriptionTag])
  {
    objc_msgSend(v13, "encodeInteger:forKey:", -[AKSignature descriptionTag](self, "descriptionTag"), @"descriptionTag");
    if ([(AKSignature *)self descriptionTag] == -1)
    {
      double v6 = [(AKSignature *)self customDescription];

      if (v6)
      {
        double v7 = [(AKSignature *)self customDescription];
        [v13 encodeObject:v7 forKey:@"customDescription"];
      }
    }
  }
  if ([(AKSignature *)self path])
  {
    v8 = objc_msgSend(MEMORY[0x263EFF8F8], "encodeCGPath:", -[AKSignature path](self, "path"));
    [v13 encodeObject:v8 forKey:@"path"];
  }
  int v9 = [(AKSignature *)self drawing];

  int64_t v10 = v13;
  if (v9)
  {
    v11 = [(AKSignature *)self drawing];
    v12 = [v11 serialize];

    [v13 encodeObject:v12 forKey:@"drawing"];
    int64_t v10 = v13;
  }
}

- (AKSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(AKSignature *)self init];
  if (!v5) {
    goto LABEL_18;
  }
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
  [(AKSignature *)v5 setUniqueID:v6];

  [v4 decodeDoubleForKey:@"baselineOffset"];
  -[AKSignature setBaselineOffset:](v5, "setBaselineOffset:");
  double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [(AKSignature *)v5 setCreationDate:v7];

  -[AKSignature setShouldPersist:](v5, "setShouldPersist:", [v4 decodeBoolForKey:@"shouldPersist"]);
  if ([v4 containsValueForKey:@"descriptionTag"])
  {
    uint64_t v8 = [v4 decodeIntegerForKey:@"descriptionTag"];
    v5->_descriptionTag = v8;
    if (v8 == -1)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customDescription"];
      customDescription = v5->_customDescription;
      v5->_customDescription = (NSString *)v9;
LABEL_9:
    }
  }
  else if ([v4 containsValueForKey:@"caption"])
  {
    customDescription = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caption"];
    if (customDescription)
    {
      int64_t v11 = +[AKSignatureDescription signatureDescriptionTagFromStringValue:customDescription];
      v5->_descriptionTag = v11;
      if (v11 == -1) {
        objc_storeStrong((id *)&v5->_customDescription, customDescription);
      }
    }
    goto LABEL_9;
  }
  if ([v4 containsValueForKey:@"path"])
  {
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    id v13 = (const CGPath *)[MEMORY[0x263EFF8F8] newCGPathDecodedFromData:v12];
    [(AKSignature *)v5 setPath:v13];
    CGPathRelease(v13);
  }
  if ([v4 containsValueForKey:@"drawing"])
  {
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"drawing"];
    if (v14)
    {
      id v18 = 0;
      int v15 = (void *)[objc_alloc(MEMORY[0x263F14AE0]) initWithData:v14 error:&v18];
      id v16 = v18;
      objc_storeStrong((id *)&v5->_drawing, v15);
      if (v16) {
        NSLog(&cfstr_EncounteredErr.isa, v16);
      }
    }
  }
LABEL_18:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSUUID *)self->_uniqueID copyWithZone:a3];
  double v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  *(double *)(v5 + 72) = self->_baselineOffset;
  uint64_t v8 = [(NSDate *)self->_creationDate copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  *(unsigned char *)(v5 + 56) = self->_shouldPersist;
  *(void *)(v5 + 88) = self->_descriptionTag;
  uint64_t v10 = [(NSString *)self->_customDescription copyWithZone:a3];
  int64_t v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  *(void *)(v5 + 16) = CGPathCreateMutableCopy(self->_path);
  uint64_t v12 = [(PKDrawing *)self->_drawing copy];
  id v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (NSString)accessibilityLabel
{
  v2 = +[AKController akBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"Signature" value:&stru_26EA57918 table:@"AKSignature"];

  return (NSString *)v3;
}

- (id)accessibilityValue
{
  int64_t v3 = [(AKSignature *)self descriptionTag];
  if ((unint64_t)(v3 - 1) >= 5)
  {
    if (v3 != -1)
    {
LABEL_7:
      uint64_t v6 = [(AKSignature *)self creationDate];
      if (v6)
      {
        double v7 = NSString;
        uint64_t v8 = +[AKController akBundle];
        uint64_t v9 = [v8 localizedStringForKey:@"Created %@" value:&stru_26EA57918 table:@"AKSignature"];
        uint64_t v10 = [MEMORY[0x263F08790] localizedStringFromDate:v6 dateStyle:3 timeStyle:3];
        uint64_t v5 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
      }
      else
      {
        uint64_t v5 = 0;
      }

      goto LABEL_11;
    }
    uint64_t v4 = [(AKSignature *)self customDescription];
  }
  else
  {
    uint64_t v4 = +[AKSignatureDescription stringValueForSignatureDescriptionTag:[(AKSignature *)self descriptionTag]];
  }
  uint64_t v5 = (void *)v4;
  if (!v4) {
    goto LABEL_7;
  }
LABEL_11:

  return v5;
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (NSUUID)uniqueID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUniqueID:(id)a3
{
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (int64_t)descriptionTag
{
  return self->_descriptionTag;
}

- (void)setDescriptionTag:(int64_t)a3
{
  self->_descriptionTag = a3;
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_drawing, 0);
}

@end