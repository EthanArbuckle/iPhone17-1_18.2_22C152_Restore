@interface NSUUID(LaunchServicesAdditions)
+ (id)_LS_UUIDWithData:()LaunchServicesAdditions digestType:;
+ (id)_LS_nullUUID;
@end

@implementation NSUUID(LaunchServicesAdditions)

+ (id)_LS_nullUUID
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];

  return v0;
}

+ (id)_LS_UUIDWithData:()LaunchServicesAdditions digestType:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  *(_OWORD *)v22 = 0uLL;
  if (!v5
    || (id v7 = v5, !objc_msgSend(v7, "bytes", *(void *)v22))
    || ![v7 length])
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_nullUUID", *(void *)v22);
    goto LABEL_14;
  }
  switch(a4)
  {
    case 2:
      id v12 = v7;
      v13 = (const void *)[v12 bytes];
      CC_LONG v14 = [v12 length];

      CC_MD5(v13, v14, v22);
      unsigned __int8 v15 = v22[6];
      char v16 = 48;
LABEL_12:
      v22[6] = v16 & 0xF0 | v15 & 0xF;
      v22[8] = v22[8] & 0x3F | 0x80;
      break;
    case 1:
      id v17 = v7;
      v18 = (const void *)[v17 bytes];
      CC_LONG v19 = [v17 length];

      CC_SHA1(v18, v19, md);
      goto LABEL_11;
    case 0:
      id v8 = v7;
      v9 = (const void *)[v8 bytes];
      CC_LONG v10 = [v8 length];

      CC_SHA256(v9, v10, md);
LABEL_11:
      *(_OWORD *)v22 = *(_OWORD *)md;
      unsigned __int8 v15 = md[6];
      char v16 = 80;
      goto LABEL_12;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v22];
LABEL_14:
  v20 = (void *)v11;

  return v20;
}

@end