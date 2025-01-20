@interface WFURLWebResource
- (WFURLWebResource)initWithURL:(id)a3;
- (id)loadInWKWebView:(id)a3;
- (id)request;
@end

@implementation WFURLWebResource

- (id)loadInWKWebView:(id)a3
{
  id v4 = a3;
  v5 = [(WFURLWebResource *)self request];
  v6 = [v4 loadRequest:v5];

  return v6;
}

- (id)request
{
  v2 = (void *)MEMORY[0x263F089E0];
  v3 = [(WFWebResource *)self URL];
  id v4 = [v2 requestWithURL:v3];

  [v4 _setNonAppInitiated:1];
  return v4;
}

- (WFURLWebResource)initWithURL:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFURLWebResource;
  return [(WFWebResource *)&v4 initWithData:0 URL:a3 MIMEType:0 textEncodingName:0 frameName:0];
}

@end