@interface _MPCPlayerResponseTracklistDisplayDataSource
- (MPSectionedCollection)items;
- (NSArray)sections;
- (NSDictionary)sectionRanges;
- (NSIndexPath)playingItemIndexPath;
- (_MPCPlayerResponseTracklistDisplayDataSource)initWithResponse:(id)a3 tracklistItems:(id)a4 playingItemIndexPath:(id)a5 tailInsertionContentItemID:(id)a6;
- (id)displayIndexPathForStructuredIndexPath:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (id)structuredIndexPathForDisplayIndexPath:(id)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
@end

@implementation _MPCPlayerResponseTracklistDisplayDataSource

- (_MPCPlayerResponseTracklistDisplayDataSource)initWithResponse:(id)a3 tracklistItems:(id)a4 playingItemIndexPath:(id)a5 tailInsertionContentItemID:(id)a6
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v94.receiver = self;
  v94.super_class = (Class)_MPCPlayerResponseTracklistDisplayDataSource;
  v15 = [(_MPCPlayerResponseTracklistDisplayDataSource *)&v94 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_items, a4);
    uint64_t v17 = [v13 copy];
    playingItemIndexPath = v16->_playingItemIndexPath;
    v16->_playingItemIndexPath = (NSIndexPath *)v17;

    v19 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    v20 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
    if (!v13 || (v83 = a2, uint64_t v21 = [v12 globalIndexForIndexPath:v13], v21 == 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v22 = v21;
    v80 = v16;
    if (v21 >= 1)
    {
      v93[0] = 0;
      v93[1] = v21;
      v23 = [MEMORY[0x263F08D40] valueWithBytes:v93 objCType:"{_MSVSignedRange=qq}"];
      [(NSDictionary *)v20 setObject:v23 forKeyedSubscript:@"MPCPlayerResponseTracklistDisplaySectionPreviousItems"];

      [v19 addObject:@"MPCPlayerResponseTracklistDisplaySectionPreviousItems"];
    }
    v24 = [v11 builder];
    v25 = [v11 chain];
    v79 = [v24 playerItemContentID:0 atIndexPath:v13 chain:v25];

    uint64_t v77 = v22;
    v92[0] = v22;
    v92[1] = 1;
    v26 = [MEMORY[0x263F08D40] valueWithBytes:v92 objCType:"{_MSVSignedRange=qq}"];
    [(NSDictionary *)v20 setObject:v26 forKeyedSubscript:@"MPCPlayerResponseTracklistDisplaySectionPlayingItem"];

    v82 = v19;
    [v19 addObject:@"MPCPlayerResponseTracklistDisplaySectionPlayingItem"];
    uint64_t v27 = [v12 totalItemCount];
    id v81 = v12;
    uint64_t v84 = v27;
    id v75 = v14;
    id v76 = v13;
    if (v14)
    {
      id v28 = v79;
      if (v28 == v14)
      {
      }
      else
      {
        v29 = v28;
        char v30 = [v28 isEqual:v14];

        if ((v30 & 1) == 0)
        {
          uint64_t v31 = v22 + 1;
          if (v22 + 1 >= v27) {
            goto LABEL_54;
          }
          uint64_t v32 = v22 + 1;
          while (1)
          {
            v33 = [v11 builder];
            v34 = [v12 indexPathForGlobalIndex:v32];
            v35 = [v11 chain];
            v36 = [v33 playerItemContentID:0 atIndexPath:v34 chain:v35];

            id v37 = v36;
            if (v37 == v14) {
              break;
            }
            v38 = v37;
            char v39 = [v14 isEqual:v37];

            uint64_t v27 = v84;
            if (v39) {
              goto LABEL_53;
            }
            if (v84 == ++v32) {
              goto LABEL_54;
            }
          }

          uint64_t v27 = v84;
LABEL_53:
          if (v32 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_54:
          }
            uint64_t v32 = v27 - 1;
          v91[0] = v31;
          v91[1] = v32 - v77;
          v71 = [MEMORY[0x263F08D40] valueWithBytes:v91 objCType:"{_MSVSignedRange=qq}"];
          [(NSDictionary *)v20 setObject:v71 forKeyedSubscript:@"MPCPlayerResponseTracklistDisplaySectionUpNextItems"];

          [v82 addObject:@"MPCPlayerResponseTracklistDisplaySectionUpNextItems"];
          uint64_t v40 = v32;
          goto LABEL_17;
        }
      }
    }
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v40 = v22;
LABEL_17:
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v78 = v40 + 1;
    if (v40 + 1 < v27)
    {
      uint64_t v42 = v40 + 1;
      do
      {
        v43 = [v12 indexPathForGlobalIndex:v42];
        uint64_t v44 = objc_msgSend(v43, "msv_section");

        v45 = [v11 builder];
        v46 = [v11 chain];
        LODWORD(v44) = [v45 sectionIsAutoPlaySection:0 atIndex:v44 chain:v46];

        uint64_t v27 = v84;
        if (v44) {
          uint64_t v47 = v42;
        }
        else {
          uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v41 = v47;
        }
        ++v42;
      }
      while (v84 != v42);
    }
    uint64_t v48 = v27 - 1;
    if (v27 - 1 != v32)
    {
      if (v41 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v48 = v41 - 1;
      }
      uint64_t v49 = v48 - v78;
      if (v49 >= 0)
      {
        v90[0] = v78;
        v90[1] = v49 + 1;
        v50 = [MEMORY[0x263F08D40] valueWithBytes:v90 objCType:"{_MSVSignedRange=qq}"];
        [(NSDictionary *)v20 setObject:v50 forKeyedSubscript:@"MPCPlayerResponseTracklistDisplaySectionNextItems"];

        [v82 addObject:@"MPCPlayerResponseTracklistDisplaySectionNextItems"];
      }
    }
    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v89[0] = v41;
      v89[1] = v27 - v41;
      v51 = [MEMORY[0x263F08D40] valueWithBytes:v89 objCType:"{_MSVSignedRange=qq}"];
      [(NSDictionary *)v20 setObject:v51 forKeyedSubscript:@"MPCPlayerResponseTracklistDisplaySectionAutoPlayItems"];

      [v82 addObject:@"MPCPlayerResponseTracklistDisplaySectionAutoPlayItems"];
    }
    uint64_t v52 = [v82 count];
    if (v52 != [(NSDictionary *)v20 count])
    {
      v72 = [MEMORY[0x263F08690] currentHandler];
      [v72 handleFailureInMethod:v83, v80, @"MPCPlayerResponseTracklist.m", 639, @"Count mismatch: sections=%@ sectionRangeMap=%@", v82, v20 object file lineNumber description];
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v53 = v82;
    uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v85 objects:v95 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = 0;
      uint64_t v57 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v86 != v57) {
            objc_enumerationMutation(v53);
          }
          uint64_t v59 = *(void *)(*((void *)&v85 + 1) + 8 * i);
          v60 = [(NSDictionary *)v20 objectForKeyedSubscript:v59];
          if (!v60)
          {
            v64 = [MEMORY[0x263F08690] currentHandler];
            [v64 handleFailureInMethod:v83, v80, @"MPCPlayerResponseTracklist.m", 643, @"Missing section range for section: %@", v59 object file lineNumber description];
          }
          uint64_t v61 = [v60 signedRangeValue];
          uint64_t v63 = v62;
          if (v61 != v56)
          {
            uint64_t v65 = v61;
            [MEMORY[0x263F08690] currentHandler];
            v66 = uint64_t v74 = v65;
            objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, @"MPCPlayerResponseTracklist.m", 645, @"Non-contiguous range detected: location=%ld expectedLocation=%ld", v74, v56);
          }
          v56 += v63;
        }
        uint64_t v55 = [(NSArray *)v53 countByEnumeratingWithState:&v85 objects:v95 count:16];
      }
      while (v55);
    }
    else
    {
      uint64_t v56 = 0;
    }

    v16 = v80;
    if (v56 != v84)
    {
      v73 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v83, v80, @"MPCPlayerResponseTracklist.m", 648, @"sectionRangeMap does not include all items: sectionRangesCount=%ld / items.totalItemCount=%ld", v56, v84);
    }
    sections = v80->_sections;
    v80->_sections = v53;
    v68 = v53;

    sectionRanges = v80->_sectionRanges;
    v80->_sectionRanges = v20;

    v20 = (NSDictionary *)v68;
    id v12 = v81;
    id v14 = v75;
    id v13 = v76;
    v19 = v79;
    goto LABEL_50;
  }
LABEL_51:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionRanges, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (NSDictionary)sectionRanges
{
  return self->_sectionRanges;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (MPSectionedCollection)items
{
  return self->_items;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sectionRanges];

  if (v5)
  {
    v6 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self structuredIndexPathForDisplayIndexPath:v4];
    v7 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self items];
    v8 = [v7 itemAtIndexPath:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  v5 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sectionRanges];

  if (!v5) {
    return 0;
  }
  v6 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sectionRanges];
  v7 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
  v8 = [v7 objectAtIndexedSubscript:a3];
  v9 = [v6 objectForKeyedSubscript:v8];
  [v9 signedRangeValue];
  unint64_t v11 = v10;

  return v11;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v5 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];

  if (v5)
  {
    v6 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
    v7 = [v6 objectAtIndexedSubscript:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfSections
{
  v3 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];

  if (!v3) {
    return 0;
  }
  id v4 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)displayIndexPathForStructuredIndexPath:(id)a3
{
  id v5 = a3;
  v6 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self items];
  uint64_t v7 = [v6 globalIndexForIndexPath:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"MPCPlayerResponseTracklist.m", 667, @"structureIndexPath did not produce a valid global index: %@", v5 object file lineNumber description];
  }
  SEL v27 = a2;
  v8 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
  uint64_t v9 = [v8 count];

  if (!v9) {
    goto LABEL_10;
  }
  id v26 = v5;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  do
  {
    id v12 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sectionRanges];
    id v13 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
    id v14 = [v13 objectAtIndexedSubscript:v10];
    v15 = [v12 objectForKeyedSubscript:v14];
    uint64_t v16 = [v15 signedRangeValue];
    uint64_t v18 = v17;

    uint64_t v19 = v7 - v16;
    if (v7 >= v16 && v19 < v18)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:");

      unint64_t v11 = (void *)v20;
    }
    ++v10;
    uint64_t v21 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
    unint64_t v22 = [v21 count];
  }
  while (v10 < v22);
  id v5 = v26;
  if (!v11)
  {
LABEL_10:
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:v27, self, @"MPCPlayerResponseTracklist.m", 683, @"Could not find a displayIndexPath for structuredIndexPath: %@", v5 object file lineNumber description];

    unint64_t v11 = 0;
  }

  return v11;
}

- (id)structuredIndexPathForDisplayIndexPath:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 section];
  if (v6 >= [(_MPCPlayerResponseTracklistDisplayDataSource *)self numberOfSections])
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_MPCPlayerResponseTracklistDisplayDataSource numberOfSections](self, "numberOfSections"));
    [v17 handleFailureInMethod:a2, self, @"MPCPlayerResponseTracklist.m", 656, @"Provided display index path is out of bounds for this collection: %@ (section count %@)", v5, v18 object file lineNumber description];
  }
  unint64_t v7 = [v5 item];
  if (v7 >= -[_MPCPlayerResponseTracklistDisplayDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", [v5 section]))
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_MPCPlayerResponseTracklistDisplayDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v5, "section")));
    [v19 handleFailureInMethod:a2, self, @"MPCPlayerResponseTracklist.m", 657, @"Provided display index path is out of bounds for this collection: %@ (item count %@)", v5, v20 object file lineNumber description];
  }
  v8 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sectionRanges];
  uint64_t v9 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self sections];
  unint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  unint64_t v11 = [v8 objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 signedRangeValue];

  uint64_t v13 = [v5 item] + v12;
  id v14 = [(_MPCPlayerResponseTracklistDisplayDataSource *)self items];
  v15 = [v14 indexPathForGlobalIndex:v13];

  return v15;
}

@end