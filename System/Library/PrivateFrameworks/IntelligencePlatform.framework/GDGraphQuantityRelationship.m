@interface GDGraphQuantityRelationship
- (GDGraphQuantityRelationship)initWithQuantityField:(id)a3 allQuantityField:(id)a4;
- (NSArray)allQuantity;
- (NSString)quantity;
@end

@implementation GDGraphQuantityRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQuantity, 0);

  objc_storeStrong((id *)&self->_quantity, 0);
}

- (NSArray)allQuantity
{
  return self->_allQuantity;
}

- (NSString)quantity
{
  return self->_quantity;
}

- (GDGraphQuantityRelationship)initWithQuantityField:(id)a3 allQuantityField:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphQuantityRelationship;
  v9 = [(GDGraphQuantityRelationship *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_quantity, a3);
    objc_storeStrong((id *)&v10->_allQuantity, a4);
  }

  return v10;
}

@end