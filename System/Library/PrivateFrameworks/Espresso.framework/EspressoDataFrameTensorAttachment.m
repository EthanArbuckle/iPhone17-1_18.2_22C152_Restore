@interface EspressoDataFrameTensorAttachment
+ ($FD4688982923A924290ECB669CAF1EC2)copyFromCVPixelBuffer:(SEL)a3;
- ($FD4688982923A924290ECB669CAF1EC2)copyAsEspressoBuffer;
- (void)loadFromDict:(id)a3 frameStorage:(id)a4;
@end

@implementation EspressoDataFrameTensorAttachment

- ($FD4688982923A924290ECB669CAF1EC2)copyAsEspressoBuffer
{
  p_buffer = &self->buffer;
  long long v5 = *(_OWORD *)&self->buffer.stride_batch_number;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->buffer.stride_height;
  *(_OWORD *)&retstr->var12 = v5;
  *(void *)&retstr->var14 = *(void *)&self->buffer.storage_type;
  long long v6 = *(_OWORD *)&self->buffer.width;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self->buffer.stride[2];
  *(_OWORD *)&retstr->var4 = v6;
  long long v7 = *(_OWORD *)&self->buffer.sequence_length;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->buffer.channels;
  *(_OWORD *)&retstr->var8 = v7;
  long long v8 = *(_OWORD *)self->buffer.dim;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->buffer.data;
  *(_OWORD *)retstr->var2 = v8;
  long long v9 = *(_OWORD *)self->buffer.stride;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->buffer.dim[2];
  *(_OWORD *)retstr->var3 = v9;
  size_t size = 0;
  if (espresso_buffer_get_size((uint64_t)&self->buffer, (char *)&size)) {
    Espresso::throw_exception_selector<Espresso::generic_error>("Failed to obtain blob size, Blob copy terminated");
  }
  size_t v10 = size;
  v11 = malloc_type_malloc(size, 0x68B7180AuLL);
  retstr->var0 = v11;
  data = p_buffer->data;

  return ($FD4688982923A924290ECB669CAF1EC2 *)memcpy(v11, data, v10);
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)EspressoDataFrameTensorAttachment;
  [(EspressoDataFrameAttachment *)&v30 loadFromDict:v6 frameStorage:v7];
  long long v8 = [v6 objectForKeyedSubscript:@"shape"];
  p_buffer = &self->buffer;
  *(_OWORD *)&self->buffer.data = 0u;
  *(_OWORD *)self->buffer.dim = 0u;
  *(_OWORD *)&self->buffer.dim[2] = 0u;
  *(_OWORD *)self->buffer.stride = 0u;
  *(_OWORD *)&self->buffer.stride[2] = 0u;
  *(_OWORD *)&self->buffer.unint64_t width = 0u;
  *(_OWORD *)&self->buffer.unint64_t channels = 0u;
  *(_OWORD *)&self->buffer.sequence_length = 0u;
  *(_OWORD *)&self->buffer.stride_unint64_t height = 0u;
  *(_OWORD *)&self->buffer.stride_unint64_t batch_number = 0u;
  *(void *)&self->buffer.storage_type = 0;
  self->buffer.data = [(EspressoDataFrameAttachment *)self rawPointer];
  if ((unint64_t)[v8 count] > 3)
  {
    if ([v8 count] == 5)
    {
      v14 = [v8 objectAtIndexedSubscript:4];
      p_buffer->unint64_t width = [v14 unsignedLongLongValue];

      v15 = [v8 objectAtIndexedSubscript:3];
      p_buffer->unint64_t height = [v15 unsignedLongLongValue];

      v16 = [v8 objectAtIndexedSubscript:2];
      p_buffer->unint64_t channels = [v16 unsignedLongLongValue];

      v17 = [v8 objectAtIndexedSubscript:1];
      p_buffer->unint64_t batch_number = [v17 unsignedLongLongValue];

      v18 = [v8 objectAtIndexedSubscript:0];
      p_buffer->sequence_length = [v18 unsignedLongLongValue];
    }
    else
    {
      if ([v8 count] != 4) {
        Espresso::throw_exception_selector<Espresso::io_error>("shape must have 1,2,3,4, or 5 entries.");
      }
      v19 = [v8 objectAtIndexedSubscript:3];
      p_buffer->unint64_t width = [v19 unsignedLongLongValue];

      v20 = [v8 objectAtIndexedSubscript:2];
      p_buffer->unint64_t height = [v20 unsignedLongLongValue];

      v21 = [v8 objectAtIndexedSubscript:1];
      p_buffer->unint64_t channels = [v21 unsignedLongLongValue];

      v22 = [v8 objectAtIndexedSubscript:0];
      p_buffer->unint64_t batch_number = [v22 unsignedLongLongValue];

      p_buffer->sequence_length = 1;
    }
  }
  else
  {
    std::vector<int>::size_type v10 = [v8 count];
    v11 = (char *)&v29 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v10)
    {
      uint64_t v12 = 0;
      do
      {
        v13 = [v8 objectAtIndexedSubscript:v12];
        *(void *)&v11[8 * v12] = [v13 unsignedLongLongValue];

        ++v12;
      }
      while (v10 != v12);
    }
    espresso_buffer_pack_tensor_shape((uint64_t)p_buffer, v10, (uint64_t)v11);
  }
  unint64_t width = p_buffer->width;
  unint64_t height = p_buffer->height;
  p_buffer->stride_unint64_t width = 1;
  p_buffer->stride_unint64_t height = width;
  unint64_t channels = p_buffer->channels;
  unint64_t batch_number = p_buffer->batch_number;
  unint64_t v27 = channels * height * width;
  p_buffer->stride_unint64_t channels = height * width;
  p_buffer->stride_unint64_t batch_number = v27;
  unint64_t v28 = batch_number * v27;
  p_buffer->stride_sequence_length = v28;
  p_buffer->dim[0] = width;
  p_buffer->dim[1] = height;
  p_buffer->dim[2] = channels;
  p_buffer->dim[3] = batch_number;
  p_buffer->stride[0] = 4;
  p_buffer->stride[1] = 4 * width;
  p_buffer->stride[2] = 4 * height * width;
  p_buffer->stride[3] = 4 * v28;
  p_buffer->storage_type = 65568;
}

+ ($FD4688982923A924290ECB669CAF1EC2)copyFromCVPixelBuffer:(SEL)a3
{
  vImagePixelCount Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  v14 = (char *)malloc_type_malloc(4 * Width * Height, 0x51F7E33BuLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  unint64_t v15 = Height;
  if (Height)
  {
    size_t v10 = BytesPerRow;
    v11 = v14;
    do
    {
      src.data = BaseAddress;
      src.unint64_t height = 1;
      src.unint64_t width = Width;
      src.rowBytes = 2 * Width;
      dest.data = v11;
      dest.unint64_t height = 1;
      dest.unint64_t width = Width;
      dest.rowBytes = 4 * Width;
      vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
      v11 += 4 * Width;
      BaseAddress += v10;
      --Height;
    }
    while (Height);
  }
  result = ($FD4688982923A924290ECB669CAF1EC2 *)CVPixelBufferUnlockBaseAddress(a4, 0);
  retstr->var0 = v14;
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2[1] = 0u;
  *(_OWORD *)&retstr->var2[3] = 0u;
  *(_OWORD *)&retstr->var3[1] = 0u;
  retstr->var3[3] = 0;
  retstr->var4 = Width;
  retstr->var5 = v15;
  int64x2_t v13 = vdupq_n_s64(1uLL);
  *(int64x2_t *)&retstr->var6 = v13;
  *(int64x2_t *)&retstr->var8 = v13;
  retstr->var10 = Width;
  retstr->var11 = v15 * Width;
  retstr->var12 = v15 * Width;
  retstr->var13 = v15 * Width;
  retstr->var14 = 65568;
  return result;
}

@end