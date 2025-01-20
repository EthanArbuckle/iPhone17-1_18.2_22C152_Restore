@interface FTEspressoBuffer
+ (id)bufferWithEspressoBuffer:(id *)a3;
- ($FD4688982923A924290ECB669CAF1EC2)buffer;
@end

@implementation FTEspressoBuffer

+ (id)bufferWithEspressoBuffer:(id *)a3
{
  v4 = objc_alloc_init(FTEspressoBuffer);
  long long v6 = *(_OWORD *)a3->var2;
  long long v5 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&v4->_buffer.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)v4->_buffer.dim = v6;
  *(_OWORD *)&v4->_buffer.dim[2] = v5;
  long long v7 = *(_OWORD *)&a3->var4;
  long long v8 = *(_OWORD *)&a3->var6;
  long long v9 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)v4->_buffer.stride = *(_OWORD *)a3->var3;
  *(_OWORD *)&v4->_buffer.channels = v8;
  *(_OWORD *)&v4->_buffer.width = v7;
  *(_OWORD *)&v4->_buffer.stride[2] = v9;
  long long v11 = *(_OWORD *)&a3->var10;
  long long v10 = *(_OWORD *)&a3->var12;
  uint64_t v12 = *(void *)&a3->var14;
  *(_OWORD *)&v4->_buffer.sequence_length = *(_OWORD *)&a3->var8;
  *(void *)&v4->_buffer.storage_type = v12;
  *(_OWORD *)&v4->_buffer.stride_batch_number = v10;
  *(_OWORD *)&v4->_buffer.stride_height = v11;

  return v4;
}

- ($FD4688982923A924290ECB669CAF1EC2)buffer
{
  long long v3 = *(_OWORD *)&self->var9;
  long long v4 = *(_OWORD *)&self->var13;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->var11;
  *(_OWORD *)&retstr->var12 = v4;
  *(void *)&retstr->var14 = self[1].var0;
  long long v5 = *(_OWORD *)&self->var3[1];
  long long v6 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self->var3[3];
  *(_OWORD *)&retstr->var4 = v6;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var8 = v3;
  long long v7 = *(_OWORD *)&self->var2[1];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)retstr->var2 = v7;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->var2[3];
  *(_OWORD *)retstr->var3 = v5;
  return self;
}

@end