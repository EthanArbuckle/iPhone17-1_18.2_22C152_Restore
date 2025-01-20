@interface ACCMediaLibraryUpdatePlaylistContent
- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5;
- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 revision:(id)a4 dict:(id)a5;
- (NSMutableArray)contentList;
- (NSString)mediaLibraryUID;
- (NSString)revision;
- (id)copyContentDictList;
- (id)copyContentList;
- (id)copyDict;
- (id)debugDescription;
- (id)description;
- (id)getContentItemAtIndex:(unint64_t)a3;
- (int)contentStyle;
- (unint64_t)contentListCount;
- (unint64_t)persistentID;
- (void)addContentItem:(id)a3;
- (void)addContentPersistentID:(unint64_t)a3;
- (void)iterateContentItems:(id)a3;
- (void)iterateContentPersistentIDs:(id)a3;
- (void)replaceContentItem:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceContentList:(id)a3;
- (void)replaceContentPersistentID:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setContentList:(id)a3;
- (void)setContentStyle:(int)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setRevision:(id)a3;
@end

@implementation ACCMediaLibraryUpdatePlaylistContent

- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACCMediaLibraryUpdatePlaylistContent;
  v11 = [(ACCMediaLibraryUpdatePlaylistContent *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_contentStyle = 0;
    contentList = v12->_contentList;
    v12->_persistentID = a4;
    v12->_contentList = 0;
  }
  return v12;
}

- (ACCMediaLibraryUpdatePlaylistContent)initWithMediaLibrary:(id)a3 revision:(id)a4 dict:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ACCMediaLibraryUpdatePlaylistContent;
  v12 = [(ACCMediaLibraryUpdatePlaylistContent *)&v47 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v13->_revision, a4);
    contentList = v13->_contentList;
    v13->_persistentID = 0;
    v13->_contentList = 0;
    v13->_int contentStyle = 0;

    objc_super v15 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];

    if (v15)
    {
      v16 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];
      v13->_persistentID = [v16 unsignedLongLongValue];
    }
    v17 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];

    if (v17)
    {
      v18 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
      v13->_int contentStyle = [v18 unsignedCharValue];
    }
    v19 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistItemList"];

    if (v19)
    {
      v20 = [v11 objectForKey:@"ACCMediaLibraryUpdatePlaylistItemList"];
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v20, "count"));
      v22 = v13->_contentList;
      v13->_contentList = (NSMutableArray *)v21;

      int contentStyle = v13->_contentStyle;
      if (contentStyle == 2)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v29 = v20;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          v37 = v20;
          id v38 = v10;
          v32 = 0;
          uint64_t v33 = *(void *)v40;
          do
          {
            uint64_t v34 = 0;
            v35 = v32;
            do
            {
              if (*(void *)v40 != v33) {
                objc_enumerationMutation(v29);
              }
              v32 = [[ACCMediaLibraryUpdatePlaylistContentItem alloc] initWithMediaLibrary:v9 playlistPersistentID:v13->_persistentID dict:*(void *)(*((void *)&v39 + 1) + 8 * v34)];

              [(NSMutableArray *)v13->_contentList addObject:v32];
              ++v34;
              v35 = v32;
            }
            while (v31 != v34);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v31);

          v20 = v37;
          id v10 = v38;
        }
      }
      else
      {
        if (contentStyle != 1)
        {
LABEL_26:

          goto LABEL_27;
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v24 = v20;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v24);
              }
              [(NSMutableArray *)v13->_contentList addObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v49 count:16];
          }
          while (v26);
        }
      }

      goto LABEL_26;
    }
  }
LABEL_27:

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryUpdatePlaylistContent>[%@:%llu revision=%@ style=%d count=%lu]", self->_mediaLibraryUID, self->_persistentID, self->_revision, self->_contentStyle, -[ACCMediaLibraryUpdatePlaylistContent contentListCount](self, "contentListCount")];
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(ACCMediaLibraryUpdatePlaylistContent *)self description];
  v5 = [v3 stringWithFormat:@"%@\n    %@", v4, self->_contentList];

  return v5;
}

- (id)copyDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_mediaLibraryUID forKey:@"ACCMediaLibraryUIDKey"];
  [v3 setObject:self->_revision forKey:@"ACCMediaLibraryUpdateRevisionKey"];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_persistentID];
  [v3 setObject:v4 forKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];

  if ((self->_contentStyle - 1) <= 2)
  {
    v5 = [NSNumber numberWithUnsignedChar:self->_contentStyle];
    [v3 setObject:v5 forKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
  }
  id v6 = [(ACCMediaLibraryUpdatePlaylistContent *)self copyContentDictList];
  if (v6) {
    [v3 setObject:v6 forKey:@"ACCMediaLibraryUpdatePlaylistItemList"];
  }

  return v3;
}

- (id)copyContentDictList
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  contentList = self->_contentList;
  if (!contentList || ![(NSMutableArray *)contentList count]) {
    return 0;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_contentList, "count"));
  if (self->_contentStyle == 1)
  {
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    v5 = self->_contentList;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    v5 = self->_contentList;
    uint64_t v10 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v5);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "copyNSRepresentation:", self->_contentStyle, (void)v16);
          [v4 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }

  return v4;
}

- (id)copyContentList
{
  contentList = self->_contentList;
  id v3 = (objc_class *)MEMORY[0x263EFF8C0];
  if (contentList)
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return objc_alloc_init(v3);
  }
}

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setRevision:(id)a3
{
}

- (void)setPersistentID:(unint64_t)a3
{
  self->_persistentID = a3;
}

- (void)setContentStyle:(int)a3
{
  self->_int contentStyle = a3;
}

- (unint64_t)contentListCount
{
  return [(NSMutableArray *)self->_contentList count];
}

- (void)replaceContentList:(id)a3
{
  self->_contentList = [MEMORY[0x263EFF980] arrayWithArray:a3];

  MEMORY[0x270F9A758]();
}

- (void)addContentItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contentStyle != 1)
  {
    contentList = self->_contentList;
    id v9 = v5;
    if (!contentList)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v8 = self->_contentList;
      self->_contentList = v7;

      contentList = self->_contentList;
    }
    id v4 = (id)[(NSMutableArray *)contentList addObject:v9];
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)addContentPersistentID:(unint64_t)a3
{
  if (self->_contentStyle == 1)
  {
    contentList = self->_contentList;
    if (!contentList)
    {
      uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v7 = self->_contentList;
      self->_contentList = v6;

      contentList = self->_contentList;
    }
    id v8 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableArray *)contentList addObject:v8];
  }
}

- (void)replaceContentItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_contentStyle != 1)
  {
    contentList = self->_contentList;
    id v11 = v7;
    if (!contentList)
    {
      id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v10 = self->_contentList;
      self->_contentList = v9;

      contentList = self->_contentList;
    }
    id v6 = (id)[(NSMutableArray *)contentList replaceObjectAtIndex:a4 withObject:v11];
    id v7 = v11;
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (void)replaceContentPersistentID:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (self->_contentStyle == 1)
  {
    contentList = self->_contentList;
    if (!contentList)
    {
      id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v9 = self->_contentList;
      self->_contentList = v8;

      contentList = self->_contentList;
    }
    id v10 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableArray *)contentList replaceObjectAtIndex:a4 withObject:v10];
  }
}

- (id)getContentItemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentList objectAtIndex:a3];
}

- (void)iterateContentItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (self->_contentStyle != 1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_contentList;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)iterateContentPersistentIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  if (self->_contentStyle == 1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_contentList;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "unsignedLongLongValue", (void)v10));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (int)contentStyle
{
  return self->_contentStyle;
}

- (NSMutableArray)contentList
{
  return self->_contentList;
}

- (void)setContentList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentList, 0);
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end