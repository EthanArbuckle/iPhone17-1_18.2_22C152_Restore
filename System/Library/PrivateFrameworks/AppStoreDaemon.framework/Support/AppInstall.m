@interface AppInstall
+ (id)defaultProperties;
- (BOOL)isRestore;
@end

@implementation AppInstall

- (BOOL)isRestore
{
  return ((unint64_t)sub_10026E91C(self, @"restore_type") & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (id)defaultProperties
{
  v4[0] = @"approved";
  v4[1] = @"arcade";
  v4[2] = @"automatic_type";
  v4[3] = @"bootstrapped";
  v4[4] = @"bundle_id";
  v4[5] = @"client_id";
  v4[6] = @"external_id";
  v4[7] = @"item_id";
  v4[8] = @"last_start_date";
  v4[9] = @"log_code";
  v4[10] = @"optimal_download_start";
  v4[11] = @"order_index";
  v4[12] = @"priority";
  v4[13] = @"policy";
  v4[14] = @"restore_type";
  v4[15] = @"software_platform";
  v4[16] = @"source_type";
  v4[17] = @"supress_dialogs";
  v4[18] = @"update_type";
  v2 = +[NSArray arrayWithObjects:v4 count:19];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end