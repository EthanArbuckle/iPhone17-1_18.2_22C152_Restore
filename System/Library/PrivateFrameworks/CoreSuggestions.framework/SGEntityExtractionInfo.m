@interface SGEntityExtractionInfo
+ (BOOL)supportsSecureCoding;
- (NSString)contactIdentifier;
- (NSString)source;
- (NSString)spotlightIdentifier;
- (SGEntityExtractionInfo)initWithCoder:(id)a3;
- (SGEntityExtractionInfo)initWithSpotlightIdentifier:(id)a3 source:(id)a4 entityType:(int64_t)a5 creationTimestamp:(SGUnixTimestamp_)a6 extractionType:(int64_t)a7 contactIdentifier:(id)a8;
- (SGUnixTimestamp_)creationTimestamp;
- (id)description;
- (int64_t)entityType;
- (int64_t)extractionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGEntityExtractionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)extractionType
{
  return self->_extractionType;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (SGEntityExtractionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SGEntityExtractionInfo;
  v5 = [(SGEntityExtractionInfo *)&v17 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"spotlightIdentifier"];
    spotlightIdentifier = v5->_spotlightIdentifier;
    v5->_spotlightIdentifier = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"source"];
    source = v5->_source;
    v5->_source = (NSString *)v10;

    v5->_entityType = [v4 decodeInt64ForKey:@"entityType"];
    [v4 decodeDoubleForKey:@"creationTimestamp"];
    v5->_creationTimestamp.secondsFromUnixEpoch = v12;
    v5->_extractionType = [v4 decodeInt64ForKey:@"extractionType"];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  spotlightIdentifier = self->_spotlightIdentifier;
  id v5 = a3;
  [v5 encodeObject:spotlightIdentifier forKey:@"spotlightIdentifier"];
  [v5 encodeObject:self->_source forKey:@"source"];
  [v5 encodeInt64:self->_entityType forKey:@"entityType"];
  [v5 encodeDouble:@"creationTimestamp" forKey:self->_creationTimestamp.secondsFromUnixEpoch];
  [v5 encodeInt64:self->_extractionType forKey:@"extractionType"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(SGEntityExtractionInfo *)self spotlightIdentifier];
  id v5 = [(SGEntityExtractionInfo *)self source];
  unint64_t v6 = [(SGEntityExtractionInfo *)self entityType];
  if (v6 > 0x1B) {
    uint64_t v7 = @"SGEntityTypePseudoEvent";
  }
  else {
    uint64_t v7 = off_1E5B8FC78[v6];
  }
  v8 = v7;
  [(SGEntityExtractionInfo *)self creationTimestamp];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v9];
  int64_t v11 = [(SGEntityExtractionInfo *)self extractionType];
  double v12 = @"ExtractionTypeUnknown";
  if (v11 == 2) {
    double v12 = @"ExtractionTypeCongratulations";
  }
  if (v11 == 1) {
    double v12 = @"ExtractionTypeBirthday";
  }
  v13 = v12;
  uint64_t v14 = [(SGEntityExtractionInfo *)self contactIdentifier];
  v15 = (void *)[v3 initWithFormat:@"<SGEntityExtractionInfo: spotlightIdentifier:%@ source:%@ entityType:%@ creationTimestamp:%@ extractionType:%@ contactIdentifier:%@>", v4, v5, v8, v10, v13, v14];

  return v15;
}

- (SGEntityExtractionInfo)initWithSpotlightIdentifier:(id)a3 source:(id)a4 entityType:(int64_t)a5 creationTimestamp:(SGUnixTimestamp_)a6 extractionType:(int64_t)a7 contactIdentifier:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SGEntityExtractionInfo;
  v18 = [(SGEntityExtractionInfo *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_spotlightIdentifier, a3);
    objc_storeStrong((id *)&v19->_source, a4);
    v19->_entityType = a5;
    v19->_creationTimestamp = a6;
    v19->_extractionType = a7;
    objc_storeStrong((id *)&v19->_contactIdentifier, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end