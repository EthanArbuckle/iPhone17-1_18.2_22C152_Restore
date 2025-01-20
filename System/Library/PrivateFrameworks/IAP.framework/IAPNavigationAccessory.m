@interface IAPNavigationAccessory
- (BOOL)_wasFoundInLastUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestedSourceNameForAnyComponent;
- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent;
- (IAPNavigationAccessory)initWithDict:(id)a3;
- (NSSet)components;
- (id)description;
- (unint64_t)identifier;
- (void)setComponents:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)set_wasFoundInLastUpdate:(BOOL)a3;
@end

@implementation IAPNavigationAccessory

- (IAPNavigationAccessory)initWithDict:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IAPNavigationAccessory;
  v5 = [(IAPNavigationAccessory *)&v25 init];
  v6 = v5;
  if (v5)
  {
    v5->__wasFoundInLastUpdate = 0;
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    components = v6->_components;
    v6->_components = (NSSet *)v7;

    v9 = [v4 objectForKey:@"identifier"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if (v10) {
      v6->_identifier = v10;
    }
    v11 = [v4 objectForKey:@"components"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v22;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
              v18 = [IAPNavigationAccessoryComponent alloc];
              v19 = -[IAPNavigationAccessoryComponent initWithDict:](v18, "initWithDict:", v17, (void)v21);
              if (v19) {
                [(NSSet *)v6->_components addObject:v19];
              }

              ++v16;
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v14);
        }
      }
    }
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t identifier = self->_identifier;
    BOOL v6 = identifier == [v4 identifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IAPNavigationAccessory - identifier: %d, components: %@>", self->_identifier, self->_components];
}

- (BOOL)requestedSourceNameForAnyComponent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_components;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "requestSourceName", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_components;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "requestSourceSupportsRouteGuidance", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (NSSet)components
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponents:(id)a3
{
}

- (BOOL)_wasFoundInLastUpdate
{
  return self->__wasFoundInLastUpdate;
}

- (void)set_wasFoundInLastUpdate:(BOOL)a3
{
  self->__wasFoundInLastUpdate = a3;
}

- (void).cxx_destruct
{
}

@end