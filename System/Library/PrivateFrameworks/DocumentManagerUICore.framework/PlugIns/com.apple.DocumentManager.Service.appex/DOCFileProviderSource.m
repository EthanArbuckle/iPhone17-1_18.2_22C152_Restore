@interface DOCFileProviderSource
+ (id)createSourceFrom:(id)a3 with:(id)a4;
+ (id)createSpotlightSources;
- (BOOL)appearsInMoveUI;
- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors;
- (BOOL)isAvailableSystemWide;
- (BOOL)isEjectable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpotlightBacked;
- (BOOL)isValidForConfiguration:(id)a3;
- (BOOL)isiCloudBased;
- (FPProviderDomain)providerDomain;
- (NSArray)supportedSearchFilters;
- (NSString)description;
- (NSString)displayName;
- (NSString)domainName;
- (NSString)providerName;
- (UIImage)iconPreferingSymbolImages;
- (_TtC33com_apple_DocumentManager_Service16DOCActionManager)actionManager;
- (_TtC33com_apple_DocumentManager_Service21DOCFileProviderSource)init;
- (_TtC33com_apple_DocumentManager_Service21DOCFileProviderSource)initWithCoder:(id)a3;
- (id)loadIconForSize:(int64_t)a3;
- (unint64_t)status;
- (void)setActionManager:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setIsEjectable:(BOOL)a3;
- (void)setProviderName:(id)a3;
@end

@implementation DOCFileProviderSource

- (BOOL)iconPreferingSymbolImagesRequiresHierarchicalColors
{
  v2 = self;
  char v3 = sub_100101234();

  return v3 & 1;
}

- (UIImage)iconPreferingSymbolImages
{
  v2 = self;
  id v3 = sub_1001013AC();

  return (UIImage *)v3;
}

- (FPProviderDomain)providerDomain
{
  return (FPProviderDomain *)*(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_providerDomain];
}

- (_TtC33com_apple_DocumentManager_Service16DOCActionManager)actionManager
{
  v2 = self;
  id v3 = sub_1003ADA50();

  return (_TtC33com_apple_DocumentManager_Service16DOCActionManager *)v3;
}

- (void)setActionManager:(id)a3
{
  id v4 = *(id *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage___actionManager];
  *(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage___actionManager] = a3;
  id v3 = a3;
}

- (NSString)displayName
{
  return (NSString *)sub_1003B5198(self, (uint64_t)a2, (void (*)(void))_s33com_apple_DocumentManager_Service21DOCFileProviderSourceC11displayNameSSvg_0);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)providerName
{
  return (NSString *)sub_1003B5198(self, (uint64_t)a2, (void (*)(void))_s33com_apple_DocumentManager_Service21DOCFileProviderSourceC12providerNameSSvg_0);
}

- (void)setProviderName:(id)a3
{
}

- (NSString)domainName
{
  v2 = self;
  _s33com_apple_DocumentManager_Service21DOCFileProviderSourceC10domainNameSSSgvg_0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004CD2B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setDomainName:(id)a3
{
}

- (id)loadIconForSize:(int64_t)a3
{
  uint64_t v3 = *(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_providerDomain];
  if (v3) {
    id v4 = [self iconForFileProvider:v3 size:a3];
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)isEjectable
{
  return self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_isEjectable];
}

- (void)setIsEjectable:(BOOL)a3
{
  self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_isEjectable] = a3;
}

- (BOOL)isSpotlightBacked
{
  return self->providerDomain[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_type];
}

- (BOOL)isAvailableSystemWide
{
  if (self->providerDomain[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_type])
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_providerDomain];
    if (v2) {
      LOBYTE(v2) = [v2 isAvailableSystemWide];
    }
    else {
      __break(1u);
    }
  }
  return (char)v2;
}

- (unint64_t)status
{
  int v2 = self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_isProviderDomainEnabled];
  if (v2 == 2) {
    return 2;
  }
  else {
    return (v2 & 1) == 0;
  }
}

- (NSArray)supportedSearchFilters
{
  int v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_providerDomain];
  if (v2)
  {
    uint64_t v3 = self;
    id v4 = [v2 supportedSearchFilters];
    if (v4)
    {
      NSString v5 = v4;
      type metadata accessor for NSFileProviderSearchFilter(0);
      sub_1004CD5C0();

      v6.super.isa = sub_1004CD5A0().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  v6.super.isa = 0;
LABEL_6:
  return (NSArray *)v6.super.isa;
}

- (BOOL)appearsInMoveUI
{
  return (self->providerDomain[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_type] & 1) == 0
      && ([(DOCFileProviderSource *)self status] & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (NSString)description
{
  int v2 = self;
  DOCFileProviderSource.description.getter();

  NSString v3 = sub_1004CD2B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004CEA50();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    NSString v5 = self;
  }
  char v6 = DOCFileProviderSource.isEqual(_:)((uint64_t)v8);

  sub_10003B3B8((uint64_t)v8, &qword_10062CB00);
  return v6 & 1;
}

+ (id)createSpotlightSources
{
  sub_1003B65EC();
  type metadata accessor for DOCFileProviderSource(0);
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return v2.super.isa;
}

+ (id)createSourceFrom:(id)a3 with:(id)a4
{
  uint64_t v5 = sub_1004CD2F0();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = sub_1003B6BE0(v8, v5, v7);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v11 = (void (**)(void *, uint64_t, void *))&v9[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_dropAction];
  uint64_t v12 = *(void *)&v9[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_dropAction];
  *v11 = sub_1003B71A4;
  v11[1] = (void (*)(void *, uint64_t, void *))v10;
  id v13 = v8;
  sub_10003B0A8(v12);

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC33com_apple_DocumentManager_Service21DOCFileProviderSource)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003B6EC8();
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = DOCFileProviderSource.isValid(for:)(v4);

  return self & 1;
}

- (BOOL)isiCloudBased
{
  NSArray v2 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_providerDomain];
  if (v2) {
    LOBYTE(v2) = [v2 isiCloudDriveProvider];
  }
  return (char)v2;
}

- (_TtC33com_apple_DocumentManager_Service21DOCFileProviderSource)init
{
  result = (_TtC33com_apple_DocumentManager_Service21DOCFileProviderSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003B0A8(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_dropAction]);
  sub_1003B7250(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier], *(void *)&self->providerDomain[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage___containingApplicationIdentifier]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1003B7250(*(void *)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage____domainName], *(void *)&self->providerDomain[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource____lazy_storage____domainName]);
  id v3 = &self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_defaultSorting];
  uint64_t v4 = sub_1004CB280();
  uint64_t v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  v5(&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_defaultGroupingMode], v4);
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void **)&self->DOCDocumentSource_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCFileProviderSource_type];
}

@end