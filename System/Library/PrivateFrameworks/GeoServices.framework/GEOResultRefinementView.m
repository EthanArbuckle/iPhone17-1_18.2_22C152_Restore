@interface GEOResultRefinementView
- (GEOResultRefinementView)initWithResultRefinementView:(id)a3;
- (GEOResultRefinementView)initWithSections:(id)a3;
- (NSArray)sections;
- (void)setSections:(id)a3;
@end

@implementation GEOResultRefinementView

- (GEOResultRefinementView)initWithSections:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOResultRefinementView;
    v5 = [(GEOResultRefinementView *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      sections = v5->_sections;
      v5->_sections = (NSArray *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOResultRefinementView)initWithResultRefinementView:(id)a3
{
  id v4 = -[GEOPDResultRefinementView sections]((id *)a3);
  v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_209);

  uint64_t v6 = [(GEOResultRefinementView *)self initWithSections:v5];
  return v6;
}

GEOResultRefinementSection *__56__GEOResultRefinementView_initWithResultRefinementView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinementSection alloc] initWithResultRefinementSection:v2];

  return v3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end