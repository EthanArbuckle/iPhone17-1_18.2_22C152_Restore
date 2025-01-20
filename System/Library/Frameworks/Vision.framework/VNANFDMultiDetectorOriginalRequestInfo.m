@interface VNANFDMultiDetectorOriginalRequestInfo
+ (id)originatingRequestSpecifierToDetectorClassMap;
+ (id)requestClassNameFromRequestKey:(id)a3;
+ (id)requestKeyFromRequest:(id)a3;
+ (id)requestPropertiesFromRequestKey:(id)a3;
@end

@implementation VNANFDMultiDetectorOriginalRequestInfo

+ (id)originatingRequestSpecifierToDetectorClassMap
{
  if (+[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap]::onceToken != -1) {
    dispatch_once(&+[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap]::onceToken, &__block_literal_global_61_31026);
  }
  v2 = (void *)+[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap]::requestClassToMultiDetectorClassPerRequestRevision;

  return v2;
}

+ (id)requestKeyFromRequest:(id)a3
{
  id v4 = a3;
  NSStringFromClass((Class)[v4 frameworkClass]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [NSString alloc];
    v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "upperBodyOnly"));
    v9 = (void *)[v7 initWithFormat:@"%@%@%@", v5, @"_", v8];

    id v5 = v9;
    v10 = v5;
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___VNANFDMultiDetectorOriginalRequestInfo;
    v10 = objc_msgSendSuper2(&v12, sel_requestKeyFromRequest_, v4);
  }

  return v10;
}

void __87__VNANFDMultiDetectorOriginalRequestInfo_originatingRequestSpecifierToDetectorClassMap__block_invoke()
{
  v41[38] = *MEMORY[0x1E4F143B8];
  v39 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[0] = v39;
  v41[0] = objc_opt_class();
  v38 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841666 error:0];
  v40[1] = v38;
  v41[1] = objc_opt_class();
  v37 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841668 error:0];
  v40[2] = v37;
  v41[2] = objc_opt_class();
  v36 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3 error:0];
  v40[3] = v36;
  v41[3] = objc_opt_class();
  v35 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841669 error:0];
  v40[4] = v35;
  v41[4] = objc_opt_class();
  v34 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841667 error:0];
  v40[5] = v34;
  v41[5] = objc_opt_class();
  v33 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841670 error:0];
  v40[6] = v33;
  v41[6] = objc_opt_class();
  v32 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[7] = v32;
  v41[7] = objc_opt_class();
  v31 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[8] = v31;
  v41[8] = objc_opt_class();
  v30 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[9] = v30;
  v41[9] = objc_opt_class();
  v29 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841666 error:0];
  v40[10] = v29;
  v41[10] = objc_opt_class();
  v28 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841667 error:0];
  v40[11] = v28;
  v41[11] = objc_opt_class();
  v27 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[12] = v27;
  v41[12] = objc_opt_class();
  v26 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[13] = v26;
  v41[13] = objc_opt_class();
  v25 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:2 error:0];
  v40[14] = v25;
  v41[14] = objc_opt_class();
  v24 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[15] = v24;
  v41[15] = objc_opt_class();
  v23 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841666 error:0];
  v40[16] = v23;
  v41[16] = objc_opt_class();
  v22 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[17] = v22;
  v41[17] = objc_opt_class();
  v21 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[18] = v21;
  v41[18] = objc_opt_class();
  v20 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:2 error:0];
  v40[19] = v20;
  v41[19] = objc_opt_class();
  v19 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[20] = v19;
  v41[20] = objc_opt_class();
  v18 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841666 error:0];
  v40[21] = v18;
  v41[21] = objc_opt_class();
  v17 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[22] = v17;
  v41[22] = objc_opt_class();
  v16 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[23] = v16;
  v41[23] = objc_opt_class();
  v15 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[24] = v15;
  v41[24] = objc_opt_class();
  v14 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841666 error:0];
  v40[25] = v14;
  v41[25] = objc_opt_class();
  v13 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[26] = v13;
  v41[26] = objc_opt_class();
  objc_super v12 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[27] = v12;
  v41[27] = objc_opt_class();
  v11 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[28] = v11;
  v41[28] = objc_opt_class();
  v0 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[29] = v0;
  v41[29] = objc_opt_class();
  v1 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841664 error:0];
  v40[30] = v1;
  v41[30] = objc_opt_class();
  v2 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3737841665 error:0];
  v40[31] = v2;
  v41[31] = objc_opt_class();
  v3 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[32] = v3;
  v41[32] = objc_opt_class();
  id v4 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v40[33] = v4;
  v41[33] = objc_opt_class();
  id v5 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:2 error:0];
  v40[34] = v5;
  v41[34] = objc_opt_class();
  id v6 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:3 error:0];
  v40[35] = v6;
  v41[35] = objc_opt_class();
  id v7 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:4 error:0];
  v40[36] = v7;
  v41[36] = objc_opt_class();
  v8 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:5 error:0];
  v40[37] = v8;
  v41[37] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:38];
  v10 = (void *)+[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap]::requestClassToMultiDetectorClassPerRequestRevision;
  +[VNANFDMultiDetectorOriginalRequestInfo originatingRequestSpecifierToDetectorClassMap]::requestClassToMultiDetectorClassPerRequestRevision = v9;
}

+ (id)requestPropertiesFromRequestKey:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"_"];
  id v4 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);

  return v4;
}

+ (id)requestClassNameFromRequestKey:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"_"];
  id v4 = [v3 firstObject];

  return v4;
}

@end