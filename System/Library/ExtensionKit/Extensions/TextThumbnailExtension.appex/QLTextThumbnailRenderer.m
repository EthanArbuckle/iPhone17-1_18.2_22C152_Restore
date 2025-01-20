@interface QLTextThumbnailRenderer
+ (id)_readingOptionsFromContentType:(id)a3 encoding:(unsigned int)a4;
+ (id)mutableAttributedStringForThumbnailWithData:(id)a3 contentType:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
+ (id)mutableAttributedStringForThumbnailWithURL:(id)a3 contentType:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
+ (id)textDocumentTypeFromContentType:(id)a3;
- (CGSize)contextSize;
- (CGSize)paperSize;
- (NSMutableAttributedString)attributedString;
- (QLTextThumbnailRenderer)initWithData:(id)a3 contentType:(id)a4 stringEncoding:(unint64_t)a5 maxSize:(CGSize)a6 iconMode:(BOOL)a7;
- (QLTextThumbnailRenderer)initWithURL:(id)a3 contentType:(id)a4 stringEncoding:(unint64_t)a5 maxSize:(CGSize)a6 iconMode:(BOOL)a7;
- (void)draw;
- (void)setAttributedString:(id)a3;
- (void)setContextSize:(CGSize)a3;
- (void)setPaperSize:(CGSize)a3;
@end

@implementation QLTextThumbnailRenderer

+ (id)textDocumentTypeFromContentType:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToType:UTTypeRTFD])
  {
    v4 = (id *)&NSRTFDTextDocumentType;
LABEL_7:
    id v5 = *v4;
    goto LABEL_8;
  }
  if ([v3 conformsToType:UTTypeRTF])
  {
    v4 = (id *)&NSRTFTextDocumentType;
    goto LABEL_7;
  }
  if ([v3 conformsToType:UTTypeText])
  {
    v4 = (id *)&NSPlainTextDocumentType;
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

+ (id)_readingOptionsFromContentType:(id)a3 encoding:(unsigned int)a4
{
  if (a3)
  {
    id v5 = a3;
    unint64_t v6 = CFStringConvertEncodingToNSStringEncoding(a4);
    v7 = +[QLTextThumbnailRenderer textDocumentTypeFromContentType:v5];

    if (v7)
    {
      v12[0] = &off_100008770;
      v11[0] = @"NSThumbnail";
      v11[1] = NSCharacterEncodingDocumentAttribute;
      v8 = +[NSNumber numberWithUnsignedInteger:v6];
      v11[2] = NSDocumentTypeDocumentAttribute;
      v12[1] = v8;
      v12[2] = v7;
      v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)mutableAttributedStringForThumbnailWithData:(id)a3 contentType:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 _readingOptionsFromContentType:v9 encoding:QLGuessEncodingForTextFileFromData()];

  id v12 = [objc_alloc((Class)NSMutableAttributedString) initWithData:v10 options:v11 documentAttributes:a5 error:0];

  return v12;
}

+ (id)mutableAttributedStringForThumbnailWithURL:(id)a3 contentType:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [a1 _readingOptionsFromContentType:v10 encoding:QLGuessEncodingForTextFileAtURL()];

  id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithURL:v11 options:v12 documentAttributes:a5 error:a6];

  return v13;
}

- (QLTextThumbnailRenderer)initWithData:(id)a3 contentType:(id)a4 stringEncoding:(unint64_t)a5 maxSize:(CGSize)a6 iconMode:(BOOL)a7
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  v26.receiver = self;
  v26.super_class = (Class)QLTextThumbnailRenderer;
  id v13 = [(QLTextThumbnailRenderer *)&v26 init];
  if (v13)
  {
    id v25 = 0;
    uint64_t v14 = +[QLTextThumbnailRenderer mutableAttributedStringForThumbnailWithData:v11 contentType:v12 documentAttributes:&v25 error:0];
    id v15 = v25;
    attributedString = v13->_attributedString;
    v13->_attributedString = (NSMutableAttributedString *)v14;

    if ([v12 conformsToType:UTTypePlainText])
    {
      v17 = v13->_attributedString;
      NSAttributedStringKey v27 = NSFontAttributeName;
      v18 = +[UIFont monospacedSystemFontOfSize:17.0 weight:UIFontWeightRegular];
      v28 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      -[NSMutableAttributedString setAttributes:range:](v17, "setAttributes:range:", v19, 0, [(NSMutableAttributedString *)v13->_attributedString length]);
    }
    v20 = [v15 objectForKeyedSubscript:NSPaperSizeDocumentAttribute];
    v21 = v20;
    if (v20)
    {
      [v20 CGSizeValue];
    }
    else
    {
      if (width != height)
      {
        double v23 = 1024.0;
        double v22 = width / height * 1024.0;
        goto LABEL_9;
      }
      double v22 = 768.0;
      double v23 = 1024.0;
    }
    double width = floor(height * (v22 / v23));
LABEL_9:
    v13->_paperSize.double width = v22;
    v13->_paperSize.double height = v23;
    v13->_contextSize.double width = width;
    v13->_contextSize.double height = height;
  }
  return v13;
}

- (QLTextThumbnailRenderer)initWithURL:(id)a3 contentType:(id)a4 stringEncoding:(unint64_t)a5 maxSize:(CGSize)a6 iconMode:(BOOL)a7
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  v26.receiver = self;
  v26.super_class = (Class)QLTextThumbnailRenderer;
  id v13 = [(QLTextThumbnailRenderer *)&v26 init];
  if (v13)
  {
    id v25 = 0;
    uint64_t v14 = +[QLTextThumbnailRenderer mutableAttributedStringForThumbnailWithURL:v11 contentType:v12 documentAttributes:&v25 error:0];
    id v15 = v25;
    attributedString = v13->_attributedString;
    v13->_attributedString = (NSMutableAttributedString *)v14;

    if ([v12 conformsToType:UTTypePlainText])
    {
      v17 = v13->_attributedString;
      NSAttributedStringKey v27 = NSFontAttributeName;
      v18 = +[UIFont monospacedSystemFontOfSize:17.0 weight:UIFontWeightRegular];
      v28 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      -[NSMutableAttributedString setAttributes:range:](v17, "setAttributes:range:", v19, 0, [(NSMutableAttributedString *)v13->_attributedString length]);
    }
    v20 = [v15 objectForKeyedSubscript:NSPaperSizeDocumentAttribute];
    v21 = v20;
    if (v20)
    {
      [v20 CGSizeValue];
    }
    else
    {
      if (width != height)
      {
        double v23 = 1024.0;
        double v22 = width / height * 1024.0;
        goto LABEL_9;
      }
      double v22 = 768.0;
      double v23 = 1024.0;
    }
    double width = floor(height * (v22 / v23));
LABEL_9:
    v13->_paperSize.double width = v22;
    v13->_paperSize.double height = v23;
    v13->_contextSize.double width = width;
    v13->_contextSize.double height = height;
  }
  return v13;
}

- (void)draw
{
  [(QLTextThumbnailRenderer *)self paperSize];
  double v4 = v3 * 0.05;
  [(QLTextThumbnailRenderer *)self paperSize];
  double v6 = v5;
  [(QLTextThumbnailRenderer *)self paperSize];
  CGFloat v8 = v7;
  double v9 = v4 + 0.0;
  double v10 = v4 + v4;
  double v11 = v6 - (v4 + v4);
  double v12 = v7 - v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v14 = +[UIColor whiteColor];
  [v14 setFill];

  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.double width = v6;
  v24.size.double height = v8;
  UIRectFill(v24);
  [(QLTextThumbnailRenderer *)self contextSize];
  double v16 = v15;
  [(QLTextThumbnailRenderer *)self paperSize];
  CGFloat v18 = v16 / v17;
  [(QLTextThumbnailRenderer *)self contextSize];
  double v20 = v19;
  [(QLTextThumbnailRenderer *)self paperSize];
  CGContextScaleCTM(CurrentContext, v18, v20 / v21);
  id v22 = [(QLTextThumbnailRenderer *)self attributedString];
  objc_msgSend(v22, "drawInRect:", v9, v9, v11, v12);
}

- (CGSize)contextSize
{
  double width = self->_contextSize.width;
  double height = self->_contextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContextSize:(CGSize)a3
{
  self->_contextSize = a3;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (CGSize)paperSize
{
  double width = self->_paperSize.width;
  double height = self->_paperSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPaperSize:(CGSize)a3
{
  self->_paperSize = a3;
}

- (void).cxx_destruct
{
}

@end