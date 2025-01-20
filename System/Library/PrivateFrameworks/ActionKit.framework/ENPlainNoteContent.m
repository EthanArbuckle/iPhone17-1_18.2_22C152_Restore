@interface ENPlainNoteContent
- (ENPlainNoteContent)initWithContents:(id)a3;
- (ENPlainNoteContent)initWithString:(id)a3;
- (NSArray)contents;
- (id)enmlWithNote:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation ENPlainNoteContent

- (void).cxx_destruct
{
}

- (void)setContents:(id)a3
{
}

- (NSArray)contents
{
  return self->_contents;
}

- (id)enmlWithNote:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v30 = a3;
  v29 = [MEMORY[0x263EFF980] array];
  v4 = objc_alloc_init(ENMLWriter);
  [(ENMLWriter *)v4 startDocument];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = [(ENPlainNoteContent *)self contents];
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    uint64_t v31 = *(void *)v43;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v11 = [v10 componentsSeparatedByString:@"\n"];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v39 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                [(ENXMLWriter *)v4 startElement:@"div"];
                if ([v16 length]) {
                  [(ENXMLWriter *)v4 writeString:v16];
                }
                else {
                  [(ENXMLWriter *)v4 writeElement:@"br" attributes:0 content:0];
                }
                [(ENXMLWriter *)v4 endElement];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }
            while (v13);
          }

          uint64_t v7 = v31;
          uint64_t v6 = v32;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v6);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v17 = [v30 resources];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v23 = [v22 dataHash];
        v24 = [v22 mimeType];
        [(ENMLWriter *)v4 writeResourceWithDataHash:v23 mime:v24 attributes:0];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v19);
  }

  [(ENMLWriter *)v4 endDocument];
  if ([v29 count])
  {
    v25 = [v30 resources];
    v26 = [v25 arrayByAddingObjectsFromArray:v29];
    [v30 setResources:v26];
  }
  v27 = [(ENXMLWriter *)v4 contents];

  return v27;
}

- (ENPlainNoteContent)initWithContents:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPlainNoteContent;
  uint64_t v5 = [(ENPlainNoteContent *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(ENPlainNoteContent *)v5 setContents:v4];
  }

  return v6;
}

- (ENPlainNoteContent)initWithString:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPlainNoteContent;
  uint64_t v5 = [(ENPlainNoteContent *)&v8 init];
  if (v5)
  {
    v9[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [(ENPlainNoteContent *)v5 setContents:v6];
  }
  return v5;
}

@end