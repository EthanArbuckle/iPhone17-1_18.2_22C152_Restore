@interface ASTUploadFilesResult
+ (BOOL)supportsSecureCoding;
+ (id)resultFromSource:(id)a3 andUploadDictionaries:(id)a4;
- (ASTUploadFilesResult)initWithCoder:(id)a3;
- (ASTUploadFilesResult)initWithSource:(id)a3 andCerts:(id)a4 andFiles:(id)a5;
- (BOOL)isEmpty;
- (NSArray)certs;
- (NSArray)files;
- (NSString)source;
- (id)generatePayload;
- (void)encodeWithCoder:(id)a3;
- (void)setCerts:(id)a3;
- (void)setFiles:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation ASTUploadFilesResult

+ (id)resultFromSource:(id)a3 andUploadDictionaries:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v5 = a4;
  v28 = [MEMORY[0x263EFF9C0] set];
  v24 = [MEMORY[0x263EFF980] array];
  v27 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v29)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v8 = [v7 objectForKeyedSubscript:@"cert"];
        if (v8)
        {
          objc_opt_class();
          v9 = &stru_26F0AC800;
          if (objc_opt_isKindOfClass())
          {
            v9 = [v8 objectForKeyedSubscript:@"certString"];
            if (v9)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && ([v28 containsObject:v9] & 1) == 0)
              {
                v10 = [v8 objectForKeyedSubscript:@"pubKeyDigest"];
                v11 = [v8 objectForKeyedSubscript:@"sigAlgo"];
                v12 = [[ASTUploadFilesCertsEntry alloc] initWithCert:v9 andPubKeyDigest:v10 andSigAlgo:v11];
                [v28 addObject:v9];
                [v24 addObject:v12];
              }
            }
          }
        }
        else
        {
          v9 = &stru_26F0AC800;
        }
        v30 = v9;
        v13 = [v7 objectForKeyedSubscript:@"id"];
        v14 = [v7 objectForKeyedSubscript:@"name"];
        v15 = [v7 objectForKeyedSubscript:@"sig"];
        v16 = [v7 objectForKeyedSubscript:@"pubKeyDigest"];
        v17 = [v7 objectForKeyedSubscript:@"status"];
        v18 = [v7 objectForKeyedSubscript:@"size"];
        v19 = [v7 objectForKeyedSubscript:@"uploadUrl"];
        v20 = [[ASTUploadFilesItemEntry alloc] initWithId:v13 andName:v14 andSig:v15 andPubKeyDigest:v16 andStatus:v17 andSize:v18 andUploadUrl:v19];
        [v27 addObject:v20];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v29);
  }

  v21 = [[ASTUploadFilesResult alloc] initWithSource:v23 andCerts:v24 andFiles:v27];

  return v21;
}

- (ASTUploadFilesResult)initWithSource:(id)a3 andCerts:(id)a4 andFiles:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASTUploadFilesResult;
  v12 = [(ASTUploadFilesResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_source, a3);
    objc_storeStrong((id *)&v13->_certs, a4);
    objc_storeStrong((id *)&v13->_files, a5);
  }

  return v13;
}

- (id)generatePayload
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v40 = [MEMORY[0x263EFF980] array];
  v39 = [MEMORY[0x263EFF980] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v36 = self;
  v3 = [(ASTUploadFilesResult *)self certs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v53 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v9 = [v8 sigAlgo];
        if (v9) {
          [v8 sigAlgo];
        }
        else {
        id v10 = [MEMORY[0x263EFF9D0] null];
        }

        v61[0] = @"cert";
        id v11 = [v8 certString];
        v62[0] = v11;
        v61[1] = @"pubKeyDigest";
        v12 = [v8 pubKeyDigest];
        v61[2] = @"sigAlgo";
        v62[1] = v12;
        v62[2] = v10;
        v13 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];

        [v40 addObject:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v5);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(ASTUploadFilesResult *)v36 files];
  uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(obj);
        }
        objc_super v15 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v58[0] = @"id";
        uint64_t v16 = [v15 uploadId];
        if (v16) {
          [v15 uploadId];
        }
        else {
        uint64_t v17 = [MEMORY[0x263EFF9D0] null];
        }
        v59[0] = v17;
        v58[1] = @"name";
        uint64_t v18 = [v15 name];
        if (v18) {
          [v15 name];
        }
        else {
        uint64_t v19 = [MEMORY[0x263EFF9D0] null];
        }
        v59[1] = v19;
        v58[2] = @"sig";
        uint64_t v20 = [v15 sig];
        v47 = (void *)v16;
        if (v20) {
          [v15 sig];
        }
        else {
        uint64_t v21 = [MEMORY[0x263EFF9D0] null];
        }
        v59[2] = v21;
        v58[3] = @"pubKeyDigest";
        v22 = [v15 pubKeyDigest];
        v45 = (void *)v18;
        v46 = (void *)v17;
        if (v22) {
          [v15 pubKeyDigest];
        }
        else {
        id v23 = [MEMORY[0x263EFF9D0] null];
        }
        v59[3] = v23;
        v58[4] = @"status";
        v24 = [v15 status];
        v43 = (void *)v20;
        v44 = (void *)v19;
        if (v24) {
          [v15 status];
        }
        else {
        v25 = [MEMORY[0x263EFF9D0] null];
        }
        v59[4] = v25;
        v58[5] = @"size";
        uint64_t v26 = [v15 size];
        v42 = (void *)v21;
        if (v26) {
          [v15 size];
        }
        else {
        v27 = [NSNumber numberWithLong:0];
        }
        v59[5] = v27;
        v58[6] = @"uploadUrl";
        v28 = [v15 uploadUrl];
        if (v28) {
          [v15 uploadUrl];
        }
        else {
        uint64_t v29 = [MEMORY[0x263EFF9D0] null];
        }
        v59[6] = v29;
        v30 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:7];

        [v39 addObject:v30];
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v41);
  }

  v56[0] = @"source";
  long long v31 = [(ASTUploadFilesResult *)v36 source];
  v57[0] = v31;
  v56[1] = @"certs";
  long long v32 = (void *)[v40 copy];
  v57[1] = v32;
  v56[2] = @"files";
  long long v33 = (void *)[v39 copy];
  v57[2] = v33;
  long long v34 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];

  return v34;
}

- (BOOL)isEmpty
{
  v2 = [(ASTUploadFilesResult *)self files];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASTUploadFilesResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certs"];
    certs = v5->_certs;
    v5->_certs = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"files"];
    files = v5->_files;
    v5->_files = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASTUploadFilesResult *)self certs];
  [v4 encodeObject:v5 forKey:@"certs"];

  id v6 = [(ASTUploadFilesResult *)self files];
  [v4 encodeObject:v6 forKey:@"files"];
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSArray)certs
{
  return self->_certs;
}

- (void)setCerts:(id)a3
{
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_certs, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end