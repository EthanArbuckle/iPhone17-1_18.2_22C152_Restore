@interface LNViewEntity
+ (BOOL)supportsSecureCoding;
- (LNDisplayRepresentation)displayRepresentation;
- (LNEntityIdentifier)identifier;
- (LNValue)value;
- (LNViewEntity)initWithCoder:(id)a3;
- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5;
- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6;
- (LNViewEntity)initWithValue:(id)a3 interactionID:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6 displayRepresentation:(id)a7 state:(int64_t)a8;
- (LNViewLocation)location;
- (NSNumber)interactionId;
- (id)description;
- (int64_t)state;
- (int64_t)structuredDataRepresentations;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNViewEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)structuredDataRepresentations
{
  return self->_structuredDataRepresentations;
}

- (NSNumber)interactionId
{
  return self->_interactionId;
}

- (LNViewLocation)location
{
  long long v3 = *(_OWORD *)&self[1].z;
  *(_OWORD *)&retstr->x = *(_OWORD *)&self[1].x;
  *(_OWORD *)&retstr->z = v3;
  *(_OWORD *)&retstr->height = *(_OWORD *)&self[1].height;
  return self;
}

- (LNValue)value
{
  return self->_value;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNViewEntity *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  v6 = [(LNViewEntity *)self interactionId];
  [v4 encodeObject:v6 forKey:@"interactionId"];

  [v4 encodeBytes:&self->_location length:48 forKey:@"location"];
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[LNViewEntity structuredDataRepresentations](self, "structuredDataRepresentations"));
  [v4 encodeObject:v7 forKey:@"structuredDataRepresentations"];

  v8 = [(LNViewEntity *)self displayRepresentation];
  [v4 encodeObject:v8 forKey:@"displayRepresentation"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[LNViewEntity state](self, "state"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"state"];
}

- (LNViewEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  if (v5) {
    goto LABEL_2;
  }
  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (!v18) {
    goto LABEL_8;
  }
  v19 = (void *)v18;
  id v20 = objc_alloc(MEMORY[0x1E4F72718]);
  v21 = objc_opt_new();
  v5 = (void *)[v20 initWithValue:v19 valueType:v21];

  if (v5)
  {
LABEL_2:
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionId"];
    if (v6)
    {
      uint64_t v24 = 0;
      id v7 = v4;
      uint64_t v8 = [v7 decodeBytesForKey:@"location" returnedLength:&v24];
      id v9 = 0;
      if (v8 && v24 == 48)
      {
        v10 = (long long *)v8;
        v11 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"structuredDataRepresentations"];
        uint64_t v12 = [v11 unsignedIntValue];

        v13 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];
        v14 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
        uint64_t v15 = [v14 unsignedIntValue];

        long long v16 = *v10;
        long long v17 = v10[2];
        v23[1] = v10[1];
        v23[2] = v17;
        v23[0] = v16;
        self = [(LNViewEntity *)self initWithValue:v5 interactionID:v6 location:v23 structuredDataRepresentations:v12 displayRepresentation:v13 state:v15];

        id v9 = self;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
LABEL_8:
    id v9 = 0;
  }

  return v9;
}

- (id)description
{
  long long v3 = NSString;
  id v4 = [(LNViewEntity *)self identifier];
  v5 = LNViewLocationAsString((uint64_t *)&self->_location);
  v6 = [v3 stringWithFormat:@"\"%@\" @ %@", v4, v5];

  return v6;
}

- (LNEntityIdentifier)identifier
{
  long long v3 = [(LNValue *)self->_value valueType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  value = self->_value;
  if (isKindOfClass)
  {
    v6 = [(LNValue *)value value];
  }
  else
  {
    id v7 = [(LNValue *)value valueType];
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      id v9 = [(LNValue *)self->_value value];
      v6 = [v9 identifier];
    }
    else
    {
      v6 = 0;
    }
  }
  return (LNEntityIdentifier *)v6;
}

- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F72708];
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[[v10 alloc] initWithKey:&stru_1EF7D9D20 table:0 bundleURL:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F72628]) initWithTitle:v13 subtitle:0 image:0];
  id v15 = objc_alloc(MEMORY[0x1E4F72718]);
  long long v16 = objc_opt_new();
  long long v17 = (void *)[v15 initWithValue:v12 valueType:v16];

  long long v18 = *(_OWORD *)&a5->z;
  v21[0] = *(_OWORD *)&a5->x;
  v21[1] = v18;
  v21[2] = *(_OWORD *)&a5->height;
  v19 = [(LNViewEntity *)self initWithValue:v17 interactionID:v11 location:v21 structuredDataRepresentations:a6 displayRepresentation:v14 state:0];

  return v19;
}

- (LNViewEntity)initWithIdentifier:(id)a3 interactionId:(id)a4 location:(LNViewLocation *)a5
{
  long long v5 = *(_OWORD *)&a5->z;
  v7[0] = *(_OWORD *)&a5->x;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->height;
  return [(LNViewEntity *)self initWithIdentifier:a3 interactionId:a4 location:v7 structuredDataRepresentations:0];
}

- (LNViewEntity)initWithValue:(id)a3 interactionID:(id)a4 location:(LNViewLocation *)a5 structuredDataRepresentations:(int64_t)a6 displayRepresentation:(id)a7 state:(int64_t)a8
{
  id v16 = a3;
  long long v17 = (NSNumber *)a4;
  id v18 = a7;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNViewEntity.m", 24, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNViewEntity.m", 25, @"Invalid parameter not satisfying: %@", @"interactionId" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)LNViewEntity;
  v19 = [(LNViewEntity *)&v27 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_value, a3);
    v20->_interactionId = v17;
    long long v21 = *(_OWORD *)&a5->x;
    long long v22 = *(_OWORD *)&a5->height;
    *(_OWORD *)&v20->_location.z = *(_OWORD *)&a5->z;
    *(_OWORD *)&v20->_location.height = v22;
    *(_OWORD *)&v20->_location.x = v21;
    v20->_structuredDataRepresentations = a6;
    objc_storeStrong((id *)&v20->_displayRepresentation, a7);
    v20->_state = a8;
    v23 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end