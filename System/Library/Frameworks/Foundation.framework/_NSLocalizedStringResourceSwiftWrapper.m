@interface _NSLocalizedStringResourceSwiftWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (NSString)defaultValue;
- (NSString)description;
- (NSString)key;
- (NSString)table;
- (NSURL)bundleURL;
- (_NSLocalizedStringResourceSwiftWrapper)init;
- (_NSLocalizedStringResourceSwiftWrapper)initWithCoder:(id)a3;
- (_NSLocalizedStringResourceSwiftWrapper)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7;
- (id)copyWithZone:(void *)a3;
- (id)localize;
- (id)localizeWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation _NSLocalizedStringResourceSwiftWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _NSLocalizedStringResourceSwiftWrapper.encode(with:)((NSCoder)v4);
}

- (id)localize
{
  v2 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  uint64_t v4 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  uint64_t v6 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  uint64_t v5 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  uint64_t v8 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  uint64_t v7 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  uint64_t v9 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  v11 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  uint64_t v10 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  uint64_t v12 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  *(void *)&long long v21 = v3;
  *((void *)&v21 + 1) = v4;
  uint64_t v22 = v6;
  uint64_t v23 = v5;
  uint64_t v24 = v8;
  uint64_t v25 = v7;
  uint64_t v26 = v9;
  long long v27 = *(_OWORD *)(v2 + 56);
  v28 = v11;
  uint64_t v29 = v10;
  long long v30 = *(_OWORD *)(v2 + 88);
  uint64_t v31 = v12;
  long long v16 = 0uLL;
  __int16 v17 = 256;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  char v20 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v13 = v11;
  swift_retain();
  swift_retain();
  specialized String.init(localized:options:)(&v21, &v16);
  v14 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)localizeWithOptions:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  uint64_t v7 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  uint64_t v9 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  uint64_t v8 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  uint64_t v11 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  uint64_t v10 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  uint64_t v12 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  v14 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  uint64_t v13 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  uint64_t v15 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  *(void *)&long long v31 = v6;
  *((void *)&v31 + 1) = v7;
  uint64_t v32 = v9;
  uint64_t v33 = v8;
  uint64_t v34 = v11;
  uint64_t v35 = v10;
  long long v37 = *(_OWORD *)(v5 + 56);
  uint64_t v36 = v12;
  v38 = v14;
  uint64_t v39 = v13;
  long long v40 = *(_OWORD *)(v5 + 88);
  uint64_t v41 = v15;
  swift_bridgeObjectRetain();
  id v16 = a3;
  __int16 v17 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v18 = v14;
  swift_retain();
  swift_retain();
  String.LocalizationOptions.init(nsOptions:)(v16, (uint64_t)&v26);
  long long v21 = v26;
  char v22 = v27;
  char v23 = v28;
  long long v24 = v29;
  char v25 = v30;
  specialized String.init(localized:options:)(&v31, &v21);

  uint64_t v19 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return v19;
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_retainAutoreleaseReturnValue(*(id *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped
                                                                        + 64]);
}

- (NSString)key
{
  v2 = (void *)String._bridgeToObjectiveCImpl()();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  uint64_t v6 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  uint64_t v8 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  uint64_t v9 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  uint64_t v19 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  uint64_t v20 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  uint64_t v10 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  uint64_t v11 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  uint64_t v12 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  uint64_t v13 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 80];
  uint64_t v21 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 88];
  uint64_t v14 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  long long v22 = *(_OWORD *)(v5 + 56);
  uint64_t v15 = (char *)objc_allocWithZone(ObjectType);
  id v16 = &v15[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  *(void *)id v16 = v7;
  *((void *)v16 + 1) = v6;
  *((void *)v16 + 2) = v8;
  *((void *)v16 + 3) = v20;
  *((void *)v16 + 4) = v9;
  *((void *)v16 + 5) = v19;
  *((void *)v16 + 6) = v10;
  *(_OWORD *)(v16 + 56) = v22;
  *((void *)v16 + 9) = v11;
  *((void *)v16 + 10) = v12;
  *((void *)v16 + 11) = v13;
  *((void *)v16 + 12) = v21;
  *((void *)v16 + 13) = v14;
  v23.receiver = v15;
  v23.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v17 = v11;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return [(_NSLocalizedStringResourceSwiftWrapper *)&v23 init];
}

- (_NSLocalizedStringResourceSwiftWrapper)initWithCoder:(id)a3
{
  return (_NSLocalizedStringResourceSwiftWrapper *)_NSLocalizedStringResourceSwiftWrapper.init(coder:)(a3);
}

- (NSString)defaultValue
{
  v2 = (void *)String._bridgeToObjectiveCImpl()();

  return (NSString *)v2;
}

- (NSString)table
{
  if (*(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40]) {
    v2 = (void *)String._bridgeToObjectiveCImpl()();
  }
  else {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setLocale:(id)a3
{
  type metadata accessor for _NSSwiftLocale();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + OBJC_IVAR____NSSwiftLocale_locale);
    uint64_t v7 = *(void *)(v5 + OBJC_IVAR____NSSwiftLocale_locale + 8);
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _LocaleBridged();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a3;
    uint64_t v7 = lazy protocol witness table accessor for type String.LocalizationValue.FormatArgument.CodableStorage and conformance String.LocalizationValue.FormatArgument.CodableStorage((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (void (*)(uint64_t))type metadata accessor for _LocaleBridged);
    id v8 = a3;
  }
  uint64_t v9 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  *((void *)v9 + 7) = v6;
  *((void *)v9 + 8) = v7;

  swift_unknownObjectRelease();
}

- (_NSLocalizedStringResourceSwiftWrapper)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7
{
  id v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v13 = v12;
  if (a4)
  {
    id v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v16 = v15;
    if (a5)
    {
LABEL_3:
      a5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
      uint64_t v18 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
LABEL_6:
  type metadata accessor for _NSSwiftLocale();
  uint64_t v19 = swift_dynamicCastClass();
  if (v19)
  {
    uint64_t v21 = *(void *)(v19 + OBJC_IVAR____NSSwiftLocale_locale);
    uint64_t v20 = *(void *)(v19 + OBJC_IVAR____NSSwiftLocale_locale + 8);
    id v22 = a7;
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _LocaleBridged();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a6;
    uint64_t v20 = lazy protocol witness table accessor for type String.LocalizationValue.FormatArgument.CodableStorage and conformance String.LocalizationValue.FormatArgument.CodableStorage((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (void (*)(uint64_t))type metadata accessor for _LocaleBridged);
    id v23 = a6;
    id v24 = a7;
  }
  *(void *)&long long v27 = v21;
  *((void *)&v27 + 1) = v20;
  URL.init(reference:)(a7, &v26);

  return (_NSLocalizedStringResourceSwiftWrapper *)_NSLocalizedStringResourceSwiftWrapper.init(key:defaultValue:table:locale:bundleURL:)((uint64_t)v11, v13, (uint64_t)v14, v16, (uint64_t)a5, v18, &v27, &v26);
}

- (NSLocale)locale
{
  uint64_t v2 = *(void *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 56];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 488);
  swift_unknownObjectRetain();
  uint64_t v5 = (void *)v4(ObjectType, v2);
  swift_unknownObjectRelease();

  return (NSLocale *)v5;
}

- (NSString)description
{
  uint64_t v2 = self;
  _StringGuts.grow(_:)(51);
  v3._object = (void *)0x80000001823B0950;
  v3._countAndFlagsBits = 0xD000000000000030;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);

  uint64_t v5 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    Swift::String v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = _NSLocalizedStringResourceSwiftWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, (uint64_t *)&demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_NSLocalizedStringResourceSwiftWrapper)init
{
  result = (_NSLocalizedStringResourceSwiftWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end