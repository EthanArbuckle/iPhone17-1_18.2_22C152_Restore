@interface NSSwiftMutableAttributedString
- (BOOL)isEqualToAttributedString:(id)a3;
- (NSString)string;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)init;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithAttributedString:(id)a3;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithCoder:(id)a3;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6;
- (id)_nsAttributedSubstringFromRange:(_NSRange)a3;
- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(int64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (int64_t)length;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addAttributes:(id)a3 range:(_NSRange)a4;
- (void)appendAttributedString:(id)a3;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)insertAttributedString:(id)a3 atIndex:(int64_t)a4;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation NSSwiftMutableAttributedString

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
}

- (int64_t)length
{
  v2 = self;
  int64_t v3 = NSSwiftMutableAttributedString.length.getter();

  return v3;
}

- (NSString)string
{
  uint64_t v3 = type metadata accessor for AttributedString.CharacterView();
  MEMORY[0x1F4188790](v3);
  uint64_t v4 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _NSSwiftAttributedStringStorage((uint64_t)v7, (uint64_t)v6, type metadata accessor for _NSSwiftAttributedStringStorage);
  v8 = self;
  AttributedString.characters.getter();
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, MEMORY[0x1E4F27270]);
  uint64_t v9 = String.init<A>(_:)();
  uint64_t v11 = v10;
  outlined destroy of Range<AttributedString.Index>?((uint64_t)v6, type metadata accessor for _NSSwiftAttributedStringStorage);

  v12 = (void *)MEMORY[0x18C115780](v9, v11);
  swift_bridgeObjectRelease();

  return (NSString *)v12;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _NSSwiftAttributedStringStorage((uint64_t)v9, (uint64_t)v8, type metadata accessor for _NSSwiftAttributedStringStorage);
  uint64_t v10 = self;
  uint64_t v11 = (void *)_NSSwiftAttributedStringStorage.attributedSubstring(from:)(location, length);
  outlined destroy of Range<AttributedString.Index>?((uint64_t)v8, type metadata accessor for _NSSwiftAttributedStringStorage);

  return v11;
}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v7 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = self;
  if (NSNotFound.getter() == a3 || [(NSSwiftMutableAttributedString *)v10 length] <= 0)
  {
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  }
  else
  {
    uint64_t v11 = (uint64_t)v10 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _NSSwiftAttributedStringStorage(v11, (uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);
    outlined destroy of Range<AttributedString.Index>?((uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);
  }

  type metadata accessor for NSAttributedStringKey(0);
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  v12.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (id)attributesAtIndex:(int64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v9 = self;
  NSSwiftMutableAttributedString.attributes(at:longestEffectiveRange:in:)(a3, a4, location, length);

  type metadata accessor for NSAttributedStringKey(0);
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v10.super.isa;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v9 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  uint64_t v13 = self;
  if (NSNotFound.getter() == a4 || [(NSSwiftMutableAttributedString *)v13 length] <= 0)
  {
  }
  else
  {
    uint64_t v14 = (uint64_t)v13 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _NSSwiftAttributedStringStorage(v14, (uint64_t)v11, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attribute(_:at:effectiveRange:)(v12, a4, (uint64_t *)a5, &v24);
    outlined destroy of Range<AttributedString.Index>?((uint64_t)v11, type metadata accessor for _NSSwiftAttributedStringStorage);

    uint64_t v15 = v25;
    if (v25)
    {
      v16 = __swift_project_boxed_opaque_existential_1(&v24, v25);
      uint64_t v17 = *(void *)(v15 - 8);
      double v18 = MEMORY[0x1F4188790](v16);
      v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v17 + 16))(v20, v18);
      v21 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      goto LABEL_7;
    }
  }
  v21 = 0;
LABEL_7:

  return v21;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v12 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a3;
  v16 = self;
  if (NSNotFound.getter() == a4 || [(NSSwiftMutableAttributedString *)v16 length] <= 0)
  {
  }
  else
  {
    uint64_t v17 = (uint64_t)v16 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _NSSwiftAttributedStringStorage(v17, (uint64_t)v14, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attribute(_:at:longestEffectiveRange:in:)(v15, a4, a5, location, length, &v27);
    outlined destroy of Range<AttributedString.Index>?((uint64_t)v14, type metadata accessor for _NSSwiftAttributedStringStorage);

    uint64_t v18 = v28;
    if (v28)
    {
      uint64_t v19 = __swift_project_boxed_opaque_existential_1(&v27, v28);
      uint64_t v20 = *(void *)(v18 - 8);
      double v21 = MEMORY[0x1F4188790](v19);
      uint64_t v23 = (char *)&v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v20 + 16))(v23, v21);
      long long v24 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v18);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
      goto LABEL_7;
    }
  }
  long long v24 = 0;
LABEL_7:

  return v24;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  uint64_t v5 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _NSSwiftAttributedStringStorage((uint64_t)v8, (uint64_t)v7, type metadata accessor for _NSSwiftAttributedStringStorage);
  id v9 = a3;
  uint64_t v10 = self;
  LOBYTE(self) = _NSSwiftAttributedStringStorage.isEqual(to:)(v9);
  outlined destroy of Range<AttributedString.Index>?((uint64_t)v7, type metadata accessor for _NSSwiftAttributedStringStorage);

  return self & 1;
}

- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = (char *)a3.location;
  uint64_t v10 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a5);
  _Block_copy(v13);
  uint64_t v14 = self;
  if (location == (char *)NSNotFound.getter() || [(NSSwiftMutableAttributedString *)v14 length] < 1)
  {
    _Block_release(v13);

    _Block_release(v13);
  }
  else
  {
    uint64_t v15 = (uint64_t)v14 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _NSSwiftAttributedStringStorage(v15, (uint64_t)v12, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_copy(v13);
    specialized _NSSwiftAttributedStringStorage.enumerateAttributes(in:options:using:)(location, length, (void (**)(char *, char *, uint64_t))a4, (uint64_t)v12, (uint64_t)v13);
    _Block_release(v13);
    outlined destroy of Range<AttributedString.Index>?((uint64_t)v12, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_release(v13);

    _Block_release(v13);
  }
}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = (char *)a4.location;
  uint64_t v12 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a6);
  _Block_copy(v15);
  id v16 = a3;
  uint64_t v17 = self;
  if (location == (char *)NSNotFound.getter() || [(NSSwiftMutableAttributedString *)v17 length] < 1)
  {
    _Block_release(v15);

    _Block_release(v15);
  }
  else
  {
    uint64_t v18 = (uint64_t)v17 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _NSSwiftAttributedStringStorage(v18, (uint64_t)v14, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_copy(v15);
    specialized _NSSwiftAttributedStringStorage.enumerateAttribute(_:in:options:using:)(v16, location, length, a5, (uint64_t)v14, (uint64_t)v15);
    _Block_release(v15);
    outlined destroy of Range<AttributedString.Index>?((uint64_t)v14, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_release(v15);

    _Block_release(v15);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  id v7 = a4;
  id v9 = self;
  v8.Swift::Int location = location;
  v8.Swift::Int length = length;
  NSSwiftMutableAttributedString.replaceCharacters(in:with:)(v8, (NSAttributedString)v7);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = v8;
  uint64_t v10 = self;
  v11.Swift::Int location = location;
  v11.Swift::Int length = length;
  v12._countAndFlagsBits = v7;
  v12._object = v9;
  NSSwiftMutableAttributedString.replaceCharacters(in:with:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length = a4.length;
  char location = a4.location;
  uint64_t v6 = a3;
  if (a3)
  {
    type metadata accessor for NSAttributedStringKey(0);
    _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    uint64_t v6 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  __C::_NSRange v8 = self;
  v11.value._rawValue = v6;
  v11.is_nil = location;
  v9.char location = length;
  NSSwiftMutableAttributedString.setAttributes(_:range:)(v11, v9);

  swift_bridgeObjectRelease();
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a3;
  swift_unknownObjectRetain();
  __C::_NSRange v9 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (location == NSNotFound.getter())
  {
  }
  else
  {
    _s10Foundation3URLVSgMaTm_0(0, &lazy cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>, (uint64_t (*)(uint64_t))type metadata accessor for (NSAttributedStringKey, Any), MEMORY[0x1E4FBBE00]);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_18834BB80;
    *(void *)(inited + 32) = v8;
    outlined init with copy of Any((uint64_t)v13, inited + 40);
    id v11 = v8;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    type metadata accessor for NSAttributedStringKey(0);
    _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    -[NSSwiftMutableAttributedString addAttributes:range:](v9, sel_addAttributes_range_, isa, location, length);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  type metadata accessor for NSAttributedStringKey(0);
  _s10Foundation16AttributedStringV5IndexVAESLAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, type metadata accessor for NSAttributedStringKey);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  v9.Swift::Int location = location;
  v9.Swift::Int length = length;
  NSSwiftMutableAttributedString.addAttributes(_:range:)((Swift::OpaquePointer)v7, v9);

  swift_bridgeObjectRelease();
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  Swift::Int length = (void (**)(char *, uint64_t, uint64_t, uint64_t))a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = self;
  if (location == NSNotFound.getter())
  {
  }
  else
  {
    swift_beginAccess();
    _NSSwiftAttributedStringStorage.remove(key:in:)((uint64_t)v7, location, length);
    swift_endAccess();
    -[NSSwiftMutableAttributedString edited:range:changeInLength:](v8, sel_edited_range_changeInLength_, 1, location, length, 0);
  }
}

- (void)insertAttributedString:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  NSSwiftMutableAttributedString.insert(_:at:)((NSAttributedString)v6, a4);
}

- (void)appendAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  NSSwiftMutableAttributedString.append(_:)((NSAttributedString)v4);
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  id v6 = self;
  v5.Swift::Int location = location;
  v5.Swift::Int length = length;
  NSSwiftMutableAttributedString.deleteCharacters(in:)(v5);
}

- (void)setAttributedString:(id)a3
{
  id v4 = a3;
  __C::_NSRange v5 = self;
  -[NSSwiftMutableAttributedString replaceCharactersInRange:withAttributedString:](v5, sel_replaceCharactersInRange_withAttributedString_, 0, [(NSSwiftMutableAttributedString *)v5 length], v4);
}

- (id)_nsAttributedSubstringFromRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  __C::_NSRange v5 = self;
  v6.Swift::Int location = location;
  v6.Swift::Int length = length;
  id v7 = NSSwiftMutableAttributedString._nsAttributedSubstring(from:)(v6);

  return v7;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)init
{
  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3
{
  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end