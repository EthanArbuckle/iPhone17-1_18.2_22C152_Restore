@interface CoreDAVItemWithHrefChildItemTolerateBarePayload
- (id)description;
- (id)href;
- (void)parserSuggestsBaseURL:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation CoreDAVItemWithHrefChildItemTolerateBarePayload

- (id)href
{
  href = self->super._href;
  if (!href) {
    href = self->_virtualHref;
  }
  return href;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVItemWithHrefChildItemTolerateBarePayload;
  v3 = [(CoreDAVItemWithHrefChildItem *)&v7 description];
  v4 = v3;
  if (self->super._href)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
    [v5 appendFormat:@"\n  (virtual HREF, element had a bare payload)"];
  }

  return v5;
}

- (void)setPayload:(id)a3
{
  id v10 = a3;
  v4 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  id v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = objc_alloc_init(CoreDAVHrefItem);
    virtualHref = self->_virtualHref;
    self->_virtualHref = v8;

    [(CoreDAVItem *)self->_virtualHref setPayload:v10];
    if (self->_baseURL) {
      -[CoreDAVHrefItem parserSuggestsBaseURL:](self->_virtualHref, "parserSuggestsBaseURL:");
    }
  }
}

- (void)parserSuggestsBaseURL:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_baseURL, a3);
  virtualHref = self->_virtualHref;
  if (virtualHref) {
    [(CoreDAVHrefItem *)virtualHref parserSuggestsBaseURL:self->_baseURL];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_virtualHref, 0);
}

@end