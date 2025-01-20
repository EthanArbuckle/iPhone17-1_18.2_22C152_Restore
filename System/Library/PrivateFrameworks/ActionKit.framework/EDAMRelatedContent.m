@interface EDAMRelatedContent
+ (id)structFields;
+ (id)structName;
- (EDAMContact)contact;
- (NSArray)authors;
- (NSArray)thumbnails;
- (NSNumber)accessType;
- (NSNumber)contentType;
- (NSNumber)date;
- (NSString)clipUrl;
- (NSString)contentId;
- (NSString)sourceFaviconUrl;
- (NSString)sourceId;
- (NSString)sourceName;
- (NSString)sourceUrl;
- (NSString)teaser;
- (NSString)title;
- (NSString)url;
- (NSString)visibleUrl;
- (void)setAccessType:(id)a3;
- (void)setAuthors:(id)a3;
- (void)setClipUrl:(id)a3;
- (void)setContact:(id)a3;
- (void)setContentId:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDate:(id)a3;
- (void)setSourceFaviconUrl:(id)a3;
- (void)setSourceId:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceUrl:(id)a3;
- (void)setTeaser:(id)a3;
- (void)setThumbnails:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVisibleUrl:(id)a3;
@end

@implementation EDAMRelatedContent

+ (id)structFields
{
  v24[16] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2613;
  if (!structFields_structFields_2613)
  {
    v23 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"contentId"];
    v24[0] = v23;
    v22 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"title"];
    v24[1] = v22;
    v21 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"url"];
    v24[2] = v21;
    v20 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"sourceId"];
    v24[3] = v20;
    v19 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"sourceUrl"];
    v24[4] = v19;
    v18 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"sourceFaviconUrl"];
    v24[5] = v18;
    v17 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"sourceName"];
    v24[6] = v17;
    v16 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"date"];
    v24[7] = v16;
    v3 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"teaser"];
    v24[8] = v3;
    v4 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v5 = +[FATField fieldWithIndex:10 type:15 optional:1 name:@"thumbnails" valueField:v4];
    v24[9] = v5;
    v6 = +[FATField fieldWithIndex:11 type:8 optional:1 name:@"contentType"];
    v24[10] = v6;
    v7 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"accessType"];
    v24[11] = v7;
    v8 = +[FATField fieldWithIndex:13 type:11 optional:1 name:@"visibleUrl"];
    v24[12] = v8;
    v9 = +[FATField fieldWithIndex:14 type:11 optional:1 name:@"clipUrl"];
    v24[13] = v9;
    v10 = +[FATField fieldWithIndex:15 type:12 optional:1 name:@"contact" structClass:objc_opt_class()];
    v24[14] = v10;
    v11 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v12 = +[FATField fieldWithIndex:16 type:15 optional:1 name:@"authors" valueField:v11];
    v24[15] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:16];
    v14 = (void *)structFields_structFields_2613;
    structFields_structFields_2613 = v13;

    v2 = (void *)structFields_structFields_2613;
  }
  return v2;
}

+ (id)structName
{
  return @"RelatedContent";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_clipUrl, 0);
  objc_storeStrong((id *)&self->_visibleUrl, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_thumbnails, 0);
  objc_storeStrong((id *)&self->_teaser, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceFaviconUrl, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

- (void)setAuthors:(id)a3
{
}

- (NSArray)authors
{
  return self->_authors;
}

- (void)setContact:(id)a3
{
}

- (EDAMContact)contact
{
  return self->_contact;
}

- (void)setClipUrl:(id)a3
{
}

- (NSString)clipUrl
{
  return self->_clipUrl;
}

- (void)setVisibleUrl:(id)a3
{
}

- (NSString)visibleUrl
{
  return self->_visibleUrl;
}

- (void)setAccessType:(id)a3
{
}

- (NSNumber)accessType
{
  return self->_accessType;
}

- (void)setContentType:(id)a3
{
}

- (NSNumber)contentType
{
  return self->_contentType;
}

- (void)setThumbnails:(id)a3
{
}

- (NSArray)thumbnails
{
  return self->_thumbnails;
}

- (void)setTeaser:(id)a3
{
}

- (NSString)teaser
{
  return self->_teaser;
}

- (void)setDate:(id)a3
{
}

- (NSNumber)date
{
  return self->_date;
}

- (void)setSourceName:(id)a3
{
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceFaviconUrl:(id)a3
{
}

- (NSString)sourceFaviconUrl
{
  return self->_sourceFaviconUrl;
}

- (void)setSourceUrl:(id)a3
{
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceId:(id)a3
{
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setContentId:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

@end