@interface _NSMarkdownStringAttributeDescriptor
- (id)attributeValueFromValue:(id)a3;
- (unint64_t)retainCount;
@end

@implementation _NSMarkdownStringAttributeDescriptor

- (unint64_t)retainCount
{
  return -1;
}

- (id)attributeValueFromValue:(id)a3
{
  if (!_NSIsNSString()) {
    return 0;
  }
  v4 = objc_alloc_init(NSAttributedStringMarkdownParsingOptions);
  [(NSAttributedStringMarkdownParsingOptions *)v4 setInterpretedSyntax:2];
  v5 = [[NSAttributedString alloc] initWithMarkdownString:a3 options:v4 baseURL:0 error:0];

  return v5;
}

@end