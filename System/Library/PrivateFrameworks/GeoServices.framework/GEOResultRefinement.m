@interface GEOResultRefinement
- (GEOResultRefinement)initWithMultiSelect:(id)a3;
- (GEOResultRefinement)initWithOpenOptions:(id)a3;
- (GEOResultRefinement)initWithResultRefinement:(id)a3;
- (GEOResultRefinement)initWithSort:(id)a3;
- (GEOResultRefinement)initWithToggle:(id)a3;
- (GEOResultRefinementMultiSelect)multiSelect;
- (GEOResultRefinementOpenOptions)openOptions;
- (GEOResultRefinementSort)sort;
- (GEOResultRefinementToggle)toggle;
- (id)convertToGEOPDResultRefinement;
- (int64_t)type;
- (void)setMultiSelect:(id)a3;
- (void)setOpenOptions:(id)a3;
- (void)setSort:(id)a3;
- (void)setToggle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation GEOResultRefinement

- (GEOResultRefinement)initWithToggle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = [(GEOResultRefinement *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_toggle, a3);
    v7->_type = 1;
  }

  return v7;
}

- (GEOResultRefinement)initWithMultiSelect:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = [(GEOResultRefinement *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_multiSelect, a3);
    v7->_type = 2;
  }

  return v7;
}

- (GEOResultRefinement)initWithSort:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = [(GEOResultRefinement *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sort, a3);
    v7->_type = 3;
  }

  return v7;
}

- (GEOResultRefinement)initWithOpenOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOResultRefinement;
  v6 = [(GEOResultRefinement *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_openOptions, a3);
    v7->_type = 4;
  }

  return v7;
}

- (GEOResultRefinement)initWithResultRefinement:(id)a3
{
  v4 = (id *)a3;
  id v5 = 0;
  switch(-[GEOPDResultRefinement resultRefinementType]((uint64_t)v4))
  {
    case 1u:
      v6 = [GEOResultRefinementToggle alloc];
      v7 = -[GEOPDResultRefinement toggle](v4);
      v8 = [(GEOResultRefinementToggle *)v6 initWithResultRefinementToggle:v7];

      if (!v8) {
        goto LABEL_8;
      }
      objc_super v9 = [(GEOResultRefinement *)self initWithToggle:v8];
      goto LABEL_10;
    case 3u:
      v10 = [GEOResultRefinementMultiSelect alloc];
      v11 = -[GEOPDResultRefinement multiSelect](v4);
      v8 = [(GEOResultRefinementMultiSelect *)v10 initWithResultRefinementMultiSelect:v11];

      if (!v8) {
        goto LABEL_8;
      }
      objc_super v9 = [(GEOResultRefinement *)self initWithMultiSelect:v8];
      goto LABEL_10;
    case 4u:
      v12 = [GEOResultRefinementSort alloc];
      v13 = -[GEOPDResultRefinement sort](v4);
      v8 = [(GEOResultRefinementSort *)v12 initWithResultRefinementSort:v13];

      if (v8)
      {
        objc_super v9 = [(GEOResultRefinement *)self initWithSort:v8];
LABEL_10:
        self = v9;
        id v5 = self;
      }
      else
      {
LABEL_8:
        id v5 = 0;
      }

LABEL_12:
      return v5;
    case 6u:
      v14 = [GEOResultRefinementOpenOptions alloc];
      v15 = -[GEOPDResultRefinement openOptions](v4);
      v8 = [(GEOResultRefinementOpenOptions *)v14 initWithOpenOptions:v15];

      objc_super v9 = [(GEOResultRefinement *)self initWithOpenOptions:v8];
      goto LABEL_10;
    default:
      goto LABEL_12;
  }
}

- (id)convertToGEOPDResultRefinement
{
  v3 = objc_alloc_init(GEOPDResultRefinement);
  switch([(GEOResultRefinement *)self type])
  {
    case 0:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 0;
      }
      break;
    case 1:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 1;
      }
      v4 = [(GEOResultRefinement *)self toggle];
      id v5 = [v4 convertToGEOPDResultRefinementToggle];
      -[GEOPDResultRefinement setToggle:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 2:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 3;
      }
      v4 = [(GEOResultRefinement *)self multiSelect];
      id v5 = [v4 convertToGEOPDResultRefinementMultiSelect];
      -[GEOPDResultRefinement setMultiSelect:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 3:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 4;
      }
      v4 = [(GEOResultRefinement *)self sort];
      id v5 = [v4 convertToGEOPDResultRefinementSort];
      -[GEOPDResultRefinement setSort:]((uint64_t)v3, v5);
      goto LABEL_16;
    case 4:
      if (v3)
      {
        *(_WORD *)&v3->_flags |= 0x100u;
        *(_WORD *)&v3->_flags |= 1u;
        v3->_resultRefinementType = 6;
      }
      v4 = [(GEOResultRefinement *)self openOptions];
      id v5 = [v4 convertToGEOPDResultRefinementOpenOptions];
      -[GEOPDResultRefinement setOpenOptions:]((uint64_t)v3, v5);
LABEL_16:

      break;
    default:
      break;
  }

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (GEOResultRefinementToggle)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (GEOResultRefinementMultiSelect)multiSelect
{
  return self->_multiSelect;
}

- (void)setMultiSelect:(id)a3
{
}

- (GEOResultRefinementSort)sort
{
  return self->_sort;
}

- (void)setSort:(id)a3
{
}

- (GEOResultRefinementOpenOptions)openOptions
{
  return self->_openOptions;
}

- (void)setOpenOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openOptions, 0);
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);

  objc_storeStrong((id *)&self->_toggle, 0);
}

@end