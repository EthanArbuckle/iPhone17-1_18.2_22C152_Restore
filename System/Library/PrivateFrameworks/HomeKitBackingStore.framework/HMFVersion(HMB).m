@interface HMFVersion(HMB)
+ (id)hmbVersionFromData:()HMB;
- (id)hmbData;
@end

@implementation HMFVersion(HMB)

- (id)hmbData
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"a";
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "majorVersion"));
  v11[0] = v2;
  v10[1] = @"i";
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "minorVersion"));
  v11[1] = v3;
  v10[2] = @"u";
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a1, "updateVersion"));
  v11[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  int v9 = 0;
  uint64_t v6 = MEMORY[0x1D944C960](v5, 8, &v9);
  if (!v6) {
    _HMFPreconditionFailure();
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)hmbVersionFromData:()HMB
{
  id v3 = a3;
  id v4 = (id)OPACKDecodeData();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F65590]);
    v8 = [v6 objectForKey:@"a"];
    uint64_t v9 = [v8 integerValue];
    v10 = [v6 objectForKey:@"i"];
    uint64_t v11 = [v10 integerValue];
    v12 = [v6 objectForKey:@"u"];
    v13 = objc_msgSend(v7, "initWithMajorVersion:minorVersion:updateVersion:", v9, v11, objc_msgSend(v12, "integerValue"));

    return v13;
  }
  else
  {
    uint64_t v15 = _HMFPreconditionFailure();
    return (id)+[CKRecord(HMB) recordFromExternalData:error:](v15);
  }
}

@end