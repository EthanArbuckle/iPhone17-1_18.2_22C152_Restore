@interface GDBiomeStreamStoreCache
- (GDBiomeStreamStoreCache)init;
- (GDBiomeStreamStoreCache)initWithStreamLookup:(id)a3;
- (id)getLibraryStreamWithIdentifier:(id)a3 error:(id *)a4;
- (void)clearCache;
@end

@implementation GDBiomeStreamStoreCache

- (void)clearCache
{
  v2 = self;
  sub_1C6DF48F8();
}

- (id)getLibraryStreamWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1C6E4C774();

  sub_1C6E30D40(v9, v9[3]);
  v7 = (void *)sub_1C7927580();
  _s24IntelligencePlatformCore19StoredLocationVisitVwxx_0((uint64_t)v9);
  return v7;
}

- (GDBiomeStreamStoreCache)initWithStreamLookup:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (GDBiomeStreamStoreCache *)sub_1C6F4B510((uint64_t)sub_1C6DF4BF0, v4);
}

- (GDBiomeStreamStoreCache)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end