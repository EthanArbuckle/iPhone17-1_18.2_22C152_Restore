@interface EDAMAd
+ (id)structFields;
+ (id)structName;
- (NSData)image;
- (NSNumber)displayFrequency;
- (NSNumber)displaySeconds;
- (NSNumber)height;
- (NSNumber)id;
- (NSNumber)openInTrunk;
- (NSNumber)score;
- (NSNumber)width;
- (NSString)advertiserName;
- (NSString)destinationUrl;
- (NSString)html;
- (NSString)imageMime;
- (NSString)imageUrl;
- (void)setAdvertiserName:(id)a3;
- (void)setDestinationUrl:(id)a3;
- (void)setDisplayFrequency:(id)a3;
- (void)setDisplaySeconds:(id)a3;
- (void)setHeight:(id)a3;
- (void)setHtml:(id)a3;
- (void)setId:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageMime:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setOpenInTrunk:(id)a3;
- (void)setScore:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation EDAMAd

+ (id)structFields
{
  v19[13] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2016;
  if (!structFields_structFields_2016)
  {
    v18 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"id"];
    v19[0] = v18;
    v17 = +[FATField fieldWithIndex:2 type:6 optional:1 name:@"width"];
    v19[1] = v17;
    v16 = +[FATField fieldWithIndex:3 type:6 optional:1 name:@"height"];
    v19[2] = v16;
    v3 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"advertiserName"];
    v19[3] = v3;
    v4 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"imageUrl"];
    v19[4] = v4;
    v5 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"destinationUrl"];
    v19[5] = v5;
    v6 = +[FATField fieldWithIndex:7 type:6 optional:1 name:@"displaySeconds"];
    v19[6] = v6;
    v7 = +[FATField fieldWithIndex:8 type:4 optional:1 name:@"score"];
    v19[7] = v7;
    v8 = +[FATField fieldWithIndex:9 type:16 optional:1 name:@"image"];
    v19[8] = v8;
    v9 = +[FATField fieldWithIndex:10 type:11 optional:1 name:@"imageMime"];
    v19[9] = v9;
    v10 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"html"];
    v19[10] = v10;
    v11 = +[FATField fieldWithIndex:12 type:4 optional:1 name:@"displayFrequency"];
    v19[11] = v11;
    v12 = +[FATField fieldWithIndex:13 type:2 optional:1 name:@"openInTrunk"];
    v19[12] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:13];
    v14 = (void *)structFields_structFields_2016;
    structFields_structFields_2016 = v13;

    v2 = (void *)structFields_structFields_2016;
  }
  return v2;
}

+ (id)structName
{
  return @"Ad";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openInTrunk, 0);
  objc_storeStrong((id *)&self->_displayFrequency, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_imageMime, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_displaySeconds, 0);
  objc_storeStrong((id *)&self->_destinationUrl, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
  objc_storeStrong((id *)&self->_advertiserName, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setOpenInTrunk:(id)a3
{
}

- (NSNumber)openInTrunk
{
  return self->_openInTrunk;
}

- (void)setDisplayFrequency:(id)a3
{
}

- (NSNumber)displayFrequency
{
  return self->_displayFrequency;
}

- (void)setHtml:(id)a3
{
}

- (NSString)html
{
  return self->_html;
}

- (void)setImageMime:(id)a3
{
}

- (NSString)imageMime
{
  return self->_imageMime;
}

- (void)setImage:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setScore:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setDisplaySeconds:(id)a3
{
}

- (NSNumber)displaySeconds
{
  return self->_displaySeconds;
}

- (void)setDestinationUrl:(id)a3
{
}

- (NSString)destinationUrl
{
  return self->_destinationUrl;
}

- (void)setImageUrl:(id)a3
{
}

- (NSString)imageUrl
{
  return self->_imageUrl;
}

- (void)setAdvertiserName:(id)a3
{
}

- (NSString)advertiserName
{
  return self->_advertiserName;
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

- (void)setId:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

@end