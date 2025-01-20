@interface ENNoteContent
+ (id)noteContentWithContentArray:(id)a3;
+ (id)noteContentWithENML:(id)a3;
+ (id)noteContentWithSanitizedHTML:(id)a3;
+ (id)noteContentWithString:(id)a3;
- (ENNoteContent)initWithENML:(id)a3;
- (NSString)emml;
- (id)enml;
- (void)setEmml:(id)a3;
@end

@implementation ENNoteContent

- (void).cxx_destruct
{
}

- (void)setEmml:(id)a3
{
}

- (NSString)emml
{
  return self->_emml;
}

- (id)enml
{
  return [(ENNoteContent *)self enmlWithNote:0];
}

- (ENNoteContent)initWithENML:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENNoteContent;
  v5 = [(ENNoteContent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ENNoteContent *)v5 setEmml:v4];
  }

  return v6;
}

+ (id)noteContentWithENML:(id)a3
{
  id v3 = a3;
  id v4 = [[ENNoteContent alloc] initWithENML:v3];

  return v4;
}

+ (id)noteContentWithSanitizedHTML:(id)a3
{
  id v3 = a3;
  id v4 = [[ENHTMLNoteContent alloc] initWithHTML:v3];

  return v4;
}

+ (id)noteContentWithContentArray:(id)a3
{
  id v3 = a3;
  id v4 = [[ENPlainNoteContent alloc] initWithContents:v3];

  return v4;
}

+ (id)noteContentWithString:(id)a3
{
  id v3 = a3;
  id v4 = [[ENPlainNoteContent alloc] initWithString:v3];

  return v4;
}

@end