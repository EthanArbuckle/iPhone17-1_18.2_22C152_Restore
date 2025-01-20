@interface BLDownloadSinf
- (BLDownloadSinf)initWithDictionary:(id)a3;
- (NSDictionary)info;
- (id)dataForSinfDataKey:(id)a3;
- (int64_t)identifier;
- (void)setInfo:(id)a3;
@end

@implementation BLDownloadSinf

- (BLDownloadSinf)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLDownloadSinf;
  v5 = [(BLDownloadSinf *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    info = v5->_info;
    v5->_info = v6;
  }
  return v5;
}

- (id)dataForSinfDataKey:(id)a3
{
  return [(NSDictionary *)self->_info objectForKey:a3];
}

- (int64_t)identifier
{
  v2 = [(NSDictionary *)self->_info objectForKey:@"id"];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end