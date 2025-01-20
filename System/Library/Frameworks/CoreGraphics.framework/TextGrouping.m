@interface TextGrouping
- (CRNormalizedQuad)boundingQuad;
- (NSArray)subregions;
- (NSString)text;
- (TextGrouping)initWithTextElement:(id)a3 text:(id)a4;
- (unint64_t)layoutDirection;
- (unint64_t)textRegionType;
- (void)setBoundingQuad:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setSubregions:(id)a3;
- (void)setText:(id)a3;
- (void)setTextRegionType:(unint64_t)a3;
@end

@implementation TextGrouping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setSubregions:(id)a3
{
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setBoundingQuad:(id)a3
{
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTextRegionType:(unint64_t)a3
{
  self->_textRegionType = a3;
}

- (unint64_t)textRegionType
{
  return self->_textRegionType;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (TextGrouping)initWithTextElement:(id)a3 text:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TextGrouping;
  v8 = [(TextGrouping *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(TextGrouping *)v8 setText:v7];
    v10 = [v6 boundingQuad];
    [(TextGrouping *)v9 setBoundingQuad:v10];

    [(TextGrouping *)v9 setLayoutDirection:1];
    v14[0] = v6;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(TextGrouping *)v9 setSubregions:v11];

    [(TextGrouping *)v9 setTextRegionType:2];
  }

  return v9;
}

@end