@interface ADEspressoBufferHandle
- (ADEspressoBufferHandle)initWithName:(id)a3 buffer:(id *)a4;
- (ADEspressoBufferHandle)initWithName:(id)a3 rawData:(void *)a4 dimensions:(id)a5 strides:(id)a6;
- (BOOL)copyTo:(id)a3;
- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4;
- (NSArray)dimensions;
- (unint64_t)batchBytes;
- (unint64_t)batches;
- (unint64_t)channelBytes;
- (unint64_t)channels;
- (unint64_t)dimensionsProduct;
- (unint64_t)height;
- (unint64_t)rowBytes;
- (unint64_t)sequenceBytes;
- (unint64_t)sequences;
- (unint64_t)size;
- (unint64_t)width;
- (void)clearBuffer;
- (void)data;
@end

@implementation ADEspressoBufferHandle

- (unint64_t)dimensionsProduct
{
  if (![(NSArray *)self->_dimensions count]) {
    return 1;
  }
  uint64_t v3 = 0;
  unsigned int v4 = 1;
  LODWORD(v5) = 1;
  do
  {
    v6 = [(NSArray *)self->_dimensions objectAtIndexedSubscript:v3];
    unint64_t v5 = [v6 intValue] * v5;

    uint64_t v3 = v4;
  }
  while ([(NSArray *)self->_dimensions count] > v4++);
  return v5;
}

- (ADEspressoBufferHandle)initWithName:(id)a3 rawData:(void *)a4 dimensions:(id)a5 strides:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  v15 = 0;
  if (v11 && a4 && v12 && v13)
  {
    if ([v12 count] && (uint64_t v16 = objc_msgSend(v12, "count"), v16 == objc_msgSend(v14, "count")))
    {
      v39.receiver = self;
      v39.super_class = (Class)ADEspressoBufferHandle;
      v17 = [(ADEspressoBufferHandle *)&v39 init];
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_name, a3);
        v18->_rawData = a4;
        objc_storeStrong((id *)&v18->_dimensions, a5);
        v19 = [v12 objectEnumerator];
        v20 = [v19 nextObject];
        v21 = v20;
        if (v20) {
          unsigned int v22 = [v20 unsignedIntValue];
        }
        else {
          unsigned int v22 = 1;
        }
        v18->_width = v22;
        v23 = [v19 nextObject];

        if (v23) {
          unsigned int v24 = [v23 unsignedIntValue];
        }
        else {
          unsigned int v24 = 1;
        }
        v18->_height = v24;
        v25 = [v19 nextObject];

        if (v25) {
          unsigned int v26 = [v25 unsignedIntValue];
        }
        else {
          unsigned int v26 = 1;
        }
        v18->_channels = v26;
        v27 = [v19 nextObject];

        if (v27) {
          unsigned int v28 = [v27 unsignedIntValue];
        }
        else {
          unsigned int v28 = 1;
        }
        v18->_batches = v28;
        v29 = [v19 nextObject];

        if (v29) {
          unsigned int v30 = [v29 unsignedIntValue];
        }
        else {
          unsigned int v30 = 1;
        }
        v18->_sequences = v30;
        v31 = [v14 lastObject];
        int v32 = [v31 unsignedIntValue];
        v33 = [v12 lastObject];
        v18->_size = [v33 unsignedIntValue] * v32;

        if ((unint64_t)[v14 count] < 2)
        {
          v18->_rowBytes = v18->_size;
        }
        else
        {
          v34 = [v14 objectAtIndexedSubscript:1];
          v18->_rowBytes = [v34 unsignedLongValue];
        }
        if ((unint64_t)[v14 count] < 3)
        {
          v18->_channelBytes = v18->_size;
        }
        else
        {
          v35 = [v14 objectAtIndexedSubscript:2];
          v18->_channelBytes = [v35 unsignedLongValue];
        }
        if ((unint64_t)[v14 count] < 4)
        {
          v18->_batchBytes = v18->_size;
        }
        else
        {
          v36 = [v14 objectAtIndexedSubscript:3];
          v18->_batchBytes = [v36 unsignedLongValue];
        }
        if ((unint64_t)[v14 count] < 5)
        {
          v18->_sequenceBytes = v18->_size;
        }
        else
        {
          v37 = [v14 objectAtIndexedSubscript:4];
          v18->_sequenceBytes = [v37 unsignedLongValue];
        }
      }
      self = v18;
      v15 = self;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)sequenceBytes
{
  return self->_sequenceBytes;
}

- (unint64_t)batchBytes
{
  return self->_batchBytes;
}

- (unint64_t)sequences
{
  return self->_sequences;
}

- (unint64_t)channelBytes
{
  return self->_channelBytes;
}

- (unint64_t)rowBytes
{
  return self->_rowBytes;
}

- (BOOL)copyTo:(id)a3
{
  size_t size = self->_size;
  uint64_t v4 = *((void *)a3 + 13);
  if (size == v4) {
    memcpy(*((void **)a3 + 2), self->_rawData, size);
  }
  return size == v4;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = xmmword_265232A50;
  long long v17 = *(_OWORD *)off_265232A60;
  v18 = @"rgba";
  unint64_t channels = self->_channels;
  if (channels > 4) {
    v7 = @"raw";
  }
  else {
    v7 = (__CFString *)*((void *)&v16 + channels);
  }
  v8 = v7;
  v9 = [(NSString *)self->_name stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  if (v5)
  {
    v10 = [NSString stringWithFormat:@"%@.%@", v5, v8];
  }
  else
  {
    v10 = [NSString stringWithFormat:@"%@_%zux%zu.%@", v9, self->_width, self->_height, v8, v16, v17, v18, v19];
  }
  id v11 = v10;
  printf("Saving Espresso Buffer:\x1B[1m %s \x1B[22m\n", (const char *)[v11 UTF8String]);
  id v12 = v11;
  id v13 = fopen((const char *)[v12 UTF8String], "wb");
  if (v13) {
    fwrite(self->_rawData, 1uLL, self->_size, v13);
  }
  fclose(v13);

  for (uint64_t i = 32; i != -8; i -= 8)
  return 1;
}

- (void)clearBuffer
{
  rawData = self->_rawData;
  if (rawData) {
    bzero(rawData, self->_size);
  }
}

- (unint64_t)batches
{
  return self->_batches;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (void)data
{
  return self->_rawData;
}

- (ADEspressoBufferHandle)initWithName:(id)a3 buffer:(id *)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)ADEspressoBufferHandle;
    v8 = [(ADEspressoBufferHandle *)&v18 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_name, a3);
      v9->_rawData = a4->var0;
      v10 = [NSNumber numberWithUnsignedLong:a4->var2[0]];
      v19[0] = v10;
      id v11 = [NSNumber numberWithUnsignedLong:a4->var2[1]];
      v19[1] = v11;
      id v12 = [NSNumber numberWithUnsignedLong:a4->var2[2]];
      v19[2] = v12;
      id v13 = [NSNumber numberWithUnsignedLong:a4->var2[3]];
      v19[3] = v13;
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
      dimensions = v9->_dimensions;
      v9->_dimensions = (NSArray *)v14;

      v9->_width = a4->var4;
      v9->_height = a4->var5;
      v9->_unint64_t channels = a4->var6;
      v9->_batches = a4->var7;
      v9->_sequences = a4->var8;
      v9->_size_t size = a4->var8 * a4->var3[3];
      v9->_rowBytes = a4->var3[0];
      v9->_channelBytes = a4->var3[1];
      v9->_batchBytes = a4->var3[2];
      v9->_sequenceBytes = a4->var3[3];
    }
    self = v9;
    long long v16 = self;
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

@end