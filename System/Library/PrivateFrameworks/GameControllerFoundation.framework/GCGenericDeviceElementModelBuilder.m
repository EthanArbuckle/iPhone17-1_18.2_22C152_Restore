@interface GCGenericDeviceElementModelBuilder
+ (Class)modelClass;
- (BOOL)optional;
- (GCGenericDeviceElementModelBuilder)init;
- (NSPredicate)predicate;
- (NSString)identifier;
- (id)build;
- (int)typeOverride;
- (int64_t)calibrationMax;
- (int64_t)calibrationMin;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setCalibrationMax:(int64_t)a3;
- (void)setCalibrationMin:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setTypeOverride:(int)a3;
@end

@implementation GCGenericDeviceElementModelBuilder

- (GCGenericDeviceElementModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceElementModelBuilder;
  v2 = [(GCGenericDeviceElementModelBuilder *)&v4 init];
  [(GCGenericDeviceElementModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 predicate];
  [(GCGenericDeviceElementModelBuilder *)self setPredicate:v5];

  v6 = [v4 identifier];
  [(GCGenericDeviceElementModelBuilder *)self setIdentifier:v6];

  -[GCGenericDeviceElementModelBuilder setOptional:](self, "setOptional:", [v4 optional]);
  -[GCGenericDeviceElementModelBuilder setTypeOverride:](self, "setTypeOverride:", [v4 typeOverride]);
  -[GCGenericDeviceElementModelBuilder setCalibrationMin:](self, "setCalibrationMin:", [v4 calibrationMin]);
  uint64_t v7 = [v4 calibrationMax];

  [(GCGenericDeviceElementModelBuilder *)self setCalibrationMax:v7];
}

- (void)reset
{
  [(GCGenericDeviceElementModelBuilder *)self setPredicate:0];
  [(GCGenericDeviceElementModelBuilder *)self setIdentifier:0];
  [(GCGenericDeviceElementModelBuilder *)self setOptional:0];
  [(GCGenericDeviceElementModelBuilder *)self setTypeOverride:0];
  [(GCGenericDeviceElementModelBuilder *)self setCalibrationMax:0];

  [(GCGenericDeviceElementModelBuilder *)self setCalibrationMin:0];
}

- (id)build
{
  id v4 = objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  v5 = [(GCGenericDeviceElementModelBuilder *)self predicate];
  if (!v5)
  {
    v12 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v12 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceElementModel.m" lineNumber:167 description:@"'predicate' can not be nil"];
  }
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[2];
  v4[2] = v6;

  v8 = [(GCGenericDeviceElementModelBuilder *)self identifier];
  if (!v8)
  {
    v13 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v13 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceElementModel.m" lineNumber:171 description:@"'identifier' can not be nil"];
  }
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  *((unsigned char *)v4 + 32) = [(GCGenericDeviceElementModelBuilder *)self optional];
  *((_DWORD *)v4 + 9) = [(GCGenericDeviceElementModelBuilder *)self typeOverride];
  v4[5] = [(GCGenericDeviceElementModelBuilder *)self calibrationMin];
  v4[6] = [(GCGenericDeviceElementModelBuilder *)self calibrationMax];

  return v4;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)optional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (int)typeOverride
{
  return self->_typeOverride;
}

- (void)setTypeOverride:(int)a3
{
  self->_typeOverride = a3;
}

- (int64_t)calibrationMin
{
  return self->_calibrationMin;
}

- (void)setCalibrationMin:(int64_t)a3
{
  self->_calibrationMin = a3;
}

- (int64_t)calibrationMax
{
  return self->_calibrationMax;
}

- (void)setCalibrationMax:(int64_t)a3
{
  self->_calibrationMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end