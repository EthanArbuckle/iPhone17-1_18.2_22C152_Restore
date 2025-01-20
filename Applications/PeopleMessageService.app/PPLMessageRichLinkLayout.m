@interface PPLMessageRichLinkLayout
+ (id)createRichLinkLayoutWithURL:(id)a3 title:(id)a4 imageData:(id)a5;
@end

@implementation PPLMessageRichLinkLayout

+ (id)createRichLinkLayoutWithURL:(id)a3 title:(id)a4 imageData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)LPLinkMetadata);
  [v10 setTitle:v8];

  [v10 setURL:v9];
  if (v7)
  {
    id v11 = [objc_alloc((Class)LPImage) initWithData:v7 MIMEType:@"image/png"];
    [v10 setImage:v11];
  }
  id v12 = [objc_alloc((Class)MSMessageRichLinkLayout) initWithLinkMetadata:v10];

  return v12;
}

@end