@interface UARPMetaDataTLV
+ (id)metaDataTable;
+ (id)metaDataTableEntry;
+ (id)tlvFromKey:(id)a3 value:(id)a4;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
+ (id)tlvTypeName:(unsigned int)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPMetaDataTLV)init;
- (UARPMetaDataTLV)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tlvLength;
- (unsigned)tlvType;
@end

@implementation UARPMetaDataTLV

- (UARPMetaDataTLV)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLV;
  return [(UARPMetaDataTLV *)&v3 init];
}

- (UARPMetaDataTLV)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLV;
  v8 = [(UARPMetaDataTLV *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a4];
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = (NSData *)v10;
  }
  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<Type = 0x%08x, Length = 0x%08x>", self->_tlvType, self->_tlvLength];
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTag;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetID;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefix;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardID;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipID;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECID;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonce;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHash;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomain;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityMode;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionMode;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpoch;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatch;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndex;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevision;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayload;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTag;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongname;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigest;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithm;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESEC;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPRO;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrusted;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonce;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumber;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequired;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOption;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifest;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLife;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioning;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpoch;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffix;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDData;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilename;
LABEL_41:
      v6 = [(__objc2_class *)v5 tlvWithLength:a4 value:a5];
      break;
    default:
      v6 = [[UARPMetaDataTLV alloc] initWithType:*(void *)&a3 length:*(void *)&a4 value:a5];
      break;
  }
  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v19 = a4;
  v6 = +[UARPMetaDataTLV metaDataTable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_super v13 = [v12 objectForKeyedSubscript:@"Name"];
        if (![v5 caseInsensitiveCompare:v13])
        {
          v14 = [v12 objectForKeyedSubscript:@"Value"];
          unsigned int v15 = [v14 unsignedLongValue] + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            uint64_t v16 = [(__objc2_class *)*off_264491500[v15] tlvFromPropertyListValue:v19];
            v17 = v9;
            v9 = (void *)v16;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)metaDataTable
{
  if (metaDataTable_once != -1) {
    dispatch_once(&metaDataTable_once, &__block_literal_global);
  }
  v2 = (void *)metaDataTable_table;
  return v2;
}

void __32__UARPMetaDataTLV_metaDataTable__block_invoke()
{
  id v39 = (id)objc_opt_new();
  v0 = +[UARPTLVPersonalizationRequired metaDataTableEntry];
  [v39 addObject:v0];

  v1 = +[UARPTLVPersonalizationPayloadTag metaDataTableEntry];
  [v39 addObject:v1];

  v2 = +[UARPTLVPersonalizationSuperBinaryAssetID metaDataTableEntry];
  [v39 addObject:v2];

  objc_super v3 = +[UARPTLVPersonalizationManifestPrefix metaDataTableEntry];
  [v39 addObject:v3];

  v4 = +[UARPTLVPersonalizationBoardID metaDataTableEntry];
  [v39 addObject:v4];

  id v5 = +[UARPTLVPersonalizationChipID metaDataTableEntry];
  [v39 addObject:v5];

  v6 = +[UARPTLVPersonalizationECID metaDataTableEntry];
  [v39 addObject:v6];

  uint64_t v7 = +[UARPTLVPersonalizationECIDData metaDataTableEntry];
  [v39 addObject:v7];

  uint64_t v8 = +[UARPTLVPersonalizationNonce metaDataTableEntry];
  [v39 addObject:v8];

  v9 = +[UARPTLVPersonalizationNonceHash metaDataTableEntry];
  [v39 addObject:v9];

  uint64_t v10 = +[UARPTLVPersonalizationSecurityDomain metaDataTableEntry];
  [v39 addObject:v10];

  v11 = +[UARPTLVPersonalizationSecurityMode metaDataTableEntry];
  [v39 addObject:v11];

  v12 = +[UARPTLVPersonalizationProductionMode metaDataTableEntry];
  [v39 addObject:v12];

  objc_super v13 = +[UARPTLVPersonalizationChipEpoch metaDataTableEntry];
  [v39 addObject:v13];

  v14 = +[UARPTLVPersonalizationEnableMixMatch metaDataTableEntry];
  [v39 addObject:v14];

  unsigned int v15 = +[UARPTLVPersonalizationSuperBinaryPayloadIndex metaDataTableEntry];
  [v39 addObject:v15];

  uint64_t v16 = +[UARPTLVPersonalizationChipRevision metaDataTableEntry];
  [v39 addObject:v16];

  v17 = +[UARPTLVPersonalizationFTABSubfileTag metaDataTableEntry];
  [v39 addObject:v17];

  v18 = +[UARPTLVPersonalizationFTABSubfileLongname metaDataTableEntry];
  [v39 addObject:v18];

  id v19 = +[UARPTLVPersonalizationFTABSubfileDigest metaDataTableEntry];
  [v39 addObject:v19];

  long long v20 = +[UARPTLVPersonalizationFTABSubfileHashAlgorithm metaDataTableEntry];
  [v39 addObject:v20];

  long long v21 = +[UARPTLVPersonalizationFTABSubfileESEC metaDataTableEntry];
  [v39 addObject:v21];

  long long v22 = +[UARPTLVPersonalizationFTABSubfileEPRO metaDataTableEntry];
  [v39 addObject:v22];

  long long v23 = +[UARPTLVPersonalizationFTABSubfileTrusted metaDataTableEntry];
  [v39 addObject:v23];

  v24 = +[UARPTLVPersonalizationSoCLiveNonce metaDataTableEntry];
  [v39 addObject:v24];

  uint64_t v25 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumber metaDataTableEntry];
  [v39 addObject:v25];

  v26 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumber metaDataTableEntry];
  [v39 addObject:v26];

  v27 = +[UARPTLVPersonalizationLogicalUnitNumber metaDataTableEntry];
  [v39 addObject:v27];

  v28 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumber metaDataTableEntry];
  [v39 addObject:v28];

  v29 = +[UARPTLVHostPersonalizationRequired metaDataTableEntry];
  [v39 addObject:v29];

  v30 = +[UARPTLVRequiredPersonalizationOption metaDataTableEntry];
  [v39 addObject:v30];

  v31 = +[UARPTLVPersonalizationFTABPayload metaDataTableEntry];
  [v39 addObject:v31];

  v32 = +[UARPTLVPersonalizedManifest metaDataTableEntry];
  [v39 addObject:v32];

  v33 = +[UARPTLVPersonalizationLife metaDataTableEntry];
  [v39 addObject:v33];

  v34 = +[UARPTLVPersonalizationProvisioning metaDataTableEntry];
  [v39 addObject:v34];

  v35 = +[UARPTLVPersonalizationManifestEpoch metaDataTableEntry];
  [v39 addObject:v35];

  v36 = +[UARPTLVPersonalizationManifestSuffix metaDataTableEntry];
  [v39 addObject:v36];

  uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithArray:v39];
  v38 = (void *)metaDataTable_table;
  metaDataTable_table = v37;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = +[UARPMetaDataTLV metaDataTable];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 objectForKeyedSubscript:@"Value"];
        uint64_t v10 = [NSNumber numberWithUnsignedInt:v3];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
          v12 = [v8 objectForKeyedSubscript:@"Name"];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v7 = uarpHtonl(self->_tlvType);
  [v3 appendBytes:&v7 length:4];
  int v6 = uarpHtonl(self->_tlvLength);
  [v3 appendBytes:&v6 length:4];
  [v3 appendData:self->_tlvValue];
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithData:v3];

  return v4;
}

- (id)tlvValue
{
  return self->_tlvValue;
}

+ (id)metaDataTableEntry
{
  return 0;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  return 0;
}

- (unsigned)tlvType
{
  return self->_tlvType;
}

- (unsigned)tlvLength
{
  return self->_tlvLength;
}

- (void).cxx_destruct
{
}

@end