@interface EKSequenceToken
+ (BOOL)supportsSecureCoding;
- (EKSequenceToken)initWithCADSequenceToken:(id)a3;
- (EKSequenceToken)initWithCoder:(id)a3;
- (id)CADToken;
- (int)legacyToken;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKSequenceToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKSequenceToken)initWithCADSequenceToken:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKSequenceToken;
  v5 = [(EKSequenceToken *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 allDBSequenceMap];
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSDictionary *)v6;
  }
  return v5;
}

- (EKSequenceToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSequenceToken;
  v5 = [(EKSequenceToken *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"sequenceNumbers"];
    sequenceNumbers = v5->_sequenceNumbers;
    v5->_sequenceNumbers = (NSDictionary *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)CADToken
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F569F0]) initWithAllDBSequenceMap:self->_sequenceNumbers];

  return v2;
}

- (int)legacyToken
{
  sequenceNumbers = self->_sequenceNumbers;
  v3 = [NSNumber numberWithInt:*MEMORY[0x1E4F574B8]];
  id v4 = [(NSDictionary *)sequenceNumbers objectForKeyedSubscript:v3];

  if (v4) {
    int v5 = [v4 intValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end