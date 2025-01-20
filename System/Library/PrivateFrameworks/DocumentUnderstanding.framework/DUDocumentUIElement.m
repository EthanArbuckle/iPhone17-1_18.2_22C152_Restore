@interface DUDocumentUIElement
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnScreen;
- (BOOL)isValidForContentExtraction;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (NSArray)range;
- (NSArray)styleProperties;
- (NSArray)superviewClassIndices;
- (NSArray)superviewClassNames;
- (NSString)classDescriptor;
- (NSString)text;
- (NSString)version;
- (_TtC21DocumentUnderstanding19DUDocumentUIElement)init;
- (_TtC21DocumentUnderstanding19DUDocumentUIElement)initWithCoder:(id)a3;
- (float)fontSize;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setClassDescriptor:(id)a3;
- (void)setFontSize:(float)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)setIsValidForContentExtraction:(BOOL)a3;
- (void)setRange:(id)a3;
- (void)setStyleProperties:(id)a3;
- (void)setSuperviewClassIndices:(id)a3;
- (void)setSuperviewClassNames:(id)a3;
- (void)setText:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DUDocumentUIElement

- (NSString)text
{
  return (NSString *)sub_23689DA04((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentUIElement.text.getter);
}

- (void)setText:(id)a3
{
}

- (NSString)version
{
  return (NSString *)sub_23689DA04((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentUIElement.version.getter);
}

- (void)setVersion:(id)a3
{
}

- (NSString)classDescriptor
{
  return (NSString *)sub_23689DA04((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentUIElement.classDescriptor.getter);
}

- (void)setClassDescriptor:(id)a3
{
}

- (float)fontSize
{
  return DUDocumentUIElement.fontSize.getter();
}

- (void)setFontSize:(float)a3
{
}

- (NSArray)superviewClassNames
{
  return (NSArray *)sub_23689E25C((uint64_t)self, (uint64_t)a2, DUDocumentUIElement.superviewClassNames.getter);
}

- (void)setSuperviewClassNames:(id)a3
{
}

- (CGRect)frameInWindow
{
  double v2 = DUDocumentUIElement.frameInWindow.getter();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
}

- (CGPoint)absoluteOriginOnScreen
{
  double v2 = DUDocumentUIElement.absoluteOriginOnScreen.getter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
}

- (BOOL)isOnScreen
{
  return DUDocumentUIElement.isOnScreen.getter() & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
}

- (BOOL)isValidForContentExtraction
{
  return DUDocumentUIElement.isValidForContentExtraction.getter() & 1;
}

- (void)setIsValidForContentExtraction:(BOOL)a3
{
}

- (NSArray)superviewClassIndices
{
  return (NSArray *)sub_23689E25C((uint64_t)self, (uint64_t)a2, DUDocumentUIElement.superviewClassIndices.getter);
}

- (void)setSuperviewClassIndices:(id)a3
{
}

- (NSArray)range
{
  return (NSArray *)sub_23689E25C((uint64_t)self, (uint64_t)a2, DUDocumentUIElement.range.getter);
}

- (void)setRange:(id)a3
{
}

- (NSArray)styleProperties
{
  return (NSArray *)sub_23689E25C((uint64_t)self, (uint64_t)a2, DUDocumentUIElement.styleProperties.getter);
}

- (void)setStyleProperties:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return static DUDocumentUIElement.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC21DocumentUnderstanding19DUDocumentUIElement)init
{
  return (_TtC21DocumentUnderstanding19DUDocumentUIElement *)DUDocumentUIElement.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = self;
  DUDocumentUIElement.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding19DUDocumentUIElement)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentUIElement *)DUDocumentUIElement.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  double v3 = self;
  DUDocumentUIElement.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  id v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    double v5 = self;
  }
  char v6 = DUDocumentUIElement.isEqual(_:)((uint64_t)v8);

  sub_2367CA5E4((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end