@interface MUISnippetGeneratorSwift
+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 frame:(CGRect)a5 highlighting:(id)a6 error:(id *)a7;
+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 maxNumberOfWordsBeforeOrAfterToken:(int64_t)a5 maxNumberOfRanges:(int64_t)a6 highlighting:(id)a7 error:(id *)a8;
+ (id)highlightingAuthorTokens:(id)a3 authorEmailTokens:(id)a4 inEmailAttributedString:(id)a5 highlighting:(id)a6 error:(id *)a7;
+ (id)highlightingTokens:(id)a3 attributedString:(id)a4 highlighting:(id)a5 error:(id *)a6;
- (MUISnippetGeneratorSwift)init;
@end

@implementation MUISnippetGeneratorSwift

+ (id)highlightingTokens:(id)a3 attributedString:(id)a4 highlighting:(id)a5 error:(id *)a6
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = a4;
  v12 = _Block_copy(a5);
  v14 = (objc_class *)sub_1DDEEEDA8();
  v16 = v12;
  swift_getObjCClassMetadata();
  v9 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(v14, a4, (uint64_t)sub_1DDEDE0E8, (uint64_t)v15);
  _Block_release(v12);
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)highlightingAuthorTokens:(id)a3 authorEmailTokens:(id)a4 inEmailAttributedString:(id)a5 highlighting:(id)a6 error:(id *)a7
{
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15 = _Block_copy(a6);
  uint64_t v18 = sub_1DDEEEDA8();
  uint64_t v16 = sub_1DDEEEDA8();
  v20 = v15;
  swift_getObjCClassMetadata();
  v11 = (void *)static SnippetGenerator.highlightingTokens(authorTokens:authorEmailTokens:inEmailAttributedString:highlighting:)(v18, v16, a5, (uint64_t)sub_1DDEDE0E8, (uint64_t)v19);
  _Block_release(v15);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v11;
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 maxNumberOfWordsBeforeOrAfterToken:(int64_t)a5 maxNumberOfRanges:(int64_t)a6 highlighting:(id)a7 error:(id *)a8
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  v14 = _Block_copy(a7);
  uint64_t v18 = sub_1DDEEEDA8();
  v20 = v14;
  swift_getObjCClassMetadata();
  v11 = (void *)static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:)(v18, a4, a5, a6, (uint64_t)sub_1DDEDE0E8, (uint64_t)v19);
  _Block_release(v14);
  swift_bridgeObjectRelease();

  return v11;
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 frame:(CGRect)a5 highlighting:(id)a6 error:(id *)a7
{
  CGRect v19 = a5;
  swift_getObjCClassMetadata();
  id v7 = a3;
  id v8 = a4;
  v13 = _Block_copy(a6);
  uint64_t v16 = sub_1DDEEEDA8();
  uint64_t v18 = v13;
  swift_getObjCClassMetadata();
  v10 = static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:inside:highlighting:)(v16, a4, (uint64_t)sub_1DDEDE0E8, (uint64_t)v17, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  _Block_release(v13);
  swift_bridgeObjectRelease();

  return v10;
}

- (MUISnippetGeneratorSwift)init
{
  return (MUISnippetGeneratorSwift *)SnippetGenerator.init()();
}

@end