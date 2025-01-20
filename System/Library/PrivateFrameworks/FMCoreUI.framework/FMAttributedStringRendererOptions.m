@interface FMAttributedStringRendererOptions
- (FMAttributedStringRendererOptions)init;
- (FMAttributedStringRendererOptions)initWithLineBreakMode:(int64_t)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 hyphenationFactor:(double)a6 exclusionPaths:(id)a7;
- (NSArray)exclusionPaths;
- (double)hyphenationFactor;
- (double)lineFragmentPadding;
- (int64_t)lineBreakMode;
- (unint64_t)maximumNumberOfLines;
@end

@implementation FMAttributedStringRendererOptions

- (FMAttributedStringRendererOptions)init
{
  return [(FMAttributedStringRendererOptions *)self initWithLineBreakMode:0 lineFragmentPadding:0 maximumNumberOfLines:MEMORY[0x263EFFA68] hyphenationFactor:5.0 exclusionPaths:0.0];
}

- (FMAttributedStringRendererOptions)initWithLineBreakMode:(int64_t)a3 lineFragmentPadding:(double)a4 maximumNumberOfLines:(unint64_t)a5 hyphenationFactor:(double)a6 exclusionPaths:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)FMAttributedStringRendererOptions;
  v13 = [(FMAttributedStringRendererOptions *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_lineBreakMode = a3;
    v13->_lineFragmentPadding = a4;
    v13->_maximumNumberOfLines = a5;
    v13->_hyphenationFactor = a6;
    uint64_t v15 = [v12 copy];
    exclusionPaths = v14->_exclusionPaths;
    v14->_exclusionPaths = (NSArray *)v15;
  }
  return v14;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (double)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (void).cxx_destruct
{
}

@end