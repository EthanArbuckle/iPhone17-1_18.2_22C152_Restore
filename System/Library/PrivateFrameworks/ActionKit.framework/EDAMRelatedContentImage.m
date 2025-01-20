@interface EDAMRelatedContentImage
+ (id)structFields;
+ (id)structName;
- (NSNumber)fileSize;
- (NSNumber)height;
- (NSNumber)pixelRatio;
- (NSNumber)width;
- (NSString)url;
- (void)setFileSize:(id)a3;
- (void)setHeight:(id)a3;
- (void)setPixelRatio:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation EDAMRelatedContentImage

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2580;
  if (!structFields_structFields_2580)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"url"];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"width", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"height"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:4 optional:1 name:@"pixelRatio"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"fileSize"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_2580;
    structFields_structFields_2580 = v8;

    v2 = (void *)structFields_structFields_2580;
  }
  return v2;
}

+ (id)structName
{
  return @"RelatedContentImage";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_pixelRatio, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setFileSize:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setPixelRatio:(id)a3
{
}

- (NSNumber)pixelRatio
{
  return self->_pixelRatio;
}

- (void)setHeight:(id)a3
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setWidth:(id)a3
{
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

@end