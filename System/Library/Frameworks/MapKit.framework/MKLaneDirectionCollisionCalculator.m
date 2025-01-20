@interface MKLaneDirectionCollisionCalculator
- (BOOL)hasCollisions;
- (BOOL)hasDirectionWithMaxCollisions;
- (MKLaneDirectionCollisionCalculator)initWithDirections:(id)a3;
- (NSArray)directions;
- (void)_recalculateCollisions;
- (void)removeDirectionWithCollisionsLeastSimilarToDirection:(int)a3;
- (void)removeNextDirectionWithCollisions;
@end

@implementation MKLaneDirectionCollisionCalculator

- (MKLaneDirectionCollisionCalculator)initWithDirections:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLaneDirectionCollisionCalculator;
  v5 = [(MKLaneDirectionCollisionCalculator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    directions = v5->_directions;
    v5->_directions = (NSMutableArray *)v6;

    [(MKLaneDirectionCollisionCalculator *)v5 _recalculateCollisions];
  }

  return v5;
}

- (NSArray)directions
{
  v2 = (void *)[(NSMutableArray *)self->_directions copy];

  return (NSArray *)v2;
}

- (void)_recalculateCollisions
{
  self->_hasCollisions = 0;
  directionWithMostCollisions = self->_directionWithMostCollisions;
  self->_directionWithMostCollisions = 0;

  [(NSMutableDictionary *)self->_collisionsForDirection removeAllObjects];
  if (!self->_collisionsForDirection)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    collisionsForDirection = self->_collisionsForDirection;
    self->_collisionsForDirection = v4;
  }
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  directions = self->_directions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MKLaneDirectionCollisionCalculator__recalculateCollisions__block_invoke;
  v7[3] = &unk_1E54BD280;
  v7[4] = self;
  v7[5] = v8;
  [(NSMutableArray *)directions enumerateObjectsUsingBlock:v7];
  _Block_object_dispose(v8, 8);
}

void __60__MKLaneDirectionCollisionCalculator__recalculateCollisions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v113[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    unint64_t v6 = a3 + 1;
    unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a3 - 1];
    objc_super v9 = (void *)v8;
    if (v6 < v7)
    {
      v10 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:v6];
      v113[0] = v9;
      v113[1] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:2];

LABEL_8:
      goto LABEL_9;
    }
    uint64_t v112 = v8;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v112;
LABEL_7:
    v11 = [v12 arrayWithObjects:v13 count:1];
    goto LABEL_8;
  }
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] >= 2)
  {
    objc_super v9 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:1];
    v111 = v9;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = (uint64_t *)&v111;
    goto LABEL_7;
  }
  v11 = 0;
LABEL_9:
  int v14 = objc_msgSend(v5, "_mk_laneDirectionValue");
  unint64_t v15 = 0;
  if (v14 > 15)
  {
    if (v14 <= 63)
    {
      if (v14 == 16)
      {
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v16 = v11;
        uint64_t v56 = [v16 countByEnumeratingWithState:&v98 objects:v110 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          unint64_t v15 = 0;
          uint64_t v58 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v99 != v58) {
                objc_enumerationMutation(v16);
              }
              if (objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * i), "_mk_laneDirectionValue") == 32) {
                ++v15;
              }
            }
            uint64_t v57 = [v16 countByEnumeratingWithState:&v98 objects:v110 count:16];
          }
          while (v57);
          goto LABEL_114;
        }
      }
      else
      {
        if (v14 != 32) {
          goto LABEL_121;
        }
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v16 = v11;
        uint64_t v26 = [v16 countByEnumeratingWithState:&v94 objects:v109 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          unint64_t v15 = 0;
          uint64_t v28 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v95 != v28) {
                objc_enumerationMutation(v16);
              }
              v30 = *(void **)(*((void *)&v94 + 1) + 8 * j);
              if (objc_msgSend(v30, "_mk_laneDirectionValue") == 16
                || objc_msgSend(v30, "_mk_laneDirectionValue") == 64)
              {
                ++v15;
              }
            }
            uint64_t v27 = [v16 countByEnumeratingWithState:&v94 objects:v109 count:16];
          }
          while (v27);
          goto LABEL_114;
        }
      }
    }
    else
    {
      switch(v14)
      {
        case 64:
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v16 = v11;
          uint64_t v46 = [v16 countByEnumeratingWithState:&v90 objects:v108 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            unint64_t v15 = 0;
            uint64_t v48 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v47; ++k)
              {
                if (*(void *)v91 != v48) {
                  objc_enumerationMutation(v16);
                }
                v50 = *(void **)(*((void *)&v90 + 1) + 8 * k);
                if (objc_msgSend(v50, "_mk_laneDirectionValue") == 32
                  || objc_msgSend(v50, "_mk_laneDirectionValue") == 128)
                {
                  ++v15;
                }
              }
              uint64_t v47 = [v16 countByEnumeratingWithState:&v90 objects:v108 count:16];
            }
            while (v47);
            goto LABEL_114;
          }
          break;
        case 128:
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v16 = v11;
          uint64_t v51 = [v16 countByEnumeratingWithState:&v86 objects:v107 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            unint64_t v15 = 0;
            uint64_t v53 = *(void *)v87;
            do
            {
              for (uint64_t m = 0; m != v52; ++m)
              {
                if (*(void *)v87 != v53) {
                  objc_enumerationMutation(v16);
                }
                v55 = *(void **)(*((void *)&v86 + 1) + 8 * m);
                if (objc_msgSend(v55, "_mk_laneDirectionValue") == 64
                  || objc_msgSend(v55, "_mk_laneDirectionValue") == 1)
                {
                  ++v15;
                }
              }
              uint64_t v52 = [v16 countByEnumeratingWithState:&v86 objects:v107 count:16];
            }
            while (v52);
            goto LABEL_114;
          }
          break;
        case 256:
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v16 = v11;
          uint64_t v22 = [v16 countByEnumeratingWithState:&v66 objects:v102 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            unint64_t v15 = 0;
            uint64_t v24 = *(void *)v67;
            do
            {
              for (uint64_t n = 0; n != v23; ++n)
              {
                if (*(void *)v67 != v24) {
                  objc_enumerationMutation(v16);
                }
                if (objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * n), "_mk_laneDirectionValue", (void)v66) == 32)++v15; {
              }
                }
              uint64_t v23 = [v16 countByEnumeratingWithState:&v66 objects:v102 count:16];
            }
            while (v23);
LABEL_114:

            if (!v15) {
              goto LABEL_121;
            }
            *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
            uint64_t v60 = *(void *)(*(void *)(a1 + 40) + 8);
            unint64_t v61 = *(void *)(v60 + 24);
            if (v15 <= v61)
            {
              if (v15 != v61) {
                goto LABEL_121;
              }
              uint64_t v64 = *(void *)(a1 + 32);
              id v16 = *(id *)(v64 + 24);
              *(void *)(v64 + 24) = 0;
            }
            else
            {
              *(void *)(v60 + 24) = v15;
              uint64_t v62 = *(void *)(a1 + 32);
              id v63 = v5;
              id v16 = *(id *)(v62 + 24);
              *(void *)(v62 + 24) = v63;
            }
LABEL_120:

            goto LABEL_121;
          }
          break;
        default:
          goto LABEL_121;
      }
    }
LABEL_117:
    unint64_t v15 = 0;
    goto LABEL_120;
  }
  switch(v14)
  {
    case 0:
    case 1:
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v16 = v11;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v82 objects:v106 count:16];
      if (!v17) {
        goto LABEL_117;
      }
      uint64_t v18 = v17;
      unint64_t v15 = 0;
      uint64_t v19 = *(void *)v83;
      do
      {
        for (uint64_t ii = 0; ii != v18; ++ii)
        {
          if (*(void *)v83 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v82 + 1) + 8 * ii);
          if (objc_msgSend(v21, "_mk_laneDirectionValue") == 128
            || objc_msgSend(v21, "_mk_laneDirectionValue") == 2)
          {
            ++v15;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v82 objects:v106 count:16];
      }
      while (v18);
      goto LABEL_114;
    case 2:
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v16 = v11;
      uint64_t v31 = [v16 countByEnumeratingWithState:&v78 objects:v105 count:16];
      if (!v31) {
        goto LABEL_117;
      }
      uint64_t v32 = v31;
      unint64_t v15 = 0;
      uint64_t v33 = *(void *)v79;
      do
      {
        for (juint64_t j = 0; jj != v32; ++jj)
        {
          if (*(void *)v79 != v33) {
            objc_enumerationMutation(v16);
          }
          v35 = *(void **)(*((void *)&v78 + 1) + 8 * jj);
          if (objc_msgSend(v35, "_mk_laneDirectionValue") == 1
            || objc_msgSend(v35, "_mk_laneDirectionValue") == 4)
          {
            ++v15;
          }
        }
        uint64_t v32 = [v16 countByEnumeratingWithState:&v78 objects:v105 count:16];
      }
      while (v32);
      goto LABEL_114;
    case 4:
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v16 = v11;
      uint64_t v36 = [v16 countByEnumeratingWithState:&v74 objects:v104 count:16];
      if (!v36) {
        goto LABEL_117;
      }
      uint64_t v37 = v36;
      unint64_t v15 = 0;
      uint64_t v38 = *(void *)v75;
      do
      {
        for (uint64_t kk = 0; kk != v37; ++kk)
        {
          if (*(void *)v75 != v38) {
            objc_enumerationMutation(v16);
          }
          v40 = *(void **)(*((void *)&v74 + 1) + 8 * kk);
          if (objc_msgSend(v40, "_mk_laneDirectionValue") == 2
            || objc_msgSend(v40, "_mk_laneDirectionValue") == 8)
          {
            ++v15;
          }
        }
        uint64_t v37 = [v16 countByEnumeratingWithState:&v74 objects:v104 count:16];
      }
      while (v37);
      goto LABEL_114;
    case 8:
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v16 = v11;
      uint64_t v41 = [v16 countByEnumeratingWithState:&v70 objects:v103 count:16];
      if (!v41) {
        goto LABEL_117;
      }
      uint64_t v42 = v41;
      unint64_t v15 = 0;
      uint64_t v43 = *(void *)v71;
      do
      {
        for (uint64_t mm = 0; mm != v42; ++mm)
        {
          if (*(void *)v71 != v43) {
            objc_enumerationMutation(v16);
          }
          v45 = *(void **)(*((void *)&v70 + 1) + 8 * mm);
          if (objc_msgSend(v45, "_mk_laneDirectionValue") == 4
            || objc_msgSend(v45, "_mk_laneDirectionValue") == 256)
          {
            ++v15;
          }
        }
        uint64_t v42 = [v16 countByEnumeratingWithState:&v70 objects:v103 count:16];
      }
      while (v42);
      goto LABEL_114;
    default:
      break;
  }
LABEL_121:
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = v15 != 0;
  v65 = [NSNumber numberWithUnsignedInteger:v15];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v65 forKeyedSubscript:v5];
}

- (BOOL)hasDirectionWithMaxCollisions
{
  return self->_directionWithMostCollisions != 0;
}

- (void)removeNextDirectionWithCollisions
{
  if ([(MKLaneDirectionCollisionCalculator *)self hasCollisions])
  {
    if ([(MKLaneDirectionCollisionCalculator *)self hasDirectionWithMaxCollisions])
    {
      [(NSMutableArray *)self->_directions removeObject:self->_directionWithMostCollisions];
    }
    else
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __71__MKLaneDirectionCollisionCalculator_removeNextDirectionWithCollisions__block_invoke;
      v4[3] = &unk_1E54BD2A8;
      v4[4] = self;
      v3 = (uint64_t (**)(void, void))MEMORY[0x18C139AE0](v4);
      if ((v3[2](v3, 256) & 1) == 0
        && (v3[2](v3, 16) & 1) == 0
        && (v3[2](v3, 8) & 1) == 0
        && (v3[2](v3, 32) & 1) == 0
        && (v3[2](v3, 2) & 1) == 0
        && (v3[2](v3, 128) & 1) == 0
        && (v3[2](v3, 4) & 1) == 0
        && (v3[2](v3, 64) & 1) == 0
        && !v3[2](v3, 1))
      {

        return;
      }
    }
    [(MKLaneDirectionCollisionCalculator *)self _recalculateCollisions];
  }
}

uint64_t __71__MKLaneDirectionCollisionCalculator_removeNextDirectionWithCollisions__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [NSNumber numberWithInt:a2];
  uint64_t v6 = [v4 containsObject:v5];
  if (v6)
  {
    unint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = [NSNumber numberWithInt:a2];
    objc_super v9 = [v7 objectForKeyedSubscript:v8];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if (!v10) {
      return 0;
    }
    v11 = *(void **)(*(void *)(a1 + 32) + 16);
    id v5 = [NSNumber numberWithInt:a2];
    [v11 removeObject:v5];
  }

  return v6;
}

- (void)removeDirectionWithCollisionsLeastSimilarToDirection:(int)a3
{
  if ([(MKLaneDirectionCollisionCalculator *)self hasCollisions])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__MKLaneDirectionCollisionCalculator_removeDirectionWithCollisionsLeastSimilarToDirection___block_invoke;
    v11[3] = &unk_1E54BD2A8;
    v11[4] = self;
    uint64_t v5 = MEMORY[0x18C139AE0](v11);
    uint64_t v6 = (void (**)(void, void))v5;
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 0:
        case 1:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 16) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 32) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 4) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 64) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) == 0)
          {
            v6[2](v6, 128);
          }
          break;
        case 2:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 32) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 64) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 128) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 256) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) == 0)
          {
            char v8 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 1);
            goto LABEL_56;
          }
          break;
        case 4:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 32) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 64) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 128) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 256) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) == 0)
          {
            char v7 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 2);
            goto LABEL_47;
          }
          break;
        case 8:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 32) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 64) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 128) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) == 0
            && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) == 0)
          {
            char v8 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 256);
LABEL_56:
            if ((v8 & 1) == 0) {
              v6[2](v6, 4);
            }
          }
          break;
        default:
          goto LABEL_81;
      }
      goto LABEL_81;
    }
    if (a3 <= 63)
    {
      if (a3 != 16)
      {
        if (a3 == 32
          && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 4) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 16) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 128) & 1) == 0)
        {
          v6[2](v6, 64);
        }
        goto LABEL_81;
      }
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 4) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) != 0)
      {
        goto LABEL_81;
      }
      char v10 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 128);
    }
    else
    {
      if (a3 == 64)
      {
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 4) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 16) & 1) == 0)
        {
          char v9 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 128);
          goto LABEL_79;
        }
LABEL_81:

        return;
      }
      if (a3 != 128)
      {
        if (a3 == 256
          && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 32) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 64) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 128) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) == 0
          && (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) == 0)
        {
          char v7 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 4);
LABEL_47:
          if ((v7 & 1) == 0) {
            v6[2](v6, 8);
          }
        }
        goto LABEL_81;
      }
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 8) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 4) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 2) & 1) != 0
        || (((uint64_t (*)(void, uint64_t))v6[2])(v6, 1) & 1) != 0)
      {
        goto LABEL_81;
      }
      char v10 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 16);
    }
    if ((v10 & 1) == 0)
    {
      char v9 = ((uint64_t (*)(void, uint64_t))v6[2])(v6, 64);
LABEL_79:
      if ((v9 & 1) == 0) {
        v6[2](v6, 32);
      }
      goto LABEL_81;
    }
    goto LABEL_81;
  }
}

uint64_t __91__MKLaneDirectionCollisionCalculator_removeDirectionWithCollisionsLeastSimilarToDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = [NSNumber numberWithInt:a2];
  if ([v4 containsObject:v5])
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    char v7 = [NSNumber numberWithInt:a2];
    char v8 = [v6 objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      char v10 = *(void **)(*(void *)(a1 + 32) + 16);
      v11 = [NSNumber numberWithInt:a2];
      [v10 removeObject:v11];

      [*(id *)(a1 + 32) _recalculateCollisions];
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)hasCollisions
{
  return self->_hasCollisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionWithMostCollisions, 0);
  objc_storeStrong((id *)&self->_directions, 0);

  objc_storeStrong((id *)&self->_collisionsForDirection, 0);
}

@end