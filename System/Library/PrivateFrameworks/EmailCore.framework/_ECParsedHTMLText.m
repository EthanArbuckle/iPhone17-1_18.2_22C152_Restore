@interface _ECParsedHTMLText
- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3;
- (id)description;
@end

@implementation _ECParsedHTMLText

- (id)copyConsumableNodesAndAppendInnerTextToStringAccumulator:(id)a3
{
  unint64_t v5 = [(_ECParsedHTMLNode *)self startLocation];
  objc_msgSend(a3, "appendRange:ofString:", v5, -[_ECParsedHTMLNode endLocation](self, "endLocation") - v5, -[_ECParsedHTMLNode htmlString](self, "htmlString"));
  return 0;
}

- (id)description
{
  v3 = [[ECMessageBodyStringAccumulator alloc] initWithOptions:0 lengthLimit:81];
  [(ECMessageBodyStringAccumulator *)v3 appendInnerTextWithConsumableNode:self];
  v4 = [(ECMessageBodyStringAccumulator *)v3 accumulatedString];
  if ([(NSString *)v4 length] > 0x50) {
    uint64_t v5 = [NSString stringWithFormat:@"\"%@...\", -[NSString substringToIndex:](v4, "substringToIndex:"", 80)];
  }
  else {
    uint64_t v5 = [NSString stringWithFormat:@"\"%@\"", v4];
  }
  v6 = (void *)v5;

  return v6;
}

@end