@interface BMAdPlatformsTrainingRows
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAdPlatformsTrainingRows)initWithDeploymentID:(id)a3 experimentID:(id)a4 treatmentID:(id)a5 adamID:(id)a6 impressed:(id)a7 tapped:(id)a8 dupe:(id)a9 installed:(id)a10 errorCode:(id)a11 appUsageVector:(id)a12 appDownloadVector:(id)a13 installedAppVector:(id)a14 userQueryVector:(id)a15 serverResponse:(id)a16 recordID:(id)a17;
- (BMAdPlatformsTrainingRows)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)dupe;
- (BOOL)hasDupe;
- (BOOL)hasErrorCode;
- (BOOL)hasImpressed;
- (BOOL)hasInstalled;
- (BOOL)hasTapped;
- (BOOL)impressed;
- (BOOL)installed;
- (BOOL)isEqual:(id)a3;
- (BOOL)tapped;
- (NSArray)appDownloadVector;
- (NSArray)appUsageVector;
- (NSArray)installedAppVector;
- (NSArray)userQueryVector;
- (NSData)serverResponse;
- (NSString)adamID;
- (NSString)deploymentID;
- (NSString)description;
- (NSString)experimentID;
- (NSString)recordID;
- (NSString)treatmentID;
- (double)errorCode;
- (id)_appDownloadVectorJSONArray;
- (id)_appUsageVectorJSONArray;
- (id)_installedAppVectorJSONArray;
- (id)_userQueryVectorJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasDupe:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasImpressed:(BOOL)a3;
- (void)setHasInstalled:(BOOL)a3;
- (void)setHasTapped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMAdPlatformsTrainingRows

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_userQueryVector, 0);
  objc_storeStrong((id *)&self->_installedAppVector, 0);
  objc_storeStrong((id *)&self->_appDownloadVector, 0);
  objc_storeStrong((id *)&self->_appUsageVector, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);

  objc_storeStrong((id *)&self->_deploymentID, 0);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSData)serverResponse
{
  return self->_serverResponse;
}

- (NSArray)userQueryVector
{
  return self->_userQueryVector;
}

- (NSArray)installedAppVector
{
  return self->_installedAppVector;
}

- (NSArray)appDownloadVector
{
  return self->_appDownloadVector;
}

- (NSArray)appUsageVector
{
  return self->_appUsageVector;
}

- (void)setHasErrorCode:(BOOL)a3
{
  self->_hasErrorCode = a3;
}

- (BOOL)hasErrorCode
{
  return self->_hasErrorCode;
}

- (double)errorCode
{
  return self->_errorCode;
}

- (void)setHasInstalled:(BOOL)a3
{
  self->_hasInstalled = a3;
}

- (BOOL)hasInstalled
{
  return self->_hasInstalled;
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setHasDupe:(BOOL)a3
{
  self->_hasDupe = a3;
}

- (BOOL)hasDupe
{
  return self->_hasDupe;
}

- (BOOL)dupe
{
  return self->_dupe;
}

- (void)setHasTapped:(BOOL)a3
{
  self->_hasTapped = a3;
}

- (BOOL)hasTapped
{
  return self->_hasTapped;
}

- (BOOL)tapped
{
  return self->_tapped;
}

- (void)setHasImpressed:(BOOL)a3
{
  self->_hasImpressed = a3;
}

- (BOOL)hasImpressed
{
  return self->_hasImpressed;
}

- (BOOL)impressed
{
  return self->_impressed;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)deploymentID
{
  return self->_deploymentID;
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
    v6 = [(BMAdPlatformsTrainingRows *)self deploymentID];
    uint64_t v7 = [v5 deploymentID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAdPlatformsTrainingRows *)self deploymentID];
      v10 = [v5 deploymentID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_62;
      }
    }
    v13 = [(BMAdPlatformsTrainingRows *)self experimentID];
    uint64_t v14 = [v5 experimentID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAdPlatformsTrainingRows *)self experimentID];
      v17 = [v5 experimentID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_62;
      }
    }
    v19 = [(BMAdPlatformsTrainingRows *)self treatmentID];
    uint64_t v20 = [v5 treatmentID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMAdPlatformsTrainingRows *)self treatmentID];
      v23 = [v5 treatmentID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_62;
      }
    }
    v25 = [(BMAdPlatformsTrainingRows *)self adamID];
    uint64_t v26 = [v5 adamID];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMAdPlatformsTrainingRows *)self adamID];
      v29 = [v5 adamID];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_62;
      }
    }
    if ([(BMAdPlatformsTrainingRows *)self hasImpressed]
      || [v5 hasImpressed])
    {
      if (![(BMAdPlatformsTrainingRows *)self hasImpressed]) {
        goto LABEL_62;
      }
      if (![v5 hasImpressed]) {
        goto LABEL_62;
      }
      int v31 = [(BMAdPlatformsTrainingRows *)self impressed];
      if (v31 != [v5 impressed]) {
        goto LABEL_62;
      }
    }
    if (-[BMAdPlatformsTrainingRows hasTapped](self, "hasTapped") || [v5 hasTapped])
    {
      if (![(BMAdPlatformsTrainingRows *)self hasTapped]) {
        goto LABEL_62;
      }
      if (![v5 hasTapped]) {
        goto LABEL_62;
      }
      int v32 = [(BMAdPlatformsTrainingRows *)self tapped];
      if (v32 != [v5 tapped]) {
        goto LABEL_62;
      }
    }
    if (-[BMAdPlatformsTrainingRows hasDupe](self, "hasDupe") || [v5 hasDupe])
    {
      if (![(BMAdPlatformsTrainingRows *)self hasDupe]) {
        goto LABEL_62;
      }
      if (![v5 hasDupe]) {
        goto LABEL_62;
      }
      int v33 = [(BMAdPlatformsTrainingRows *)self dupe];
      if (v33 != [v5 dupe]) {
        goto LABEL_62;
      }
    }
    if ([(BMAdPlatformsTrainingRows *)self hasInstalled]
      || [v5 hasInstalled])
    {
      if (![(BMAdPlatformsTrainingRows *)self hasInstalled]) {
        goto LABEL_62;
      }
      if (![v5 hasInstalled]) {
        goto LABEL_62;
      }
      int v34 = [(BMAdPlatformsTrainingRows *)self installed];
      if (v34 != [v5 installed]) {
        goto LABEL_62;
      }
    }
    if ([(BMAdPlatformsTrainingRows *)self hasErrorCode]
      || [v5 hasErrorCode])
    {
      if (![(BMAdPlatformsTrainingRows *)self hasErrorCode]) {
        goto LABEL_62;
      }
      if (![v5 hasErrorCode]) {
        goto LABEL_62;
      }
      [(BMAdPlatformsTrainingRows *)self errorCode];
      double v36 = v35;
      [v5 errorCode];
      if (v36 != v37) {
        goto LABEL_62;
      }
    }
    v38 = [(BMAdPlatformsTrainingRows *)self appUsageVector];
    uint64_t v39 = [v5 appUsageVector];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMAdPlatformsTrainingRows *)self appUsageVector];
      v42 = [v5 appUsageVector];
      int v43 = [v41 isEqual:v42];

      if (!v43) {
        goto LABEL_62;
      }
    }
    v44 = [(BMAdPlatformsTrainingRows *)self appDownloadVector];
    uint64_t v45 = [v5 appDownloadVector];
    if (v44 == (void *)v45)
    {
    }
    else
    {
      v46 = (void *)v45;
      v47 = [(BMAdPlatformsTrainingRows *)self appDownloadVector];
      v48 = [v5 appDownloadVector];
      int v49 = [v47 isEqual:v48];

      if (!v49) {
        goto LABEL_62;
      }
    }
    v50 = [(BMAdPlatformsTrainingRows *)self installedAppVector];
    uint64_t v51 = [v5 installedAppVector];
    if (v50 == (void *)v51)
    {
    }
    else
    {
      v52 = (void *)v51;
      v53 = [(BMAdPlatformsTrainingRows *)self installedAppVector];
      v54 = [v5 installedAppVector];
      int v55 = [v53 isEqual:v54];

      if (!v55) {
        goto LABEL_62;
      }
    }
    v56 = [(BMAdPlatformsTrainingRows *)self userQueryVector];
    uint64_t v57 = [v5 userQueryVector];
    if (v56 == (void *)v57)
    {
    }
    else
    {
      v58 = (void *)v57;
      v59 = [(BMAdPlatformsTrainingRows *)self userQueryVector];
      v60 = [v5 userQueryVector];
      int v61 = [v59 isEqual:v60];

      if (!v61) {
        goto LABEL_62;
      }
    }
    v62 = [(BMAdPlatformsTrainingRows *)self serverResponse];
    uint64_t v63 = [v5 serverResponse];
    if (v62 == (void *)v63)
    {
    }
    else
    {
      v64 = (void *)v63;
      v65 = [(BMAdPlatformsTrainingRows *)self serverResponse];
      v66 = [v5 serverResponse];
      int v67 = [v65 isEqual:v66];

      if (!v67)
      {
LABEL_62:
        char v12 = 0;
LABEL_63:

        goto LABEL_64;
      }
    }
    v69 = [(BMAdPlatformsTrainingRows *)self recordID];
    v70 = [v5 recordID];
    if (v69 == v70)
    {
      char v12 = 1;
    }
    else
    {
      v71 = [(BMAdPlatformsTrainingRows *)self recordID];
      v72 = [v5 recordID];
      char v12 = [v71 isEqual:v72];
    }
    goto LABEL_63;
  }
  char v12 = 0;
LABEL_64:

  return v12;
}

- (id)jsonDictionary
{
  v57[15] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMAdPlatformsTrainingRows *)self deploymentID];
  uint64_t v4 = [(BMAdPlatformsTrainingRows *)self experimentID];
  uint64_t v5 = [(BMAdPlatformsTrainingRows *)self treatmentID];
  uint64_t v6 = [(BMAdPlatformsTrainingRows *)self adamID];
  if ([(BMAdPlatformsTrainingRows *)self hasImpressed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows impressed](self, "impressed"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMAdPlatformsTrainingRows *)self hasTapped])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows tapped](self, "tapped"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMAdPlatformsTrainingRows *)self hasDupe])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows dupe](self, "dupe"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMAdPlatformsTrainingRows *)self hasInstalled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows installed](self, "installed"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  if (![(BMAdPlatformsTrainingRows *)self hasErrorCode]
    || ([(BMAdPlatformsTrainingRows *)self errorCode], fabs(v11) == INFINITY))
  {
    id v55 = 0;
  }
  else
  {
    [(BMAdPlatformsTrainingRows *)self errorCode];
    char v12 = NSNumber;
    [(BMAdPlatformsTrainingRows *)self errorCode];
    objc_msgSend(v12, "numberWithDouble:");
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  v54 = [(BMAdPlatformsTrainingRows *)self _appUsageVectorJSONArray];
  v53 = [(BMAdPlatformsTrainingRows *)self _appDownloadVectorJSONArray];
  v52 = [(BMAdPlatformsTrainingRows *)self _installedAppVectorJSONArray];
  uint64_t v51 = [(BMAdPlatformsTrainingRows *)self _userQueryVectorJSONArray];
  v13 = [(BMAdPlatformsTrainingRows *)self serverResponse];
  v50 = [v13 base64EncodedStringWithOptions:0];

  uint64_t v14 = [(BMAdPlatformsTrainingRows *)self recordID];
  v56[0] = @"deploymentID";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v43 = (void *)v15;
  v57[0] = v15;
  v56[1] = @"experimentID";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v16;
  v57[1] = v16;
  v56[2] = @"treatmentID";
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v17;
  v57[2] = v17;
  v56[3] = @"adamID";
  uint64_t v18 = v6;
  if (!v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v18;
  v57[3] = v18;
  v56[4] = @"impressed";
  uint64_t v19 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v39 = (void *)v19;
  v57[4] = v19;
  v56[5] = @"tapped";
  uint64_t v20 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v20;
  v57[5] = v20;
  v56[6] = @"dupe";
  uint64_t v21 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = v9;
  v47 = v8;
  double v37 = (void *)v21;
  v57[6] = v21;
  v56[7] = @"installed";
  uint64_t v22 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v5;
  double v36 = (void *)v22;
  v57[7] = v22;
  v56[8] = @"errorCode";
  uint64_t v24 = (uint64_t)v55;
  if (!v55)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v34 = v24;
  v57[8] = v24;
  v56[9] = @"appUsageVector";
  v25 = v54;
  if (!v54)
  {
    v25 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v24, v36, v37, v38, v39, v40, v41, v42, v43);
  }
  v48 = (void *)v3;
  int v49 = (void *)v6;
  v57[9] = v25;
  v56[10] = @"appDownloadVector";
  uint64_t v26 = v53;
  if (!v53)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v45 = v7;
  v27 = (void *)v4;
  v57[10] = v26;
  v56[11] = @"installedAppVector";
  v28 = v52;
  if (!v52)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = v23;
  v57[11] = v28;
  v56[12] = @"userQueryVector";
  int v30 = v51;
  if (!v51)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[12] = v30;
  v56[13] = @"serverResponse";
  int v31 = v50;
  if (!v50)
  {
    int v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[13] = v31;
  v56[14] = @"recordID";
  int v32 = v14;
  if (!v14)
  {
    int v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[14] = v32;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v57, v56, 15, v34);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14) {

  }
  if (!v50) {
  if (!v51)
  }

  if (!v52) {
  if (!v53)
  }

  if (!v54) {
  if (!v55)
  }

  if (!v10) {
  if (v46)
  }
  {
    if (v47) {
      goto LABEL_65;
    }
  }
  else
  {

    if (v47)
    {
LABEL_65:
      if (v45) {
        goto LABEL_66;
      }
      goto LABEL_75;
    }
  }

  if (v45)
  {
LABEL_66:
    if (v49) {
      goto LABEL_67;
    }
    goto LABEL_76;
  }
LABEL_75:

  if (v49)
  {
LABEL_67:
    if (v29) {
      goto LABEL_68;
    }
    goto LABEL_77;
  }
LABEL_76:

  if (v29)
  {
LABEL_68:
    if (v27) {
      goto LABEL_69;
    }
LABEL_78:

    if (v48) {
      goto LABEL_70;
    }
    goto LABEL_79;
  }
LABEL_77:

  if (!v27) {
    goto LABEL_78;
  }
LABEL_69:
  if (v48) {
    goto LABEL_70;
  }
LABEL_79:

LABEL_70:

  return v44;
}

- (id)_userQueryVectorJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(BMAdPlatformsTrainingRows *)self userQueryVector];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          double v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_installedAppVectorJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(BMAdPlatformsTrainingRows *)self installedAppVector];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          double v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_appDownloadVectorJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(BMAdPlatformsTrainingRows *)self appDownloadVector];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          double v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_appUsageVectorJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(BMAdPlatformsTrainingRows *)self appUsageVector];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          double v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMAdPlatformsTrainingRows)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v297[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"deploymentID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    [v6 objectForKeyedSubscript:@"experimentID"];
    v231 = id v230 = v8;
    if (!v231 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v231;
LABEL_7:
      double v10 = [v6 objectForKeyedSubscript:@"treatmentID"];
      v229 = a4;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v225 = 0;
        goto LABEL_10;
      }
      uint64_t v24 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v225 = v10;
LABEL_10:
        double v11 = [v6 objectForKeyedSubscript:@"adamID"];
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v227 = 0;
          goto LABEL_13;
        }
        v25 = v7;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v227 = v11;
LABEL_13:
          char v12 = [v6 objectForKeyedSubscript:@"impressed"];
          v222 = v11;
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            long long v13 = v7;
            id v224 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v13 = v7;
            id v224 = v12;
LABEL_16:
            uint64_t v14 = [v6 objectForKeyedSubscript:@"tapped"];
            v218 = self;
            v223 = (void *)v14;
            if (!v14 || (long long v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v221 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v221 = v15;
LABEL_19:
              [v6 objectForKeyedSubscript:@"dupe"];
              v226 = uint64_t v7 = v13;
              if (!v226 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v16 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v226;
LABEL_22:
                uint64_t v17 = [v6 objectForKeyedSubscript:@"installed"];
                v210 = (void *)v17;
                if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v209 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v209 = v18;
LABEL_25:
                  uint64_t v19 = [v6 objectForKeyedSubscript:@"errorCode"];
                  v211 = v10;
                  id v219 = v6;
                  id v203 = v16;
                  v208 = (void *)v19;
                  if (!v19 || (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v202 = 0;
LABEL_28:
                    id v21 = [v6 objectForKeyedSubscript:@"appUsageVector"];
                    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
                    int v23 = [v21 isEqual:v22];

                    if (v23)
                    {
                      v204 = v12;
                      id v201 = v9;

                      id v21 = 0;
LABEL_53:
                      v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
                      long long v244 = 0u;
                      long long v245 = 0u;
                      long long v246 = 0u;
                      long long v247 = 0u;
                      id v21 = v21;
                      uint64_t v48 = [v21 countByEnumeratingWithState:&v244 objects:v277 count:16];
                      if (!v48) {
                        goto LABEL_62;
                      }
                      uint64_t v49 = v48;
                      uint64_t v50 = *(void *)v245;
                      while (1)
                      {
                        for (uint64_t i = 0; i != v49; ++i)
                        {
                          if (*(void *)v245 != v50) {
                            objc_enumerationMutation(v21);
                          }
                          uint64_t v52 = *(void *)(*((void *)&v244 + 1) + 8 * i);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            if (v229)
                            {
                              id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v76 = *MEMORY[0x1E4F502C8];
                              uint64_t v275 = *MEMORY[0x1E4F28568];
                              v216 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"appUsageVector"];
                              v276 = v216;
                              v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v276 forKeys:&v275 count:1];
                              v78 = v75;
                              uint64_t v79 = v76;
LABEL_81:
                              id v9 = v201;
                              double v35 = v225;
                              double v11 = v222;
                              int v30 = 0;
                              id *v229 = (id)[v78 initWithDomain:v79 code:2 userInfo:v77];
                              obuint64_t j = v21;
                              goto LABEL_82;
                            }
LABEL_86:
                            int v30 = 0;
                            obuint64_t j = v21;
                            id v9 = v201;
                            double v35 = v225;
                            double v11 = v222;
                            goto LABEL_87;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (v229)
                            {
                              id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v87 = *MEMORY[0x1E4F502C8];
                              uint64_t v273 = *MEMORY[0x1E4F28568];
                              v216 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appUsageVector"];
                              v274 = v216;
                              v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v274 forKeys:&v273 count:1];
                              v78 = v86;
                              uint64_t v79 = v87;
                              goto LABEL_81;
                            }
                            goto LABEL_86;
                          }
                          [v47 addObject:v52];
                        }
                        uint64_t v49 = [v21 countByEnumeratingWithState:&v244 objects:v277 count:16];
                        if (!v49)
                        {
LABEL_62:

                          v53 = [v6 objectForKeyedSubscript:@"appDownloadVector"];
                          v54 = [MEMORY[0x1E4F1CA98] null];
                          int v55 = [v53 isEqual:v54];

                          if (v55)
                          {

                            v53 = 0;
                            double v11 = v222;
LABEL_94:
                            v216 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v53, "count"));
                            long long v240 = 0u;
                            long long v241 = 0u;
                            long long v242 = 0u;
                            long long v243 = 0u;
                            obuint64_t j = v53;
                            uint64_t v105 = [obj countByEnumeratingWithState:&v240 objects:v270 count:16];
                            if (!v105) {
                              goto LABEL_103;
                            }
                            uint64_t v106 = v105;
                            uint64_t v107 = *(void *)v241;
                            while (1)
                            {
                              for (uint64_t j = 0; j != v106; ++j)
                              {
                                if (*(void *)v241 != v107) {
                                  objc_enumerationMutation(obj);
                                }
                                uint64_t v109 = *(void *)(*((void *)&v240 + 1) + 8 * j);
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  if (v229)
                                  {
                                    id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v119 = *MEMORY[0x1E4F502C8];
                                    uint64_t v268 = *MEMORY[0x1E4F28568];
                                    v200 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"appDownloadVector"];
                                    v269 = v200;
                                    uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
                                    v121 = v118;
                                    uint64_t v122 = v119;
LABEL_114:
                                    id v198 = (id)v120;
                                    double v35 = v225;
                                    double v11 = v222;
                                    char v12 = v204;
                                    int v30 = 0;
                                    id *v229 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v122, 2);
                                    v77 = obj;
                                    id v9 = v201;
                                    goto LABEL_115;
                                  }
LABEL_119:
                                  int v30 = 0;
                                  v77 = obj;
                                  id v9 = v201;
                                  double v35 = v225;
                                  double v11 = v222;
LABEL_82:
                                  id v16 = v203;
                                  char v12 = v204;
                                  goto LABEL_186;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (v229)
                                  {
                                    id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v124 = *MEMORY[0x1E4F502C8];
                                    uint64_t v266 = *MEMORY[0x1E4F28568];
                                    v200 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"appDownloadVector"];
                                    v267 = v200;
                                    uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v267 forKeys:&v266 count:1];
                                    v121 = v123;
                                    uint64_t v122 = v124;
                                    goto LABEL_114;
                                  }
                                  goto LABEL_119;
                                }
                                [v216 addObject:v109];
                              }
                              uint64_t v106 = [obj countByEnumeratingWithState:&v240 objects:v270 count:16];
                              double v11 = v222;
                              if (!v106)
                              {
LABEL_103:

                                v110 = [v6 objectForKeyedSubscript:@"installedAppVector"];
                                v111 = [MEMORY[0x1E4F1CA98] null];
                                int v112 = [v110 isEqual:v111];

                                if (v112)
                                {

                                  goto LABEL_124;
                                }
                                if (v110)
                                {
                                  objc_opt_class();
                                  id v199 = v110;
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v229)
                                    {
                                      int v30 = 0;
                                      id v9 = v201;
                                      double v35 = v225;
                                      id v16 = v203;
                                      char v12 = v204;
                                      v77 = v199;
                                      goto LABEL_186;
                                    }
                                    id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v157 = *MEMORY[0x1E4F502C8];
                                    uint64_t v264 = *MEMORY[0x1E4F28568];
                                    v200 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"installedAppVector"];
                                    v265 = v200;
                                    id v198 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
                                    int v30 = 0;
                                    id *v229 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v157, 2);
                                    id v9 = v201;
                                    double v35 = v225;
                                    id v16 = v203;
                                    char v12 = v204;
LABEL_164:
                                    v77 = v199;
                                    goto LABEL_185;
                                  }
                                  v125 = v110;
                                }
                                else
                                {
LABEL_124:
                                  v125 = 0;
                                }
                                v200 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v125, "count"));
                                long long v236 = 0u;
                                long long v237 = 0u;
                                long long v238 = 0u;
                                long long v239 = 0u;
                                id v199 = v125;
                                uint64_t v126 = [v199 countByEnumeratingWithState:&v236 objects:v263 count:16];
                                if (!v126) {
                                  goto LABEL_134;
                                }
                                uint64_t v127 = v126;
                                uint64_t v128 = *(void *)v237;
                                while (1)
                                {
                                  for (uint64_t k = 0; k != v127; ++k)
                                  {
                                    if (*(void *)v237 != v128) {
                                      objc_enumerationMutation(v199);
                                    }
                                    uint64_t v130 = *(void *)(*((void *)&v236 + 1) + 8 * k);
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      if (v229)
                                      {
                                        id v137 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v138 = *MEMORY[0x1E4F502C8];
                                        uint64_t v261 = *MEMORY[0x1E4F28568];
                                        v197 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"installedAppVector"];
                                        v262 = v197;
                                        uint64_t v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v262 forKeys:&v261 count:1];
                                        v140 = v137;
                                        uint64_t v141 = v138;
LABEL_142:
                                        id v195 = (id)v139;
                                        double v35 = v225;
                                        double v11 = v222;
                                        char v12 = v204;
                                        int v30 = 0;
                                        id *v229 = (id)objc_msgSend(v140, "initWithDomain:code:userInfo:", v141, 2);
                                        v77 = v199;
                                        id v198 = v199;
                                        id v9 = v201;
                                        id v16 = v203;
                                        goto LABEL_183;
                                      }
LABEL_143:
                                      int v30 = 0;
                                      v77 = v199;
                                      id v198 = v199;
                                      id v9 = v201;
                                      double v35 = v225;
                                      double v11 = v222;
                                      char v12 = v204;
LABEL_115:
                                      id v16 = v203;
                                      goto LABEL_185;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (v229)
                                      {
                                        id v142 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v143 = *MEMORY[0x1E4F502C8];
                                        uint64_t v259 = *MEMORY[0x1E4F28568];
                                        v197 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"installedAppVector"];
                                        v260 = v197;
                                        uint64_t v139 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v260 forKeys:&v259 count:1];
                                        v140 = v142;
                                        uint64_t v141 = v143;
                                        goto LABEL_142;
                                      }
                                      goto LABEL_143;
                                    }
                                    [v200 addObject:v130];
                                  }
                                  uint64_t v127 = [v199 countByEnumeratingWithState:&v236 objects:v263 count:16];
                                  double v11 = v222;
                                  if (!v127)
                                  {
LABEL_134:

                                    v131 = [v6 objectForKeyedSubscript:@"userQueryVector"];
                                    v132 = [MEMORY[0x1E4F1CA98] null];
                                    int v133 = [v131 isEqual:v132];

                                    if (v133)
                                    {

                                      v131 = 0;
                                      goto LABEL_149;
                                    }
                                    if (v131)
                                    {
                                      objc_opt_class();
                                      id v16 = v203;
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        id v198 = v131;
                                        if (v229)
                                        {
                                          id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v145 = *MEMORY[0x1E4F502C8];
                                          uint64_t v257 = *MEMORY[0x1E4F28568];
                                          v197 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"userQueryVector"];
                                          v258 = v197;
                                          uint64_t v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
                                          uint64_t v147 = v145;
                                          id v16 = v203;
                                          int v30 = 0;
                                          id *v229 = (id)[v144 initWithDomain:v147 code:2 userInfo:v146];
                                          v148 = (void *)v146;
                                          id v9 = v201;
                                          double v35 = v225;
                                          char v12 = v204;
                                          v77 = v199;
                                          goto LABEL_184;
                                        }
                                        int v30 = 0;
                                        id v9 = v201;
                                        double v35 = v225;
                                        char v12 = v204;
                                        goto LABEL_164;
                                      }
                                    }
                                    else
                                    {
LABEL_149:
                                      id v16 = v203;
                                    }
                                    v197 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v131, "count"));
                                    long long v232 = 0u;
                                    long long v233 = 0u;
                                    long long v234 = 0u;
                                    long long v235 = 0u;
                                    id v198 = v131;
                                    uint64_t v149 = [v198 countByEnumeratingWithState:&v232 objects:v256 count:16];
                                    if (!v149) {
                                      goto LABEL_159;
                                    }
                                    uint64_t v150 = v149;
                                    uint64_t v151 = *(void *)v233;
LABEL_152:
                                    uint64_t v152 = 0;
                                    while (1)
                                    {
                                      if (*(void *)v233 != v151) {
                                        objc_enumerationMutation(v198);
                                      }
                                      uint64_t v153 = *(void *)(*((void *)&v232 + 1) + 8 * v152);
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass()) {
                                        break;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        if (v229)
                                        {
                                          id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v164 = *MEMORY[0x1E4F502C8];
                                          uint64_t v252 = *MEMORY[0x1E4F28568];
                                          v194 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userQueryVector"];
                                          v253 = v194;
                                          uint64_t v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v253 forKeys:&v252 count:1];
                                          v161 = v163;
                                          uint64_t v162 = v164;
                                          goto LABEL_169;
                                        }
                                        goto LABEL_170;
                                      }
                                      [v197 addObject:v153];
                                      if (v150 == ++v152)
                                      {
                                        uint64_t v150 = [v198 countByEnumeratingWithState:&v232 objects:v256 count:16];
                                        double v11 = v222;
                                        id v16 = v203;
                                        if (v150) {
                                          goto LABEL_152;
                                        }
LABEL_159:

                                        uint64_t v154 = [v6 objectForKeyedSubscript:@"serverResponse"];
                                        v194 = (void *)v154;
                                        if (!v154)
                                        {
                                          id v195 = 0;
                                          id v9 = v201;
                                          char v12 = v204;
                                          goto LABEL_175;
                                        }
                                        v155 = (void *)v154;
                                        objc_opt_class();
                                        id v9 = v201;
                                        char v12 = v204;
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v195 = 0;
                                          goto LABEL_175;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v195 = v155;
LABEL_175:
                                          id v165 = [v6 objectForKeyedSubscript:@"recordID"];
                                          v190 = v165;
                                          if (!v165)
                                          {
LABEL_178:
                                            double v35 = v225;
                                            goto LABEL_179;
                                          }
                                          v166 = v165;
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v165 = 0;
                                            goto LABEL_178;
                                          }
                                          objc_opt_class();
                                          double v35 = v225;
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v165 = v166;
                                            double v11 = v222;
LABEL_179:
                                            v193 = v165;
                                            int v30 = objc_retain(-[BMAdPlatformsTrainingRows initWithDeploymentID:experimentID:treatmentID:adamID:impressed:tapped:dupe:installed:errorCode:appUsageVector:appDownloadVector:installedAppVector:userQueryVector:serverResponse:recordID:](v218, "initWithDeploymentID:experimentID:treatmentID:adamID:impressed:tapped:dupe:installed:errorCode:appUsageVector:appDownloadVector:installedAppVector:userQueryVector:serverResponse:recordID:", v230, v9, v35, v227, v224, v221, v16, v209, v202, v47, v216, v200, v197, v195,
                                                      v165));
                                            v218 = v30;
                                          }
                                          else
                                          {
                                            if (v229)
                                            {
                                              v196 = v7;
                                              id v175 = v9;
                                              id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v177 = v16;
                                              uint64_t v178 = *MEMORY[0x1E4F502C8];
                                              uint64_t v248 = *MEMORY[0x1E4F28568];
                                              v179 = v12;
                                              v180 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recordID"];
                                              v249 = v180;
                                              v181 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v249 forKeys:&v248 count:1];
                                              v182 = v176;
                                              id v9 = v175;
                                              uint64_t v7 = v196;
                                              uint64_t v183 = v178;
                                              id v16 = v177;
                                              double v35 = v225;
                                              id *v229 = (id)[v182 initWithDomain:v183 code:2 userInfo:v181];

                                              char v12 = v179;
                                            }
                                            v193 = 0;
                                            int v30 = 0;
                                            double v11 = v222;
                                          }

LABEL_181:
                                        }
                                        else
                                        {
                                          if (v229)
                                          {
                                            id v168 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v169 = *MEMORY[0x1E4F502C8];
                                            uint64_t v250 = *MEMORY[0x1E4F28568];
                                            id v170 = [NSString alloc];
                                            uint64_t v189 = objc_opt_class();
                                            v171 = v170;
                                            char v12 = v204;
                                            v193 = (void *)[v171 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v189, @"serverResponse"];
                                            v251 = v193;
                                            uint64_t v172 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v251 forKeys:&v250 count:1];
                                            uint64_t v173 = v169;
                                            id v16 = v203;
                                            v191 = (void *)v172;
                                            id v174 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v173, 2);
                                            int v30 = 0;
                                            id v195 = 0;
                                            id *v229 = v174;
                                            double v35 = v225;

                                            goto LABEL_181;
                                          }
                                          id v195 = 0;
                                          int v30 = 0;
                                          double v35 = v225;
                                        }
LABEL_182:

                                        v77 = v199;
LABEL_183:
                                        v148 = v195;
LABEL_184:

LABEL_185:
LABEL_186:

LABEL_187:
LABEL_188:

                                        id v6 = v219;
                                        goto LABEL_189;
                                      }
                                    }
                                    if (v229)
                                    {
                                      id v158 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v159 = *MEMORY[0x1E4F502C8];
                                      uint64_t v254 = *MEMORY[0x1E4F28568];
                                      v194 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"userQueryVector"];
                                      v255 = v194;
                                      uint64_t v160 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v255 forKeys:&v254 count:1];
                                      v161 = v158;
                                      uint64_t v162 = v159;
LABEL_169:
                                      v192 = (void *)v160;
                                      double v35 = v225;
                                      double v11 = v222;
                                      char v12 = v204;
                                      int v30 = 0;
                                      id *v229 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v162, 2);
                                      id v195 = v198;
                                      id v9 = v201;
                                      id v16 = v203;

                                      goto LABEL_182;
                                    }
LABEL_170:
                                    int v30 = 0;
                                    v148 = v198;
                                    v77 = v199;
                                    id v9 = v201;
                                    double v35 = v225;
                                    double v11 = v222;
                                    id v16 = v203;
                                    char v12 = v204;
                                    goto LABEL_184;
                                  }
                                }
                              }
                            }
                          }
                          double v11 = v222;
                          if (!v53) {
                            goto LABEL_94;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            goto LABEL_94;
                          }
                          obuint64_t j = v53;
                          if (v229)
                          {
                            id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v135 = *MEMORY[0x1E4F502C8];
                            uint64_t v271 = *MEMORY[0x1E4F28568];
                            v216 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"appDownloadVector"];
                            v272 = v216;
                            uint64_t v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
                            int v30 = 0;
                            id *v229 = (id)[v134 initWithDomain:v135 code:2 userInfo:v136];
                            v77 = (void *)v136;
                            id v9 = v201;
                            double v35 = v225;
                            goto LABEL_82;
                          }
                          int v30 = 0;
                          id v9 = v201;
                          double v35 = v225;
LABEL_87:
                          id v16 = v203;
                          char v12 = v204;
                          goto LABEL_187;
                        }
                      }
                    }
                    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v204 = v12;
                      id v201 = v9;
                      goto LABEL_53;
                    }
                    if (v229)
                    {
                      id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
                      v114 = v12;
                      uint64_t v115 = *MEMORY[0x1E4F502C8];
                      uint64_t v278 = *MEMORY[0x1E4F28568];
                      v47 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"appUsageVector"];
                      v279 = v47;
                      uint64_t v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
                      uint64_t v117 = v115;
                      char v12 = v114;
                      id obja = (id)v116;
                      int v30 = 0;
                      id *v229 = (id)objc_msgSend(v113, "initWithDomain:code:userInfo:", v117, 2);
                      double v35 = v225;
                      double v11 = v222;
                      id v16 = v203;

                      goto LABEL_188;
                    }
                    int v30 = 0;
                    double v35 = v225;
                    double v11 = v222;
                    id v16 = v203;
LABEL_189:
                    v96 = v202;

                    double v10 = v211;
                    goto LABEL_190;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v202 = v20;
                    goto LABEL_28;
                  }
                  if (v229)
                  {
                    id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                    v98 = v12;
                    uint64_t v99 = *MEMORY[0x1E4F502C8];
                    uint64_t v280 = *MEMORY[0x1E4F28568];
                    v100 = v11;
                    id v101 = [NSString alloc];
                    uint64_t v188 = objc_opt_class();
                    v102 = v101;
                    double v11 = v100;
                    id v21 = (id)[v102 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v188, @"errorCode"];
                    id v281 = v21;
                    uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
                    uint64_t v104 = v99;
                    char v12 = v98;
                    v47 = (void *)v103;
                    id v202 = 0;
                    int v30 = 0;
                    id *v229 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v104, 2);
                    double v35 = v225;
                    goto LABEL_188;
                  }
                  v96 = 0;
                  int v30 = 0;
                  double v35 = v225;
LABEL_190:

                  goto LABEL_191;
                }
                if (v229)
                {
                  id v217 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v207 = v12;
                  v88 = v10;
                  uint64_t v89 = *MEMORY[0x1E4F502C8];
                  uint64_t v282 = *MEMORY[0x1E4F28568];
                  id v90 = v16;
                  id v91 = [NSString alloc];
                  uint64_t v187 = objc_opt_class();
                  v92 = v91;
                  id v16 = v90;
                  uint64_t v93 = [v92 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v187, @"installed"];
                  uint64_t v283 = v93;
                  uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
                  double v11 = v222;
                  uint64_t v95 = v89;
                  double v10 = v88;
                  char v12 = v207;
                  v208 = (void *)v94;
                  id v209 = 0;
                  int v30 = 0;
                  id *v229 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v95, 2);
                  v96 = (void *)v93;
                  double v35 = v225;
                  goto LABEL_190;
                }
                id v209 = 0;
                int v30 = 0;
LABEL_117:
                double v35 = v225;
LABEL_191:

                goto LABEL_192;
              }
              if (v229)
              {
                id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                v206 = v12;
                v81 = v10;
                uint64_t v82 = *MEMORY[0x1E4F502C8];
                uint64_t v284 = *MEMORY[0x1E4F28568];
                id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dupe"];
                id v285 = v209;
                uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v285 forKeys:&v284 count:1];
                v84 = v80;
                double v11 = v222;
                uint64_t v85 = v82;
                double v10 = v81;
                char v12 = v206;
                v210 = (void *)v83;
                id v16 = 0;
                int v30 = 0;
                id *v229 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v85, 2);
                goto LABEL_117;
              }
              id v16 = 0;
              int v30 = 0;
              double v35 = v225;
LABEL_192:

              self = v218;
              goto LABEL_193;
            }
            if (v229)
            {
              id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
              v205 = v12;
              v71 = v10;
              uint64_t v72 = *MEMORY[0x1E4F502C8];
              uint64_t v286 = *MEMORY[0x1E4F28568];
              id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tapped"];
              id v287 = v16;
              v226 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v286 count:1];
              v73 = v70;
              double v11 = v222;
              uint64_t v74 = v72;
              double v10 = v71;
              char v12 = v205;
              id v221 = 0;
              int v30 = 0;
              id *v229 = (id)[v73 initWithDomain:v74 code:2 userInfo:v226];
              double v35 = v225;
              uint64_t v7 = v13;
              goto LABEL_192;
            }
            id v221 = 0;
            int v30 = 0;
            double v35 = v225;
            uint64_t v7 = v13;
LABEL_193:

            goto LABEL_194;
          }
          if (v229)
          {
            id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
            v213 = v10;
            uint64_t v64 = *MEMORY[0x1E4F502C8];
            uint64_t v288 = *MEMORY[0x1E4F28568];
            v65 = self;
            id v66 = [NSString alloc];
            uint64_t v186 = objc_opt_class();
            int v67 = v66;
            self = v65;
            id v221 = (id)[v67 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v186, @"impressed"];
            id v289 = v221;
            uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v289 forKeys:&v288 count:1];
            double v11 = v222;
            uint64_t v69 = v64;
            double v10 = v213;
            v223 = (void *)v68;
            id v224 = 0;
            int v30 = 0;
            id *v229 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v69, 2);
            double v35 = v225;
            goto LABEL_193;
          }
          id v224 = 0;
          int v30 = 0;
          double v35 = v225;
LABEL_194:

          goto LABEL_195;
        }
        if (v229)
        {
          id v228 = objc_alloc(MEMORY[0x1E4F28C58]);
          v212 = v10;
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v290 = *MEMORY[0x1E4F28568];
          uint64_t v57 = self;
          id v58 = [NSString alloc];
          uint64_t v185 = objc_opt_class();
          v59 = v58;
          self = v57;
          id v224 = (id)[v59 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v185, @"adamID"];
          id v291 = v224;
          uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v291 forKeys:&v290 count:1];
          uint64_t v61 = v56;
          double v10 = v212;
          id v62 = (id)[v228 initWithDomain:v61 code:2 userInfo:v60];
          id v227 = 0;
          int v30 = 0;
          id *v229 = v62;
          uint64_t v7 = v25;
          char v12 = (void *)v60;
          double v35 = v225;
          goto LABEL_194;
        }
        id v227 = 0;
        int v30 = 0;
        double v35 = v225;
LABEL_195:

        goto LABEL_196;
      }
      if (a4)
      {
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v220 = v6;
        uint64_t v39 = a4;
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v292 = *MEMORY[0x1E4F28568];
        v41 = self;
        id v42 = [NSString alloc];
        uint64_t v184 = objc_opt_class();
        int v43 = v42;
        self = v41;
        id v227 = (id)[v43 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v184, @"treatmentID"];
        id v293 = v227;
        uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v293 forKeys:&v292 count:1];
        uint64_t v45 = v40;
        double v11 = (void *)v44;
        id v46 = (id)[v38 initWithDomain:v45 code:2 userInfo:v44];
        double v35 = 0;
        int v30 = 0;
        *uint64_t v39 = v46;
        id v6 = v220;
        uint64_t v7 = v24;
        goto LABEL_195;
      }
      double v35 = 0;
      int v30 = 0;
LABEL_196:

      id v8 = v230;
      goto LABEL_197;
    }
    if (a4)
    {
      id v31 = v6;
      int v32 = a4;
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v294 = *MEMORY[0x1E4F28568];
      double v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"experimentID"];
      v295 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v295 forKeys:&v294 count:1];
      uint64_t v37 = v34;
      double v10 = (void *)v36;
      id v9 = 0;
      int v30 = 0;
      *int v32 = (id)[v33 initWithDomain:v37 code:2 userInfo:v36];
      id v6 = v31;
      goto LABEL_196;
    }
    id v9 = 0;
    int v30 = 0;
LABEL_197:

    goto LABEL_198;
  }
  if (a4)
  {
    id v26 = v6;
    v27 = a4;
    id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F502C8];
    uint64_t v296 = *MEMORY[0x1E4F28568];
    id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deploymentID"];
    v297[0] = v9;
    v231 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v297 forKeys:&v296 count:1];
    id v8 = 0;
    int v30 = 0;
    id *v27 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
    id v6 = v26;
    goto LABEL_197;
  }
  id v8 = 0;
  int v30 = 0;
LABEL_198:

  return v30;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMAdPlatformsTrainingRows *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_deploymentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_experimentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_treatmentID) {
    PBDataWriterWriteStringField();
  }
  if (self->_adamID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasImpressed) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasTapped) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasDupe) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasInstalled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasErrorCode) {
    PBDataWriterWriteDoubleField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = self->_appUsageVector;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v9) doubleValue];
        PBDataWriterWriteDoubleField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v10 = self->_appDownloadVector;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v14) doubleValue];
        PBDataWriterWriteDoubleField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v15 = self->_installedAppVector;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v19) doubleValue];
        PBDataWriterWriteDoubleField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = self->_userQueryVector;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24), "doubleValue", (void)v25);
        PBDataWriterWriteDoubleField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if (self->_serverResponse) {
    PBDataWriterWriteDataField();
  }
  if (self->_recordID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)BMAdPlatformsTrainingRows;
  uint64_t v5 = [(BMEventBase *)&v95 init];
  if (!v5) {
    goto LABEL_107;
  }
  uint64_t v94 = objc_opt_new();
  v92 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  double v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          uint64_t v20 = *v10;
          int v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      uint64_t v20 = *v10;
      int v21 = v4[v20];
      if (v4[v20]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v21 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 32;
          goto LABEL_71;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 40;
          goto LABEL_71;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_71;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_71;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasImpressed = 1;
          while (2)
          {
            uint64_t v28 = *v8;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v11] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v19 = v26++ >= 9;
                if (v19)
                {
                  uint64_t v27 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v27 = 0;
          }
LABEL_75:
          BOOL v73 = v27 != 0;
          uint64_t v74 = 16;
          goto LABEL_88;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasTapped = 1;
          while (2)
          {
            uint64_t v35 = *v8;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v11] + v36);
              *(void *)&v4[v35] = v37;
              v34 |= (unint64_t)(v38 & 0x7F) << v32;
              if (v38 < 0)
              {
                v32 += 7;
                BOOL v19 = v33++ >= 9;
                if (v19)
                {
                  uint64_t v34 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v34 = 0;
          }
LABEL_79:
          BOOL v73 = v34 != 0;
          uint64_t v74 = 18;
          goto LABEL_88;
        case 7u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          v5->_hasDupe = 1;
          while (2)
          {
            uint64_t v42 = *v8;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v4[*v11] + v43);
              *(void *)&v4[v42] = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                BOOL v19 = v40++ >= 9;
                if (v19)
                {
                  uint64_t v41 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v41 = 0;
          }
LABEL_83:
          BOOL v73 = v41 != 0;
          uint64_t v74 = 20;
          goto LABEL_88;
        case 8u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v48 = 0;
          v5->_hasInstalled = 1;
          break;
        case 9u:
          v5->_hasErrorCode = 1;
          uint64_t v53 = *v8;
          unint64_t v54 = *(void *)&v4[v53];
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)&v4[*v9])
          {
            double v55 = *(double *)(*(void *)&v4[*v11] + v54);
            *(void *)&v4[v53] = v54 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v55 = 0.0;
          }
          v5->_errorCode = v55;
          continue;
        case 0xAu:
          uint64_t v56 = NSNumber;
          uint64_t v57 = *v8;
          unint64_t v58 = *(void *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(void *)&v4[*v9])
          {
            double v59 = *(double *)(*(void *)&v4[*v11] + v58);
            *(void *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[v20] = 1;
            double v59 = 0.0;
          }
          uint64_t v75 = objc_msgSend(v56, "numberWithDouble:", v59, v92);
          if (!v75) {
            goto LABEL_109;
          }
          uint64_t v76 = (void *)v75;
          v77 = v94;
          goto LABEL_103;
        case 0xBu:
          uint64_t v60 = NSNumber;
          uint64_t v61 = *v8;
          unint64_t v62 = *(void *)&v4[v61];
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(void *)&v4[*v9])
          {
            double v63 = *(double *)(*(void *)&v4[*v11] + v62);
            *(void *)&v4[v61] = v62 + 8;
          }
          else
          {
            v4[v20] = 1;
            double v63 = 0.0;
          }
          uint64_t v78 = objc_msgSend(v60, "numberWithDouble:", v63, v92);
          if (!v78) {
            goto LABEL_109;
          }
          uint64_t v76 = (void *)v78;
          v77 = v92;
          goto LABEL_103;
        case 0xCu:
          uint64_t v64 = NSNumber;
          uint64_t v65 = *v8;
          unint64_t v66 = *(void *)&v4[v65];
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)&v4[*v9])
          {
            double v67 = *(double *)(*(void *)&v4[*v11] + v66);
            *(void *)&v4[v65] = v66 + 8;
          }
          else
          {
            v4[v20] = 1;
            double v67 = 0.0;
          }
          uint64_t v79 = objc_msgSend(v64, "numberWithDouble:", v67, v92);
          if (!v79) {
            goto LABEL_109;
          }
          uint64_t v76 = (void *)v79;
          v77 = v6;
          goto LABEL_103;
        case 0xDu:
          uint64_t v68 = NSNumber;
          uint64_t v69 = *v8;
          unint64_t v70 = *(void *)&v4[v69];
          if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(void *)&v4[*v9])
          {
            double v71 = *(double *)(*(void *)&v4[*v11] + v70);
            *(void *)&v4[v69] = v70 + 8;
          }
          else
          {
            v4[v20] = 1;
            double v71 = 0.0;
          }
          uint64_t v80 = objc_msgSend(v68, "numberWithDouble:", v71, v92);
          if (!v80) {
            goto LABEL_109;
          }
          uint64_t v76 = (void *)v80;
          v77 = v7;
LABEL_103:
          [v77 addObject:v76];

          continue;
        case 0xEu:
          uint64_t v23 = PBReaderReadData();
          uint64_t v24 = 104;
          goto LABEL_71;
        case 0xFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
LABEL_71:
          uint64_t v72 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_109:

          goto LABEL_106;
      }
      while (1)
      {
        uint64_t v49 = *v8;
        uint64_t v50 = *(void *)&v4[v49];
        unint64_t v51 = v50 + 1;
        if (v50 == -1 || v51 > *(void *)&v4[*v9]) {
          break;
        }
        char v52 = *(unsigned char *)(*(void *)&v4[*v11] + v50);
        *(void *)&v4[v49] = v51;
        v48 |= (unint64_t)(v52 & 0x7F) << v46;
        if ((v52 & 0x80) == 0) {
          goto LABEL_85;
        }
        v46 += 7;
        BOOL v19 = v47++ >= 9;
        if (v19)
        {
          uint64_t v48 = 0;
          goto LABEL_87;
        }
      }
      v4[*v10] = 1;
LABEL_85:
      if (v4[*v10]) {
        uint64_t v48 = 0;
      }
LABEL_87:
      BOOL v73 = v48 != 0;
      uint64_t v74 = 22;
LABEL_88:
      *((unsigned char *)&v5->super.super.isa + v74) = v73;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v81 = objc_msgSend(v94, "copy", v92);
  appUsageVector = v5->_appUsageVector;
  v5->_appUsageVector = (NSArray *)v81;

  uint64_t v83 = [v93 copy];
  appDownloadVector = v5->_appDownloadVector;
  v5->_appDownloadVector = (NSArray *)v83;

  uint64_t v85 = [v6 copy];
  installedAppVector = v5->_installedAppVector;
  v5->_installedAppVector = (NSArray *)v85;

  uint64_t v87 = [v7 copy];
  userQueryVector = v5->_userQueryVector;
  v5->_userQueryVector = (NSArray *)v87;

  int v89 = v4[*v10];
  if (v89) {
LABEL_106:
  }
    id v90 = 0;
  else {
LABEL_107:
  }
    id v90 = v5;

  return v90;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v17 = [(BMAdPlatformsTrainingRows *)self deploymentID];
  int v21 = [(BMAdPlatformsTrainingRows *)self experimentID];
  uint64_t v16 = [(BMAdPlatformsTrainingRows *)self treatmentID];
  uint64_t v15 = [(BMAdPlatformsTrainingRows *)self adamID];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows impressed](self, "impressed"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows tapped](self, "tapped"));
  unsigned int v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows dupe](self, "dupe"));
  char v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMAdPlatformsTrainingRows installed](self, "installed"));
  uint64_t v3 = NSNumber;
  [(BMAdPlatformsTrainingRows *)self errorCode];
  uint64_t v11 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = [(BMAdPlatformsTrainingRows *)self appUsageVector];
  uint64_t v5 = [(BMAdPlatformsTrainingRows *)self appDownloadVector];
  uint64_t v6 = [(BMAdPlatformsTrainingRows *)self installedAppVector];
  uint64_t v7 = [(BMAdPlatformsTrainingRows *)self userQueryVector];
  uint64_t v8 = [(BMAdPlatformsTrainingRows *)self serverResponse];
  uint64_t v9 = [(BMAdPlatformsTrainingRows *)self recordID];
  BOOL v19 = (void *)[v18 initWithFormat:@"BMAdPlatformsTrainingRows with deploymentID: %@, experimentID: %@, treatmentID: %@, adamID: %@, impressed: %@, tapped: %@, dupe: %@, installed: %@, errorCode: %@, appUsageVector: %@, appDownloadVector: %@, installedAppVector: %@, userQueryVector: %@, serverResponse: %@, recordID: %@", v17, v21, v16, v15, v20, v14, v13, v12, v11, v4, v5, v6, v7, v8, v9];

  return (NSString *)v19;
}

- (BMAdPlatformsTrainingRows)initWithDeploymentID:(id)a3 experimentID:(id)a4 treatmentID:(id)a5 adamID:(id)a6 impressed:(id)a7 tapped:(id)a8 dupe:(id)a9 installed:(id)a10 errorCode:(id)a11 appUsageVector:(id)a12 appDownloadVector:(id)a13 installedAppVector:(id)a14 userQueryVector:(id)a15 serverResponse:(id)a16 recordID:(id)a17
{
  id v46 = a3;
  id v35 = a4;
  id v45 = a4;
  id v36 = a5;
  id v44 = a5;
  id v37 = a6;
  id v43 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  uint64_t v24 = v22;
  id v25 = a10;
  unsigned int v26 = v21;
  id v27 = a11;
  id v42 = a12;
  id v28 = a13;
  id v29 = a14;
  id v41 = a15;
  id v39 = a16;
  id v30 = a17;
  v47.receiver = self;
  v47.super_class = (Class)BMAdPlatformsTrainingRows;
  char v31 = [(BMEventBase *)&v47 init];
  if (v31)
  {
    v31->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v31->_deploymentID, a3);
    objc_storeStrong((id *)&v31->_experimentID, v35);
    objc_storeStrong((id *)&v31->_treatmentID, v36);
    objc_storeStrong((id *)&v31->_adamID, v37);
    if (v26)
    {
      v31->_hasImpressed = 1;
      v31->_impressed = [v26 BOOLValue];
    }
    else
    {
      v31->_hasImpressed = 0;
      v31->_impressed = 0;
    }
    if (v24)
    {
      v31->_hasTapped = 1;
      v31->_tapped = [v24 BOOLValue];
    }
    else
    {
      v31->_hasTapped = 0;
      v31->_tapped = 0;
    }
    if (v23)
    {
      v31->_hasDupe = 1;
      v31->_dupe = [v23 BOOLValue];
    }
    else
    {
      v31->_hasDupe = 0;
      v31->_dupe = 0;
    }
    if (v25)
    {
      v31->_hasInstalled = 1;
      v31->_installed = [v25 BOOLValue];
    }
    else
    {
      v31->_hasInstalled = 0;
      v31->_installed = 0;
    }
    if (v27)
    {
      v31->_hasErrorCode = 1;
      [v27 doubleValue];
    }
    else
    {
      v31->_hasErrorCode = 0;
      double v32 = -1.0;
    }
    v31->_errorCode = v32;
    objc_storeStrong((id *)&v31->_appUsageVector, a12);
    objc_storeStrong((id *)&v31->_appDownloadVector, a13);
    objc_storeStrong((id *)&v31->_installedAppVector, a14);
    objc_storeStrong((id *)&v31->_userQueryVector, a15);
    objc_storeStrong((id *)&v31->_serverResponse, a16);
    objc_storeStrong((id *)&v31->_recordID, a17);
  }

  return v31;
}

+ (id)protoFields
{
  v19[15] = *MEMORY[0x1E4F143B8];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deploymentID" number:1 type:13 subMessageClass:0];
  v19[0] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentID" number:2 type:13 subMessageClass:0];
  v19[1] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"treatmentID" number:3 type:13 subMessageClass:0];
  v19[2] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"adamID" number:4 type:13 subMessageClass:0];
  v19[3] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"impressed" number:5 type:12 subMessageClass:0];
  v19[4] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tapped" number:6 type:12 subMessageClass:0];
  v19[5] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dupe" number:7 type:12 subMessageClass:0];
  v19[6] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"installed" number:8 type:12 subMessageClass:0];
  v19[7] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"errorCode" number:9 type:0 subMessageClass:0];
  v19[8] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appUsageVector" number:10 type:0 subMessageClass:0];
  v19[9] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appDownloadVector" number:11 type:0 subMessageClass:0];
  v19[10] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"installedAppVector" number:12 type:0 subMessageClass:0];
  v19[11] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userQueryVector" number:13 type:0 subMessageClass:0];
  v19[12] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"serverResponse" number:14 type:14 subMessageClass:0];
  v19[13] = v9;
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recordID" number:15 type:13 subMessageClass:0];
  v19[14] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF42A8;
}

+ (id)columns
{
  v19[15] = *MEMORY[0x1E4F143B8];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deploymentID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experimentID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"treatmentID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"adamID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"impressed" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tapped" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dupe" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"installed" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"errorCode" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"appUsageVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_22645];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"appDownloadVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_87];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"installedAppVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_89];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"userQueryVector_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_91];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"serverResponse" dataType:4 requestOnly:0 fieldNumber:14 protoDataType:14 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recordID" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v14;
  v19[5] = v2;
  v19[6] = v3;
  v19[7] = v4;
  v19[8] = v13;
  v19[9] = v12;
  v19[10] = v5;
  v19[11] = v6;
  v19[12] = v11;
  v19[13] = v7;
  v19[14] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];

  return v10;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _userQueryVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _installedAppVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _appDownloadVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __36__BMAdPlatformsTrainingRows_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _appUsageVectorJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMAdPlatformsTrainingRows alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[7] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end