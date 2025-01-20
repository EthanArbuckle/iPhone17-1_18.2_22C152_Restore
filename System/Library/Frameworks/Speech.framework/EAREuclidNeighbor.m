@interface EAREuclidNeighbor
+ (BOOL)supportsSecureCoding;
- (EAREuclidNeighbor)initWithCoder:(id)a3;
- (EAREuclidNeighbor)initWithEuclidNeighbor:(id)a3;
- (NSNumber)distance;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EAREuclidNeighbor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSNumber)distance
{
  return self->_distance;
}

- (NSString)name
{
  return self->_name;
}

- (EAREuclidNeighbor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EAREuclidNeighbor;
  v5 = [(EAREuclidNeighbor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distance"];
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_distance forKey:@"distance"];
}

- (EAREuclidNeighbor)initWithEuclidNeighbor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EAREuclidNeighbor;
  id v5 = [(EAREuclidNeighbor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 distance];
    distance = v5->_distance;
    v5->_distance = (NSNumber *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end