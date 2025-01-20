@interface GDKTSContextRepresentation
+ (BOOL)supportsSecureCoding;
- (GDKTSContextRepresentation)initWithCoder:(id)a3;
- (GDKTSContextRepresentation)initWithOriginContext:(id)a3 ktsContext:(id)a4 destinationContext:(id)a5;
- (NSArray)activities;
- (NSArray)destinationActivities;
- (NSArray)destinationContext;
- (NSArray)destinationPeople;
- (NSArray)destinationPlaces;
- (NSArray)ktsContext;
- (NSArray)originActivities;
- (NSArray)originContext;
- (NSArray)originPeople;
- (NSArray)originPlaces;
- (NSArray)people;
- (NSArray)places;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSContextRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContext, 0);
  objc_storeStrong((id *)&self->_ktsContext, 0);
  objc_storeStrong((id *)&self->_originContext, 0);
  objc_storeStrong((id *)&self->places, 0);
  objc_storeStrong((id *)&self->people, 0);
  objc_storeStrong((id *)&self->originPlaces, 0);
  objc_storeStrong((id *)&self->originPeople, 0);
  objc_storeStrong((id *)&self->originActivities, 0);
  objc_storeStrong((id *)&self->destinationPlaces, 0);
  objc_storeStrong((id *)&self->destinationPeople, 0);
  objc_storeStrong((id *)&self->destinationActivities, 0);

  objc_storeStrong((id *)&self->activities, 0);
}

- (NSArray)destinationContext
{
  return self->_destinationContext;
}

- (NSArray)ktsContext
{
  return self->_ktsContext;
}

- (NSArray)originContext
{
  return self->_originContext;
}

- (NSArray)places
{
  return self->places;
}

- (NSArray)people
{
  return self->people;
}

- (NSArray)originPlaces
{
  return self->originPlaces;
}

- (NSArray)originPeople
{
  return self->originPeople;
}

- (NSArray)originActivities
{
  return self->originActivities;
}

- (NSArray)destinationPlaces
{
  return self->destinationPlaces;
}

- (NSArray)destinationPeople
{
  return self->destinationPeople;
}

- (NSArray)destinationActivities
{
  return self->destinationActivities;
}

- (NSArray)activities
{
  return self->activities;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(GDKTSContextRepresentation, a2, (uint64_t)a3, v3, v4);
  originContext = self->_originContext;
  ktsContext = self->_ktsContext;
  destinationContext = self->_destinationContext;

  return (id)objc_msgSend_initWithOriginContext_ktsContext_destinationContext_(v6, v7, (uint64_t)originContext, (uint64_t)ktsContext, (uint64_t)destinationContext);
}

- (GDKTSContextRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_originContext);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_ktsContext);
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11, v13);

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_destinationContext);
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16, v18);

  v21 = (GDKTSContextRepresentation *)objc_msgSend_initWithOriginContext_ktsContext_destinationContext_(self, v20, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  originContext = self->_originContext;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_originContext);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)originContext, (uint64_t)v6, v8);

  ktsContext = self->_ktsContext;
  uint64_t v10 = NSStringFromSelector(sel_ktsContext);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)ktsContext, (uint64_t)v10, v12);

  destinationContext = self->_destinationContext;
  NSStringFromSelector(sel_destinationContext);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)destinationContext, (uint64_t)v16, v15);
}

- (GDKTSContextRepresentation)initWithOriginContext:(id)a3 ktsContext:(id)a4 destinationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDKTSContextRepresentation;
  uint64_t v15 = [(GDKTSContextRepresentation *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    originContext = v15->_originContext;
    v15->_originContext = (NSArray *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    ktsContext = v15->_ktsContext;
    v15->_ktsContext = (NSArray *)v22;

    uint64_t v28 = objc_msgSend_copy(v10, v24, v25, v26, v27);
    destinationContext = v15->_destinationContext;
    v15->_destinationContext = (NSArray *)v28;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end