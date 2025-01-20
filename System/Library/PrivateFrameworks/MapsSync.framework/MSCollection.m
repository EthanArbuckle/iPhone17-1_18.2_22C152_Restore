@interface MSCollection
+ (Class)managedClass;
- (MSCollection)initWithCollectionDescription:(id)a3 image:(id)a4 imageUrl:(id)a5 positionIndex:(int64_t)a6 title:(id)a7;
- (MSCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCollection)initWithStore:(id)a3 collectionDescription:(id)a4 image:(id)a5 imageUrl:(id)a6 positionIndex:(int64_t)a7 title:(id)a8;
- (NSData)image;
- (NSString)collectionDescription;
- (NSString)imageUrl;
- (NSString)title;
- (id)fetchPlaces;
- (int)placesCount;
- (int64_t)positionIndex;
- (void)addPlace:(id)a3;
- (void)beforeDeleteWithManaged:(id)a3;
- (void)flushChanges;
- (void)removePlace:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setTitle:(id)a3;
@end

@implementation MSCollection

- (void)beforeDeleteWithManaged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F94844(v4);
}

- (MSCollection)initWithCollectionDescription:(id)a3 image:(id)a4 imageUrl:(id)a5 positionIndex:(int64_t)a6 title:(id)a7
{
  v9 = a4;
  if (a3)
  {
    uint64_t v10 = sub_1A709D438();
    uint64_t v12 = v11;
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    if (a4)
    {
LABEL_3:
      id v13 = v9;
      id v14 = a5;
      id v15 = a7;
      v9 = (void *)sub_1A709D198();
      unint64_t v17 = v16;

      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v18 = 0;
      uint64_t v20 = 0;
      if (a7) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v21 = 0;
      uint64_t v23 = 0;
      return (MSCollection *)Collection.init(collectionDescription:image:imageUrl:positionIndex:title:)(v10, v12, (uint64_t)v9, v17, v18, v20, a6, v21, v23);
    }
  }
  id v24 = a5;
  id v25 = a7;
  unint64_t v17 = 0xF000000000000000;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v18 = sub_1A709D438();
  uint64_t v20 = v19;

  if (!a7) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v21 = sub_1A709D438();
  uint64_t v23 = v22;

  return (MSCollection *)Collection.init(collectionDescription:image:imageUrl:positionIndex:title:)(v10, v12, (uint64_t)v9, v17, v18, v20, a6, v21, v23);
}

- (MSCollection)initWithStore:(id)a3 collectionDescription:(id)a4 image:(id)a5 imageUrl:(id)a6 positionIndex:(int64_t)a7 title:(id)a8
{
  if (a4)
  {
    uint64_t v12 = sub_1A709D438();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  id v15 = a3;
  if (a5)
  {
    id v16 = a5;
    id v17 = a6;
    id v18 = a8;
    uint64_t v19 = sub_1A709D198();
    unint64_t v21 = v20;

    if (a6) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    if (a8) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    goto LABEL_11;
  }
  id v28 = a6;
  id v29 = a8;
  uint64_t v19 = 0;
  unint64_t v21 = 0xF000000000000000;
  if (!a6) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v22 = sub_1A709D438();
  uint64_t v24 = v23;

  if (!a8) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v25 = sub_1A709D438();
  uint64_t v27 = v26;

LABEL_11:
  v30 = sub_1A702EC70(v15, v12, v14, v19, v21, v22, v24, a7, v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSCollection *)v30;
}

- (void)flushChanges
{
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  void *v3 = MEMORY[0x1E4FBC860];
  v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCollection__placeChanges);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A702BEAC(v6, a4);
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A702CD48(self, (uint64_t)a2, (void (*)(void))sub_1A702C194);
}

- (void)setCollectionDescription:(id)a3
{
}

- (NSData)image
{
  v2 = self;
  uint64_t v3 = sub_1A702C604();
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

- (void)setImage:(id)a3
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
  sub_1A702F1D4((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A702CD48(self, (uint64_t)a2, (void (*)(void))sub_1A702CDC8);
}

- (void)setImageUrl:(id)a3
{
}

- (int)placesCount
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollection__placesCount);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A702D390(a3);
}

- (NSString)title
{
  return (NSString *)sub_1A702CD48(self, (uint64_t)a2, (void (*)(void))sub_1A702D654);
}

- (void)setTitle:(id)a3
{
}

- (id)fetchPlaces
{
  v2 = self;
  sub_1A702DD7C();

  type metadata accessor for CollectionItem();
  uint64_t v3 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addPlace:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A702E5A8(v4, 0, (uint64_t)sub_1A702E460, 0);
}

- (void)removePlace:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A702E5A8(v4, 1, (uint64_t)sub_1A702E514, 0);
}

- (MSCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__collectionDescription);
  void *v8 = 0;
  v8[1] = 0;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__image) = xmmword_1A70A4EA0;
  v9 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__imageUrl);
  void *v9 = 0;
  v9[1] = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__placesCount) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__positionIndex) = 0;
  uint64_t v10 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__title);
  *uint64_t v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__placeChanges) = (Class)MEMORY[0x1E4FBC860];
  id v11 = a3;
  return (MSCollection *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollection__image), *(void *)&self->super._store[OBJC_IVAR___MSCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end