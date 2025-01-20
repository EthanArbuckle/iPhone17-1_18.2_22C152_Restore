@interface ARParametricLights
+ (BOOL)supportsSecureCoding;
- (ARParametricLights)initWithAmbientColor:(id)a3 areaLights:;
- (ARParametricLights)initWithCoder:(id)a3;
- (NSArray)areaLights;
- (__n128)ambientColor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARParametricLights

- (ARParametricLights)initWithAmbientColor:(id)a3 areaLights:
{
  long long v10 = v3;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARParametricLights;
  v7 = [(ARParametricLights *)&v11 init];
  v8 = v7;
  if (v7)
  {
    *(_OWORD *)v7->_ambientColor = v10;
    objc_storeStrong((id *)&v7->_areaLights, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARParametricLights)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ar_decodeVector3ForKey:", @"ambientColor");
  double v13 = v5;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  long long v10 = [v4 decodeObjectOfClasses:v9 forKey:@"areaLights"];

  objc_super v11 = [(ARParametricLights *)self initWithAmbientColor:v10 areaLights:v13];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  long long v4 = *(_OWORD *)self->_ambientColor;
  id v5 = a3;
  objc_msgSend(v5, "ar_encodeVector3:forKey:", @"ambientColor", *(double *)&v4);
  [v5 encodeObject:self->_areaLights forKey:@"areaLights"];
}

- (__n128)ambientColor
{
  return a1[1];
}

- (NSArray)areaLights
{
  return self->_areaLights;
}

- (void).cxx_destruct
{
}

@end