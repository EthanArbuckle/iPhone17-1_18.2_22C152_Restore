@interface GCGenericDeviceRumbleModelBuilder
+ (Class)modelClass;
- (BOOL)isEqual:(id)a3;
- (GCGenericDeviceRumbleModelBuilder)init;
- (NSArray)actuators;
- (NSArray)nodes;
- (NSArray)outputs;
- (float)dispatchFrequency;
- (id)build;
- (unint64_t)hash;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setActuators:(id)a3;
- (void)setDispatchFrequency:(float)a3;
- (void)setNodes:(id)a3;
- (void)setOutputs:(id)a3;
@end

@implementation GCGenericDeviceRumbleModelBuilder

- (GCGenericDeviceRumbleModelBuilder)init
{
  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceRumbleModelBuilder;
  v2 = [(GCGenericDeviceRumbleModelBuilder *)&v4 init];
  [(GCGenericDeviceRumbleModelBuilder *)v2 reset];
  return v2;
}

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  id v4 = a3;
  [v4 dispatchFrequency];
  -[GCGenericDeviceRumbleModelBuilder setDispatchFrequency:](self, "setDispatchFrequency:");
  v5 = [v4 actuators];
  [(GCGenericDeviceRumbleModelBuilder *)self setActuators:v5];

  v6 = [v4 nodes];
  [(GCGenericDeviceRumbleModelBuilder *)self setNodes:v6];

  id v7 = [v4 outputs];

  [(GCGenericDeviceRumbleModelBuilder *)self setOutputs:v7];
}

- (void)reset
{
  [(GCGenericDeviceRumbleModelBuilder *)self setDispatchFrequency:0.0];
  [(GCGenericDeviceRumbleModelBuilder *)self setActuators:0];
  [(GCGenericDeviceRumbleModelBuilder *)self setNodes:0];

  [(GCGenericDeviceRumbleModelBuilder *)self setOutputs:0];
}

- (id)build
{
  id v4 = (float *)objc_alloc((Class)[(id)objc_opt_class() modelClass]);
  [(GCGenericDeviceRumbleModelBuilder *)self dispatchFrequency];
  float v6 = v5;
  if (v5 <= 0.0)
  {
    v17 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v17 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleModel.m" lineNumber:148 description:@"'dispatchFrequency' can not be 0"];
  }
  v4[2] = v6;
  id v7 = [(GCGenericDeviceRumbleModelBuilder *)self actuators];
  if (!v7)
  {
    v18 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v18 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleModel.m" lineNumber:152 description:@"'actuators' can not be nil"];
  }
  uint64_t v8 = [v7 copy];
  v9 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v8;

  v10 = [(GCGenericDeviceRumbleModelBuilder *)self nodes];
  if (!v10)
  {
    v19 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v19 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleModel.m" lineNumber:156 description:@"'nodes' can not be nil"];
  }
  uint64_t v11 = [v10 copy];
  v12 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v11;

  v13 = [(GCGenericDeviceRumbleModelBuilder *)self outputs];
  if (!v13)
  {
    v20 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    [v20 handleFailureInMethod:a2 object:self file:@"GCGenericDeviceRumbleModel.m" lineNumber:160 description:@"'outputs' can not be nil"];
  }
  uint64_t v14 = [v13 copy];
  v15 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v14;

  return v4;
}

- (unint64_t)hash
{
  v2 = (void *)[(id)objc_opt_class() modelClass];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [v4 isEqual:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GCGenericDeviceRumbleModelBuilder;
    unsigned __int8 v5 = [(GCGenericDeviceRumbleModelBuilder *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (float)dispatchFrequency
{
  return self->_dispatchFrequency;
}

- (void)setDispatchFrequency:(float)a3
{
  self->_dispatchFrequency = a3;
}

- (NSArray)actuators
{
  return self->_actuators;
}

- (void)setActuators:(id)a3
{
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (void)setOutputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_actuators, 0);
}

@end