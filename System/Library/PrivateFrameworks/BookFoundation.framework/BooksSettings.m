@interface BooksSettings
+ (id)shared;
- (BOOL)menuOnLeft;
- (BooksSettings)init;
- (NSString)filterBrightImagesKey;
- (void)setMenuOnLeft:(BOOL)a3;
@end

@implementation BooksSettings

+ (id)shared
{
  return sub_2289D3AA0((uint64_t)a1, (uint64_t)a2, &qword_268283EB0, (void **)&qword_268284EB0);
}

- (BOOL)menuOnLeft
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___BooksSettings_defaults), sel_BKMenuOnLeft);
}

- (void)setMenuOnLeft:(BOOL)a3
{
}

- (NSString)filterBrightImagesKey
{
  v2 = (void *)sub_2289DEB90();

  return (NSString *)v2;
}

- (BooksSettings)init
{
  uint64_t v2 = OBJC_IVAR___BooksSettings_defaults;
  uint64_t v3 = qword_268283EB8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_268284EB8;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_268284EB8;
  id v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)BooksSettings;
  return [(BooksSettings *)&v8 init];
}

- (void).cxx_destruct
{
}

@end