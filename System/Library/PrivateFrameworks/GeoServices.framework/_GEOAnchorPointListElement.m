@interface _GEOAnchorPointListElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInConjunctionWith:(id)a3;
- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3;
- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3 conjoinedWith:(id)a4;
- (_GEOAnchorPointListElement)initWithCoder:(id)a3;
- (id)debugDescription;
- (id)duplicateWithExistingAnchorPoint:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorPoint:(uint64_t)a1;
- (void)setConjunctElements:(uint64_t)a1;
- (void)updateWithSnappedAnchorPoint:(id)a3;
@end

@implementation _GEOAnchorPointListElement

- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3
{
  return [(_GEOAnchorPointListElement *)self initWithAnchorPoint:a3 conjoinedWith:0];
}

- (_GEOAnchorPointListElement)initWithAnchorPoint:(id)a3 conjoinedWith:(id)a4
{
  id v7 = a3;
  v8 = (id *)a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOAnchorPointListElement;
  v9 = [(_GEOAnchorPointListElement *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorPoint, a3);
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    elementID = v10->_elementID;
    v10->_elementID = (NSUUID *)v11;

    if (!v8 || (v13 = (NSMutableSet *)v8[3]) == 0)
    {
      v13 = [MEMORY[0x1E4F1CA80] set];
    }
    [(NSMutableSet *)v13 addObject:v10->_elementID];
    conjunctElements = v10->_conjunctElements;
    v10->_conjunctElements = v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqual:self->_anchorPoint];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(GEOComposedRouteAnchorPoint *)self->_anchorPoint hash];
}

- (id)duplicateWithExistingAnchorPoint:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 routeCoordinate];
    if (self)
    {
LABEL_3:
      anchorPoint = self->_anchorPoint;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v6 = 0xBF80000000000000;
    if (self) {
      goto LABEL_3;
    }
  }
  anchorPoint = 0;
LABEL_4:
  v8 = [(GEOComposedRouteAnchorPoint *)anchorPoint duplicateWithRouteCoordinate:v6];
  if (v5)
  {
    v9 = [v5 uniqueID];
    [v8 setUniqueID:v9];

    uint64_t v10 = [v5 anchorPointType];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v8 setAnchorPointType:v10];
  uint64_t v11 = [[_GEOAnchorPointListElement alloc] initWithAnchorPoint:v8 conjoinedWith:self];

  return v11;
}

- (BOOL)isInConjunctionWith:(id)a3
{
  id v4 = (uint64_t *)a3;
  char v5 = v4;
  if (!self)
  {
    conjunctElements = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  conjunctElements = self->_conjunctElements;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = v4[2];
LABEL_4:
  v8 = conjunctElements;
  char v9 = [(NSMutableSet *)v8 containsObject:v7];

  return v9;
}

- (void)updateWithSnappedAnchorPoint:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  anchorPoint = self->_anchorPoint;
  id v5 = a3;
  [v5 encodeObject:anchorPoint forKey:@"_anchorPoint"];
  [v5 encodeObject:self->_elementID forKey:@"_elementID"];
}

- (_GEOAnchorPointListElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOAnchorPointListElement;
  id v5 = [(_GEOAnchorPointListElement *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoint"];
    anchorPoint = v5->_anchorPoint;
    v5->_anchorPoint = (GEOComposedRouteAnchorPoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_elementID"];
    elementID = v5->_elementID;
    v5->_elementID = (NSUUID *)v8;

    uint64_t v10 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  [(GEOComposedRouteAnchorPoint *)self->_anchorPoint locationCoordinate];
  uint64_t v5 = v4;
  [(GEOComposedRouteAnchorPoint *)self->_anchorPoint locationCoordinate];
  uint64_t v7 = v6;
  uint64_t v8 = [(NSUUID *)self->_elementID UUIDString];
  char v9 = [v3 stringWithFormat:@"%f, %f | %@ | Conjunct elements: %d", v5, v7, v8, -[NSMutableSet count](self->_conjunctElements, "count")];

  return v9;
}

- (void)setAnchorPoint:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setConjunctElements:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conjunctElements, 0);
  objc_storeStrong((id *)&self->_elementID, 0);

  objc_storeStrong((id *)&self->_anchorPoint, 0);
}

@end