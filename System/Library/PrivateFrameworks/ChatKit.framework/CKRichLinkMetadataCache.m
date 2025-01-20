@interface CKRichLinkMetadataCache
- (_TtC7ChatKit23CKRichLinkMetadataCache)init;
@end

@implementation CKRichLinkMetadataCache

- (_TtC7ChatKit23CKRichLinkMetadataCache)init
{
  uint64_t v3 = OBJC_IVAR____TtC7ChatKit23CKRichLinkMetadataCache_metadataCache;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F1C998]);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setCountLimit_, 10);
  *(Class *)((char *)&self->super.isa + v3) = (Class)v6;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CKRichLinkMetadataCache();
  return [(CKRichLinkMetadataCache *)&v8 init];
}

- (void).cxx_destruct
{
}

@end