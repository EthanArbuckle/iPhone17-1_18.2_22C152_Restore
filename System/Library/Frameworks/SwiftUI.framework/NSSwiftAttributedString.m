@interface NSSwiftAttributedString
- (BOOL)isEqualToAttributedString:(id)a3;
- (NSString)string;
- (_TtC7SwiftUI23NSSwiftAttributedString)init;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithAttributedString:(id)a3;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithCoder:(id)a3;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (_TtC7SwiftUI23NSSwiftAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(int64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation NSSwiftAttributedString

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
}

- (NSString)string
{
  uint64_t v3 = type metadata accessor for AttributedString.CharacterView();
  MEMORY[0x1F4188790](v3);
  v4 = self;
  AttributedString.characters.getter();
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, MEMORY[0x1E4F27270]);
  uint64_t v5 = String.init<A>(_:)();
  uint64_t v7 = v6;

  v8 = (void *)MEMORY[0x18C115780](v5, v7);
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = self;
  uint64_t v6 = (void *)_NSSwiftAttributedStringStorage.attributedSubstring(from:)(location, length);

  return v6;
}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v6 = self;
  if (NSNotFound.getter() == a3 || (uint64_t)[(NSSwiftAttributedString *)v6 length] <= 0) {
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  }
  else {
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);
  }

  type metadata accessor for NSAttributedStringKey(0);
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (id)attributesAtIndex:(int64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v9 = self;
  if (NSNotFound.getter() == a3 || (uint64_t)[(NSSwiftAttributedString *)v9 length] <= 0)
  {
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  }
  else
  {
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);
    if (a4)
    {
      v13.NSUInteger location = location;
      v13.NSUInteger length = length;
      *a4 = NSIntersectionRange(*a4, v13);
    }
  }

  type metadata accessor for NSAttributedStringKey(0);
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v10.super.isa;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8 = a3;
  v9 = self;
  if (NSNotFound.getter() == a4 || (uint64_t)[(NSSwiftAttributedString *)v9 length] <= 0)
  {
  }
  else
  {
    _NSSwiftAttributedStringStorage.attribute(_:at:effectiveRange:)(v8, a4, (uint64_t *)a5, &v18);

    uint64_t v10 = v19;
    if (v19)
    {
      v11 = __swift_project_boxed_opaque_existential_1(&v18, v19);
      uint64_t v12 = *(void *)(v10 - 8);
      double v13 = MEMORY[0x1F4188790](v11);
      v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v12 + 16))(v15, v13);
      v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
      goto LABEL_7;
    }
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  uint64_t v12 = self;
  if (NSNotFound.getter() == a4 || (uint64_t)[(NSSwiftAttributedString *)v12 length] <= 0)
  {
  }
  else
  {
    _NSSwiftAttributedStringStorage.attribute(_:at:longestEffectiveRange:in:)(v11, a4, a5, location, length, &v21);

    uint64_t v13 = v22;
    if (v22)
    {
      uint64_t v14 = __swift_project_boxed_opaque_existential_1(&v21, v22);
      uint64_t v15 = *(void *)(v13 - 8);
      double v16 = MEMORY[0x1F4188790](v14);
      long long v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v15 + 16))(v18, v16);
      uint64_t v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
      goto LABEL_7;
    }
  }
  uint64_t v19 = 0;
LABEL_7:

  return v19;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = _NSSwiftAttributedStringStorage.isEqual(to:)(v4);

  return v6 & 1;
}

- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = (char *)a3.location;
  v9 = _Block_copy(a5);
  _Block_copy(v9);
  uint64_t v10 = self;
  if (location != (char *)NSNotFound.getter() && (uint64_t)[(NSSwiftAttributedString *)v10 length] > 0)
  {
    uint64_t v11 = (uint64_t)v10 + OBJC_IVAR____TtC7SwiftUI23NSSwiftAttributedString__storage;
    _Block_copy(v9);
    specialized _NSSwiftAttributedStringStorage.enumerateAttributes(in:options:using:)(location, length, (void (**)(char *, char *, uint64_t))a4, v11, (uint64_t)v9);
    _Block_release(v9);
  }
  _Block_release(v9);

  _Block_release(v9);
}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = (char *)a4.location;
  uint64_t v11 = _Block_copy(a6);
  _Block_copy(v11);
  id v12 = a3;
  uint64_t v13 = self;
  if (location != (char *)NSNotFound.getter() && (uint64_t)[(NSSwiftAttributedString *)v13 length] > 0)
  {
    uint64_t v14 = (uint64_t)v13 + OBJC_IVAR____TtC7SwiftUI23NSSwiftAttributedString__storage;
    _Block_copy(v11);
    specialized _NSSwiftAttributedStringStorage.enumerateAttribute(_:in:options:using:)(v12, location, length, a5, v14, (uint64_t)v11);
    _Block_release(v11);
  }
  _Block_release(v11);

  _Block_release(v11);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)init
{
  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3
{
  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end