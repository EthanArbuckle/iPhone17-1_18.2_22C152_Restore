@interface MUISnippetGenerator
+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 frame:(CGRect)a5 highlighting:(id)a6 error:(id *)a7;
+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 maxNumberOfWordsBeforeOrAfterToken:(int64_t)a5 maxNumberOfRanges:(int64_t)a6 highlighting:(id)a7 error:(id *)a8;
+ (id)highlightingAuthorTokens:(id)a3 authorEmailTokens:(id)a4 inEmailAttributedString:(id)a5 highlighting:(id)a6 error:(id *)a7;
+ (id)highlightingTokens:(id)a3 attributedString:(id)a4 highlighting:(id)a5 error:(id *)a6;
@end

@implementation MUISnippetGenerator

+ (id)highlightingTokens:(id)a3 attributedString:(id)a4 highlighting:(id)a5 error:(id *)a6
{
  return +[MUISnippetGeneratorSwift highlightingTokens:a3 attributedString:a4 highlighting:a5 error:a6];
}

+ (id)highlightingAuthorTokens:(id)a3 authorEmailTokens:(id)a4 inEmailAttributedString:(id)a5 highlighting:(id)a6 error:(id *)a7
{
  return +[MUISnippetGeneratorSwift highlightingAuthorTokens:a3 authorEmailTokens:a4 inEmailAttributedString:a5 highlighting:a6 error:a7];
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 maxNumberOfWordsBeforeOrAfterToken:(int64_t)a5 maxNumberOfRanges:(int64_t)a6 highlighting:(id)a7 error:(id *)a8
{
  return +[MUISnippetGeneratorSwift highlightedSnippetUsingTokens:a3 attributedString:a4 maxNumberOfWordsBeforeOrAfterToken:a5 maxNumberOfRanges:a6 highlighting:a7 error:a8];
}

+ (id)highlightedSnippetUsingTokens:(id)a3 attributedString:(id)a4 frame:(CGRect)a5 highlighting:(id)a6 error:(id *)a7
{
  return +[MUISnippetGeneratorSwift highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:](MUISnippetGeneratorSwift, "highlightedSnippetUsingTokens:attributedString:frame:highlighting:error:", a3, a4, a6, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

@end