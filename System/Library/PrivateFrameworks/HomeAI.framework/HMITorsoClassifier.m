@interface HMITorsoClassifier
- (HMITorsoClassifier)init;
- (HMITorsoprinter)torsoprinter;
- (double)classificationThresholdKnown;
- (id)classifyTorsoEvent:(id)a3 regionOfInterest:(CGRect)a4 pixelBuffer:(__CVBuffer *)a5 homeUUID:(id)a6 error:(id *)a7;
@end

@implementation HMITorsoClassifier

- (HMITorsoClassifier)init
{
  v9.receiver = self;
  v9.super_class = (Class)HMITorsoClassifier;
  v2 = [(HMITorsoClassifier *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(HMITorsoprinter);
    torsoprinter = v2->_torsoprinter;
    v2->_torsoprinter = v3;

    v5 = +[HMIPreference sharedInstance];
    v6 = [v5 numberPreferenceForKey:@"torsoPersonsModelClassificationThresholdKnown" defaultValue:&unk_26D9A9B60];
    [v6 doubleValue];
    v2->_classificationThresholdKnown = v7;
  }
  return v2;
}

- (id)classifyTorsoEvent:(id)a3 regionOfInterest:(CGRect)a4 pixelBuffer:(__CVBuffer *)a5 homeUUID:(id)a6 error:(id *)a7
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  v14 = [v12 roll];
  if (v14)
  {
    v15 = [v12 roll];
    [v15 floatValue];
    float v17 = v16;
  }
  else
  {
    float v17 = 0.0;
  }

  float v18 = fabsf(v17);
  BOOL v19 = v18 > 1.5708;
  if (v18 > 1.5708)
  {
    v20 = (void *)MEMORY[0x22A641C70]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v23;
      __int16 v100 = 2048;
      double v101 = v17 * 57.2957795;
      _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with extreme roll (%.0f deg)", buf, 0x16u);
    }
  }
  double Size = HMICVPixelBufferGetSize(a5);
  CGFloat v26 = v25;
  [v12 boundingBox];
  HMICGRectPixelFromNormalized(v27, v28, v29, v30, Size, v26);
  CGRect v113 = CGRectIntegral(v112);
  CGFloat v31 = v113.origin.x;
  CGFloat v32 = v113.origin.y;
  CGFloat v33 = v113.size.width;
  CGFloat v34 = v113.size.height;
  double v35 = CGRectGetWidth(v113);
  v114.origin.CGFloat x = v31;
  v114.origin.CGFloat y = v32;
  v114.size.CGFloat width = v33;
  v114.size.CGFloat height = v34;
  float v36 = v35 / (CGRectGetHeight(v114) + 0.00000999999975);
  if (v36 > 0.9)
  {
    v37 = (void *)MEMORY[0x22A641C70]();
    v38 = self;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = HMFGetLogIdentifier();
      double v41 = v36;
      [v12 boundingBox];
      CGFloat v42 = CGRectGetWidth(v115);
      [v12 boundingBox];
      CGFloat v43 = CGRectGetHeight(v116);
      *(_DWORD *)buf = 138544642;
      v99 = v40;
      __int16 v100 = 2048;
      double v101 = v41;
      __int16 v102 = 2048;
      double v103 = Size;
      __int16 v104 = 2048;
      CGFloat v105 = v26;
      __int16 v106 = 2048;
      CGFloat v107 = v42;
      __int16 v108 = 2048;
      CGFloat v109 = v43;
      _os_log_impl(&dword_225DC6000, v39, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with extreme aspect ratio (w/h) (%.2f) pixelDim:(%f, %f) bbox:(%f, %f)", buf, 0x3Eu);
    }
    BOOL v19 = 1;
  }
  [v12 boundingBox];
  float v48 = HMICGRectMinElementwiseDistance(v44, v45, v46, v47, x, y, width, height);
  if (v48 < 0.01)
  {
    v49 = (void *)MEMORY[0x22A641C70]();
    v50 = self;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v99 = v52;
      __int16 v100 = 2048;
      double v101 = v48;
      _os_log_impl(&dword_225DC6000, v51, OS_LOG_TYPE_INFO, "%{public}@Skip torsoEvent with torsoBox close to roi boundary. Dist: (%.4f)", buf, 0x16u);
    }
    BOOL v19 = 1;
  }
  id v97 = 0;
  v53 = +[HMITorsoprinter createTorsoPixelBufferForTorsoEvent:v12 pixelBuffer:a5 error:&v97];
  id v54 = v97;
  if (v53)
  {
    v55 = [(HMITorsoClassifier *)self torsoprinter];
    v56 = [v55 torsoprintForTorsoPixelBuffer:v53 unrecognizable:v19 error:a7];

    CVPixelBufferRelease(v53);
    if (!v56)
    {
      v60 = (HMIVideoAnalyzerEventTorso *)v12;
LABEL_36:

      goto LABEL_37;
    }
    if ([v56 unrecognizable])
    {
      v57 = 0;
    }
    else
    {
      v61 = +[HMIPersonsModelManager sharedInstance];
      id v96 = v54;
      v57 = [v61 predictPersonFromTorsoObservation:v56 homeUUID:v13 error:&v96];
      id v62 = v96;

      if (v62)
      {
        v63 = (void *)MEMORY[0x22A641C70]();
        v64 = self;
        v65 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v99 = v66;
          _os_log_impl(&dword_225DC6000, v65, OS_LOG_TYPE_INFO, "%{public}@Failed to predict using torso vip model", buf, 0xCu);
        }
        if (a7) {
          *a7 = v62;
        }
        HMIErrorLog(v64, v62);
        v60 = 0;
        id v54 = v62;
        goto LABEL_35;
      }
      if (v57)
      {
        v67 = [v57 confidence];
        [v67 doubleValue];
        double v69 = v68;
        [(HMITorsoClassifier *)self classificationThresholdKnown];
        double v71 = v70;

        if (v69 >= v71)
        {
          v89 = [HMITorsoClassification alloc];
          v90 = [v57 personUUID];
          v91 = [v57 sourceUUID];
          v92 = [v57 confidence];
          [v92 doubleValue];
          v72 = -[HMITorsoClassification initWithPersonUUID:sourceUUID:confidence:](v89, "initWithPersonUUID:sourceUUID:confidence:", v90, v91);

          id v54 = 0;
          goto LABEL_34;
        }
      }
      id v54 = 0;
    }
    v72 = 0;
LABEL_34:
    v73 = [HMITorsoRecognition alloc];
    v74 = [MEMORY[0x263EFFA08] set];
    v75 = [v56 UUID];
    v76 = [(HMITorsoRecognition *)v73 initWithTorsoprint:v56 classification:v72 predictedLinkedEntityUUIDs:v74 sessionEntityAssignment:0 sessionEntityUUID:v75];

    v77 = [HMIVideoAnalyzerEventTorso alloc];
    v78 = [v12 confidence];
    [v12 boundingBox];
    double v80 = v79;
    double v82 = v81;
    double v84 = v83;
    double v86 = v85;
    v87 = [v12 roll];
    v60 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v77, "initWithConfidence:boundingBox:roll:torsoRecognition:", v78, v87, v76, v80, v82, v84, v86);

LABEL_35:
    goto LABEL_36;
  }
  v58 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1021 underlyingError:v54];
  v59 = v58;
  if (a7) {
    *a7 = v58;
  }
  HMIErrorLog(self, v59);

  v60 = (HMIVideoAnalyzerEventTorso *)v12;
LABEL_37:

  return v60;
}

- (HMITorsoprinter)torsoprinter
{
  return (HMITorsoprinter *)objc_getProperty(self, a2, 8, 1);
}

- (double)classificationThresholdKnown
{
  return self->_classificationThresholdKnown;
}

- (void).cxx_destruct
{
}

@end