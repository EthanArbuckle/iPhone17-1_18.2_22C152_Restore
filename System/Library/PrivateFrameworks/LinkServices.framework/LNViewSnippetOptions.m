@interface LNViewSnippetOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)canReplacePrintableText;
- (LNViewSnippetOptions)initWithCanReplacePrintableText:(BOOL)a3;
- (LNViewSnippetOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNViewSnippetOptions

- (BOOL)canReplacePrintableText
{
  return self->_canReplacePrintableText;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNViewSnippetOptions canReplacePrintableText](self, "canReplacePrintableText"), @"canReplacePrintableText");
}

- (LNViewSnippetOptions)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"canReplacePrintableText"];
  return [(LNViewSnippetOptions *)self initWithCanReplacePrintableText:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  BOOL v5 = [(LNViewSnippetOptions *)self canReplacePrintableText];
  return (id)[v4 initWithCanReplacePrintableText:v5];
}

- (LNViewSnippetOptions)initWithCanReplacePrintableText:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNViewSnippetOptions;
  id v4 = [(LNViewSnippetOptions *)&v8 init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_canReplacePrintableText = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end