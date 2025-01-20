@interface HMIMutableFloatArray
- (HMIMutableFloatArray)init;
- (HMIMutableFloatArray)initWithData:(id)a3;
- (HMIMutableFloatArray)initWithDataTensor:(id)a3;
- (HMIMutableFloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4;
- (HMIMutableFloatArray)initWithValue:(float)a3 count:(unint64_t)a4;
- (NSData)data;
- (const)floats;
- (float)l2Norm;
- (float)mutableFloats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)floatArrayByAdding:(id)a3;
- (id)floatArrayByScaling:(float)a3;
- (id)floatArrayBySubtracting:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)add:(id)a3;
- (void)appendArray:(id)a3;
- (void)appendFloats:(const float *)a3 count:(unint64_t)a4;
- (void)fillWithFloat:(float)a3;
- (void)scale:(float)a3;
- (void)subtract:(id)a3;
@end

@implementation HMIMutableFloatArray

- (HMIMutableFloatArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIMutableFloatArray;
  v2 = [(HMIMutableFloatArray *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    data = v2->_data;
    v2->_data = v3;
  }
  return v2;
}

- (HMIMutableFloatArray)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMIMutableFloatArray;
  v5 = [(HMIMutableFloatArray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;
  }
  return v5;
}

- (HMIMutableFloatArray)initWithValue:(float)a3 count:(unint64_t)a4
{
  uint64_t v6 = [(HMIMutableFloatArray *)self init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:4 * a4];
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;

    *(float *)&double v9 = a3;
    [(HMIMutableFloatArray *)v6 fillWithFloat:v9];
  }
  return v6;
}

- (HMIMutableFloatArray)initWithFloats:(const float *)a3 count:(unint64_t)a4
{
  uint64_t v6 = [(HMIMutableFloatArray *)self init];
  [(HMIMutableFloatArray *)v6 appendFloats:a3 count:a4];
  return v6;
}

- (HMIMutableFloatArray)initWithDataTensor:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "shape", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v9 *= [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  v11 = -[HMIMutableFloatArray initWithFloats:count:](self, "initWithFloats:count:", [v4 dataPointer], v9);
  return v11;
}

- (void)fillWithFloat:(float)a3
{
  float __A = a3;
  v3 = self;
  vDSP_vfill(&__A, [(HMIMutableFloatArray *)v3 mutableFloats], 1, [(HMIMutableFloatArray *)v3 count]);
}

- (void)appendFloats:(const float *)a3 count:(unint64_t)a4
{
}

- (void)appendArray:(id)a3
{
  data = self->_data;
  id v4 = [a3 data];
  [(NSMutableData *)data appendData:v4];
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (unint64_t)count
{
  return [(NSMutableData *)self->_data length] >> 2;
}

- (const)floats
{
  return (const float *)[(NSMutableData *)self->_data bytes];
}

- (float)mutableFloats
{
  return (float *)[(NSMutableData *)self->_data mutableBytes];
}

- (void)scale:(float)a3
{
  float __B = a3;
  v3 = self;
  id v4 = [(HMIMutableFloatArray *)v3 floats];
  v5 = v3;
  vDSP_vsmul(v4, 1, &__B, [(HMIMutableFloatArray *)v5 mutableFloats], 1, [(HMIMutableFloatArray *)v5 count]);
}

- (void)subtract:(id)a3
{
  id v4 = (const float *)[a3 floats];
  v5 = self;
  uint64_t v6 = [(HMIMutableFloatArray *)v5 floats];
  uint64_t v7 = v5;
  uint64_t v8 = [(HMIMutableFloatArray *)v7 mutableFloats];
  vDSP_Length v9 = [(HMIMutableFloatArray *)v7 count];
  vDSP_vsub(v4, 1, v6, 1, v8, 1, v9);
}

- (void)add:(id)a3
{
  id v4 = (const float *)[a3 floats];
  v5 = self;
  uint64_t v6 = [(HMIMutableFloatArray *)v5 floats];
  uint64_t v7 = v5;
  uint64_t v8 = [(HMIMutableFloatArray *)v7 mutableFloats];
  vDSP_Length v9 = [(HMIMutableFloatArray *)v7 count];
  vDSP_vadd(v4, 1, v6, 1, v8, 1, v9);
}

- (float)l2Norm
{
  float __C = 0.0;
  v2 = self;
  vDSP_svesq([(HMIMutableFloatArray *)v2 floats], 1, &__C, [(HMIMutableFloatArray *)v2 count]);
  return sqrtf(__C);
}

- (id)floatArrayByScaling:(float)a3
{
  id v4 = (void *)[(HMIMutableFloatArray *)self copy];
  *(float *)&double v5 = a3;
  [v4 scale:v5];
  return v4;
}

- (id)floatArrayByAdding:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(HMIMutableFloatArray *)self copy];
  [v5 add:v4];

  return v5;
}

- (id)floatArrayBySubtracting:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(HMIMutableFloatArray *)self copy];
  [v5 subtract:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMIMutableFloatArray alloc];
  data = self->_data;
  return [(HMIMutableFloatArray *)v4 initWithData:data];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMIMutableFloatArray alloc];
  data = self->_data;
  return [(HMIMutableFloatArray *)v4 initWithData:data];
}

- (void).cxx_destruct
{
}

@end