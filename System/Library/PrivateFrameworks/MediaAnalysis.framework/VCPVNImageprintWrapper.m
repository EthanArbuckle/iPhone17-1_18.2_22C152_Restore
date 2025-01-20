@interface VCPVNImageprintWrapper
+ (VCPVNImageprintWrapper)wrapperWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5;
+ (id)generateVNImageprintWithType:(unint64_t)a3 archiveData:(id)a4 andError:(id *)a5;
- (BOOL)calculateDistance:(float *)a3 toWrapper:(id)a4 andError:(id *)a5;
- (NSData)data;
- (VCPVNImageprintWrapper)initWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5;
- (id)description;
- (int)version;
- (unint64_t)type;
@end

@implementation VCPVNImageprintWrapper

- (VCPVNImageprintWrapper)initWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5
{
  id v9 = a5;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)VCPVNImageprintWrapper;
    v10 = [(VCPVNImageprintWrapper *)&v14 init];
    v11 = v10;
    if (v10)
    {
      v10->_type = a3;
      v10->_version = a4;
      objc_storeStrong((id *)&v10->_data, a5);
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (VCPVNImageprintWrapper)wrapperWithImageprintType:(unint64_t)a3 version:(int)a4 andData:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc((Class)a1) initWithImageprintType:a3 version:v5 andData:v8];

  return (VCPVNImageprintWrapper *)v9;
}

+ (id)generateVNImageprintWithType:(unint64_t)a3 archiveData:(id)a4 andError:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    id v8 = (Class *)0x1E4F45800;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v8 = (Class *)0x1E4F456B8;
LABEL_5:
    a5 = (id *)[objc_alloc(*v8) initWithState:v7 error:a5];
    goto LABEL_8;
  }
  if (a5)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"[VCPVNImageprintWrapper] Invalid imageprint type %lu", a3, *MEMORY[0x1E4F28568]);
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a5 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v11];

    a5 = 0;
  }
LABEL_8:

  return a5;
}

- (BOOL)calculateDistance:(float *)a3 toWrapper:(id)a4 andError:(id *)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_19;
    }
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    id v15 = [NSString stringWithFormat:@"Cannot calculate distance - missing the other imageprint"];
    v61[0] = v15;
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    id v24 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
LABEL_17:
    BOOL v27 = 0;
    *a5 = v24;
    goto LABEL_18;
  }
  unint64_t v9 = [(VCPVNImageprintWrapper *)self type];
  if (v9 != [v8 type])
  {
    if (!a5) {
      goto LABEL_19;
    }
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot calculate distance - mismatched imageprint type (%lu vs %lu)", -[VCPVNImageprintWrapper type](self, "type"), objc_msgSend(v8, "type"));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v59 = v15;
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    id v24 = [v25 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
    goto LABEL_17;
  }
  int v10 = [(VCPVNImageprintWrapper *)self version];
  if (v10 != [v8 version])
  {
    if (a5)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      objc_msgSend(NSString, "stringWithFormat:", @"Cannot calculate distance - mismatched versions (%d vs %d)", -[VCPVNImageprintWrapper version](self, "version"), objc_msgSend(v8, "version"));
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v57 = v15;
      objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v24 = [v26 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
      goto LABEL_17;
    }
LABEL_19:
    BOOL v27 = 0;
    goto LABEL_20;
  }
  v11 = objc_opt_class();
  unint64_t v12 = [(VCPVNImageprintWrapper *)self type];
  uint64_t v13 = [(VCPVNImageprintWrapper *)self data];
  id v45 = 0;
  objc_super v14 = [v11 generateVNImageprintWithType:v12 archiveData:v13 andError:&v45];
  id v15 = v45;

  if (v14 && !v15)
  {
    v16 = objc_opt_class();
    uint64_t v17 = [v8 type];
    v18 = [v8 data];
    id v44 = 0;
    v19 = [v16 generateVNImageprintWithType:v17 archiveData:v18 andError:&v44];
    id v15 = v44;

    if (!v19 || v15)
    {
      if (!a5)
      {
        BOOL v27 = 0;
LABEL_63:

        goto LABEL_18;
      }
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      id v20 = [NSString stringWithFormat:@"Cannot calculate distance - unarchive theOtherImageprint.data - %@", v15];
      id v53 = v20;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      *a5 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v31];

      BOOL v27 = 0;
    }
    else
    {
      if (![(VCPVNImageprintWrapper *)self type])
      {
        id v20 = v14;
        id v21 = v19;
        if ([v20 isValidTorsoprint]) {
          int v22 = [v20 isValidFaceprint] ^ 1;
        }
        else {
          int v22 = 0;
        }
        if ([v20 isValidFaceprint]) {
          int v32 = [v20 isValidTorsoprint];
        }
        else {
          int v32 = 1;
        }
        if ([v21 isValidTorsoprint]) {
          int v33 = [v21 isValidFaceprint] ^ 1;
        }
        else {
          int v33 = 0;
        }
        if ([v21 isValidFaceprint]
          && (v22 ^ 1 | [v21 isValidTorsoprint]) != 1
          || ((v33 ^ 1 | v32) & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v40 = VCPLogInstance();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              v41 = @"face-only";
              if (v22) {
                v42 = @"torso-only";
              }
              else {
                v42 = @"face-only";
              }
              if (v33) {
                v41 = @"torso-only";
              }
              *(_DWORD *)buf = 138412546;
              v49 = v42;
              __int16 v50 = 2112;
              v51 = v41;
              _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEBUG, "Incomparable images: this - %@ vs that - %@", buf, 0x16u);
            }
          }
          if (a3) {
            *a3 = 1.0;
          }

          id v15 = 0;
          BOOL v27 = 1;
          v19 = v21;
          goto LABEL_62;
        }
      }
      id v43 = 0;
      id v20 = [v14 computeDistance:v19 withDistanceFunction:0 error:&v43];
      id v34 = v43;
      id v15 = v34;
      if (v20) {
        BOOL v35 = v34 == 0;
      }
      else {
        BOOL v35 = 0;
      }
      BOOL v27 = v35;
      if (v35)
      {
        if (a3)
        {
          [v20 floatValue];
          *(_DWORD *)a3 = v36;
        }
      }
      else if (a5)
      {
        v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        v38 = [NSString stringWithFormat:@"Cannot get distance between faceprints. Distance function returns nil"];
        v47 = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a5 = [v37 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v39];
      }
    }
LABEL_62:

    goto LABEL_63;
  }
  if (a5)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"Cannot calculate distance - unarchive self.data - %@", v15];
    v55 = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v20];
    BOOL v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
  BOOL v27 = 0;
LABEL_18:

LABEL_20:
  return v27;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v12.receiver = self;
  v12.super_class = (Class)VCPVNImageprintWrapper;
  v4 = [(VCPVNImageprintWrapper *)&v12 description];
  uint64_t v5 = [v3 stringWithString:v4];

  unint64_t v6 = [(VCPVNImageprintWrapper *)self type];
  uint64_t v7 = [(VCPVNImageprintWrapper *)self version];
  id v8 = [(VCPVNImageprintWrapper *)self data];
  uint64_t v9 = [v8 length];
  int v10 = [(VCPVNImageprintWrapper *)self data];
  [v5 appendFormat:@"type: %lu, version: %d, and data[length:%lu]: <%p>", v6, v7, v9, v10];

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (int)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end