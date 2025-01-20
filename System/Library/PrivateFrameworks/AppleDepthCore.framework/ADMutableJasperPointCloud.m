@interface ADMutableJasperPointCloud
- (ADMutableJasperPointCloud)initWithCapacity:(int)a3;
- (ADMutableJasperPointCloud)initWithCapacity:(int)a3 storage:(__CVBuffer *)a4;
- (CGPoint)mutableCameraPixels;
- (CGPoint)mutableUndistortedCameraPixels;
- (char)mutableBankIds;
- (char)mutableEchoIds;
- (char)mutableSpotIds;
- (float)mutableConfidences;
- (float)mutableEuclideanDistances;
- (float)mutableIntensities;
- (float)mutableSignalToNoiseRatios;
- (int)capacity;
- (uint64_t)mutablePoints;
- (unsigned)mutableFlags;
- (void)appendPointsFrom:(id)a3;
- (void)appendPointsFrom:(id)a3 range:(_NSRange)a4;
- (void)applyPerformanceOverrides;
- (void)blacken;
- (void)replacePointsInRange:(_NSRange)a3 withPointsFrom:(id)a4 range:(_NSRange)a5;
- (void)resize:(int)a3;
@end

@implementation ADMutableJasperPointCloud

- (float)mutableEuclideanDistances
{
  return (float *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 6));
}

- (void)applyPerformanceOverrides
{
}

- (CGPoint)mutableUndistortedCameraPixels
{
  return (CGPoint *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 5));
}

- (char)mutableSpotIds
{
  return (char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 10);
}

- (float)mutableSignalToNoiseRatios
{
  return (float *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 8));
}

- (uint64_t)mutablePoints
{
  return *(void *)(a1 + 16) + *(void *)(*(void *)(a1 + 16) + 16);
}

- (float)mutableIntensities
{
  return (float *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 7));
}

- (unsigned)mutableFlags
{
  return (unsigned int *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 12));
}

- (char)mutableEchoIds
{
  return (char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 11);
}

- (float)mutableConfidences
{
  return (float *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 3));
}

- (CGPoint)mutableCameraPixels
{
  return (CGPoint *)((char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 4));
}

- (char)mutableBankIds
{
  return (char *)self->super._pc.m_header + *((void *)self->super._pc.m_header + 9);
}

- (void)replacePointsInRange:(_NSRange)a3 withPointsFrom:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  NSUInteger v8 = a3.location;
  v10 = (char *)a4;
  if (v7 != length) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Cannot replace a given number of points with a different number of points"];
  }
  if ((appledepth::JasperPointCloud::replacePoints((appledepth::JasperPointCloud *)&self->super._pc, v8, v7, (const appledepth::JasperPointCloud *)(v10 + 8), location) & 1) == 0)[MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Range is outside of point cloud bounds"]; {
}
  }

- (void)appendPointsFrom:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9 = (char *)a3;
  m_header = self->super._pc.m_header;
  if (m_header) {
    uint64_t v8 = *((void *)m_header + 1);
  }
  else {
    uint64_t v8 = 0;
  }
  [(ADMutableJasperPointCloud *)self resize:(v8 + length)];
  appledepth::JasperPointCloud::replacePoints((appledepth::JasperPointCloud *)&self->super._pc, v8, length, (const appledepth::JasperPointCloud *)(v9 + 8), location);
}

- (void)appendPointsFrom:(id)a3
{
  v4 = a3;
  uint64_t v5 = v4[2];
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v4;
  -[ADMutableJasperPointCloud appendPointsFrom:range:](self, "appendPointsFrom:range:", v4, 0, v6);
}

- (void)blacken
{
}

- (void)resize:(int)a3
{
  if (self->super._pc.m_capacity >= a3) {
    *((void *)self->super._pc.m_header + 1) = a3;
  }
  else {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Cannot resize a point cloud if capacity doesn't permit so"];
  }
}

- (int)capacity
{
  return self->super._pc.m_capacity;
}

- (ADMutableJasperPointCloud)initWithCapacity:(int)a3 storage:(__CVBuffer *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ADMutableJasperPointCloud;
  result = [(ADJasperPointCloud *)&v5 initWithLength:*(void *)&a3 storage:a4];
  if (result) {
    *((void *)result->super._pc.m_header + 1) = 0;
  }
  return result;
}

- (ADMutableJasperPointCloud)initWithCapacity:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ADMutableJasperPointCloud;
  result = [(ADJasperPointCloud *)&v4 initWithLength:*(void *)&a3];
  if (result) {
    *((void *)result->super._pc.m_header + 1) = 0;
  }
  return result;
}

@end