@interface UARPDynamicAssetVersions
+ (id)tag;
- (BOOL)decomposeUARP;
- (NSArray)partnerSerialNumbers;
- (UARPDynamicAssetVersions)init;
- (UARPDynamicAssetVersions)initWithURL:(id)a3;
- (id)description;
- (void)decomposeUARP;
@end

@implementation UARPDynamicAssetVersions

- (UARPDynamicAssetVersions)init
{
  return 0;
}

- (UARPDynamicAssetVersions)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetVersions;
  v5 = [(UARPDynamicAssetVersions *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = v8;
  }
  return v5;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"Partner Serial Numbers: "];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_serialNumbers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)decomposeUARP
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0]) {
    return 0;
  }
  uint64_t v5 = [(UARPSuperBinaryAsset *)self->_asset tlvs];
  uint64_t v6 = +[UARPSuperBinaryAssetTLV findTLVsWithType:1155952129 tlvs:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "valueAsString", (void)v15);
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetVersions decomposeUARP]();
          }

          BOOL v13 = 0;
          goto LABEL_17;
        }
        [(NSMutableArray *)self->_serialNumbers addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_17:

  return v13;
}

- (NSArray)partnerSerialNumbers
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_serialNumbers];
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructVersions();
  id v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Process VERS tlv is not of type string", v0, 2u);
}

@end