@interface TDPhotoshopElementProduction
+ (unsigned)sliceColumnsPerRendition:(int64_t)a3;
+ (unsigned)sliceRowsPerRendition:(int64_t)a3;
- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5;
- (id)_layerMappingForPhotoshopLayer:(int64_t)a3 drawingLayer:(int64_t)a4;
- (id)associatedFileURLWithDocument:(id)a3;
- (id)auxiliary1MetricsMaskWithDocument:(id)a3;
- (id)auxiliary2MetricsMaskWithDocument:(id)a3;
- (id)baseKeySpec;
- (id)baselineMetricsMaskWithDocument:(id)a3;
- (id)columnCount;
- (id)columnIterationType;
- (id)copyDataFromAttributes;
- (id)dataFromAttributes;
- (id)edgeMetricsMaskWithDocument:(id)a3;
- (id)isActive;
- (id)log;
- (id)psdImageRefWithDocument:(id)a3;
- (id)relativePath;
- (id)rowCount;
- (id)rowIterationType;
- (id)textMetricsMaskWithDocument:(id)a3;
- (void)_loadMetricsMasksWithDocument:(id)a3;
- (void)addDrawingLayerIndex:(id)a3 themeLayer:(id)a4 toIndices:(id)a5 layers:(id)a6 lowestIndex:(int64_t *)a7;
- (void)appendToLog:(id)a3;
- (void)copyAttributesInto:(id)a3;
- (void)dealloc;
- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)fillIterationKeyAttribute:(id)a3 iteration:(int)a4 rowOrColumn:(int)a5 document:(id)a6;
- (void)getDrawingLayerIndices:(id *)a3 themeLayers:(id *)a4 lowestIndex:(int64_t *)a5;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setAttributesFromData:(id)a3;
- (void)setColumnCount:(id)a3;
- (void)setColumnIterationType:(id)a3;
- (void)setIsActive:(id)a3;
- (void)setRowCount:(id)a3;
- (void)setRowIterationType:(id)a3;
@end

@implementation TDPhotoshopElementProduction

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TDPhotoshopElementProduction;
  [(TDPhotoshopElementProduction *)&v3 dealloc];
}

- (id)rowCount
{
  if (objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier") == 6)
  {
    objc_super v3 = NSNumber;
    return (id)[v3 numberWithInteger:1];
  }
  else
  {
    [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"rowCount"];
    v5 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"rowCount"];
    [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"rowCount"];
    return v5;
  }
}

- (void)setRowCount:(id)a3
{
  [(TDPhotoshopElementProduction *)self willChangeValueForKey:@"rowCount"];
  [(TDPhotoshopElementProduction *)self setPrimitiveValue:a3 forKey:@"rowCount"];

  [(TDPhotoshopElementProduction *)self didChangeValueForKey:@"rowCount"];
}

- (id)columnCount
{
  if (objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier") == 6)
  {
    objc_super v3 = NSNumber;
    return (id)[v3 numberWithInteger:1];
  }
  else
  {
    [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"columnCount"];
    v5 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"columnCount"];
    [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"columnCount"];
    return v5;
  }
}

- (void)setColumnCount:(id)a3
{
  [(TDPhotoshopElementProduction *)self willChangeValueForKey:@"columnCount"];
  [(TDPhotoshopElementProduction *)self setPrimitiveValue:a3 forKey:@"columnCount"];

  [(TDPhotoshopElementProduction *)self didChangeValueForKey:@"columnCount"];
}

- (id)columnIterationType
{
  [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"columnIterationType"];
  objc_super v3 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"columnIterationType"];
  [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"columnIterationType"];
  return v3;
}

- (id)rowIterationType
{
  [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"rowIterationType"];
  objc_super v3 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"rowIterationType"];
  [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"rowIterationType"];
  return v3;
}

- (id)isActive
{
  [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"isActive"];
  objc_super v3 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"isActive"];
  [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"isActive"];
  return v3;
}

- (id)baseKeySpec
{
  [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"baseKeySpec"];
  objc_super v3 = (void *)[(TDPhotoshopElementProduction *)self primitiveValueForKey:@"baseKeySpec"];
  [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"baseKeySpec"];
  return v3;
}

- (void)setIsActive:(id)a3
{
  [(TDPhotoshopElementProduction *)self willChangeValueForKey:@"isActive"];
  [(TDPhotoshopElementProduction *)self setPrimitiveValue:a3 forKey:@"isActive"];

  [(TDPhotoshopElementProduction *)self didChangeValueForKey:@"isActive"];
}

- (void)setColumnIterationType:(id)a3
{
  [(TDPhotoshopElementProduction *)self willChangeValueForKey:@"columnIterationType"];
  [(TDPhotoshopElementProduction *)self setPrimitiveValue:a3 forKey:@"columnIterationType"];

  [(TDPhotoshopElementProduction *)self didChangeValueForKey:@"columnIterationType"];
}

- (void)setRowIterationType:(id)a3
{
  [(TDPhotoshopElementProduction *)self willChangeValueForKey:@"rowIterationType"];
  [(TDPhotoshopElementProduction *)self setPrimitiveValue:a3 forKey:@"rowIterationType"];

  [(TDPhotoshopElementProduction *)self didChangeValueForKey:@"rowIterationType"];
}

- (id)relativePath
{
  v2 = (void *)[(TDPhotoshopElementProduction *)self asset];

  return (id)[v2 sourceRelativePath];
}

- (id)associatedFileURLWithDocument:(id)a3
{
  v4 = (void *)[(TDPhotoshopElementProduction *)self asset];

  return (id)[v4 fileURLWithDocument:a3];
}

+ (unsigned)sliceRowsPerRendition:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return -1;
  }
  else {
    return dword_2351848F0[a3];
  }
}

+ (unsigned)sliceColumnsPerRendition:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return -1;
  }
  else {
    return dword_235184900[a3];
  }
}

- (void)addDrawingLayerIndex:(id)a3 themeLayer:(id)a4 toIndices:(id)a5 layers:(id)a6 lowestIndex:(int64_t *)a7
{
  if ([a3 integerValue] >= 1)
  {
    if ([a3 integerValue] < *a7) {
      *a7 = [a3 integerValue];
    }
    if ([a5 containsObject:a3])
    {
      NSLog(&cfstr_ErrorPhotoshop.isa, a3, self);
    }
    else
    {
      [a5 addObject:a3];
      [a6 addObject:a4];
    }
  }
}

- (void)getDrawingLayerIndices:(id *)a3 themeLayers:(id *)a4 lowestIndex:(int64_t *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)[(TDPhotoshopElementProduction *)self layerMappings];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[TDPhotoshopElementProduction addDrawingLayerIndex:themeLayer:toIndices:layers:lowestIndex:](self, "addDrawingLayerIndex:themeLayer:toIndices:layers:lowestIndex:", [*(id *)(*((void *)&v14 + 1) + 8 * v13) photoshopLayerIndex], objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13), "themeDrawingLayer"), *a3, *a4, a5);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)fillIterationKeyAttribute:(id)a3 iteration:(int)a4 rowOrColumn:(int)a5 document:(id)a6
{
  switch(a4)
  {
    case 0:
      uint64_t v7 = [a6 valueWithIdentifier:a5];
      [a3 setValue:v7];
      break;
    case 1:
      uint64_t v8 = [a6 presentationStateWithIdentifier:a5];
      [a3 setPresentationState:v8];
      break;
    case 2:
      [a3 setDimension1:*(void *)&a5];
      break;
    case 3:
      [a3 setDimension2:*(void *)&a5];
      break;
    default:
      return;
  }
}

- (id)psdImageRefWithDocument:(id)a3
{
  if (!self->psdImageRef
    || self->_cachedImageDate
    && objc_msgSend(-[TDElementProduction associatedFileModificationDateWithDocument:](self, "associatedFileModificationDateWithDocument:", a3), "compare:", self->_cachedImageDate) == 1)
  {
    self->psdImageRef = (CUIPSDImageRef *)objc_msgSend(objc_alloc(MEMORY[0x263F383B0]), "initWithPath:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopElementProduction asset](self, "asset"), "fileURLWithDocument:", a3), "path"));
    cachedImageDate = self->_cachedImageDate;
    if (cachedImageDate) {

    }
    self->_cachedImageDate = (NSDate *)objc_msgSend(-[TDElementProduction associatedFileModificationDateWithDocument:](self, "associatedFileModificationDateWithDocument:", a3), "copy");
  }
  return self->psdImageRef;
}

- (void)_loadMetricsMasksWithDocument:(id)a3
{
  id v4 = [(TDPhotoshopElementProduction *)self psdImageRefWithDocument:a3];
  if (!self->_edgeMetricsMask)
  {
    v5 = v4;
    v6 = (CUIImage *)(id)[v4 maskFromCompositeAlphaChannel:1];
    self->_edgeMetricsMask = v6;
    if (v6)
    {
      if (!self->_textMetricsMask)
      {
        uint64_t v7 = (CUIImage *)(id)[v5 maskFromCompositeAlphaChannel:2];
        self->_textMetricsMask = v7;
        if (v7)
        {
          if (!self->_baselineMetricsMask)
          {
            uint64_t v8 = (CUIImage *)(id)[v5 maskFromCompositeAlphaChannel:3];
            self->_baselineMetricsMask = v8;
            if (v8)
            {
              if (!self->_auxiliary1MetricsMask)
              {
                v9 = (CUIImage *)(id)[v5 maskFromCompositeAlphaChannel:4];
                self->_auxiliary1MetricsMask = v9;
                if (v9)
                {
                  if (!self->_auxiliary2MetricsMask) {
                    self->_auxiliary2MetricsMask = (CUIImage *)(id)[v5 maskFromCompositeAlphaChannel:5];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  self->_didCheckForMetricsMasks = 1;
}

- (id)edgeMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks) {
    [(TDPhotoshopElementProduction *)self _loadMetricsMasksWithDocument:a3];
  }
  return self->_edgeMetricsMask;
}

- (id)textMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks) {
    [(TDPhotoshopElementProduction *)self _loadMetricsMasksWithDocument:a3];
  }
  return self->_textMetricsMask;
}

- (id)baselineMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks) {
    [(TDPhotoshopElementProduction *)self _loadMetricsMasksWithDocument:a3];
  }
  return self->_baselineMetricsMask;
}

- (id)auxiliary1MetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks) {
    [(TDPhotoshopElementProduction *)self _loadMetricsMasksWithDocument:a3];
  }
  return self->_auxiliary1MetricsMask;
}

- (id)auxiliary2MetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks) {
    [(TDPhotoshopElementProduction *)self _loadMetricsMasksWithDocument:a3];
  }
  return self->_auxiliary2MetricsMask;
}

- (id)log
{
  [(TDPhotoshopElementProduction *)self willAccessValueForKey:@"log"];
  log = self->log;
  if (!log) {
    log = (NSMutableAttributedString *)(id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26E8675B0];
  }
  [(TDPhotoshopElementProduction *)self didAccessValueForKey:@"log"];
  return log;
}

- (void)appendToLog:(id)a3
{
  if (!appendToLog__attributes) {
    appendToLog__attributes = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  }
  id v5 = (id)[[NSString alloc] initWithFormat:a3 locale:0 arguments:&v11];
  uint64_t v6 = appendToLog__messageIndex++;
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d - ", v6);
  id v8 = objc_alloc(MEMORY[0x263F089B8]);
  id v9 = (id)[v8 initWithString:v7 attributes:appendToLog__attributes];
  id v10 = objc_alloc(MEMORY[0x263F086A0]);
  objc_msgSend(v9, "appendAttributedString:", (id)objc_msgSend(v10, "initWithString:attributes:", v5, appendToLog__attributes));
  objc_msgSend(v9, "appendAttributedString:", -[TDPhotoshopElementProduction log](self, "log"));
  [(TDPhotoshopElementProduction *)self setValue:v9 forKey:@"log"];
}

- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5
{
  if (!a3)
  {
    uint64_t v15 = [&stru_26E8675B0 stringByAppendingString:@"ERROR: Null entityName passed to generateRenditionsWithEntityName"];
    goto LABEL_8;
  }
  v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopElementProduction entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  Class v72 = NSClassFromString((NSString *)[v73 managedObjectClassName]);
  if (![(objc_class *)v72 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v15 = [NSString stringWithFormat:@"Entity %@ passed to TDPhotoshopElementProduction -generateRenditionsWithEntityName: is not TDPhotoshopRenditionSpec subclass", a3];
LABEL_8:
    long long v16 = (void *)v15;
    NSLog(&stru_26E866BF0.isa, v15);
    if (a5)
    {
      BOOL result = 0;
      *a5 = v16;
      return result;
    }
    return 0;
  }
  id v8 = [(TDPhotoshopElementProduction *)self psdImageRefWithDocument:a4];
  if (!v8)
  {
    if (a5)
    {
      BOOL result = 0;
      v18 = @"ERROR: Invalid Photoshop PSD file";
LABEL_16:
      *a5 = v18;
      return result;
    }
    long long v14 = @"ERROR: Invalid Photoshop PSD file";
    goto LABEL_23;
  }
  id v9 = v8;
  uint64_t v10 = objc_msgSend(-[TDPhotoshopElementProduction rowCount](self, "rowCount"), "intValue");
  uint64_t v11 = objc_msgSend(-[TDPhotoshopElementProduction columnCount](self, "columnCount"), "intValue");
  unsigned int v12 = objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier");
  BOOL v13 = v12 != 6;
  if ((int)v10 < v13)
  {
    long long v14 = (__CFString *)[NSString stringWithFormat:@"ERROR: Element must have %d or more rows, not %d row(s). The asset may not have enough slices to satisfy the rendition type's specifications.", v13, v10];
    goto LABEL_14;
  }
  if ((int)v11 < v13)
  {
    long long v14 = (__CFString *)[NSString stringWithFormat:@"ERROR: Element must have %d or more columns, not %d column(s). The asset may not have enough slices to satisfy the rendition type's specifications.", v13, v11];
    goto LABEL_14;
  }
  int v64 = v11;
  uint64_t v19 = v12;
  int v20 = [v9 numberOfSlices];
  if (v19 > 8 || ((1 << v19) & 0x160) == 0)
  {
    uint64_t v27 = (v20 - 1);
    int v28 = v11 * v10 * [(id)objc_opt_class() sliceRowsPerRendition:v19];
    uint64_t v29 = v28 * [(id)objc_opt_class() sliceColumnsPerRendition:v19];
    if (v27 != v29)
    {
      v30 = &stru_26E8675B0;
      if ([&stru_26E8675B0 length]) {
        v30 = (__CFString *)[&stru_26E8675B0 stringByAppendingString:@"\n"];
      }
      if ((v29 & 0x80000000) != 0)
      {
        int v60 = [(id)objc_opt_class() sliceRowsPerRendition:v19];
        uint64_t v31 = [NSString stringWithFormat:@"ERROR: PSD slice count is %d. The production says it requires %d slices, which is abnormal. This may be the result of hidden slices lurking about in the PSD asset. Try selecting the first or last slice and deleting it. Do you have one less slice now? Also confirm that the slice boundaries are correct. Given the rendition type chosen, you need a slice count that is a multiple of %d.", v27, v29, objc_msgSend((id)objc_opt_class(), "sliceColumnsPerRendition:", v19) * v60];
      }
      else
      {
        uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR: PSD slice count %d is not consistent with element production requirements %d", v27, v29, v61);
      }
      long long v14 = (__CFString *)[(__CFString *)v30 stringByAppendingString:v31];
LABEL_14:
      v18 = v14;
      if (a5)
      {
        BOOL result = 0;
        goto LABEL_16;
      }
LABEL_23:
      [(TDPhotoshopElementProduction *)self appendToLog:[(__CFString *)v14 stringByAppendingString:@"\n"]];
      return 0;
    }
  }
  int v62 = v10;
  v78[0] = (id)[MEMORY[0x263EFF980] array];
  id v77 = (id)[MEMORY[0x263EFF980] array];
  uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
  [(TDPhotoshopElementProduction *)self getDrawingLayerIndices:v78 themeLayers:&v77 lowestIndex:&v76];
  v71 = objc_msgSend((id)-[TDPhotoshopElementProduction partDefinition](self, "partDefinition"), "validStatesWithDocument:", a4);
  uint64_t v76 = [v71 count];
  uint64_t v74 = [v78[0] count];
  unsigned int v21 = [v9 numberOfLayers];
  uint64_t v22 = v21;
  uint64_t v23 = v76;
  v24 = v9;
  int v66 = v19;
  if (v76 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v68 = 0;
    uint64_t v76 = v21;
    v25 = &stru_26E8675B0;
    uint64_t v23 = v21;
  }
  else if (v76 >= v21)
  {
    v68 = 0;
    v25 = &stru_26E8675B0;
  }
  else
  {
    v68 = 0;
    v25 = &stru_26E8675B0;
    do
    {
      if ((objc_msgSend(v78[0], "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", v23)) & 1) == 0)
      {
        if (!v68) {
          v68 = (void *)[v9 layerNames];
        }
        if ([(__CFString *)v25 length]) {
          v25 = (__CFString *)[(__CFString *)v25 stringByAppendingString:@"\n"];
        }
        v26 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", [NSString stringWithFormat:@"WARNING: Photoshop layer \"%@\" (index %ld) is not assigned to a state or rendition layer", objc_msgSend(v68, "objectAtIndex:", v23), v23]);
        v25 = v26;
        if (a5) {
          *a5 = v26;
        }
        else {
          [(TDPhotoshopElementProduction *)self appendToLog:[(__CFString *)v26 stringByAppendingString:@"\n"]];
        }
      }
      ++v23;
    }
    while (v22 != v23);
    uint64_t v23 = v76;
  }
  if (v23 != 1 && v23 != 4)
  {
    if ([(__CFString *)v25 length]) {
      v25 = (__CFString *)[(__CFString *)v25 stringByAppendingString:@"\n"];
    }
    v33 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", objc_msgSend(NSString, "stringWithFormat:", @"WARNING: State layer count %ld not equal to 1 or 5 or 6", v76));
    v25 = v33;
    if (a5) {
      *a5 = v33;
    }
    else {
      [(TDPhotoshopElementProduction *)self appendToLog:[(__CFString *)v33 stringByAppendingString:@"\n"]];
    }
  }
  uint64_t v70 = [v71 indexOfObjectPassingTest:&__block_literal_global_1];
  if (v22)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      [v9 boundsAtLayer:i];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v42 = v35;
      if ((rint(v40) == 0.0 || rint(v35) == 0.0) && (v70 != i || v76 <= i))
      {
        if (!v68) {
          v68 = (void *)[v9 layerNames];
        }
        if ([(__CFString *)v25 length]) {
          v25 = (__CFString *)[(__CFString *)v25 stringByAppendingString:@"\n"];
        }
        v43 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", [NSString stringWithFormat:@"WARNING: Layer \"%@\" (index %ld) has no pixels. Layer bounds of {{%ld,%ld},{%ld,%ld}}", objc_msgSend(v68, "objectAtIndex:", i), i, (uint64_t)v37, (uint64_t)v39, (uint64_t)v41, (uint64_t)v42]);
        v25 = v43;
        if (a5) {
          *a5 = v43;
        }
        else {
          [(TDPhotoshopElementProduction *)self appendToLog:[(__CFString *)v43 stringByAppendingString:@"\n"]];
        }
        id v9 = v24;
      }
    }
  }
  if (v66 == 6)
  {
    int v64 = 1;
    uint64_t v44 = 4;
    int v46 = 1;
    uint64_t v45 = 4;
  }
  else
  {
    uint64_t v44 = objc_msgSend((id)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"rowIterationType"), "identifier");
    uint64_t v45 = objc_msgSend((id)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"columnIterationType"), "identifier");
    int v46 = v62;
  }
  unsigned int v47 = objc_msgSend((id)-[TDPhotoshopElementProduction partDefinition](self, "partDefinition"), "partFeatures");
  uint64_t v48 = [v71 indexOfObjectPassingTest:&__block_literal_global_80];
  uint64_t v49 = [v71 indexOfObjectPassingTest:&__block_literal_global_82];
  int v50 = v64;
  if (v46 >= 1)
  {
    uint64_t v51 = 0;
    int v63 = v46;
    uint64_t v67 = v48;
    unsigned int v69 = v47;
    uint64_t v65 = v49;
    do
    {
      if (v50 >= 1)
      {
        uint64_t v52 = 0;
        uint64_t v53 = v76;
        do
        {
          if (v53 >= 1)
          {
            for (uint64_t j = 0; j < v53; ++j)
            {
              BOOL v55 = j == v70 && (v47 & 0x100) == 0;
              if (!v55
                && ((j == v48) & (v47 >> 11)) == 0
                && ((j == v49) & (v47 >> 19)) == 0
                && (v74 & 0x8000000000000000) == 0)
              {
                uint64_t v56 = -1;
                do
                {
                  v57 = [[(objc_class *)v72 alloc] initWithEntity:v73 insertIntoManagedObjectContext:[(TDPhotoshopElementProduction *)self managedObjectContext]];
                  [(objc_class *)v57 setValue:self forKey:@"production"];
                  objc_msgSend((id)-[TDPhotoshopElementProduction mutableSetValueForKey:](self, "mutableSetValueForKey:", @"renditions"), "addObject:", v57);
                  [(objc_class *)v57 resetToBaseKeySpec];
                  [(TDPhotoshopElementProduction *)self fillIterationKeyAttribute:[(objc_class *)v57 keySpec] iteration:v44 rowOrColumn:v51 document:a4];
                  [(TDPhotoshopElementProduction *)self fillIterationKeyAttribute:[(objc_class *)v57 keySpec] iteration:v45 rowOrColumn:v52 document:a4];
                  objc_msgSend((id)-[objc_class keySpec](v57, "keySpec"), "setState:", objc_msgSend(v71, "objectAtIndex:", j));
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", [NSNumber numberWithInt:v51], @"row");
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", [NSNumber numberWithInt:v52], @"column");
                  v58 = (void *)[(objc_class *)v57 keySpec];
                  if (v56 == -1)
                  {
                    if (![v58 layer]) {
                      objc_msgSend((id)-[objc_class keySpec](v57, "keySpec"), "setLayer:", objc_msgSend(a4, "drawingLayerWithIdentifier:", 0));
                    }
                    uint64_t v59 = [NSNumber numberWithInt:j];
                  }
                  else
                  {
                    objc_msgSend(v58, "setLayer:", objc_msgSend(v77, "objectAtIndex:", v56));
                    uint64_t v59 = [v78[0] objectAtIndex:v56];
                  }
                  [(objc_class *)v57 setValue:v59 forKey:@"layer"];
                  ++v56;
                }
                while (v74 != v56);
                uint64_t v53 = v76;
                uint64_t v48 = v67;
                unsigned int v47 = v69;
                uint64_t v49 = v65;
              }
            }
          }
          uint64_t v52 = (v52 + 1);
          int v50 = v64;
        }
        while (v52 != v64);
      }
      uint64_t v51 = (v51 + 1);
    }
    while (v51 != v63);
  }
  return 1;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == 1;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier] == 2;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier] == 4;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(a3, "deleteObjects:", objc_msgSend((id)-[TDPhotoshopElementProduction renditions](self, "renditions"), "allObjects"));
  uint64_t v7 = (void *)[(TDPhotoshopElementProduction *)self asset];
  id v8 = v7;
  if (v4)
  {
    id v9 = (void *)[v7 fileURLWithDocument:a3];
    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
      [a3 assetManagementDelegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v8, v9);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v9, 0);
      [a3 assetManagementDelegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v9);
      }
    }
  }

  [a3 deleteObject:v8];
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setRenditionType:", -[TDPhotoshopElementProduction renditionType](self, "renditionType"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"isActive"), @"isActive");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"comment"), @"comment");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction rowCount](self, "rowCount"), @"rowCount");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction columnCount](self, "columnCount"), @"columnCount");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"rowIterationType"), @"rowIterationType");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"columnIterationType"), @"columnIterationType");
  uint64_t v5 = [(TDPhotoshopElementProduction *)self valueForKey:@"layerMappings"];

  [a3 setValue:v5 forKey:@"layerMappings"];
}

- (id)dataFromAttributes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
  BOOL v4 = (void *)[(TDPhotoshopElementProduction *)self renditionType];
  if (v4) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), @"renditionType");
  }
  objc_msgSend(v3, "setObject:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"rowCount"), @"rowCount");
  objc_msgSend(v3, "setObject:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", @"columnCount"), @"columnCount");
  uint64_t v5 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"rowIterationType"];
  if (v5) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectID"), "URIRepresentation"), "absoluteString"), @"rowIterationType");
  }
  uint64_t v6 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"columnIterationType"];
  if (v6) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "URIRepresentation"), "absoluteString"), @"columnIterationType");
  }
  uint64_t v7 = (void *)[(TDPhotoshopElementProduction *)self layerMappings];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "photoshopLayerIndex"), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "themeDrawingLayer"), "constantName"));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[TDPhotoshopElementProduction baseKeySpec](self, "baseKeySpec"), "dataFromAttributes"), @"baseKeySpec");
  return (id)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];
}

- (id)_layerMappingForPhotoshopLayer:(int64_t)a3 drawingLayer:(int64_t)a4
{
  uint64_t v6 = (void *)[(TDPhotoshopElementProduction *)self managedObjectContext];
  uint64_t v7 = [MEMORY[0x263EFF240] entityForName:@"LayerMapping" inManagedObjectContext:v6];
  id v8 = objc_alloc_init(MEMORY[0x263EFF260]);
  [v8 setEntity:v7];
  objc_msgSend(v8, "setPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"photoshopLayerIndex = %d AND themeDrawingLayer.identifier = %d", a3, a4));
  uint64_t v14 = 0;
  uint64_t v9 = (void *)[v6 executeFetchRequest:v8 error:&v14];

  if ([v9 count]) {
    return (id)[v9 objectAtIndex:0];
  }
  uint64_t v10 = [[TDLayerMapping alloc] initWithEntity:v7 insertIntoManagedObjectContext:v6];
  -[TDLayerMapping setValue:forKey:](v10, "setValue:forKey:", [NSNumber numberWithInteger:a3], @"photoshopLayerIndex");
  id v11 = objc_alloc_init(MEMORY[0x263EFF260]);
  objc_msgSend(v11, "setEntity:", objc_msgSend(MEMORY[0x263EFF240], "entityForName:inManagedObjectContext:", @"ThemeDrawingLayer", v6));
  objc_msgSend(v11, "setPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"identifier = %d", a4));
  unsigned int v12 = (void *)[v6 executeFetchRequest:v11 error:&v14];

  -[TDLayerMapping setValue:forKey:](v10, "setValue:forKey:", [v12 objectAtIndex:0], @"themeDrawingLayer");
  return v10;
}

- (void)setAttributesFromData:(id)a3
{
  BOOL v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = (void *)[(TDPhotoshopElementProduction *)self managedObjectContext];
  uint64_t v6 = [v4 objectForKey:@"baseKeySpec"];
  if (v6) {
    objc_msgSend(-[TDPhotoshopElementProduction baseKeySpec](self, "baseKeySpec"), "setAttributesFromData:", v6);
  }
  uint64_t v7 = [v4 objectForKey:@"renditionType"];
  if (v7) {
    -[TDPhotoshopElementProduction setRenditionType:](self, "setRenditionType:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v7))));
  }
  uint64_t v8 = [v4 objectForKey:@"rowCount"];
  if (v8) {
    [(TDPhotoshopElementProduction *)self setValue:v8 forKey:@"rowCount"];
  }
  uint64_t v9 = [v4 objectForKey:@"columnCount"];
  if (v9) {
    [(TDPhotoshopElementProduction *)self setValue:v9 forKey:@"columnCount"];
  }
  uint64_t v10 = [v4 objectForKey:@"rowIterationType"];
  if (v10) {
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v10))), @"rowIterationType");
  }
  uint64_t v11 = [v4 objectForKey:@"columnIterationType"];
  if (v11) {
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v11))), @"columnIterationType");
  }
  unsigned int v12 = (void *)[v4 objectForKey:@"kCoreThemeLayerPulse"];
  if (v12)
  {
    long long v13 = v12;
    if ([v12 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v13, "integerValue"), 3)));
    }
  }
  uint64_t v14 = (void *)[v4 objectForKey:@"kCoreThemeLayerHighlight"];
  if (v14)
  {
    long long v15 = v14;
    if ([v14 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v15, "integerValue"), 1)));
    }
  }
  long long v16 = (void *)[v4 objectForKey:@"kCoreThemeLayerHitMask"];
  if (v16)
  {
    long long v17 = v16;
    if ([v16 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v17, "integerValue"), 4)));
    }
  }
  uint64_t v18 = (void *)[v4 objectForKey:@"kCoreThemeLayerMask"];
  if (v18)
  {
    uint64_t v19 = v18;
    if ([v18 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v19, "integerValue"), 2)));
    }
  }
  int v20 = (void *)[v4 objectForKey:@"kCoreThemeLayerPatternOverlay"];
  if (v20)
  {
    unsigned int v21 = v20;
    if ([v20 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v21, "integerValue"), 5)));
    }
  }
  uint64_t v22 = (void *)[v4 objectForKey:@"kCoreThemeLayerOutline"];
  if (v22)
  {
    uint64_t v23 = v22;
    if ([v22 integerValue]) {
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v23, "integerValue"), 6)));
    }
  }
  v24 = (void *)[v4 objectForKey:@"kCoreThemeLayerInterior"];
  if (v24)
  {
    v25 = v24;
    if ([v24 integerValue])
    {
      uint64_t v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v25, "integerValue"), 7));
      [(TDPhotoshopElementProduction *)self addLayerMappings:v26];
    }
  }
}

- (id)copyDataFromAttributes
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:14];
  uint64_t v4 = [(TDPhotoshopElementProduction *)self valueForKey:@"columnCount"];
  if (v4) {
    [v3 setObject:v4 forKey:@"columnCount"];
  }
  uint64_t v5 = [(TDPhotoshopElementProduction *)self valueForKey:@"rowCount"];
  if (v5) {
    [v3 setObject:v5 forKey:@"rowCount"];
  }
  uint64_t v6 = [(TDPhotoshopElementProduction *)self valueForKey:@"comment"];
  if (v6) {
    [v3 setObject:v6 forKey:@"comment"];
  }
  uint64_t v7 = [(TDPhotoshopElementProduction *)self valueForKey:@"isActive"];
  if (v7) {
    [v3 setObject:v7 forKey:@"isActive"];
  }
  uint64_t v8 = [(TDPhotoshopElementProduction *)self valueForKey:@"isExcludedFromFilter"];
  if (v8) {
    [v3 setObject:v8 forKey:@"isExcludedFromFilter"];
  }
  uint64_t v9 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"renditionType"];
  if (v9) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "identifier")), @"renditionType");
  }
  uint64_t v10 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"artworkDraftType"];
  if (v10) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "identifier")), @"artworkDraftType");
  }
  uint64_t v11 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"columnIterationType"];
  if (v11) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "identifier")), @"columnIterationType");
  }
  unsigned int v12 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"rowIterationType"];
  if (v12) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "identifier")), @"rowIterationType");
  }
  long long v13 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"renditionSubtype"];
  if (v13) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "identifier")), @"renditionSubtype");
  }
  uint64_t v14 = (void *)[(TDPhotoshopElementProduction *)self valueForKey:@"baseKeySpec"];
  if (v14) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v14, "copyDataFromAttributes"), @"baseKeySpec");
  }
  long long v15 = (void *)[(TDPhotoshopElementProduction *)self asset];
  if (v15) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v15, "copyDataFromAttributes"), @"asset");
  }
  long long v16 = (void *)[(TDPhotoshopElementProduction *)self mutableSetValueForKey:@"layerMappings"];
  if ([v16 count])
  {
    long long v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v18 = (void *)[v16 allObjects];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(v17, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v22++), "copyDataFromAttributes"));
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v20);
    }
    [v3 setObject:v17 forKey:@"layerMappings"];
  }
  uint64_t v23 = (void *)[(TDPhotoshopElementProduction *)self mutableSetValueForKey:@"renditions"];
  if ([v23 count])
  {
    v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = objc_msgSend(v23, "allObjects", 0);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(v24, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v29++), "copyDataFromAttributes"));
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v27);
    }
    [v3 setObject:v24 forKey:@"renditions"];
  }
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"columnCount"];
  if (v5) {
    [(TDPhotoshopElementProduction *)self setValue:v5 forKey:@"columnCount"];
  }
  uint64_t v6 = [v4 objectForKey:@"rowCount"];
  if (v6) {
    [(TDPhotoshopElementProduction *)self setValue:v6 forKey:@"rowCount"];
  }
  uint64_t v7 = [v4 objectForKey:@"comment"];
  if (v7) {
    [(TDPhotoshopElementProduction *)self setValue:v7 forKey:@"comment"];
  }
  uint64_t v8 = [v4 objectForKey:@"isActive"];
  if (v8) {
    [(TDPhotoshopElementProduction *)self setValue:v8 forKey:@"isActive"];
  }
  uint64_t v9 = [v4 objectForKey:@"isExcludedFromFilter"];
  if (v9)
  {
    [(TDPhotoshopElementProduction *)self setValue:v9 forKey:@"isExcludedFromFilter"];
  }
}

@end