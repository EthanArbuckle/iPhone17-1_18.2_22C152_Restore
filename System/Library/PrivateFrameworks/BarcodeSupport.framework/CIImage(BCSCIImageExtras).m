@interface CIImage(BCSCIImageExtras)
- (id)_bcs_stringValueIfQRCode;
@end

@implementation CIImage(BCSCIImageExtras)

- (id)_bcs_stringValueIfQRCode
{
  v24[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F00630];
  uint64_t v3 = *MEMORY[0x263F005E8];
  uint64_t v4 = *MEMORY[0x263F005B8];
  uint64_t v5 = *MEMORY[0x263F005C8];
  v23[0] = *MEMORY[0x263F005B0];
  v23[1] = v5;
  v24[0] = v4;
  v24[1] = &unk_26D6118D8;
  v6 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v7 = [v2 detectorOfType:v3 context:0 options:v6];

  v8 = [v7 featuresInImage:a1];
  if ([v8 count] == 1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = objc_msgSend(v14, "messageString", (void)v17);

            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSCIImageExtras: image has multiple QR codes", buf, 2u);
  }
  v15 = 0;
LABEL_15:

  return v15;
}

@end