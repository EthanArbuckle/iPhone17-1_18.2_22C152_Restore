@interface UARPSuperBinaryAsset
+ (BOOL)versionFromBNIString:(id)a3 version:(UARPVersion *)a4;
+ (BOOL)versionFromString:(id)a3 version:(UARPVersion *)a4;
- (BOOL)decomposeToURL:(id)a3 error:(id *)a4;
- (BOOL)expandHeadersAndTLVs:(id *)a3;
- (BOOL)expandPlistWithPayloadsFolder:(id)a3 error:(id *)a4;
- (BOOL)exportSuperBinaryContentToFilepath:(id)a3 range:(_NSRange)a4 error:(id *)a5;
- (BOOL)parseFromPlistFormatVersion:(id)a3 error:(id *)a4;
- (BOOL)parseFromPlistSuperBinaryMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistSuperBinaryMetaDataValuesTable:(id *)a3;
- (BOOL)parseFromPlistSuperBinaryPayloads:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistSuperBinaryVersion:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 payloadStartOffset:(unint64_t)a4 error:(id *)a5;
- (NSArray)payloads;
- (NSArray)tlvs;
- (NSDate)timeCreated;
- (NSURL)url;
- (UARPAssetTag)assetTag;
- (UARPAssetVersion)assetVersion;
- (UARPSuperBinaryAsset)init;
- (UARPSuperBinaryAsset)initWithFormatVersion:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7;
- (UARPSuperBinaryAsset)initWithFormatVersion:(unint64_t)a3 assetVersion:(id)a4;
- (UARPSuperBinaryAsset)initWithPlist:(id)a3 metadataPlist:(id)a4;
- (UARPSuperBinaryAsset)initWithURL:(id)a3;
- (UARPSuperBinaryAsset)initWithURL:(id)a3 assetTag:(id)a4;
- (_NSRange)rangeMetadata;
- (id)computeHash;
- (id)description;
- (id)payloadData:(id)a3 range:(_NSRange)a4 error:(id *)a5;
- (id)prepareMetaData;
- (void)addMetaDataTLV:(id)a3;
- (void)addPayload:(id)a3;
- (void)processBVERVersionString:(id)a3;
- (void)processVersionString:(id)a3;
@end

@implementation UARPSuperBinaryAsset

- (UARPSuperBinaryAsset)init
{
  return [(UARPSuperBinaryAsset *)self initWithFormatVersion:&unk_26CEFE518 majorVersion:&unk_26CEFE530 minorVersion:&unk_26CEFE530 releaseVersion:&unk_26CEFE530 buildVersion:&unk_26CEFE530];
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [UARPAssetVersion alloc];
  uint64_t v16 = [v13 unsignedIntegerValue];
  uint64_t v17 = [v13 unsignedIntegerValue];

  uint64_t v18 = [v12 unsignedIntegerValue];
  uint64_t v19 = [v11 unsignedIntegerValue];

  v20 = [(UARPAssetVersion *)v15 initWithMajorVersion:v16 minorVersion:v17 releaseVersion:v18 buildVersion:v19];
  uint64_t v21 = [v14 unsignedIntegerValue];

  v22 = [(UARPSuperBinaryAsset *)self initWithFormatVersion:v21 assetVersion:v20];
  return v22;
}

- (UARPSuperBinaryAsset)initWithFormatVersion:(unint64_t)a3 assetVersion:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryAsset;
  v8 = [(UARPSuperBinaryAsset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_formatVersion = a3;
    objc_storeStrong((id *)&v8->_assetVersion, a4);
  }

  return v9;
}

- (UARPSuperBinaryAsset)initWithPlist:(id)a3 metadataPlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UARPSuperBinaryAsset;
  v8 = [(UARPSuperBinaryAsset *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    plist = v8->_plist;
    v8->_plist = (NSURL *)v9;

    if (v7)
    {
      uint64_t v11 = [v7 copy];
      plistMetaData = v8->_plistMetaData;
      v8->_plistMetaData = (NSURL *)v11;
    }
  }

  return v8;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryAsset;
  v5 = [(UARPSuperBinaryAsset *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (UARPSuperBinaryAsset)initWithURL:(id)a3 assetTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UARPSuperBinaryAsset;
  v8 = [(UARPSuperBinaryAsset *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    assetTag = v8->_assetTag;
    v8->_assetTag = (UARPAssetTag *)v11;

    uint64_t v13 = [MEMORY[0x263EFF910] date];
    timeCreated = v8->_timeCreated;
    v8->_timeCreated = (NSDate *)v13;
  }
  return v8;
}

- (NSArray)tlvs
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_tlvs];
}

- (NSArray)payloads
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_payloads];
}

- (void)addMetaDataTLV:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_tlvs)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      tlvs = self->_tlvs;
      self->_tlvs = v5;
    }
    if ([v4 type] == 3166200581)
    {
      [(UARPSuperBinaryAsset *)self processVersionString:v4];
    }
    else if ([v4 type] == 3166200582)
    {
      [(UARPSuperBinaryAsset *)self processBVERVersionString:v4];
    }
    else
    {
      [(NSMutableArray *)self->_tlvs addObject:v4];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addMetaDataTLV:]();
  }
}

- (void)addPayload:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    payloads = self->_payloads;
    if (!payloads)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = self->_payloads;
      self->_payloads = v6;

      payloads = self->_payloads;
    }
    [(NSMutableArray *)payloads addObject:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAsset addPayload:]();
  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return [(UARPSuperBinaryAsset *)self writeToURL:a3 payloadStartOffset:0 error:a4];
}

- (BOOL)writeToURL:(id)a3 payloadStartOffset:(unint64_t)a4 error:(id *)a5
{
  *(void *)((char *)&v145[1] + 4) = *MEMORY[0x263EF8340];
  id v7 = a3;
  v130 = a5;
  if (self->_plist)
  {
    v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithContentsOfURL:");
    v131 = [v8 objectForKeyedSubscript:@"SuperBinary Payloads"];
  }
  else
  {
    v131 = 0;
    v8 = 0;
  }
  id obj = (id)objc_opt_new();
  v129 = self;
  payloads = self->_payloads;
  p_payloads = &self->_payloads;
  if ([(NSMutableArray *)payloads count])
  {
    unint64_t v11 = 0;
    id v12 = &_os_log_internal;
    uint64_t v13 = MEMORY[0x263EFFA88];
    do
    {
      objc_super v14 = [(NSMutableArray *)*p_payloads objectAtIndexedSubscript:v11];
      char v15 = [v14 isValid];

      if (v15)
      {
        objc_super v16 = [(NSMutableArray *)*p_payloads objectAtIndexedSubscript:v11];
        [obj addObject:v16];
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]2(v144, (id *)p_payloads, v11, v145);
        }
        objc_super v16 = [v131 objectAtIndexedSubscript:v11];
        [v16 setObject:v13 forKeyedSubscript:@"Payload Missing"];
      }

      ++v11;
    }
    while (v11 < [(NSMutableArray *)*p_payloads count]);
  }
  objc_storeStrong((id *)p_payloads, obj);
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Failed to create file for composing superbinary, url is nil"];
    v27 = objc_opt_new();
    [v27 setObject:v21 forKeyedSubscript:*MEMORY[0x263F08320]];
    v44 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
    v25 = v44;
    if (v130) {
      id *v130 = v44;
    }
    v24 = v8;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  id v18 = v7;
  uint64_t v19 = (const char *)[v18 fileSystemRepresentation];
  if (v19)
  {
    v20 = v19;
    if (*v19)
    {
      uint64_t v21 = [NSString stringWithUTF8String:v19];
      v22 = [MEMORY[0x263F08850] defaultManager];
      char v23 = [v22 createFileAtPath:v21 contents:0 attributes:0];

      v24 = v8;
      if (v23)
      {
        id v143 = 0;
        v25 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v18 error:&v143];
        v26 = (__CFString *)v143;
        v27 = v26;
        if (v25)
        {
          v126 = v25;
          v123 = v21;
          v124 = v26;
          v121 = v17;
          int v142 = 0;
          long long v141 = 0u;
          long long v140 = 0u;
          v28 = v129;
          v139[0] = v129->_formatVersion;
          v139[1] = 44;
          DWORD1(v140) = [(UARPAssetVersion *)v129->_assetVersion majorVersion];
          DWORD2(v140) = [(UARPAssetVersion *)v129->_assetVersion minorVersion];
          HIDWORD(v140) = [(UARPAssetVersion *)v129->_assetVersion releaseVersion];
          LODWORD(v141) = [(UARPAssetVersion *)v129->_assetVersion buildVersion];
          LODWORD(v140) = 44;
          int v29 = 40 * [(NSMutableArray *)v129->_payloads count];
          v125 = malloc_type_calloc([(NSMutableArray *)v129->_payloads count], 0x28uLL, 0x10000400A747E1EuLL);
          if ([(NSMutableArray *)v129->_payloads count])
          {
            unint64_t v30 = 0;
            v31 = v125 + 7;
            do
            {
              v32 = [(NSMutableArray *)*p_payloads objectAtIndex:v30];
              *(v31 - 7) = 40;
              *(v31 - 6) = [v32 preparePackedTag];
              [v32 prepareUarpVersion:v31 - 5];
              v33 = [v32 prepareMetaData];
              _DWORD *v31 = [v33 length];
              id v34 = (id)[v32 prepareData];
              v31[2] = [v32 preparedDataLength];
              v35 = [v32 hashMetaData];
              _DWORD *v31 = [v35 length];
              if ([v32 needsCompression]
                && [v32 allowCompressionHeaders])
              {
                if (v28->_formatVersion <= 2)
                {
                  v36 = -[NSMutableArray objectAtIndex:](*p_payloads, "objectAtIndex:", [v32 compressionHeaderIndex]);
                  v37 = [v32 compressionHeaders];
                  [v36 setPayloadToData:v37];

                  v28 = v129;
                }
                v38 = [v32 metaData];
                _DWORD *v31 = [v38 length];
              }
              ++v30;
              v31 += 10;
            }
            while (v30 < [(NSMutableArray *)*p_payloads count]);
          }
          HIDWORD(v141) = v140;
          int v142 = v29;
          DWORD1(v141) = v140 + v29;
          v120 = [(UARPSuperBinaryAsset *)v28 prepareMetaData];
          DWORD2(v141) = [v120 length];
          LODWORD(v140) = v140 + v29 + DWORD2(v141);
          if ([(NSMutableArray *)v28->_payloads count])
          {
            unint64_t v39 = 0;
            v40 = v125 + 7;
            do
            {
              int v41 = v140;
              *(v40 - 1) = v140;
              int v42 = *v40;
              v40 += 10;
              LODWORD(v140) = v42 + v41;
              ++v39;
            }
            while (v39 < [(NSMutableArray *)*p_payloads count]);
          }
          if (a4)
          {
            v43 = [MEMORY[0x263EFF990] dataWithLength:a4 - v140];
            LODWORD(v140) = v140 + [v43 length];
          }
          else
          {
            v43 = 0;
          }
          uint64_t v21 = v123;
          v25 = v126;
          v27 = v124;
          if ([(NSMutableArray *)*p_payloads count])
          {
            unint64_t v53 = 0;
            v54 = v125 + 9;
            do
            {
              int v55 = v140;
              *(v54 - 1) = v140;
              int v56 = *v54;
              v54 += 10;
              LODWORD(v140) = v56 + v55;
              ++v53;
            }
            while (v53 < [(NSMutableArray *)*p_payloads count]);
          }
          v128 = v43;
          uarpSuperBinaryHeaderEndianSwap(v139, v139);
          [MEMORY[0x263EFF8F8] dataWithBytes:v139 length:44];
          v119 = v138[1] = 0;
          int v57 = objc_msgSend(v126, "uarpWriteData:error:");
          v58 = (__CFString *)0;
          v122 = v58;
          if (!v57)
          {
            v80 = v58;
            free(v125);
            v81 = @"<unknown>";
            if (v80) {
              v81 = v80;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary header at %@; %@",
              v123,
              v81);
            v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v82 = objc_opt_new();
            [v82 setObject:v61 forKeyedSubscript:*MEMORY[0x263F08320]];
            v83 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v82];
            v84 = v83;
            if (v130) {
              id *v130 = v83;
            }
            uint64_t v17 = v121;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
            }

            BOOL v46 = 0;
            goto LABEL_135;
          }
          if ([(NSMutableArray *)*p_payloads count])
          {
            unint64_t v59 = 0;
            v60 = v125;
            while (1)
            {
              uarpPayloadHeaderEndianSwap(v60, v60);
              v61 = [MEMORY[0x263EFF8F8] dataWithBytes:v60 length:40];
              v138[0] = 0;
              char v62 = [v126 uarpWriteData:v61 error:v138];
              v63 = (__CFString *)v138[0];
              v64 = v63;
              if ((v62 & 1) == 0) {
                break;
              }

              ++v59;
              v60 += 10;
              if (v59 >= [(NSMutableArray *)*p_payloads count]) {
                goto LABEL_62;
              }
            }
            free(v125);
            v90 = @"<unknown>";
            if (v64) {
              v90 = v64;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary payload header index %lu at %@; %@",
              v59,
              v123,
            v91 = v90);
            v92 = objc_opt_new();
            [v92 setObject:v91 forKeyedSubscript:*MEMORY[0x263F08320]];
            v93 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v92];
            v94 = v93;
            if (v130) {
              id *v130 = v93;
            }
            uint64_t v17 = v121;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
            }
            goto LABEL_97;
          }
LABEL_62:
          free(v125);
          metaData = v129->_metaData;
          id v137 = 0;
          int v66 = [v126 uarpWriteData:metaData error:&v137];
          v61 = (__CFString *)v137;
          uint64_t v17 = v121;
          if (!v66)
          {
            v85 = @"<unknown>";
            if (v61) {
              v85 = v61;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary metadata at %@; %@",
              v123,
            v86 = v85);
            v87 = objc_opt_new();
            [v87 setObject:v86 forKeyedSubscript:*MEMORY[0x263F08320]];
            v88 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v87];
            v89 = v88;
            v27 = v124;
            if (v130) {
              id *v130 = v88;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
            }

            BOOL v46 = 0;
            goto LABEL_134;
          }
          if ([(NSMutableArray *)*p_payloads count])
          {
            uint64_t v67 = 0;
            while (1)
            {
              v68 = [(NSMutableArray *)*p_payloads objectAtIndex:v67];
              v69 = [v68 metaData];
              id v136 = 0;
              char v70 = [v126 uarpWriteData:v69 error:&v136];
              v71 = (__CFString *)v136;

              if ((v70 & 1) == 0) {
                break;
              }

              if (++v67 >= (unint64_t)[(NSMutableArray *)*p_payloads count]) {
                goto LABEL_67;
              }
            }
            if (v71) {
              v95 = v71;
            }
            else {
              v95 = @"<unknown>";
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary payload metadata index %lu at %@; %@",
              v67,
              v123,
            v96 = v95);
            v97 = objc_opt_new();
            [v97 setObject:v96 forKeyedSubscript:*MEMORY[0x263F08320]];
            v98 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v97];
            v99 = v98;
            if (v130) {
              id *v130 = v98;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
            }

            goto LABEL_132;
          }
LABEL_67:
          uint64_t v21 = v123;
          v25 = v126;
          if (v128)
          {
            id v135 = 0;
            char v72 = [v126 uarpWriteData:v128 error:&v135];
            v73 = (__CFString *)v135;
            v64 = v73;
            if ((v72 & 1) == 0)
            {
              v100 = @"<unknown>";
              if (v73) {
                v100 = v73;
              }
              objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary padding at %@; %@",
                v123,
              v91 = v100);
              v92 = objc_opt_new();
              [v92 setObject:v91 forKeyedSubscript:*MEMORY[0x263F08320]];
              v101 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v92];
              v94 = v101;
              if (v130) {
                id *v130 = v101;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
              }
LABEL_97:

              BOOL v46 = 0;
LABEL_133:
              v27 = v124;
LABEL_134:
              v25 = v126;
              goto LABEL_135;
            }
          }
          if ([(NSMutableArray *)*p_payloads count])
          {
            unint64_t v74 = 0;
            while (1)
            {
              v75 = [(NSMutableArray *)*p_payloads objectAtIndex:v74];
              id v134 = 0;
              char v76 = [v75 appendCompressedPayloadToFile:v25 error:&v134];
              v77 = (__CFString *)v134;
              v78 = v77;
              if ((v76 & 1) == 0) {
                break;
              }

              ++v74;
              v25 = v126;
              if (v74 >= [(NSMutableArray *)*p_payloads count]) {
                goto LABEL_74;
              }
            }
            v102 = @"<unknown>";
            if (v77) {
              v102 = v77;
            }
            objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary payload data index %lu at %@; %@",
              v74,
              v123,
            v103 = v102);
            v104 = objc_opt_new();
            [v104 setObject:v103 forKeyedSubscript:*MEMORY[0x263F08320]];
            v105 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v104];
            v106 = v105;
            if (v130) {
              id *v130 = v105;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
            }

            goto LABEL_132;
          }
LABEL_74:
          v27 = v124;
          if (v24)
          {
            if (v129->_plistMetaData)
            {
              objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithContentsOfURL:");
              id v79 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v79 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              v107 = [(UARPSuperBinaryMetaDataTable *)v129->_metaDataTable formatVersion];
              [v79 setObject:v107 forKeyedSubscript:@"MetaData Format Version"];

              v108 = [(UARPSuperBinaryMetaDataTable *)v129->_metaDataTable values];
              [v79 setObject:v108 forKeyedSubscript:@"MetaData Values"];
            }
            if (v79) {
              [v24 setObject:v79 forKey:@"MetaData plist"];
            }
            v109 = [MEMORY[0x263F08910] archivedDataWithRootObject:v24 requiringSecureCoding:0 error:v130];
            id v133 = 0;
            char v110 = [v25 uarpWriteData:v109 error:&v133];
            v111 = (__CFString *)v133;
            v112 = v111;
            if ((v110 & 1) == 0)
            {
              v113 = @"<unknown>";
              if (v111) {
                v113 = v111;
              }
              objc_msgSend(NSString, "stringWithFormat:", @"Failed to write to superbinary plist at %@; %@",
                v123,
              v114 = v113);
              v115 = objc_opt_new();
              [v115 setObject:v114 forKeyedSubscript:*MEMORY[0x263F08320]];
              v116 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v115];
              v117 = v116;
              if (v130) {
                id *v130 = v116;
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
              }

LABEL_132:
              BOOL v46 = 0;
              uint64_t v21 = v123;
              goto LABEL_133;
            }

            v25 = v126;
          }
          [v25 uarpCloseAndReturnError:v130];
          BOOL v46 = 1;
LABEL_135:

          v48 = v128;
          goto LABEL_136;
        }
        v49 = @"<unknown>";
        if (v26) {
          v49 = v26;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"Failed to open file for composing superbinary at %@; %@",
          v18,
        v48 = v49);
        v50 = objc_opt_new();
        [v50 setObject:v48 forKeyedSubscript:*MEMORY[0x263F08320]];
        v51 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v50];
        v52 = v51;
        if (v130) {
          id *v130 = v51;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
        }
      }
      else
      {
        v27 = [NSString stringWithFormat:@"Failed to create file for composing superbinary at %@", v21];
        v25 = objc_opt_new();
        [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x263F08320]];
        v47 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v25];
        v48 = v47;
        if (v130) {
          id *v130 = v47;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
        }
      }
      BOOL v46 = 0;
LABEL_136:

      goto LABEL_137;
    }
    uint64_t v19 = (const char *)strlen(v19);
  }
  else
  {
    v20 = "NULL";
  }
  v24 = v8;
  uint64_t v21 = [NSString stringWithFormat:@"Failed to create file for composing superbinary, filename is %s or length is %lu", v20, v19];
  v27 = objc_opt_new();
  [v27 setObject:v21 forKeyedSubscript:*MEMORY[0x263F08320]];
  v45 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
  v25 = v45;
  if (v130) {
    id *v130 = v45;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_39:
  }
    -[UARPSuperBinaryAsset writeToURL:payloadStartOffset:error:]();
LABEL_40:
  BOOL v46 = 0;
LABEL_137:

  return v46;
}

+ (BOOL)versionFromString:(id)a3 version:(UARPVersion *)a4
{
  v5 = [a3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] < 4)
  {
    a4->build = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:3];
    a4->build = [v6 integerValue];
  }
  if ((unint64_t)[v5 count] < 3)
  {
    a4->release = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:2];
    a4->release = [v7 integerValue];
  }
  if ((unint64_t)[v5 count] < 2)
  {
    a4->minor = 0;
  }
  else
  {
    v8 = [v5 objectAtIndex:1];
    a4->minor = [v8 integerValue];
  }
  uint64_t v9 = [v5 count];
  if (v9)
  {
    v10 = [v5 objectAtIndex:0];
    a4->major = [v10 integerValue];
  }
  else
  {
    a4->major = 0;
  }

  return v9 != 0;
}

+ (BOOL)versionFromBNIString:(id)a3 version:(UARPVersion *)a4
{
  v5 = [a3 componentsSeparatedByString:@"."];
  if ([v5 count] == 3)
  {
    id v6 = [v5 objectAtIndexedSubscript:1];
    unint64_t v7 = [v6 longLongValue];

    v8 = NSString;
    uint64_t v9 = [v5 objectAtIndexedSubscript:0];
    v10 = [v5 objectAtIndexedSubscript:2];
    unint64_t v11 = [v8 stringWithFormat:@"%@.%d.%d.%@", v9, HIDWORD(v7), v7, v10];

    BOOL v12 = +[UARPSuperBinaryAsset versionFromString:v11 version:a4];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)expandPlistWithPayloadsFolder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:self->_plist];
  BOOL v8 = [(UARPSuperBinaryAsset *)self parseFromPlistFormatVersion:v7 error:a4]
    && -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataValuesTable:](self, "parseFromPlistSuperBinaryMetaDataValuesTable:", a4)&& -[UARPSuperBinaryAsset parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:](self, "parseFromPlistSuperBinaryMetaDataTLVs:payloadsURL:error:", v7, v6, a4)&& (self->_assetVersion|| -[UARPSuperBinaryAsset parseFromPlistSuperBinaryVersion:error:](self, "parseFromPlistSuperBinaryVersion:error:", v7, a4))&& -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:](self, "parseFromPlistSuperBinaryPayloads:payloadsURL:error:", v7,
         v6,
         a4);

  return v8;
}

- (BOOL)parseFromPlistFormatVersion:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"SuperBinary Format Version"];
  unint64_t v7 = v6;
  if (v6)
  {
    self->_formatVersion = [v6 unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = [NSString stringWithFormat:@"superbinary format version is nil"];
    uint64_t v9 = objc_opt_new();
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
    v10 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v9];
    unint64_t v11 = v10;
    if (a4) {
      *a4 = v10;
    }
  }
  return v7 != 0;
}

- (BOOL)parseFromPlistSuperBinaryVersion:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKeyedSubscript:@"SuperBinary Firmware Version"];
  if (v6)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    BOOL v7 = +[UARPSuperBinaryAsset versionFromString:v6 version:&v19];
    if (v7)
    {
      BOOL v8 = [UARPAssetVersion alloc];
      uint64_t v9 = [(UARPAssetVersion *)v8 initWithMajorVersion:v19 minorVersion:HIDWORD(v19) releaseVersion:v20 buildVersion:HIDWORD(v20)];
      assetVersion = self->_assetVersion;
      self->_assetVersion = v9;
    }
    else
    {
      assetVersion = [NSString stringWithFormat:@"cannot convert superbinary version string to object"];
      char v15 = objc_opt_new();
      [v15 setObject:assetVersion forKeyedSubscript:*MEMORY[0x263F08320]];
      objc_super v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v15];
      uint64_t v17 = v16;
      if (a4) {
        *a4 = v16;
      }
    }
  }
  else
  {
    unint64_t v11 = [NSString stringWithFormat:@"superbinary plist does not contain superbinary version"];
    BOOL v12 = objc_opt_new();
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x263F08320]];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v12];
    objc_super v14 = v13;
    if (a4) {
      *a4 = v13;
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFromPlistSuperBinaryMetaDataValuesTable:(id *)a3
{
  plistMetaData = self->_plistMetaData;
  id v6 = [UARPSuperBinaryMetaDataTable alloc];
  BOOL v7 = v6;
  if (plistMetaData)
  {
    BOOL v8 = [(UARPSuperBinaryMetaDataTable *)v6 initWithPlist:self->_plistMetaData];
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v8;

    v10 = self->_metaDataTable;
    return [(UARPSuperBinaryMetaDataTable *)v10 expandPlist:a3];
  }
  else
  {
    BOOL v12 = [NSNumber numberWithUnsignedInteger:self->_formatVersion];
    uint64_t v13 = [(UARPSuperBinaryMetaDataTable *)v7 initAppleSpecificWithFormatVersion:v12];
    objc_super v14 = self->_metaDataTable;
    self->_metaDataTable = v13;

    return 1;
  }
}

- (BOOL)parseFromPlistSuperBinaryMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  v10 = [v8 objectForKeyedSubscript:@"SuperBinary MetaData"];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke;
  v13[3] = &unk_264492678;
  v13[4] = self;
  id v11 = v9;
  id v14 = v11;
  char v15 = &v16;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
  *a5 = (id) v17[5];

  _Block_object_dispose(&v16, 8);
  return 1;
}

void __80__UARPSuperBinaryAsset_parseFromPlistSuperBinaryMetaDataTLVs_payloadsURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 48);
  id v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  id v9 = [v7 tlvArrayWithKey:a2 keyValue:a3 payloadsURL:v6 error:&obj];
  objc_storeStrong(v8, obj);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(a1 + 32), "addMetaDataTLV:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }

  if (!v10 || ![v10 count]) {
    *a4 = 1;
  }
}

- (BOOL)parseFromPlistSuperBinaryPayloads:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a4;
  [a3 objectForKeyedSubscript:@"SuperBinary Payloads"];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [[UARPSuperBinaryAssetPayload alloc] initWithDictionary:*(void *)(*((void *)&v36 + 1) + 8 * v13)];
      long long v15 = v14;
      if (!v14) {
        break;
      }
      [(UARPSuperBinaryAssetPayload *)v14 updateFormatVersion:self->_formatVersion];
      [(UARPSuperBinaryAsset *)self addPayload:v15];
      if (![(UARPSuperBinaryAssetPayload *)v15 expandDictionaryWithPayloadsFolder:v8 metaDataTable:self->_metaDataTable error:a5])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:]();
        }
LABEL_30:

        BOOL v25 = 0;
        id v16 = v9;
        goto LABEL_31;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    v26 = [NSString stringWithFormat:@"could not expand payload while parsing plist"];
    v27 = objc_opt_new();
    [v27 setObject:v26 forKeyedSubscript:*MEMORY[0x263F08320]];
    v28 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v27];
    int v29 = v28;
    if (a5) {
      *a5 = v28;
    }

    goto LABEL_30;
  }
LABEL_10:
  id v31 = v9;

  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v17 = self->_payloads;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v22 needsCompression] && self->_formatVersion <= 2)
        {
          char v23 = [[UARPSuperBinaryAssetPayload alloc] initWithTag:@"CHDR" majorVersion:&unk_26CEFE530 minorVersion:&unk_26CEFE530 releaseVersion:0 buildVersion:0];
          if (v23)
          {
            v24 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", 3436347663, [v16 count]+ -[NSMutableArray count](self->_payloads, "count"));
            [v22 addMetaDataTLV:v24];
            [v16 addObject:v23];
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            -[UARPSuperBinaryAsset parseFromPlistSuperBinaryPayloads:payloadsURL:error:](buf, (uint64_t)self, &v41);
          }
        }
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v19);
  }

  [(NSMutableArray *)self->_payloads addObjectsFromArray:v16];
  BOOL v25 = 1;
  id v9 = v31;
LABEL_31:

  return v25;
}

- (BOOL)expandHeadersAndTLVs:(id *)a3
{
  return [(UARPSuperBinaryAsset *)self decomposeToURL:0 error:a3];
}

- (BOOL)decomposeToURL:(id)a3 error:(id *)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v6 = a3;
  url = self->_url;
  p_url = (uint64_t *)&self->_url;
  id v104 = 0;
  id v8 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:url error:&v104];
  id v9 = v104;
  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[UARPSuperBinaryAsset decomposeToURL:error:](p_url, (uint64_t)v9);
      if (a4) {
        goto LABEL_84;
      }
    }
    else if (a4)
    {
LABEL_84:
      char v74 = 0;
      *a4 = v9;
      goto LABEL_87;
    }
    char v74 = 0;
    goto LABEL_87;
  }
  uint64_t v10 = [v8 uarpReadDataUpToLength:44 error:a4];
  [v10 getBytes:&self->_superBinaryHeader length:44];
  uarpSuperBinaryHeaderEndianSwap(&self->_superBinaryHeader.superBinaryFormatVersion, &self->_superBinaryHeader.superBinaryFormatVersion);
  self->_formatVersion = self->_superBinaryHeader.superBinaryFormatVersion;
  v94 = a4;
  uint64_t v11 = [[UARPAssetVersion alloc] initWithMajorVersion:self->_superBinaryHeader.superBinaryVersion.major minorVersion:self->_superBinaryHeader.superBinaryVersion.minor releaseVersion:self->_superBinaryHeader.superBinaryVersion.release buildVersion:self->_superBinaryHeader.superBinaryVersion.build];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v11;

  if (self->_superBinaryHeader.superBinaryMetadataLength)
  {
    if (![v8 uarpSeekToOffset:self->_superBinaryHeader.superBinaryMetadataOffset error:a4])
    {
      char v74 = 0;
      goto LABEL_86;
    }
    uint64_t v13 = [v8 uarpReadDataUpToLength:self->_superBinaryHeader.superBinaryMetadataLength error:a4];
    uint64_t v14 = +[UARPSuperBinaryAssetTLV decomposeTLVs:v13];
    tlvs = self->_tlvs;
    self->_tlvs = v14;
  }
  [v8 uarpSeekToOffset:self->_superBinaryHeader.superBinaryLength error:a4];
  v83 = v8;
  id v16 = [v8 uarpReadDataToEndOfFileAndReturnError:a4];
  long long v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
  v22 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
  [v22 objectForKeyedSubscript:@"MetaData plist"];
  v82 = id v81 = v9;
  if (v82)
  {
    char v23 = v22;
    if (v6)
    {
      v24 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"MetaData.plist" relativeToURL:v6];
      int v25 = [v82 writeToURL:v24 error:v94];

      if (!v25)
      {
        char v74 = 0;
        v22 = v23;
        id v9 = v81;
        goto LABEL_81;
      }
    }
    v26 = [[UARPSuperBinaryMetaDataTable alloc] initWithDictionary:v82];
    metaDataTable = self->_metaDataTable;
    self->_metaDataTable = v26;

    v22 = v23;
    id v9 = v81;
  }
  v80 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v22];
  if (v80)
  {
    [v80 removeObjectForKey:@"MetaData plist"];
    v28 = [NSDictionary dictionaryWithDictionary:v80];
    plistDictionary = self->_plistDictionary;
    self->_plistDictionary = v28;

    if (v6)
    {
      unint64_t v30 = (void *)[objc_alloc(NSURL) initFileURLWithPath:@"SuperBinary.plist" relativeToURL:v6];
      BOOL v31 = [(NSDictionary *)self->_plistDictionary writeToURL:v30 error:v94];

      if (!v31)
      {
        char v74 = 0;
        goto LABEL_80;
      }
    }
  }
  v77 = v21;
  v78 = v16;
  id v79 = v10;
  id v91 = v6;
  long long v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  payloads = self->_payloads;
  self->_payloads = v32;

  unsigned int payloadHeadersLength = self->_superBinaryHeader.payloadHeadersLength;
  char v76 = v22;
  long long v35 = [v22 objectForKeyedSubscript:@"SuperBinary Payloads"];
  long long v36 = [MEMORY[0x263EFF980] arrayWithArray:v35];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v37 = v35;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v100 objects:v109 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v101 != v40) {
          objc_enumerationMutation(v37);
        }
        int v42 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        v43 = [v42 objectForKeyedSubscript:@"Payload Missing"];
        if ([v43 BOOLValue]) {
          [v36 removeObject:v42];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v100 objects:v109 count:16];
    }
    while (v39);
  }

  uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];

  v45 = (void *)v44;
  id v6 = v91;
  id v8 = v83;
  BOOL v46 = v94;
  v92 = v45;
  if (payloadHeadersLength < 0x28)
  {
LABEL_78:
    char v74 = [v8 uarpCloseAndReturnError:v46];
    goto LABEL_79;
  }
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  LODWORD(v49) = payloadHeadersLength / 0x28;
  if (payloadHeadersLength / 0x28 <= 1) {
    uint64_t v49 = 1;
  }
  else {
    uint64_t v49 = v49;
  }
  uint64_t v93 = v49;
  while (1)
  {
    [v8 uarpSeekToOffset:v47 + self->_superBinaryHeader.payloadHeadersOffset error:v46];
    uint64_t v99 = 0;
    long long v97 = 0u;
    long long v98 = 0u;
    v50 = [v8 uarpReadDataUpToLength:40 error:v46];
    [v50 getBytes:&v97 length:40];
    uarpPayloadHeaderEndianSwap((unsigned int *)&v97, &v97);
    v51 = [[UARPSuperBinaryAssetPayload alloc] initWithPayloadHeader:&v97];
    if (!v51)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[UARPSuperBinaryAsset decomposeToURL:error:](buf, (uint64_t)self, &v108);
      }
      goto LABEL_77;
    }
    v52 = v51;
    int v96 = 0;
    uarpTagStructUnpack32(DWORD1(v97), &v96);
    int v95 = 1380206659;
    if (uarp4ccCompare((unsigned __int8 *)&v96, (unsigned __int8 *)&v95))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[UARPSuperBinaryAsset decomposeToURL:error:](v105, (uint64_t)self, &v106);
      }
      goto LABEL_76;
    }
    [(UARPSuperBinaryAssetPayload *)v52 setSuperBinaryURL:*p_url];
    if (HIDWORD(v98))
    {
      if (![v8 uarpSeekToOffset:DWORD2(v98) error:v46]) {
        goto LABEL_93;
      }
      unint64_t v53 = [v8 uarpReadDataUpToLength:HIDWORD(v98) error:v46];
      [(UARPSuperBinaryAssetPayload *)v52 addMetaDataTLVs:v53];

      v45 = v92;
    }
    if (v6) {
      break;
    }
LABEL_75:
    [(NSMutableArray *)self->_payloads addObject:v52];
LABEL_76:

LABEL_77:
    ++v48;
    v47 += 40;
    if (v93 == v48) {
      goto LABEL_78;
    }
  }
  if ([v45 count])
  {
    v89 = [v45 objectAtIndex:v48];
    v88 = [v89 objectForKeyedSubscript:@"Payload Filepath"];
    if (v88) {
      goto LABEL_44;
    }
  }
  else
  {
    v89 = 0;
  }
  v54 = [(UARPSuperBinaryAssetPayload *)v52 tlvs];
  int v55 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347665 tlvs:v54];

  if (v55)
  {
    v88 = [v55 valueAsString];
  }
  else
  {
    v88 = 0;
  }

  BOOL v46 = v94;
  v45 = v92;
LABEL_44:
  if (!HIDWORD(v99)
    || -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:](v52, "expandPayloadToURL:payloadFilename:superbinary:offset:length:error:", v6, v88, v8, v99))
  {
    int v56 = [v89 objectForKeyedSubscript:@"Payload MetaData"];
    v86 = [v56 objectForKeyedSubscript:@"Payload Signature"];
    v87 = v56;
    if (v86)
    {
      int v57 = [(UARPSuperBinaryAssetPayload *)v52 tlvs];
      v58 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347654 tlvs:v57];

      if (v58)
      {
        unint64_t v59 = [v58 valueAsData];
        v60 = [NSURL URLWithString:v86 relativeToURL:v91];
        if (v60 && v59) {
          [v59 writeToURL:v60 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }
    v85 = [v56 objectForKeyedSubscript:@"Payload Signature (Development)"];
    if (v85)
    {
      v61 = [(UARPSuperBinaryAssetPayload *)v52 tlvs];
      char v62 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347669 tlvs:v61];

      if (v62)
      {
        v63 = [v62 valueAsData];
        v64 = [NSURL URLWithString:v85 relativeToURL:v91];
        if (v64 && v63) {
          [v63 writeToURL:v64 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }
    v84 = [v56 objectForKeyedSubscript:@"Payload Hash"];
    if (v84)
    {
      v65 = [(UARPSuperBinaryAssetPayload *)v52 tlvs];
      int v66 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347655 tlvs:v65];

      if (v66)
      {
        uint64_t v67 = [v66 valueAsData];
        v68 = [NSURL URLWithString:v84 relativeToURL:v91];
        if (v68 && v67) {
          [v67 writeToURL:v68 atomically:1];
        }

        int v56 = v87;
      }

      BOOL v46 = v94;
      v45 = v92;
    }
    v69 = [v56 objectForKeyedSubscript:@"Payload Certificate"];
    if (v69)
    {
      char v70 = [(UARPSuperBinaryAssetPayload *)v52 tlvs];
      v71 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347653 tlvs:v70];

      if (v71)
      {
        char v72 = [v71 valueAsData];
        v73 = [NSURL URLWithString:v69 relativeToURL:v91];
        if (v73 && v72) {
          [v72 writeToURL:v73 atomically:1];
        }
      }
      BOOL v46 = v94;
      v45 = v92;
      int v56 = v87;
    }

    id v6 = v91;
    id v8 = v83;
    goto LABEL_75;
  }

LABEL_93:
  char v74 = 0;
LABEL_79:

  id v9 = v81;
  id v16 = v78;
  uint64_t v10 = v79;
  v22 = v76;
  uint64_t v21 = v77;
LABEL_80:

LABEL_81:
LABEL_86:

LABEL_87:
  return v74;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"------------------\n"];
  [v3 appendFormat:@"SuperBinary Header\n"];
  [v3 appendFormat:@"------------------\n"];
  objc_msgSend(v3, "appendFormat:", @"Format Version  - %u\n", self->_superBinaryHeader.superBinaryFormatVersion);
  objc_msgSend(v3, "appendFormat:", @"Header Length   - %u\n", self->_superBinaryHeader.superBinaryHeaderLength);
  objc_msgSend(v3, "appendFormat:", @"Length          - %u\n", self->_superBinaryHeader.superBinaryLength);
  [v3 appendFormat:@"Version         - <"];
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.major);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.minor);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_superBinaryHeader.superBinaryVersion.release);
  objc_msgSend(v3, "appendFormat:", @"%u", self->_superBinaryHeader.superBinaryVersion.build);
  [v3 appendFormat:@">\n"];
  objc_msgSend(v3, "appendFormat:", @"SuperBinary MetaData Offset - %u\n", self->_superBinaryHeader.superBinaryMetadataOffset);
  objc_msgSend(v3, "appendFormat:", @"SuperBinary MetaData Length - %u\n", self->_superBinaryHeader.superBinaryMetadataLength);
  objc_msgSend(v3, "appendFormat:", @"Payloads Headers Offset - %u\n", self->_superBinaryHeader.payloadHeadersOffset);
  objc_msgSend(v3, "appendFormat:", @"Payloads Headers Length - %u\n", self->_superBinaryHeader.payloadHeadersLength);
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"-------------------------\n"];
  [v3 appendFormat:@"SuperBinary MetaData TLVs\n"];
  [v3 appendFormat:@"-------------------------\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_tlvs;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"\n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_payloads;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }

  [v3 appendFormat:@"-----------------\n"];
  [v3 appendFormat:@"SuperBinary Plist\n"];
  [v3 appendFormat:@"-----------------\n"];
  [v3 appendFormat:@"%@\n", self->_plistDictionary];
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"--------------\n"];
  [v3 appendFormat:@"MetaData Plist\n"];
  [v3 appendFormat:@"--------------\n"];
  uint64_t v14 = [(UARPSuperBinaryMetaDataTable *)self->_metaDataTable dict];
  [v3 appendFormat:@"%@\n", v14];

  [v3 appendFormat:@"\n"];
  return v3;
}

- (id)computeHash
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  url = self->_url;
  id v19 = 0;
  uint64_t v5 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:url error:&v19];
  id v6 = v19;
  id v18 = 0;
  int v7 = [v5 uarpSeekToOffset:0 error:&v18];
  id v8 = v18;

  if (v7)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    id v9 = 0;
    do
    {
      uint64_t v10 = v8;
      id v16 = 0;
      uint64_t v11 = [v5 uarpReadDataUpToLength:4096 error:&v16];
      id v8 = v16;

      id v9 = v11;
      CC_SHA256_Update(&c, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    }
    while ([v9 length] == 4096);
    id v15 = 0;
    [v5 uarpCloseAndReturnError:&v15];
    id v12 = v15;

    CC_SHA256_Final(md, &c);
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  }
  else
  {
    id v12 = v8;
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger superBinaryMetadataLength = self->_superBinaryHeader.superBinaryMetadataLength;
  NSUInteger superBinaryMetadataOffset = self->_superBinaryHeader.superBinaryMetadataOffset;
  result.length = superBinaryMetadataLength;
  result.location = superBinaryMetadataOffset;
  return result;
}

- (BOOL)exportSuperBinaryContentToFilepath:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:self->_url error:a5];
  uint64_t v11 = v10;
  if (v10 && [v10 uarpSeekToOffset:location error:a5])
  {
    id v12 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v9 error:a5];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      do
      {
        if (length >= 0x1000) {
          uint64_t v14 = 4096;
        }
        else {
          uint64_t v14 = length;
        }
        uint64_t v15 = [v11 uarpReadDataUpToLength:v14 error:a5];
        if (!v15) {
          break;
        }
        id v16 = (void *)v15;
        int v17 = [v12 uarpWriteData:v15 error:a5];
        if (!v17) {
          uint64_t v14 = 0;
        }

        if (!v17) {
          break;
        }
        length -= v14;
      }
      while (length);
      [v11 uarpCloseAndReturnError:a5];
      [v12 uarpCloseAndReturnError:a5];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)prepareMetaData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  metaData = self->_metaData;
  self->_metaData = v3;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_tlvs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "generateTLV:", 0, (void)v13);
        [(NSMutableData *)self->_metaData appendData:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithData:self->_metaData];
  return v11;
}

- (id)payloadData:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  if ([(NSMutableArray *)self->_payloads containsObject:v9])
  {
    uint64_t v10 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:self->_url error:a5];
    if (v10
      && objc_msgSend(v10, "uarpSeekToOffset:error:", objc_msgSend(v9, "rangePayload") + location, a5))
    {
      uint64_t v11 = [v10 uarpReadDataUpToLength:length error:a5];
      if (v11 && [v10 uarpCloseAndReturnError:a5]) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)processVersionString:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = [a3 valueAsURL];
  id v8 = [v4 stringWithContentsOfURL:v5 encoding:4 error:0];

  uint64_t v6 = [[UARPAssetVersion alloc] initWithVersionString:v8];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (void)processBVERVersionString:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = [a3 valueAsURL];
  id v8 = [v4 stringWithContentsOfURL:v5 encoding:4 error:0];

  uint64_t v6 = [[UARPAssetVersion alloc] initWithBVERString:v8];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 120, 1);
}

- (UARPAssetTag)assetTag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)timeCreated
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_timeCreated, 0);
  objc_storeStrong((id *)&self->_assetTag, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_plistDictionary, 0);
  objc_storeStrong((id *)&self->_metaDataTable, 0);
  objc_storeStrong((id *)&self->_plistMetaData, 0);
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
}

- (void)addMetaDataTLV:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "attempting to add a nil tlv to superbinary %@", v1, v2, v3, v4, v5);
}

- (void)addPayload:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "attempting to add a nil payload to superbinary %@", v1, v2, v3, v4, v5);
}

- (void)writeToURL:payloadStartOffset:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "%@", v1, v2, v3, v4, v5);
}

- (void)writeToURL:(uint64_t)a3 payloadStartOffset:(void *)a4 error:.cold.12(uint8_t *a1, id *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = objc_msgSend(*a2, "objectAtIndexedSubscript:");
  *(_DWORD *)a1 = 138412290;
  *a4 = v6;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Missing payload\n%@", a1, 0xCu);
}

- (void)parseFromPlistSuperBinaryPayloads:(uint8_t *)buf payloadsURL:(uint64_t)a2 error:(void *)a3 .cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "attempting to add a nil header payload to payload %@", buf, 0xCu);
}

- (void)parseFromPlistSuperBinaryPayloads:payloadsURL:error:.cold.2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to expand superbinary payload", v0, 2u);
}

- (void)decomposeToURL:(uint64_t *)a1 error:(uint64_t)a2 .cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error opening URL %@ to decompose superbinary; error is %@",
    (uint8_t *)&v3,
    0x16u);
}

- (void)decomposeToURL:(void *)a3 error:.cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "attempting to decompose a nil payload for superbinary %@", buf, 0xCu);
}

- (void)decomposeToURL:(void *)a3 error:.cold.3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "skipping CHDR payload for superbinary %@", buf, 0xCu);
}

@end