@interface AXAuditResult
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditResult)initWithAXAuditCategoryResults:(id)a3;
- (AXAuditResult)initWithAuditIssues:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)auditIssues;
- (NSDictionary)auditIssueToScreenshotMapping;
- (id)borderFrameForAuditIssue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayBoundsForAuditIssue:(id)a3;
- (id)rotationForAuditIssue:(id)a3;
- (id)scaleForAuditIssue:(id)a3;
- (id)screenshotForAuditIssue:(id)a3;
- (id)screenshotInfoDictionaryForAuditIssue:(id)a3;
- (id)shouldFlipOutlineForAuditIssue:(id)a3;
- (unint64_t)hash;
- (void)_generateIssueToImageMapping;
- (void)setAuditIssueToScreenshotMapping:(id)a3;
- (void)setAuditIssues:(id)a3;
@end

@implementation AXAuditResult

- (AXAuditResult)initWithAXAuditCategoryResults:(id)a3
{
  v20 = self;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v32 + 1) + 8 * v5);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v7 = objc_msgSend(v6, "caseResults", v20);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              v13 = [v12 auditIssues];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v25;
                do
                {
                  uint64_t v17 = 0;
                  do
                  {
                    if (*(void *)v25 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    [v4 addObject:*(void *)(*((void *)&v24 + 1) + 8 * v17++)];
                  }
                  while (v15 != v17);
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v23);
  }

  v18 = [(AXAuditResult *)v20 initWithAuditIssues:v4];
  return v18;
}

- (AXAuditResult)initWithAuditIssues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXAuditResult;
  v6 = [(AXAuditResult *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auditIssues, a3);
    [(AXAuditResult *)v7 _generateIssueToImageMapping];
  }

  return v7;
}

- (void)_generateIssueToImageMapping
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v38 = objc_opt_new();
  v40 = +[AXAuditScreenshotManager sharedManager];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v36 = self;
  id obj = [(AXAuditResult *)self auditIssues];
  uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v46;
    uint64_t v3 = 1;
    unint64_t v4 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v7 = [*(id *)(v4 + 2584) numberWithInt:v3];
        [v6 setImageIdentifier:v7];

        uint64_t v8 = [v40 screenshotForIssue:v6 elementRect:0];
        objc_super v9 = (void *)MEMORY[0x263F08D40];
        uint64_t v10 = [v6 timeStamp];
        [v40 screenshotBorderFrameForTimestamp:v10];
        uint64_t v11 = objc_msgSend(v9, "valueWithRect:");

        v12 = *(void **)(v4 + 2584);
        v13 = [v6 timeStamp];
        [v40 screenshotScaleFactorForTimestamp:v13];
        *(float *)&double v14 = v14;
        v44 = [v12 numberWithFloat:v14];

        uint64_t v15 = *(void **)(v4 + 2584);
        uint64_t v16 = [v6 timeStamp];
        [v40 screenshotRotationForTimestamp:v16];
        *(float *)&double v17 = v17;
        v43 = [v15 numberWithFloat:v17];

        v18 = (void *)MEMORY[0x263F08D40];
        v19 = [v6 timeStamp];
        [v40 screenshotDisplayBoundsForTimestamp:v19];
        v20 = objc_msgSend(v18, "valueWithRect:");

        v21 = *(void **)(v4 + 2584);
        uint64_t v22 = [v6 timeStamp];
        uint64_t v23 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v40, "screenshotShouldFlipOutlineForTimestamp:", v22));

        uint64_t v24 = UIImagePNGRepresentation(v8);
        long long v25 = (void *)v24;
        if (v24)
        {
          long long v26 = NSDictionary;
          v50[0] = v24;
          v50[1] = v11;
          v50[2] = v44;
          v50[3] = v43;
          v50[4] = v20;
          v50[5] = v23;
          v42 = v11;
          [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:6];
          long long v27 = v8;
          v29 = uint64_t v28 = v3;
          v49[0] = @"imageData";
          v49[1] = @"borderFrame";
          v49[2] = @"displayNativeScale";
          v49[3] = @"rotationRadians";
          v49[4] = @"displayBounds";
          v49[5] = @"shouldFlipOutline";
          [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:6];
          v31 = unint64_t v30 = v4;
          long long v32 = [v26 dictionaryWithObjects:v29 forKeys:v31];

          long long v33 = [*(id *)(v30 + 2584) numberWithInt:v28];
          long long v34 = [v33 stringValue];
          [v38 setObject:v32 forKey:v34];

          unint64_t v4 = v30;
          uint64_t v11 = v42;

          LODWORD(v33) = v28;
          uint64_t v8 = v27;
          uint64_t v3 = (v33 + 1);
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v41);
  }

  long long v35 = (void *)[v38 copy];
  [(AXAuditResult *)v36 setAuditIssueToScreenshotMapping:v35];
}

- (id)screenshotInfoDictionaryForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];

  return v7;
}

- (id)screenshotForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"imageData"];

  if (v8) {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v8];
  }
  else {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)borderFrameForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"borderFrame"];

  return v8;
}

- (id)scaleForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"displayNativeScale"];

  return v8;
}

- (id)rotationForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"rotationRadians"];

  return v8;
}

- (id)displayBoundsForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"displayBounds"];

  return v8;
}

- (id)shouldFlipOutlineForAuditIssue:(id)a3
{
  unint64_t v4 = [a3 imageIdentifier];
  id v5 = [v4 stringValue];

  v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  v7 = [v6 objectForKey:v5];
  uint64_t v8 = [v7 objectForKey:@"shouldFlipOutline"];

  return v8;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v6 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditResult_v1"];
  unint64_t v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"AuditIssuesValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_13];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_17_2];
  id v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v6 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"AuditIssueToScreenshotMappingPropertyValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_23_0];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_26];
  [v3 registerTransportInfoPropertyBased:v6];
}

uint64_t __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 auditIssues];
}

void __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAuditIssues:v4];
  }
}

uint64_t __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 auditIssueToScreenshotMapping];
}

void __56__AXAuditResult_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAuditIssueToScreenshotMapping:v4];
  }
}

- (unint64_t)hash
{
  id v3 = [(AXAuditResult *)self auditIssues];
  uint64_t v4 = [v3 hash];
  id v5 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AXAuditResult *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(AXAuditResult *)self auditIssues];
      v7 = [(AXAuditResult *)v5 auditIssues];
      int v8 = [v6 isEqualToArray:v7];

      BOOL v12 = 0;
      if (v8)
      {
        objc_super v9 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
        uint64_t v10 = [(AXAuditResult *)v5 auditIssueToScreenshotMapping];
        char v11 = [v9 isEqualToDictionary:v10];

        if (v11) {
          BOOL v12 = 1;
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(AXAuditResult *)self auditIssues];
  [v4 setAuditIssues:v5];

  unint64_t v6 = [(AXAuditResult *)self auditIssueToScreenshotMapping];
  [v4 setAuditIssueToScreenshotMapping:v6];

  return v4;
}

- (NSArray)auditIssues
{
  return self->_auditIssues;
}

- (void)setAuditIssues:(id)a3
{
}

- (NSDictionary)auditIssueToScreenshotMapping
{
  return self->_auditIssueToScreenshotMapping;
}

- (void)setAuditIssueToScreenshotMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditIssueToScreenshotMapping, 0);

  objc_storeStrong((id *)&self->_auditIssues, 0);
}

@end