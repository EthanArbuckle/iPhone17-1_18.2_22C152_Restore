@interface CHSWidgetExtensionProviderOptions
+ (BOOL)supportsSecureCoding;
+ (CHSWidgetExtensionProviderOptions)allControls;
+ (CHSWidgetExtensionProviderOptions)controls;
+ (CHSWidgetExtensionProviderOptions)visibleControls;
+ (CHSWidgetExtensionProviderOptions)widgets;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)includeIntents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubsetOf:(id)a3;
- (BOOL)matchesControlDescriptor:(id)a3;
- (BOOL)matchesEverything;
- (BOOL)matchesExtension:(id)a3;
- (BOOL)matchesWidgetDescriptor:(id)a3;
- (CHSControlDescriptorsPredicate)controlsPredicate;
- (CHSWidgetDescriptorsPredicate)widgetsPredicate;
- (CHSWidgetExtensionProviderOptions)init;
- (CHSWidgetExtensionProviderOptions)initWithCoder:(id)a3;
- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4;
- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4 includeIntents:(BOOL)a5;
- (NSString)description;
- (id)mergedWith:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetExtensionProviderOptions

- (CHSControlDescriptorsPredicate)controlsPredicate
{
  return (CHSControlDescriptorsPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR___CHSWidgetExtensionProviderOptions_controlsPredicate));
}

- (CHSWidgetDescriptorsPredicate)widgetsPredicate
{
  return (CHSWidgetDescriptorsPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___CHSWidgetExtensionProviderOptions_widgetsPredicate));
}

- (BOOL)includeIntents
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_includeIntents);
}

+ (CHSWidgetExtensionProviderOptions)widgets
{
  id v2 = objc_msgSend(self, sel_visible);
  id v3 = objc_msgSend(objc_allocWithZone((Class)CHSWidgetExtensionProviderOptions), sel_initWithWidgetsPredicate_controlsPredicate_, v2, 0);

  return (CHSWidgetExtensionProviderOptions *)v3;
}

+ (CHSWidgetExtensionProviderOptions)visibleControls
{
  return (CHSWidgetExtensionProviderOptions *)sub_190CFB6FC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_visible);
}

+ (CHSWidgetExtensionProviderOptions)allControls
{
  return (CHSWidgetExtensionProviderOptions *)sub_190CFB6FC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_all);
}

- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4
{
  return [(CHSWidgetExtensionProviderOptions *)self initWithWidgetsPredicate:a3 controlsPredicate:a4 includeIntents:1];
}

- (CHSWidgetExtensionProviderOptions)initWithWidgetsPredicate:(id)a3 controlsPredicate:(id)a4 includeIntents:(BOOL)a5
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_includeIntents) = a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_widgetsPredicate) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_controlsPredicate) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetExtensionProviderOptions;
  id v6 = a3;
  id v7 = a4;
  return [(CHSWidgetExtensionProviderOptions *)&v9 init];
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = CHSWidgetExtensionProviderOptions.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CHSWidgetExtensionProviderOptions.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  id v2 = self;
  CHSWidgetExtensionProviderOptions.description.getter();

  int64_t v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (CHSWidgetExtensionProviderOptions)controls
{
  return (CHSWidgetExtensionProviderOptions *)sub_190CFB6FC((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_visible);
}

- (CHSWidgetExtensionProviderOptions)init
{
  result = (CHSWidgetExtensionProviderOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  int64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionProviderOptions_widgetsPredicate);
}

- (BOOL)matchesEverything
{
  uint64_t v2 = qword_1E92AA278;
  int64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1E92AA270;
  unsigned __int8 v5 = sub_190CFC7A4(v3, v4);

  return v5 & 1;
}

- (id)mergedWith:(id)a3
{
  id v4 = (CHSWidgetExtensionProviderOptions *)a3;
  unsigned __int8 v5 = self;
  CHSWidgetExtensionProviderOptions.merged(with:)(v6, v4);
  v8 = v7;

  return v8;
}

- (BOOL)matchesExtension:(id)a3
{
  id v4 = (CHSWidgetExtension *)a3;
  unsigned __int8 v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.matches(extension:)(v4);

  return self & 1;
}

- (BOOL)matchesWidgetDescriptor:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  char v6 = [(CHSWidgetExtensionProviderOptions *)v5 widgetsPredicate];

  if (v6) {
  return v6 != 0;
  }
}

- (BOOL)matchesControlDescriptor:(id)a3
{
  id v4 = (CHSControlDescriptor *)a3;
  unsigned __int8 v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.matches(controlDescriptor:)(v4);

  return self & 1;
}

- (BOOL)isSubsetOf:(id)a3
{
  id v4 = (CHSWidgetExtensionProviderOptions *)a3;
  unsigned __int8 v5 = self;
  LOBYTE(self) = CHSWidgetExtensionProviderOptions.isSubset(of:)(v4);

  return self & 1;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1E92AC068;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92AC068 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  CHSWidgetExtensionProviderOptions.encode(with:)((NSCoder)v4);
}

- (CHSWidgetExtensionProviderOptions)initWithCoder:(id)a3
{
  return (CHSWidgetExtensionProviderOptions *)CHSWidgetExtensionProviderOptions.init(coder:)(a3);
}

@end