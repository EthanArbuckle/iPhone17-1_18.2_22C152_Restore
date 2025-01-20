@interface CPTableMaker
+ (BOOL)isTable:(id)a3;
+ (void)makeTableFrom:(id)a3;
+ (void)makeTablesInPage:(id)a3;
+ (void)makeTablesInZone:(id)a3;
- (CPTableMaker)initWithZone:(id)a3;
- (id)newBackgroundGraphicArrayFromRectangularZone:(id)a3;
- (id)newTableCellFromZone:(id)a3;
- (void)dealloc;
- (void)determineRowsAndColumns:(BOOL)a3;
- (void)makeTable;
@end

@implementation CPTableMaker

- (void)makeTable
{
  id v3 = [(CPObject *)self->tableZone parent];
  if (v3)
  {
    v4 = v3;
    v5 = [CPTable alloc];
    [(CPZone *)self->tableZone zoneBounds];
    self->table = -[CPTable initWithBounds:](v5, "initWithBounds:");
    id v6 = [(CPTableMaker *)self newBackgroundGraphicArrayFromRectangularZone:self->tableZone];
    [(CPTable *)self->table setBackgroundGraphics:v6];

    self->cellIndex = 0;
    unsigned int v7 = [(CPObject *)self->tableZone count];
    self->rowYIntervals = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(32 * v7, 0x1000040451B5BE8uLL);
    self->columnXIntervals = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(32 * v7, 0x1000040451B5BE8uLL);
    if (v7)
    {
      uint64_t v8 = 0;
      do
      {
        id v9 = [(CPObject *)self->tableZone childAtIndex:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          +[CPTableMaker makeTablesInZone:v9];
          id v10 = [(CPTableMaker *)self newTableCellFromZone:v9];
          uint64_t v11 = [v9 zOrder];
          v12 = (void *)[v9 newTakeChildren];
          [v10 setChildren:v12];
          [v10 setZOrder:v11];

          [(CPChunk *)self->table add:v10];
          ++self->cellIndex;
        }
        uint64_t v8 = (v8 + 1);
      }
      while (v7 != v8);
    }
    [(CPTableMaker *)self determineRowsAndColumns:1];
    [(CPTableMaker *)self determineRowsAndColumns:0];
    free(self->columnXIntervals);
    self->columnXIntervals = 0;
    free(self->rowYIntervals);
    self->rowYIntervals = 0;
    [(CPChunk *)self->table sortUsingSelector:sel_compareCellOrdinal_];
    uint64_t v13 = [v4 indexOf:self->tableZone];
    [(CPObject *)self->tableZone remove];
    table = self->table;
    [v4 add:table atIndex:v13];
  }
}

- (void)determineRowsAndColumns:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 40;
  if (a3) {
    uint64_t v5 = 32;
  }
  id v6 = *(char **)((char *)&self->super.isa + v5);
  size_t v7 = 2 * [(CPObject *)self->table count];
  if (v7)
  {
    uint64_t v8 = (unsigned int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    id v9 = v8;
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = i;
    qsort_r(v8, v7, 4uLL, v6, (int (__cdecl *)(void *, const void *, const void *))compareIntervalIndirect);
    size_t v69 = v7;
    v70 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    _DWORD *v70 = 0;
    uint64_t v11 = (double *)&v6[16 * *v9];
    double v12 = *v11;
    double v13 = v11[1];
    double v14 = *v11 + v13 * 0.5;
    uint64_t v15 = 1;
    unsigned int v16 = 1;
    do
    {
      v17 = (double *)&v6[16 * v9[v15]];
      double v18 = *v17;
      double v19 = v17[1];
      double v12 = CGIntervalIntersection(v12, v13, *v17, v19);
      if (fabs(v12) == INFINITY || (uint64_t v20 = v15 + 1, v15 + 1 == v7) && v16 == 1)
      {
        double v21 = v18 + v19 * 0.5;
        unint64_t v22 = v70[v16 - 1];
        if (v15 - 1 <= v22)
        {
          int v25 = v15;
        }
        else
        {
          int v23 = v15 - 2;
          if (v22 < (int)v15 - 2) {
            int v23 = v70[v16 - 1];
          }
          int v24 = v23 + 1;
          int v25 = v15;
          double v26 = v18 + v19 * 0.5;
          do
          {
            v27 = (double *)&v6[16 * v9[v25 - 1]];
            double v28 = *v27;
            double v29 = v27[1];
            double v30 = CGIntervalIntersection(v18, v19, *v27, v29);
            if (fabs(v30) == INFINITY || v28 + v29 * 0.5 - v14 <= v21 - (v28 + v29 * 0.5))
            {
              double v21 = v26;
              goto LABEL_22;
            }
            unsigned int v33 = v25 - 2;
            --v25;
            double v19 = v31;
            double v18 = v30;
            double v26 = v28 + v29 * 0.5;
          }
          while (v33 > v22);
          int v25 = v24;
          double v21 = v28 + v29 * 0.5;
          double v18 = v30;
          double v19 = v31;
LABEL_22:
          size_t v7 = v69;
        }
        v70[v16++] = v25;
        uint64_t v20 = v15 + 1;
        double v12 = v18;
        double v13 = v19;
        double v14 = v21;
      }
      uint64_t v15 = v20;
    }
    while (v20 != v7);
    table = self->table;
    uint64_t v35 = v16 - 1;
    if (v3)
    {
      -[CPTable setRowCount:](table, "setRowCount:", v35, v12, v13);
      v36 = [(CPTable *)self->table rowY];
    }
    else
    {
      -[CPTable setColumnCount:](table, "setColumnCount:", v35, v12, v13);
      v36 = [(CPTable *)self->table columnX];
    }
    v37 = v36;
    unsigned int v68 = v16;
    if (v16)
    {
      uint64_t v38 = 0;
      unint64_t v39 = v68;
      do
      {
        uint64_t v40 = v38 + 1;
        unsigned int v41 = v7;
        if (v38 + 1 < v39) {
          unsigned int v41 = v70[v40];
        }
        uint64_t v42 = v70[v38];
        v43 = (double *)&v6[16 * v9[v42]];
        double v44 = *v43;
        double v45 = v43[1];
        uint64_t v46 = (v42 + 1);
        do
        {
          double v47 = v45;
          double v48 = v44;
          if (v46 >= v41) {
            break;
          }
          v49 = (double *)&v6[16 * v9[v46]];
          double v44 = CGIntervalIntersection(v44, v45, *v49, v49[1]);
          ++v46;
        }
        while (fabs(v44) != INFINITY);
        v37[v38++] = v48 + v47 * 0.5;
        unint64_t v39 = v68;
        LODWORD(v7) = v69;
      }
      while (v40 != v68);
      unint64_t v50 = 0;
      do
      {
        uint64_t v51 = v50++;
        unsigned int v52 = v7;
        if (v50 < v39) {
          unsigned int v52 = v70[v50];
        }
        uint64_t v53 = v70[v51];
        if (v52 > v53)
        {
          int v54 = v52 - v53;
          v55 = &v9[v53];
          do
          {
            unsigned int v57 = *v55++;
            char v56 = v57;
            id v58 = [(CPObject *)self->table childAtIndex:v57 >> 1];
            v59 = v58;
            if (v3)
            {
              uint64_t v60 = [v58 rowSpan];
              if (v56) {
                uint64_t v62 = v68 + ~v51;
              }
              else {
                uint64_t v62 = v51;
              }
              if (v56) {
                uint64_t v63 = v51 - v60;
              }
              else {
                uint64_t v63 = v61;
              }
              objc_msgSend(v59, "setRowSpan:", v62, v63);
            }
            else
            {
              uint64_t v64 = [v58 columnSpan];
              if (v56) {
                uint64_t v66 = v64;
              }
              else {
                uint64_t v66 = v51;
              }
              if (v56) {
                uint64_t v67 = v51 - v64;
              }
              else {
                uint64_t v67 = v65;
              }
              objc_msgSend(v59, "setColumnSpan:", v66, v67);
            }
            --v54;
          }
          while (v54);
        }
        unint64_t v39 = v68;
        LODWORD(v7) = v69;
      }
      while (v50 != v68);
    }
    free(v70);
    free(v9);
  }
}

- (id)newTableCellFromZone:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [CPTableCell alloc];
  [a3 zoneBounds];
  id v6 = -[CPTableCell initWithBounds:](v5, "initWithBounds:");
  id v7 = [(CPTableMaker *)self newBackgroundGraphicArrayFromRectangularZone:a3];
  [(CPTableCell *)v6 setBackgroundGraphics:v7];

  if ([a3 rectangleBordersAtLeft:v35 top:v32 right:&v33 bottom:&v34])
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      [*(id *)&v32[8 * i] bounds];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      v17 = (void *)[*(id *)&v32[8 * i] graphicObjects];
      -[CPTableCell setBorder:bounds:graphics:](v6, "setBorder:bounds:graphics:", i, [v17 sortedArrayUsingSelector:sel_compareZ_], v10, v12, v14, v16);
      double v18 = v10 + -2.0;
      double v19 = v12 + -2.0;
      switch((int)i)
      {
        case 0:
          rowYIntervals = self->rowYIntervals;
          unsigned int v21 = (2 * self->cellIndex) | 1;
          goto LABEL_7;
        case 1:
          columnXIntervals = self->columnXIntervals;
          unsigned int v23 = (2 * self->cellIndex) | 1;
          goto LABEL_9;
        case 2:
          rowYIntervals = self->rowYIntervals;
          unsigned int v21 = 2 * self->cellIndex;
LABEL_7:
          p_var0 = &rowYIntervals[v21].var0;
          double *p_var0 = v19;
          goto LABEL_10;
        case 3:
          columnXIntervals = self->columnXIntervals;
          unsigned int v23 = 2 * self->cellIndex;
LABEL_9:
          p_var0 = &columnXIntervals[v23].var0;
          double *p_var0 = v18;
          double v16 = v14;
LABEL_10:
          double v18 = v16 + 4.0;
          p_var0[1] = v16 + 4.0;
          break;
        default:
          break;
      }
      uint64_t v25 = objc_msgSend(v17, "count", v18, v19);
      if (v25)
      {
        uint64_t v26 = 0;
        do
        {
          v27 = (void *)[v17 objectAtIndex:v26];
          if ([v27 parent]) {
            [v27 setUser:self->table];
          }
          ++v26;
        }
        while (v25 != v26);
      }
      int v28 = [*(id *)&v32[8 * i] neighborCount];
      if (v28)
      {
        int v29 = v28;
        uint64_t v30 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&v32[8 * i], "neighborAtIndex:", v30), "neighborShape"), "setUser:", self->table);
          uint64_t v30 = (v30 + 1);
        }
        while (v29 != v30);
      }
    }
  }
  else
  {
    self->rowYIntervals[2 * self->cellIndex] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->rowYIntervals[(2 * self->cellIndex) | 1] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->columnXIntervals[2 * self->cellIndex] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
    self->columnXIntervals[(2 * self->cellIndex) | 1] = ($F24F406B2B787EFB06265DBA3D28CBD5)CGIntervalNull;
  }
  return v6;
}

- (id)newBackgroundGraphicArrayFromRectangularZone:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v44 = 0;
  id v45 = 0;
  id v42 = 0;
  id v43 = 0;
  if ([a3 rectangleBordersAtLeft:&v45 top:&v44 right:&v43 bottom:&v42])
  {
    int v5 = [v45 neighborCount];
    int v6 = [v44 neighborCount];
    unsigned int v7 = [v43 neighborCount];
    int v8 = [v42 neighborCount];
    if (v5)
    {
      if (v6)
      {
        if (v7)
        {
          int v9 = v8;
          if (v8)
          {
            unsigned int v41 = v4;
            [a3 zoneBounds];
            CGFloat v11 = v10;
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            CGFloat v17 = v16;
            uint64_t v18 = 0;
            do
            {
              double v19 = (void *)[v45 neighborAtIndex:v18];
              uint64_t v20 = (void *)[v19 neighborShape];
              unint64_t v21 = [v20 fillColor];
              if (v21)
              {
                double v29 = (v21 & 0x8000000000000000) != 0
                    ? CGTaggedColorGetAlpha(v21, v22, v23, v24, v25, v26, v27, v28)
                    : *(double *)(v21 + 8 * *(void *)(v21 + 56) + 56);
                if (v29 != 0.0)
                {
                  [v20 renderedBounds];
                  v47.origin.x = v30;
                  v47.origin.y = v31;
                  v47.size.width = v32;
                  v47.size.height = v33;
                  v46.origin.x = v11;
                  v46.origin.y = v13;
                  v46.size.width = v15;
                  v46.size.height = v17;
                  if (CGRectIntersectsRect(v46, v47) && [v19 shapeSide] == 2)
                  {
                    uint64_t v34 = 0;
                    while (1)
                    {
                      uint64_t v35 = (void *)[v44 neighborAtIndex:v34];
                      if ((void *)[v35 neighborShape] == v20
                        && [v35 shapeSide] == 3)
                      {
                        break;
                      }
LABEL_25:
                      uint64_t v34 = (v34 + 1);
                      if (v34 == v6) {
                        goto LABEL_28;
                      }
                    }
                    uint64_t v36 = 0;
                    while (1)
                    {
                      v37 = (void *)[v43 neighborAtIndex:v36];
                      if ((void *)[v37 neighborShape] == v20
                        && [v37 shapeSide] == 4)
                      {
                        break;
                      }
LABEL_24:
                      uint64_t v36 = (v36 + 1);
                      if (v36 >= v7) {
                        goto LABEL_25;
                      }
                    }
                    uint64_t v38 = 0;
                    while (1)
                    {
                      unint64_t v39 = (void *)[v42 neighborAtIndex:v38];
                      if ((void *)[v39 neighborShape] == v20
                        && [v39 shapeSide] == 1)
                      {
                        break;
                      }
                      uint64_t v38 = (v38 + 1);
                      if (v9 == v38) {
                        goto LABEL_24;
                      }
                    }
                    [v41 addObject:v20];
                  }
                }
              }
LABEL_28:
              uint64_t v18 = (v18 + 1);
            }
            while (v18 != v5);
            id v4 = v41;
            [v41 sortUsingSelector:sel_compareZ_];
          }
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPTableMaker;
  [(CPTableMaker *)&v3 dealloc];
}

- (CPTableMaker)initWithZone:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPTableMaker;
  id v4 = [(CPTableMaker *)&v6 init];
  if (v4) {
    v4->tableZone = (CPZone *)a3;
  }
  return v4;
}

+ (void)makeTablesInPage:(id)a3
{
  uint64_t v3 = [a3 firstDescendantOfClass:objc_opt_class()];
  if (v3)
  {
    +[CPTableMaker makeTablesInZone:v3];
  }
}

+ (void)makeTablesInZone:(id)a3
{
  int v4 = [a3 count];
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [a3 childAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (+[CPTableMaker isTable:v7]) {
          +[CPTableMaker makeTableFrom:v7];
        }
        else {
          +[CPTableMaker makeTablesInZone:v7];
        }
      }
      uint64_t v6 = (v6 + 1);
    }
    while (v5 != v6);
  }
}

+ (void)makeTableFrom:(id)a3
{
  uint64_t v3 = [[CPTableMaker alloc] initWithZone:a3];
  [(CPTableMaker *)v3 makeTable];
}

+ (BOOL)isTable:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    LOBYTE(v4) = 0;
    return v4;
  }
  int v4 = [a3 isRectangular];
  if (v4)
  {
    unsigned int v5 = [a3 count];
    if (v5 >= 2)
    {
      unsigned int v6 = v5;
      uint64_t v7 = 0;
      while (1)
      {
        int v8 = (void *)[a3 childAtIndex:v7];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || ([v8 isRectangular] & 1) == 0) {
          break;
        }
        uint64_t v7 = (v7 + 1);
        if (v6 == v7)
        {
          LOBYTE(v4) = [a3 firstDescendantOfClass:objc_opt_class()] != 0;
          return v4;
        }
      }
    }
    goto LABEL_4;
  }
  return v4;
}

@end