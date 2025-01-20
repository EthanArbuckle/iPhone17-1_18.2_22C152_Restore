@interface NSAttributedStringMarkdownParsingLocalizedStringOptions
@end

@implementation NSAttributedStringMarkdownParsingLocalizedStringOptions

uint64_t ___NSAttributedStringMarkdownParsingLocalizedStringOptions_block_invoke()
{
  qword_1EB1ED178 = objc_alloc_init(NSAttributedStringMarkdownParsingOptions);
  [(id)qword_1EB1ED178 setAllowsExtendedAttributes:1];
  [(id)qword_1EB1ED178 setInterpretedSyntax:2];
  [(id)qword_1EB1ED178 setFailurePolicy:1];
  id v0 = [(NSArray *)[+[NSBundle mainBundle] preferredLocalizations] firstObject];
  v1 = (void *)qword_1EB1ED178;

  return [v1 setLanguageCode:v0];
}

@end