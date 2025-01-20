@interface ABPKAlgOutput
- (ABPK2dSkeleton)detection2dSkeletonABPK;
- (ABPK2dSkeleton)rawDetection2dSkeletonABPK;
- (ABPK2dSkeleton)registered2dSkeletonABPK;
- (ABPKAlgOutput)initWithConfig:(id)a3;
- (ABPKAlgorithmState)algState;
- (ABPKSkeleton)liftingSkeletonABPK;
- (ABPKSkeleton)retargetedSkeletonABPK;
- (NSMutableArray)rawDetection2dSkeletonABPKArray;
- (void)setAlgState:(id)a3;
- (void)setDetection2dSkeletonABPK:(id)a3;
- (void)setLiftingSkeletonABPK:(id)a3;
- (void)setRawDetection2dSkeletonABPK:(id)a3;
- (void)setRawDetection2dSkeletonABPKArray:(id)a3;
- (void)setRegistered2dSkeletonABPK:(id)a3;
- (void)setRetargetedSkeletonABPK:(id)a3;
@end

@implementation ABPKAlgOutput

- (ABPKAlgOutput)initWithConfig:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ABPKAlgOutput;
  v5 = [(ABPKAlgOutput *)&v15 init];
  if (v5)
  {
    if ([v4 algMode] == 4)
    {
      v6 = [[ABPK2dSkeleton alloc] initWithType:1];
      [(ABPKAlgOutput *)v5 setRawDetection2dSkeletonABPK:v6];

      v7 = [[ABPK2dSkeleton alloc] initWithType:1];
    }
    else
    {
      v8 = [[ABPK2dSkeleton alloc] initWithType:0];
      [(ABPKAlgOutput *)v5 setRawDetection2dSkeletonABPK:v8];

      v7 = [[ABPK2dSkeleton alloc] initWithType:0];
    }
    [(ABPKAlgOutput *)v5 setDetection2dSkeletonABPK:v7];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ABPKAlgOutput *)v5 setRawDetection2dSkeletonABPKArray:v9];

    v10 = [[ABPKSkeleton alloc] initWithType:3];
    [(ABPKAlgOutput *)v5 setLiftingSkeletonABPK:v10];

    v11 = [[ABPK2dSkeleton alloc] initWithType:2];
    [(ABPKAlgOutput *)v5 setRegistered2dSkeletonABPK:v11];

    v12 = [[ABPKSkeleton alloc] initWithType:4];
    [(ABPKAlgOutput *)v5 setRetargetedSkeletonABPK:v12];

    v13 = objc_alloc_init(ABPKAlgorithmState);
    [(ABPKAlgOutput *)v5 setAlgState:v13];
  }
  return v5;
}

- (ABPK2dSkeleton)rawDetection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawDetection2dSkeletonABPK:(id)a3
{
}

- (ABPK2dSkeleton)detection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetection2dSkeletonABPK:(id)a3
{
}

- (NSMutableArray)rawDetection2dSkeletonABPKArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRawDetection2dSkeletonABPKArray:(id)a3
{
}

- (ABPKSkeleton)liftingSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLiftingSkeletonABPK:(id)a3
{
}

- (ABPK2dSkeleton)registered2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegistered2dSkeletonABPK:(id)a3
{
}

- (ABPKSkeleton)retargetedSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRetargetedSkeletonABPK:(id)a3
{
}

- (ABPKAlgorithmState)algState
{
  return (ABPKAlgorithmState *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAlgState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algState, 0);
  objc_storeStrong((id *)&self->_retargetedSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_registered2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_liftingSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPKArray, 0);
  objc_storeStrong((id *)&self->_detection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPK, 0);
}

@end