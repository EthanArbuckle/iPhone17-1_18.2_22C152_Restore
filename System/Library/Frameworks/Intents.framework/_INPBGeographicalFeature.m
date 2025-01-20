@interface _INPBGeographicalFeature
+ (BOOL)supportsSecureCoding;
+ (Class)geographicalFeatureDescriptorsType;
- (BOOL)hasGeographicalFeatureType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)geographicalFeatureDescriptors;
- (_INPBGeographicalFeature)initWithCoder:(id)a3;
- (_INPBString)geographicalFeatureType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)geographicalFeatureDescriptorsAtIndex:(unint64_t)a3;
- (unint64_t)geographicalFeatureDescriptorsCount;
- (unint64_t)hash;
- (void)addGeographicalFeatureDescriptors:(id)a3;
- (void)clearGeographicalFeatureDescriptors;
- (void)encodeWithCoder:(id)a3;
- (void)setGeographicalFeatureDescriptors:(id)a3;
- (void)setGeographicalFeatureType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGeographicalFeature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geographicalFeatureType, 0);

  objc_storeStrong((id *)&self->_geographicalFeatureDescriptors, 0);
}

- (_INPBString)geographicalFeatureType
{
  return self->_geographicalFeatureType;
}

- (NSArray)geographicalFeatureDescriptors
{
  return self->_geographicalFeatureDescriptors;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_geographicalFeatureDescriptors count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_geographicalFeatureDescriptors;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"geographicalFeatureDescriptors"];
  }
  v11 = [(_INPBGeographicalFeature *)self geographicalFeatureType];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"geographicalFeatureType"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_geographicalFeatureDescriptors hash];
  return [(_INPBString *)self->_geographicalFeatureType hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBGeographicalFeature *)self geographicalFeatureDescriptors];
  uint64_t v6 = [v4 geographicalFeatureDescriptors];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBGeographicalFeature *)self geographicalFeatureDescriptors];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBGeographicalFeature *)self geographicalFeatureDescriptors];
    v10 = [v4 geographicalFeatureDescriptors];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBGeographicalFeature *)self geographicalFeatureType];
  uint64_t v6 = [v4 geographicalFeatureType];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBGeographicalFeature *)self geographicalFeatureType];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBGeographicalFeature *)self geographicalFeatureType];
    long long v15 = [v4 geographicalFeatureType];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBGeographicalFeature allocWithZone:](_INPBGeographicalFeature, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_geographicalFeatureDescriptors copyWithZone:a3];
  [(_INPBGeographicalFeature *)v5 setGeographicalFeatureDescriptors:v6];

  id v7 = [(_INPBString *)self->_geographicalFeatureType copyWithZone:a3];
  [(_INPBGeographicalFeature *)v5 setGeographicalFeatureType:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGeographicalFeature *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGeographicalFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGeographicalFeature *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGeographicalFeature *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGeographicalFeature *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_geographicalFeatureDescriptors;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBGeographicalFeature *)self geographicalFeatureType];

  if (v10)
  {
    int v11 = [(_INPBGeographicalFeature *)self geographicalFeatureType];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGeographicalFeatureReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasGeographicalFeatureType
{
  return self->_geographicalFeatureType != 0;
}

- (void)setGeographicalFeatureType:(id)a3
{
}

- (id)geographicalFeatureDescriptorsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_geographicalFeatureDescriptors objectAtIndexedSubscript:a3];
}

- (unint64_t)geographicalFeatureDescriptorsCount
{
  return [(NSArray *)self->_geographicalFeatureDescriptors count];
}

- (void)addGeographicalFeatureDescriptors:(id)a3
{
  id v4 = a3;
  geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  id v8 = v4;
  if (!geographicalFeatureDescriptors)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_geographicalFeatureDescriptors;
    self->_geographicalFeatureDescriptors = v6;

    id v4 = v8;
    geographicalFeatureDescriptors = self->_geographicalFeatureDescriptors;
  }
  [(NSArray *)geographicalFeatureDescriptors addObject:v4];
}

- (void)clearGeographicalFeatureDescriptors
{
}

- (void)setGeographicalFeatureDescriptors:(id)a3
{
  self->_geographicalFeatureDescriptors = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)geographicalFeatureDescriptorsType
{
  return (Class)objc_opt_class();
}

@end