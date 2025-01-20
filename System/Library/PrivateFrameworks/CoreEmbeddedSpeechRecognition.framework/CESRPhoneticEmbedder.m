@interface CESRPhoneticEmbedder
- (CESRPhoneticEmbedder)init;
- (CESRPhoneticEmbedder)initWithLocaleIdentifier:(id)a3 clientID:(id)a4;
- (void)findAlternativesForString:(NSString *)a3 maxResults:(int64_t)a4 completion:(id)a5;
@end

@implementation CESRPhoneticEmbedder

- (void).cxx_destruct
{
}

- (CESRPhoneticEmbedder)initWithLocaleIdentifier:(id)a3 clientID:(id)a4
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = a4;
  uint64_t v10 = sub_1B8E11718();
  uint64_t v11 = v6;
  uint64_t v7 = sub_1B8E11718();
  v14 = (CESRPhoneticEmbedder *)CESRPhoneticEmbedder.init(localeIdentifier:clientID:)(v10, v11, v7, v8);

  return v14;
}

- (void)findAlternativesForString:(NSString *)a3 maxResults:(int64_t)a4 completion:(id)a5
{
  swift_getObjectType();
  id v5 = a3;
  uint64_t v11 = _Block_copy(a5);
  uint64_t v6 = self;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = v11;
  v7[5] = self;
  sub_1B8DC1514((uint64_t)&unk_1E9EF0E78, (uint64_t)v7);
}

- (CESRPhoneticEmbedder)init
{
  return (CESRPhoneticEmbedder *)CESRPhoneticEmbedder.init()();
}

@end