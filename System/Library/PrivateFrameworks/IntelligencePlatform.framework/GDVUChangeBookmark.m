@interface GDVUChangeBookmark
+ (BOOL)supportsSecureCoding;
+ (id)decodeFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (GDVUChangeBookmark)init;
- (id)encodeToDataAndReturnError:(id *)a3;
- (int64_t)hash;
@end

@implementation GDVUChangeBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDataAndReturnError:(id *)a3
{
  v3 = self;
  uint64_t v4 = GDVUChangeBookmark.encodeToData()();
  unint64_t v6 = v5;

  v7 = (void *)sub_1B2E80568();
  sub_1B29C34DC(v4, v6);

  return v7;
}

+ (id)decodeFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_1B2E80588();
  unint64_t v7 = v6;

  v8 = (void *)static GDVUChangeBookmark.decode(from:)();
  sub_1B29C34DC(v5, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B2E2E598(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))GDVUChangeBookmark.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  v3 = GDVUChangeBookmark.hash.getter();

  return (int64_t)v3;
}

- (GDVUChangeBookmark)init
{
}

- (void).cxx_destruct
{
}

@end