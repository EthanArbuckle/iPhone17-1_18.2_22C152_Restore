@interface MIOModelLayer
- (BOOL)isEqual:(id)a3;
- (MIOModelLayer)initWithMessageStream:(CodedInputStream *)a3 error:(id *)a4;
- (MIOModelLayer)initWithName:(id)a3 type:(id)a4;
- (MIOModelLayer)initWithName:(id)a3 type:(id)a4 histogram:(id)a5 computePrecision:(id)a6 storagePrecision:(id)a7;
- (NSString)name;
- (NSString)type;
- (id)computePrecision;
- (id)description;
- (id)layerHistogram;
- (id)storagePrecision;
- (unint64_t)hash;
@end

@implementation MIOModelLayer

- (MIOModelLayer)initWithName:(id)a3 type:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOModelLayer;
  v8 = [(MIOModelLayer *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_type, a4);
  }

  return v8;
}

- (MIOModelLayer)initWithName:(id)a3 type:(id)a4 histogram:(id)a5 computePrecision:(id)a6 storagePrecision:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MIOModelLayer;
  v17 = [(MIOModelLayer *)&v27 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    objc_storeStrong((id *)&v17->_type, a4);
    uint64_t v20 = [v14 copy];
    layerHistogram = v17->_layerHistogram;
    v17->_layerHistogram = (NSDictionary *)v20;

    uint64_t v22 = [v15 copy];
    computePrecision = v17->_computePrecision;
    v17->_computePrecision = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    storagePrecision = v17->_storagePrecision;
    v17->_storagePrecision = (NSArray *)v24;
  }
  return v17;
}

- (MIOModelLayer)initWithMessageStream:(CodedInputStream *)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  MIOParseNeuralNetworkLayerSpecification(a3, (uint64_t)&v7);
  v5 = -[MIOModelLayer initWithName:type:histogram:computePrecision:storagePrecision:](self, "initWithName:type:histogram:computePrecision:storagePrecision:", v7, v8, v9);

  return v5;
}

- (id)layerHistogram
{
  return self->_layerHistogram;
}

- (id)computePrecision
{
  return self->_computePrecision;
}

- (id)storagePrecision
{
  return self->_storagePrecision;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MIOModelLayer *)self name];
  v5 = [v3 stringWithFormat:@"MIOModelLayer (%p) %@", self, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOModelLayer *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MIOModelLayer *)self name];
      long long v7 = [(MIOModelLayer *)v5 name];
      if ([v6 isEqual:v7])
      {
        long long v8 = [(MIOModelLayer *)self type];
        id v9 = [(MIOModelLayer *)v5 type];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(MIOModelLayer *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(MIOModelLayer *)self type];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storagePrecision, 0);
  objc_storeStrong((id *)&self->_computePrecision, 0);
  objc_storeStrong((id *)&self->_layerHistogram, 0);
}

- (BOOL)initWithMessageStream:(uint64_t)a3 error:(void *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = __cxa_begin_catch(a1);
  *a4 = v6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = (*(uint64_t (**)(void *))(*(void *)v6 + 16))(v6);
    int v9 = 136315138;
    uint64_t v10 = v8;
    _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to parse the Layer specification. Error: %s", (uint8_t *)&v9, 0xCu);
  }
  return a3 == 0;
}

@end