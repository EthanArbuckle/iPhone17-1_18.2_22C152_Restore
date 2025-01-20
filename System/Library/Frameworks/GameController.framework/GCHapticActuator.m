@interface GCHapticActuator
+ (BOOL)supportsSecureCoding;
- (GCHapticActuator)initWithCoder:(id)a3;
- (GCHapticActuator)initWithJSONDictionaryRepresentation:(id)a3;
- (GCHapticActuator)initWithLabel:(id)a3 type:(int64_t)a4 index:(unint64_t)a5;
- (NSString)description;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonDictionaryRepresentation;
- (int64_t)type;
- (unint64_t)index;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GCHapticActuator

- (GCHapticActuator)initWithLabel:(id)a3 type:(int64_t)a4 index:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCHapticActuator;
  v10 = [(GCHapticActuator *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_label, a3);
    v11->_type = a4;
    v11->_index = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [GCHapticActuator alloc];
  v5 = [(GCHapticActuator *)self label];
  v6 = (void *)[v5 copy];
  v7 = [(GCHapticActuator *)v4 initWithLabel:v6 type:[(GCHapticActuator *)self type] index:[(GCHapticActuator *)self index]];

  return v7;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ %@ (type %ld)>", objc_opt_class(), self->_label, self->_type];
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(GCHapticActuator *)self label];
  [v5 encodeObject:v4 forKey:@"label"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[GCHapticActuator type](self, "type"), @"type");
  objc_msgSend(v5, "encodeInteger:forKey:", -[GCHapticActuator index](self, "index"), @"index");
}

- (GCHapticActuator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCHapticActuator;
  id v5 = [(GCHapticActuator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_index = [v4 decodeIntegerForKey:@"index"];
  }

  return v5;
}

- (GCHapticActuator)initWithJSONDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCHapticActuator;
  id v5 = [(GCHapticActuator *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"type"];
    v5->_type = [v8 unsignedIntValue];

    objc_super v9 = [v4 objectForKeyedSubscript:@"index"];
    v5->_index = [v9 unsignedIntValue];
  }
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  int64_t type = self->_type;
  v9[0] = self->_label;
  v8[0] = @"label";
  v8[1] = @"type";
  id v4 = +[NSNumber numberWithInteger:type];
  v9[1] = v4;
  v8[2] = @"index";
  id v5 = +[NSNumber numberWithUnsignedInteger:self->_index];
  v9[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

@end