@interface SRFaceMetrics
+ (BOOL)supportsSecureCoding;
+ (SRFaceMetrics)new;
+ (void)initialize;
- (ARFaceAnchor)faceAnchor;
- (BOOL)isEqual:(id)a3;
- (NSArray)partialFaceExpressions;
- (NSArray)wholeFaceExpressions;
- (NSMutableArray)mutablePartialFaceExpressions;
- (NSMutableArray)mutableWholeFaceExpressions;
- (NSString)description;
- (NSString)sessionIdentifier;
- (NSString)version;
- (SRFaceMetrics)init;
- (SRFaceMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRFaceMetrics)initWithCoder:(id)a3;
- (SRFaceMetrics)initWithHAFacialMetricsPacket:(id)a3;
- (SRFaceMetrics)initWithVersion:(id)a3 sessionIdentifier:(id)a4 context:(unint64_t)a5 faceAnchor:(id)a6 wholeFaceExpressions:(id)a7 partialFaceExpressions:(id)a8;
- (SRFaceMetrics)initWithVersion:(id)a3 sessionIdentifier:(id)a4 context:(unint64_t)a5 faceIdentifier:(id)a6 trackingData:(id)a7 wholeFaceExpressions:(id)a8 partialFaceExpressions:(id)a9;
- (SRFaceMetricsContext)context;
- (id)binarySampleRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setFaceAnchor:(id)a3;
- (void)setMutablePartialFaceExpressions:(id)a3;
- (void)setMutableWholeFaceExpressions:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SRFaceMetrics

- (SRFaceMetrics)init
{
  return 0;
}

+ (SRFaceMetrics)new
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogFaceMetrics = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogFaceMetrics");
  }
}

- (SRFaceMetrics)initWithVersion:(id)a3 sessionIdentifier:(id)a4 context:(unint64_t)a5 faceAnchor:(id)a6 wholeFaceExpressions:(id)a7 partialFaceExpressions:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)SRFaceMetrics;
  v14 = [(SRFaceMetrics *)&v16 init];
  if (v14)
  {
    v14->_version = (NSString *)[a3 copy];
    v14->_sessionIdentifier = (NSString *)[a4 copy];
    v14->_context = a5;
    v14->_faceAnchor = (ARFaceAnchor *)a6;
    v14->_mutableWholeFaceExpressions = (NSMutableArray *)[a7 mutableCopy];
    v14->_mutablePartialFaceExpressions = (NSMutableArray *)[a8 mutableCopy];
  }
  return v14;
}

- (SRFaceMetrics)initWithHAFacialMetricsPacket:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = +[SRFaceMetricsPacket packetWithData:a3];
  v5 = SRLogFaceMetrics;
  if (v4)
  {
    v6 = v4;
    if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = [(SRFaceMetricsPacket *)v6 version];
      _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_INFO, "Legacy data support: got %@ version of HAFacialMetricsPacket", buf, 0xCu);
    }
    return [(SRFaceMetrics *)self initWithVersion:[(SRFaceMetricsPacket *)v6 version] sessionIdentifier:[(SRFaceMetricsPacket *)v6 sessionIdentifier] context:[(SRFaceMetricsPacket *)v6 context] faceIdentifier:[(SRFaceMetricsPacket *)v6 faceIdentifier] trackingData:[(SRFaceMetricsPacket *)v6 trackingData] wholeFaceExpressions:[(SRFaceMetricsPacket *)v6 wholeFaceExpressions] partialFaceExpressions:[(SRFaceMetricsPacket *)v6 partialFaceExpressions]];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_FAULT, "Failed to create SRFaceMetricsPacket", buf, 2u);
    }

    return 0;
  }
}

- (SRFaceMetrics)initWithVersion:(id)a3 sessionIdentifier:(id)a4 context:(unint64_t)a5 faceIdentifier:(id)a6 trackingData:(id)a7 wholeFaceExpressions:(id)a8 partialFaceExpressions:(id)a9
{
  id v15 = (id)[objc_alloc(MEMORY[0x263F20E98]) initWithTrackingData:a7 anchorIdentifier:a6];
  id v16 = (id)[objc_alloc(MEMORY[0x263F20E88]) initWithIdentifier:a6 faceTrackingData:v15];
  if (v16)
  {
    return [(SRFaceMetrics *)self initWithVersion:a3 sessionIdentifier:a4 context:a5 faceAnchor:v16 wholeFaceExpressions:a8 partialFaceExpressions:a9];
  }
  else
  {
    v18 = SRLogFaceMetrics;
    if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_ERROR, "Failed to create face anchor", v19, 2u);
    }

    return 0;
  }
}

- (NSArray)wholeFaceExpressions
{
  if (![(SRFaceMetrics *)self mutableWholeFaceExpressions]) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(SRFaceMetrics *)self mutableWholeFaceExpressions];

  return (NSArray *)[v3 arrayWithArray:v4];
}

- (NSArray)partialFaceExpressions
{
  if (![(SRFaceMetrics *)self mutablePartialFaceExpressions]) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(SRFaceMetrics *)self mutablePartialFaceExpressions];

  return (NSArray *)[v3 arrayWithArray:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRFaceMetrics;
  [(SRFaceMetrics *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRFaceMetrics.m", 304, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRFaceMetrics version](self, "version"), @"version");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRFaceMetrics sessionIdentifier](self, "sessionIdentifier"), @"sessionIdentifier");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRFaceMetrics context](self, "context"), @"context");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRFaceMetrics faceAnchor](self, "faceAnchor"), @"faceAnchor");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRFaceMetrics mutableWholeFaceExpressions](self, "mutableWholeFaceExpressions"), @"wholeFaceExpressions");
  v6 = [(SRFaceMetrics *)self mutablePartialFaceExpressions];

  [a3 encodeObject:v6 forKey:@"partialFaceExpressions"];
}

- (SRFaceMetrics)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRFaceMetrics.m", 316, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  uint64_t v7 = [a3 decodeIntegerForKey:@"context"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), @"wholeFaceExpressions");
  v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), @"partialFaceExpressions");
  uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
  if (!v14)
  {
    v18 = SRLogFaceMetrics;
    if (!os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = 0;
    v19 = "Failed to encode the object. Session identifier:%@";
LABEL_13:
    _os_log_error_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    return 0;
  }
  uint64_t v15 = v14;
  uint64_t v16 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"faceAnchor"];
  if (!v16)
  {
    v18 = SRLogFaceMetrics;
    if (!os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = 0;
    v19 = "Failed to encode the object. Face anchor:%@";
    goto LABEL_13;
  }

  return [(SRFaceMetrics *)self initWithVersion:v6 sessionIdentifier:v15 context:v7 faceAnchor:v16 wholeFaceExpressions:v10 partialFaceExpressions:v13];
}

- (id)binarySampleRepresentation
{
  uint64_t v3 = 0;
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v3];
}

- (SRFaceMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!objc_msgSend(a3, "length", a5))
  {
LABEL_18:

    return 0;
  }
  if ([a3 length] != 2348
    && [a3 length] != 2352
    && [a3 length] != 2384
    && [a3 length] != 368
    && [a3 length] != 424
    && [a3 length] != 436)
  {
    v16.receiver = self;
    v16.super_class = (Class)SRFaceMetrics;
    result = [(SRFaceMetrics *)&v16 init];
    if (!result) {
      return result;
    }
    self = result;
    uint64_t v15 = 0;
    uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:&v15];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = objc_opt_class();
      if (v10 == objc_opt_class())
      {

        return (SRFaceMetrics *)v9;
      }
      v11 = SRLogFaceMetrics;
      if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_FAULT))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_log_fault_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_FAULT, "Unarchived an object of an unexpected class %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v14 = SRLogFaceMetrics;
      if (os_log_type_enabled((os_log_t)SRLogFaceMetrics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_error_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_ERROR, "Failed to unarchive data because %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }

  return [(SRFaceMetrics *)self initWithHAFacialMetricsPacket:a3];
}

- (NSString)description
{
  v160[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ARFaceGeometry *)[(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] geometry] description];
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_26D165EC8;
  }
  v5 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  v159[0] = objc_msgSend(v5, "numberWithFloat:");
  uint64_t v6 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v7) = HIDWORD(v7);
  v159[1] = [v6 numberWithFloat:v7];
  uint64_t v8 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v10) = v9;
  v159[2] = [v8 numberWithFloat:v10];
  v11 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v13) = v12;
  v159[3] = [v11 numberWithFloat:v13];
  v160[0] = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:4];
  uint64_t v14 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  v158[0] = [v14 numberWithFloat:v15];
  objc_super v16 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v18) = v17;
  v158[1] = [v16 numberWithFloat:v18];
  uint64_t v19 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v21) = v20;
  v158[2] = [v19 numberWithFloat:v21];
  uint64_t v22 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v24) = v23;
  v158[3] = [v22 numberWithFloat:v24];
  v160[1] = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:4];
  v25 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  v157[0] = [v25 numberWithFloat:v26];
  v27 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v29) = v28;
  v157[1] = [v27 numberWithFloat:v29];
  v30 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v32) = v31;
  v157[2] = [v30 numberWithFloat:v32];
  v33 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v35) = v34;
  v157[3] = [v33 numberWithFloat:v35];
  v160[2] = [MEMORY[0x263EFF8C0] arrayWithObjects:v157 count:4];
  v36 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  v156[0] = [v36 numberWithFloat:v37];
  v38 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v40) = v39;
  v156[1] = [v38 numberWithFloat:v40];
  v41 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v43) = v42;
  v156[2] = [v41 numberWithFloat:v43];
  v44 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] transform];
  LODWORD(v46) = v45;
  v156[3] = [v44 numberWithFloat:v46];
  v160[3] = [MEMORY[0x263EFF8C0] arrayWithObjects:v156 count:4];
  uint64_t v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:4];
  v48 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  v154[0] = objc_msgSend(v48, "numberWithFloat:");
  v49 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v50) = HIDWORD(v50);
  v154[1] = [v49 numberWithFloat:v50];
  v51 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v53) = v52;
  v154[2] = [v51 numberWithFloat:v53];
  v54 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v56) = v55;
  v154[3] = [v54 numberWithFloat:v56];
  v155[0] = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:4];
  v57 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  v153[0] = [v57 numberWithFloat:v58];
  v59 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v61) = v60;
  v153[1] = [v59 numberWithFloat:v61];
  v62 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v64) = v63;
  v153[2] = [v62 numberWithFloat:v64];
  v65 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v67) = v66;
  v153[3] = [v65 numberWithFloat:v67];
  v155[1] = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:4];
  v68 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  v152[0] = [v68 numberWithFloat:v69];
  v70 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v72) = v71;
  v152[1] = [v70 numberWithFloat:v72];
  v73 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v75) = v74;
  v152[2] = [v73 numberWithFloat:v75];
  v76 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v78) = v77;
  v152[3] = [v76 numberWithFloat:v78];
  v155[2] = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:4];
  v79 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  v151[0] = [v79 numberWithFloat:v80];
  v81 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v83) = v82;
  v151[1] = [v81 numberWithFloat:v83];
  v84 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v86) = v85;
  v151[2] = [v84 numberWithFloat:v86];
  v87 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] leftEyeTransform];
  LODWORD(v89) = v88;
  v151[3] = [v87 numberWithFloat:v89];
  v155[3] = [MEMORY[0x263EFF8C0] arrayWithObjects:v151 count:4];
  uint64_t v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v155 count:4];
  v91 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  v149[0] = objc_msgSend(v91, "numberWithFloat:");
  v92 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v93) = HIDWORD(v93);
  v149[1] = [v92 numberWithFloat:v93];
  v94 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v96) = v95;
  v149[2] = [v94 numberWithFloat:v96];
  v97 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v99) = v98;
  v149[3] = [v97 numberWithFloat:v99];
  v150[0] = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:4];
  v100 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  v148[0] = [v100 numberWithFloat:v101];
  v102 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v104) = v103;
  v148[1] = [v102 numberWithFloat:v104];
  v105 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v107) = v106;
  v148[2] = [v105 numberWithFloat:v107];
  v108 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v110) = v109;
  v148[3] = [v108 numberWithFloat:v110];
  v150[1] = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:4];
  v111 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  v147[0] = [v111 numberWithFloat:v112];
  v113 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v115) = v114;
  v147[1] = [v113 numberWithFloat:v115];
  v116 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v118) = v117;
  v147[2] = [v116 numberWithFloat:v118];
  v119 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v121) = v120;
  v147[3] = [v119 numberWithFloat:v121];
  v150[2] = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:4];
  v122 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  v146[0] = [v122 numberWithFloat:v123];
  v124 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v126) = v125;
  v146[1] = [v124 numberWithFloat:v126];
  v127 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v129) = v128;
  v146[2] = [v127 numberWithFloat:v129];
  v130 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] rightEyeTransform];
  LODWORD(v132) = v131;
  v146[3] = [v130 numberWithFloat:v132];
  v150[3] = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:4];
  uint64_t v133 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:4];
  v134 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] lookAtPoint];
  v145[0] = objc_msgSend(v134, "numberWithFloat:");
  v135 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] lookAtPoint];
  LODWORD(v136) = HIDWORD(v136);
  v145[1] = [v135 numberWithFloat:v136];
  v137 = NSNumber;
  [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] lookAtPoint];
  LODWORD(v139) = v138;
  v145[2] = [v137 numberWithFloat:v139];
  uint64_t v140 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:3];
  uint64_t v141 = [NSString stringWithFormat:@"{ identifier:%@, sessionIdentifier:%@, geometry:%@, transform:%@, leftEyeTransform:%@, rightEyeTransform:%@, lookAtPoint:%@, blendShapes:%@}", -[ARFaceAnchor identifier](-[SRFaceMetrics faceAnchor](self, "faceAnchor"), "identifier"), -[ARFaceAnchor sessionIdentifier](-[SRFaceMetrics faceAnchor](self, "faceAnchor"), "sessionIdentifier"), v4, v47, v90, v133, v140, -[ARFaceAnchor blendShapes](-[SRFaceMetrics faceAnchor](self, "faceAnchor"), "blendShapes")];
  v142 = NSString;
  v143 = (objc_class *)objc_opt_class();
  return (NSString *)[v142 stringWithFormat:@"%@ (%p) {version:%@, session identifier:%@, context:%lu, face anchor:%@, whole face expressions:%@, partial face expressions:%@}", NSStringFromClass(v143), self, -[SRFaceMetrics version](self, "version"), -[SRFaceMetrics sessionIdentifier](self, "sessionIdentifier"), -[SRFaceMetrics context](self, "context"), v141, -[SRFaceMetrics wholeFaceExpressions](self, "wholeFaceExpressions"), -[SRFaceMetrics partialFaceExpressions](self, "partialFaceExpressions")];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  int v5 = -[NSString isEqualToString:](-[SRFaceMetrics version](self, "version"), "isEqualToString:", [a3 version]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSString isEqualToString:](-[SRFaceMetrics sessionIdentifier](self, "sessionIdentifier"), "isEqualToString:", [a3 sessionIdentifier]);
  if (!v5) {
    return v5;
  }
  SRFaceMetricsContext v6 = [(SRFaceMetrics *)self context];
  if (v6 != [a3 context])
  {
LABEL_12:
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = -[ARFaceAnchor isEqual:](-[SRFaceMetrics faceAnchor](self, "faceAnchor"), "isEqual:", [a3 faceAnchor]);
  if (v5)
  {
    int v5 = -[NSArray isEqual:](-[SRFaceMetrics wholeFaceExpressions](self, "wholeFaceExpressions"), "isEqual:", [a3 wholeFaceExpressions]);
    if (v5)
    {
      double v7 = [(SRFaceMetrics *)self partialFaceExpressions];
      uint64_t v8 = [a3 partialFaceExpressions];
      LOBYTE(v5) = [(NSArray *)v7 isEqual:v8];
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(SRFaceMetrics *)self version] hash];
  NSUInteger v4 = [(NSString *)[(SRFaceMetrics *)self sessionIdentifier] hash] ^ v3;
  SRFaceMetricsContext v5 = [(SRFaceMetrics *)self context];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)[(SRFaceMetrics *)self wholeFaceExpressions] hash];
  uint64_t v7 = [(NSArray *)[(SRFaceMetrics *)self partialFaceExpressions] hash];
  return v6 ^ v7 ^ [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] hash];
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (SRFaceMetricsContext)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (ARFaceAnchor)faceAnchor
{
  return self->_faceAnchor;
}

- (void)setFaceAnchor:(id)a3
{
}

- (NSMutableArray)mutableWholeFaceExpressions
{
  return self->_mutableWholeFaceExpressions;
}

- (void)setMutableWholeFaceExpressions:(id)a3
{
}

- (NSMutableArray)mutablePartialFaceExpressions
{
  return self->_mutablePartialFaceExpressions;
}

- (void)setMutablePartialFaceExpressions:(id)a3
{
}

@end