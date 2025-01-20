@interface TDPhotoshopRenditionSpec
- ($56AE26BFB60993BDE24C7578AE3A2D7B)_subtractThrowawaySliceFromMetricsIfNeeded:(SEL)a3 metrics:(CGRect)a4 renditionRect:(id *)a5;
- (BOOL)_sliceRectanglesForPSDImage:(id)a3 rowsPerRendition:(int *)a4 columnsPerRendition:(int *)a5 originalColumnWidth:(int *)a6 newColumnWidth:(int *)a7 originalRowHeight:(int *)a8 newRowHeight:(int *)a9 originalColumnX:(int *)a10 originalRowY:(int *)a11 newRenditionSize:(id *)a12 newSliceCount:(int *)a13 renditionRect:(CGRect *)a14 throwawaySliceRect:(CGRect *)a15;
- (BOOL)updatePackingPropertiesWithDocument:(id)a3;
- (TDImageColorHistogram)histogram;
- (id)copyDataFromAttributes;
- (id)createCSIRepresentationFromGradientPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5;
- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5;
- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 edgeMetricsMask:(id)a5 textMetricsMask:(id)a6 baselineMetricsMask:(id)a7 auxiliary1MetricsMask:(id)a8 auxiliary2MetricsMask:(id)a9 colorSpaceID:(unint64_t)a10 allowsPaletteImageCompression:(BOOL)a11 allowsHevcCompression:(BOOL)a12 allowsDeepmapImageCompression:(BOOL)a13 allowsDeepmap2ImageCompression:(BOOL)a14;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)debugDescription;
- (int)_layerIndexInPSDImage:(id)a3;
- (int)psdSliceNumberForRenditionRow:(int)a3 sliceRow:(int)a4 renditionColumn:(int)a5 sliceColumn:(int)a6 rowsPerRendition:(int)a7 columnsPerRendition:(int)a8 renditionColumnCount:(int)a9;
- (void)_logError:(id)a3;
- (void)_logWarning:(id)a3;
- (void)copyAttributesInto:(id)a3;
- (void)dealloc;
- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setHistogram:(id)a3;
@end

@implementation TDPhotoshopRenditionSpec

- (void)dealloc
{
  [(TDPhotoshopRenditionSpec *)self setHistogram:0];
  v3.receiver = self;
  v3.super_class = (Class)TDPhotoshopRenditionSpec;
  [(TDPhotoshopRenditionSpec *)&v3 dealloc];
}

- (int)psdSliceNumberForRenditionRow:(int)a3 sliceRow:(int)a4 renditionColumn:(int)a5 sliceColumn:(int)a6 rowsPerRendition:(int)a7 columnsPerRendition:(int)a8 renditionColumnCount:(int)a9
{
  return a6 + (a5 + (a4 + a7 * a3) * a9) * a8 + 1;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"rendition with asset %@ and key %@", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec production](self, "production"), "asset"), "name"), objc_msgSend((id)-[TDPhotoshopRenditionSpec keySpec](self, "keySpec"), "debugDescription")];
}

- (void)_logError:(id)a3
{
}

- (void)_logWarning:(id)a3
{
}

- (BOOL)_sliceRectanglesForPSDImage:(id)a3 rowsPerRendition:(int *)a4 columnsPerRendition:(int *)a5 originalColumnWidth:(int *)a6 newColumnWidth:(int *)a7 originalRowHeight:(int *)a8 newRowHeight:(int *)a9 originalColumnX:(int *)a10 originalRowY:(int *)a11 newRenditionSize:(id *)a12 newSliceCount:(int *)a13 renditionRect:(CGRect *)a14 throwawaySliceRect:(CGRect *)a15
{
  v19 = self;
  v20 = (void *)[(TDPhotoshopRenditionSpec *)self production];
  unsigned int v21 = [(TDThemeConstant *)[(TDRenditionSpec *)v19 renditionType] identifier];
  uint64_t v88 = [(TDPhotoshopRenditionSpec *)v19 _layerIndexInPSDImage:a3];
  int v91 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
  uint64_t v97 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", @"row"), "intValue");
  uint64_t v96 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", @"column"), "intValue");
  [a3 size];
  double v23 = v22;
  v94 = v19;
  v90 = a8;
  id v98 = a3;
  int v24 = 40;
  int v25 = 22;
  switch(v21)
  {
    case 0u:
      if ([v20 renditionSubtype]) {
        int v25 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
      }
      else {
        int v25 = 10;
      }
      if ([a3 numberOfSlices] != 10) {
        goto LABEL_31;
      }
      uint64_t v37 = [NSString stringWithFormat:@"One part rendition is being distilled with artwork that has more than one slice (%d). Either the rendition is cataloged incorrectly, or the artwork has the wrong number of slices %@", 9, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v81, v82, v83];
      goto LABEL_129;
    case 1u:
      goto LABEL_31;
    case 2u:
      int v25 = 25;
      goto LABEL_31;
    case 3u:
      if ([v20 renditionSubtype]) {
        int v25 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
      }
      else {
        int v25 = 31;
      }
      goto LABEL_31;
    case 5u:
      goto LABEL_6;
    case 8u:
      int v24 = 50;
LABEL_6:
      int v86 = v24;
      uint64_t v26 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
      uint64_t v27 = objc_msgSend((id)objc_msgSend(v20, "rowCount"), "intValue");
      uint64_t v28 = [a3 numberOfSlices] - 1;
      uint64_t v29 = ((int)v28 / ((int)v27 * (int)v26));
      if (v28 != v27 * v26 * v29)
      {
        -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", objc_msgSend(NSString, "stringWithFormat:", @"ERROR: Number of slices per rendition %f is not a whole number!", (double)(int)v28 / (double)((int)v27 * (int)v26)));
        uint64_t v37 = [NSString stringWithFormat:@"Slice count %d rendition rows %d rendition columns %d in %@", v28, v27, v26, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v83];
        goto LABEL_129;
      }
      unsigned int v95 = v21;
      if ((int)v28 < 1)
      {
        uint64_t v30 = 0;
        v34 = a7;
        v35 = a6;
        goto LABEL_22;
      }
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = (int)v28;
      uint64_t v33 = (int)v28 - 1;
      v34 = a7;
      v35 = a6;
      break;
    default:
      int v25 = -1;
LABEL_31:
      *a5 = +[TDPhotoshopElementProduction sliceColumnsPerRendition:v21];
      unsigned int v95 = v21;
      *a4 = +[TDPhotoshopElementProduction sliceRowsPerRendition:v21];
      LODWORD(v29) = *a5;
      v34 = a7;
      v35 = a6;
      goto LABEL_32;
  }
  while (1)
  {
    [v98 boundsForSlice:(v30 + 1)];
    if (v30)
    {
      if (v36 != (double)v31) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v31 = (uint64_t)v36;
    }
    if (v33 == v30) {
      break;
    }
    ++v30;
  }
  uint64_t v30 = v32;
LABEL_21:
  v19 = v94;
  a8 = v90;
LABEL_22:
  if (v30 == (int)v26)
  {
    int v38 = v29;
    LODWORD(v29) = 1;
  }
  else
  {
    if (v30 != v29 * v26)
    {
      uint64_t v37 = [NSString stringWithFormat:@"ERROR: Inconsistent many part structure. Found %ld actual slice columns, %d slices per rendition and %d rendition column count in %@", v30, v29, v26, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v83];
      goto LABEL_129;
    }
    int v38 = 1;
  }
  *a4 = v38;
  *a5 = v29;
  int v25 = v86;
LABEL_32:
  if ((int)v29 >= 1)
  {
    uint64_t v39 = 0;
    do
    {
      v35[v39] = -1;
      v34[v39++] = -1;
    }
    while (v39 < *a5);
  }
  v40 = v98;
  if (*a4 >= 1)
  {
    uint64_t v41 = 0;
    do
    {
      a8[v41] = -1;
      a9[v41++] = -1;
    }
    while (v41 < *a4);
  }
  *a13 = 0;
  CGPoint v42 = (CGPoint)*MEMORY[0x263F08670];
  CGSize v43 = *(CGSize *)(MEMORY[0x263F08670] + 16);
  a14->origin = (CGPoint)*MEMORY[0x263F08670];
  a14->size = v43;
  a15->origin = v42;
  a15->size = v43;
  int v44 = *a5;
  if (*a5 < 1) {
    return 1;
  }
  uint64_t v45 = 0;
  BOOL v46 = v95 == 3 && v25 == 31;
  int v47 = v46;
  if (v95 == 1 && v25 == 22) {
    int v47 = 1;
  }
  int v84 = v47;
  LODWORD(v49) = *a4;
  int v87 = v25;
  while ((int)v49 < 1)
  {
LABEL_122:
    ++v45;
    BOOL result = 1;
    if (v45 >= v44) {
      return result;
    }
  }
  uint64_t v50 = 0;
  BOOL v52 = v95 == 1 && v45 == 2;
  BOOL v93 = v52;
  int v53 = v84;
  if (v45 != 1) {
    int v53 = 0;
  }
  int v85 = v53;
  while (1)
  {
    LODWORD(v80) = v91;
    uint64_t v54 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](v19, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v97, v50, v96, v45, v80);
    if ((v54 & 0x80000000) != 0 || v54 >= [v40 numberOfSlices])
    {
      uint64_t v37 = [NSString stringWithFormat:@"ERROR: Rendition slice number %d for row %d column %d is greater than or equal to slice count %d in %@", v54, v50, v45, objc_msgSend(v40, "numberOfSlices"), -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")];
      goto LABEL_129;
    }
    [v40 boundsForSlice:v54];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    v99.origin.x = v55;
    v99.origin.y = v57;
    v99.size.width = v59;
    v99.size.height = v61;
    *a14 = NSUnionRect(*a14, v99);
    if ((v56 & 0x80000000) != 0 || (v58 & 0x80000000) != 0)
    {
      uint64_t v37 = [NSString stringWithFormat:@"ERROR: Slice at row %d column %d has negative x origin %f and/or y origin %f in %@", v50, v45, *(void *)&v56, *(void *)&v58, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")];
      goto LABEL_129;
    }
    if (v60 == 0.0 || v62 == 0.0) {
      break;
    }
    double v63 = rint(v60);
    uint64_t v64 = (int)v63;
    double v65 = rint(v62);
    uint64_t v66 = (int)v65;
    double v67 = (double)(int)v66;
    if (v63 != (double)(int)v64 || v65 != v67) {
      -[TDPhotoshopRenditionSpec _logWarning:](v19, "_logWarning:", [NSString stringWithFormat:@"WARNING: Slice image size w:%d h:%d does not match slice bounds w:%f h:%f in %@", v64, v66, *(void *)&v60, *(void *)&v62, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")]);
    }
    if (v64) {
      BOOL v69 = v66 == 0;
    }
    else {
      BOOL v69 = 1;
    }
    if (v69) {
      -[TDPhotoshopRenditionSpec _logWarning:](v19, "_logWarning:", [NSString stringWithFormat:@"WARNING: Zero width or height slice at row %d column %d within rendition row %d column %d in %@", v50, v45, v97, v96, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription")]);
    }
    BOOL v70 = v95 == 2 && v50 == 2;
    int v71 = v70;
    char v72 = v93;
    if (v70) {
      char v72 = 1;
    }
    if (v72)
    {
      a15->origin.x = v56;
      a15->origin.y = v58;
      a15->size.width = v60;
      a15->size.height = v62;
    }
    else
    {
      ++*a13;
    }
    int v73 = a6[v45];
    if (v73 == -1)
    {
      a6[v45] = v64;
      a10[v45] = (int)v56;
      if (v93)
      {
        a7[v45] = 0;
      }
      else
      {
        if ((int)v64 <= 8) {
          int v74 = 8;
        }
        else {
          int v74 = v64;
        }
        if (!v85) {
          int v74 = v64;
        }
        a7[v45] = v74;
        a12->var0 += v74;
      }
    }
    else if (v73 != v64)
    {
      -[TDPhotoshopRenditionSpec _logWarning:](v94, "_logWarning:", [NSString stringWithFormat:@"WARNING: Slice geometry inconsistency. Column width for slice at row:%d column:%d layer:%d does not match previous slices in column in %@", v50, v45, v88, -[TDPhotoshopRenditionSpec debugDescription](v94, "debugDescription")]);
    }
    int v75 = v90[v50];
    if (v75 == -1)
    {
      v90[v50] = v66;
      a11[v50] = (int)(v23 - v58 - v67);
      if (v71)
      {
        a9[2] = 0;
      }
      else
      {
        if ((int)v66 <= 8) {
          int v76 = 8;
        }
        else {
          int v76 = v66;
        }
        if (v87 != 25 || v50 != 1 || v95 != 2) {
          int v76 = v66;
        }
        a12->var1 += v76;
        a9[v50] = v76;
      }
      v19 = v94;
      v40 = v98;
    }
    else
    {
      BOOL v46 = v75 == v66;
      v19 = v94;
      v40 = v98;
      if (!v46) {
        -[TDPhotoshopRenditionSpec _logWarning:](v94, "_logWarning:", [NSString stringWithFormat:@"WARNING: Slice geometry inconsistency. Row height for slice at row:%d column:%d layer:%d does not match previous slices in row in %@", v50, v45, v88, -[TDPhotoshopRenditionSpec debugDescription](v94, "debugDescription")]);
      }
    }
    ++v50;
    uint64_t v49 = *a4;
    if (v50 >= v49)
    {
      int v44 = *a5;
      goto LABEL_122;
    }
  }
  uint64_t v37 = [NSString stringWithFormat:@"ERROR: Slice bounds height %f or width %f is zero in %@", *(void *)&v60, *(void *)&v62, -[TDPhotoshopRenditionSpec debugDescription](v19, "debugDescription"), v82, v83];
LABEL_129:
  [(TDPhotoshopRenditionSpec *)v19 _logError:v37];
  return 0;
}

- ($56AE26BFB60993BDE24C7578AE3A2D7B)_subtractThrowawaySliceFromMetricsIfNeeded:(SEL)a3 metrics:(CGRect)a4 renditionRect:(id *)a5
{
  double height = a6.size.height;
  double width = a6.size.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL result = ($56AE26BFB60993BDE24C7578AE3A2D7B *)NSEqualRects(a4, *MEMORY[0x263F08670]);
  if ((result & 1) == 0)
  {
    double v15 = a5->var0.width;
    double v16 = a5->var0.height;
    double v18 = a5->var1.width;
    double v17 = a5->var1.height;
    if (v9 == height)
    {
      double v19 = 0.0;
      if (v15 >= x + v10) {
        double v19 = v10;
      }
      double v15 = v15 - v19;
      if (width - v18 <= x) {
        double v18 = v18 - v10;
      }
    }
    else if (v10 == width)
    {
      double v20 = 0.0;
      if (v16 >= height - y) {
        double v20 = v9;
      }
      double v16 = v16 - v20;
      if (v17 >= y + v9) {
        double v17 = v17 - v9;
      }
    }
    a5->var0.double width = v15;
    a5->var0.double height = v16;
    a5->var1.double width = v18;
    a5->var1.double height = v17;
  }
  CGSize var1 = a5->var1;
  retstr->var0 = a5->var0;
  retstr->CGSize var1 = var1;
  retstr->var2 = a5->var2;
  return result;
}

- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 edgeMetricsMask:(id)a5 textMetricsMask:(id)a6 baselineMetricsMask:(id)a7 auxiliary1MetricsMask:(id)a8 auxiliary2MetricsMask:(id)a9 colorSpaceID:(unint64_t)a10 allowsPaletteImageCompression:(BOOL)a11 allowsHevcCompression:(BOOL)a12 allowsDeepmapImageCompression:(BOOL)a13 allowsDeepmap2ImageCompression:(BOOL)a14
{
  BOOL v69 = a4;
  double v19 = self;
  uint64_t v101 = *MEMORY[0x263EF8340];
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  unsigned int v92 = 0;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  double v20 = (void *)[(TDPhotoshopRenditionSpec *)self production];
  __int16 v21 = [(TDThemeConstant *)[(TDRenditionSpec *)v19 renditionType] identifier];
  unsigned int v22 = [(TDPhotoshopRenditionSpec *)v19 _layerIndexInPSDImage:a3];
  int v74 = objc_msgSend((id)objc_msgSend(v20, "columnCount"), "intValue");
  unsigned int v73 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", @"row"), "intValue");
  unsigned int v72 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v19, "valueForKey:", @"column"), "intValue");
  [a3 size];
  double v23 = 0;
  if (![(TDPhotoshopRenditionSpec *)v19 _sliceRectanglesForPSDImage:a3 rowsPerRendition:&v93 columnsPerRendition:(char *)&v93 + 4 originalColumnWidth:v100 newColumnWidth:v99 originalRowHeight:v98 newRowHeight:v97 originalColumnX:v96 originalRowY:v95 newRenditionSize:&v94 newSliceCount:&v92 renditionRect:&v90 throwawaySliceRect:&v88])return v23; {
  id v75 = a3;
  }
  int v24 = v20;
  if ([v20 renditionSubtype]) {
    __int16 v21 = objc_msgSend((id)objc_msgSend(v20, "renditionSubtype"), "identifier");
  }
  uint64_t v25 = v21;
  v68 = v20;
  if ([(TDPhotoshopRenditionSpec *)v19 parentRendition])
  {
    [(TDRenditionSpec *)v19 packedPoint];
    double v27 = v26;
    double v29 = v28;
    id v30 = objc_alloc(MEMORY[0x263F38370]);
    uint64_t v31 = objc_msgSend(v30, "initWithInternalReferenceRect:layout:", v25, v27, v29, (double)(int)v94, (double)SHIDWORD(v94));
    id v32 = objc_alloc_init(MEMORY[0x263F383C0]);
    uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec parentRendition](v19, "parentRendition"), "keySpec"), "key"));
    [v32 setReferenceKey:v33];
    [v31 addLayerReference:v32];

    int v24 = v68;
  }
  else
  {
    id v34 = objc_alloc(MEMORY[0x263F38370]);
    uint64_t v31 = objc_msgSend(v34, "initWithCanvasSize:sliceCount:layout:", v92, v25, (double)(int)v94, (double)SHIDWORD(v94));
  }
  objc_msgSend(v31, "setName:", objc_msgSend((id)objc_msgSend(v24, "asset"), "name"));
  [v31 setColorSpaceID:(__int16)a10];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "asset"), "name"), "containsString:", @"Mask"))objc_msgSend(v31, "setPixelFormat:", 1195456544); {
  objc_msgSend(v31, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](v19, "isTintable"));
  }
  [v31 setAllowsDeepmapImageCompression:a13];
  [v31 setAllowsDeepmap2ImageCompression:a14];
  objc_msgSend(v31, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v19, "propertiesAsDictionary"));
  int v76 = v31;
  objc_msgSend(v31, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v24, "asset"), "scaleFactor"));
  uint64_t v35 = MEMORY[0x263F38358];
  long long v36 = *MEMORY[0x263F38358];
  long long v37 = *(_OWORD *)(MEMORY[0x263F38358] + 16);
  long long v86 = *MEMORY[0x263F38358];
  long long v87 = v37;
  if (a5)
  {
    if (v75)
    {
      long long v70 = v36;
      long long v66 = v37;
      objc_msgSend(v75, "metricsInMask:forRect:", a5, v90, v91);
      long long v37 = v66;
      long long v36 = v70;
      uint64_t v38 = *((void *)&v85 + 1);
      uint64_t v39 = v85;
    }
    else
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v83 = 0u;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
    }
    long long v86 = v83;
    long long v87 = v84;
  }
  else
  {
    uint64_t v39 = *(void *)(MEMORY[0x263F38358] + 32);
    uint64_t v38 = *(void *)(MEMORY[0x263F38358] + 40);
  }
  long long v83 = v86;
  long long v84 = v87;
  *(void *)&long long v85 = v39;
  *((void *)&v85 + 1) = v38;
  long long v80 = v36;
  long long v81 = v37;
  long long v82 = *(_OWORD *)(v35 + 32);
  if (CSIEqualMetrics())
  {
    uint64_t v38 = *((void *)&v91 + 1);
    uint64_t v39 = v91;
    long long v86 = 0u;
    long long v87 = 0u;
  }
  long long v83 = v86;
  long long v84 = v87;
  *(void *)&long long v85 = v39;
  *((void *)&v85 + 1) = v38;
  v40 = v31;
  [v31 addMetrics:&v83];
  if (a6)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    if (v75) {
      objc_msgSend(v75, "metricsInMask:forRect:", a6, v90, v91);
    }
    long long v80 = v83;
    long long v81 = v84;
    long long v82 = v85;
    [v31 addMetrics:&v80];
  }
  if (a7)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    if (v75) {
      objc_msgSend(v75, "metricsInMask:forRect:", a7, v90, v91);
    }
    long long v80 = v83;
    long long v81 = v84;
    long long v82 = v85;
    [v31 addMetrics:&v80];
  }
  if (a8)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    if (v75) {
      objc_msgSend(v75, "metricsInMask:forRect:", a8, v90, v91);
    }
    if (v19)
    {
      long long v77 = v83;
      long long v78 = v84;
      long long v79 = v85;
      -[TDPhotoshopRenditionSpec _subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:](v19, "_subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:", &v77, v88, v89, v90, v91);
    }
    else
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v80 = 0u;
    }
    long long v83 = v80;
    long long v84 = v81;
    long long v85 = v82;
    [v31 addMetrics:&v80];
  }
  if (a9)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v83 = 0u;
    if (v75) {
      objc_msgSend(v75, "metricsInMask:forRect:", a9, v90, v91);
    }
    if (v19)
    {
      long long v77 = v83;
      long long v78 = v84;
      long long v79 = v85;
      -[TDPhotoshopRenditionSpec _subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:](v19, "_subtractThrowawaySliceFromMetricsIfNeeded:metrics:renditionRect:", &v77, v88, v89, v90, v91);
    }
    else
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v80 = 0u;
    }
    long long v83 = v80;
    long long v84 = v81;
    long long v85 = v82;
    [v31 addMetrics:&v80];
  }
  uint64_t v41 = (void *)[v75 layerRefAtIndex:v22];
  objc_msgSend(v31, "setBlendMode:", objc_msgSend(v41, "blendMode"));
  [v41 opacity];
  objc_msgSend(v31, "setOpacity:");
  uint64_t v71 = [(TDPhotoshopRenditionSpec *)v19 parentRendition];
  if (v71)
  {
    [v75 boundsAtLayer:v22];
    CGPoint v42 = 0;
    double v67 = 0;
  }
  else
  {
    id v43 = objc_alloc(MEMORY[0x263F38368]);
    int v44 = (void *)[v43 initWithPixelWidth:v94 pixelHeight:HIDWORD(v94)];
    [v31 addBitmap:v44];
    objc_msgSend(v44, "setPixelFormat:", objc_msgSend(v31, "pixelFormat"));
    uint64_t v45 = [v44 bitmapContext];
    if (!v45)
    {

      [(TDPhotoshopRenditionSpec *)v19 _logError:@"ERROR: Could not create bitmap context"];
      return 0;
    }
    CGPoint v42 = (CGContext *)v45;
    double v67 = v44;
    [v75 boundsAtLayer:v22];
    CGContextSetCompositeOperation();
    CGContextSetAlpha(v42, 1.0);
  }
  int v46 = HIDWORD(v93);
  if (SHIDWORD(v93) >= 1)
  {
    uint64_t v47 = 0;
    double v48 = 0.0;
    do
    {
      int v49 = v99[v47];
      if (v49)
      {
        uint64_t v50 = v93;
        if ((int)v93 >= 1)
        {
          double v51 = 0.0;
          while (1)
          {
            int v52 = v97[(v50 - 1)];
            if (v52)
            {
              int v53 = v99[v47];
              LODWORD(v65) = v74;
              uint64_t v54 = v19;
              uint64_t v55 = [(TDPhotoshopRenditionSpec *)v19 psdSliceNumberForRenditionRow:v73 sliceRow:(v50 - 1) renditionColumn:v72 sliceColumn:v47 rowsPerRendition:v93 columnsPerRendition:HIDWORD(v93) renditionColumnCount:v65];
              LOBYTE(v83) = 0;
              uint64_t v56 = [v75 imageFromSlice:v55 atLayer:v22 isEmptyImage:&v83];
              if (!v56)
              {
                -[TDPhotoshopRenditionSpec _logError:](v19, "_logError:", [NSString stringWithFormat:@"ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n", objc_msgSend((id)objc_msgSend(v68, "asset"), "name")]);

                return 0;
              }
              double v57 = (double)v52;
              if (!v71)
              {
                double v58 = (void *)v56;
                CGContextSaveGState(v42);
                v102.origin.double x = v48;
                v102.origin.double y = v51;
                v102.size.double width = (double)v53;
                v102.size.double height = (double)v52;
                CGContextClipToRect(v42, v102);
                double v59 = (double)(int)v100[v47];
                int v60 = vcvtpd_s64_f64((double)(int)v99[v47] / v59);
                if (v60 >= 1)
                {
                  double v61 = v48;
                  do
                  {
                    double v62 = (CGImage *)[v58 image];
                    v103.origin.double x = v61;
                    v103.origin.double y = v51;
                    v103.size.double width = v59;
                    v103.size.double height = v57;
                    CGContextDrawImage(v42, v103, v62);
                    double v61 = v61 + v59;
                    --v60;
                  }
                  while (v60);
                }
                CGContextRestoreGState(v42);
              }
              objc_msgSend(v76, "addSliceRect:", v48, v51, (double)v53, v57);
              double v51 = v51 + (double)(int)v97[(v50 - 1)];
              double v19 = v54;
            }
            if (v50-- <= 1)
            {
              int v49 = v99[v47];
              int v46 = HIDWORD(v93);
              v40 = v76;
              break;
            }
          }
        }
        double v48 = v48 + (double)v49;
      }
      ++v47;
    }
    while (v47 < v46);
  }
  objc_msgSend(v40, "setExcludedFromContrastFilter:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec production](v19, "production"), "valueForKey:", @"isExcludedFromFilter"), "BOOLValue"));
  [v40 setAllowsPaletteImageCompression:a11];
  [v40 setAllowsHevcCompression:a12];
  [v40 setAllowsDeepmapImageCompression:a13];
  [v40 setAllowsDeepmap2ImageCompression:a14];
  double v23 = (void *)[v40 CSIRepresentationWithCompression:v69];

  return v23;
}

- (id)createCSIRepresentationFromGradientPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5
{
  __int16 v5 = a5;
  BOOL v6 = a4;
  double v9 = (void *)[(TDPhotoshopRenditionSpec *)self production];
  id v10 = objc_alloc(MEMORY[0x263F38370]);
  v11 = objc_msgSend(v10, "initWithCanvasSize:sliceCount:layout:", 0, 6, *MEMORY[0x263F08678], *(double *)(MEMORY[0x263F08678] + 8));
  objc_msgSend(v11, "setName:", objc_msgSend((id)objc_msgSend(v9, "asset"), "name"));
  [v11 setColorSpaceID:v5];
  objc_msgSend(v11, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](self, "isTintable"));
  objc_msgSend(v11, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v9, "asset"), "scaleFactor"));
  uint64_t v12 = [(TDPhotoshopRenditionSpec *)self _layerIndexInPSDImage:a3];
  v13 = (void *)[a3 layerRefAtIndex:v12];
  [v13 opacity];
  objc_msgSend(v11, "setOpacity:");
  objc_msgSend(v11, "setBlendMode:", objc_msgSend(v13, "blendMode"));
  objc_msgSend(v11, "setGradient:", objc_msgSend(a3, "gradientAtLayer:", v12));
  v14 = (void *)[v11 CSIRepresentationWithCompression:v6];

  return v14;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  BOOL v7 = a3;
  double v9 = (void *)[(TDPhotoshopRenditionSpec *)self production];
  uint64_t v10 = [v9 psdImageRefWithDocument:a5];
  if ([(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier] == 6)
  {
    return [(TDPhotoshopRenditionSpec *)self createCSIRepresentationFromGradientPSDImage:v10 withCompression:v7 colorSpaceID:a4];
  }
  else
  {
    uint64_t v20 = [v9 edgeMetricsMaskWithDocument:a5];
    uint64_t v19 = [v9 textMetricsMaskWithDocument:a5];
    uint64_t v18 = [v9 baselineMetricsMaskWithDocument:a5];
    uint64_t v12 = [v9 auxiliary1MetricsMaskWithDocument:a5];
    uint64_t v13 = [v9 auxiliary2MetricsMaskWithDocument:a5];
    char v14 = [a5 shouldAllowPaletteImageCompression];
    char v15 = [a5 shouldAllowHevcCompression];
    char v16 = [a5 shouldAllowDeepmapCompression];
    BYTE3(v17) = [a5 shouldAllowDeepmap2Compression];
    BYTE2(v17) = v16;
    BYTE1(v17) = v15;
    LOBYTE(v17) = v14;
    return -[TDPhotoshopRenditionSpec createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:](self, "createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:", v10, v7, v20, v19, v18, v12, v13, a4, v17);
  }
}

- (id)createCSIRepresentationFromPSDImage:(id)a3 withCompression:(BOOL)a4 colorSpaceID:(unint64_t)a5
{
  LODWORD(v6) = 0;
  return -[TDPhotoshopRenditionSpec createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:](self, "createCSIRepresentationFromPSDImage:withCompression:edgeMetricsMask:textMetricsMask:baselineMetricsMask:auxiliary1MetricsMask:auxiliary2MetricsMask:colorSpaceID:allowsPaletteImageCompression:allowsHevcCompression:allowsDeepmapImageCompression:allowsDeepmap2ImageCompression:", a3, a4, 0, 0, 0, 0, 0, a5, v6);
}

- (int)_layerIndexInPSDImage:(id)a3
{
  if (_layerIndexInPSDImage__pred != -1) {
    dispatch_once(&_layerIndexInPSDImage__pred, &__block_literal_global_2);
  }
  if (![(TDPhotoshopRenditionSpec *)self photoshopLayer]
    || _layerIndexInPSDImage__usingOldStylePSDFiles)
  {
    BOOL v7 = (void *)[(TDPhotoshopRenditionSpec *)self valueForKey:@"layer"];
    return [v7 unsignedIntValue];
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)-[TDPhotoshopRenditionSpec photoshopLayer](self, "photoshopLayer"), "hierarchicalLayerNames");
    return [a3 absoluteLayerIndexFromLayerNames:v5];
  }
}

uint64_t __50__TDPhotoshopRenditionSpec__layerIndexInPSDImage___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"TEUseOldStylePSDLayout");
  _layerIndexInPSDImage__usingOldStylePSDFiles = result;
  return result;
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"row"), @"row");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"column"), @"column");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"layer"), @"layer");
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"isTintable"), @"isTintable");
  uint64_t v5 = [(TDPhotoshopRenditionSpec *)self preserveForArchiveOnly];

  [a3 setPreserveForArchiveOnly:v5];
}

- (id)copyDataFromAttributes
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(TDPhotoshopRenditionSpec *)self valueForKey:@"row"];
  if (v4) {
    [v3 setObject:v4 forKey:@"row"];
  }
  uint64_t v5 = [(TDPhotoshopRenditionSpec *)self valueForKey:@"column"];
  if (v5) {
    [v3 setObject:v5 forKey:@"column"];
  }
  uint64_t v6 = [(TDPhotoshopRenditionSpec *)self valueForKey:@"layer"];
  if (v6) {
    [v3 setObject:v6 forKey:@"layer"];
  }
  BOOL v7 = (void *)[(TDPhotoshopRenditionSpec *)self keySpec];
  if (v7) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v7, "copyDataFromAttributes"), @"keySpec");
  }
  v8 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v8 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"row"];
  if (v5) {
    [(TDPhotoshopRenditionSpec *)self setValue:v5 forKey:@"row"];
  }
  uint64_t v6 = [v4 objectForKey:@"column"];
  if (v6) {
    [(TDPhotoshopRenditionSpec *)self setValue:v6 forKey:@"column"];
  }
  uint64_t v7 = [v4 objectForKey:@"layer"];
  if (v7)
  {
    [(TDPhotoshopRenditionSpec *)self setValue:v7 forKey:@"layer"];
  }
}

- (BOOL)updatePackingPropertiesWithDocument:(id)a3
{
  uint64_t v4 = self;
  uint64_t v78 = *MEMORY[0x263EF8340];
  v71.receiver = self;
  v71.super_class = (Class)TDPhotoshopRenditionSpec;
  -[TDRenditionSpec updatePackingPropertiesWithDocument:](&v71, sel_updatePackingPropertiesWithDocument_);
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  unsigned int v68 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  memset(v65, 0, sizeof(v65));
  uint64_t v5 = (void *)[(TDPhotoshopRenditionSpec *)v4 production];
  uint64_t v6 = (void *)[v5 psdImageRefWithDocument:a3];
  if ([(TDThemeConstant *)[(TDRenditionSpec *)v4 renditionType] identifier] != 6)
  {
    if (![(TDPhotoshopRenditionSpec *)v4 _sliceRectanglesForPSDImage:v6 rowsPerRendition:&v69 columnsPerRendition:(char *)&v69 + 4 originalColumnWidth:v77 newColumnWidth:v76 originalRowHeight:v75 newRowHeight:v74 originalColumnX:v73 originalRowY:v72 newRenditionSize:&v70 newSliceCount:&v68 renditionRect:&v66 throwawaySliceRect:v65])
    {
      if (!v6)
      {
        NSLog(&cfstr_CouldnTReadPsd.isa, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "asset"), "fileURLWithDocument:", a3), "path"));
        return 0;
      }
      return 1;
    }
    [(TDPhotoshopRenditionSpec *)v4 setWidth:v70];
    [(TDPhotoshopRenditionSpec *)v4 setHeight:HIDWORD(v70)];
  }
  if (![a3 shouldPerformHistogramBasedPacking]) {
    return 1;
  }
  __int16 v7 = [(TDThemeConstant *)[(TDRenditionSpec *)v4 renditionType] identifier];
  uint64_t v8 = [(TDPhotoshopRenditionSpec *)v4 _layerIndexInPSDImage:v6];
  int v58 = objc_msgSend((id)objc_msgSend(v5, "columnCount"), "intValue");
  unsigned int v57 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v4, "valueForKey:", @"row"), "intValue");
  unsigned int v56 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](v4, "valueForKey:", @"column"), "intValue");
  [v6 size];
  if ([v5 renditionSubtype]) {
    __int16 v7 = objc_msgSend((id)objc_msgSend(v5, "renditionSubtype"), "identifier");
  }
  BOOL result = 1;
  if (v70 && HIDWORD(v70))
  {
    if ([(TDPhotoshopRenditionSpec *)v4 parentRendition])
    {
      [(TDRenditionSpec *)v4 packedPoint];
      double v11 = v10;
      double v13 = v12;
      id v14 = objc_alloc(MEMORY[0x263F38370]);
      char v15 = objc_msgSend(v14, "initWithInternalReferenceRect:layout:", v7, v11, v13, (double)(int)v70, (double)SHIDWORD(v70));
      id v16 = objc_alloc_init(MEMORY[0x263F383C0]);
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopRenditionSpec parentRendition](v4, "parentRendition"), "keySpec"), "key"));
      [v16 setReferenceKey:v17];
      [v15 addLayerReference:v16];
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x263F38370]);
      char v15 = objc_msgSend(v18, "initWithCanvasSize:sliceCount:layout:", v68, v7, (double)(int)v70, (double)SHIDWORD(v70));
    }
    objc_msgSend(v15, "setName:", objc_msgSend((id)objc_msgSend(v5, "asset"), "name"));
    objc_msgSend(v15, "setIsTintable:", -[TDPhotoshopRenditionSpec isTintable](v4, "isTintable"));
    objc_msgSend(v15, "setAllowsDeepmapImageCompression:", objc_msgSend(a3, "shouldAllowDeepmapCompression"));
    objc_msgSend(v15, "setAllowsDeepmap2ImageCompression:", objc_msgSend(a3, "shouldAllowDeepmap2Compression"));
    objc_msgSend(v15, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v4, "propertiesAsDictionary"));
    objc_msgSend(v15, "setScaleFactor:", objc_msgSend((id)objc_msgSend(v5, "asset"), "scaleFactor"));
    long long v19 = *(_OWORD *)(MEMORY[0x263F38358] + 16);
    long long v63 = *MEMORY[0x263F38358];
    long long v64 = v19;
    uint64_t v20 = *(void *)(MEMORY[0x263F38358] + 32);
    uint64_t v21 = *(void *)(MEMORY[0x263F38358] + 40);
    long long v59 = v63;
    long long v60 = v19;
    uint64_t v61 = v20;
    uint64_t v62 = v21;
    if (CSIEqualMetrics())
    {
      uint64_t v21 = *((void *)&v67 + 1);
      uint64_t v20 = v67;
      long long v63 = 0u;
      long long v64 = 0u;
    }
    long long v59 = v63;
    long long v60 = v64;
    uint64_t v61 = v20;
    uint64_t v62 = v21;
    [v15 addMetrics:&v59];
    unsigned int v22 = (void *)[v6 layerRefAtIndex:v8];
    objc_msgSend(v15, "setBlendMode:", objc_msgSend(v22, "blendMode"));
    [v22 opacity];
    objc_msgSend(v15, "setOpacity:");
    uint64_t v55 = [(TDPhotoshopRenditionSpec *)v4 parentRendition];
    if (v55)
    {
      int v52 = v5;
      [v6 boundsAtLayer:v8];
      double v51 = 0;
      double v23 = 0;
      goto LABEL_20;
    }
    id v24 = objc_alloc(MEMORY[0x263F38368]);
    uint64_t v25 = (void *)[v24 initWithPixelWidth:v70 pixelHeight:HIDWORD(v70)];
    [v15 addBitmap:v25];
    uint64_t v26 = [v25 bitmapContext];
    if (v26)
    {
      double v23 = (CGContext *)v26;
      double v51 = v25;
      int v52 = v5;
      [v6 boundsAtLayer:v8];
      CGContextSetCompositeOperation();
      CGContextSetAlpha(v23, 1.0);
LABEL_20:
      int v27 = HIDWORD(v69);
      if (SHIDWORD(v69) >= 1)
      {
        uint64_t v28 = 0;
        double v29 = 0.0;
        unsigned int v54 = v8;
        int v53 = v4;
        do
        {
          int v30 = v76[v28];
          if (v30)
          {
            uint64_t v31 = v69;
            if ((int)v69 >= 1)
            {
              double v32 = 0.0;
              while (1)
              {
                int v33 = v74[(v31 - 1)];
                if (v33)
                {
                  id v34 = v15;
                  int v35 = v76[v28];
                  LODWORD(v50) = v58;
                  uint64_t v36 = v28;
                  uint64_t v37 = -[TDPhotoshopRenditionSpec psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:](v4, "psdSliceNumberForRenditionRow:sliceRow:renditionColumn:sliceColumn:rowsPerRendition:columnsPerRendition:renditionColumnCount:", v57, (v31 - 1), v56, v50);
                  LOBYTE(v59) = 0;
                  uint64_t v38 = v6;
                  uint64_t v39 = [v6 imageFromSlice:v37 atLayer:v54 isEmptyImage:&v59];
                  if (!v39)
                  {
                    -[TDPhotoshopRenditionSpec _logError:](v53, "_logError:", [NSString stringWithFormat:@"ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n", objc_msgSend((id)objc_msgSend(v52, "asset"), "name")]);

                    return 0;
                  }
                  double v40 = (double)v35;
                  double v41 = (double)v33;
                  char v15 = v34;
                  if (!v55)
                  {
                    CGPoint v42 = (void *)v39;
                    CGContextSaveGState(v23);
                    v79.origin.double x = v29;
                    v79.origin.double y = v32;
                    v79.size.double width = v40;
                    v79.size.double height = (double)v33;
                    CGContextClipToRect(v23, v79);
                    double v43 = (double)(int)v77[v36];
                    int v44 = vcvtpd_s64_f64((double)(int)v76[v36] / v43);
                    if (v44 >= 1)
                    {
                      double v45 = v29;
                      do
                      {
                        int v46 = (CGImage *)[v42 image];
                        v80.origin.double x = v45;
                        v80.origin.double y = v32;
                        v80.size.double width = v43;
                        v80.size.double height = v41;
                        CGContextDrawImage(v23, v80, v46);
                        double v45 = v45 + v43;
                        --v44;
                      }
                      while (v44);
                    }
                    CGContextRestoreGState(v23);
                  }
                  objc_msgSend(v34, "addSliceRect:", v29, v32, v40, v41);
                  double v32 = v32 + (double)(int)v74[(v31 - 1)];
                  uint64_t v6 = v38;
                  uint64_t v4 = v53;
                  uint64_t v28 = v36;
                }
                if (v31-- <= 1)
                {
                  int v30 = v76[v28];
                  int v27 = HIDWORD(v69);
                  break;
                }
              }
            }
            double v29 = v29 + (double)v30;
          }
          ++v28;
        }
        while (v28 < v27);
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v52, "asset"), "name"), "containsString:", @"Mask"))
      {
        uint64_t IsMonochrome = 1;
        int v49 = v51;
      }
      else
      {
        int v49 = v51;
        if (!CGBitmapContextCreateImage(v23))
        {
LABEL_44:

          return 1;
        }
        uint64_t IsMonochrome = CUIImageIsMonochrome();
      }
      [(TDPhotoshopRenditionSpec *)v4 setMonochrome:IsMonochrome];
      goto LABEL_44;
    }

    [(TDPhotoshopRenditionSpec *)v4 _logError:@"ERROR: Could not create bitmap context"];
    return 0;
  }
  return result;
}

- (void)drawPackableRenditionInContext:(CGContext *)a3 withDocument:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if ([(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier] != 6)
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    int v40 = 0;
    memset(v39, 0, sizeof(v39));
    memset(v38, 0, sizeof(v38));
    [(TDRenditionSpec *)self packedPoint];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v11 = (void *)[(TDPhotoshopRenditionSpec *)self production];
    double v12 = (void *)[v11 psdImageRefWithDocument:a4];
    unsigned int v35 = [(TDPhotoshopRenditionSpec *)self _layerIndexInPSDImage:v12];
    uint64_t v31 = v11;
    int v34 = objc_msgSend((id)objc_msgSend(v11, "columnCount"), "intValue");
    unsigned int v33 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"row"), "intValue");
    unsigned int v32 = objc_msgSend((id)-[TDPhotoshopRenditionSpec valueForKey:](self, "valueForKey:", @"column"), "intValue");
    [v12 size];
    uint64_t v36 = v12;
    if ([(TDPhotoshopRenditionSpec *)self _sliceRectanglesForPSDImage:v12 rowsPerRendition:&v41 columnsPerRendition:(char *)&v41 + 4 originalColumnWidth:v48 newColumnWidth:v47 originalRowHeight:v46 newRowHeight:v45 originalColumnX:v44 originalRowY:v43 newRenditionSize:&v42 newSliceCount:&v40 renditionRect:v39 throwawaySliceRect:v38])
    {
      [v12 boundsAtLayer:v35];
      int v13 = HIDWORD(v41);
      if (SHIDWORD(v41) >= 1)
      {
        uint64_t v14 = 0;
        double v15 = 0.0;
        do
        {
          int v16 = v47[v14];
          if (v16)
          {
            uint64_t v17 = v41;
            if ((int)v41 >= 1)
            {
              double v18 = 0.0;
              while (1)
              {
                int v19 = v45[(v17 - 1)];
                if (v19)
                {
                  int v20 = v47[v14];
                  LODWORD(v30) = v34;
                  uint64_t v21 = [(TDPhotoshopRenditionSpec *)self psdSliceNumberForRenditionRow:v33 sliceRow:(v17 - 1) renditionColumn:v32 sliceColumn:v14 rowsPerRendition:v41 columnsPerRendition:HIDWORD(v41) renditionColumnCount:v30];
                  char v37 = 0;
                  uint64_t v22 = [v36 imageFromSlice:v21 atLayer:v35 isEmptyImage:&v37];
                  if (!v22)
                  {
                    -[TDPhotoshopRenditionSpec _logError:](self, "_logError:", [NSString stringWithFormat:@"ERROR: Unable to extract Photoshop image: %@\nThings to check:\n1. Are any Photoshop layers missing when compared to the reference file?\n2. Are any of the layer names not matching the layer names in the reference file (case sensitive)?\n3. Are there the same number of slices as in the reference file?\n", objc_msgSend((id)objc_msgSend(v31, "asset"), "name")]);
                    return;
                  }
                  double v23 = (void *)v22;
                  double v24 = (double)v19;
                  CGContextSaveGState(a3);
                  CGContextTranslateCTM(a3, v8, v10);
                  v50.origin.double x = v15;
                  v50.origin.double y = v18;
                  v50.size.double width = (double)v20;
                  v50.size.double height = (double)v19;
                  CGContextClipToRect(a3, v50);
                  double v25 = (double)(int)v48[v14];
                  int v26 = vcvtpd_s64_f64((double)(int)v47[v14] / v25);
                  if (v26 >= 1)
                  {
                    double v27 = v15;
                    do
                    {
                      uint64_t v28 = (CGImage *)[v23 image];
                      v51.origin.double x = v27;
                      v51.origin.double y = v18;
                      v51.size.double width = v25;
                      v51.size.double height = v24;
                      CGContextDrawImage(a3, v51, v28);
                      double v27 = v27 + v25;
                      --v26;
                    }
                    while (v26);
                  }
                  CGContextRestoreGState(a3);
                  double v18 = v18 + (double)(int)v45[(v17 - 1)];
                }
                if (v17-- <= 1)
                {
                  int v16 = v47[v14];
                  int v13 = HIDWORD(v41);
                  break;
                }
              }
            }
            double v15 = v15 + (double)v16;
          }
          ++v14;
        }
        while (v14 < v13);
      }
    }
  }
}

- (TDImageColorHistogram)histogram
{
  return self->_histogram;
}

- (void)setHistogram:(id)a3
{
}

@end