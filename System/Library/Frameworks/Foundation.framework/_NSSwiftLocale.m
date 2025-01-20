@interface _NSSwiftLocale
+ (BOOL)supportsSecureCoding;
- (BOOL)_doesNotRequireSpecialCaseHandling;
- (BOOL)usesMetricSystem;
- (Class)classForCoder;
- (NSCharacterSet)exemplarCharacterSet;
- (NSString)alternateQuotationBeginDelimiter;
- (NSString)alternateQuotationEndDelimiter;
- (NSString)calendarIdentifier;
- (NSString)collationIdentifier;
- (NSString)collatorIdentifier;
- (NSString)currencyCode;
- (NSString)currencySymbol;
- (NSString)decimalSeparator;
- (NSString)groupingSeparator;
- (NSString)languageCode;
- (NSString)languageIdentifier;
- (NSString)localeIdentifier;
- (NSString)quotationBeginDelimiter;
- (NSString)quotationEndDelimiter;
- (NSString)scriptCode;
- (NSString)variantCode;
- (_NSSwiftLocale)initWithCoder:(id)a3;
- (_NSSwiftLocale)initWithLocaleIdentifier:(id)a3;
- (id)_localeWithNewCalendarIdentifier:(id)a3;
- (id)_numberingSystem;
- (id)_prefForKey:(id)a3;
- (id)displayNameForKey:(id)a3 value:(id)a4;
- (id)localizedStringForCalendarIdentifier:(id)a3;
- (id)localizedStringForCollationIdentifier:(id)a3;
- (id)localizedStringForCollatorIdentifier:(id)a3;
- (id)localizedStringForCountryCode:(id)a3;
- (id)localizedStringForCurrencyCode:(id)a3;
- (id)localizedStringForCurrencySymbol:(id)a3;
- (id)localizedStringForLanguageCode:(id)a3;
- (id)localizedStringForLocaleIdentifier:(id)a3;
- (id)localizedStringForScriptCode:(id)a3;
- (id)localizedStringForVariantCode:(id)a3;
- (id)objectForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSSwiftLocale

- (NSString)localeIdentifier
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);

  swift_unknownObjectRelease();
  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (BOOL)_doesNotRequireSpecialCaseHandling
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____NSSwiftLocale_doesNotRequireSpecialHandling);
  if (v2 == 2)
  {
    uint64_t v4 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 64);
    v7 = self;
    swift_unknownObjectRetain();
    v6(ObjectType, v4);
    swift_unknownObjectRelease();
    char v8 = specialized static Locale.identifierDoesNotRequireSpecialCaseHandling(_:)();

    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = v2 & 1;
  }
  return v8 & 1;
}

- (void).cxx_destruct
{
}

- (id)_prefForKey:(id)a3
{
  void (*v9)(void *__return_ptr, id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void v19[3];
  uint64_t v20;
  uint64_t vars8;

  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  v9 = *(void (**)(void *__return_ptr, id, uint64_t, uint64_t, uint64_t))(v7 + 480);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v19, v4, v6, ObjectType, v7);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v11 = v20;
  if (v20)
  {
    v12 = __swift_project_boxed_opaque_existential_1(v19, v20);
    v13 = *(void *)(v11 - 8);
    v14 = MEMORY[0x1F4188790](v12);
    v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v13 + 16))(v16, v14);
    v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _NSSwiftLocale.object(forKey:)(v4, (uint64_t)v14);

  uint64_t v6 = v15;
  if (v15)
  {
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v14, v15);
    uint64_t v8 = *(void *)(v6 - 8);
    double v9 = MEMORY[0x1F4188790](v7);
    v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v8 + 16))(v11, v9);
    v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)calendarIdentifier
{
  void (*v5)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 200);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(&v9, ObjectType, v3);
  swift_unknownObjectRelease();
  Calendar.Identifier.cfCalendarIdentifier.getter();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)languageCode
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 152);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (BOOL)usesMetricSystem
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 216);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  LOBYTE(v3) = v5(ObjectType, v3);

  swift_unknownObjectRelease();
  return v3 & 1;
}

- (NSString)scriptCode
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 160);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  uint64_t v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    double v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)collatorIdentifier
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 256);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)currencySymbol
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 240);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (id)_localeWithNewCalendarIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }
  else
  {
    id v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  v8.value._countAndFlagsBits = (uint64_t)v4;
  v8.value._object = v6;
  double v9 = (void *)_NSSwiftLocale._localeWithNewCalendarIdentifier(_:)(v8);

  swift_bridgeObjectRelease();

  return v9;
}

- (NSString)languageIdentifier
{
  int v2 = self;
  _NSSwiftLocale.languageIdentifier.getter();

  uint64_t v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)decimalSeparator
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 224);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)currencyCode
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 248);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  uint64_t v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    double v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v9 = 0;
  }

  return (NSString *)v9;
}

- (Class)classForCoder
{
  int v2 = self;
  _NSSwiftLocale.classForCoder.getter();

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)displayNameForKey:(id)a3 value:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  _NSSwiftLocale.displayName(forKey:value:)(v5, (uint64_t)v11);
  uint64_t v8 = v7;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if (v8)
  {
    double v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)localizedStringForLanguageCode:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 80);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForCountryCode:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 88);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _NSSwiftLocale.encode(with:)((NSCoder)v4);
}

- (NSString)groupingSeparator
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 232);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (_NSSwiftLocale)initWithLocaleIdentifier:(id)a3
{
  return (_NSSwiftLocale *)_NSSwiftLocale.init(localeIdentifier:)();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSSwiftLocale)initWithCoder:(id)a3
{
  return (_NSSwiftLocale *)_NSSwiftLocale.init(coder:)(a3);
}

- (NSString)variantCode
{
  int v2 = self;
  _NSSwiftLocale.variantCode.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)collationIdentifier
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 208);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  uint64_t v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    double v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)quotationBeginDelimiter
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 264);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)quotationEndDelimiter
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 272);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)alternateQuotationBeginDelimiter
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 280);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSString)alternateQuotationEndDelimiter
{
  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 288);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (NSCharacterSet)exemplarCharacterSet
{
  int v2 = self;
  _NSSwiftLocale.exemplarCharacterSet.getter(&v5);

  objc_msgSend(*(id *)(v5 + 16), sel_copy);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  type metadata accessor for NSMorphologyPronoun(0, (unint64_t *)&lazy cache variable for type metadata for NSCharacterSet);
  swift_dynamicCast();
  swift_release();

  return (NSCharacterSet *)v4;
}

- (id)localizedStringForLocaleIdentifier:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 72);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return v11;
}

- (id)localizedStringForScriptCode:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 96);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForVariantCode:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 104);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForCalendarIdentifier:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = (uint64_t)v4;
  v8._object = v6;
  object = _NSSwiftLocale.localizedString(forCalendarIdentifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v10 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)localizedStringForCollationIdentifier:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 136);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForCurrencyCode:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 120);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 128);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)localizedStringForCollatorIdentifier:(id)a3
{
  id v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  double v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 144);
  uint64_t v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_numberingSystem
{
  void (*v5)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v3 = *(void *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 312);
  uint64_t v6 = self;
  swift_unknownObjectRetain();
  v5(&v9, ObjectType, v3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return v7;
}

@end