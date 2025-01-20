@interface CKOrganicImageLayoutRecipe
- (BOOL)isLastItem;
- (BOOL)wantsShadow;
- (CGSize)targetSize;
- (CKOrganicImageLayoutRecipe)initWithRotation:(double)a3 offset:(double)a4 targetSize:(CGSize)a5 overlap:(double)a6 wantsShadow:(BOOL)a7 groupIdentifier:(id)a8;
- (NSNumber)groupMaxX;
- (NSNumber)relativeGroupCenter;
- (NSString)groupIdentifier;
- (double)offset;
- (double)overlap;
- (double)rotation;
- (id)description;
- (void)setGroupIdentifier:(id)a3;
- (void)setGroupMaxX:(id)a3;
- (void)setIsLastItem:(BOOL)a3;
- (void)setOffset:(double)a3;
- (void)setOverlap:(double)a3;
- (void)setRelativeGroupCenter:(id)a3;
- (void)setRotation:(double)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setWantsShadow:(BOOL)a3;
@end

@implementation CKOrganicImageLayoutRecipe

- (CKOrganicImageLayoutRecipe)initWithRotation:(double)a3 offset:(double)a4 targetSize:(CGSize)a5 overlap:(double)a6 wantsShadow:(BOOL)a7 groupIdentifier:(id)a8
{
  BOOL v8 = a7;
  double height = a5.height;
  double width = a5.width;
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)CKOrganicImageLayoutRecipe;
  v16 = [(CKOrganicImageLayoutRecipe *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(CKOrganicImageLayoutRecipe *)v16 setRotation:a3];
    [(CKOrganicImageLayoutRecipe *)v17 setOffset:a4];
    -[CKOrganicImageLayoutRecipe setTargetSize:](v17, "setTargetSize:", width, height);
    [(CKOrganicImageLayoutRecipe *)v17 setOverlap:a6];
    [(CKOrganicImageLayoutRecipe *)v17 setWantsShadow:v8];
    [(CKOrganicImageLayoutRecipe *)v17 setGroupIdentifier:v15];
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  [(CKOrganicImageLayoutRecipe *)self rotation];
  uint64_t v5 = v4;
  [(CKOrganicImageLayoutRecipe *)self offset];
  uint64_t v7 = v6;
  BOOL v8 = [(CKOrganicImageLayoutRecipe *)self relativeGroupCenter];
  [v8 doubleValue];
  uint64_t v10 = v9;
  v11 = [(CKOrganicImageLayoutRecipe *)self groupIdentifier];
  BOOL v12 = [(CKOrganicImageLayoutRecipe *)self isLastItem];
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  v14 = [v3 stringWithFormat:@"<%p> rotation %f offset %f relativeGroupCenter %f groupIdentifier %@ isLastItem %@", self, v5, v7, v10, v11, v13];

  return v14;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (BOOL)wantsShadow
{
  return self->_wantsShadow;
}

- (void)setWantsShadow:(BOOL)a3
{
  self->_wantsShadow = a3;
}

- (NSNumber)relativeGroupCenter
{
  return self->_relativeGroupCenter;
}

- (void)setRelativeGroupCenter:(id)a3
{
}

- (NSNumber)groupMaxX
{
  return self->_groupMaxX;
}

- (void)setGroupMaxX:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (BOOL)isLastItem
{
  return self->_isLastItem;
}

- (void)setIsLastItem:(BOOL)a3
{
  self->_isLastItem = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (double)overlap
{
  return self->_overlap;
}

- (void)setOverlap:(double)a3
{
  self->_overlap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupMaxX, 0);

  objc_storeStrong((id *)&self->_relativeGroupCenter, 0);
}

@end