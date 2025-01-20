@interface MSUserRoute
+ (Class)managedClass;
- (MSUserRoute)initWithAddressObject:(id)a3 customName:(id)a4 customNote:(id)a5 eastLongitude:(id)a6 hikeType:(int64_t)a7 length:(id)a8 northLatitude:(id)a9 originLatitude:(id)a10 originLongitude:(id)a11 positionIndex:(int64_t)a12 routeGeometry:(id)a13 southLatitude:(id)a14 totalAscent:(id)a15 totalDescent:(id)a16 tourIdentifier:(int64_t)a17 transportType:(id)a18 westLongitude:(id)a19;
- (MSUserRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSUserRoute)initWithStore:(id)a3 addressObject:(id)a4 customName:(id)a5 customNote:(id)a6 eastLongitude:(id)a7 hikeType:(int64_t)a8 length:(id)a9 northLatitude:(id)a10 originLatitude:(id)a11 originLongitude:(id)a12 positionIndex:(int64_t)a13 routeGeometry:(id)a14 southLatitude:(id)a15 totalAscent:(id)a16 totalDescent:(id)a17 tourIdentifier:(int64_t)a18 transportType:(id)a19 westLongitude:(id)a20;
- (NSData)addressObject;
- (NSData)routeGeometry;
- (NSNumber)eastLongitude;
- (NSNumber)length;
- (NSNumber)northLatitude;
- (NSNumber)originLatitude;
- (NSNumber)originLongitude;
- (NSNumber)southLatitude;
- (NSNumber)totalAscent;
- (NSNumber)totalDescent;
- (NSNumber)transportType;
- (NSNumber)westLongitude;
- (NSString)customName;
- (NSString)customNote;
- (int64_t)hikeType;
- (int64_t)positionIndex;
- (int64_t)tourIdentifier;
- (void)setAddressObject:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setCustomNote:(id)a3;
- (void)setEastLongitude:(id)a3;
- (void)setHikeType:(int64_t)a3;
- (void)setLength:(id)a3;
- (void)setNorthLatitude:(id)a3;
- (void)setOriginLatitude:(id)a3;
- (void)setOriginLongitude:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRouteGeometry:(id)a3;
- (void)setSouthLatitude:(id)a3;
- (void)setTotalAscent:(id)a3;
- (void)setTotalDescent:(id)a3;
- (void)setTourIdentifier:(int64_t)a3;
- (void)setTransportType:(id)a3;
- (void)setWestLongitude:(id)a3;
@end

@implementation MSUserRoute

- (MSUserRoute)initWithAddressObject:(id)a3 customName:(id)a4 customNote:(id)a5 eastLongitude:(id)a6 hikeType:(int64_t)a7 length:(id)a8 northLatitude:(id)a9 originLatitude:(id)a10 originLongitude:(id)a11 positionIndex:(int64_t)a12 routeGeometry:(id)a13 southLatitude:(id)a14 totalAscent:(id)a15 totalDescent:(id)a16 tourIdentifier:(int64_t)a17 transportType:(id)a18 westLongitude:(id)a19
{
  if (a3)
  {
    id v24 = a4;
    id v25 = a5;
    id v26 = a6;
    id v27 = a8;
    id v28 = a9;
    id v29 = a10;
    id v30 = a11;
    id v31 = a13;
    id v32 = a14;
    id v33 = a14;
    id v34 = a15;
    id v35 = a15;
    id v36 = a16;
    id v37 = a18;
    id v38 = a18;
    id v39 = a19;
    id v40 = a3;
    uint64_t v41 = sub_1A709D198();
    unint64_t v65 = v42;
    uint64_t v66 = v41;

    id v43 = a19;
    id v72 = a11;
    if (a4)
    {
LABEL_3:
      uint64_t v44 = sub_1A709D438();
      uint64_t v69 = v45;
      uint64_t v70 = v44;

      goto LABEL_6;
    }
  }
  else
  {
    id v46 = a4;
    id v47 = a5;
    id v48 = a6;
    id v49 = a8;
    id v50 = a9;
    id v51 = a10;
    id v52 = a11;
    id v53 = a13;
    id v32 = a14;
    id v54 = a14;
    id v34 = a15;
    id v55 = a15;
    id v56 = a16;
    id v37 = a18;
    id v57 = a18;
    id v43 = a19;
    id v58 = a19;
    unint64_t v65 = 0xF000000000000000;
    uint64_t v66 = 0;
    id v72 = a11;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v69 = 0;
  uint64_t v70 = 0;
LABEL_6:
  if (a5)
  {
    uint64_t v68 = sub_1A709D438();
    uint64_t v60 = v59;
  }
  else
  {
    uint64_t v68 = 0;
    uint64_t v60 = 0;
  }
  if (a13)
  {
    uint64_t v61 = sub_1A709D198();
    unint64_t v63 = v62;
  }
  else
  {
    uint64_t v61 = 0;
    unint64_t v63 = 0xF000000000000000;
  }
  return (MSUserRoute *)UserRoute.init(addressObject:customName:customNote:eastLongitude:hikeType:length:northLatitude:originLatitude:originLongitude:positionIndex:routeGeometry:southLatitude:totalAscent:totalDescent:tourIdentifier:transportType:westLongitude:)(v66, v65, v70, v69, v68, v60, a6, a7, a8, a9, a10, v72, a12, v61, v63, v32, v34, a16, a17,
                          v37,
                          v43);
}

- (MSUserRoute)initWithStore:(id)a3 addressObject:(id)a4 customName:(id)a5 customNote:(id)a6 eastLongitude:(id)a7 hikeType:(int64_t)a8 length:(id)a9 northLatitude:(id)a10 originLatitude:(id)a11 originLongitude:(id)a12 positionIndex:(int64_t)a13 routeGeometry:(id)a14 southLatitude:(id)a15 totalAscent:(id)a16 totalDescent:(id)a17 tourIdentifier:(int64_t)a18 transportType:(id)a19 westLongitude:(id)a20
{
  if (a4)
  {
    id v24 = a3;
    id v25 = a5;
    id v26 = a6;
    id v27 = a7;
    id v28 = a9;
    id v29 = a10;
    id v30 = a11;
    id v31 = a12;
    id v32 = a12;
    id v33 = a14;
    id v34 = a15;
    id v35 = a16;
    id v36 = a17;
    id v37 = a19;
    id v38 = a19;
    id v39 = a20;
    id v40 = a20;
    id v41 = a4;
    uint64_t v42 = sub_1A709D198();
    unint64_t v68 = v43;
    uint64_t v69 = v42;

    if (a5)
    {
LABEL_3:
      uint64_t v70 = sub_1A709D438();
      uint64_t v45 = v44;

      goto LABEL_6;
    }
  }
  else
  {
    id v46 = a3;
    id v47 = a5;
    id v48 = a6;
    id v49 = a7;
    id v50 = a9;
    id v51 = a10;
    id v52 = a11;
    id v31 = a12;
    id v53 = a12;
    id v54 = a14;
    id v55 = a15;
    id v56 = a16;
    id v57 = a17;
    id v37 = a19;
    id v58 = a19;
    id v39 = a20;
    id v59 = a20;
    unint64_t v68 = 0xF000000000000000;
    uint64_t v69 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v70 = 0;
  uint64_t v45 = 0;
LABEL_6:
  if (a6)
  {
    uint64_t v67 = sub_1A709D438();
    uint64_t v61 = v60;
  }
  else
  {
    uint64_t v67 = 0;
    uint64_t v61 = 0;
  }
  if (a14)
  {
    uint64_t v62 = sub_1A709D198();
    unint64_t v64 = v63;
  }
  else
  {
    uint64_t v62 = 0;
    unint64_t v64 = 0xF000000000000000;
  }
  unint64_t v65 = sub_1A6EF6B74(a3, v69, v68, v70, v45, v67, v61, a7, a8, a9, a10, a11, v31, a13, v62, v64, a15, a16, a17,
          a18,
          v37,
          v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (MSUserRoute *)v65;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedUserRoute();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6EF1398(v6, a4);
}

- (NSData)addressObject
{
  return (NSData *)sub_1A6EF4434(self, (uint64_t)a2, sub_1A6EF1928);
}

- (void)setAddressObject:(id)a3
{
}

- (NSString)customName
{
  return (NSString *)sub_1A6EF2154(self, (uint64_t)a2, (void (*)(void))sub_1A6EF1D50);
}

- (void)setCustomName:(id)a3
{
}

- (NSString)customNote
{
  return (NSString *)sub_1A6EF2154(self, (uint64_t)a2, (void (*)(void))sub_1A6EF21D4);
}

- (void)setCustomNote:(id)a3
{
}

- (NSNumber)eastLongitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF2940();

  return (NSNumber *)v3;
}

- (void)setEastLongitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF7394(a3);
}

- (int64_t)hikeType
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__hikeType);
}

- (void)setHikeType:(int64_t)a3
{
  v4 = self;
  sub_1A6EF2DC0(a3);
}

- (NSNumber)length
{
  v2 = self;
  v3 = (void *)sub_1A6EF304C();

  return (NSNumber *)v3;
}

- (void)setLength:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF75B4(a3);
}

- (NSNumber)northLatitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF34A4();

  return (NSNumber *)v3;
}

- (void)setNorthLatitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF77A0(a3);
}

- (NSNumber)originLatitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF38FC();

  return (NSNumber *)v3;
}

- (void)setOriginLatitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF798C(a3);
}

- (NSNumber)originLongitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF3D54();

  return (NSNumber *)v3;
}

- (void)setOriginLongitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF7B78(a3);
}

- (int64_t)positionIndex
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__positionIndex);
}

- (void)setPositionIndex:(int64_t)a3
{
  v4 = self;
  sub_1A6EF41D4(a3);
}

- (NSData)routeGeometry
{
  return (NSData *)sub_1A6EF4434(self, (uint64_t)a2, sub_1A6EF44C0);
}

- (void)setRouteGeometry:(id)a3
{
}

- (NSNumber)southLatitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF4C94();

  return (NSNumber *)v3;
}

- (void)setSouthLatitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF7FA4(a3);
}

- (NSNumber)totalAscent
{
  v2 = self;
  v3 = (void *)sub_1A6EF50EC();

  return (NSNumber *)v3;
}

- (void)setTotalAscent:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF8190(a3);
}

- (NSNumber)totalDescent
{
  v2 = self;
  v3 = (void *)sub_1A6EF5544();

  return (NSNumber *)v3;
}

- (void)setTotalDescent:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF837C(a3);
}

- (int64_t)tourIdentifier
{
  return sub_1A6EF5964((char *)self, (uint64_t)a2, &OBJC_IVAR___MSUserRoute__tourIdentifier);
}

- (void)setTourIdentifier:(int64_t)a3
{
  v4 = self;
  sub_1A6EF5A90(a3);
}

- (NSNumber)transportType
{
  v2 = self;
  v3 = (void *)sub_1A6EF5D8C();

  return (NSNumber *)v3;
}

- (void)setTransportType:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF85D4(a3);
}

- (NSNumber)westLongitude
{
  v2 = self;
  v3 = (void *)sub_1A6EF61E4();

  return (NSNumber *)v3;
}

- (void)setWestLongitude:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6EF87C0(a3);
}

- (MSUserRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSUserRoute *)sub_1A6EF67D8(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSUserRoute__addressObject), *(void *)&self->super._store[OBJC_IVAR___MSUserRoute__addressObject]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSUserRoute__routeGeometry), *(void *)&self->super._store[OBJC_IVAR___MSUserRoute__routeGeometry]);
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSUserRoute__westLongitude);
}

@end