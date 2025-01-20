@interface GEOResultRefinementGroup
- (GEOPDRefinementSessionState)refinementSessionState;
- (GEOResultRefinementBar)resultRefinementBar;
- (GEOResultRefinementGroup)initWithResultRefinementBar:(id)a3 resultRefinementView:(id)a4 refinementSessionState:(id)a5;
- (GEOResultRefinementGroup)initWithResultRefinementGroup:(id)a3;
- (GEOResultRefinementView)resultRefinementView;
- (void)setRefinementSessionState:(id)a3;
- (void)setResultRefinementBar:(id)a3;
- (void)setResultRefinementView:(id)a3;
@end

@implementation GEOResultRefinementGroup

- (GEOResultRefinementGroup)initWithResultRefinementBar:(id)a3 resultRefinementView:(id)a4 refinementSessionState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GEOResultRefinementGroup;
  v12 = [(GEOResultRefinementGroup *)&v16 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    if (!v9)
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_resultRefinementBar, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  v14 = p_isa;
LABEL_6:

  return v14;
}

- (GEOResultRefinementGroup)initWithResultRefinementGroup:(id)a3
{
  v4 = (id *)a3;
  v5 = [GEOResultRefinementBar alloc];
  v6 = -[GEOPDResultRefinementGroup resultRefinementBar](v4);
  v7 = [(GEOResultRefinementBar *)v5 initWithResultRefinementBar:v6];

  v8 = [GEOResultRefinementView alloc];
  id v9 = -[GEOPDResultRefinementGroup resultRefinementView](v4);
  id v10 = [(GEOResultRefinementView *)v8 initWithResultRefinementView:v9];

  id v11 = -[GEOPDResultRefinementGroup refinementSessionState](v4);

  v12 = [(GEOResultRefinementGroup *)self initWithResultRefinementBar:v7 resultRefinementView:v10 refinementSessionState:v11];
  return v12;
}

- (GEOResultRefinementBar)resultRefinementBar
{
  return self->_resultRefinementBar;
}

- (void)setResultRefinementBar:(id)a3
{
}

- (GEOResultRefinementView)resultRefinementView
{
  return self->_resultRefinementView;
}

- (void)setResultRefinementView:(id)a3
{
}

- (GEOPDRefinementSessionState)refinementSessionState
{
  return self->_refinementSessionState;
}

- (void)setRefinementSessionState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementSessionState, 0);
  objc_storeStrong((id *)&self->_resultRefinementView, 0);

  objc_storeStrong((id *)&self->_resultRefinementBar, 0);
}

@end