@interface ARBodyAnchor
+ (BOOL)supportsSecureCoding;
- (ARBody2D)referenceBody;
- (ARBodyAnchor)initWithAnchor:(id)a3;
- (ARBodyAnchor)initWithCoder:(id)a3;
- (ARBodyAnchor)initWithIdentifier:(double)a3 transform:(double)a4 tracked:(double)a5 skeletonData:(uint64_t)a6;
- (ARSkeleton3D)skeleton;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToARBodyAnchor:(id)a3;
- (BOOL)isTracked;
- (CGFloat)estimatedScaleFactor;
- (id)copyWithTrackedState:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARBodyAnchor

- (ARBodyAnchor)initWithIdentifier:(double)a3 transform:(double)a4 tracked:(double)a5 skeletonData:(uint64_t)a6
{
  id v13 = a9;
  v30.receiver = a1;
  v30.super_class = (Class)ARBodyAnchor;
  v14 = -[ARAnchor initWithIdentifier:transform:](&v30, sel_initWithIdentifier_transform_, a7, a2, a3, a4, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_skeletonData, a9);
    v16 = [[ARSkeleton3D alloc] initWithCoreRESkeletonResult:v15->_skeletonData];
    skeleton = v15->_skeleton;
    v15->_skeleton = v16;

    v15->_tracked = a8;
    [v13 estimatedScaleFactor];
    v15->_estimatedScaleFactor = v18;
    v19 = [ARSkeleton2D alloc];
    v20 = [v13 liftedSkeletonData];
    v21 = [v20 skeletonDetectionResult2D];
    v22 = [(ARSkeleton2D *)v19 initWithDetectedSkeleton:v21];

    v23 = [[ARBody2D alloc] initWithSkeleton2D:v22];
    referenceBody = v15->_referenceBody;
    v15->_referenceBody = v23;
  }
  return v15;
}

- (BOOL)isTracked
{
  return self->_tracked;
}

- (CGFloat)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (ARBody2D)referenceBody
{
  return self->_referenceBody;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [ARBodyAnchor alloc];
  v6 = [(ARAnchor *)self identifier];
  [(ARAnchor *)self transform];
  v7 = -[ARBodyAnchor initWithIdentifier:transform:tracked:skeletonData:](v5, "initWithIdentifier:transform:tracked:skeletonData:", v6, v3, self->_skeletonData);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARBodyAnchor;
  id v4 = a3;
  [(ARAnchor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_tracked, @"tracked", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_skeletonData forKey:@"skeletonData"];
}

- (ARBodyAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARBodyAnchor;
  objc_super v5 = [(ARAnchor *)&v17 initWithCoder:v4];
  if (v5)
  {
    v5->_tracked = [v4 decodeBoolForKey:@"tracked"];
    uint64_t v6 = [v4 decodeObjectForKey:@"skeletonData"];
    skeletonData = v5->_skeletonData;
    v5->_skeletonData = (ARCoreRESkeletonResult *)v6;

    v8 = [[ARSkeleton3D alloc] initWithCoreRESkeletonResult:v5->_skeletonData];
    skeleton = v5->_skeleton;
    v5->_skeleton = v8;

    v10 = [ARSkeleton2D alloc];
    v11 = [(ARCoreRESkeletonResult *)v5->_skeletonData liftedSkeletonData];
    v12 = [v11 skeletonDetectionResult2D];
    id v13 = [(ARSkeleton2D *)v10 initWithDetectedSkeleton:v12];

    v14 = [[ARBody2D alloc] initWithSkeleton2D:v13];
    referenceBody = v5->_referenceBody;
    v5->_referenceBody = v14;
  }
  return v5;
}

- (BOOL)isEqualToARBodyAnchor:(id)a3
{
  id v4 = (id *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  objc_super v5 = [v4 identifier];
  uint64_t v6 = [(ARAnchor *)self identifier];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_4;
  }
  int v8 = [v4 isTracked];
  if (v8 == [(ARBodyAnchor *)self isTracked]) {
    char v9 = [v4[24] isEqual:self->_skeletonData];
  }
  else {
LABEL_4:
  }
    char v9 = 0;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(ARBodyAnchor *)self isEqualToARBodyAnchor:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (ARBodyAnchor)initWithAnchor:(id)a3
{
  id v4 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)ARBodyAnchor;
  BOOL v5 = [(ARAnchor *)&v11 initWithAnchor:v4];
  if (v5)
  {
    uint64_t v6 = [v4[24] copy];
    skeletonData = v5->_skeletonData;
    v5->_skeletonData = (ARCoreRESkeletonResult *)v6;

    int v8 = [[ARSkeleton3D alloc] initWithCoreRESkeletonResult:v5->_skeletonData];
    skeleton = v5->_skeleton;
    v5->_skeleton = v8;

    v5->_tracked = [v4 isTracked];
  }

  return v5;
}

- (ARSkeleton3D)skeleton
{
  return self->_skeleton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_referenceBody, 0);
  objc_storeStrong((id *)&self->_skeletonData, 0);
}

@end