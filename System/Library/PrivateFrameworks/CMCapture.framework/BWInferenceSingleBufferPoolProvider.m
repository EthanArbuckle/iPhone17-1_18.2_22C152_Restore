@interface BWInferenceSingleBufferPoolProvider
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
@end

@implementation BWInferenceSingleBufferPoolProvider

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  v6 = [BWPixelBufferPool alloc];
  v7 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v6, "initWithVideoFormat:capacity:name:memoryPool:", a4, 1, [NSString stringWithFormat:@"Prepared BWInferenceSingleBufferPool for %@", a3], +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
  return v7;
}

@end