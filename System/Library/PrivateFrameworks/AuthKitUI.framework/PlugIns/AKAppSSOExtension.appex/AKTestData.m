@interface AKTestData
+ (id)SAMLGetResponseDictionary;
+ (id)SAMLPostResponseDictionary;
+ (id)SIMDataForOTPResync;
+ (id)SPDForAuthorizationSRPSuccess;
+ (id)SPDForCriticalAuthTokensSRPSuccess;
+ (id)SPDForDemoAccountSRPSuccess;
+ (id)SPDForFidoAccountSRPSuccess;
+ (id)SPDForFirstPartyWebSiWAAuthSRPSuccessWithEDPInfo:(unint64_t)a3;
+ (id)SPDForHSA2AccountSRPPiggybacking;
+ (id)SPDForHSA2AccountSRPSuccess;
+ (id)SPDForHSA2MissingCKToken;
+ (id)SPDForMakoAccountSRPSuccess;
+ (id)SPDForManagedAccountSRPSuccess;
+ (id)SPDForSLTRequestSRPSuccess;
+ (id)SPDForStandardAccountSRPSuccess;
+ (id)SPDForStandardAccountSRPSuccessWithADPCohort;
+ (id)SPDForStandardAccountSRPSuccessWithEDPInfo;
+ (id)SPDForUnderAgeAuthorizationSRPSuccess;
+ (id)SPDMissingCriticalAuthTokensSRPSuccess;
+ (id)_deviceArmingPCSAuthContext:(unint64_t)a3;
+ (id)anisetteEndProvisioningSuccessResponse;
+ (id)anisetteResponseSuccess;
+ (id)anisetteRetryResponse;
+ (id)anisetteStartProvisioningSuccessResponse;
+ (id)failureFederatedResponseBody;
+ (id)statusForFederatedAccountSRP;
+ (id)successfulAppleIDContinuationResponse;
+ (id)successfulAppleIDCreationResponse;
+ (id)successfulFederatedMultiUserResponse;
+ (id)successfulFederatedResponseBody;
+ (id)successfulFederatedSingleUserResponse;
+ (id)successfulFederatedSingleUserResponseWithEDPInfo;
+ (id)successfulRepairCompletionResponse;
+ (id)successfuliForgotCompletionResponse;
+ (id)succssfuliCSCRecoveryInitiationResponse;
+ (id)testCKGenerationAuthParameters;
+ (id)testTiburonAppID;
+ (id)testTiburonWebApplicationName;
+ (id)testTiburonWebBundleIdentifier;
+ (id)urlBag;
@end

@implementation AKTestData

+ (id)successfuliForgotCompletionResponse
{
  v9[0] = @"complete";
  v9[1] = @"sa";
  v9[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v2 = +[NSString stringWithFormat:@"%llu", 0x1634561156027D1, @"X-Apple-AK-Action", @"X-Apple-AK-Auth-Type", @"X-Apple-Alternate-Id", @"X-Apple-DSID"];
  v9[3] = v2;
  v9[4] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v8[4] = @"X-Apple-Session-Key";
  v8[5] = @"X-Apple-Encrypted-Session-Key";
  v9[5] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v9[6] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[6] = @"X-Apple-Identity-Token";
  v8[7] = @"X-Apple-PE-Token";
  v8[8] = @"Content-Type";
  v9[7] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v9[8] = @"text/xml;charset=UTF-8";
  v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:9];

  id v4 = objc_alloc((Class)NSHTTPURLResponse);
  v5 = +[NSURL URLWithString:@"https://gsa.apple.com/iforgot/password/unlock"];
  id v6 = [v4 initWithURL:v5 statusCode:200 HTTPVersion:@"1.1" headerFields:v3];

  return v6;
}

+ (id)succssfuliCSCRecoveryInitiationResponse
{
  v9[0] = @"continue";
  v9[1] = @"hsa2";
  v9[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v2 = +[NSString stringWithFormat:@"%llu", 0x1634561156027D1, @"X-Apple-AK-Action", @"X-Apple-AK-Auth-Type", @"X-Apple-Alternate-Id", @"X-Apple-DSID"];
  v9[3] = v2;
  v9[4] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v8[4] = @"X-Apple-Session-Key";
  v8[5] = @"X-Apple-Encrypted-Session-Key";
  v9[5] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v9[6] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[6] = @"X-Apple-iCSC-Identity-Token";
  v8[7] = @"X-Apple-iCSC-PE-Token";
  v8[8] = @"Content-Type";
  v9[7] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v9[8] = @"text/xml;charset=UTF-8";
  v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:9];

  id v4 = objc_alloc((Class)NSHTTPURLResponse);
  v5 = +[NSURL URLWithString:@"https://gsa.apple.com/iforgot/password/unlock"];
  id v6 = [v4 initWithURL:v5 statusCode:200 HTTPVersion:@"1.1" headerFields:v3];

  return v6;
}

+ (id)successfulAppleIDCreationResponse
{
  v9[0] = @"complete";
  v9[1] = @"sa";
  v9[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v2 = +[NSString stringWithFormat:@"%llu", 0x1634561156027D1, @"X-Apple-AK-Action", @"X-Apple-AK-Auth-Type", @"X-Apple-Alternate-Id", @"X-Apple-DSID"];
  v9[3] = v2;
  v9[4] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v8[4] = @"X-Apple-Session-Key";
  v8[5] = @"X-Apple-Encrypted-Session-Key";
  v9[5] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v9[6] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[6] = @"X-Apple-Identity-Token";
  v8[7] = @"X-Apple-PE-Token";
  v9[7] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v9[8] = @"text/xml;charset=UTF-8";
  v8[8] = @"Content-Type";
  void v8[9] = @"X-Apple-I-Accepted-Terms";
  void v9[9] = @"eyJ2ZXJzaW9uIjoiNTI4NjAxOjUyODgwMTowOjA6MTE5NjU4OjUyNjAwMTowOjA6MDowOjA6MDowIiwiaWNsb3VkVmVyc2lvbiI6IjUyODgwMSIsImNvdW50cnlDb2RlIiA6ICJDTiIsIm1ldGFkYXRhIjoiY3lsb24sY3lydXMyMDAifQ==";
  v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:10];

  id v4 = objc_alloc((Class)NSHTTPURLResponse);
  v5 = +[NSURL URLWithString:@"https://gsa.apple.com/appleid/account"];
  id v6 = [v4 initWithURL:v5 statusCode:200 HTTPVersion:@"1.1" headerFields:v3];

  return v6;
}

+ (id)successfulFederatedSingleUserResponse
{
  v7[0] = @"X-Apple-Session-Key";
  v7[1] = @"X-Apple-Encrypted-Session-Key";
  v8[0] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v8[1] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v7[2] = @"X-Apple-Identity-Token";
  v7[3] = @"X-Apple-PE-Token";
  v8[2] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[3] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v7[4] = @"Content-Type";
  v8[4] = @"text/xml;charset=UTF-8";
  v2 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  id v3 = objc_alloc((Class)NSHTTPURLResponse);
  id v4 = +[NSURL URLWithString:@"https://gsa.apple.com/appleid/acsURL"];
  id v5 = [v3 initWithURL:v4 statusCode:200 HTTPVersion:@"1.1" headerFields:v2];

  return v5;
}

+ (id)successfulFederatedSingleUserResponseWithEDPInfo
{
  v7[0] = @"X-Apple-Session-Key";
  v7[1] = @"X-Apple-Encrypted-Session-Key";
  v8[0] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v8[1] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v7[2] = @"X-Apple-Identity-Token";
  v7[3] = @"X-Apple-PE-Token";
  v8[2] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[3] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v7[4] = @"Content-Type";
  void v7[5] = @"X-Apple-I-EDP-S";
  v8[4] = @"text/xml;charset=UTF-8";
  void v8[5] = @"1";
  v7[6] = @"X-Apple-I-EDP-PV";
  v7[7] = @"X-Apple-I-EDP-SP";
  v8[6] = @"19813";
  v8[7] = @"s2kk";
  v7[8] = @"X-Apple-I-EDP-Salt";
  v7[9] = @"X-Apple-I-EDP-Iters";
  v8[8] = @"fakeSalt";
  void v8[9] = @"38626";
  v2 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:10];
  id v3 = objc_alloc((Class)NSHTTPURLResponse);
  id v4 = +[NSURL URLWithString:@"https://gsa.apple.com/appleid/acsURL"];
  id v5 = [v3 initWithURL:v4 statusCode:200 HTTPVersion:@"1.1" headerFields:v2];

  return v5;
}

+ (id)successfulFederatedMultiUserResponse
{
  v7[0] = @"X-Apple-SL-Token";
  v7[1] = @"X-Apple-Session-Key";
  v8[0] = @"Y29tLmFwcGxlLmdzLmlkbXMuc2x0OjAyNTgwMWM4LTU1ZWYtNDU3Yy1iYmI4LWI4ZmFmMmY4MDNlNldGbGEvbU4rVlBIak1oMm9CMG9Jei8wVXlYeFZaZlI2K0docmxGQlRLdVlCT2J6L21kUXUzQnNpd0ZzZlNocGJjU21RZWh5NDdpMk9tZ25BYnRYcXBrR2R3TzdBSS9adGc1cWNaRXNBSUdBRWxnNks1bEhCU3ZMQVJ4c1BPWms3VlNFTUhrNUU2NFZTRjBCMjM2d1lwTFREZnYxVXVDN1pPMWd2MDFVSFJmMEJ1TmdObncrK3ZPYmlvRWJvYmQwbVVyZmdhWHQxY3RxVjVlWG10SW5rSkZJSXNHNU5iTW1LRjJXV2hrdUR3Z0daemNrK1hXR1BTanhlYVM5L3dnZ0hjTHhPQlJGN1A0d0lJN25DREdFVVlVL0xPNlI0M01yM2tqajBOcHl0S1lzPQ==";
  v8[1] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  v7[2] = @"X-Apple-Encrypted-Session-Key";
  v7[3] = @"Content-Type";
  v8[2] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v8[3] = @"text/xml;charset=UTF-8";
  v2 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v3 = objc_alloc((Class)NSHTTPURLResponse);
  id v4 = +[NSURL URLWithString:@"https://gsa.apple.com/appleid/acsURL"];
  id v5 = [v3 initWithURL:v4 statusCode:200 HTTPVersion:@"1.1" headerFields:v2];

  return v5;
}

+ (id)successfulFederatedResponseBody
{
  v7[0] = @"DsPrsId";
  v7[1] = @"ec";
  v8[0] = &off_100012488;
  v8[1] = &off_1000124A0;
  v7[2] = @"em";
  v7[3] = @"fn";
  v8[2] = &stru_100011160;
  v8[3] = @"Lester";
  void v7[4] = @"ln";
  void v7[5] = @"ut";
  void v8[4] = @"All";
  void v8[5] = &off_1000124B8;
  v7[6] = @"acname";
  v7[7] = @"adsid";
  v8[6] = @"account4test@icloud.apple";
  v8[7] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v7[8] = @"authmode";
  v7[9] = @"mdmInfoRequired";
  v8[8] = &off_1000124D0;
  void v8[9] = &off_1000124B8;
  void v7[10] = @"uireq";
  v7[11] = @"fpc";
  void v8[10] = &__kCFBooleanTrue;
  v8[11] = &__kCFBooleanTrue;
  v7[12] = @"cd";
  CFStringRef v5 = @"com.apple.authkit.TestData";
  CFStringRef v6 = @"YnBsaXN0MDDRAQJVaGVsbG9Vd29ybGQICxEAAAAAAAABAQAAAAAAAAADAAAAAAAAAAAAAAAAAAAAFw==";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8[12] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:13];

  return v3;
}

+ (id)failureFederatedResponseBody
{
  return &off_100012BD8;
}

+ (id)successfulAppleIDContinuationResponse
{
  v7[0] = @"Content-Type";
  v7[1] = @"X-Apple-AK-Action";
  v8[0] = @"text/xml;charset=UTF-8";
  v8[1] = @"continue";
  v7[2] = @"X-Apple-AK-Continuation-Data";
  v8[2] = @"ewogICJyZWFzb25LZXkiIDogImNyZWF0ZVUxMyIsCiAgImFjY291bnQiIDogewogICAgInBlcnNvbiIgOiB7CiAgICAgICJzaGlwcGluZ0FkZHJlc3NlcyIgOiBbIF0sCiAgICAgICJwaG9uZU51bWJlcnMiIDogWyBdLAogICAgICAibWF4QWxsb3dlZEFsdGVybmF0ZUVtYWlscyIgOiAwLAogICAgICAibWFuYWdlZEFkbWluaXN0cmF0b3IiIDogZmFsc2UsCiAgICAgICJhbGxvd0FkZGl0aW9uYWxBbHRlcm5hdGVFbWFpbCIgOiBmYWxzZSwKICAgICAgIm1heEFsbG93ZWRTaGFyZWROdW1iZXJzIiA6IDAsCiAgICAgICJpc0ZhbWlseU9yZ2FuaXplciIgOiBmYWxzZSwKICAgICAgImlzRGF0ZU9mQmlydGhFZGl0YWJsZSIgOiBmYWxzZSwKICAgICAgImlzSFNBMkVsaWdpYmxlIiA6IGZhbHNlLAogICAgICAibWluQmlydGhkYXkiIDogIjE4NjYtMTAtMTkiLAogICAgICAibWF4QmlydGhkYXkiIDogIjIwMTYtMTAtMTkiLAogICAgICAiYmlydGhkYXkiIDogIjIwMTQtMTAtMTkiLAogICAgICAiaGFzRmFtaWx5IiA6IGZhbHNlLAogICAgICAiaXNVbmRlckFnZSIgOiBmYWxzZSwKICAgICAgIm5hbWUiIDogewogICAgICAgICJtaWRkbGVOYW1lUmVxdWlyZWQiIDogZmFsc2UsCiAgICAgICAgIm1pZGRsZU5hbWUiIDogIiIsCiAgICAgICAgImZpcnN0TmFtZSIgOiAiIiwKICAgICAgICAibGFzdE5hbWUiIDogIiIKICAgICAgfQogICAgfSwKICAgICJwcmVmZXJlbmNlcyIgOiB7CiAgICAgICJtYXJrZXRpbmdQcmVmZXJlbmNlcyIgOiB7CiAgICAgICAgImlUdW5lc1VwZGF0ZXMiIDogZmFsc2UsCiAgICAgICAgImFwcGxlVXBkYXRlcyIgOiBmYWxzZSwKICAgICAgICAiYXBwbGVOZXdzIiA6IGZhbHNlCiAgICAgIH0KICAgIH0sCiAgICAicGF5bWVudE1ldGhvZFN0YXR1cyIgOiAiTk9UX0xPQURFRCIsCiAgICAib3duc0ZhbWlseVBheW1lbnRNZXRob2QiIDogZmFsc2UsCiAgICAiaGFzRmFtaWx5UGF5bWVudE1ldGhvZCIgOiBmYWxzZSwKICAgICJoYXNQcmltYXJ5UGF5bWVudE1ldGhvZCIgOiBmYWxzZSwKICAgICJpbnRlcm5hbEFjY291bnQiIDogZmFsc2UsCiAgICAicGFzc3dvcmQiIDogIiIKICB9Cn0=";
  v2 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  id v3 = objc_alloc((Class)NSHTTPURLResponse);
  id v4 = +[NSURL URLWithString:@"https://gsa.apple.com/appleid/account/manage/repair/birthday"];
  id v5 = [v3 initWithURL:v4 statusCode:200 HTTPVersion:@"1.1" headerFields:v2];

  return v5;
}

+ (id)SPDForStandardAccountSRPSuccess
{
  v16[0] = @"DsPrsId";
  v16[1] = @"adsid";
  v17[0] = &off_100012488;
  v17[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v16[2] = @"alias";
  v16[3] = @"acname";
  v17[2] = &__NSDictionary0__struct;
  v17[3] = @"account4test@icloud.apple";
  v16[4] = @"ut";
  v16[5] = @"authmode";
  v17[4] = &off_1000124D0;
  v17[5] = &off_1000124B8;
  v17[6] = &off_1000124B8;
  v16[6] = @"demoAccount";
  v16[7] = @"t";
  v12[0] = @"token";
  v12[1] = @"duration";
  v13[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v13[1] = &off_100012500;
  v14[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"com.apple.gs.tyler.test";
  v10[0] = @"token";
  v10[1] = @"duration";
  v11[0] = @"TRC";
  v11[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v3;
  v14[2] = @"com.apple.gs.fake.no-duration";
  CFStringRef v8 = @"token";
  CFStringRef v9 = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v16[8] = @"additionalInfo";
  v17[7] = v5;
  v17[8] = &off_100012C50;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

  return v6;
}

+ (id)SPDForHSA2AccountSRPSuccess
{
  v16[0] = @"DsPrsId";
  v16[1] = @"adsid";
  v17[0] = &off_100012488;
  v17[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v16[2] = @"alias";
  v16[3] = @"acname";
  v17[2] = &__NSDictionary0__struct;
  v17[3] = @"account4test@icloud.apple";
  v16[4] = @"ut";
  v16[5] = @"authmode";
  v17[4] = &off_100012518;
  v17[5] = &off_1000124B8;
  v17[6] = &off_1000124B8;
  v16[6] = @"demoAccount";
  v16[7] = @"t";
  v12[0] = @"token";
  v12[1] = @"duration";
  v13[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v13[1] = &off_100012500;
  v14[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"com.apple.gs.tyler.test";
  v10[0] = @"token";
  v10[1] = @"duration";
  v11[0] = @"TRC";
  v11[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v3;
  v14[2] = @"com.apple.gs.fake.no-duration";
  CFStringRef v8 = @"token";
  CFStringRef v9 = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v16[8] = @"additionalInfo";
  v17[7] = v5;
  v17[8] = &off_100012CC8;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

  return v6;
}

+ (id)SPDForHSA2AccountSRPPiggybacking
{
  v16[0] = @"DsPrsId";
  v16[1] = @"adsid";
  v17[0] = &off_100012488;
  v17[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v16[2] = @"apb";
  v16[3] = @"alias";
  v17[2] = &__kCFBooleanTrue;
  v17[3] = &__NSDictionary0__struct;
  v16[4] = @"acname";
  v16[5] = @"ut";
  v17[4] = @"account4test@icloud.apple";
  v17[5] = &off_100012518;
  v16[6] = @"authmode";
  v16[7] = @"demoAccount";
  v17[6] = &off_1000124B8;
  v17[7] = &off_1000124B8;
  v16[8] = @"t";
  v12[0] = @"token";
  v12[1] = @"duration";
  v13[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v13[1] = &off_100012500;
  v14[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"com.apple.gs.tyler.test";
  v10[0] = @"token";
  v10[1] = @"duration";
  v11[0] = @"TRC";
  v11[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v3;
  v14[2] = @"com.apple.gs.fake.no-duration";
  CFStringRef v8 = @"token";
  CFStringRef v9 = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  void v16[9] = @"additionalInfo";
  v17[8] = v5;
  void v17[9] = &off_100012D40;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:10];

  return v6;
}

+ (id)SPDForStandardAccountSRPSuccessWithADPCohort
{
  v16[0] = @"DsPrsId";
  v16[1] = @"adsid";
  v17[0] = &off_100012488;
  v17[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v16[2] = @"alias";
  v16[3] = @"acname";
  v17[2] = &__NSDictionary0__struct;
  v17[3] = @"account4test@icloud.apple";
  v16[4] = @"ut";
  v16[5] = @"authmode";
  v17[4] = &off_1000124D0;
  v17[5] = &off_1000124B8;
  v16[6] = @"demoAccount";
  v16[7] = @"adpCh";
  v17[6] = &off_1000124B8;
  v17[7] = &off_1000124B8;
  v16[8] = @"t";
  v12[0] = @"token";
  v12[1] = @"duration";
  v13[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v13[1] = &off_100012500;
  v14[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"com.apple.gs.tyler.test";
  v10[0] = @"token";
  v10[1] = @"duration";
  v11[0] = @"TRC";
  v11[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v3;
  v14[2] = @"com.apple.gs.fake.no-duration";
  CFStringRef v8 = @"token";
  CFStringRef v9 = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  void v16[9] = @"additionalInfo";
  v17[8] = v5;
  void v17[9] = &off_100012DB8;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:10];

  return v6;
}

+ (id)SPDForStandardAccountSRPSuccessWithEDPInfo
{
  v16[0] = @"DsPrsId";
  v16[1] = @"adsid";
  v17[0] = &off_100012488;
  v17[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v16[2] = @"alias";
  v16[3] = @"acname";
  v17[2] = &__NSDictionary0__struct;
  v17[3] = @"account4test@icloud.apple";
  v16[4] = @"ut";
  v16[5] = @"authmode";
  v17[4] = &off_1000124D0;
  v17[5] = &off_1000124B8;
  v16[6] = @"demoAccount";
  v16[7] = @"adpCh";
  v17[6] = &off_1000124B8;
  v17[7] = &off_1000124B8;
  v16[8] = @"edps";
  void v16[9] = @"pv";
  v17[8] = &off_1000124B8;
  void v17[9] = &off_100012530;
  void v16[10] = @"sp";
  v16[11] = @"s";
  void v17[10] = @"s2k";
  v17[11] = @"fakeSalt";
  v17[12] = &off_100012548;
  v16[12] = @"i";
  v16[13] = @"t";
  v12[0] = @"token";
  v12[1] = @"duration";
  v13[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v13[1] = &off_100012500;
  v14[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"com.apple.gs.tyler.test";
  v10[0] = @"token";
  v10[1] = @"duration";
  v11[0] = @"TRC";
  v11[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v3;
  v14[2] = @"com.apple.gs.fake.no-duration";
  CFStringRef v8 = @"token";
  CFStringRef v9 = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  id v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v16[14] = @"additionalInfo";
  v17[13] = v5;
  v17[14] = &off_100012E30;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:15];

  return v6;
}

+ (id)SPDForFirstPartyWebSiWAAuthSRPSuccessWithEDPInfo:(unint64_t)a3
{
  id v5 = objc_alloc((Class)NSMutableDictionary);
  CFStringRef v6 = [a1 SPDForStandardAccountSRPSuccessWithEDPInfo];
  id v7 = [v5 initWithDictionary:v6];

  CFStringRef v8 = [a1 _deviceArmingPCSAuthContext:a3];
  [v7 setObject:v8 forKeyedSubscript:@"srdwa"];

  id v9 = [objc_alloc((Class)NSDictionary) initWithDictionary:v7];

  return v9;
}

+ (id)_deviceArmingPCSAuthContext:(unint64_t)a3
{
  v11[0] = @"ts";
  id v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[0] = v5;
  v11[1] = @"ttlMin";
  id v6 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:a3];
  v12[1] = v6;
  void v12[2] = @"A/dxPJMAkRmjLDaTGKUiOThNa/VhNThJCE9ahnJtRmc=";
  void v11[2] = @"wscEkPCS";
  v11[3] = @"wscUUID";
  id v7 = +[NSUUID UUID];
  CFStringRef v8 = [v7 UUIDString];
  v12[3] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

+ (id)SPDForFidoAccountSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v13[4] = @"ut";
  v13[5] = @"authmode";
  v14[4] = &off_1000124D0;
  v14[5] = &off_1000124B8;
  v14[6] = &off_1000124B8;
  v13[6] = @"demoAccount";
  v13[7] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.tyler.test";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[7] = v4;
  v14[8] = &off_1000124B8;
  v13[8] = @"fidoAuth";
  v13[9] = @"additionalInfo";
  v14[9] = &off_100012EA8;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:10];

  return v5;
}

+ (id)SPDForDemoAccountSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v13[4] = @"ut";
  v13[5] = @"authmode";
  v14[4] = &off_100012518;
  v14[5] = &off_1000124B8;
  v14[6] = &off_1000124B8;
  v13[6] = @"demoAccount";
  v13[7] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.tyler.test";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[7] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v5;
}

+ (id)SPDForAuthorizationSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"uid";
  v13[3] = @"atxid";
  v14[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v14[3] = @"w/tcrvi/f+jkMxrgIQLaoKrHARF4+Nj+5D5a/AFv1bMEKAVjCZP9JCC3556HOtVGgjPDLxkyLq/NtWRY";
  v13[4] = @"isLikelyRealUser";
  v13[5] = @"scopes";
  v14[4] = &off_1000124B8;
  v14[5] = &off_1000132F8;
  v13[6] = @"underAge";
  v13[7] = @"privateEmail";
  v14[6] = &__kCFBooleanFalse;
  v14[7] = @"private.email@icloud.com";
  void v13[8] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"authCode";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"IDToken";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  void v14[8] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:9];

  return v5;
}

+ (id)SPDForUnderAgeAuthorizationSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"uid";
  v13[3] = @"atxid";
  v14[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v14[3] = @"w/tcrvi/f+jkMxrgIQLaoKrHARF4+Nj+5D5a/AFv1bMEKAVjCZP9JCC3556HOtVGgjPDLxkyLq/NtWRY";
  v13[4] = @"scopes";
  v13[5] = @"underAge";
  v14[4] = &off_100013310;
  v14[5] = &__kCFBooleanTrue;
  v13[6] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"authCode";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"IDToken";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[6] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v5;
}

+ (id)SPDForMakoAccountSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"15554224172";
  v13[4] = @"ut";
  v13[5] = @"ck";
  v14[4] = &off_1000124D0;
  v14[5] = @"c12af1946b6e2b21a85896741332124";
  v13[6] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.tyler.test";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[6] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v5;
}

+ (id)SPDForManagedAccountSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v13[4] = @"ut";
  v13[5] = @"mu";
  v14[4] = &off_100012560;
  v14[5] = &off_1000124B8;
  v13[6] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.tyler.test";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[6] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v5;
}

+ (id)statusForFederatedAccountSRP
{
  return &off_100012EF8;
}

+ (id)SPDForSLTRequestSRPSuccess
{
  v7[0] = @"DsPrsId";
  v7[1] = @"acname";
  v8[0] = &off_100012488;
  v8[1] = @"account4test@icloud.apple";
  void v8[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v7[2] = @"adsid";
  void v7[3] = @"cd";
  CFStringRef v5 = @"com.apple.authkit.TestData";
  CFStringRef v6 = @"YnBsaXN0MDDRAQJVaGVsbG9Vd29ybGQICxEAAAAAAAABAQAAAAAAAAADAAAAAAAAAAAAAAAAAAAAFw==";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  void v8[3] = v2;
  void v8[4] = @"Lester";
  void v7[4] = @"fn";
  void v7[5] = @"ln";
  void v8[5] = @"All";
  v8[6] = &off_1000124B8;
  v7[6] = @"mu";
  v7[7] = @"ut";
  v7[8] = @"authmode";
  v8[7] = &off_100012560;
  v8[8] = &off_1000124B8;
  id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:9];

  return v3;
}

+ (id)SIMDataForOTPResync
{
  id v2 = [objc_alloc((Class)NSData) initWithBase64EncodedString:@"SGVyMy1yM3N5bmM9dzF0aC10aDFzLWJ1dC0xZi11LWRvbid0LXdhbnQtMi10aDNuLWYxbjMu" options:0];

  return v2;
}

+ (id)successfulRepairCompletionResponse
{
  v9[0] = @"complete";
  v9[1] = @"sa";
  void v9[2] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  id v2 = +[NSString stringWithFormat:@"%llu", 0x1634561156027D1, @"X-Apple-AK-Action", @"X-Apple-AK-Auth-Type", @"X-Apple-Alternate-Id", @"X-Apple-DSID"];
  v9[3] = v2;
  v9[4] = @"ORMD1JhHa4VAcrOF29SftzhK3AU15YEzcahubvLdgbA=";
  void v8[4] = @"X-Apple-Session-Key";
  void v8[5] = @"X-Apple-Encrypted-Session-Key";
  v9[5] = @"M2E0OWU3NmItYzY4YS00NDBiLWI2OWEtYzhmN2M3ZTVmMDEwVDR3VkRodVpEVnlQSzlXS0pNTTdZYzV1cWR3RkJ5OUtnUE81dGgyOXdjQ0tsSmpSRXJOb25Eb3V0OWpKZ0VpMWFoZWNKYzJSVG50Mm42bDMwT2d0Zms3eWprK3Z4SEMrOGQzUWJQSU0rbmZOSDUyK1paS2hsZk5hTW1FbHlHaFdXRnBI";
  v9[6] = @"Y29tLmFwcGxlLmdzLmlkbXMuYXV0aDpBQUFBQkx3SUFBQUFBRlhXRlhnUkRHZHpMbWxrYlhNdVlYVjBhTDBBZlJ2L1RaVXNsWVA4Y1BLb2Vmci9pcUR2ZXJMYnJsc2FEODFqb09SQ1B6N0d1Zy9zZFVtcnkvTW85Skl6cVdhVTVPTmtSV2UvSGI4eGJvc2dtMlJoWE42ZURXWU9HVEpkQjJnZUFpQXFhVUtqZVBCN1JoTStkV2hBOXlMcnpGT3BWOXBhUVFob0NXTnpTN3VlVFRTdjJPMTNpTVE9OjM2MDA=";
  v8[6] = @"X-Apple-Identity-Token";
  v8[7] = @"X-Apple-PE-Token";
  v8[8] = @"Content-Type";
  v9[7] = @"Y29tLmFwcGxlLmdzLmlkbXMucGV0OkdWdEhLNHViNWdCelQyckVaZGk0UVlhZ3J4MVFhMVhvNzVyaUhCTm9zWkYrMFVsZlVQVnFPNCsyVU9TK241b1ZyTmJBOVplRWpVQ0tCZlJINnZuMDJkQlhrV1NDblB0SjBhV3RkN0I1QXNyREtsdlFHMDBVTmcrRW1sQ3hYd0hKN1Q2RFl0a2oySitQOHlvK3RSMUJONmFwUDV2Y3NRbnhMd2R3UTFEaS9rNjdIQ2c0RzMwWXpyM1g3ZlV2eTBHNm5PQXd3bmF3bHZyT3g5d2VwSld4cFQ1aHJtQWVYKzB5RWp6WGl3enNKMWtweUVacjRHMHp5T1hJMzdUaHA2ampQUGVSWW11MjFCeHFGcFRrOW5wWlF3VXJaa3l0elNVQ29KOCtaYlFCTUlSdHErSjBIU0R5V21CYkx6UVh5S0o4WWdsblR4ST1QRVQ6MzAw";
  v9[8] = @"text/xml;charset=UTF-8";
  id v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:9];

  id v4 = objc_alloc((Class)NSHTTPURLResponse);
  CFStringRef v5 = +[NSURL URLWithString:@"https://gsa.apple.com/grandslam/GsService2/repair"];
  id v6 = [v4 initWithURL:v5 statusCode:200 HTTPVersion:@"1.1" headerFields:v3];

  return v6;
}

+ (id)SAMLGetResponseDictionary
{
  uint64_t v5 = AKRequestURLKey;
  id v2 = +[NSURL URLWithString:@"https://www.apple.com?query=iPhone"];
  id v6 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)SAMLPostResponseDictionary
{
  v5[0] = AKRequestBodyKey;
  v5[1] = AKRequestURLKey;
  v6[0] = @"SAML RESPONSE";
  id v2 = +[NSURL URLWithString:@"https://www.apple.com"];
  v6[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (id)testTiburonAppID
{
  return +[NSString stringWithFormat:@"%@.%@", @"K6AQ3EGQ7P", @"com.apple.idms.chroma"];
}

+ (id)testTiburonWebApplicationName
{
  if (qword_100015198 != -1) {
    dispatch_once(&qword_100015198, &stru_100010510);
  }
  id v2 = (void *)qword_1000151A0;
  unint64_t v3 = qword_1000151A8++;
  unint64_t v4 = v3 % (unint64_t)[(id)qword_1000151A0 count];

  return [v2 objectAtIndexedSubscript:v4];
}

+ (id)testTiburonWebBundleIdentifier
{
  if (qword_1000151B0 != -1) {
    dispatch_once(&qword_1000151B0, &stru_100010530);
  }
  id v2 = (void *)qword_1000151B8;
  unint64_t v3 = qword_1000151C0++;
  unint64_t v4 = v3 % (unint64_t)[(id)qword_1000151B8 count];

  return [v2 objectAtIndexedSubscript:v4];
}

+ (id)urlBag
{
  id v2 = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>         <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">         <plist version=\"1.0\">         <dict>             <key>env</key>             <dict>                 <key>apsEnv</key>                 <string>production</string>                 <key>idmsEnv</key>                 <string>IdMS</string>             </dict>             <key>urls</key>             <dict>                 <key>gsService</key>                 <dict>                     <key>url</key>                     <string>https://gsa.apple.com/grandslam/GsService2</string>                 </dict>                 <key>fetchAuthorizedApps</key>                 <dict>                     <key>url</key>                     <string>https://gsa.apple.com/grandslam/GsService2/fetchAuthorizedApps</string>                 </dict>                 <key>fetchUserInfo</key>                 <dict>                     <key>url</key>                     <string>https://gsa.apple.com/grandslam/GsService2/fetchUserInfo</string>                 </dict>             </dict>         </dict>     </plist>" dataUsingEncoding:4];
  unint64_t v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:0];

  return v3;
}

+ (id)SPDForHSA2MissingCKToken
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v14[4] = &off_1000124D0;
  v13[4] = @"ut";
  v13[5] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  id v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.tyler.test";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"TRC";
  v8[1] = &off_100012500;
  unint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[1] = v3;
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13[6] = @"cdp";
  v14[5] = v4;
  v14[6] = &off_100012F20;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  return v5;
}

+ (id)testCKGenerationAuthParameters
{
  v11[0] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  v10[0] = @"adsif";
  v10[1] = @"cpd";
  v8[0] = @"ckgen";
  v8[1] = @"X-Apple-I-Client-Time";
  v9[0] = &off_1000124B8;
  v9[1] = @"2023-12-06T17:39:22Z";
  void v8[2] = @"X-Apple-I-MD";
  void v8[3] = @"X-Apple-I-MD-M";
  void v9[2] = @"AAAABQAAABCMXoDEbRZ1w7nikIkD3IgYAAAAAw==";
  v9[3] = @"w/tcrvi/f+jkMxrgIQLaoKrHARF4+Nj+5D5a/AFv1bMEKAVjCZP9JCC3556HOtVGgjPDLxkyLq/NtWRY";
  void v8[4] = @"X-Apple-I-MD-RINFO";
  void v8[5] = @"icdrsDisabled";
  v9[4] = &off_100012578;
  v9[5] = &off_1000124A0;
  v8[6] = @"svct";
  v8[7] = @"webAccessEnabled";
  v9[6] = @"icloud";
  v9[7] = &off_1000124A0;
  id v2 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:8];
  v11[1] = v2;
  void v10[2] = @"kAppleIDAuthSupportAdditionalHeaders";
  v6[0] = @"X-Apple-AK-Context-Type";
  v6[1] = @"X-Apple-I-MD";
  v7[0] = @"icloud";
  v7[1] = @"AAAABQAAABCMXoDEbRZ1w7nikIkD3IgYAAAAAw==";
  void v6[2] = @"X-Apple-I-MD-M";
  v6[3] = @"X-Apple-I-MD-RINFO";
  void v7[2] = @"w/tcrvi/f+jkMxrgIQLaoKrHARF4+Nj+5D5a/AFv1bMEKAVjCZP9JCC3556HOtVGgjPDLxkyLq/NtWRY";
  void v7[3] = &off_100012578;
  unint64_t v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v10[3] = @"u";
  void v11[2] = v3;
  v11[3] = @"account4test@icloud.apple";
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v4;
}

+ (id)SPDForCriticalAuthTokensSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v13[4] = @"ut";
  v13[5] = @"authmode";
  v14[4] = &off_1000124D0;
  v14[5] = &off_1000124B8;
  v14[6] = &off_1000124B8;
  v13[6] = @"demoAccount";
  void v13[7] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  id v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.idms.hb";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"AAAABLwIAAAAAFiTawwRCmdzLmlkbXMuaGK9AEr1O7ISMGE6QcJKA0fCfvkIIQ7DtQLwTv+kNocsKs3dNKRf7mx806XNTvitHW5RCVRXc0/o0kkyS2x+/NoLMX5cr7AT4fY19m1DhpSYT3rS1KmKDNUd2gAnnp70Ehz3wv4MLmdwlkHNO/LKSbQMLISBNaRXfZBGETUqaNVvj5XT6FQNTzcXdREGGzXzNYfbx/uLVxpzFHUwee1T0tA91onStnNC";
  v8[1] = &off_100012500;
  void v7[2] = @"expiry";
  void v7[3] = @"cts";
  void v8[2] = &off_100012590;
  void v8[3] = &off_1000125A8;
  unint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v12[1] = v3;
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  void v14[7] = v4;
  void v14[8] = &off_1000124B8;
  void v13[8] = @"fidoAuth";
  void v13[9] = @"additionalInfo";
  void v14[9] = &off_100012F98;
  void v14[10] = @"rFOiZoNohvQwbVT95F/qB45idwC0VEJ45LIW4yhMMTHV0eXdihQ1vOyWKi/q0l+EePrrBHe4sYdoRyVP";
  void v13[10] = @"ck";
  v13[11] = @"prk";
  v14[11] = @"qB45idwC0VEJ45LIW4yhMMTHV0eXdihQ1vOyWKi/q0l+EePrrBHe4sYdoRyVP";
  v14[12] = &off_100012FC0;
  v13[12] = @"continuationKey";
  v13[13] = @"passwordResetKey";
  v14[13] = &off_100012FE8;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:14];

  return v5;
}

+ (id)SPDMissingCriticalAuthTokensSRPSuccess
{
  v13[0] = @"DsPrsId";
  v13[1] = @"adsid";
  v14[0] = &off_100012488;
  v14[1] = @"001589-08-b439a955-e1e2-4c34-bdd0-e07f91ea8662";
  void v13[2] = @"alias";
  v13[3] = @"acname";
  v14[2] = &__NSDictionary0__struct;
  void v14[3] = @"account4test@icloud.apple";
  v13[4] = @"ut";
  v13[5] = @"authmode";
  v14[4] = &off_1000124D0;
  v14[5] = &off_1000124B8;
  v14[6] = &off_1000124B8;
  v13[6] = @"demoAccount";
  void v13[7] = @"t";
  v9[0] = @"token";
  v9[1] = @"duration";
  v10[0] = @"GVtHK4ub5gBzT2rEZdi4QYagrx1Qa1Xo75riHBNosZF+0UlfUPVqO4+2UOS+n5oVrNbA9ZeEjUCKBfRH6vn02dBXkWSCnPtJ0aWtd7B5AsrDKlvQG00UNg+EmlCxXwHJ7T6DYtkj2J+P8yo+tR1BN6apP5vcsQnxLwdwQ1Di/k67HCg4G30Yzr3X7fUvy0G6nOAwwnawlvrOx9wepJWxpT5hrmAeX+0yEjzXiwzsJ1kpyEZr4G0zyOXI37Thp6jjPPeRYmu21BxqFpTk9npZQwUrZkytzSUCoJ8+ZbQBMIRtq+J0HSDyWmBbLzQXyKJ8YglnTxI=PET";
  v10[1] = &off_100012500;
  v11[0] = @"com.apple.gs.idms.pet";
  id v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v11[1] = @"com.apple.gs.idms.hb";
  v12[0] = v2;
  v7[0] = @"token";
  v7[1] = @"duration";
  v8[0] = @"AAAABLwIAAAAAFiTawwRCmdzLmlkbXMuaGK9AEr1O7ISMGE6QcJKA0fCfvkIIQ7DtQLwTv+kNocsKs3dNKRf7mx806XNTvitHW5RCVRXc0/o0kkyS2x+/NoLMX5cr7AT4fY19m1DhpSYT3rS1KmKDNUd2gAnnp70Ehz3wv4MLmdwlkHNO/LKSbQMLISBNaRXfZBGETUqaNVvj5XT6FQNTzcXdREGGzXzNYfbx/uLVxpzFHUwee1T0tA91onStnNC";
  v8[1] = &off_100012500;
  void v7[2] = @"expiry";
  void v8[2] = &off_100012590;
  unint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  v12[1] = v3;
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  void v14[7] = v4;
  void v14[8] = &off_1000124B8;
  void v13[8] = @"fidoAuth";
  void v13[9] = @"additionalInfo";
  void v14[9] = &off_100013060;
  void v14[10] = @"rFOiZoNohvQwbVT95F/qB45idwC0VEJ45LIW4yhMMTHV0eXdihQ1vOyWKi/q0l+EePrrBHe4sYdoRyVP";
  void v13[10] = @"ck";
  v13[11] = @"prk";
  v14[11] = @"qB45idwC0VEJ45LIW4yhMMTHV0eXdihQ1vOyWKi/q0l+EePrrBHe4sYdoRyVP";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:12];

  return v5;
}

+ (id)anisetteRetryResponse
{
  return &off_1000130D8;
}

+ (id)anisetteResponseSuccess
{
  return &off_100013150;
}

+ (id)anisetteEndProvisioningSuccessResponse
{
  return &off_1000131C8;
}

+ (id)anisetteStartProvisioningSuccessResponse
{
  return &off_100013240;
}

@end