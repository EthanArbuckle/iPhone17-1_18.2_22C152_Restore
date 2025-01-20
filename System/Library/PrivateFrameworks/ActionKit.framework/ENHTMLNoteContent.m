@interface ENHTMLNoteContent
- (ENHTMLNoteContent)initWithHTML:(id)a3;
- (NSString)html;
- (id)enmlWithNote:(id)a3;
- (void)setHtml:(id)a3;
@end

@implementation ENHTMLNoteContent

- (void).cxx_destruct
{
}

- (void)setHtml:(id)a3
{
}

- (NSString)html
{
  return self->_html;
}

- (id)enmlWithNote:(id)a3
{
  v4 = objc_alloc_init(ENHTMLtoENMLConverter);
  v5 = [(ENHTMLNoteContent *)self html];
  v6 = [(ENHTMLtoENMLConverter *)v4 enmlFromHTMLContent:v5];

  return v6;
}

- (ENHTMLNoteContent)initWithHTML:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENHTMLNoteContent;
  v5 = [(ENHTMLNoteContent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ENHTMLNoteContent *)v5 setHtml:v4];
  }

  return v6;
}

@end