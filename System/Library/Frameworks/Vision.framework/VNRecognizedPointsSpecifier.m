@interface VNRecognizedPointsSpecifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNRecognizedPointsSpecifier)initWithCoder:(id)a3;
- (VNRecognizedPointsSpecifier)initWithOriginatingRequestSpecifier:(id)a3 allRecognizedPoints:(id)a4;
- (id)availableGroupKeys;
- (id)availableKeys;
- (id)originatingRequestSpecifier;
- (id)pointKeyGroupLabelsMapping;
- (id)populatedMLMultiArrayAndReturnError:(id *)a3;
- (id)recognizedPointForKey:(id)a3 error:(id *)a4;
- (id)recognizedPointsForGroupKey:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedPointsSpecifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allRecognizedPoints, 0);

  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

- (VNRecognizedPointsSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Req"];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"AllPoints"];
  if (v10)
  {
    self = [(VNRecognizedPointsSpecifier *)self initWithOriginatingRequestSpecifier:v5 allRecognizedPoints:v10];
    v11 = self;
  }
  else
  {
    v12 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"recognized points are not available"];
    [v4 failWithError:v12];

    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  originatingRequestSpecifier = self->_originatingRequestSpecifier;
  id v5 = a3;
  [v5 encodeObject:originatingRequestSpecifier forKey:@"Req"];
  [v5 encodeObject:self->_allRecognizedPoints forKey:@"AllPoints"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNRecognizedPointsSpecifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      originatingRequestSpecifier = self->_originatingRequestSpecifier;
      uint64_t v7 = [(VNRecognizedPointsSpecifier *)v5 originatingRequestSpecifier];
      LODWORD(originatingRequestSpecifier) = [(VNRequestSpecifier *)originatingRequestSpecifier isEqual:v7];

      if (originatingRequestSpecifier)
      {
        uint64_t v8 = self->_allRecognizedPoints;
        char v9 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_allRecognizedPoints hash] ^ __ROR8__([(VNRequestSpecifier *)self->_originatingRequestSpecifier hash], 51);
}

- (id)recognizedPointForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSDictionary *)self->_allRecognizedPoints objectForKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"unable to locate point '%@'", v6];
    *a4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v10];
  }

  return v8;
}

- (id)recognizedPointsForGroupKey:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:@"VNIPOAll"])
  {
    uint64_t v7 = self->_allRecognizedPoints;
  }
  else
  {
    uint64_t v8 = [(VNRecognizedPointsSpecifier *)self pointKeyGroupLabelsMapping];
    id v9 = [v8 objectForKey:v6];
    if (v9)
    {
      v18 = v8;
      uint64_t v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v16 = [(NSDictionary *)self->_allRecognizedPoints objectForKeyedSubscript:v15];
            [(NSDictionary *)v7 setValue:v16 forKey:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      uint64_t v8 = v18;
    }
    else if (a4)
    {
      +[VNError errorForInvalidArgument:v6 named:@"groupKey"];
      uint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  if (a3)
  {
    *a3 = +[VNError errorForUnimplementedMethod:a2 ofObject:self];
  }
  return 0;
}

- (id)pointKeyGroupLabelsMapping
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)availableGroupKeys
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)availableKeys
{
  return [(NSDictionary *)self->_allRecognizedPoints allKeys];
}

- (id)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (VNRecognizedPointsSpecifier)initWithOriginatingRequestSpecifier:(id)a3 allRecognizedPoints:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNRecognizedPointsSpecifier;
  id v9 = [(VNRecognizedPointsSpecifier *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originatingRequestSpecifier, a3);
    uint64_t v11 = [v8 copy];
    allRecognizedPoints = v10->_allRecognizedPoints;
    v10->_allRecognizedPoints = (NSDictionary *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end