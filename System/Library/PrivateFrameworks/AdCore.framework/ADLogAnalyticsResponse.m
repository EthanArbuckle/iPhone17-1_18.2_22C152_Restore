@interface ADLogAnalyticsResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation ADLogAnalyticsResponse

+ (id)options
{
  if (options_once_8 != -1) {
    dispatch_once(&options_once_8, &__block_literal_global_14);
  }
  v2 = (void *)options_sOptions_8;
  return v2;
}

void __33__ADLogAnalyticsResponse_options__block_invoke()
{
  v0 = (void *)options_sOptions_8;
  options_sOptions_8 = (uint64_t)&unk_1F2715578;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADLogAnalyticsResponse;
  v4 = [(ADLogAnalyticsResponse *)&v8 description];
  v5 = [(ADLogAnalyticsResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return ADLogAnalyticsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end