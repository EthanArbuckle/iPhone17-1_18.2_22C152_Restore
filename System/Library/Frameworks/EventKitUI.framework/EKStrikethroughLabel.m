@interface EKStrikethroughLabel
- (BOOL)drawsStrikethrough;
- (double)firstLineHeadIndent;
- (double)hyphenationFactor;
- (void)setDrawsStrikethrough:(BOOL)a3;
- (void)setFirstLineHeadIndent:(double)a3;
- (void)setHyphenationFactor:(double)a3;
- (void)setText:(id)a3;
@end

@implementation EKStrikethroughLabel

- (void)setText:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v10 = [v4 dictionary];
  if (self->_drawsStrikethrough) {
    [v10 setObject:&unk_1F0D03628 forKeyedSubscript:*MEMORY[0x1E4FB0768]];
  }
  if (self->_firstLineHeadIndent != 0.0 || self->_hyphenationFactor != 0.0)
  {
    v6 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    v7 = (void *)[v6 mutableCopy];

    [v7 setFirstLineHeadIndent:self->_firstLineHeadIndent];
    double hyphenationFactor = self->_hyphenationFactor;
    *(float *)&double hyphenationFactor = hyphenationFactor;
    [v7 setHyphenationFactor:hyphenationFactor];
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v10];

  [(EKStrikethroughLabel *)self setAttributedText:v9];
}

- (void)setDrawsStrikethrough:(BOOL)a3
{
  if (self->_drawsStrikethrough != a3)
  {
    self->_drawsStrikethrough = a3;
    v4 = [(EKStrikethroughLabel *)self text];

    if (v4)
    {
      id v5 = [(EKStrikethroughLabel *)self text];
      [(EKStrikethroughLabel *)self setText:v5];
    }
  }
}

- (void)setFirstLineHeadIndent:(double)a3
{
  if (self->_firstLineHeadIndent != a3)
  {
    self->_firstLineHeadIndent = a3;
    v4 = [(EKStrikethroughLabel *)self text];

    if (v4)
    {
      id v5 = [(EKStrikethroughLabel *)self text];
      [(EKStrikethroughLabel *)self setText:v5];
    }
  }
}

- (void)setHyphenationFactor:(double)a3
{
  if (self->_hyphenationFactor != a3)
  {
    self->_double hyphenationFactor = a3;
    v4 = [(EKStrikethroughLabel *)self text];

    if (v4)
    {
      id v5 = [(EKStrikethroughLabel *)self text];
      [(EKStrikethroughLabel *)self setText:v5];
    }
  }
}

- (BOOL)drawsStrikethrough
{
  return self->_drawsStrikethrough;
}

- (double)firstLineHeadIndent
{
  return self->_firstLineHeadIndent;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

@end