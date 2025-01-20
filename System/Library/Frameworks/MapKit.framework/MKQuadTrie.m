@interface MKQuadTrie
- (BOOL)contains:(id)a3;
- (BOOL)remove:(id)a3;
- (MKQuadTrie)initWithInitialRegion:(id)a3 minimumSize:(id)a4 maximumItems:(unsigned int)a5;
- (id)_itemsInMapRect:(id)a3;
- (id)allItems;
- (id)breadthFirstDescription;
- (id)depthFirstDescription;
- (id)description;
- (id)itemDescriptions;
- (id)itemsInMapRect:(id)a3;
- (id)itemsPassingRectTest:(id)a3 coordinateTest:(id)a4;
- (unint64_t)count;
- (void)clearAllItemsPerforming:(id)a3;
- (void)dealloc;
- (void)foreach:(id)a3;
- (void)insert:(id)a3;
@end

@implementation MKQuadTrie

- (BOOL)remove:(id)a3
{
  id v4 = a3;
  root = (double *)self->__root;
  double v6 = *root;
  double v7 = root[1];
  double v8 = root[2];
  double v9 = root[3];
  id v10 = v4;
  [v10 coordinate];
  double v13 = MKTilePointForCoordinate(v11, v12, 21.0);
  double v15 = v14;

  v43.origin.x = v6;
  v43.origin.y = v7;
  v43.size.width = v8;
  v43.size.height = v9;
  v42.x = v13;
  v42.y = v15;
  if (MKMapRectContainsPoint(v43, v42))
  {
    v16 = self->__root;
    id v17 = v10;
    v18 = *(id ***)(_insertionNodeForItem(v17, (uint64_t)v16) + 32);
    v20 = *v18;
    v19 = v18[1];
    if (v19 == *v18)
    {
LABEL_12:

LABEL_18:
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 0;
      v33 = self->__root;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __21__MKQuadTrie_remove___block_invoke;
      v35[3] = &unk_1E54BB560;
      id v36 = v17;
      v37 = &v38;
      _breadthFirstApply(v33, v35);
      BOOL v29 = *((unsigned char *)v39 + 24) != 0;

      _Block_object_dispose(&v38, 8);
      goto LABEL_19;
    }
    unint64_t v21 = v19 - *v18;
    if (v21 <= 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = v19 - *v18;
    }
    if (*v20 != v17)
    {
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      uint64_t v25 = v22 - 1;
      while (v25 != v24)
      {
        id v26 = v20[v24 + 1];
        v23 += 0x100000000;
        ++v24;
        if (v26 == v17)
        {
          BOOL v27 = v24 < v21;
          uint64_t v28 = v23 >> 32;
          goto LABEL_14;
        }
      }
      goto LABEL_12;
    }
    uint64_t v28 = 0;
    BOOL v27 = 1;
LABEL_14:
    v30 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>(&v20[v28 + 1], v19, &v20[v28]);
    for (i = v18[1]; i != v30; --i)
    {
      v32 = *(i - 1);
    }
    v18[1] = v30;

    if (!v27) {
      goto LABEL_18;
    }
    BOOL v29 = 1;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_19:

  return v29;
}

- (void)insert:(id)a3
{
  id v10 = a3;
  [v10 coordinate];
  double v6 = MKTilePointForCoordinate(v4, v5, 21.0);
  double v8 = v7;

  root = (MKMapRect *)self->__root;
  v12.x = v6;
  v12.y = v8;
  if (MKMapRectContainsPoint(*root, v12)) {
    _insert(v10, (uint64_t)root, self);
  }
}

uint64_t __30__MKQuadTrie__itemsInMapRect___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)a2;
  double v5 = *(double *)(a2 + 8);
  double v6 = *(double *)(a2 + 16);
  double v7 = *(double *)(a2 + 24);
  double v8 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  double v11 = *(double *)(a1 + 64);
  v34.origin.x = *(double *)a2;
  v34.origin.y = v5;
  v34.size.width = v6;
  v34.size.height = v7;
  v37.origin.x = v8;
  v37.origin.y = v9;
  v37.size.width = v10;
  v37.size.height = v11;
  if (!MKMapRectIntersectsRect(v34, v37)) {
    return 1;
  }
  if (!*(void *)(a2 + 40))
  {
    double v13 = *(uint64_t **)(a2 + 32);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    unint64_t v16 = (v14 - *v13) >> 3;
    v35.origin.x = v8;
    v35.origin.y = v9;
    v35.size.width = v10;
    v35.size.height = v11;
    v38.origin.x = v4;
    v38.origin.y = v5;
    v38.size.width = v6;
    v38.size.height = v7;
    if (MKMapRectContainsRect(v35, v38))
    {
      if (v14 != v15)
      {
        uint64_t v17 = 0;
        unsigned int v18 = 1;
        do
        {
          [*(id *)(a1 + 32) addObject:*(void *)(**(void **)(a2 + 32) + 8 * v17)];
          uint64_t v17 = v18;
          BOOL v19 = v16 > v18++;
        }
        while (v19);
      }
    }
    else if (v14 != v15)
    {
      uint64_t v20 = 0;
      unsigned int v21 = 1;
      do
      {
        id v22 = *(id *)(**(void **)(a2 + 32) + 8 * v20);
        double v23 = *(double *)(a1 + 40);
        double v24 = *(double *)(a1 + 48);
        double v25 = *(double *)(a1 + 56);
        double v26 = *(double *)(a1 + 64);
        id v27 = v22;
        [v27 coordinate];
        double v30 = MKTilePointForCoordinate(v28, v29, 21.0);
        double v32 = v31;

        v36.origin.x = v23;
        v36.origin.y = v24;
        v36.size.width = v25;
        v36.size.height = v26;
        v33.x = v30;
        v33.y = v32;
        if (MKMapRectContainsPoint(v36, v33)) {
          [*(id *)(a1 + 32) addObject:v27];
        }

        uint64_t v20 = v21;
        BOOL v19 = v16 > v21++;
      }
      while (v19);
    }
  }
  return 0;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  root = (double *)self->__root;
  double v6 = *root;
  double v7 = root[1];
  double v8 = root[2];
  double v9 = root[3];
  id v10 = v4;
  [v10 coordinate];
  double v13 = MKTilePointForCoordinate(v11, v12, 21.0);
  double v15 = v14;

  v29.origin.x = v6;
  v29.origin.y = v7;
  v29.size.width = v8;
  v29.size.height = v9;
  v28.x = v13;
  v28.y = v15;
  if (MKMapRectContainsPoint(v29, v28))
  {
    unint64_t v16 = self->__root;
    id v17 = v10;
    uint64_t v18 = *(void *)(_insertionNodeForItem(v17, (uint64_t)v16) + 32);
    BOOL v19 = *(id **)v18;
    uint64_t v20 = *(void *)(v18 + 8) - *(void *)v18;
    if (v20)
    {
      unint64_t v21 = v20 >> 3;
      if (v21 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v21;
      }
      if (*v19 == v17)
      {
        BOOL v26 = 1;
      }
      else
      {
        unint64_t v23 = 0;
        double v24 = v19 + 1;
        while (v22 - 1 != v23)
        {
          id v25 = (id)v24[v23++];
          if (v25 == v17) {
            goto LABEL_15;
          }
        }
        unint64_t v23 = v22;
LABEL_15:
        BOOL v26 = v23 < v21;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (id)itemsPassingRectTest:(id)a3 coordinateTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:10];
    root = self->__root;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__MKQuadTrie_itemsPassingRectTest_coordinateTest___block_invoke;
    v15[3] = &unk_1E54BB5B0;
    id v17 = v6;
    id v12 = v10;
    id v16 = v12;
    id v18 = v8;
    __depthFirstApply((uint64_t)root, v15);
    double v13 = v18;
    id v9 = v12;
  }

  return v9;
}

uint64_t __50__MKQuadTrie_itemsPassingRectTest_coordinateTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16), *(double *)(a2 + 24));
  if (!v4) {
    return 1;
  }
  if (!*(void *)(a2 + 40))
  {
    uint64_t v7 = **(void **)(a2 + 32);
    uint64_t v6 = *(void *)(*(void *)(a2 + 32) + 8);
    unint64_t v8 = (v6 - v7) >> 3;
    if (v4 == 1)
    {
      if (v6 != v7)
      {
        uint64_t v9 = 0;
        unsigned int v10 = 1;
        do
        {
          [*(id *)(a1 + 32) addObject:*(void *)(**(void **)(a2 + 32) + 8 * v9)];
          uint64_t v9 = v10;
          BOOL v11 = v8 > v10++;
        }
        while (v11);
      }
    }
    else if (v6 != v7)
    {
      uint64_t v12 = 0;
      unsigned int v13 = 1;
      do
      {
        id v14 = *(id *)(**(void **)(a2 + 32) + 8 * v12);
        uint64_t v15 = *(void *)(a1 + 48);
        [v14 coordinate];
        if ((*(unsigned int (**)(uint64_t))(v15 + 16))(v15)) {
          [*(id *)(a1 + 32) addObject:v14];
        }

        uint64_t v12 = v13;
        BOOL v11 = v8 > v13++;
      }
      while (v11);
    }
  }
  return 0;
}

- (id)allItems
{
  v2 = -[MKQuadTrie itemsInMapRect:](self, "itemsInMapRect:", self->_initialRegion.origin.x, self->_initialRegion.origin.y, self->_initialRegion.size.width, self->_initialRegion.size.height);
  v3 = [v2 allObjects];

  return v3;
}

- (id)itemsInMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double v4 = a3.var0.var1;
  double var0 = a3.var0.var0;
  double v7 = a3.var0.var0 + a3.var1.var0;
  if ((a3.var0.var0 >= 0.0 || v7 <= 0.0) && (a3.var0.var0 < 268435456.0 ? (BOOL v8 = v7 <= 268435456.0) : (BOOL v8 = 1), v8))
  {
    uint64_t v9 = -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", a3.var0.var0, a3.var0.var1);
  }
  else
  {
    v22.size.width = 268435456.0;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.height = 268435456.0;
    MKMapRect v21 = MKMapRectIntersection((MKMapRect)a3, v22);
    double v10 = INFINITY;
    double v11 = v7 + -268435456.0;
    if (v7 > 268435456.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = INFINITY;
    }
    if (v7 <= 268435456.0) {
      double v11 = 0.0;
    }
    else {
      double v10 = v4;
    }
    if (v7 > 268435456.0) {
      double v13 = var1;
    }
    else {
      double v13 = 0.0;
    }
    double v14 = fabs(var0);
    BOOL v15 = var0 < 0.0;
    if (var0 < 0.0) {
      double v16 = var0 + 268435456.0;
    }
    else {
      double v16 = v12;
    }
    if (v15)
    {
      double v17 = v14;
    }
    else
    {
      double v4 = v10;
      double v17 = v11;
    }
    if (!v15) {
      double var1 = v13;
    }
    uint64_t v9 = -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    }
    id v18 = -[MKQuadTrie _itemsInMapRect:](self, "_itemsInMapRect:", v16, v4, v17, var1);
    if (v18) {
      [v9 unionSet:v18];
    }
  }

  return v9;
}

- (id)_itemsInMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v17.origin.x = v6;
  v17.origin.y = v5;
  v17.size.width = var0;
  v17.size.height = var1;
  MKMapRect v16 = MKMapRectIntersection((MKMapRect)self->_initialRegion, v17);
  if (v16.origin.x != INFINITY || v16.origin.y != INFINITY)
  {
    root = self->__root;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __30__MKQuadTrie__itemsInMapRect___block_invoke;
    v12[3] = &unk_1E54BB588;
    MKMapRect v14 = v16;
    id v13 = v8;
    __depthFirstApply((uint64_t)root, v12);
  }

  return v8;
}

- (MKQuadTrie)initWithInitialRegion:(id)a3 minimumSize:(id)a4 maximumItems:(unsigned int)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  double v8 = a3.var1.var1;
  double v9 = a3.var1.var0;
  double v10 = a3.var0.var1;
  double v11 = a3.var0.var0;
  v16.receiver = self;
  v16.super_class = (Class)MKQuadTrie;
  double v12 = [(MKQuadTrie *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    v12->_minSize.width = var0;
    v12->_minSize.height = var1;
    v12->_maxItems = a5;
    v12->_initialRegion.origin.x = v11;
    v12->_initialRegion.origin.y = v10;
    v12->_initialRegion.size.width = v9;
    v12->_initialRegion.size.height = v8;
    MKMapRect v14 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
    *MKMapRect v14 = v11;
    v14[1] = v10;
    v14[2] = v9;
    v14[3] = v8;
    v13->__root = v14;
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  [(MKQuadTrie *)self clearAllItemsPerforming:0];
  MKQuadTrieNodeFree((void *)self->__root);
  v3.receiver = self;
  v3.super_class = (Class)MKQuadTrie;
  [(MKQuadTrie *)&v3 dealloc];
}

uint64_t __21__MKQuadTrie_remove___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a2 + 32) + 8) - *v2;
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = v3 >> 3;
  if (v8 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  while (1)
  {
    id v10 = *(id *)(**(void **)(a2 + 32) + 8 * v7);
    double v11 = v10;
    if (v10 == *(id *)(a1 + 32)) {
      break;
    }

    ++v7;
    v6 += 0x100000000;
    if (v9 == v7) {
      return 0;
    }
  }
  uint64_t v13 = *(void *)(a2 + 32);
  MKMapRect v14 = std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,objc_object * {__strong}*,objc_object * {__strong}*,objc_object * {__strong}*,0>((void **)(*(void *)v13 + (v6 >> 29) + 8), *(void ***)(v13 + 8), (void **)(*(void *)v13 + (v6 >> 29)));
  for (i = *(void ***)(v13 + 8); i != v14; --i)
  {
    objc_super v16 = *(i - 1);
  }
  *(void *)(v13 + 8) = v14;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

  return 2;
}

- (void)foreach:(id)a3
{
  id v4 = a3;
  root = self->__root;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__MKQuadTrie_foreach___block_invoke;
  v7[3] = &unk_1E54BB5D8;
  id v8 = v4;
  id v6 = v4;
  _breadthFirstApply(root, v7);
}

uint64_t __22__MKQuadTrie_foreach___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t **)(a2 + 32);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *v2;
  if (v2[1] == *v2) {
    return 0;
  }
  unint64_t v6 = 0;
  for (unsigned int i = 1; ; ++i)
  {
    id v8 = *(id *)(v3 + 8 * v6);
    char v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

    if ((v9 & 1) == 0) {
      break;
    }
    unint64_t v6 = i;
    uint64_t v3 = **(void **)(a2 + 32);
    if (v6 >= (*(void *)(*(void *)(a2 + 32) + 8) - v3) >> 3) {
      return 0;
    }
  }
  return 2;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  root = self->__root;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __19__MKQuadTrie_count__block_invoke;
  v5[3] = &unk_1E54BB600;
  v5[4] = &v6;
  _breadthFirstApply(root, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __19__MKQuadTrie_count__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  if (v2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  }
  return 0;
}

- (void)clearAllItemsPerforming:(id)a3
{
  id v4 = a3;
  root = self->__root;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__MKQuadTrie_clearAllItemsPerforming___block_invoke;
  v11[3] = &unk_1E54BB5D8;
  v11[4] = v4;
  _breadthFirstApply(root, v11);
  double x = self->_initialRegion.origin.x;
  double y = self->_initialRegion.origin.y;
  double width = self->_initialRegion.size.width;
  double height = self->_initialRegion.size.height;
  id v10 = (double *)malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CA67C4CuLL);
  *id v10 = x;
  v10[1] = y;
  v10[2] = width;
  v10[3] = height;
  self->__root = v10;
  operator new();
}

uint64_t __38__MKQuadTrie_clearAllItemsPerforming___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    unint64_t v3 = (void *)a2[4];
    if (v3)
    {
      uint64_t v4 = *(void *)(a2[4] + 8) - *v3;
      if (v4)
      {
        uint64_t v6 = 0;
        unint64_t v7 = v4 >> 3;
        if (v7 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v7;
        }
        do
        {
          id v9 = *(id *)(*(void *)a2[4] + 8 * v6);
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

          ++v6;
        }
        while (v8 != v6);
      }
    }
  }
  MKQuadTrieNodeFree(a2);
  return 0;
}

- (id)depthFirstDescription
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  root = self->__root;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__MKQuadTrie_depthFirstDescription__block_invoke;
  v9[3] = &unk_1E54BB628;
  v9[4] = &v14;
  v9[5] = &v10;
  __depthFirstApply((uint64_t)root, v9);
  uint64_t v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = [v4 stringWithFormat:@"<%@ %p> %lu items, %lu nodes", v6, self, v15[3], v11[3]];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

uint64_t __35__MKQuadTrie_depthFirstDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  if (v2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return 0;
}

- (id)breadthFirstDescription
{
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  root = self->__root;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__MKQuadTrie_breadthFirstDescription__block_invoke;
  v9[3] = &unk_1E54BB628;
  v9[4] = &v14;
  v9[5] = &v10;
  _breadthFirstApply(root, v9);
  uint64_t v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  unint64_t v7 = [v4 stringWithFormat:@"<%@ %p> %lu items, %lu nodes", v6, self, v15[3], v11[3]];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

uint64_t __37__MKQuadTrie_breadthFirstDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  if (v2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (uint64_t)(v2[1] - *v2) >> 3;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return 0;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = [(MKQuadTrie *)self breadthFirstDescription];
  double v5 = [(MKQuadTrie *)self depthFirstDescription];
  uint64_t v6 = [v3 stringWithFormat:@"Breadth first description:\n%@\n\nDepth first description:\n%@", v4, v5];

  return v6;
}

- (id)itemDescriptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  root = self->__root;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__MKQuadTrie_itemDescriptions__block_invoke;
  v7[3] = &unk_1E54BB650;
  id v5 = v3;
  id v8 = v5;
  _breadthFirstApply(root, v7);

  return v5;
}

uint64_t __30__MKQuadTrie_itemDescriptions__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a2 + 32) + 8) - *v2;
    if (v3)
    {
      uint64_t v6 = 0;
      unint64_t v7 = v3 >> 3;
      if (v7 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v7;
      }
      do
      {
        id v9 = *(id *)(**(void **)(a2 + 32) + 8 * v6);
        uint64_t v10 = *(void **)(a1 + 32);
        double v11 = [v9 description];
        [v10 appendFormat:@"%@\n", v11];

        ++v6;
      }
      while (v8 != v6);
    }
  }
  return 0;
}

@end