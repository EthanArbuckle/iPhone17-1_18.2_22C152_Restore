@interface IKCollectionElement
+ (id)supportedFeaturesForElementName:(id)a3;
- (IKAppBrowserBridge)browserBridge;
- (IKCollectionElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (IKHeaderElement)header;
- (NSArray)sections;
- (id)applyUpdatesWithElement:(id)a3;
- (void)appDocumentDidMarkStylesDirty;
@end

@implementation IKCollectionElement

- (id)applyUpdatesWithElement:(id)a3
{
  sections = self->_sections;
  self->_sections = 0;
  id v5 = a3;

  v8.receiver = self;
  v8.super_class = (Class)IKCollectionElement;
  v6 = [(IKViewElement *)&v8 applyUpdatesWithElement:v5];

  return v6;
}

- (IKHeaderElement)header
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(IKViewElement *)self children];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_super v8 = [v7 elementName];
        int v9 = [v8 isEqualToString:@"header"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (IKHeaderElement *)v10;
}

- (NSArray)sections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  sections = self->_sections;
  if (!sections)
  {
    location = (id *)&self->_sections;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v3 = [(IKViewElement *)self children];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v10 = [v9 elementName];
          int v11 = [v10 isEqualToString:@"section"];

          if (v11)
          {
            if (!v6)
            {
              v6 = [MEMORY[0x1E4F1CA48] array];
            }
            [v6 addObject:v9];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    if ([v6 count]) {
      long long v12 = v6;
    }
    else {
      long long v12 = 0;
    }
    objc_storeStrong(location, v12);

    sections = (NSArray *)*location;
  }
  return sections;
}

- (void)appDocumentDidMarkStylesDirty
{
  v4.receiver = self;
  v4.super_class = (Class)IKCollectionElement;
  [(IKViewElement *)&v4 appDocumentDidMarkStylesDirty];
  if ([(IKViewElement *)self updateType] >= 3)
  {
    sections = self->_sections;
    self->_sections = 0;
  }
}

+ (id)supportedFeaturesForElementName:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"shelf"])
  {
    v9[0] = @"Browser";
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___IKCollectionElement;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel_supportedFeaturesForElementName_, v4);
  }
  v6 = (void *)v5;

  return v6;
}

- (IKCollectionElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)IKCollectionElement;
  uint64_t v5 = [(IKViewElement *)&v11 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(IKViewElement *)v5 features];
    uint64_t v8 = [v7 firstObject];
    browserBridge = v6->_browserBridge;
    v6->_browserBridge = (IKAppBrowserBridge *)v8;
  }
  return v6;
}

- (IKAppBrowserBridge)browserBridge
{
  return self->_browserBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserBridge, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end