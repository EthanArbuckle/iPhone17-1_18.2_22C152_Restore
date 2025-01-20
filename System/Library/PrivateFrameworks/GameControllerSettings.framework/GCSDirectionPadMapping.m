@interface GCSDirectionPadMapping
+ (BOOL)supportsSecureCoding;
+ (id)archivalClasses;
- (BOOL)invertHorizontally;
- (BOOL)invertVertically;
- (BOOL)isCustomized;
- (BOOL)swapAxes;
- (GCSDirectionPadMapping)initWithCoder:(id)a3;
- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5;
- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5 invertHorizontally:(BOOL)a6 invertVertically:(BOOL)a7 swapAxes:(BOOL)a8;
- (GCSDirectionPadMapping)initWithJSONObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonObject;
- (void)encodeWithCoder:(id)a3;
- (void)setInvertHorizontally:(BOOL)a3;
- (void)setInvertVertically:(BOOL)a3;
- (void)setSwapAxes:(BOOL)a3;
@end

@implementation GCSDirectionPadMapping

- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5
{
  v6.receiver = self;
  v6.super_class = (Class)GCSDirectionPadMapping;
  return [(GCSElementMapping *)&v6 initWithElementKey:a3 mappingKey:a4 remappingOrder:*(void *)&a5];
}

- (GCSDirectionPadMapping)initWithElementKey:(id)a3 mappingKey:(id)a4 remappingOrder:(int)a5 invertHorizontally:(BOOL)a6 invertVertically:(BOOL)a7 swapAxes:(BOOL)a8
{
  v12.receiver = self;
  v12.super_class = (Class)GCSDirectionPadMapping;
  result = [(GCSElementMapping *)&v12 initWithElementKey:a3 mappingKey:a4 remappingOrder:*(void *)&a5];
  if (result)
  {
    result->_invertHorizontally = a6;
    result->_invertVertically = a7;
    result->_swapAxes = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCSDirectionPadMapping;
  id v4 = [(GCSElementMapping *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setInvertHorizontally:", -[GCSDirectionPadMapping invertHorizontally](self, "invertHorizontally"));
  objc_msgSend(v4, "setInvertVertically:", -[GCSDirectionPadMapping invertVertically](self, "invertVertically"));
  objc_msgSend(v4, "setSwapAxes:", -[GCSDirectionPadMapping swapAxes](self, "swapAxes"));
  return v4;
}

- (id)description
{
  v3 = [(GCSElementMapping *)self elementKey];
  id v4 = [(GCSElementMapping *)self mappingKey];
  v5 = +[NSString stringWithFormat:@"<GCSDirectionPadMapping: elementKey=%@, mappingKey=%@>", v3, v4];

  return v5;
}

- (BOOL)isCustomized
{
  v4.receiver = self;
  v4.super_class = (Class)GCSDirectionPadMapping;
  return [(GCSElementMapping *)&v4 isCustomized]
      || self->_invertHorizontally
      || self->_invertVertically
      || self->_swapAxes;
}

- (BOOL)invertHorizontally
{
  return self->_invertHorizontally;
}

- (void)setInvertHorizontally:(BOOL)a3
{
  self->_invertHorizontally = a3;
}

- (BOOL)invertVertically
{
  return self->_invertVertically;
}

- (void)setInvertVertically:(BOOL)a3
{
  self->_invertVertically = a3;
}

- (BOOL)swapAxes
{
  return self->_swapAxes;
}

- (void)setSwapAxes:(BOOL)a3
{
  self->_swapAxes = a3;
}

+ (id)archivalClasses
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_26D32CB10, "setWithObjects:", v2, v3, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSDirectionPadMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCSDirectionPadMapping;
  v5 = [(GCSElementMapping *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_invertHorizontally = [v4 decodeBoolForKey:@"_invertHorizontally"];
    v5->_invertVertically = [v4 decodeBoolForKey:@"_invertVertically"];
    v5->_swapAxes = [v4 decodeBoolForKey:@"_swapAxes"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCSDirectionPadMapping;
  id v4 = a3;
  [(GCSElementMapping *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_invertHorizontally, @"_invertHorizontally", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_invertVertically forKey:@"_invertVertically"];
  [v4 encodeBool:self->_swapAxes forKey:@"_swapAxes"];
}

- (GCSDirectionPadMapping)initWithJSONObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)GCSDirectionPadMapping;
    objc_super v6 = [(GCSElementMapping *)&v12 initWithJSONObject:v5];
    if (v6)
    {
      objc_super v7 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"invertHorizontally");
      v6->_invertHorizontally = [v7 BOOLValue];

      v8 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"invertVertically");
      v6->_invertVertically = [v8 BOOLValue];

      v9 = objc_msgSend(v5, "_gcs_numberForJSONKey:", @"swapAxes");
      v6->_swapAxes = [v9 BOOLValue];
    }
    self = v6;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)jsonObject
{
  v10.receiver = self;
  v10.super_class = (Class)GCSDirectionPadMapping;
  uint64_t v3 = [(GCSElementMapping *)&v10 jsonObject];
  id v4 = +[NSMutableDictionary dictionary];
  [v4 addEntriesFromDictionary:v3];
  v11[0] = @"invertHorizontally";
  id v5 = +[NSNumber numberWithBool:self->_invertHorizontally];
  v12[0] = v5;
  v11[1] = @"invertVertically";
  objc_super v6 = +[NSNumber numberWithBool:self->_invertVertically];
  v12[1] = v6;
  v11[2] = @"swapAxes";
  objc_super v7 = +[NSNumber numberWithBool:self->_swapAxes];
  v12[2] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v4 addEntriesFromDictionary:v8];

  return v4;
}

@end