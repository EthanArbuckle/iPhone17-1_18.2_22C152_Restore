@interface _BLLoadStoreDownloadRequestEncoder
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation _BLLoadStoreDownloadRequestEncoder

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  [v7 setCachePolicy:1];
  v10.receiver = self;
  v10.super_class = (Class)_BLLoadStoreDownloadRequestEncoder;
  v8 = [(_BLLoadStoreDownloadRequestEncoder *)&v10 requestByEncodingRequest:v7 parameters:v6];

  return v8;
}

@end