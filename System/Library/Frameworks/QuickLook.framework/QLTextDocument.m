@interface QLTextDocument
- (BOOL)hasRichContent;
- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5;
- (NSAttributedString)attributedTextContent;
- (NSString)textContent;
- (_TtC9QuickLook14QLTextDocument)initWithFileURL:(id)a3;
- (id)contentsForType:(id)a3 error:(id *)a4;
- (void)saveWithTextContent:(id)a3;
@end

@implementation QLTextDocument

- (BOOL)hasRichContent
{
  return (*((unsigned __int8 *)&self->super._activityContinuationLock
          + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content) != 255) & *((unsigned char *)&self->super._activityContinuationLock
                                                                          + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
}

- (NSString)textContent
{
  v2 = self;
  sub_218010AD4();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_2180385F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSAttributedString)attributedTextContent
{
  v2 = self;
  id v3 = sub_218010C30();

  return (NSAttributedString *)v3;
}

- (void)saveWithTextContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_218010CFC(v4);
}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  sub_218038624();
  v5 = self;
  sub_218010EA0((uint64_t)v8);
  swift_bridgeObjectRelease();

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  v6 = (void *)sub_218038BA4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v6;
}

- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = a4;
  sub_2180389F4();
  swift_unknownObjectRelease();
  if (v8)
  {
    uint64_t v9 = sub_218038624();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_218011858((uint64_t)v13, v9, v11);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC9QuickLook14QLTextDocument)initWithFileURL:(id)a3
{
  uint64_t v4 = sub_218037D74();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218037D54();
  id v8 = (char *)self + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  v8[16] = -1;
  uint64_t v9 = (void *)sub_218037D34();
  uint64_t v10 = (objc_class *)type metadata accessor for QLTextDocument();
  v13.receiver = self;
  v13.super_class = v10;
  uint64_t v11 = [(UIDocument *)&v13 initWithFileURL:v9];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (void).cxx_destruct
{
}

@end