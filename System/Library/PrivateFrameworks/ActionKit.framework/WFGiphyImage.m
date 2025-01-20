@interface WFGiphyImage
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)JSONTransformerForKey:(id)a3;
- (NSURL)url;
- (NSURL)videoURL;
- (WFImage)cachedImage;
- (unint64_t)fileSize;
- (unint64_t)height;
- (unint64_t)width;
- (void)setCachedImage:(id)a3;
@end

@implementation WFGiphyImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setCachedImage:(id)a3
{
}

- (WFImage)cachedImage
{
  return self->_cachedImage;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSURL)url
{
  return self->_url;
}

+ (id)JSONTransformerForKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"url"] & 1) != 0
    || [v3 isEqualToString:@"videoURL"])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F08D50], "mtl_URLValueTransformer");
LABEL_8:
    v5 = (void *)v4;
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"fileSize"] & 1) != 0
    || ([v3 isEqualToString:@"width"] & 1) != 0
    || [v3 isEqualToString:@"height"])
  {
    uint64_t v4 = [MEMORY[0x263F86848] transformerUsingForwardBlock:&__block_literal_global_338 reverseBlock:&__block_literal_global_343];
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

uint64_t __38__WFGiphyImage_JSONTransformerForKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(a2, "unsignedLongValue"));
}

uint64_t __38__WFGiphyImage_JSONTransformerForKey___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263F08708];
  id v5 = a2;
  v6 = [v4 decimalDigitCharacterSet];
  v7 = [v6 invertedSet];
  *a3 = [v5 rangeOfCharacterFromSet:v7] == 0x7FFFFFFFFFFFFFFFLL;

  v8 = NSNumber;
  uint64_t v9 = [v5 integerValue];

  return [v8 numberWithInteger:v9];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v2 = objc_msgSend(NSDictionary, "mtl_identityPropertyMapWithModel:", a1);
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"size" forKey:@"fileSize"];
  [v3 setObject:@"mp4" forKey:@"videoURL"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end