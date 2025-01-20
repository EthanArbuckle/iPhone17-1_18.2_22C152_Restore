@interface SKANToken
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isRedownload;
- (NSNumber)appAdamId;
- (NSNumber)timestamp;
- (NSString)blindedElement;
- (NSString)certificate;
- (NSString)finalizedToken;
- (NSString)privateInput;
- (SKANToken)initWithAppAdamId:(id)a3 blindedData:(id)a4;
- (id)dictionaryRepresentationForRequest;
- (void)setCertificate:(id)a3;
- (void)setFinalizedToken:(id)a3;
- (void)setIsRedownload:(BOOL)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SKANToken

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"app_adam_id";
  v4[1] = @"blinded_element";
  v4[2] = @"private_input";
  v4[3] = @"finalized_token";
  v4[4] = @"certificate";
  v4[5] = @"is_redownload";
  v4[6] = @"timestamp";
  v2 = +[NSArray arrayWithObjects:v4 count:7];
  return v2;
}

- (SKANToken)initWithAppAdamId:(id)a3 blindedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKANToken;
  v8 = [(SQLiteMemoryEntity *)&v13 init];
  v9 = v8;
  if (v6 && v8)
  {
    [(SQLiteMemoryEntity *)v8 setValue:v6 forProperty:@"app_adam_id"];
    v10 = [v7 blindedElement];
    [(SQLiteMemoryEntity *)v9 setValue:v10 forProperty:@"blinded_element"];

    v11 = [v7 privateInput];
    [(SQLiteMemoryEntity *)v9 setValue:v11 forProperty:@"private_input"];
  }
  return v9;
}

- (id)dictionaryRepresentationForRequest
{
  v3 = objc_opt_new();
  v4 = [(SKANToken *)self appAdamId];
  [v3 setObject:v4 forKeyedSubscript:@"adam-id"];

  v5 = [(SKANToken *)self timestamp];
  [v3 setObject:v5 forKeyedSubscript:@"timestamp"];

  if (sub_10026E7EC(self, @"is_redownload")) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  [v3 setObject:v6 forKeyedSubscript:@"is-redownload"];
  id v7 = [(SKANToken *)self privateInput];
  [v3 setObject:v7 forKeyedSubscript:@"private-input"];

  v8 = [(SKANToken *)self finalizedToken];
  [v3 setObject:v8 forKeyedSubscript:@"prf-client"];

  v9 = [(SKANToken *)self certificate];
  [v3 setObject:v9 forKeyedSubscript:@"certificate"];

  return v3;
}

- (NSNumber)appAdamId
{
  return (NSNumber *)sub_10026E82C(self, @"app_adam_id");
}

- (NSString)blindedElement
{
  return (NSString *)sub_10026E95C(self, @"blinded_element");
}

- (NSString)privateInput
{
  return (NSString *)sub_10026E95C(self, @"private_input");
}

- (NSString)finalizedToken
{
  return (NSString *)sub_10026E95C(self, @"finalized_token");
}

- (NSString)certificate
{
  return (NSString *)sub_10026E95C(self, @"certificate");
}

- (NSNumber)timestamp
{
  return (NSNumber *)sub_10026E82C(self, @"timestamp");
}

- (BOOL)isRedownload
{
  return sub_10026E7EC(self, @"is_redownload");
}

- (void)setFinalizedToken:(id)a3
{
}

- (void)setCertificate:(id)a3
{
}

- (void)setIsRedownload:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_redownload"];
}

- (void)setTimestamp:(id)a3
{
}

@end