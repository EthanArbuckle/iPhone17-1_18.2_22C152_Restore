@interface HSArtworkRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5;
- (BOOL)acceptsGzipEncoding;
- (BOOL)isConcurrent;
- (HSArtworkRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5;
@end

@implementation HSArtworkRequest

- (BOOL)acceptsGzipEncoding
{
  return 0;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (HSArtworkRequest)initWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"databases/%u/items/%llu/extra_data/artwork", *(void *)&a3, a4);
  v9 = [(HSRequest *)self initWithAction:v8];

  if (v9 && (width != 0.0 || height != 0.0))
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u", width);
    [(HSRequest *)v9 setValue:v10 forArgument:@"mw"];

    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%u", height);
    [(HSRequest *)v9 setValue:v11 forArgument:@"mh"];
  }
  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemID:(unint64_t)a4 size:(CGSize)a5
{
  v5 = -[HSArtworkRequest initWithDatabaseID:itemID:size:]([HSArtworkRequest alloc], "initWithDatabaseID:itemID:size:", *(void *)&a3, a4, a5.width, a5.height);
  return v5;
}

@end