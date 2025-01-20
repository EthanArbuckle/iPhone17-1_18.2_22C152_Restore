@interface INGeographicalFeature
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INGeographicalFeature)initWithCoder:(id)a3;
- (INGeographicalFeature)initWithGeographicalFeatureType:(id)a3 geographicalFeatureDescriptors:(id)a4;
- (NSArray)geographicalFeatureDescriptors;
- (NSString)description;
- (NSString)geographicalFeatureType;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INGeographicalFeature

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"geographicalFeatureType";
  geographicalFeatureType = self->_geographicalFeatureType;
  v4 = geographicalFeatureType;
  if (!geographicalFeatureType)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"geographicalFeatureDescriptors";
  v10[0] = v4;
  geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  v6 = geographicalFeatureDescriptors;
  if (!geographicalFeatureDescriptors)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (geographicalFeatureDescriptors)
  {
    if (geographicalFeatureType) {
      goto LABEL_7;
    }
  }
  else
  {

    if (geographicalFeatureType) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geographicalFeatureDescriptors, 0);

  objc_storeStrong((id *)&self->_geographicalFeatureType, 0);
}

- (NSArray)geographicalFeatureDescriptors
{
  return self->_geographicalFeatureDescriptors;
}

- (NSString)geographicalFeatureType
{
  return self->_geographicalFeatureType;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INGeographicalFeature;
  v6 = [(INGeographicalFeature *)&v11 description];
  v7 = [(INGeographicalFeature *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INGeographicalFeature *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_geographicalFeatureType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"geographicalFeatureType");

  v9 = [v6 encodeObject:self->_geographicalFeatureDescriptors];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"geographicalFeatureDescriptors");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  geographicalFeatureType = self->_geographicalFeatureType;
  id v5 = a3;
  [v5 encodeObject:geographicalFeatureType forKey:@"geographicalFeatureType"];
  [v5 encodeObject:self->_geographicalFeatureDescriptors forKey:@"geographicalFeatureDescriptors"];
}

- (INGeographicalFeature)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geographicalFeatureType"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"geographicalFeatureDescriptors"];

  v10 = [(INGeographicalFeature *)self initWithGeographicalFeatureType:v5 geographicalFeatureDescriptors:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INGeographicalFeature *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      geographicalFeatureType = self->_geographicalFeatureType;
      BOOL v8 = 0;
      if (geographicalFeatureType == v5->_geographicalFeatureType
        || -[NSString isEqual:](geographicalFeatureType, "isEqual:"))
      {
        geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
        if (geographicalFeatureDescriptors == v5->_geographicalFeatureDescriptors
          || -[NSArray isEqual:](geographicalFeatureDescriptors, "isEqual:"))
        {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_geographicalFeatureType hash];
  return [(NSArray *)self->_geographicalFeatureDescriptors hash] ^ v3;
}

- (INGeographicalFeature)initWithGeographicalFeatureType:(id)a3 geographicalFeatureDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INGeographicalFeature;
  BOOL v8 = [(INGeographicalFeature *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    geographicalFeatureType = v8->_geographicalFeatureType;
    v8->_geographicalFeatureType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    geographicalFeatureDescriptors = v8->_geographicalFeatureDescriptors;
    v8->_geographicalFeatureDescriptors = (NSArray *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"geographicalFeatureType"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"geographicalFeatureDescriptors"];
    objc_super v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    v15 = (void *)[objc_alloc((Class)a1) initWithGeographicalFeatureType:v11 geographicalFeatureDescriptors:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end