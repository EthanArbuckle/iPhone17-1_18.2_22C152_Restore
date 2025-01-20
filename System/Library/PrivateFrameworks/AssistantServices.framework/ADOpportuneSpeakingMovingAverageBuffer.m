@interface ADOpportuneSpeakingMovingAverageBuffer
- (ADOpportuneSpeakingMovingAverageBuffer)initWithSize:(int)a3;
- (float)movingAverage;
- (void)add:(unsigned __int8)a3;
@end

@implementation ADOpportuneSpeakingMovingAverageBuffer

- (float)movingAverage
{
  return self->_movingAverage;
}

- (void)add:(unsigned __int8)a3
{
  if (self->_ringFull)
  {
    ring = self->_ring;
    int size = self->_size;
    int v5 = self->_cursor % size;
    LOBYTE(v3) = ring[v5];
    self->_movingAverage = self->_movingAverage - (float)((float)v3 / (float)size);
    ring[v5] = a3;
    int v7 = self->_size;
    LODWORD(ring) = self->_cursor;
    self->_movingAverage = self->_movingAverage + (float)((float)a3 / (float)v7);
  }
  else
  {
    self->_ring[self->_cursor % self->_size] = a3;
    ring = (char *)self->_cursor;
    if ((ring & 0x80000000) != 0)
    {
      float v12 = 0.0;
    }
    else
    {
      int v8 = 0;
      v9 = self->_ring;
      v10 = ring + 1;
      do
      {
        int v11 = *v9++;
        v8 += v11;
        --v10;
      }
      while (v10);
      float v12 = (float)v8;
    }
    self->_movingAverage = v12 / (float)((float)(int)ring + 1.0);
    int v7 = self->_size;
  }
  self->_cursor = ring + 1;
  if (((int)ring + 1) % v7 <= (int)ring) {
    self->_ringFull = 1;
  }
}

- (ADOpportuneSpeakingMovingAverageBuffer)initWithSize:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ADOpportuneSpeakingMovingAverageBuffer;
  v4 = [(ADOpportuneSpeakingMovingAverageBuffer *)&v8 init];
  int v5 = v4;
  if (v4)
  {
    v4->_int size = a3;
    v4->_cursor = 0;
    v4->_ring = (char *)malloc_type_calloc(a3, 1uLL, 0x72E14E65uLL);
    v5->_ringFull = 0;
    v5->_movingAverage = 0.0;
    v6 = v5;
  }

  return v5;
}

@end