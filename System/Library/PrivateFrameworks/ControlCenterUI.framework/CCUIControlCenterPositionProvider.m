@interface CCUIControlCenterPositionProvider
- (CCUIControlCenterPositionProvider)initWithPackingRules:(id)a3;
- (CCUILayoutRect)layoutRectForIdentifier:(SEL)a3;
- (CCUILayoutSize)layoutSize;
- (CCUILayoutSize)maximumLayoutSize;
- (id)_generateRectByIdentifierWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4 packingOrder:(unint64_t)a5 startPosition:(CCUILayoutPoint)a6 maximumSize:(CCUILayoutSize)a7 outputLayoutSize:(CCUILayoutSize *)a8;
- (void)regenerateRectsWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4;
@end

@implementation CCUIControlCenterPositionProvider

- (CCUIControlCenterPositionProvider)initWithPackingRules:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUIControlCenterPositionProvider;
  v5 = [(CCUIControlCenterPositionProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    packingRules = v5->_packingRules;
    v5->_packingRules = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rectByIdentifier = v5->_rectByIdentifier;
    v5->_rectByIdentifier = v8;
  }
  return v5;
}

- (CCUILayoutSize)maximumLayoutSize
{
  v2 = [(NSArray *)self->_packingRules lastObject];
  uint64_t v3 = [v2 sizeLimit];
  unint64_t v5 = v4;

  unint64_t v6 = v3;
  unint64_t v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)regenerateRectsWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = CCUILayoutSizeZero;
  uint64_t v30 = [v6 count];
  v31 = self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obj = self->_packingRules;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v29 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1D947F3D0]();
        uint64_t v14 = [v12 packFrom];
        if (v14 == 1)
        {
          uint64_t v16 = 0;
          uint64_t v15 = v36;
        }
        else if (v14)
        {
          uint64_t v16 = 0;
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v15 = 0;
          uint64_t v16 = *((void *)&v36 + 1);
        }
        uint64_t v17 = [v12 packingOrder];
        uint64_t v18 = [v12 sizeLimit];
        v20 = -[CCUIControlCenterPositionProvider _generateRectByIdentifierWithOrderedIdentifiers:orderedSizes:packingOrder:startPosition:maximumSize:outputLayoutSize:](v31, "_generateRectByIdentifierWithOrderedIdentifiers:orderedSizes:packingOrder:startPosition:maximumSize:outputLayoutSize:", v6, v7, v17, v15, v16, v18, v19, &v36);
        [(NSDictionary *)v8 addEntriesFromDictionary:v20];
        if ([(NSDictionary *)v8 count] == v30)
        {

          goto LABEL_18;
        }
        uint64_t v21 = [v20 count];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = [v6 count];
          uint64_t v24 = v23 - v22;
          uint64_t v25 = objc_msgSend(v6, "subarrayWithRange:", v22, v23 - v22);

          uint64_t v26 = objc_msgSend(v7, "subarrayWithRange:", v22, v24);

          id v7 = (id)v26;
          id v6 = (id)v25;
        }
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  rectByIdentifier = v31->_rectByIdentifier;
  v31->_rectByIdentifier = v8;

  v31->_layoutSize = (CCUILayoutSize)v36;
}

- (id)_generateRectByIdentifierWithOrderedIdentifiers:(id)a3 orderedSizes:(id)a4 packingOrder:(unint64_t)a5 startPosition:(CCUILayoutPoint)a6 maximumSize:(CCUILayoutSize)a7 outputLayoutSize:(CCUILayoutSize *)a8
{
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  id v12 = a3;
  id v51 = a4;
  unint64_t v59 = a5;
  if (a5 == 1) {
    unint64_t v13 = var1;
  }
  else {
    unint64_t v13 = var0;
  }
  unint64_t v54 = v13;
  if (a5 == 1)
  {
    unint64_t var1 = var0;
    unint64_t height = a7.height;
  }
  else
  {
    unint64_t height = a7.width;
  }
  if (a5 == 1) {
    unint64_t width = a7.width;
  }
  else {
    unint64_t width = a7.height;
  }
  unint64_t v48 = width;
  unint64_t v49 = height;
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v12 count])
  {
    uint64_t v17 = 0;
    unint64_t v58 = var1;
    unint64_t v46 = var1;
    v47 = v12;
    while (2)
    {
      uint64_t v18 = [v12 objectAtIndex:v17];
      uint64_t v57 = v17;
      uint64_t v19 = [v51 objectAtIndex:v17];
      uint64_t v20 = objc_msgSend(v19, "ccui_sizeValue");
      if (v59 == 1) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = v20;
      }
      uint64_t v55 = v21;
      uint64_t v56 = v20;
      if (v59 == 1) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = v21;
      }

      uint64_t v62 = v22;
      v60 = v18;
      unint64_t v61 = v49 - v22;
      unint64_t v52 = v48 - v23;
      uint64_t v53 = v23;
      unint64_t v24 = var1;
LABEL_19:
      unint64_t v63 = v24 + v23;
      unint64_t v25 = v54;
      do
      {
        if (v25 > v61)
        {
          ++v24;
          uint64_t v23 = v53;
          if (v24 <= v52) {
            goto LABEL_19;
          }

          id v12 = v47;
          goto LABEL_58;
        }
        if (v24 >= v63) {
          break;
        }
        unint64_t v26 = v25 + v62;
        uint64_t v27 = 1;
        unint64_t v28 = v24;
        do
        {
          int v29 = v27 & 1;
          if ((v27 & 1) != 0 && v25 < v26)
          {
            unint64_t v30 = v25 + 1;
            do
            {
              v31 = objc_msgSend(MEMORY[0x1E4F29238], "ccui_valueWithLayoutPoint:", v25, v24);
              long long v32 = [v16 objectForKey:v31];

              if (v32) {
                uint64_t v33 = 0;
              }
              else {
                uint64_t v33 = v27;
              }

              int v29 = v33 & 1;
              if ((v33 & 1) == 0) {
                break;
              }
            }
            while (v30++ < v26);
          }
          else
          {
            uint64_t v33 = v27;
          }
          if (!v29) {
            break;
          }
          ++v28;
          uint64_t v27 = v33;
        }
        while (v28 < v63);
        if (!v29) {
          ++v25;
        }
        uint64_t v18 = v60;
      }
      while ((v33 & 1) == 0);
      if (v59 == 1) {
        unint64_t v35 = v24;
      }
      else {
        unint64_t v35 = v25;
      }
      if (v59 == 1) {
        unint64_t v36 = v25;
      }
      else {
        unint64_t v36 = v24;
      }
      v64[0] = v35;
      v64[1] = v36;
      v64[2] = v56;
      v64[3] = v55;
      v37 = objc_msgSend(MEMORY[0x1E4F29238], "ccui_valueWithLayoutRect:", v64);
      [v50 setObject:v37 forKey:v18];
      unint64_t v38 = v58;
      if (v58 <= v63) {
        unint64_t v38 = v63;
      }
      unint64_t v58 = v38;
      if (v24 < v63)
      {
        do
        {
          if (v25 < v25 + v62)
          {
            uint64_t v39 = v62;
            uint64_t v40 = v25;
            do
            {
              v41 = objc_msgSend(MEMORY[0x1E4F29238], "ccui_valueWithLayoutPoint:", v40, v24);
              [v16 setObject:v18 forKey:v41];

              ++v40;
              --v39;
            }
            while (v39);
          }
          ++v24;
        }
        while (v24 != v63);
      }

      uint64_t v17 = v57 + 1;
      id v12 = v47;
      unint64_t var1 = v46;
      if (v57 + 1 < (unint64_t)[v47 count]) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v58 = var1;
  }
LABEL_58:
  if (a8)
  {
    unint64_t v43 = a7.height;
    unint64_t v42 = a7.width;
    if (v59 == 1) {
      unint64_t v42 = v58;
    }
    else {
      unint64_t v43 = v58;
    }
    if (a8->width > v42) {
      unint64_t v42 = a8->width;
    }
    if (a8->height > v43) {
      unint64_t v43 = a8->height;
    }
    a8->unint64_t width = v42;
    a8->unint64_t height = v43;
  }
  v44 = (void *)[v50 copy];

  return v44;
}

- (CCUILayoutRect)layoutRectForIdentifier:(SEL)a3
{
  unint64_t v5 = [(NSDictionary *)self->_rectByIdentifier objectForKey:a4];
  if (v5)
  {
    id v7 = v5;
    objc_msgSend(v5, "ccui_rectValue");
    unint64_t v5 = v7;
  }
  else
  {
    retstr->unint64_t var0 = 0u;
    retstr->unint64_t var1 = 0u;
  }

  return result;
}

- (CCUILayoutSize)layoutSize
{
  unint64_t height = self->_layoutSize.height;
  unint64_t width = self->_layoutSize.width;
  result.unint64_t height = height;
  result.unint64_t width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectByIdentifier, 0);

  objc_storeStrong((id *)&self->_packingRules, 0);
}

@end