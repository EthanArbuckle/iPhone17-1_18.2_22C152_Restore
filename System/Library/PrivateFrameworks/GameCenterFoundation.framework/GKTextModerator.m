@interface GKTextModerator
+ (BOOL)isAvailable;
+ (BOOL)isAvailableForLocale:(id)a3;
+ (GKTextModerator)defaultTextModerator;
+ (GKTextModerator)localeAgnosticTextModerator;
+ (id)forLocale:(id)a3;
- (BOOL)shouldFilter:(id)a3;
- (GKTextModerator)init;
- (NSLocale)locale;
@end

@implementation GKTextModerator

- (GKTextModerator)init
{
  return (GKTextModerator *)sub_1C2E11B84();
}

- (NSLocale)locale
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA338958);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  GKTextModerator.locale.getter();

  uint64_t v7 = sub_1C2E91BD8();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1C2E91B78();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return (NSLocale *)v8;
}

- (BOOL)shouldFilter:(id)a3
{
  uint64_t v4 = sub_1C2E922F8();
  v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = GKTextModerator.shouldFilter(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

+ (GKTextModerator)localeAgnosticTextModerator
{
  id v2 = static GKTextModerator.localeAgnostic.getter();

  return (GKTextModerator *)v2;
}

+ (GKTextModerator)defaultTextModerator
{
  id v2 = static GKTextModerator.default.getter();

  return (GKTextModerator *)v2;
}

+ (BOOL)isAvailable
{
  return static GKTextModerator.isAvailable()() & 1;
}

+ (BOOL)isAvailableForLocale:(id)a3
{
  uint64_t v3 = sub_1C2E91BD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2E91B88();
  char v7 = static GKTextModerator.isAvailable(locale:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (id)forLocale:(id)a3
{
  uint64_t v3 = sub_1C2E91BD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2E91B88();
  char v7 = (void *)static GKTextModerator.for (locale:)((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v7;
}

- (void).cxx_destruct
{
}

@end