@interface HMIPersonBlob
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp;
- (BOOL)isExpiredAtTimeStamp:(id *)a3;
- (CGRect)boundingBox;
- (HMIFaceprint)faceprint;
- (HMIPersonBlob)initWithNewPersonEvent:(id)a3 timeStamp:(id *)a4;
- (HMITorsoprint)torsoprint;
- (NSMutableIndexSet)personIndices;
- (NSUUID)blobID;
- (float)similarityToPersonBlob:(id)a3;
- (id)shortDescription;
- (void)setBlobID:(id)a3;
- (void)setPersonIndices:(id)a3;
- (void)trackPersonBlob:(id)a3;
@end

@implementation HMIPersonBlob

- (HMIPersonBlob)initWithNewPersonEvent:(id)a3 timeStamp:(id *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMIPersonBlob;
  v7 = [(HMIPersonBlob *)&v27 init];
  v8 = (HMIPersonBlob *)v7;
  if (v7)
  {
    int64_t var3 = a4->var3;
    *(_OWORD *)(v7 + 40) = *(_OWORD *)&a4->var0;
    *((void *)v7 + 7) = var3;
    uint64_t v10 = [MEMORY[0x263F089C8] indexSet];
    personIndices = v8->_personIndices;
    v8->_personIndices = (NSMutableIndexSet *)v10;

    [v6 boundingBoxForTracker];
    v8->_boundingBox.origin.x = v12;
    v8->_boundingBox.origin.y = v13;
    v8->_boundingBox.size.width = v14;
    v8->_boundingBox.size.height = v15;
    v16 = [v6 face];
    v17 = [v16 faceRecognition];
    uint64_t v18 = [v17 faceprint];
    faceprint = v8->_faceprint;
    v8->_faceprint = (HMIFaceprint *)v18;

    v20 = [v6 torso];
    v21 = [v20 torsoRecognition];
    uint64_t v22 = [v21 torsoprint];
    torsoprint = v8->_torsoprint;
    v8->_torsoprint = (HMITorsoprint *)v22;

    v24 = [v6 sessionEntityUUID];
    v25 = v24;
    if (!v24)
    {
      v25 = [MEMORY[0x263F08C38] UUID];
    }
    objc_storeStrong((id *)&v8->_blobID, v25);
    if (!v24) {
  }
    }
  return v8;
}

- (void)trackPersonBlob:(id)a3
{
  id v4 = [a3 blobID];
  [(HMIPersonBlob *)self setBlobID:v4];
}

- (float)similarityToPersonBlob:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HMIPersonBlob *)self faceprint];
  float v6 = 0.17;
  if (v5)
  {
    v7 = (void *)v5;
    v8 = [v4 faceprint];

    if (v8)
    {
      v9 = [(HMIPersonBlob *)self faceprint];
      uint64_t v10 = [v9 data];
      v11 = [v4 faceprint];
      CGFloat v12 = [v11 data];
      +[HMIGreedyClustering faceDistanceFromDescriptor:v10 toDescriptor:v12];
      float v6 = v13;
    }
  }
  uint64_t v14 = [(HMIPersonBlob *)self torsoprint];
  float v15 = 0.15;
  if (v14)
  {
    v16 = (void *)v14;
    v17 = [v4 torsoprint];

    if (v17)
    {
      uint64_t v18 = [(HMIPersonBlob *)self torsoprint];
      v19 = [v18 data];
      v20 = [v4 torsoprint];
      v21 = [v20 data];
      +[HMIGreedyClustering faceDistanceFromDescriptor:v19 toDescriptor:v21];
      float v15 = v22;
    }
  }
  [(HMIPersonBlob *)self boundingBox];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v4 boundingBox];
  float v35 = HMICGRectGeneralizedIntersectionOverUnion(v24, v26, v28, v30, v31, v32, v33, v34);
  v36 = (void *)MEMORY[0x22A641C70]();
  v37 = self;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v60 = HMFGetLogIdentifier();
    v61 = v36;
    if (v4) {
      [v4 timeStamp];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    [(HMIPersonBlob *)v37 timeStamp];
    Float64 v40 = CMTimeGetSeconds(&v62);
    [v4 boundingBox];
    v45 = HMICGRectDescription(v41, v42, v43, v44);
    v59 = [v4 blobID];
    v58 = [v59 UUIDString];
    v46 = [v58 substringToIndex:3];
    [(HMIPersonBlob *)v37 boundingBox];
    v51 = HMICGRectDescription(v47, v48, v49, v50);
    v52 = [(HMIPersonBlob *)v37 blobID];
    v53 = [v52 UUIDString];
    v54 = [v53 substringToIndex:3];
    *(_DWORD *)buf = 138546434;
    v65 = v60;
    __int16 v66 = 2048;
    Float64 v67 = Seconds;
    __int16 v68 = 2048;
    Float64 v69 = v40;
    __int16 v70 = 2048;
    double v71 = v6;
    __int16 v72 = 2048;
    uint64_t v73 = 0x3FC5C28F60000000;
    __int16 v74 = 2048;
    double v75 = v15;
    __int16 v76 = 2048;
    uint64_t v77 = 0x3FC3333340000000;
    __int16 v78 = 2048;
    double v79 = v35;
    __int16 v80 = 2048;
    unint64_t v81 = 0xBFE0000000000000;
    __int16 v82 = 2112;
    v83 = v45;
    __int16 v84 = 2112;
    v85 = v46;
    __int16 v86 = 2112;
    v87 = v51;
    __int16 v88 = 2112;
    v89 = v54;
    _os_log_impl(&dword_225DC6000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Track(PTS:%.2f-%.2f), dF:%.2f(%.2f), dT:%.2f(%.2f), GIOU:%.2f(%.2f), %@(%@) vs %@(%@)", buf, 0x84u);

    v36 = v61;
  }

  if (v6 >= 0.17)
  {
    float v56 = 0.0;
    if (v35 > -0.5) {
      float v56 = (float)(v35 + 1.0) * 0.5;
    }
    if (v15 < 0.15) {
      float v55 = (float)((float)(v35 + 1.0) * 0.5) + 1.0;
    }
    else {
      float v55 = v56;
    }
  }
  else
  {
    float v55 = (float)(1.0 - v6) + 2.0;
  }

  return v55;
}

- (BOOL)isExpiredAtTimeStamp:(id *)a3
{
  [(HMIPersonBlob *)self timeStamp];
  CMTime v5 = *(CMTime *)a3;
  CMTimeSubtract(&time, &v5, &rhs);
  return CMTimeGetSeconds(&time) > 5.0;
}

- (id)shortDescription
{
  v21 = NSString;
  [(HMIPersonBlob *)self timeStamp];
  Float64 Seconds = CMTimeGetSeconds(&time);
  id v4 = [(HMIPersonBlob *)self blobID];
  CMTime v5 = [v4 UUIDString];
  float v6 = [v5 substringToIndex:3];
  [(HMIPersonBlob *)self boundingBox];
  v11 = HMICGRectDescription(v7, v8, v9, v10);
  CGFloat v12 = [(HMIPersonBlob *)self faceprint];
  float v13 = @", ";
  if (!v12)
  {
    v20 = [(HMIPersonBlob *)self torsoprint];
    if (!v20) {
      float v13 = &stru_26D98B6C8;
    }
  }
  uint64_t v14 = [(HMIPersonBlob *)self faceprint];
  if (v14) {
    float v15 = @"F";
  }
  else {
    float v15 = &stru_26D98B6C8;
  }
  v16 = [(HMIPersonBlob *)self torsoprint];
  v17 = @"T";
  if (!v16) {
    v17 = &stru_26D98B6C8;
  }
  uint64_t v18 = [v21 stringWithFormat:@"PersonBlob(PTS:%.2f): %@ (%@%@%@%@)", *(void *)&Seconds, v6, v11, v13, v15, v17];

  if (!v12) {
  return v18;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp
{
  objc_copyStruct(retstr, &self->_timeStamp, 24, 1, 0);
  return result;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (HMIFaceprint)faceprint
{
  return (HMIFaceprint *)objc_getProperty(self, a2, 8, 1);
}

- (HMITorsoprint)torsoprint
{
  return (HMITorsoprint *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableIndexSet)personIndices
{
  return (NSMutableIndexSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersonIndices:(id)a3
{
}

- (NSUUID)blobID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlobID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blobID, 0);
  objc_storeStrong((id *)&self->_personIndices, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

@end