@interface CKRecordID(HMDStringRepresentation)
- (id)hmd_canonicalStringRepresentation;
- (uint64_t)hmd_initWithCanonicalStringRepresentation:()HMDStringRepresentation;
@end

@implementation CKRecordID(HMDStringRepresentation)

- (id)hmd_canonicalStringRepresentation
{
  v2 = HMDCKRecordIDSafeCharacters();
  v3 = [a1 zoneID];
  v4 = [v3 ownerName];
  v5 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  v6 = [v3 zoneName];
  v7 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  v8 = [a1 recordName];
  v9 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  v10 = [NSString stringWithFormat:@"%@/%@/%@", v5, v7, v9];

  return v10;
}

- (uint64_t)hmd_initWithCanonicalStringRepresentation:()HMDStringRepresentation
{
  id v3 = a3;
  if (HMDCKRecordIDEncodedCharacters__hmf_once_t2 != -1) {
    dispatch_once(&HMDCKRecordIDEncodedCharacters__hmf_once_t2, &__block_literal_global_131931);
  }
  id v4 = (id)HMDCKRecordIDEncodedCharacters__hmf_once_v3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v3];
  [v5 setCharactersToBeSkipped:0];
  id v23 = 0;
  int v6 = [v5 scanCharactersFromSet:v4 intoString:&v23];
  id v7 = v23;
  v8 = v7;
  if (!v6)
  {
    v13 = 0;
    v9 = v7;
LABEL_17:
    v17 = 0;
    uint64_t v19 = 0;
    goto LABEL_21;
  }
  v9 = [v7 stringByRemovingPercentEncoding];

  if (!v9 || ![v9 length])
  {
    v13 = 0;
    goto LABEL_19;
  }
  if (![v5 scanString:@"/" intoString:0])
  {
    v13 = 0;
    goto LABEL_17;
  }
  id v22 = 0;
  int v10 = [v5 scanCharactersFromSet:v4 intoString:&v22];
  id v11 = v22;
  v12 = v11;
  if (!v10)
  {
    v17 = 0;
    v13 = v11;
    goto LABEL_20;
  }
  v13 = [v11 stringByRemovingPercentEncoding];

  if (!v13
    || ![v13 length]
    || ![v5 scanString:@"/" intoString:0])
  {
LABEL_19:
    v17 = 0;
LABEL_20:
    uint64_t v19 = 0;
    goto LABEL_21;
  }
  id v21 = 0;
  int v14 = [v5 scanCharactersFromSet:v4 intoString:&v21];
  id v15 = v21;
  v16 = v15;
  if (!v14)
  {
    uint64_t v19 = 0;
    v17 = v15;
    goto LABEL_21;
  }
  v17 = [v15 stringByRemovingPercentEncoding];

  if (!v17 || ![v17 length] || !objc_msgSend(v5, "isAtEnd")) {
    goto LABEL_20;
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263EFD808]) initWithZoneName:v13 ownerName:v9];
  uint64_t v19 = [objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v17 zoneID:v18];

LABEL_21:
  return v19;
}

@end