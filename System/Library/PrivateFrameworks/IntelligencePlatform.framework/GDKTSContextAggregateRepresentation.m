@interface GDKTSContextAggregateRepresentation
+ (BOOL)supportsSecureCoding;
- (GDKTSContextAggregateRepresentation)initWithCoder:(id)a3;
- (GDKTSContextAggregateRepresentation)initWithOriginContexts:(id)a3 ktsContexts:(id)a4 destinationContexts:(id)a5;
- (NSArray)activities;
- (NSArray)destinationActivities;
- (NSArray)destinationContexts;
- (NSArray)destinationPeople;
- (NSArray)destinationPlaces;
- (NSArray)ktsContexts;
- (NSArray)originActivities;
- (NSArray)originContexts;
- (NSArray)originPeople;
- (NSArray)originPlaces;
- (NSArray)people;
- (NSArray)places;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSContextAggregateRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationContexts, 0);
  objc_storeStrong((id *)&self->_ktsContexts, 0);
  objc_storeStrong((id *)&self->_originContexts, 0);
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

- (NSArray)destinationContexts
{
  return self->_destinationContexts;
}

- (NSArray)ktsContexts
{
  return self->_ktsContexts;
}

- (NSArray)originContexts
{
  return self->_originContexts;
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
  v6 = objc_msgSend_allocWithZone_(GDKTSContextAggregateRepresentation, a2, (uint64_t)a3, v3, v4);
  originContexts = self->_originContexts;
  ktsContexts = self->_ktsContexts;
  destinationContexts = self->_destinationContexts;

  return (id)objc_msgSend_initWithOriginContexts_ktsContexts_destinationContexts_(v6, v7, (uint64_t)originContexts, (uint64_t)ktsContexts, (uint64_t)destinationContexts);
}

- (GDKTSContextAggregateRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_originContexts);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_ktsContexts);
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11, v13);

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_destinationContexts);
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16, v18);

  v21 = (GDKTSContextAggregateRepresentation *)objc_msgSend_initWithOriginContexts_ktsContexts_destinationContexts_(self, v20, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  originContexts = self->_originContexts;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_originContexts);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)originContexts, (uint64_t)v6, v8);

  ktsContexts = self->_ktsContexts;
  uint64_t v10 = NSStringFromSelector(sel_ktsContexts);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)ktsContexts, (uint64_t)v10, v12);

  destinationContexts = self->_destinationContexts;
  NSStringFromSelector(sel_destinationContexts);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)destinationContexts, (uint64_t)v16, v15);
}

- (GDKTSContextAggregateRepresentation)initWithOriginContexts:(id)a3 ktsContexts:(id)a4 destinationContexts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDKTSContextAggregateRepresentation;
  uint64_t v15 = [(GDKTSContextAggregateRepresentation *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    originContexts = v15->_originContexts;
    v15->_originContexts = (NSArray *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    ktsContexts = v15->_ktsContexts;
    v15->_ktsContexts = (NSArray *)v22;

    uint64_t v28 = objc_msgSend_copy(v10, v24, v25, v26, v27);
    destinationContexts = v15->_destinationContexts;
    v15->_destinationContexts = (NSArray *)v28;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end