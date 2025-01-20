@interface SGExtractionInfo
+ (BOOL)supportsSecureCoding;
+ (SGExtractionInfo)extractionInfoWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5;
- (NSNumber)confidence;
- (NSNumber)modelVersion;
- (SGExtractionInfo)initWithCoder:(id)a3;
- (SGExtractionInfo)initWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)extractionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGExtractionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidence, 0);

  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (NSNumber)modelVersion
{
  return self->_modelVersion;
}

- (unint64_t)extractionType
{
  return self->_extractionType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(SGExtractionInfo *)self extractionType];
  v6 = [(SGExtractionInfo *)self modelVersion];
  v7 = [(SGExtractionInfo *)self confidence];
  v8 = (void *)[v4 initWithExtractionType:v5 modelVersion:v6 confidence:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t extractionType = self->_extractionType;
  id v5 = a3;
  [v5 encodeInt64:extractionType forKey:@"extractionType"];
  [v5 encodeObject:self->_modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->_confidence forKey:@"confidence"];
}

- (SGExtractionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGExtractionInfo;
  id v5 = [(SGExtractionInfo *)&v15 init];
  if (v5)
  {
    v5->_unint64_t extractionType = [v4 decodeInt64ForKey:@"extractionType"];
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"modelVersion"];

    if (v7) {
      v8 = v7;
    }
    else {
      v8 = (NSNumber *)&unk_1EF92F700;
    }
    modelVersion = v5->_modelVersion;
    v5->_modelVersion = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"confidence"];

    if (v11) {
      v12 = v11;
    }
    else {
      v12 = (NSNumber *)&unk_1EF92F8E8;
    }
    confidence = v5->_confidence;
    v5->_confidence = v12;
  }
  return v5;
}

- (SGExtractionInfo)initWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SGExtractionInfo;
  v11 = [(SGExtractionInfo *)&v22 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_12;
  }
  v11->_unint64_t extractionType = a3;
  [v10 floatValue];
  if (v13 < 0.0 || ([v10 floatValue], v14 > 1.0))
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:v12 file:@"SGExtractionInfo.m" lineNumber:29 description:@"Extraction confidence must be between 0 and 1"];

    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    objc_super v15 = [NSNumber numberWithInteger:0];
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  objc_super v15 = (NSNumber *)v9;
LABEL_8:
  modelVersion = v12->_modelVersion;
  v12->_modelVersion = v15;

  if (v10)
  {
    v19 = (NSNumber *)v10;
  }
  else
  {
    LODWORD(v18) = 0.5;
    v19 = [NSNumber numberWithFloat:v18];
  }
  confidence = v12->_confidence;
  v12->_confidence = v19;

LABEL_12:
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SGExtractionInfo)extractionInfoWithExtractionType:(unint64_t)a3 modelVersion:(id)a4 confidence:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithExtractionType:a3 modelVersion:v9 confidence:v8];

  return (SGExtractionInfo *)v10;
}

@end