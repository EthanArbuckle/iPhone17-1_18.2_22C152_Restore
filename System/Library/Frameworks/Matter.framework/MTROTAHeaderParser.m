@interface MTROTAHeaderParser
+ (MTROTAHeader)headerFromData:(NSData *)data error:(NSError *)error;
@end

@implementation MTROTAHeaderParser

+ (MTROTAHeader)headerFromData:(NSData *)data error:(NSError *)error
{
  v5 = data;
  v6 = [MTROTAHeader alloc];
  uint64_t v8 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v5);
  v9 = (void *)v8;
  if (error && !v8)
  {
    LODWORD(v11) = 47;
    *((void *)&v11 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/MTROTAHeader.mm";
    int v12 = 82;
    sub_244B26908((uint64_t)MTRError, &v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (MTROTAHeader *)v9;
}

@end