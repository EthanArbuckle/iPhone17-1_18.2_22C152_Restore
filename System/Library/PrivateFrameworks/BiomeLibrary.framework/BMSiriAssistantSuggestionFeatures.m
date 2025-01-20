@interface BMSiriAssistantSuggestionFeatures
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10;
- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10 loggingType:(int)a11;
- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)appUsageFeatures;
- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)deviceFeatures;
- (BMSiriAssistantSuggestionFeaturesEngagementLabels)engagementLabels;
- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)environmentFeatures;
- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)suggestionDetails;
- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)temporalFeatures;
- (BMSiriAssistantSuggestionFeaturesUserSegmentation)userSegmentation;
- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)icloudFeatures;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)loggingType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSegmentation, 0);
  objc_storeStrong((id *)&self->_engagementLabels, 0);
  objc_storeStrong((id *)&self->_temporalFeatures, 0);
  objc_storeStrong((id *)&self->_icloudFeatures, 0);
  objc_storeStrong((id *)&self->_environmentFeatures, 0);
  objc_storeStrong((id *)&self->_deviceFeatures, 0);
  objc_storeStrong((id *)&self->_appUsageFeatures, 0);

  objc_storeStrong((id *)&self->_suggestionDetails, 0);
}

- (int)loggingType
{
  return self->_loggingType;
}

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)userSegmentation
{
  return self->_userSegmentation;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)engagementLabels
{
  return self->_engagementLabels;
}

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)temporalFeatures
{
  return self->_temporalFeatures;
}

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)icloudFeatures
{
  return self->_icloudFeatures;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)environmentFeatures
{
  return self->_environmentFeatures;
}

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)deviceFeatures
{
  return self->_deviceFeatures;
}

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)appUsageFeatures
{
  return self->_appUsageFeatures;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)suggestionDetails
{
  return self->_suggestionDetails;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriAssistantSuggestionFeatures *)self suggestionDetails];
    uint64_t v7 = [v5 suggestionDetails];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriAssistantSuggestionFeatures *)self suggestionDetails];
      v10 = [v5 suggestionDetails];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    v13 = [(BMSiriAssistantSuggestionFeatures *)self appUsageFeatures];
    uint64_t v14 = [v5 appUsageFeatures];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriAssistantSuggestionFeatures *)self appUsageFeatures];
      v17 = [v5 appUsageFeatures];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    v19 = [(BMSiriAssistantSuggestionFeatures *)self deviceFeatures];
    uint64_t v20 = [v5 deviceFeatures];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriAssistantSuggestionFeatures *)self deviceFeatures];
      v23 = [v5 deviceFeatures];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_33;
      }
    }
    v25 = [(BMSiriAssistantSuggestionFeatures *)self environmentFeatures];
    uint64_t v26 = [v5 environmentFeatures];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriAssistantSuggestionFeatures *)self environmentFeatures];
      v29 = [v5 environmentFeatures];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_33;
      }
    }
    v31 = [(BMSiriAssistantSuggestionFeatures *)self icloudFeatures];
    uint64_t v32 = [v5 icloudFeatures];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriAssistantSuggestionFeatures *)self icloudFeatures];
      v35 = [v5 icloudFeatures];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_33;
      }
    }
    v37 = [(BMSiriAssistantSuggestionFeatures *)self temporalFeatures];
    uint64_t v38 = [v5 temporalFeatures];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMSiriAssistantSuggestionFeatures *)self temporalFeatures];
      v41 = [v5 temporalFeatures];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_33;
      }
    }
    v43 = [(BMSiriAssistantSuggestionFeatures *)self engagementLabels];
    uint64_t v44 = [v5 engagementLabels];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMSiriAssistantSuggestionFeatures *)self engagementLabels];
      v47 = [v5 engagementLabels];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_33;
      }
    }
    v49 = [(BMSiriAssistantSuggestionFeatures *)self userSegmentation];
    uint64_t v50 = [v5 userSegmentation];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMSiriAssistantSuggestionFeatures *)self userSegmentation];
      v53 = [v5 userSegmentation];
      int v54 = [v52 isEqual:v53];

      if (!v54)
      {
LABEL_33:
        BOOL v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    int v56 = [(BMSiriAssistantSuggestionFeatures *)self loggingType];
    BOOL v12 = v56 == [v5 loggingType];
    goto LABEL_34;
  }
  BOOL v12 = 0;
LABEL_35:

  return v12;
}

- (id)jsonDictionary
{
  v40[9] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriAssistantSuggestionFeatures *)self suggestionDetails];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMSiriAssistantSuggestionFeatures *)self appUsageFeatures];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMSiriAssistantSuggestionFeatures *)self deviceFeatures];
  uint64_t v8 = [v7 jsonDictionary];

  v9 = [(BMSiriAssistantSuggestionFeatures *)self environmentFeatures];
  v10 = [v9 jsonDictionary];

  int v11 = [(BMSiriAssistantSuggestionFeatures *)self icloudFeatures];
  uint64_t v12 = [v11 jsonDictionary];

  v13 = [(BMSiriAssistantSuggestionFeatures *)self temporalFeatures];
  uint64_t v38 = [v13 jsonDictionary];

  uint64_t v14 = [(BMSiriAssistantSuggestionFeatures *)self engagementLabels];
  v15 = [v14 jsonDictionary];

  v16 = [(BMSiriAssistantSuggestionFeatures *)self userSegmentation];
  v17 = [v16 jsonDictionary];

  int v18 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriAssistantSuggestionFeatures loggingType](self, "loggingType"));
  v39[0] = @"suggestionDetails";
  uint64_t v19 = v4;
  if (!v4)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v19;
  v40[0] = v19;
  v39[1] = @"appUsageFeatures";
  uint64_t v20 = v6;
  if (!v6)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v32 = (void *)v20;
  v40[1] = v20;
  v39[2] = @"deviceFeatures";
  uint64_t v21 = v8;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v4;
  v31 = (void *)v21;
  v40[2] = v21;
  v39[3] = @"environmentFeatures";
  uint64_t v22 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v6;
  int v30 = (void *)v22;
  v40[3] = v22;
  v39[4] = @"icloudFeatures";
  v23 = (void *)v12;
  if (!v12)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v8;
  v40[4] = v23;
  v39[5] = @"temporalFeatures";
  int v24 = v38;
  if (!v38)
  {
    int v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[5] = v24;
  v39[6] = @"engagementLabels";
  v25 = v15;
  if (!v15)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v12;
  v40[6] = v25;
  v39[7] = @"userSegmentation";
  v27 = v17;
  if (!v17)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[7] = v27;
  v39[8] = @"loggingType";
  v28 = v18;
  if (!v18)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[8] = v28;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:9];
  if (v18)
  {
    if (v17) {
      goto LABEL_21;
    }
LABEL_35:

    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }

  if (!v17) {
    goto LABEL_35;
  }
LABEL_21:
  if (v15) {
    goto LABEL_22;
  }
LABEL_36:

LABEL_22:
  if (!v38) {

  }
  if (!v26) {
  if (!v10)
  }

  if (v35)
  {
    if (v36) {
      goto LABEL_30;
    }
LABEL_38:

    if (v37) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }

  if (!v36) {
    goto LABEL_38;
  }
LABEL_30:
  if (v37) {
    goto LABEL_31;
  }
LABEL_39:

LABEL_31:

  return v34;
}

- (BMSiriAssistantSuggestionFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v148[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"suggestionDetails"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"appUsageFeatures"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v122 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v7;
      id v26 = v9;
      id v129 = 0;
      v27 = [[BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc] initWithJSONDictionary:v26 error:&v129];
      id v28 = v129;
      if (v28)
      {
        v29 = v28;
        id v30 = v6;
        v31 = v25;
        id v32 = v9;
        id v33 = v26;
        uint64_t v8 = v122;
        if (a4) {
          *a4 = v28;
        }

        int v24 = 0;
        id v34 = v33;
        id v9 = v32;
        int v11 = v34;
        v35 = v31;
        id v6 = v30;
        v10 = v27;
        uint64_t v7 = v35;
        goto LABEL_111;
      }

      uint64_t v8 = v122;
      v10 = v27;
      uint64_t v7 = v25;
LABEL_7:
      int v11 = [v6 objectForKeyedSubscript:@"deviceFeatures"];
      v120 = self;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v24 = 0;
LABEL_110:
            self = v120;
            goto LABEL_111;
          }
          id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
          int v56 = v11;
          v57 = v7;
          v58 = v56;
          v96 = a4;
          uint64_t v59 = *MEMORY[0x1E4F502C8];
          uint64_t v143 = *MEMORY[0x1E4F28568];
          v60 = v10;
          v61 = v8;
          id v62 = [NSString alloc];
          uint64_t v93 = objc_opt_class();
          v63 = v62;
          uint64_t v8 = v61;
          v10 = v60;
          uint64_t v38 = (BMSiriAssistantSuggestionFeaturesDeviceFeatures *)[v63 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v93, @"deviceFeatures"];
          v144 = v38;
          id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
          int v24 = 0;
          id *v96 = (id)[v119 initWithDomain:v59 code:2 userInfo:v12];
          v64 = v58;
          uint64_t v7 = v57;
          int v11 = v64;
          goto LABEL_109;
        }
        id v12 = v11;
        id v128 = 0;
        v118 = [[BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc] initWithJSONDictionary:v12 error:&v128];
        id v36 = v128;
        if (v36)
        {
          v37 = v36;
          if (a4) {
            *a4 = v36;
          }

          int v24 = 0;
          uint64_t v38 = v118;
          goto LABEL_109;
        }
      }
      else
      {
        v118 = 0;
      }
      id v12 = [v6 objectForKeyedSubscript:@"environmentFeatures"];
      v121 = v8;
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v117 = 0;
        goto LABEL_13;
      }
      v113 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        id v127 = 0;
        v117 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc] initWithJSONDictionary:v13 error:&v127];
        id v45 = v127;
        if (v45)
        {
          v46 = v45;
          if (a4) {
            *a4 = v45;
          }

          int v24 = 0;
          uint64_t v38 = v118;
          goto LABEL_108;
        }

LABEL_13:
        id v13 = [v6 objectForKeyedSubscript:@"icloudFeatures"];
        v111 = v7;
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v112 = 0;
LABEL_16:
          id v14 = [v6 objectForKeyedSubscript:@"temporalFeatures"];
          if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v107 = v11;
            v115 = v10;
            v65 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                int v24 = 0;
                v10 = v115;
                uint64_t v38 = v118;
                goto LABEL_106;
              }
              id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v104 = *MEMORY[0x1E4F502C8];
              uint64_t v137 = *MEMORY[0x1E4F28568];
              uint64_t v19 = (BMSiriAssistantSuggestionFeaturesTemporalFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"temporalFeatures"];
              v138 = v19;
              uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
              v82 = v110;
              v108 = (void *)v81;
              int v24 = 0;
              id *v65 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v104, 2);
              v10 = v115;
              uint64_t v38 = v118;
              goto LABEL_105;
            }
            id v66 = v14;
            id v125 = 0;
            uint64_t v19 = [[BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc] initWithJSONDictionary:v66 error:&v125];
            id v67 = v125;
            if (v67)
            {
              v68 = v67;
              v108 = v66;
              int v11 = v107;
              if (v65) {
                id *v65 = v67;
              }

              int v24 = 0;
              v10 = v115;
              uint64_t v38 = v118;
              goto LABEL_105;
            }
            id v102 = v14;
            v103 = v19;

            a4 = v65;
            v10 = v115;
            int v11 = v107;
          }
          else
          {
            id v102 = v14;
            v103 = 0;
          }
          uint64_t v15 = [v6 objectForKeyedSubscript:@"engagementLabels"];
          v108 = (void *)v15;
          if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v116 = v10;
            v73 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v19 = v103;
              if (!v73)
              {
                int v24 = 0;
                v10 = v116;
                uint64_t v38 = v118;
                id v14 = v102;
                goto LABEL_105;
              }
              id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v101 = *MEMORY[0x1E4F502C8];
              uint64_t v135 = *MEMORY[0x1E4F28568];
              v106 = (BMSiriAssistantSuggestionFeaturesEngagementLabels *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"engagementLabels"];
              v136 = v106;
              uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
              uint64_t v86 = v101;
              v100 = (void *)v85;
              int v24 = 0;
              id *v73 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v86, 2);
              v10 = v116;
              goto LABEL_103;
            }
            id v97 = v13;
            id v74 = v16;
            id v124 = 0;
            v106 = [[BMSiriAssistantSuggestionFeaturesEngagementLabels alloc] initWithJSONDictionary:v74 error:&v124];
            id v75 = v124;
            uint64_t v19 = v103;
            if (v75)
            {
              v76 = v75;
              v100 = v74;
              if (v73) {
                id *v73 = v75;
              }

              int v24 = 0;
              v10 = v116;
              uint64_t v38 = v118;
              id v14 = v102;
              goto LABEL_120;
            }

            a4 = v73;
            v10 = v116;
          }
          else
          {
            id v97 = v13;
            v106 = 0;
          }
          uint64_t v17 = [v6 objectForKeyedSubscript:@"userSegmentation"];
          v100 = (void *)v17;
          if (!v17 || (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v95 = a4;
            v99 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v95 = a4;
            id v21 = v18;
            id v123 = 0;
            v99 = [[BMSiriAssistantSuggestionFeaturesUserSegmentation alloc] initWithJSONDictionary:v21 error:&v123];
            id v79 = v123;
            if (v79)
            {
              v80 = v79;
              id v13 = v97;
              uint64_t v19 = v103;
              if (v95) {
                id *v95 = v79;
              }

              int v24 = 0;
              goto LABEL_102;
            }

LABEL_25:
            uint64_t v19 = v103;
            id v13 = v97;
            uint64_t v20 = [v6 objectForKeyedSubscript:@"loggingType"];
            if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v83 = v20;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v95)
                  {
                    id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v98 = *MEMORY[0x1E4F502C8];
                    uint64_t v131 = *MEMORY[0x1E4F28568];
                    v91 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"loggingType"];
                    v132 = v91;
                    v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
                    id *v95 = (id)[v105 initWithDomain:v98 code:2 userInfo:v92];
                  }
                  id v21 = 0;
                  int v24 = 0;
                  goto LABEL_101;
                }
                id v83 = [NSNumber numberWithInt:BMSiriAssistantSuggestionFeaturesLoggingTypeFromString(v20)];
              }
              id v21 = v83;
            }
            else
            {
              id v21 = 0;
            }
            LODWORD(v94) = [v21 intValue];
            int v24 = [(BMSiriAssistantSuggestionFeatures *)v120 initWithSuggestionDetails:v121 appUsageFeatures:v10 deviceFeatures:v118 environmentFeatures:v117 icloudFeatures:v112 temporalFeatures:v103 engagementLabels:v106 userSegmentation:v99 loggingType:v94];
            v120 = v24;
LABEL_101:

            goto LABEL_102;
          }
          if (a4)
          {
            id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v88 = *MEMORY[0x1E4F502C8];
            uint64_t v133 = *MEMORY[0x1E4F28568];
            v99 = (BMSiriAssistantSuggestionFeaturesUserSegmentation *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"userSegmentation"];
            v134 = v99;
            id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
            id v89 = (id)[v87 initWithDomain:v88 code:2 userInfo:v21];
            int v24 = 0;
            *a4 = v89;
            uint64_t v19 = v103;
            id v13 = v97;
LABEL_102:

LABEL_103:
            uint64_t v38 = v118;
            id v14 = v102;
LABEL_104:

LABEL_105:
            goto LABEL_106;
          }
          int v24 = 0;
          uint64_t v38 = v118;
          id v14 = v102;
          uint64_t v19 = v103;
LABEL_120:
          id v13 = v97;
          goto LABEL_104;
        }
        v114 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          id v126 = 0;
          v112 = [[BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc] initWithJSONDictionary:v14 error:&v126];
          id v54 = v126;
          if (!v54)
          {

            goto LABEL_16;
          }
          v55 = v54;
          if (a4) {
            *a4 = v54;
          }

          int v24 = 0;
        }
        else
        {
          if (!a4)
          {
            int v24 = 0;
            uint64_t v38 = v118;
LABEL_107:
            uint64_t v7 = v111;
            goto LABEL_108;
          }
          v77 = a4;
          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v109 = *MEMORY[0x1E4F502C8];
          uint64_t v139 = *MEMORY[0x1E4F28568];
          v112 = (BMSiriAssistantSuggestionFeaturesiCloudFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"icloudFeatures"];
          v140 = v112;
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
          int v24 = 0;
          id *v77 = (id)[v78 initWithDomain:v109 code:2 userInfo:v14];
        }
        v10 = v114;
        uint64_t v38 = v118;
LABEL_106:

        goto LABEL_107;
      }
      if (a4)
      {
        v69 = a4;
        id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v71 = *MEMORY[0x1E4F502C8];
        uint64_t v141 = *MEMORY[0x1E4F28568];
        v117 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"environmentFeatures"];
        v142 = v117;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
        id v72 = (id)[v70 initWithDomain:v71 code:2 userInfo:v13];
        int v24 = 0;
        id *v69 = v72;
        v10 = v113;
        uint64_t v38 = v118;
LABEL_108:

        uint64_t v8 = v121;
        goto LABEL_109;
      }
      int v24 = 0;
      uint64_t v38 = v118;
LABEL_109:

      goto LABEL_110;
    }
    if (a4)
    {
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v48 = v7;
      uint64_t v49 = *MEMORY[0x1E4F502C8];
      uint64_t v145 = *MEMORY[0x1E4F28568];
      uint64_t v50 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"appUsageFeatures"];
      uint64_t v146 = v50;
      uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      uint64_t v52 = v49;
      uint64_t v7 = v48;
      int v11 = (void *)v51;
      id v53 = (id)[v47 initWithDomain:v52 code:2 userInfo:v51];
      int v24 = 0;
      *a4 = v53;
      v10 = (void *)v50;
LABEL_111:

      goto LABEL_112;
    }
    int v24 = 0;
LABEL_112:

    goto LABEL_113;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v130 = 0;
    uint64_t v8 = [[BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc] initWithJSONDictionary:v9 error:&v130];
    id v22 = v130;
    if (v22)
    {
      v23 = v22;
      if (a4) {
        *a4 = v22;
      }

      int v24 = 0;
      goto LABEL_112;
    }

    goto LABEL_4;
  }
  if (a4)
  {
    id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
    v40 = a4;
    v41 = v7;
    uint64_t v42 = *MEMORY[0x1E4F502C8];
    uint64_t v147 = *MEMORY[0x1E4F28568];
    uint64_t v8 = (BMSiriAssistantSuggestionFeaturesSuggestionDetails *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"suggestionDetails"];
    v148[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:&v147 count:1];
    uint64_t v43 = v42;
    uint64_t v7 = v41;
    id v44 = (id)[v39 initWithDomain:v43 code:2 userInfo:v9];
    int v24 = 0;
    id *v40 = v44;
    goto LABEL_112;
  }
  int v24 = 0;
LABEL_113:

  return v24;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeatures *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_suggestionDetails)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self->_suggestionDetails writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_appUsageFeatures)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesAppUsageFeatures *)self->_appUsageFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_deviceFeatures)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesDeviceFeatures *)self->_deviceFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_environmentFeatures)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)self->_environmentFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_icloudFeatures)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesiCloudFeatures *)self->_icloudFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_temporalFeatures)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesTemporalFeatures *)self->_temporalFeatures writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_engagementLabels)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesEngagementLabels *)self->_engagementLabels writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_userSegmentation)
  {
    PBDataWriterPlaceMark();
    [(BMSiriAssistantSuggestionFeaturesUserSegmentation *)self->_userSegmentation writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriAssistantSuggestionFeatures;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_64;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 24;
          goto LABEL_46;
        case 2u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 32;
          goto LABEL_46;
        case 3u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 40;
          goto LABEL_46;
        case 4u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 48;
          goto LABEL_46;
        case 5u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 56;
          goto LABEL_46;
        case 6u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 64;
          goto LABEL_46;
        case 7u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesEngagementLabels alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 72;
          goto LABEL_46;
        case 8u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_63;
          }
          uint64_t v20 = [[BMSiriAssistantSuggestionFeaturesUserSegmentation alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_63;
          }
          uint64_t v21 = 80;
LABEL_46:
          id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 9u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_63;
          }
          continue;
      }
      while (1)
      {
        uint64_t v26 = *v6;
        uint64_t v27 = *(void *)&v4[v26];
        unint64_t v28 = v27 + 1;
        if (v27 == -1 || v28 > *(void *)&v4[*v7]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
        *(void *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0) {
          goto LABEL_57;
        }
        v23 += 7;
        BOOL v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8]) {
        LODWORD(v25) = 0;
      }
LABEL_59:
      if (v25 >= 3) {
        LODWORD(v25) = 0;
      }
      v5->_loggingType = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_63:
  }
    id v30 = 0;
  else {
LABEL_64:
  }
    id v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriAssistantSuggestionFeatures *)self suggestionDetails];
  id v5 = [(BMSiriAssistantSuggestionFeatures *)self appUsageFeatures];
  id v6 = [(BMSiriAssistantSuggestionFeatures *)self deviceFeatures];
  uint64_t v7 = [(BMSiriAssistantSuggestionFeatures *)self environmentFeatures];
  uint64_t v8 = [(BMSiriAssistantSuggestionFeatures *)self icloudFeatures];
  id v9 = [(BMSiriAssistantSuggestionFeatures *)self temporalFeatures];
  char v10 = [(BMSiriAssistantSuggestionFeatures *)self engagementLabels];
  unsigned int v11 = [(BMSiriAssistantSuggestionFeatures *)self userSegmentation];
  unint64_t v12 = BMSiriAssistantSuggestionFeaturesLoggingTypeAsString([(BMSiriAssistantSuggestionFeatures *)self loggingType]);
  uint64_t v13 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeatures with suggestionDetails: %@, appUsageFeatures: %@, deviceFeatures: %@, environmentFeatures: %@, icloudFeatures: %@, temporalFeatures: %@, engagementLabels: %@, userSegmentation: %@, loggingType: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10 loggingType:(int)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriAssistantSuggestionFeatures;
  uint64_t v19 = [(BMEventBase *)&v28 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_suggestionDetails, a3);
    objc_storeStrong((id *)&v19->_appUsageFeatures, a4);
    objc_storeStrong((id *)&v19->_deviceFeatures, a5);
    objc_storeStrong((id *)&v19->_environmentFeatures, a6);
    objc_storeStrong((id *)&v19->_icloudFeatures, a7);
    objc_storeStrong((id *)&v19->_temporalFeatures, a8);
    objc_storeStrong((id *)&v19->_engagementLabels, a9);
    objc_storeStrong((id *)&v19->_userSegmentation, a10);
    v19->_loggingType = a11;
  }

  return v19;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionDetails" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"appUsageFeatures", 2, 14, objc_opt_class(), v2);
  v13[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceFeatures" number:3 type:14 subMessageClass:objc_opt_class()];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"environmentFeatures" number:4 type:14 subMessageClass:objc_opt_class()];
  v13[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"icloudFeatures" number:5 type:14 subMessageClass:objc_opt_class()];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"temporalFeatures" number:6 type:14 subMessageClass:objc_opt_class()];
  v13[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"engagementLabels" number:7 type:14 subMessageClass:objc_opt_class()];
  v13[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSegmentation" number:8 type:14 subMessageClass:objc_opt_class()];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"loggingType" number:9 type:4 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3C78;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"suggestionDetails_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1168];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"appUsageFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1170];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1172];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"environmentFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1174];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"icloudFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1176];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"temporalFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1178];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"engagementLabels_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1180];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"userSegmentation_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_1182];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"loggingType" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 userSegmentation];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 engagementLabels];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 temporalFeatures];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 icloudFeatures];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 environmentFeatures];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 deviceFeatures];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 appUsageFeatures];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 suggestionDetails];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriAssistantSuggestionFeatures alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10
{
  LODWORD(v11) = 0;
  return [(BMSiriAssistantSuggestionFeatures *)self initWithSuggestionDetails:a3 appUsageFeatures:a4 deviceFeatures:a5 environmentFeatures:a6 icloudFeatures:a7 temporalFeatures:a8 engagementLabels:a9 userSegmentation:a10 loggingType:v11];
}

@end