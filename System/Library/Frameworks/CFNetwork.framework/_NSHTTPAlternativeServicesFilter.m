@interface _NSHTTPAlternativeServicesFilter
+ (id)emptyFilter;
- (NSString)host;
- (NSString)partition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)port;
- (void)setHost:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPort:(int64_t)a3;
@end

@implementation _NSHTTPAlternativeServicesFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partition, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_NSHTTPAlternativeServicesFilter);
  v5 = [(_NSHTTPAlternativeServicesFilter *)self host];
  [(_NSHTTPAlternativeServicesFilter *)v4 setHost:v5];

  [(_NSHTTPAlternativeServicesFilter *)v4 setPort:[(_NSHTTPAlternativeServicesFilter *)self port]];
  v6 = [(_NSHTTPAlternativeServicesFilter *)self partition];
  [(_NSHTTPAlternativeServicesFilter *)v4 setPartition:v6];

  return v4;
}

- (int64_t)port
{
  return self->_port;
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void)setPartition:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"none";
  }
  partition = self->_partition;
  self->_partition = &v5->isa;
}

- (void)setHost:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

+ (id)emptyFilter
{
  v2 = objc_alloc_init(_NSHTTPAlternativeServicesFilter);

  return v2;
}

@end