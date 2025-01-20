@interface AFInsertionManager
+ (id)preferredInsertionOrder;
@end

@implementation AFInsertionManager

+ (id)preferredInsertionOrder
{
  if (preferredInsertionOrder_onceToken != -1) {
    dispatch_once(&preferredInsertionOrder_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)preferredInsertionOrder_preferredInsertionOrder;
  return v2;
}

void __45__AFInsertionManager_preferredInsertionOrder__block_invoke()
{
  v2[52] = *MEMORY[0x263EF8340];
  v2[0] = @"username";
  v2[1] = @"password";
  v2[2] = @"new-password";
  v2[3] = @"email";
  v2[4] = @"name";
  v2[5] = @"given-name";
  v2[6] = @"additional-name";
  v2[7] = @"family-name";
  v2[8] = @"street-address";
  v2[9] = @"address-line1";
  v2[10] = @"address-line2";
  v2[11] = @"address-level2";
  v2[12] = @"address-level1";
  v2[13] = @"address-level1+2";
  v2[14] = @"address-level3";
  v2[15] = @"country-name";
  v2[16] = @"postal-code";
  v2[17] = @"tel";
  v2[18] = @"bday";
  v2[19] = @"bday-day";
  v2[20] = @"bday-month";
  v2[21] = @"bday-year";
  v2[22] = @"cc-name";
  v2[23] = @"cc-given-name";
  v2[24] = @"cc-additional-name";
  v2[25] = @"cc-family-name";
  v2[26] = @"cc-number";
  v2[27] = @"cc-csc";
  v2[28] = @"cc-exp";
  v2[29] = @"cc-exp-month";
  v2[30] = @"cc-exp-year";
  v2[31] = @"cc-type";
  v2[32] = @"signup-username";
  v2[33] = @"login-username";
  v2[34] = @"one-time-code";
  v2[35] = @"honorifix-prefix";
  v2[36] = @"honorifix-suffix";
  v2[37] = @"nickname";
  v2[38] = @"organization-title";
  v2[39] = @"organization";
  v2[40] = @"location";
  v2[41] = @"tel-national";
  v2[42] = @"tel-country-code";
  v2[43] = @"tel-area-code";
  v2[44] = @"tel-local";
  v2[45] = @"tel-extension";
  v2[46] = @"cc-number";
  v2[47] = @"url";
  v2[48] = @"equation";
  v2[49] = @"shipment-tracking-number";
  v2[50] = @"flight-number";
  v2[51] = @"date-time";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:52];
  v1 = (void *)preferredInsertionOrder_preferredInsertionOrder;
  preferredInsertionOrder_preferredInsertionOrder = v0;
}

@end