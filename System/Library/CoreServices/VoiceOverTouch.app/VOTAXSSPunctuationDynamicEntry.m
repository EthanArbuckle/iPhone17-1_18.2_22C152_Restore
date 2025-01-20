@interface VOTAXSSPunctuationDynamicEntry
- (id)dynamicReplacement;
- (id)replacement;
- (void)setDynamicReplacement:(id)a3;
@end

@implementation VOTAXSSPunctuationDynamicEntry

- (id)replacement
{
  v3 = [(VOTAXSSPunctuationDynamicEntry *)self dynamicReplacement];

  if (v3)
  {
    v4 = [(VOTAXSSPunctuationDynamicEntry *)self dynamicReplacement];
    v5 = v4[2]();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VOTAXSSPunctuationDynamicEntry;
    v5 = [(VOTAXSSPunctuationDynamicEntry *)&v7 replacement];
  }

  return v5;
}

- (id)dynamicReplacement
{
  return self->_dynamicReplacement;
}

- (void)setDynamicReplacement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end