@interface UARPDyanamicAssetLogManager
- (BOOL)newLog:(id)a3 error:(id *)a4;
- (NSURL)baseURL;
- (UARPDyanamicAssetLogManager)init;
- (UARPDyanamicAssetLogManager)initWithBaseURL:(id)a3;
@end

@implementation UARPDyanamicAssetLogManager

- (UARPDyanamicAssetLogManager)init
{
  return 0;
}

- (UARPDyanamicAssetLogManager)initWithBaseURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPDyanamicAssetLogManager;
  v5 = [(UARPDyanamicAssetLogManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v6;
  }
  return v5;
}

- (BOOL)newLog:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_baseURL)
  {
    v7 = [MEMORY[0x263EFF910] date];
    id v8 = objc_alloc(MEMORY[0x263EFF8F0]);
    v51 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    [v51 components:252 fromDate:v7];
    v50 = v53 = a4;
    objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.04d-%.02d-%.02d-%.02d%.02d%.02d", objc_msgSend(v50, "year"), objc_msgSend(v50, "month"), objc_msgSend(v50, "day"), objc_msgSend(v50, "hour"), objc_msgSend(v50, "minute"), objc_msgSend(v50, "second"));
    v10 = [[UARPSuperBinaryAsset alloc] initWithURL:v6];
    if ([(UARPSuperBinaryAsset *)v10 expandHeadersAndTLVs:v53])
    {
      v42 = v7;
      id v52 = v6;
      v11 = [(UARPSuperBinaryAsset *)v10 tlvs];
      v12 = +[UARPSuperBinaryAssetTLV findTLVWithType:272691969 tlvs:v11];

      v41 = v12;
      if (v12)
      {
        v44 = [v12 valueAsString];
      }
      else
      {
        v44 = @"UnknownAppleModelNumber";
      }
      v14 = [(UARPSuperBinaryAsset *)v10 tlvs];
      v15 = +[UARPSuperBinaryAssetTLV findTLVWithType:272691970 tlvs:v14];

      v40 = v15;
      if (v15)
      {
        v16 = [v15 valueAsString];
      }
      else
      {
        v16 = @"UnknownSerialNumber";
      }
      v17 = [NSURL fileURLWithPath:v44 isDirectory:1 relativeToURL:self->_baseURL];
      v39 = v16;
      if (v17)
      {
        v38 = v17;
        v18 = [NSURL fileURLWithPath:v16 isDirectory:1 relativeToURL:v17];
        if (v18
          && ([MEMORY[0x263F08850] defaultManager],
              v19 = objc_claimAutoreleasedReturnValue(),
              int v20 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:v53], v19, v20))
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id obj = [(UARPSuperBinaryAsset *)v10 payloads];
          uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v49)
          {
            v45 = v10;
            uint64_t v46 = *(void *)v55;
            v47 = v18;
            v48 = v9;
            while (2)
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v55 != v46) {
                  objc_enumerationMutation(obj);
                }
                v22 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                v23 = NSString;
                v24 = [v22 payloadTag];
                int v25 = [v24 char1];
                v26 = [v22 payloadTag];
                int v27 = [v26 char2];
                v28 = [v22 payloadTag];
                int v29 = [v28 char3];
                v30 = [v22 payloadTag];
                uint64_t v37 = v25;
                objc_super v9 = v48;
                v31 = [v23 stringWithFormat:@"%@-%c%c%c%c.uarplog", v48, v37, v27, v29, (int)objc_msgSend(v30, "char4")];

                uint64_t v32 = [v22 rangePayload];
                uint64_t v34 = v33;
                v35 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v52 error:v53];
                v18 = v47;
                LODWORD(v32) = [v22 expandPayloadToURL:v47 payloadFilename:v31 superbinary:v35 offset:v32 length:v34 error:v53];

                if (!v32)
                {
                  BOOL v13 = 0;
                  v7 = v42;
                  v10 = v45;
                  goto LABEL_27;
                }
                v10 = v45;
              }
              uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
              if (v49) {
                continue;
              }
              break;
            }
            BOOL v13 = 1;
            v7 = v42;
          }
          else
          {
            BOOL v13 = 1;
          }
LABEL_27:
        }
        else
        {
          BOOL v13 = 0;
        }
        id v6 = v52;

        v17 = v38;
      }
      else
      {
        BOOL v13 = 0;
        id v6 = v52;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end