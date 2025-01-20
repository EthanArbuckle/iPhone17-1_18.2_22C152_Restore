@interface AR3DSkeletonDetectionResults
- (NSArray)detectedSkeletons;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetectedSkeletons:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation AR3DSkeletonDetectionResults

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  uint64_t v6 = [(NSArray *)self->_detectedSkeletons copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (NSArray)detectedSkeletons
{
  return self->_detectedSkeletons;
}

- (void)setDetectedSkeletons:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end