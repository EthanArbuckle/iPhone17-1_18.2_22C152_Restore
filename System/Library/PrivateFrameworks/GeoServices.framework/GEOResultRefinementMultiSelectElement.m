@interface GEOResultRefinementMultiSelectElement
- (BOOL)isSelected;
- (GEOPDResultRefinementMetadata)metadata;
- (GEOResultRefinementMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 elementType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8;
- (GEOResultRefinementMultiSelectElement)initWithResultRefinementMultiSelectElement:(id)a3;
- (NSNumber)selectionSequenceNumber;
- (NSString)displayName;
- (NSString)refinementKey;
- (id)convertToGEOPDResultRefinementMultiSelectElement;
- (int)evChargingConnectorType;
- (unint64_t)elementType;
- (void)setDisplayName:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setMetadata:(id)a3;
@end

@implementation GEOResultRefinementMultiSelectElement

- (GEOResultRefinementMultiSelectElement)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 elementType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v17 = 0;
  BOOL v19 = a6 != 1 || a7 != 0;
  if (v15 && v19)
  {
    v24.receiver = self;
    v24.super_class = (Class)GEOResultRefinementMultiSelectElement;
    v20 = [(GEOResultRefinementMultiSelectElement *)&v24 init];
    if (v20)
    {
      uint64_t v21 = [v14 copy];
      displayName = v20->_displayName;
      v20->_displayName = (NSString *)v21;

      v20->_isSelected = a4;
      objc_storeStrong((id *)&v20->_metadata, a5);
      v20->_elementType = a6;
      v20->_evChargingConnectorType = a7;
      objc_storeStrong((id *)&v20->_selectionSequenceNumber, a8);
    }
    self = v20;
    v17 = self;
  }

  return v17;
}

- (NSString)refinementKey
{
  v3 = [(GEOResultRefinementMultiSelectElement *)self metadata];
  if ([v3 hasMetadataDefault])
  {
    v4 = [(GEOResultRefinementMultiSelectElement *)self metadata];
    v5 = [v4 metadataDefault];
    if ([v5 hasRefinementKey])
    {
      v6 = [(GEOResultRefinementMultiSelectElement *)self metadata];
      v7 = [v6 metadataDefault];
      v8 = [v7 refinementKey];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

- (GEOResultRefinementMultiSelectElement)initWithResultRefinementMultiSelectElement:(id)a3
{
  v4 = (id *)a3;
  int v5 = -[GEOPDResultRefinementMultiSelectElement elementType]((uint64_t)v4);
  unsigned int v6 = -[GEOPDResultRefinementMultiSelectElement evChargingConnectorType]((uint64_t)v4) - 1;
  if (v6 > 9) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = dword_18A6363A0[v6];
  }
  if (v4)
  {
    if ((*((_WORD *)v4 + 38) & 4) != 0)
    {
      v8 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v4 + 17)];
    }
    else
    {
      v8 = 0;
    }
    v9 = -[GEOPDResultRefinementMultiSelectElement displayName](v4);
    BOOL v10 = *((unsigned char *)v4 + 72) != 0;
  }
  else
  {
    v9 = -[GEOPDResultRefinementMultiSelectElement displayName](0);
    v8 = 0;
    BOOL v10 = 0;
  }
  v11 = -[GEOPDResultRefinementMultiSelectElement metadata](v4);
  v12 = [(GEOResultRefinementMultiSelectElement *)self initWithDisplayName:v9 isSelected:v10 metadata:v11 elementType:v5 == 1 evChargingConnectorType:v7 selectionSequenceNumber:v8];

  return v12;
}

- (id)convertToGEOPDResultRefinementMultiSelectElement
{
  v3 = objc_alloc_init(GEOPDResultRefinementMultiSelectElement);
  v4 = [(GEOResultRefinementMultiSelectElement *)self displayName];
  -[GEOPDResultRefinementMultiSelectElement setDisplayName:]((uint64_t)v3, v4);

  BOOL v5 = [(GEOResultRefinementMultiSelectElement *)self isSelected];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 8u;
    v3->_isSelected = v5;
  }
  unsigned int v6 = [(GEOResultRefinementMultiSelectElement *)self metadata];
  -[GEOPDResultRefinementMultiSelectElement setMetadata:]((uint64_t)v3, v6);

  unint64_t v7 = [(GEOResultRefinementMultiSelectElement *)self elementType];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_elementType = v7 == 1;
  }
  int v8 = [(GEOResultRefinementMultiSelectElement *)self evChargingConnectorType] - 1;
  if (v8 > 8) {
    int v9 = 0;
  }
  else {
    int v9 = dword_18A6363C8[v8];
  }
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 2u;
    v3->_evChargingConnectorType = v9;
  }
  BOOL v10 = [(GEOResultRefinementMultiSelectElement *)self selectionSequenceNumber];

  if (v10)
  {
    v11 = [(GEOResultRefinementMultiSelectElement *)self selectionSequenceNumber];
    unsigned int v12 = [v11 unsignedIntValue];
    if (v3)
    {
      *(_WORD *)&v3->_flags |= 0x100u;
      *(_WORD *)&v3->_flags |= 4u;
      v3->_selectionSequenceNumber = v12;
    }
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

- (unint64_t)elementType
{
  return self->_elementType;
}

- (int)evChargingConnectorType
{
  return self->_evChargingConnectorType;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end