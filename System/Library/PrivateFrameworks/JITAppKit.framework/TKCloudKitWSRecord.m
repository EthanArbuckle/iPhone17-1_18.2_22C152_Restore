@interface TKCloudKitWSRecord
+ (id)downloadURLFromCloudKitRecordResponse:(id)a3;
@end

@implementation TKCloudKitWSRecord

+ (id)downloadURLFromCloudKitRecordResponse:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)[location[0] objectForKeyedSubscript:@"records"];
  if (!v13 || ![v13 count]) {
    goto LABEL_16;
  }
  id v12 = (id)[v13 objectAtIndexedSubscript:0];
  id v11 = (id)[v12 objectForKeyedSubscript:@"fields"];
  id v10 = (id)[v11 objectForKeyedSubscript:@"message"];
  if (!v10) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v9 = (id)[v10 objectForKeyedSubscript:@"value"];
  if (!v9) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v8 = (id)[v9 objectForKeyedSubscript:@"downloadURL"];
  if (v8 && [v8 length])
  {
    id v5 = (id)[MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    id v7 = (id)objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:");

    id v15 = (id)[NSURL URLWithString:v7];
    int v6 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    int v6 = 0;
  }
  objc_storeStrong(&v8, 0);
  if (!v6) {
LABEL_12:
  }
    int v6 = 0;
  objc_storeStrong(&v9, 0);
  if (!v6) {
LABEL_14:
  }
    int v6 = 0;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  if (!v6) {
LABEL_16:
  }
    id v15 = 0;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  v3 = v15;
  return v3;
}

@end