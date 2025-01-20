@interface MPSGraphVariable
+ (id)newVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5;
- (NSArray)shape;
- (Value)value;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5;
- (id)initVariableWithData:(id)a3 value:(Value)a4;
- (id)initVariableWithMPSNDArray:(id)a3 value:(Value)a4;
- (id)mpsNDArrayWithDevice:(id)a3;
- (unsigned)dataType;
@end

@implementation MPSGraphVariable

- (id)initVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphVariable;
  v10 = [(MPSGraphVariable *)&v16 init];
  objc_storeStrong((id *)&v10->_shape, a5);
  v10->_value.impl = 0;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:MEMORY[0x1E4F1CBF0]];
  mpsndarrays = v10->_mpsndarrays;
  v10->_mpsndarrays = (NSMutableArray *)v11;

  v10->_dataType = a4;
  uint64_t v13 = [v8 copyWithZone:0];
  data = v10->_data;
  v10->_data = (NSData *)v13;

  return v10;
}

+ (id)newVariableWithData:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [[MPSGraphVariable alloc] initVariableWithData:v7 dataType:v6 shape:v8];

  return v9;
}

- (id)initVariableWithData:(id)a3 value:(Value)a4
{
  id v6 = a3;
  uint64_t MPSDataType = getMPSDataType((void *)(*((void *)a4.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  id v8 = getMPSShapeFromMLIR((uint64_t **)(*((void *)a4.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  id v9 = [(MPSGraphVariable *)self initVariableWithData:v6 dataType:MPSDataType shape:v8];

  v9[3].impl = a4.impl;
  return v9;
}

- (id)initVariableWithMPSNDArray:(id)a3 value:(Value)a4
{
  self->_value = a4;
  return self;
}

- (id)mpsNDArrayWithDevice:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_mpsndarrays;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "device", (void)v18);
        uint64_t v11 = [v10 registryID];
        LOBYTE(v11) = v11 == [v4 registryID];

        if (v11)
        {
          id v16 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(NSMutableArray *)self->_mpsndarrays count];
  if ([(NSMutableArray *)self->_mpsndarrays count] && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v12 = (void *)MEMORY[0x1E4F35720];
  uint64_t MPSDataType = getMPSDataType((void *)(*((void *)self->_value.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  v14 = getMPSShapeFromMLIR((uint64_t **)(*((void *)self->_value.impl + 1) & 0xFFFFFFFFFFFFFFF8));
  v15 = adaptForMPS(v14);
  v5 = [v12 descriptorWithDataType:MPSDataType shape:v15];

  id v16 = (id)[objc_alloc(MEMORY[0x1E4F35690]) initWithDevice:v4 descriptor:v5];
  objc_msgSend(v16, "writeBytes:strideBytes:", -[NSData bytes](self->_data, "bytes"), 0);
  [(NSMutableArray *)self->_mpsndarrays addObject:v16];
LABEL_12:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  id v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (Value)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_mpsndarrays, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end