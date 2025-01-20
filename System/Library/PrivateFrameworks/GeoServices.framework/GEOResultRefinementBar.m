@interface GEOResultRefinementBar
- (GEOResultRefinementBar)initWithResultRefinementBar:(id)a3;
- (GEOResultRefinementBar)initWithResultRefinements:(id)a3;
- (NSArray)resultRefinements;
- (void)setResultRefinements:(id)a3;
@end

@implementation GEOResultRefinementBar

- (GEOResultRefinementBar)initWithResultRefinements:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOResultRefinementBar;
    v5 = [(GEOResultRefinementBar *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      resultRefinements = v5->_resultRefinements;
      v5->_resultRefinements = (NSArray *)v6;
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

- (GEOResultRefinementBar)initWithResultRefinementBar:(id)a3
{
  id v4 = -[GEOPDResultRefinementBar resultRefinements]((id *)a3);
  v5 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_97);

  uint64_t v6 = [(GEOResultRefinementBar *)self initWithResultRefinements:v5];
  return v6;
}

GEOResultRefinement *__54__GEOResultRefinementBar_initWithResultRefinementBar___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinement alloc] initWithResultRefinement:v2];

  return v3;
}

- (NSArray)resultRefinements
{
  return self->_resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end