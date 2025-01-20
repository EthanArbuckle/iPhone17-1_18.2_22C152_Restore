@interface ENGroupID
+ (BOOL)supportsSecureCoding;
- (BOOL)compare:(id)a3 withResult:(int64_t *)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (ENGroupID)initWithCoder:(id)a3;
- (ENGroupID)initWithDataRepresentation:(id)a3;
- (ENGroupID)initWithStableGroupID:(id)a3 generation:(int)a4;
- (ENStableGroupID)stableGroupID;
- (NSData)dataRepresentation;
- (id)description;
- (int)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENGroupID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENGroupID)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[ENStableGroupID stableGroupIDLength];
  if ([v4 length] == v5 + 4)
  {
    v6 = objc_msgSend(v4, "subdataWithRange:", 0, v5);
    v7 = objc_msgSend(v4, "subdataWithRange:", v5, 4);
    v8 = [[ENStableGroupID alloc] initWithDataRepresentation:v6];
    if (v8)
    {
      unsigned int v11 = -1431655766;
      [v7 getBytes:&v11 length:4];
      self = [(ENGroupID *)self initWithStableGroupID:v8 generation:v11];
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v6 = +[ENLog groupID];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1DD45E7CC((uint64_t)v4, v6);
    }
    v9 = 0;
  }

  return v9;
}

- (ENGroupID)initWithStableGroupID:(id)a3 generation:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ENGroupID;
  v8 = [(ENGroupID *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stableGroupID, a3);
    v9->_generation = a4;
  }

  return v9;
}

- (ENGroupID)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENGroupIDStableGroupID"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"kENGroupIDGeneration"];

  id v7 = [(ENGroupID *)self initWithStableGroupID:v5 generation:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ENGroupID *)self stableGroupID];
  [v5 encodeObject:v4 forKey:@"kENGroupIDStableGroupID"];

  objc_msgSend(v5, "encodeInt32:forKey:", -[ENGroupID generation](self, "generation"), @"kENGroupIDGeneration");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(ENGroupID *)self stableGroupID];
    id v7 = [v5 stableGroupID];
    if ([v6 isEqual:v7])
    {
      int v8 = [(ENGroupID *)self generation];
      BOOL v9 = v8 == [v5 generation];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int v3 = [(ENGroupID *)self generation];
  id v4 = [(ENGroupID *)self stableGroupID];
  unint64_t v5 = [v4 hash] + 23 * v3 + 8993;

  return v5;
}

- (id)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(ENGroupID *)self stableGroupID];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p stableGroupID: %@ generation: %d>", v4, self, v5, -[ENGroupID generation](self, "generation")];

  return v6;
}

- (NSData)dataRepresentation
{
  int v3 = [(ENGroupID *)self stableGroupID];
  uint64_t v4 = [v3 _mutableDataRepresentation];
  unint64_t v5 = (void *)[v4 mutableCopy];

  [v5 appendBytes:&self->_generation length:4];
  return (NSData *)v5;
}

- (BOOL)compare:(id)a3 withResult:(int64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(ENGroupID *)self stableGroupID];
  v10 = [v8 stableGroupID];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    int v12 = [v8 generation];
    int v13 = [(ENGroupID *)self generation];
    int v14 = [v8 generation];
    int v15 = [(ENGroupID *)self generation];
    if (a4)
    {
      if (v12 <= v13) {
        int64_t v16 = 0;
      }
      else {
        int64_t v16 = -1;
      }
      if (v14 < v15) {
        int64_t v16 = 1;
      }
      goto LABEL_13;
    }
  }
  else
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:ENGroupIDErrorDomain code:-1000 userInfo:0];
    }
    if (a4)
    {
      int64_t v16 = 0;
LABEL_13:
      *a4 = v16;
    }
  }

  return v11;
}

- (ENStableGroupID)stableGroupID
{
  return self->_stableGroupID;
}

- (int)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
}

@end