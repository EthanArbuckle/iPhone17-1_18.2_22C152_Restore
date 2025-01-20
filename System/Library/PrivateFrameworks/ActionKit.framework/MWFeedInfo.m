@interface MWFeedInfo
- (MWFeedInfo)initWithCoder:(id)a3;
- (NSString)link;
- (NSString)summary;
- (NSString)title;
- (NSURL)url;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLink:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MWFeedInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->summary, 0);
  objc_storeStrong((id *)&self->link, 0);
  objc_storeStrong((id *)&self->title, 0);
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->url;
}

- (void)setSummary:(id)a3
{
}

- (NSString)summary
{
  return self->summary;
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  title = self->title;
  id v9 = v4;
  if (title)
  {
    [v4 encodeObject:title forKey:@"title"];
    id v4 = v9;
  }
  link = self->link;
  if (link)
  {
    [v9 encodeObject:link forKey:@"link"];
    id v4 = v9;
  }
  summary = self->summary;
  if (summary)
  {
    [v9 encodeObject:summary forKey:@"summary"];
    id v4 = v9;
  }
  url = self->url;
  if (url)
  {
    [v9 encodeObject:url forKey:@"url"];
    id v4 = v9;
  }
}

- (MWFeedInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MWFeedInfo;
  v5 = [(MWFeedInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"title"];
    title = v5->title;
    v5->title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"link"];
    link = v5->link;
    v5->link = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"summary"];
    summary = v5->summary;
    v5->summary = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"url"];
    url = v5->url;
    v5->url = (NSURL *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"MWFeedInfo: "];
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
  return v3;
}

@end