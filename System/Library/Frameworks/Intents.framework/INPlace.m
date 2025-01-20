@interface INPlace
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPlace)initWithCoder:(id)a3;
- (INPlace)initWithPlaceType:(id)a3 placeSubType:(id)a4 placeDescriptors:(id)a5 personalPlaceType:(int64_t)a6;
- (NSArray)placeDescriptors;
- (NSString)description;
- (NSString)placeSubType;
- (NSString)placeType;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)personalPlaceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPlace

- (id)_dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"placeType";
  placeType = self->_placeType;
  v4 = placeType;
  if (!placeType)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"placeSubType";
  placeSubType = self->_placeSubType;
  v6 = placeSubType;
  if (!placeSubType)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v6;
  v12[2] = @"placeDescriptors";
  placeDescriptors = self->_placeDescriptors;
  v8 = placeDescriptors;
  if (!placeDescriptors)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v8;
  v12[3] = @"personalPlaceType";
  v9 = [NSNumber numberWithInteger:self->_personalPlaceType];
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  if (placeDescriptors)
  {
    if (placeSubType) {
      goto LABEL_9;
    }
LABEL_14:

    if (placeType) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!placeSubType) {
    goto LABEL_14;
  }
LABEL_9:
  if (placeType) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDescriptors, 0);
  objc_storeStrong((id *)&self->_placeSubType, 0);

  objc_storeStrong((id *)&self->_placeType, 0);
}

- (int64_t)personalPlaceType
{
  return self->_personalPlaceType;
}

- (NSArray)placeDescriptors
{
  return self->_placeDescriptors;
}

- (NSString)placeSubType
{
  return self->_placeSubType;
}

- (NSString)placeType
{
  return self->_placeType;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPlace;
  v6 = [(INPlace *)&v11 description];
  v7 = [(INPlace *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPlace *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_placeType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"placeType");

  v9 = [v6 encodeObject:self->_placeSubType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"placeSubType");

  v10 = [v6 encodeObject:self->_placeDescriptors];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"placeDescriptors");
  int64_t personalPlaceType = self->_personalPlaceType;
  v12 = @"unknown";
  if (personalPlaceType == 2) {
    v12 = @"work";
  }
  if (personalPlaceType == 1) {
    v13 = @"home";
  }
  else {
    v13 = v12;
  }
  v14 = v13;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"personalPlaceType");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  placeType = self->_placeType;
  id v5 = a3;
  [v5 encodeObject:placeType forKey:@"placeType"];
  [v5 encodeObject:self->_placeSubType forKey:@"placeSubType"];
  [v5 encodeObject:self->_placeDescriptors forKey:@"placeDescriptors"];
  [v5 encodeInteger:self->_personalPlaceType forKey:@"personalPlaceType"];
}

- (INPlace)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeType"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeSubType"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"placeDescriptors"];

  uint64_t v11 = [v4 decodeIntegerForKey:@"personalPlaceType"];
  v12 = [(INPlace *)self initWithPlaceType:v5 placeSubType:v6 placeDescriptors:v10 personalPlaceType:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPlace *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      placeType = self->_placeType;
      BOOL v9 = (placeType == v5->_placeType || -[NSString isEqual:](placeType, "isEqual:"))
        && ((placeSubType = self->_placeSubType, placeSubType == v5->_placeSubType)
         || -[NSString isEqual:](placeSubType, "isEqual:"))
        && ((placeDescriptors = self->_placeDescriptors, placeDescriptors == v5->_placeDescriptors)
         || -[NSArray isEqual:](placeDescriptors, "isEqual:"))
        && self->_personalPlaceType == v5->_personalPlaceType;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_placeType hash];
  NSUInteger v4 = [(NSString *)self->_placeSubType hash] ^ v3;
  uint64_t v5 = v4 ^ [(NSArray *)self->_placeDescriptors hash];
  id v6 = [NSNumber numberWithInteger:self->_personalPlaceType];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (INPlace)initWithPlaceType:(id)a3 placeSubType:(id)a4 placeDescriptors:(id)a5 personalPlaceType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)INPlace;
  v13 = [(INPlace *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    placeType = v13->_placeType;
    v13->_placeType = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    placeSubType = v13->_placeSubType;
    v13->_placeSubType = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    placeDescriptors = v13->_placeDescriptors;
    v13->_placeDescriptors = (NSArray *)v18;

    v13->_int64_t personalPlaceType = a6;
  }

  return v13;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"placeType"];
    id v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"placeSubType"];
    uint64_t v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v8 objectForKeyedSubscript:@"placeDescriptors"];
    v17 = [v7 decodeObjectsOfClass:v15 from:v16];

    uint64_t v18 = [v8 objectForKeyedSubscript:@"personalPlaceType"];
    uint64_t v19 = INPersonalPlaceTypeWithString(v18);

    v20 = (void *)[objc_alloc((Class)a1) initWithPlaceType:v11 placeSubType:v14 placeDescriptors:v17 personalPlaceType:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end