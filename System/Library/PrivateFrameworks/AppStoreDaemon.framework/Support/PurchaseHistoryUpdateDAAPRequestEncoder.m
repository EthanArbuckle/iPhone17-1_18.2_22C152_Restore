@interface PurchaseHistoryUpdateDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
- (unint64_t)contentType;
@end

@implementation PurchaseHistoryUpdateDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v4 = (id)[(NSNumber *)revision intValue];
  }
  else {
    id v4 = 0;
  }
  v5 = sub_10041F030();
  v6 = +[NSString stringWithFormat:@"(%@)", v5];

  v7 = +[NSString stringWithFormat:@"revision-number=%u&query=%@", v4, v6];
  v8 = [v7 dataUsingEncoding:4];

  return v8;
}

- (unint64_t)contentType
{
  return 1;
}

- (void).cxx_destruct
{
}

@end