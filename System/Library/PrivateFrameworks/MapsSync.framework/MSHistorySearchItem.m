@interface MSHistorySearchItem
+ (Class)managedClass;
- (MSHistorySearchItem)initWithGeoMapRegion:(id)a3 language:(id)a4 locationDisplay:(id)a5 query:(id)a6;
- (MSHistorySearchItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistorySearchItem)initWithStore:(id)a3 geoMapRegion:(id)a4 language:(id)a5 locationDisplay:(id)a6 query:(id)a7;
- (NSData)geoMapRegion;
- (NSString)language;
- (NSString)locationDisplay;
- (NSString)query;
- (void)setGeoMapRegion:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocationDisplay:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setQuery:(id)a3;
@end

@implementation MSHistorySearchItem

- (MSHistorySearchItem)initWithGeoMapRegion:(id)a3 language:(id)a4 locationDisplay:(id)a5 query:(id)a6
{
  v9 = a3;
  if (a3)
  {
    id v10 = a4;
    id v11 = a5;
    id v12 = a6;
    id v13 = v9;
    v9 = (void *)sub_1A709D198();
    unint64_t v15 = v14;

    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v25 = a4;
    id v26 = a5;
    id v27 = a6;
    unint64_t v15 = 0xF000000000000000;
    if (a4)
    {
LABEL_3:
      uint64_t v16 = sub_1A709D438();
      uint64_t v18 = v17;

      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v19 = 0;
      uint64_t v21 = 0;
      if (a6) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v22 = 0;
      uint64_t v24 = 0;
      return (MSHistorySearchItem *)HistorySearchItem.init(geoMapRegion:language:locationDisplay:query:)((uint64_t)v9, v15, v16, v18, v19, v21, v22, v24);
    }
  }
  uint64_t v16 = 0;
  uint64_t v18 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v19 = sub_1A709D438();
  uint64_t v21 = v20;

  if (!a6) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v22 = sub_1A709D438();
  uint64_t v24 = v23;

  return (MSHistorySearchItem *)HistorySearchItem.init(geoMapRegion:language:locationDisplay:query:)((uint64_t)v9, v15, v16, v18, v19, v21, v22, v24);
}

- (MSHistorySearchItem)initWithStore:(id)a3 geoMapRegion:(id)a4 language:(id)a5 locationDisplay:(id)a6 query:(id)a7
{
  id v10 = a4;
  if (a4)
  {
    id v12 = a3;
    id v13 = a5;
    id v14 = a6;
    id v15 = a7;
    id v16 = v10;
    id v10 = (void *)sub_1A709D198();
    unint64_t v18 = v17;

    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v28 = a3;
    id v29 = a5;
    id v30 = a6;
    id v31 = a7;
    unint64_t v18 = 0xF000000000000000;
    if (a5)
    {
LABEL_3:
      uint64_t v19 = sub_1A709D438();
      uint64_t v21 = v20;

      if (a6) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v22 = 0;
      uint64_t v24 = 0;
      if (a7) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v25 = 0;
      uint64_t v27 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v19 = 0;
  uint64_t v21 = 0;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v22 = sub_1A709D438();
  uint64_t v24 = v23;

  if (!a7) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v25 = sub_1A709D438();
  uint64_t v27 = v26;

LABEL_10:
  v32 = sub_1A6F79650(a3, (uint64_t)v10, v18, v19, v21, v22, v24, v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSHistorySearchItem *)v32;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistorySearchItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6F7795C(v6, a4);
}

- (NSData)geoMapRegion
{
  v2 = self;
  uint64_t v3 = sub_1A6F77CDC();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setGeoMapRegion:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    uint64_t v3 = (void *)sub_1A709D198();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F7999C((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (NSString)language
{
  return (NSString *)sub_1A6F78824(self, (uint64_t)a2, (void (*)(void))sub_1A6F78420);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)locationDisplay
{
  return (NSString *)sub_1A6F78824(self, (uint64_t)a2, (void (*)(void))sub_1A6F788A4);
}

- (void)setLocationDisplay:(id)a3
{
}

- (NSString)query
{
  return (NSString *)sub_1A6F78824(self, (uint64_t)a2, (void (*)(void))sub_1A6F78CA8);
}

- (void)setQuery:(id)a3
{
}

- (MSHistorySearchItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__geoMapRegion) = xmmword_1A70A4EA0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__language);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__locationDisplay);
  void *v9 = 0;
  v9[1] = 0;
  id v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__query);
  *id v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v11 = a3;
  return (MSHistorySearchItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistorySearchItem__geoMapRegion), *(void *)&self->super.super._store[OBJC_IVAR___MSHistorySearchItem__geoMapRegion]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end