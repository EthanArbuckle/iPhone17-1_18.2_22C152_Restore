@interface CSUEspressoBuffer
+ (id)fromEspressoBuffer:(id *)a3;
- (CSUEspressoBuffer)initWithEspressoBuffer:(id *)a3;
- (const)espressoBuffer;
- (void)accessDataUsingBlock:(id)a3;
@end

@implementation CSUEspressoBuffer

- (CSUEspressoBuffer)initWithEspressoBuffer:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSUEspressoBuffer;
  v4 = [(CSUEspressoBuffer *)&v16 init];
  v5 = (CSUEspressoBuffer *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    long long v7 = *(_OWORD *)a3->var2;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var2[2];
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    long long v8 = *(_OWORD *)a3->var3;
    long long v9 = *(_OWORD *)&a3->var3[2];
    long long v10 = *(_OWORD *)&a3->var4;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var6;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    long long v11 = *(_OWORD *)&a3->var8;
    long long v12 = *(_OWORD *)&a3->var10;
    long long v13 = *(_OWORD *)&a3->var12;
    *((void *)v4 + 21) = *(void *)&a3->var14;
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    v14 = v4;
  }

  return v5;
}

+ (id)fromEspressoBuffer:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  long long v5 = *(_OWORD *)&a3->var12;
  v15[8] = *(_OWORD *)&a3->var10;
  v15[9] = v5;
  uint64_t v16 = *(void *)&a3->var14;
  long long v6 = *(_OWORD *)&a3->var4;
  v15[4] = *(_OWORD *)&a3->var3[2];
  v15[5] = v6;
  long long v7 = *(_OWORD *)&a3->var8;
  v15[6] = *(_OWORD *)&a3->var6;
  v15[7] = v7;
  long long v8 = *(_OWORD *)a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v8;
  long long v9 = *(_OWORD *)a3->var3;
  v15[2] = *(_OWORD *)&a3->var2[2];
  v15[3] = v9;
  long long v13 = objc_msgSend_initWithEspressoBuffer_(v4, v10, (uint64_t)v15, v11, v12);
  return v13;
}

- (const)espressoBuffer
{
  return (const $FD4688982923A924290ECB669CAF1EC2 *)&self->_buffer;
}

- (void)accessDataUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t))a3;
  espresso_buffer_get_rank();
  v4[2](v4, self->_buffer.data, 4 * self->_buffer.stride_sequence_length * self->_buffer.sequence_length);
}

@end