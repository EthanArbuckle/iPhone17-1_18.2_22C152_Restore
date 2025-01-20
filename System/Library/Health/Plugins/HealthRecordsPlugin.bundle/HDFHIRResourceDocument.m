@interface HDFHIRResourceDocument
- (NSArray)resourceObjects;
- (id)_dictionaryRepresentationWithResourceHandler:(id)a3;
- (id)dictionaryRepresentation;
- (void)addResourceObjects:(id)a3;
@end

@implementation HDFHIRResourceDocument

- (NSArray)resourceObjects
{
  id v2 = [(NSMutableArray *)self->_resourceObjects copy];

  return (NSArray *)v2;
}

- (void)addResourceObjects:(id)a3
{
  resourceObjects = self->_resourceObjects;
  if (resourceObjects)
  {
    [(NSMutableArray *)resourceObjects addObjectsFromArray:a3];
  }
  else
  {
    self->_resourceObjects = (NSMutableArray *)[a3 mutableCopy];
    _objc_release_x1();
  }
}

- (id)dictionaryRepresentation
{
  return [(HDFHIRResourceDocument *)self _dictionaryRepresentationWithResourceHandler:&stru_1127B0];
}

- (id)_dictionaryRepresentationWithResourceHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_resourceObjects;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "identifier", (void)v17);
        v13 = [v12 resourceType];

        if (v13)
        {
          v14 = [v5 objectForKeyedSubscript:v13];
          if (!v14)
          {
            v14 = +[NSMutableArray array];
            [v5 setObject:v14 forKeyedSubscript:v13];
          }
          v15 = v4[2](v4, v11);
          [v14 addObject:v15];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end