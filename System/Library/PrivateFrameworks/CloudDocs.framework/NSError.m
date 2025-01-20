@interface NSError
@end

@implementation NSError

void __61__NSError_BRFPAdditions___br_getFileProviderDomainErrorCode___block_invoke()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = &unk_1EF1331D8;
  v12[1] = &unk_1EF133208;
  v13[0] = &unk_1EF1331F0;
  v13[1] = &unk_1EF133220;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v1 = (void *)_br_getFileProviderDomainErrorCode__cocoaErrorToFPError;
  _br_getFileProviderDomainErrorCode__cocoaErrorToFPError = v0;

  v10[0] = &unk_1EF133238;
  v10[1] = &unk_1EF133268;
  v11[0] = &unk_1EF133250;
  v11[1] = &unk_1EF133280;
  v10[2] = &unk_1EF133298;
  v10[3] = &unk_1EF1332B0;
  v11[2] = &unk_1EF133280;
  v11[3] = &unk_1EF133280;
  v10[4] = &unk_1EF1332C8;
  v10[5] = &unk_1EF1332F8;
  v11[4] = &unk_1EF1332E0;
  v11[5] = &unk_1EF133310;
  v10[6] = &unk_1EF133328;
  v10[7] = &unk_1EF133358;
  v11[6] = &unk_1EF133340;
  v11[7] = &unk_1EF133370;
  v10[8] = &unk_1EF133388;
  v10[9] = &unk_1EF1333B8;
  v11[8] = &unk_1EF1333A0;
  v11[9] = &unk_1EF1333D0;
  v10[10] = &unk_1EF1333E8;
  v10[11] = &unk_1EF133400;
  v11[10] = &unk_1EF1333D0;
  v11[11] = &unk_1EF1331F0;
  v10[12] = &unk_1EF133418;
  v10[13] = &unk_1EF133448;
  v11[12] = &unk_1EF133430;
  v11[13] = &unk_1EF133460;
  v11[14] = &unk_1EF133460;
  v10[14] = &unk_1EF133478;
  v10[15] = &unk_1EF133490;
  v2 = [NSNumber numberWithInteger:*MEMORY[0x1E4F25C38]];
  v11[15] = v2;
  v10[16] = &unk_1EF1334A8;
  v3 = [NSNumber numberWithInteger:*MEMORY[0x1E4F25C30]];
  v11[16] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:17];
  v5 = (void *)_br_getFileProviderDomainErrorCode__clouddocsErrorToFPError;
  _br_getFileProviderDomainErrorCode__clouddocsErrorToFPError = v4;

  v8[0] = &unk_1EF1334C0;
  v8[1] = &unk_1EF1334D8;
  v9[0] = &unk_1EF1331F0;
  v9[1] = &unk_1EF1331F0;
  v8[2] = &unk_1EF1334F0;
  v8[3] = &unk_1EF133508;
  v9[2] = &unk_1EF1331F0;
  v9[3] = &unk_1EF133250;
  v8[4] = &unk_1EF133520;
  v8[5] = &unk_1EF133538;
  v9[4] = &unk_1EF133250;
  v9[5] = &unk_1EF133280;
  v8[6] = &unk_1EF1332E0;
  v8[7] = &unk_1EF133550;
  v9[6] = &unk_1EF133280;
  v9[7] = &unk_1EF133220;
  v8[8] = &unk_1EF133568;
  v8[9] = &unk_1EF133580;
  v9[8] = &unk_1EF1331F0;
  v9[9] = &unk_1EF1331F0;
  v8[10] = &unk_1EF133310;
  v8[11] = &unk_1EF133598;
  v9[10] = &unk_1EF1331F0;
  v9[11] = &unk_1EF1331F0;
  v8[12] = &unk_1EF1335B0;
  v9[12] = &unk_1EF1331F0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:13];
  v7 = (void *)_br_getFileProviderDomainErrorCode__cloudKitErrorToFPError;
  _br_getFileProviderDomainErrorCode__cloudKitErrorToFPError = v6;
}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"BRUnderlyingItemKey";
  v10[0] = *MEMORY[0x1E4F25C20];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v1 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey;
  _br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey = v0;

  v7 = @"BRUnderlyingItemIdentifierKey";
  v5 = &unk_1EF133268;
  uint64_t v6 = *MEMORY[0x1E4F25C28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8 = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  uint64_t v4 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap;
  _br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap = v3;
}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v5 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v5 = [a1[4] objectForKey:a2];
  if (v5)
  {
    id v6 = v9;
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1[5], "code"));
    v8 = [v6 objectForKey:v7];

    if (v8) {
      [a1[6] setObject:v5 forKeyedSubscript:v8];
    }
  }
}

@end