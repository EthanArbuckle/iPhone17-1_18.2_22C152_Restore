@interface _EAREuclidNeighbor
- (NSNumber)distance;
- (NSString)name;
- (_EAREuclidNeighbor)initWithName:(id)a3 distance:(id)a4;
- (id)description;
@end

@implementation _EAREuclidNeighbor

- (_EAREuclidNeighbor)initWithName:(id)a3 distance:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSNumber *)a4;
  name = self->_name;
  self->_name = v6;
  v9 = v6;

  distance = self->_distance;
  self->_distance = v7;

  return self;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_EAREuclidNeighbor;
  v3 = [(_EAREuclidNeighbor *)&v8 description];
  v4 = [(_EAREuclidNeighbor *)self name];
  v5 = [(_EAREuclidNeighbor *)self distance];
  v6 = [v3 stringByAppendingFormat:@" name=%@, distance=%@", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end