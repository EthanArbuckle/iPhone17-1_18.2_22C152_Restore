@interface _MPLazyTransformSectionedCollectionDataSource
- (MPSectionedCollection)collection;
- (_MPLazyTransformSectionedCollectionDataSource)initWithSectionedCollection:(id)a3 sectionTransform:(id)a4 itemTransform:(id)a5;
- (id)itemAtIndexPath:(id)a3;
- (id)itemTransform;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)sectionTransform;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation _MPLazyTransformSectionedCollectionDataSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemTransform, 0);
  objc_storeStrong(&self->_sectionTransform, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

- (id)itemTransform
{
  return self->_itemTransform;
}

- (id)sectionTransform
{
  return self->_sectionTransform;
}

- (MPSectionedCollection)collection
{
  return self->_collection;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  sectionTransform = (void (**)(id, void *, unint64_t))self->_sectionTransform;
  v5 = -[MPSectionedCollection sectionAtIndex:](self->_collection, "sectionAtIndex:");
  v6 = sectionTransform[2](sectionTransform, v5, a3);

  return v6;
}

- (unint64_t)numberOfSections
{
  return [(MPSectionedCollection *)self->_collection numberOfSections];
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return [(MPSectionedCollection *)self->_collection numberOfItemsInSection:a3];
}

- (id)itemAtIndexPath:(id)a3
{
  itemTransform = (void (**)(id, void *, id))self->_itemTransform;
  collection = self->_collection;
  id v5 = a3;
  v6 = [(MPSectionedCollection *)collection itemAtIndexPath:v5];
  v7 = itemTransform[2](itemTransform, v6, v5);

  return v7;
}

- (_MPLazyTransformSectionedCollectionDataSource)initWithSectionedCollection:(id)a3 sectionTransform:(id)a4 itemTransform:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MPLazyTransformSectionedCollectionDataSource;
  v12 = [(_MPLazyTransformSectionedCollectionDataSource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    uint64_t v14 = MEMORY[0x19971E0F0](v10);
    id sectionTransform = v13->_sectionTransform;
    v13->_id sectionTransform = (id)v14;

    uint64_t v16 = MEMORY[0x19971E0F0](v11);
    id itemTransform = v13->_itemTransform;
    v13->_id itemTransform = (id)v16;
  }
  return v13;
}

@end