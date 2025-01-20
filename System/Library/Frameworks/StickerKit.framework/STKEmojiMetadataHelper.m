@interface STKEmojiMetadataHelper
+ (id)metadataDictionaryFromData:(id)a3;
- (STKEmojiMetadataHelper)init;
@end

@implementation STKEmojiMetadataHelper

+ (id)metadataDictionaryFromData:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = sub_2453FCBE8();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  uint64_t v7 = _s10StickerKit19EmojiMetadataHelperC18metadataDictionary8fromDataSDySSypGSg10Foundation0I0VSg_tFZ_0(v3, v6);
  sub_24520E4F4(v3, v6);
  if (v7)
  {
    v8 = (void *)sub_2453FFA58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (STKEmojiMetadataHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiMetadataHelper();
  return [(STKEmojiMetadataHelper *)&v3 init];
}

@end