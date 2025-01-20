@interface SHContinuityTracker
+ (id)buildSignatureAlignment:(id)a3;
+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 configuration:(id)a5 error:(id *)a6;
+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 usingMergePolicy:(int64_t)a5 configuration:(id)a6 error:(id *)a7;
@end

@implementation SHContinuityTracker

+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 configuration:(id)a5 error:(id *)a6
{
  return (id)[a1 trackQuerySignature:a3 inReferenceSignature:a4 usingMergePolicy:1 configuration:a5 error:a6];
}

+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 usingMergePolicy:(int64_t)a5 configuration:(id)a6 error:(id *)a7
{
  v55[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  [v12 duration];
  if (v15 < 2.0 || ([v13 duration], v16 < 2.0))
  {
    v17 = NSString;
    [v12 duration];
    uint64_t v19 = v18;
    [v13 duration];
    objc_msgSend(v17, "stringWithFormat:", @"Duration of query signature: %f or reference signature: %f is less than the minimum required duration for tracking: %f", v19, v20, 0x4000000000000000);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = *MEMORY[0x263F08320];
    v55[0] = v21;
    id v22 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
    +[SHError annotateClientError:a7 code:201 underlyingError:0 keyOverrides:v22];
LABEL_4:
    v23 = 0;
    goto LABEL_5;
  }
  v46 = [v12 dataRepresentation];
  v25 = [v13 dataRepresentation];
  uint64_t v45 = [v14 numHistogramBuckets];
  [v14 scoreThreshold];
  int v27 = v26;
  uint64_t v44 = [v14 boundingBox];
  [v14 frequencyPenaltyMultiplier];
  int v29 = v28;
  uint64_t v30 = [v14 forwardPassOnly];
  char v31 = [v14 singlePassOnly];
  char v32 = [v14 refineStartEnd];
  [v14 queryThreshold];
  LODWORD(v34) = v33;
  id v52 = 0;
  BYTE1(v43) = v32;
  LOBYTE(v43) = v31;
  LODWORD(v35) = v27;
  LODWORD(v36) = v29;
  +[SignatureAlignmentTracker compareQuerySignature:withReferenceSignature:mergeMode:numHistogramBuckets:scoreThreshold:boundingBox:frequencyPenaltyMultiplier:forwardPassOnly:singlePassOnly:refineStartEnd:queryThreshold:error:](SignatureAlignmentTracker, "compareQuerySignature:withReferenceSignature:mergeMode:numHistogramBuckets:scoreThreshold:boundingBox:frequencyPenaltyMultiplier:forwardPassOnly:singlePassOnly:refineStartEnd:queryThreshold:error:", v46, v25, a5, v45, v44, v30, v35, v36, v34, v43, &v52);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v52;

  if (!v22)
  {
    +[SHError annotateClientError:a7 code:200 underlyingError:v21];
    goto LABEL_4;
  }
  id v47 = v13;
  v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v22 = v22;
  uint64_t v38 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(v22);
        }
        v42 = [a1 buildSignatureAlignment:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        [v37 addObject:v42];
      }
      uint64_t v39 = [v22 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v39);
  }

  v23 = (void *)[v37 copy];
  id v13 = v47;
LABEL_5:

  return v23;
}

+ (id)buildSignatureAlignment:(id)a3
{
  id v3 = a3;
  v4 = [SHRange alloc];
  [v3 queryStart];
  double v6 = v5;
  [v3 queryEnd];
  v8 = [(SHRange *)v4 initWithLowerBound:v6 upperBound:v7];
  v9 = [SHRange alloc];
  [v3 referenceStart];
  double v11 = v10;
  [v3 referenceEnd];
  id v13 = [(SHRange *)v9 initWithLowerBound:v11 upperBound:v12];
  id v14 = [SHSignatureAlignment alloc];
  [v3 confidence];
  LODWORD(v11) = v15;

  LODWORD(v16) = LODWORD(v11);
  v17 = [(SHSignatureAlignment *)v14 initWithQueryRange:v8 referenceRange:v13 alignmentConfidence:v16];

  return v17;
}

@end