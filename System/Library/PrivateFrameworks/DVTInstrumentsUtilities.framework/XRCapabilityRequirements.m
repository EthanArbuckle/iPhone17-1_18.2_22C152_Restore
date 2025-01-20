@interface XRCapabilityRequirements
+ (BOOL)supportsSecureCoding;
+ (id)requirementsFromContext:(id)a3;
+ (id)requirementsFromPlist:(id)a3 error:(id *)a4;
- (BOOL)checkRequirementsAgainstRegistery:(id)a3 error:(id *)a4;
- (XRCapabilityRequirements)init;
- (id)plistRepresentation;
@end

@implementation XRCapabilityRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requirementsFromContext:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_23458AB78;
  v10[3] = &unk_264BF1FB0;
  id v5 = v4;
  id v11 = v5;
  [v3 enumerateRequiredCapabilities:v6 withOptions:(uint64_t)v10 usingBlock:v7, v8];

  return v5;
}

+ (id)requirementsFromPlist:(id)a3 error:(id *)a4
{
  v48[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v44 = 100;
  uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:v5 format:v44 error:a4];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = v44;
  if (!v7 || v44 != 100)
  {
    if (!v7)
    {
LABEL_19:
      id v19 = 0;
      goto LABEL_23;
    }
LABEL_13:
    if (v9 == 100) {
      v20 = @"The root of the requirements file plist must be a dictionary.";
    }
    else {
      v20 = @"Requirements file must be an XML plist.";
    }
    v21 = v20;
    uint64_t v22 = *MEMORY[0x263F08338];
    v45[0] = *MEMORY[0x263F08320];
    v45[1] = v22;
    v46[0] = @"Bad Requirements Plist";
    v46[1] = v21;
    v45[2] = v45[0];
    v46[2] = @"The bundle may be corrupt or empty.  Check that the requirements file is not corrupt.";
    v25 = [NSDictionary dictionaryWithObjects:v23 forKeys:@[v46, v45]];
    if (a4)
    {
      [NSError errorWithDomain:MEMORY[0x263F087E8] code:v24 userInfo:@{@"Supported Capability Problem":v25}];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = v44;
    goto LABEL_13;
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_23458B01C;
  v33[3] = &unk_264BF2000;
  v33[4] = &v40;
  v33[5] = v38;
  v33[6] = &v34;
  [v8 enumerateKeysAndObjectsUsingBlock:v10, v11, v12];
  if (*((unsigned char *)v41 + 24))
  {
    if (*((unsigned char *)v35 + 24)) {
      v13 = @"Requirements file plist must contain string keys and number values";
    }
    else {
      v13 = @"The details of a capability must be encoded in a required capabilities plist as integers or strings";
    }
    v14 = v13;
    uint64_t v15 = *MEMORY[0x263F08338];
    v47[0] = *MEMORY[0x263F08320];
    v47[1] = v15;
    v48[0] = @"Bad Requirements Plist";
    v48[1] = v14;
    v47[2] = v47[0];
    v48[2] = @"The bundle may be corrupt or empty.  Check that the requirements file is not corrupt.";
    v18 = [NSDictionary dictionaryWithObjects:v16 forKeys:@[v48, v47, 3]];
    if (a4)
    {
      [NSException raise:@"Supported Capability Problem" format:@"%@ %d", @"Supported Capability Problem", 1];
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    v26 = objc_opt_new();
    v14 = v8;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_23458B238;
    v31[3] = &unk_264BF2028;
    id v19 = v26;
    id v32 = v19;
    [v14 enumerateKeysAndObjectsUsingBlock:v27, v31, v28, v29];
    v18 = v32;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);
LABEL_23:

  return v19;
}

- (XRCapabilityRequirements)init
{
  v8.receiver = self;
  v8.super_class = (Class)XRCapabilityRequirements;
  v2 = [(XRCapabilityRequirements *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    capabilities = v2->_capabilities;
    v2->_capabilities = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    unimplementedResponses = v2->_unimplementedResponses;
    v2->_unimplementedResponses = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)plistRepresentation
{
  v4 = objc_opt_new();
  capabilities = self->_capabilities;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_23458B55C;
  v21[3] = &unk_264BF2050;
  v21[4] = self;
  id v6 = v4;
  id v22 = v6;
  [capabilities enumerateKeysAndObjectsUsingBlock:v7, v8, v9];
  id v20 = 0;
  uint64_t v11 = [MEMORY[0x263F08AC0] dataWithPropertyList:v10 format:100 options:0 error:&v20];
  id v16 = v20;
  if (!v11)
  {
    v18 = [MEMORY[0x263F08690] currentHandler:v12, v13, v14, v15];
    [v18 handleFailureInMethod:v19 object:a2 file:@"XRCapabilityRequirements.m" lineNumber:155 description:@"Internal error converting contents to plist"];
  }

  return v11;
}

- (BOOL)checkRequirementsAgainstRegistery:(id)a3 error:(id *)a4
{
  v83[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 1;
  uint64_t v74 = 0;
  v75 = (int *)&v74;
  uint64_t v76 = 0x2020000000;
  int v77 = 0;
  uint64_t v70 = 0;
  v71 = (int *)&v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  v10 = objc_opt_new();
  capabilities = self->_capabilities;
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = sub_23458BB28;
  v60[3] = &unk_264BF2078;
  id v12 = v6;
  id v61 = v12;
  v67 = &v78;
  v68 = &v74;
  id v13 = v7;
  id v62 = v13;
  id v14 = v9;
  id v63 = v14;
  id v15 = v10;
  v69 = &v70;
  id v64 = v15;
  v65 = self;
  id v16 = v8;
  id v66 = v16;
  [capabilities enumerateKeysAndObjectsUsingBlock:v17, (uint64_t)v60, v18, v19];
  if (*((unsigned char *)v79 + 24))
  {
    BOOL v24 = 1;
    goto LABEL_15;
  }
  if (v75[6] < 1)
  {
    if (v71[6] < 1) {
      abort();
    }
    if (![v16 _callOutQueue_willDestroyWithTransitionContext:v20 completion:v21])
    {
      v48 = 0;
      v47 = @"This document appears to have been saved with a new version of this application.";
      char v37 = @"Forward compatibility checks have failed.";
      goto LABEL_12;
    }
    v38 = objc_opt_new();
    uint64_t v43 = [v16 count:v39, v40, v41, v42];
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = sub_23458BD78;
    v56 = &unk_264BF20A0;
    id v32 = v38;
    v57[0] = v32;
    v57[1] = v43;
    [v16 enumerateObjectsUsingBlock:v44, (uint64_t)&v53, v45, v46];
    uint64_t v36 = (id *)v57;
    char v37 = @"Forward compatibility checks have failed.";
  }
  else
  {
    if (![v13 _callOutQueue_willDestroyWithTransitionContext:v20 completion:v21])
    {
      v48 = 0;
      v47 = @"An older version of this application may be able to open this document or connect to this device.";
      char v37 = @"Backward compatibility checks have failed.";
      goto LABEL_12;
    }
    v26 = objc_opt_new();
    uint64_t v31 = [v13 v27:v28 v29:v30];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = sub_23458BCFC;
    v58[3] = &unk_264BF20A0;
    id v32 = v26;
    v59[0] = v32;
    v59[1] = v31;
    [v13 enumerateObjectsUsingBlock:v34, v35];
    uint64_t v36 = (id *)v59;
    char v37 = @"Backward compatibility checks have failed.";
  }
  v47 = (__CFString *)v32;

  v48 = v47;
LABEL_12:
  uint64_t v49 = *MEMORY[0x263F08320];
  v82[0] = *MEMORY[0x263F08338];
  v82[1] = v49;
  v83[0] = v37;
  v83[1] = @"Missing features";
  v82[2] = *MEMORY[0x263F08348];
  v82[3] = @"XRCapabilityRangesKey";
  v83[2] = v47;
  v83[3] = v14;
  v82[4] = @"XRRequiredVersionsKey";
  v83[4] = v15;
  v51 = [NSDictionary dictionaryWithObjects:v25 forKeys:(id[]){v53, v54, v55, v56} count:5];
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:v50 code:0 userInfo:v51];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v24 = *((unsigned char *)v79 + 24) != 0;
LABEL_15:

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unimplementedResponses, 0);

  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end