@interface RestoreAppInstall
+ (id)defaultProperties;
- (id)description;
@end

@implementation RestoreAppInstall

+ (id)defaultProperties
{
  v4[0] = @"account_id";
  v4[1] = @"alt_dsid";
  v4[2] = @"apple_id";
  v4[3] = @"approved";
  v4[4] = @"arcade";
  v4[5] = @"bootstrapped";
  v4[6] = @"bundle_id";
  v4[7] = @"coordinator_id";
  v4[8] = @"coordinator_intent";
  v4[9] = @"device_based_vpp";
  v4[10] = @"downloader_id";
  v4[11] = @"external_id";
  v4[12] = @"evid";
  v4[13] = @"failure_error";
  v4[14] = @"item_id";
  v4[15] = @"log_code";
  v4[16] = @"metrics_install_type";
  v4[17] = @"order_index";
  v4[18] = @"phase";
  v4[19] = @"priority";
  v4[20] = @"restore_retry_count";
  v4[21] = @"restore_type";
  v4[22] = @"restore_state";
  v4[23] = @"store_metadata";
  v4[24] = @"storefront";
  v4[25] = @"supress_dialogs";
  v4[26] = @"vid";
  v4[27] = @"ROWID";
  v2 = +[NSArray arrayWithObjects:v4 count:28];
  return v2;
}

- (id)description
{
  v3 = sub_100424D84(self);
  v4 = sub_100424E64(self);
  v5 = sub_1003B7FFC(self);
  v6 = sub_1003B804C(self);
  v7 = sub_1003B7F58(self);
  v8 = +[NSString stringWithFormat:@"{ bundleID: %@ itemID: %@ evid: %@ storefront: %@ account: %@ }", v3, v4, v5, v6, v7];

  return v8;
}

@end