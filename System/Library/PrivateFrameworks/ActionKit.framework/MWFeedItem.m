@interface MWFeedItem
- (MWFeedItem)initWithCoder:(id)a3;
- (NSArray)enclosures;
- (NSDate)date;
- (NSDate)updated;
- (NSString)author;
- (NSString)content;
- (NSString)identifier;
- (NSString)link;
- (NSString)summary;
- (NSString)title;
- (id)asWFArticle;
- (id)description;
- (id)mainImageURL;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setContent:(id)a3;
- (void)setDate:(id)a3;
- (void)setEnclosures:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLink:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation MWFeedItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->enclosures, 0);
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->content, 0);
  objc_storeStrong((id *)&self->summary, 0);
  objc_storeStrong((id *)&self->updated, 0);
  objc_storeStrong((id *)&self->date, 0);
  objc_storeStrong((id *)&self->link, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setEnclosures:(id)a3
{
}

- (NSArray)enclosures
{
  return self->enclosures;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)author
{
  return self->author;
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->content;
}

- (void)setSummary:(id)a3
{
}

- (NSString)summary
{
  return self->summary;
}

- (void)setUpdated:(id)a3
{
}

- (NSDate)updated
{
  return self->updated;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->date;
}

- (void)setLink:(id)a3
{
}

- (NSString)link
{
  return self->link;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->identifier;
  id v14 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v14;
  }
  title = self->title;
  if (title)
  {
    [v14 encodeObject:title forKey:@"title"];
    id v4 = v14;
  }
  link = self->link;
  if (link)
  {
    [v14 encodeObject:link forKey:@"link"];
    id v4 = v14;
  }
  date = self->date;
  if (date)
  {
    [v14 encodeObject:date forKey:@"date"];
    id v4 = v14;
  }
  updated = self->updated;
  if (updated)
  {
    [v14 encodeObject:updated forKey:@"updated"];
    id v4 = v14;
  }
  summary = self->summary;
  if (summary)
  {
    [v14 encodeObject:summary forKey:@"summary"];
    id v4 = v14;
  }
  content = self->content;
  if (content)
  {
    [v14 encodeObject:content forKey:@"content"];
    id v4 = v14;
  }
  author = self->author;
  if (author)
  {
    [v14 encodeObject:author forKey:@"author"];
    id v4 = v14;
  }
  enclosures = self->enclosures;
  if (enclosures)
  {
    [v14 encodeObject:enclosures forKey:@"enclosures"];
    id v4 = v14;
  }
}

- (MWFeedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MWFeedItem;
  v5 = [(MWFeedItem *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"identifier"];
    identifier = v5->identifier;
    v5->identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"title"];
    title = v5->title;
    v5->title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"link"];
    link = v5->link;
    v5->link = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"date"];
    date = v5->date;
    v5->date = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"updated"];
    updated = v5->updated;
    v5->updated = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"summary"];
    summary = v5->summary;
    v5->summary = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"content"];
    content = v5->content;
    v5->content = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectForKey:@"author"];
    author = v5->author;
    v5->author = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectForKey:@"enclosures"];
    enclosures = v5->enclosures;
    v5->enclosures = (NSArray *)v22;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"MWFeedItem: "];
  title = self->title;
  if (title)
  {
    if ([(NSString *)title length] <= 0x32)
    {
      [v3 appendFormat:@"“%@”", self->title];
    }
    else
    {
      v5 = [(NSString *)self->title substringToIndex:49];
      uint64_t v6 = [v5 stringByAppendingString:@"…"];
      [v3 appendFormat:@"“%@”", v6];
    }
  }
  if (self->date) {
    [v3 appendFormat:@" - %@", self->date];
  }
  return v3;
}

- (id)asWFArticle
{
  v3 = [(MWFeedItem *)self content];
  uint64_t v4 = [MEMORY[0x263F33720] numberOfWordsInString:v3];
  v5 = NSURL;
  uint64_t v6 = [(MWFeedItem *)self link];
  v7 = [v5 URLWithString:v6];

  uint64_t v8 = (void *)MEMORY[0x263F33720];
  v9 = [(MWFeedItem *)self title];
  uint64_t v10 = [(MWFeedItem *)self author];
  v11 = [(MWFeedItem *)self date];
  uint64_t v12 = [(MWFeedItem *)self summary];
  v13 = [(MWFeedItem *)self mainImageURL];
  uint64_t v14 = [v8 articleWithTitle:v9 author:v10 publishedDate:v11 body:v3 excerpt:v12 numberOfWords:v4 mainImageURL:v13 URL:v7];

  return v14;
}

- (id)mainImageURL
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(MWFeedItem *)self enclosures];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    uint64_t v5 = *MEMORY[0x263F1DB18];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = [v7 objectForKeyedSubscript:@"url"];
        v9 = [v7 objectForKeyedSubscript:@"type"];
        uint64_t v10 = [MEMORY[0x263F852B8] typeFromMIMEType:v9];
        if ([v10 conformsToUTType:v5]) {
          BOOL v11 = v8 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          uint64_t v12 = [NSURL URLWithString:v8];

          goto LABEL_14;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }

  uint64_t v12 = [MEMORY[0x263F33720] mainImageURLFromHTML:self->content];
LABEL_14:
  return v12;
}

@end