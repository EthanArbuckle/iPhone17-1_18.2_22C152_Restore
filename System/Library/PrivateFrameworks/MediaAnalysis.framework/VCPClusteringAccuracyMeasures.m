@interface VCPClusteringAccuracyMeasures
- (NSMutableArray)precisionPerCluster;
- (NSMutableArray)recallPerPersonExcludeMissDetection;
- (NSMutableArray)recallPerPersonToGroundTruth;
- (VCPClusteringAccuracyMeasures)init;
- (float)numSingletons;
- (float)numValidSingletons;
- (float)weightedAveragePrecision;
- (float)weightedAverageRecall;
- (void)addClusterPrecision:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 validFaceCount:(unint64_t)a6 identitySize:(unint64_t)a7;
- (void)addIdentityRecallExcludeMissDetection:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6;
- (void)addIdentityRecallToGroundTruth:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6;
- (void)setNumSingletons:(float)a3;
- (void)setNumValidSingletons:(float)a3;
- (void)setPrecisionPerCluster:(id)a3;
- (void)setRecallPerPersonExcludeMissDetection:(id)a3;
- (void)setRecallPerPersonToGroundTruth:(id)a3;
- (void)setWeightedAveragePrecision:(float)a3;
- (void)setWeightedAverageRecall:(float)a3;
@end

@implementation VCPClusteringAccuracyMeasures

- (VCPClusteringAccuracyMeasures)init
{
  v10.receiver = self;
  v10.super_class = (Class)VCPClusteringAccuracyMeasures;
  v2 = [(VCPClusteringAccuracyMeasures *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    precisionPerCluster = v2->_precisionPerCluster;
    v2->_precisionPerCluster = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recallPerPersonToGroundTruth = v2->_recallPerPersonToGroundTruth;
    v2->_recallPerPersonToGroundTruth = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recallPerPersonExcludeMissDetection = v2->_recallPerPersonExcludeMissDetection;
    v2->_recallPerPersonExcludeMissDetection = v7;
  }
  return v2;
}

- (void)addClusterPrecision:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 validFaceCount:(unint64_t)a6 identitySize:(unint64_t)a7
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  precisionPerCluster = self->_precisionPerCluster;
  v20[0] = @"precision";
  *(float *)&double v14 = a3;
  v15 = [NSNumber numberWithFloat:v14];
  v21[0] = v15;
  v21[1] = v12;
  v20[1] = @"personID";
  v20[2] = @"personFaceCount";
  v16 = [NSNumber numberWithUnsignedInteger:a5];
  v21[2] = v16;
  v20[3] = @"validFaceCount";
  v17 = [NSNumber numberWithUnsignedInteger:a6];
  v21[3] = v17;
  v20[4] = @"identitySize";
  v18 = [NSNumber numberWithUnsignedInteger:a7];
  v21[4] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  [(NSMutableArray *)precisionPerCluster addObject:v19];
}

- (void)addIdentityRecallToGroundTruth:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  recallPerPersonToGroundTruth = self->_recallPerPersonToGroundTruth;
  v17[0] = @"recall";
  *(float *)&double v12 = a3;
  v13 = [NSNumber numberWithFloat:v12];
  v18[0] = v13;
  v18[1] = v10;
  v17[1] = @"personID";
  v17[2] = @"personFaceCount";
  double v14 = [NSNumber numberWithUnsignedInteger:a5];
  v18[2] = v14;
  v17[3] = @"identitySize";
  v15 = [NSNumber numberWithUnsignedInteger:a6];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  [(NSMutableArray *)recallPerPersonToGroundTruth addObject:v16];
}

- (void)addIdentityRecallExcludeMissDetection:(float)a3 forPersonID:(id)a4 personFaceCount:(unint64_t)a5 identitySize:(unint64_t)a6
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  recallPerPersonExcludeMissDetection = self->_recallPerPersonExcludeMissDetection;
  v17[0] = @"recall";
  *(float *)&double v12 = a3;
  v13 = [NSNumber numberWithFloat:v12];
  v18[0] = v13;
  v18[1] = v10;
  v17[1] = @"personID";
  v17[2] = @"personFaceCount";
  double v14 = [NSNumber numberWithUnsignedInteger:a5];
  v18[2] = v14;
  v17[3] = @"identitySize";
  v15 = [NSNumber numberWithUnsignedInteger:a6];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  [(NSMutableArray *)recallPerPersonExcludeMissDetection addObject:v16];
}

- (float)weightedAveragePrecision
{
  return self->_weightedAveragePrecision;
}

- (void)setWeightedAveragePrecision:(float)a3
{
  self->_weightedAveragePrecision = a3;
}

- (float)weightedAverageRecall
{
  return self->_weightedAverageRecall;
}

- (void)setWeightedAverageRecall:(float)a3
{
  self->_weightedAverageRecall = a3;
}

- (float)numSingletons
{
  return self->_numSingletons;
}

- (void)setNumSingletons:(float)a3
{
  self->_numSingletons = a3;
}

- (float)numValidSingletons
{
  return self->_numValidSingletons;
}

- (void)setNumValidSingletons:(float)a3
{
  self->_numValidSingletons = a3;
}

- (NSMutableArray)precisionPerCluster
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrecisionPerCluster:(id)a3
{
}

- (NSMutableArray)recallPerPersonToGroundTruth
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecallPerPersonToGroundTruth:(id)a3
{
}

- (NSMutableArray)recallPerPersonExcludeMissDetection
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecallPerPersonExcludeMissDetection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallPerPersonExcludeMissDetection, 0);
  objc_storeStrong((id *)&self->_recallPerPersonToGroundTruth, 0);
  objc_storeStrong((id *)&self->_precisionPerCluster, 0);
}

@end