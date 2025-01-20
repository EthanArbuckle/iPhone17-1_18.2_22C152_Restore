@interface GEOResultRefinementToggle
- (BOOL)isSelected;
- (BOOL)selectionFromView;
- (BOOL)showAsSelected;
- (GEOPDResultRefinementMetadata)metadata;
- (GEOResultRefinementToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 toggleType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8 selectionFromView:(BOOL)a9 refinementKey:(id)a10 showAsSelected:(BOOL)a11;
- (GEOResultRefinementToggle)initWithResultRefinementToggle:(id)a3;
- (NSNumber)selectionSequenceNumber;
- (NSString)displayName;
- (NSString)refinementKey;
- (id)convertToGEOPDResultRefinementToggle;
- (int)evChargingConnectorType;
- (unint64_t)toggleType;
- (void)setDisplayName:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setMetadata:(id)a3;
@end

@implementation GEOResultRefinementToggle

- (GEOResultRefinementToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 toggleType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8 selectionFromView:(BOOL)a9 refinementKey:(id)a10 showAsSelected:(BOOL)a11
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a10;
  uint64_t v19 = [v15 length];
  v20 = 0;
  if (v16 && v19)
  {
    v27.receiver = self;
    v27.super_class = (Class)GEOResultRefinementToggle;
    v21 = [(GEOResultRefinementToggle *)&v27 init];
    if (v21)
    {
      uint64_t v22 = [v15 copy];
      displayName = v21->_displayName;
      v21->_displayName = (NSString *)v22;

      v21->_isSelected = a4;
      objc_storeStrong((id *)&v21->_metadata, a5);
      v21->_toggleType = a6;
      v21->_evChargingConnectorType = a7;
      objc_storeStrong((id *)&v21->_selectionSequenceNumber, a8);
      v21->_selectionFromView = a9;
      objc_storeStrong((id *)&v21->_refinementKey, a10);
      v21->_showAsSelected = a11;
    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (GEOResultRefinementToggle)initWithResultRefinementToggle:(id)a3
{
  v4 = (id *)a3;
  int v5 = -[GEOPDResultRefinementToggle toggleType]((uint64_t)v4);
  unsigned int v6 = -[GEOPDResultRefinementToggle evChargingConnectorType]((uint64_t)v4) - 1;
  if (v6 > 9) {
    unsigned int v21 = 0;
  }
  else {
    unsigned int v21 = dword_18A63E544[v6];
  }
  int v22 = v5;
  if (v4)
  {
    if ((*((_WORD *)v4 + 34) & 2) != 0)
    {
      v7 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v4 + 14)];
    }
    else
    {
      v7 = 0;
    }
    v8 = -[GEOPDResultRefinementToggle displayName](v4);
    BOOL v9 = *((unsigned char *)v4 + 64) != 0;
    v10 = -[GEOPDResultRefinementToggle metadata](v4);
    BOOL v11 = *((unsigned char *)v4 + 65) != 0;
  }
  else
  {
    v8 = -[GEOPDResultRefinementToggle displayName](0);
    v10 = -[GEOPDResultRefinementToggle metadata](0);
    v7 = 0;
    BOOL v9 = 0;
    BOOL v11 = 0;
  }
  v12 = -[GEOPDResultRefinementToggle metadata](v4);
  v13 = [v12 metadataDefault];
  uint64_t v14 = [v13 refinementKey];
  id v15 = (void *)v14;
  if (v4) {
    BOOL v16 = *((unsigned char *)v4 + 66) != 0;
  }
  else {
    BOOL v16 = 0;
  }
  LOBYTE(v20) = v16;
  LOBYTE(v19) = v11;
  id v17 = [(GEOResultRefinementToggle *)self initWithDisplayName:v8 isSelected:v9 metadata:v10 toggleType:v22 == 1 evChargingConnectorType:v21 selectionSequenceNumber:v7 selectionFromView:v19 refinementKey:v14 showAsSelected:v20];

  return v17;
}

- (id)convertToGEOPDResultRefinementToggle
{
  v3 = objc_alloc_init(GEOPDResultRefinementToggle);
  v4 = [(GEOResultRefinementToggle *)self displayName];
  -[GEOPDResultRefinementToggle setDisplayName:]((uint64_t)v3, v4);

  BOOL v5 = [(GEOResultRefinementToggle *)self isSelected];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 8u;
    v3->_isSelected = v5;
  }
  unsigned int v6 = [(GEOResultRefinementToggle *)self metadata];
  -[GEOPDResultRefinementToggle setMetadata:]((uint64_t)v3, v6);

  unint64_t v7 = [(GEOResultRefinementToggle *)self toggleType];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 4u;
    v3->_toggleType = v7 == 1;
  }
  int v8 = [(GEOResultRefinementToggle *)self evChargingConnectorType] - 1;
  if (v8 > 8) {
    int v9 = 0;
  }
  else {
    int v9 = dword_18A63E56C[v8];
  }
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_evChargingConnectorType = v9;
  }
  v10 = [(GEOResultRefinementToggle *)self selectionSequenceNumber];

  if (v10)
  {
    BOOL v11 = [(GEOResultRefinementToggle *)self selectionSequenceNumber];
    unsigned int v12 = [v11 unsignedIntValue];
    if (v3)
    {
      *(_WORD *)&v3->_flags |= 0x200u;
      *(_WORD *)&v3->_flags |= 2u;
      v3->_selectionSequenceNumber = v12;
    }
  }
  BOOL v13 = [(GEOResultRefinementToggle *)self selectionFromView];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 0x10u;
    v3->_selectionFromView = v13;
    BOOL v14 = [(GEOResultRefinementToggle *)self showAsSelected];
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 0x20u;
    v3->_showAsSelected = v14;
  }
  else
  {
    [(GEOResultRefinementToggle *)self showAsSelected];
  }

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (unint64_t)toggleType
{
  return self->_toggleType;
}

- (int)evChargingConnectorType
{
  return self->_evChargingConnectorType;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (BOOL)selectionFromView
{
  return self->_selectionFromView;
}

- (NSString)refinementKey
{
  return self->_refinementKey;
}

- (BOOL)showAsSelected
{
  return self->_showAsSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end