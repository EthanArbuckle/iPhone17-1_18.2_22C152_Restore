@interface ENShareURLHelper
+ (id)shareURLStringForNoteGUID:(id)a3 shardId:(id)a4 shareKey:(id)a5 serviceHost:(id)a6 encodedAdditionalString:(id)a7;
@end

@implementation ENShareURLHelper

+ (id)shareURLStringForNoteGUID:(id)a3 shardId:(id)a4 shareKey:(id)a5 serviceHost:(id)a6 encodedAdditionalString:(id)a7
{
  v47[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v46 = -1;
  if ((unint64_t)[v12 length] >= 2 && objc_msgSend(v12, "hasPrefix:", @"s"))
  {
    v16 = [v12 substringFromIndex:1];
    v17 = [MEMORY[0x263F08B08] scannerWithString:v16];
    if (([v17 scanInteger:&v46] & 1) == 0 || v46 >= 0x10000) {
      uint64_t v46 = -1;
    }
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v11];
  if ((unint64_t)[v13 length] < 0x10)
  {
    id v27 = 0;
LABEL_37:
    v35 = [NSString stringWithFormat:@"https://%@/shard/%@/sh/%@/%@", v14, v12, v11, v13];
    goto LABEL_38;
  }
  id v19 = [v13 substringToIndex:16];
  if ([v19 length])
  {
    id v27 = 0;
  }
  else
  {
    id v43 = v15;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", (unint64_t)objc_msgSend(v19, "length") >> 1);
    if ([v19 length])
    {
      uint64_t v21 = 0;
      while (1)
      {
        unsigned int v22 = [v19 characterAtIndex:v21];
        int v23 = v22 - 87;
        if (v22 >= 0x67) {
          int v23 = -1;
        }
        if (v22 <= 0x46) {
          int v23 = v22 - 55;
        }
        if (v22 <= 0x39) {
          int v24 = v22 - 48;
        }
        else {
          int v24 = v23;
        }
        uint64_t v25 = v21 + 1;
        unsigned int v26 = [v19 characterAtIndex:v21 + 1];
        id v27 = 0;
        int v28 = v26 - 87;
        if (v26 >= 0x67) {
          int v28 = -1;
        }
        if (v26 <= 0x46) {
          int v28 = v26 - 55;
        }
        if (v26 <= 0x39) {
          int v28 = v26 - 48;
        }
        if (v24 < 0 || v28 < 0) {
          break;
        }
        LOBYTE(v47[0]) = v28 | (16 * v24);
        [v20 appendBytes:v47 length:1];
        uint64_t v21 = v25 + 1;
        if (v25 + 1 >= (unint64_t)[v19 length]) {
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:
      id v27 = v20;
    }

    id v15 = v43;
  }

  if (v46 < 0 || !v18 || !v27) {
    goto LABEL_37;
  }
  uint64_t v29 = [v27 length] + 18;
  v30 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v29];
  __int16 v45 = bswap32((unsigned __int16)v46) >> 16;
  [v30 appendBytes:&v45 length:2];
  v47[0] = 0;
  v47[1] = 0;
  [v18 getUUIDBytes:v47];
  [v30 appendBytes:v47 length:16];
  [v30 appendData:v27];
  v31 = [v30 base64EncodedStringWithOptions:0];
  v32 = objc_msgSend(v31, "substringToIndex:", objc_msgSend(v31, "length") - 1);

  v33 = [v32 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  v34 = [v33 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  v35 = [NSString stringWithFormat:@"https://%@/l/%@", v14, v34];
  if ([v15 length])
  {
    [v35 stringByAppendingFormat:@"/%@", v15];
    id v44 = v12;
    id v36 = v13;
    id v37 = v11;
    v38 = v18;
    id v39 = v14;
    v41 = id v40 = v15;

    v35 = (void *)v41;
    id v15 = v40;
    id v14 = v39;
    v18 = v38;
    id v11 = v37;
    id v13 = v36;
    id v12 = v44;
  }

LABEL_38:
  return v35;
}

@end