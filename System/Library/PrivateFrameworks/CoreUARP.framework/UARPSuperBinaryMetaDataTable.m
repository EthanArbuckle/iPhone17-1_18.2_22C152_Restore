@interface UARPSuperBinaryMetaDataTable
+ (unsigned)compressionAlgorithmFromString:(id)a3;
- (BOOL)expandPlist:(id *)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSArray)values;
- (NSDictionary)dict;
- (NSNumber)formatVersion;
- (UARPSuperBinaryMetaDataTable)initWithDictionary:(id)a3;
- (UARPSuperBinaryMetaDataTable)initWithPlist:(id)a3;
- (id)createTLVWithType:(unint64_t)a3 keyValue:(id)a4 payloadsURL:(id)a5 isFilepath:(BOOL)a6;
- (id)initAppleSpecificWithFormatVersion:(id)a3;
- (id)initVendorAgnosticWithFormatVersion:(id)a3;
- (id)tlvArrayWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6;
- (id)tlvWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6;
- (void)addAnalyticsTLVs2;
- (void)addAppleSpecificTLVs;
- (void)addComposeTLVs2;
- (void)addDeviceSpecificTLVs2;
- (void)addHeySiriModelTLVs2;
- (void)addHostSpecificTLVs;
- (void)addHostSpecificTLVs2;
- (void)addLogsTLVs2;
- (void)addMappedAnalyticsTlvs;
- (void)addPersonalizationTLVs2;
- (void)addSysconfigTlvs;
- (void)addTLV:(unint64_t)a3 keyValue16:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue32:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue64:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue8:(id)a4 tlvArray:(id)a5;
- (void)addTLV:(unint64_t)a3 keyValue:(id)a4 tlvArray:(id)a5 payloadsURL:(id)a6 isFilepath:(BOOL)a7;
- (void)addTLV:(unint64_t)a3 legacyTLV:(unint64_t)a4 keyValue:(id)a5 tlvArray:(id)a6 payloadsURL:(id)a7 isFilepath:(BOOL)a8;
- (void)addTLV:(unint64_t)a3 versionString:(id)a4 tlvArray:(id)a5;
- (void)addTLVCompressPayloadAlgorithm:(id)a3 tlvArray:(id)a4;
- (void)addTLVs:(unint64_t)a3 excludedHwRevisions:(id)a4 tlvArray:(id)a5;
- (void)addVoiceAssistTLVs2;
@end

@implementation UARPSuperBinaryMetaDataTable

- (UARPSuperBinaryMetaDataTable)initWithPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = [(UARPSuperBinaryMetaDataTable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    plist = v5->_plist;
    v5->_plist = (NSURL *)v6;
  }
  return v5;
}

- (UARPSuperBinaryMetaDataTable)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = [(UARPSuperBinaryMetaDataTable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;
  }
  return v5;
}

- (id)initAppleSpecificWithFormatVersion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = [(UARPSuperBinaryMetaDataTable *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v5->_values;
    v5->_values = v6;

    uint64_t v8 = [v4 copy];
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if ([(NSNumber *)v5->_formatVersion unsignedIntegerValue] == 1)
    {
      [(UARPSuperBinaryMetaDataTable *)v5 addAppleSpecificTLVs];
      [(UARPSuperBinaryMetaDataTable *)v5 addHostSpecificTLVs];
    }
    else
    {
      [(UARPSuperBinaryMetaDataTable *)v5 addDeviceSpecificTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addHeySiriModelTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addPersonalizationTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addHostSpecificTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addVoiceAssistTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addLogsTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addAnalyticsTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addComposeTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addSysconfigTlvs];
    }
  }

  return v5;
}

- (id)initVendorAgnosticWithFormatVersion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryMetaDataTable;
  v5 = [(UARPSuperBinaryMetaDataTable *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v5->_values;
    v5->_values = v6;

    uint64_t v8 = [v4 copy];
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSNumber *)v8;

    if ([(NSNumber *)v5->_formatVersion unsignedIntegerValue] == 1)
    {
      [(UARPSuperBinaryMetaDataTable *)v5 addHostSpecificTLVs];
    }
    else
    {
      [(UARPSuperBinaryMetaDataTable *)v5 addDeviceSpecificTLVs2];
      [(UARPSuperBinaryMetaDataTable *)v5 addHostSpecificTLVs2];
    }
  }

  return v5;
}

- (NSArray)values
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_values];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v7 setObject:self->_values forKey:@"MetaData Values"];
  if ([(NSNumber *)self->_formatVersion unsignedIntegerValue] >= 2) {
    [v7 setObject:self->_formatVersion forKey:@"MetaData Format Version"];
  }
  char v8 = [v7 writeToURL:v6 error:a4];

  return v8;
}

- (BOOL)expandPlist:(id *)a3
{
  v5 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:self->_plist];
  id v6 = v5;
  if (!v5)
  {
    v13 = [NSString stringWithFormat:@"cannot expand metadata plist"];
    v14 = objc_opt_new();
    [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08320]];
    v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v14];
    v16 = v15;
    if (a3) {
      *a3 = v15;
    }

    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x263EFF980];
  char v8 = [v5 objectForKeyedSubscript:@"MetaData Values"];
  objc_super v9 = [v7 arrayWithArray:v8];
  values = self->_values;
  self->_values = v9;

  objc_super v11 = [v6 objectForKeyedSubscript:@"MetaData Format Version"];
  formatVersion = self->_formatVersion;
  self->_formatVersion = v11;

  v13 = self->_formatVersion;
  if (!v13)
  {
    self->_formatVersion = (NSNumber *)&unk_26CEFD960;
LABEL_7:
  }
  return v6 != 0;
}

- (id)tlvWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  id v6 = [(UARPSuperBinaryMetaDataTable *)self tlvArrayWithKey:a3 keyValue:a4 payloadsURL:a5 error:a6];
  id v7 = [v6 firstObject];

  return v7;
}

- (id)tlvArrayWithKey:(id)a3 keyValue:(id)a4 payloadsURL:(id)a5 error:(id *)a6
{
  id v41 = a3;
  id v39 = a4;
  id v36 = a5;
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = [(NSMutableArray *)self->_values count];
  if (!v9) {
    goto LABEL_57;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v40 = v9;
  unint64_t v12 = 0x263F08000uLL;
  unint64_t v13 = 0x263EFF000uLL;
  while (1)
  {
    v14 = -[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", v11, v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = 0;
        v16 = 0;
        goto LABEL_12;
      }
      unint64_t v19 = v12;
      v20 = self;
      unint64_t v21 = v13;
      id v22 = v14;
      v23 = [v22 objectForKey:@"Filepath"];
      uint64_t v17 = [v23 BOOLValue];
      id v15 = [v22 objectForKey:@"Name"];
      v16 = [v22 objectForKey:@"Value"];

      uint64_t v18 = v11;
      if (v16) {
        uint64_t v18 = [v16 unsignedIntegerValue];
      }

      unint64_t v13 = v21;
      self = v20;
      unint64_t v12 = v19;
      uint64_t v10 = v40;
    }
    if ([v15 isEqualToString:v41]) {
      break;
    }
LABEL_12:

    if (v10 == ++v11) {
      goto LABEL_57;
    }
  }
  if (v18 > 3291140095)
  {
    if (v18 <= 3436347647)
    {
      if (v18 == 3291140096 || v18 == 3291140105)
      {
LABEL_42:
        [(UARPSuperBinaryMetaDataTable *)self addTLV:v18 keyValue32:v39 tlvArray:v38];
        goto LABEL_56;
      }
      if (v18 == 3291140106)
      {
        [(UARPSuperBinaryMetaDataTable *)self addTLVs:3291140106 excludedHwRevisions:v39 tlvArray:v38];
        goto LABEL_56;
      }
    }
    else
    {
      switch(v18)
      {
        case 3436347648:
          v24 = self;
          uint64_t v25 = 3436347648;
          uint64_t v26 = 0;
          goto LABEL_55;
        case 3436347649:
          uint64_t v25 = 3436347649;
          v24 = self;
          uint64_t v26 = 1;
          goto LABEL_55;
        case 3436347650:
          uint64_t v25 = 3436347650;
          v24 = self;
          uint64_t v26 = 2;
          goto LABEL_55;
        case 3436347651:
          uint64_t v25 = 3436347651;
          v24 = self;
          uint64_t v26 = 3;
          goto LABEL_55;
        case 3436347652:
          uint64_t v25 = 3436347652;
          v24 = self;
          uint64_t v26 = 4;
          goto LABEL_55;
        case 3436347653:
          uint64_t v25 = 3436347653;
          v24 = self;
          uint64_t v26 = 5;
          goto LABEL_55;
        case 3436347654:
          uint64_t v25 = 3436347654;
          v24 = self;
          uint64_t v26 = 6;
          goto LABEL_55;
        case 3436347655:
          uint64_t v25 = 3436347655;
          v24 = self;
          uint64_t v26 = 7;
LABEL_55:
          [(UARPSuperBinaryMetaDataTable *)v24 addTLV:v25 legacyTLV:v26 keyValue:v39 tlvArray:v38 payloadsURL:v36 isFilepath:v17];
          goto LABEL_56;
        case 3436347656:
        case 3436347657:
        case 3436347658:
        case 3436347665:
        case 3436347667:
        case 3436347668:
        case 3436347669:
        case 3436347672:
          break;
        case 3436347659:
        case 3436347661:
        case 3436347662:
        case 3436347664:
        case 3436347666:
        case 3436347671:
          goto LABEL_29;
        case 3436347660:
          [(UARPSuperBinaryMetaDataTable *)self addTLVCompressPayloadAlgorithm:v39 tlvArray:v38];
          goto LABEL_56;
        case 3436347663:
        case 3436347673:
          goto LABEL_42;
        case 3436347670:
          goto LABEL_56;
        case 3436347674:
          goto LABEL_17;
        default:
          if (v18 == 4042160641)
          {
LABEL_43:
            v28 = self;
            uint64_t v29 = v18;
            id v31 = v38;
            id v30 = v39;
            id v32 = v36;
            uint64_t v33 = 0;
            goto LABEL_45;
          }
          if (v18 == 4042160643)
          {
LABEL_17:
            [(UARPSuperBinaryMetaDataTable *)self addTLV:v18 keyValue8:v39 tlvArray:v38];
            goto LABEL_56;
          }
          break;
      }
    }
  }
  else
  {
    if (v18 > 2293403930)
    {
      switch(v18)
      {
        case 2293403931:
          [(UARPSuperBinaryMetaDataTable *)self addTLV:2293403931 keyValue64:v39 tlvArray:v38];
          break;
        case 2293403932:
          [(UARPSuperBinaryMetaDataTable *)self composeMatchingPayloads:v39 tlvArray:v38];
          break;
        case 2293403933:
        case 2293403934:
        case 2293403935:
        case 2293403936:
        case 2293403939:
        case 2293403940:
        case 2293403943:
        case 2293403945:
        case 2293403946:
        case 2293403947:
        case 2293403948:
        case 2293403949:
        case 2293403950:
        case 2293403951:
        case 2293403952:
          goto LABEL_44;
        case 2293403937:
        case 2293403938:
        case 2293403942:
        case 2293403944:
        case 2293403953:
        case 2293403954:
        case 2293403955:
          goto LABEL_17;
        case 2293403941:
          goto LABEL_42;
        default:
          switch(v18)
          {
            case 3166200576:
            case 3166200579:
              v27 = UARPPayloadHashAlgorithmStringToValue(v39);
              [(UARPSuperBinaryMetaDataTable *)self addTLV:v18 keyValue16:v27 tlvArray:v38];

              break;
            case 3166200577:
            case 3166200578:
              [(UARPSuperBinaryMetaDataTable *)self composeMeasuredPayloads:v39 tlvType:v18 tlvArray:v38 payloadsURL:v36];
              break;
            case 3166200580:
              [(UARPSuperBinaryMetaDataTable *)self composeRequiredPersonalizationOptions:v39 tlvArray:v38];
              break;
            case 3166200581:
            case 3166200582:
              v28 = self;
              uint64_t v29 = v18;
              id v31 = v38;
              id v30 = v39;
              id v32 = v36;
              uint64_t v33 = 1;
              goto LABEL_45;
            case 3166200583:
              goto LABEL_17;
            default:
              goto LABEL_44;
          }
          break;
      }
      goto LABEL_56;
    }
    if (v18 > 538280447)
    {
      switch(v18)
      {
        case 1619725824:
        case 1619725827:
        case 1619725832:
          goto LABEL_29;
        case 1619725825:
        case 1619725826:
        case 1619725828:
        case 1619725829:
        case 1619725830:
          goto LABEL_44;
        case 1619725831:
          goto LABEL_34;
        default:
          if (v18 == 538280448) {
            goto LABEL_43;
          }
          if (v18 == 538280449) {
            goto LABEL_42;
          }
          goto LABEL_44;
      }
    }
    if (v18 == 76079616 || v18 == 76079619)
    {
LABEL_29:
      [(UARPSuperBinaryMetaDataTable *)self addTLV:v18 keyValue16:v39 tlvArray:v38];
      goto LABEL_56;
    }
    if (v18 == 76079623)
    {
LABEL_34:
      [(UARPSuperBinaryMetaDataTable *)self addTLV:v18 versionString:v39 tlvArray:v38];
      goto LABEL_56;
    }
  }
LABEL_44:
  v28 = self;
  uint64_t v29 = v18;
  id v31 = v38;
  id v30 = v39;
  id v32 = v36;
  uint64_t v33 = v17;
LABEL_45:
  [(UARPSuperBinaryMetaDataTable *)v28 addTLV:v29 keyValue:v30 tlvArray:v31 payloadsURL:v32 isFilepath:v33];
LABEL_56:

LABEL_57:
  v34 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v38, v36);

  return v34;
}

- (void)addAppleSpecificTLVs
{
  [(NSMutableArray *)self->_values addObject:@"Payload Filepath"];
  [(NSMutableArray *)self->_values addObject:@"Payload Long Name"];
  [(NSMutableArray *)self->_values addObject:@"Minimum Required Version"];
  [(NSMutableArray *)self->_values addObject:@"Ignore Version"];
  [(NSMutableArray *)self->_values addObject:@"Urgent Update"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Payload Certificate" forKeyedSubscript:@"Name"];
  uint64_t v4 = MEMORY[0x263EFFA88];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Payload Signature" forKeyedSubscript:@"Name"];
  [v5 setObject:v4 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Payload Hash" forKeyedSubscript:@"Name"];
  [v6 setObject:v4 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v6];
  [(NSMutableArray *)self->_values addObject:@"Personalization Required"];
  [(NSMutableArray *)self->_values addObject:@"Personalization Payload Tag"];
  [(NSMutableArray *)self->_values addObject:@"Personalization SuperBinary AssetID"];
  [(NSMutableArray *)self->_values addObject:@"Personalization Manifest Prefix"];
}

- (void)addDeviceSpecificTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Payload Filepath" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFD978 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Payload Long Name" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFD990 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Minimum Required Version" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFD9A8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Ignore Version" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFD9C0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"Urgent Update" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFD9D8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"Payload Certificate" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFD9F0 forKeyedSubscript:@"Value"];
  uint64_t v9 = MEMORY[0x263EFFA88];
  [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"Payload Signature" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFDA08 forKeyedSubscript:@"Value"];
  [v10 setObject:v9 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v10];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v11 setObject:@"Payload Hash" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_26CEFDA20 forKeyedSubscript:@"Value"];
  [v11 setObject:v9 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v11];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v12 setObject:@"Payload Digest" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_26CEFDA38 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v13 setObject:@"Minimum Battery Level" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_26CEFDA50 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v13];
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v14 setObject:@"Trigger Battery Level" forKeyedSubscript:@"Name"];
  [v14 setObject:&unk_26CEFDA68 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v14];
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v15 setObject:@"Payload Compression ChunkSize" forKeyedSubscript:@"Name"];
  [v15 setObject:&unk_26CEFDA80 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v15];
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v16 setObject:@"Payload Compression Algorithm" forKeyedSubscript:@"Name"];
  [v16 setObject:&unk_26CEFDA98 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v16];
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v17 setObject:@"Flash Partition Bitmap" forKeyedSubscript:@"Name"];
  [v17 setObject:&unk_26CEFDAB0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v17];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v18 setObject:@"Flash Partition Boot" forKeyedSubscript:@"Name"];
  [v18 setObject:&unk_26CEFDAC8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v18];
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v19 setObject:@"Compressed Headers Payload Index" forKeyedSubscript:@"Name"];
  [v19 setObject:&unk_26CEFDAE0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v19];
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v20 setObject:@"Erase Option" forKeyedSubscript:@"Name"];
  [v20 setObject:&unk_26CEFDAF8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v20];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v21 setObject:@"Payload Expand Filename" forKeyedSubscript:@"Name"];
  [v21 setObject:&unk_26CEFDB10 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v21];
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v22 setObject:@"Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v22 setObject:&unk_26CEFDB28 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v22];
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v23 setObject:@"Compressed Headers" forKeyedSubscript:@"Name"];
  [v23 setObject:&unk_26CEFDB40 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v23];
  id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v24 setObject:@"Payload Description" forKeyedSubscript:@"Name"];
  [v24 setObject:&unk_26CEFDB58 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v24];
  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v25 setObject:@"Payload Signature (Development)" forKeyedSubscript:@"Name"];
  [v25 setObject:&unk_26CEFDB70 forKeyedSubscript:@"Value"];
  [v25 setObject:v9 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v25];
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v26 setObject:@"Device Specific Data" forKeyedSubscript:@"Name"];
  [v26 setObject:&unk_26CEFDB88 forKeyedSubscript:@"Value"];
  [v26 setObject:v9 forKeyedSubscript:@"Filepath"];
  [(NSMutableArray *)self->_values addObject:v26];
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v27 setObject:@"MetaData Hash Algorithm" forKeyedSubscript:@"Name"];
  [v27 setObject:&unk_26CEFDBA0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v27];
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v28 setObject:@"MetaData Hash" forKeyedSubscript:@"Name"];
  [v28 setObject:&unk_26CEFDBB8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v28];
  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v29 setObject:@"Uncompressed Payload Length" forKeyedSubscript:@"Name"];
  [v29 setObject:&unk_26CEFDBD0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v29];
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v30 setObject:@"No Compressed Headers" forKeyedSubscript:@"Name"];
  [v30 setObject:&unk_26CEFDBE8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v30];
}

- (void)addHostSpecificTLVs
{
  [(NSMutableArray *)self->_values addObject:@"Host Minimum Battery Level"];
  [(NSMutableArray *)self->_values addObject:@"Host Inactive To Stage Asset"];
  [(NSMutableArray *)self->_values addObject:@"Host Inactive To Apply Asset"];
  [(NSMutableArray *)self->_values addObject:@"Host Network Delay"];
  values = self->_values;
  [(NSMutableArray *)values addObject:@"Host Reconnect After Apply"];
}

- (void)addHeySiriModelTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"HeySiri Model Type" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFDC00 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"HeySiri Model Locale" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFDC18 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"HeySiri Model Hash" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFDC30 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"HeySiri Model Role" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFDC48 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"HeySiri Model Digest" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFDC60 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"HeySiri Model Signature" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFDC78 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v9 setObject:@"HeySiri Model Certificate" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_26CEFDC90 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"HeySiri Model Engine Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFDCA8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v10];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v11 setObject:@"HeySiri Model Engine Type" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_26CEFDCC0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v11];
}

- (void)addVoiceAssistTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Voice Assist Type" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFDCD8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Voice Assist Locale" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFDCF0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Voice Assist Hash" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFDD08 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Voice Assist Role" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFDD20 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"Voice Assist Digest" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFDD38 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"Voice Assist Signature" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFDD50 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v9 setObject:@"Voice Assist Certificate" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_26CEFDD68 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"Voice Assist Engine Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFDD80 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v10];
}

- (void)addPersonalizationTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Personalization Required" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFDD98 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Personalization Payload Tag" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFDDB0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Personalization SuperBinary AssetID" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFDDC8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Personalization Manifest Prefix" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFDDE0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"Personalization Board ID" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFDDF8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"Personalization Chip ID" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFDE10 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v9 setObject:@"Personalization ECID" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_26CEFDE28 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"Personalization ECID Data" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFDE40 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v10];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v11 setObject:@"Personalization Nonce" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_26CEFDE58 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v11];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v12 setObject:@"Personalization Nonce Hash" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_26CEFDE70 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v13 setObject:@"Personalization Security Domain" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_26CEFDE88 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v13];
  id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v14 setObject:@"Personalization Security Mode" forKeyedSubscript:@"Name"];
  [v14 setObject:&unk_26CEFDEA0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v14];
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v15 setObject:@"Personalization Production Mode" forKeyedSubscript:@"Name"];
  [v15 setObject:&unk_26CEFDEB8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v15];
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v16 setObject:@"Personalization Chip Epoch" forKeyedSubscript:@"Name"];
  [v16 setObject:&unk_26CEFDED0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v16];
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v17 setObject:@"Personalization Enable Mix Match" forKeyedSubscript:@"Name"];
  [v17 setObject:&unk_26CEFDEE8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v17];
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v18 setObject:@"Personalization SuperBinary Payload Index" forKeyedSubscript:@"Name"];
  [v18 setObject:&unk_26CEFDF00 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v18];
  id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v19 setObject:@"Personalization Chip Revision" forKeyedSubscript:@"Name"];
  [v19 setObject:&unk_26CEFDF18 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v19];
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v20 setObject:@"Personalization FTAB Payload" forKeyedSubscript:@"Name"];
  [v20 setObject:&unk_26CEFDF30 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v20];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v21 setObject:@"Personalization FTAB Payload Tag" forKeyedSubscript:@"Name"];
  [v21 setObject:&unk_26CEFDF48 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v21];
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v22 setObject:@"Personalization FTAB Payload Longname" forKeyedSubscript:@"Name"];
  [v22 setObject:&unk_26CEFDF60 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v22];
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v23 setObject:@"Personalization FTAB Payload Digest" forKeyedSubscript:@"Name"];
  [v23 setObject:&unk_26CEFDF78 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v23];
  id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v24 setObject:@"Personalization FTAB Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v24 setObject:&unk_26CEFDF90 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v24];
  id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v25 setObject:@"Personalization FTAB Payload Security Mode" forKeyedSubscript:@"Name"];
  [v25 setObject:&unk_26CEFDFA8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v25];
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v26 setObject:@"Personalization FTAB Payload Production Mode" forKeyedSubscript:@"Name"];
  [v26 setObject:&unk_26CEFDFC0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v26];
  id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v27 setObject:@"Personalization FTAB Payload Trusted" forKeyedSubscript:@"Name"];
  [v27 setObject:&unk_26CEFDFD8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v27];
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v28 setObject:@"Personalization SoC Live Nonce" forKeyedSubscript:@"Name"];
  [v28 setObject:&unk_26CEFDFF0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v28];
  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v29 setObject:@"Personalization FTAB Payload Security Mode Host Override" forKeyedSubscript:@"Name"];
  [v29 setObject:&unk_26CEFE008 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v29];
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v30 setObject:@"Personalization FTAB Payload Production Mode Host Override" forKeyedSubscript:@"Name"];
  [v30 setObject:&unk_26CEFE020 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v30];
  id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v31 setObject:@"Personalization Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v31 setObject:&unk_26CEFDF90 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v31];
  id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v32 setObject:@"Personalization Payload Longname" forKeyedSubscript:@"Name"];
  [v32 setObject:&unk_26CEFDF60 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v32];
  id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v33 setObject:@"Personalization Payload Effective Security Mode" forKeyedSubscript:@"Name"];
  [v33 setObject:&unk_26CEFDFA8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v33];
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v34 setObject:@"Personalization Payload Effective Production Mode" forKeyedSubscript:@"Name"];
  [v34 setObject:&unk_26CEFDFC0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v34];
  id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v35 setObject:@"Personalization Payload Trusted" forKeyedSubscript:@"Name"];
  [v35 setObject:&unk_26CEFDFD8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v35];
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v36 setObject:@"Personalization Payload Digest" forKeyedSubscript:@"Name"];
  [v36 setObject:&unk_26CEFDF78 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v36];
  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v37 setObject:@"Personalization Board ID (64 bits)" forKeyedSubscript:@"Name"];
  [v37 setObject:&unk_26CEFE038 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v37];
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v38 setObject:@"Personalization Matching Data" forKeyedSubscript:@"Name"];
  [v38 setObject:&unk_26CEFE050 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v38];
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v39 setObject:@"Personalization Matching Data Product Revision Minimum" forKeyedSubscript:@"Name"];
  [v39 setObject:&unk_26CEFE068 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v39];
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v40 setObject:@"Personalization Matching Data Product Revision Maximum" forKeyedSubscript:@"Name"];
  [v40 setObject:&unk_26CEFE080 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v40];
  id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v41 setObject:@"Personalization Matching Data Payload Tags" forKeyedSubscript:@"Name"];
  [v41 setObject:&unk_26CEFE098 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v41];
  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v42 setObject:@"Personalization Digest List Size" forKeyedSubscript:@"Name"];
  [v42 setObject:&unk_26CEFE0B0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v42];
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v43 setObject:@"Personalization Prefix Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v43 setObject:&unk_26CEFE0C8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v43];
  id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v44 setObject:@"Personalization Suffix Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v44 setObject:&unk_26CEFE0E0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v44];
  id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v45 setObject:@"Personalization Payload Demotion Security Mode" forKeyedSubscript:@"Name"];
  [v45 setObject:&unk_26CEFE0F8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v45];
  id v46 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v46 setObject:@"Personalization Payload Demotion Production Mode" forKeyedSubscript:@"Name"];
  [v46 setObject:&unk_26CEFE110 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v46];
  id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v47 setObject:@"Personalization Logical Unit Number" forKeyedSubscript:@"Name"];
  [v47 setObject:&unk_26CEFE128 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v47];
  id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v48 setObject:@"Personalization Ticket Needs Logical Unit Number" forKeyedSubscript:@"Name"];
  [v48 setObject:&unk_26CEFE140 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v48];
  id v49 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v49 setObject:@"Personalization More Requests to Follow" forKeyedSubscript:@"Name"];
  [v49 setObject:&unk_26CEFE158 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v49];
  id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v50 setObject:@"Host Personalization Required" forKeyedSubscript:@"Name"];
  [v50 setObject:&unk_26CEFE170 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v50];
  id v51 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v51 setObject:@"Required Personalization Option" forKeyedSubscript:@"Name"];
  [v51 setObject:&unk_26CEFE188 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v51];
  id v52 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v52 setObject:@"Personalized Manifest" forKeyedSubscript:@"Name"];
  [v52 setObject:&unk_26CEFE1A0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v52];
  id v53 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v53 setObject:@"Personalization Life" forKeyedSubscript:@"Name"];
  [v53 setObject:&unk_26CEFE1B8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v53];
  id v54 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v54 setObject:@"Personalization Provisioning" forKeyedSubscript:@"Name"];
  [v54 setObject:&unk_26CEFE1D0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v54];
  id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v55 setObject:@"Personalization Manifest Epoch" forKeyedSubscript:@"Name"];
  [v55 setObject:&unk_26CEFE1E8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v55];
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v56 setObject:@"Personalization Manifest Suffix" forKeyedSubscript:@"Name"];
  [v56 setObject:&unk_26CEFE200 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v56];
  id v57 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v57 setObject:@"Personalization FTAB Payload Digest Filename" forKeyedSubscript:@"Name"];
  [v57 setObject:&unk_26CEFE218 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v57];
  id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v58 setObject:@"Personalization Payload Digest Filename" forKeyedSubscript:@"Name"];
  [v58 setObject:&unk_26CEFE218 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v58];
}

- (void)addHostSpecificTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Host Minimum Battery Level" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE230 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Host Inactive To Stage Asset" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE248 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Host Inactive To Apply Asset" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFE260 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Host Network Delay" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFE278 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"Host Reconnect After Apply" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFE290 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"Minimum iOS Version" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFE2A8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v9 setObject:@"Minimum macOS Version" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_26CEFE2C0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"Minimum tvOS Version" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFE2D8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v10];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v11 setObject:@"Minimum watchOS Version" forKeyedSubscript:@"Name"];
  [v11 setObject:&unk_26CEFE2F0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v11];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v12 setObject:@"Host Trigger Battery Level" forKeyedSubscript:@"Name"];
  [v12 setObject:&unk_26CEFE308 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v12];
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v13 setObject:@"Excluded Hardware Version" forKeyedSubscript:@"Name"];
  [v13 setObject:&unk_26CEFE320 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v13];
}

- (void)addLogsTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Log Friendly Name" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE338 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Log Apple Model Number" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE350 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Log Serial Number" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFE368 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
}

- (void)addAnalyticsTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Analytics Event Name" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE380 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Analytics Payload Type" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE398 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
}

- (void)addComposeTLVs2
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Compose Payload Hash Algorithm" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE3B0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Compose Measured Payloads" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE3C8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Compose Measured Payloads (Non-FTAB)" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFE3E0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v6 setObject:@"Compose MetaData Hash Algorithm" forKeyedSubscript:@"Name"];
  [v6 setObject:&unk_26CEFE3F8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v6];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v7 setObject:@"Personalization Options Required" forKeyedSubscript:@"Name"];
  [v7 setObject:&unk_26CEFE410 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v8 setObject:@"Version File" forKeyedSubscript:@"Name"];
  [v8 setObject:&unk_26CEFE428 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v8];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v9 setObject:@"Version BVER File" forKeyedSubscript:@"Name"];
  [v9 setObject:&unk_26CEFE440 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v9];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v10 setObject:@"Property List Payload" forKeyedSubscript:@"Name"];
  [v10 setObject:&unk_26CEFE458 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v10];
}

- (void)addMappedAnalyticsTlvs
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Log Apple Model Number" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE470 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Mapped Analytics Event ID" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE488 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
}

- (void)addSysconfigTlvs
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:@"Sysconfig Region Code" forKeyedSubscript:@"Name"];
  [v3 setObject:&unk_26CEFE4A0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v4 setObject:@"Sysconfig Manufacturing Part Number" forKeyedSubscript:@"Name"];
  [v4 setObject:&unk_26CEFE4B8 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);

  [v5 setObject:@"Sysconfig Regulatory Model Number" forKeyedSubscript:@"Name"];
  [v5 setObject:&unk_26CEFE4D0 forKeyedSubscript:@"Value"];
  [(NSMutableArray *)self->_values addObject:v5];
}

- (id)createTLVWithType:(unint64_t)a3 keyValue:(id)a4 payloadsURL:(id)a5 isFilepath:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    id v11 = [NSURL fileURLWithPath:v9 relativeToURL:v10];
    id v12 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 urlValue:v11];

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 stringValue:v9];
LABEL_10:
    id v12 = v13;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", a3, [v9 unsignedLongValue]);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 dataValue:v9];
    goto LABEL_10;
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (unsigned)compressionAlgorithmFromString:(id)a3
{
  return 0;
}

- (void)addTLV:(unint64_t)a3 keyValue:(id)a4 tlvArray:(id)a5 payloadsURL:(id)a6 isFilepath:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  id v12 = [(UARPSuperBinaryMetaDataTable *)self createTLVWithType:a3 keyValue:a4 payloadsURL:a6 isFilepath:v7];
  if (v12) {
    [v13 addObject:v12];
  }
}

- (void)addTLV:(unint64_t)a3 legacyTLV:(unint64_t)a4 keyValue:(id)a5 tlvArray:(id)a6 payloadsURL:(id)a7 isFilepath:(BOOL)a8
{
  BOOL v8 = a8;
  id v16 = a5;
  id v14 = a6;
  id v15 = a7;
  [(UARPSuperBinaryMetaDataTable *)self addTLV:a3 keyValue:v16 tlvArray:v14 payloadsURL:v15 isFilepath:v8];
  if ([(NSNumber *)self->_formatVersion unsignedIntegerValue] <= 2) {
    [(UARPSuperBinaryMetaDataTable *)self addTLV:a4 keyValue:v16 tlvArray:v14 payloadsURL:v15 isFilepath:v8];
  }
}

- (void)addTLV:(unint64_t)a3 keyValue8:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt8:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt8:", a3, [v7 unsignedCharValue]);
    [v8 addObject:v9];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:]();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue16:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", a3, [v7 unsignedShortValue]);
    [v8 addObject:v9];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:]();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue32:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", a3, [v7 unsignedLongValue]);
    [v8 addObject:v9];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:]();
  }
}

- (void)addTLV:(unint64_t)a3 keyValue64:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt64:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt64:", a3, [v7 unsignedLongLongValue]);
    [v8 addObject:v9];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:keyValue8:tlvArray:]();
  }
}

- (void)addTLVCompressPayloadAlgorithm:(id)a3 tlvArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v8 = +[UARPSuperBinaryMetaDataTable compressionAlgorithmFromString:v6];
    id v9 = [NSNumber numberWithUnsignedLong:v8];
    [(UARPSuperBinaryMetaDataTable *)self addTLV:3436347660 keyValue32:v9 tlvArray:v7];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVCompressPayloadAlgorithm:tlvArray:]();
  }
}

- (void)addTLV:(unint64_t)a3 versionString:(id)a4 tlvArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = 0;
    v10[1] = 0;
    +[UARPSuperBinaryAsset versionFromString:v7 version:v10];
    id v9 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 version:v10];
    [v8 addObject:v9];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLV:versionString:tlvArray:]();
  }
}

- (void)addTLVs:(unint64_t)a3 excludedHwRevisions:(id)a4 tlvArray:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          id v15 = [UARPSuperBinaryAssetTLV alloc];
          id v16 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:](v15, "initWithType:stringValue:", a3, v14, (void)v17);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryMetaDataTable addTLVs:excludedHwRevisions:tlvArray:]();
  }
}

- (NSNumber)formatVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_plist, 0);
}

- (void)addTLV:keyValue8:tlvArray:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "invalid plist, trying to use non-number for TLV %lx", v1, v2, v3, v4, v5);
}

- (void)addTLVCompressPayloadAlgorithm:tlvArray:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "invalid plist, trying to use non-string to add compression algorithm", v0, 2u);
}

- (void)addTLV:versionString:tlvArray:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "invalid plist, trying to use non-string for TLV %lx", v1, v2, v3, v4, v5);
}

- (void)addTLVs:excludedHwRevisions:tlvArray:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "invalid plist, trying to use non-array for TLV %lx", v1, v2, v3, v4, v5);
}

@end