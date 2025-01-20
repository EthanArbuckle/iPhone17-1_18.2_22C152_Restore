@interface SCNSpriteKitEventHandler
- (BOOL)touchesBegan:(id)a3 withEvent:(id)a4;
- (BOOL)touchesCancelled:(id)a3 withEvent:(id)a4;
- (BOOL)touchesEnded:(id)a3 withEvent:(id)a4;
- (BOOL)touchesMoved:(id)a3 withEvent:(id)a4;
- (SCNSpriteKitEventHandler)init;
- (SKScene)scene;
- (void)dealloc;
- (void)setScene:(id)a3;
@end

@implementation SCNSpriteKitEventHandler

- (SCNSpriteKitEventHandler)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNSpriteKitEventHandler;
  v2 = [(SCNSpriteKitEventHandler *)&v4 init];
  if (v2) {
    v2->_touchMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNSpriteKitEventHandler;
  [(SCNSpriteKitEventHandler *)&v3 dealloc];
}

- (BOOL)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!self->_scene) {
    return 0;
  }
  v45[0] = 0;
  v45[1] = 0;
  v44 = (uint64_t *)v45;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v40 objects:v47 count:16];
  id v38 = a4;
  char v8 = 0;
  if (v7)
  {
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        id v39 = 0;
        scene = self->_scene;
        [v11 locationInNode:scene];
        for (j = (void *)-[SKScene nodeAtPoint:recursive:](scene, "nodeAtPoint:recursive:", 1);
              ;
              j = (void *)[v39 parent])
        {
          id v39 = j;
          if (!j) {
            break;
          }
          if ([j isUserInteractionEnabled])
          {
            if (v39)
            {
              [(NSMutableDictionary *)self->_touchMap setObject:v39 forKey:v12];
              v46 = &v39;
              v15 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v44, (unint64_t *)&v39, (uint64_t)&std::piecewise_construct, (uint64_t **)&v46);
              v16 = (void *)v15[6];
              unint64_t v17 = v15[7];
              if ((unint64_t)v16 >= v17)
              {
                uint64_t v19 = v15[5];
                uint64_t v20 = ((uint64_t)v16 - v19) >> 3;
                if ((unint64_t)(v20 + 1) >> 61) {
                  abort();
                }
                uint64_t v21 = v17 - v19;
                uint64_t v22 = v21 >> 2;
                if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
                  uint64_t v22 = v20 + 1;
                }
                if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v23 = v22;
                }
                if (v23) {
                  v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v15 + 7), v23);
                }
                else {
                  v24 = 0;
                }
                v25 = &v24[8 * v20];
                *(void *)v25 = v11;
                v18 = v25 + 8;
                v27 = (char *)v15[5];
                v26 = (char *)v15[6];
                if (v26 != v27)
                {
                  do
                  {
                    uint64_t v28 = *((void *)v26 - 1);
                    v26 -= 8;
                    *((void *)v25 - 1) = v28;
                    v25 -= 8;
                  }
                  while (v26 != v27);
                  v26 = (char *)v15[5];
                }
                v15[5] = (uint64_t)v25;
                v15[6] = (uint64_t)v18;
                v15[7] = (uint64_t)&v24[8 * v23];
                if (v26) {
                  operator delete(v26);
                }
              }
              else
              {
                void *v16 = v11;
                v18 = v16 + 1;
              }
              v15[6] = (uint64_t)v18;
              char v8 = 1;
            }
            break;
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }
  id v29 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v30 = v44;
  if (v44 != (uint64_t *)v45)
  {
    do
    {
      v31 = (void *)v30[4];
      v32 = (void *)v30[5];
      v33 = (void *)v30[6];
      while (v32 != v33)
        [v29 addObject:*v32++];
      [v31 touchesBegan:v29 withEvent:v38];
      [v29 removeAllObjects];
      v34 = (uint64_t *)v30[1];
      if (v34)
      {
        do
        {
          v35 = v34;
          v34 = (uint64_t *)*v34;
        }
        while (v34);
      }
      else
      {
        do
        {
          v35 = (uint64_t *)v30[2];
          BOOL v36 = *v35 == (void)v30;
          v30 = v35;
        }
        while (!v36);
      }
      v30 = v35;
    }
    while (v35 != (uint64_t *)v45);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v44, v45[0]);
  return v8 & 1;
}

- (BOOL)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (!self->_scene) {
    return 0;
  }
  v43[0] = 0;
  v43[1] = 0;
  long long v42 = (uint64_t *)v43;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v38 objects:v45 count:16];
  id v36 = a4;
  char v8 = 0;
  if (v7)
  {
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
        uint64_t v37 = 0;
        uint64_t v37 = [(NSMutableDictionary *)self->_touchMap objectForKey:v12];
        if (v37)
        {
          v44 = &v37;
          v13 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v42, (unint64_t *)&v37, (uint64_t)&std::piecewise_construct, &v44);
          v14 = (void *)v13[6];
          unint64_t v15 = v13[7];
          if ((unint64_t)v14 >= v15)
          {
            uint64_t v17 = v13[5];
            uint64_t v18 = ((uint64_t)v14 - v17) >> 3;
            if ((unint64_t)(v18 + 1) >> 61) {
              abort();
            }
            uint64_t v19 = v15 - v17;
            uint64_t v20 = v19 >> 2;
            if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
              uint64_t v20 = v18 + 1;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v20;
            }
            if (v21) {
              uint64_t v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v13 + 7), v21);
            }
            else {
              uint64_t v22 = 0;
            }
            unint64_t v23 = &v22[8 * v18];
            *(void *)unint64_t v23 = v11;
            v16 = v23 + 8;
            v25 = (char *)v13[5];
            v24 = (char *)v13[6];
            if (v24 != v25)
            {
              do
              {
                uint64_t v26 = *((void *)v24 - 1);
                v24 -= 8;
                *((void *)v23 - 1) = v26;
                v23 -= 8;
              }
              while (v24 != v25);
              v24 = (char *)v13[5];
            }
            v13[5] = (uint64_t)v23;
            v13[6] = (uint64_t)v16;
            v13[7] = (uint64_t)&v22[8 * v21];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            void *v14 = v11;
            v16 = v14 + 1;
          }
          v13[6] = (uint64_t)v16;
          char v8 = 1;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }
  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v28 = v42;
  if (v42 != (uint64_t *)v43)
  {
    do
    {
      id v29 = (void *)v28[4];
      v30 = (void *)v28[5];
      v31 = (void *)v28[6];
      while (v30 != v31)
        [v27 addObject:*v30++];
      [v29 touchesMoved:v27 withEvent:v36];
      [v27 removeAllObjects];
      v32 = (uint64_t *)v28[1];
      if (v32)
      {
        do
        {
          v33 = v32;
          v32 = (uint64_t *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          v33 = (uint64_t *)v28[2];
          BOOL v34 = *v33 == (void)v28;
          uint64_t v28 = v33;
        }
        while (!v34);
      }
      uint64_t v28 = v33;
    }
    while (v33 != (uint64_t *)v43);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v42, v43[0]);
  return v8 & 1;
}

- (BOOL)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (!self->_scene) {
    return 0;
  }
  v51[0] = 0;
  v51[1] = 0;
  v50 = (uint64_t *)v51;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  char v6 = 0;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
        uint64_t v45 = 0;
        uint64_t v45 = [(NSMutableDictionary *)self->_touchMap objectForKey:v11];
        if (v45)
        {
          v52 = &v45;
          uint64_t v12 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v50, (unint64_t *)&v45, (uint64_t)&std::piecewise_construct, &v52);
          v13 = (void *)v12[6];
          unint64_t v14 = v12[7];
          if ((unint64_t)v13 >= v14)
          {
            uint64_t v16 = v12[5];
            uint64_t v17 = ((uint64_t)v13 - v16) >> 3;
            if ((unint64_t)(v17 + 1) >> 61) {
              abort();
            }
            uint64_t v18 = v14 - v16;
            uint64_t v19 = v18 >> 2;
            if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
              uint64_t v19 = v17 + 1;
            }
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v20 = v19;
            }
            if (v20) {
              unint64_t v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v12 + 7), v20);
            }
            else {
              unint64_t v21 = 0;
            }
            uint64_t v22 = &v21[8 * v17];
            *(void *)uint64_t v22 = v10;
            unint64_t v15 = v22 + 8;
            v24 = (char *)v12[5];
            unint64_t v23 = (char *)v12[6];
            if (v23 != v24)
            {
              do
              {
                uint64_t v25 = *((void *)v23 - 1);
                v23 -= 8;
                *((void *)v22 - 1) = v25;
                v22 -= 8;
              }
              while (v23 != v24);
              unint64_t v23 = (char *)v12[5];
            }
            v12[5] = (uint64_t)v22;
            v12[6] = (uint64_t)v15;
            v12[7] = (uint64_t)&v21[8 * v20];
            if (v23) {
              operator delete(v23);
            }
          }
          else
          {
            void *v13 = v10;
            unint64_t v15 = v13 + 1;
          }
          v12[6] = (uint64_t)v15;
          char v6 = 1;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v28 = v50;
  if (v50 != (uint64_t *)v51)
  {
    do
    {
      id v29 = (void *)v28[5];
      long long v40 = (void *)v28[4];
      v30 = (void *)v28[6];
      while (v29 != v30)
      {
        v31 = (void *)*v29;
        [v27 addObject:*v29];
        objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
        ++v29;
      }
      [v40 touchesEnded:v27 withEvent:a4];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v32 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v26);
            }
            [(NSMutableDictionary *)self->_touchMap removeObjectForKey:*(void *)(*((void *)&v41 + 1) + 8 * j)];
          }
          uint64_t v32 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v32);
      }
      [v26 removeAllObjects];
      [v27 removeAllObjects];
      v35 = (uint64_t *)v28[1];
      if (v35)
      {
        do
        {
          id v36 = v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          id v36 = (uint64_t *)v28[2];
          BOOL v37 = *v36 == (void)v28;
          uint64_t v28 = v36;
        }
        while (!v37);
      }
      uint64_t v28 = v36;
    }
    while (v36 != (uint64_t *)v51);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v50, v51[0]);
  return v6 & 1;
}

- (BOOL)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (!self->_scene) {
    return 0;
  }
  v51[0] = 0;
  v51[1] = 0;
  v50 = (uint64_t *)v51;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  char v6 = 0;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
        uint64_t v45 = 0;
        uint64_t v45 = [(NSMutableDictionary *)self->_touchMap objectForKey:v11];
        if (v45)
        {
          v52 = &v45;
          uint64_t v12 = std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::__emplace_unique_key_args<SKNode *,std::piecewise_construct_t const&,std::tuple<SKNode * const&>,std::tuple<>>(&v50, (unint64_t *)&v45, (uint64_t)&std::piecewise_construct, &v52);
          v13 = (void *)v12[6];
          unint64_t v14 = v12[7];
          if ((unint64_t)v13 >= v14)
          {
            uint64_t v16 = v12[5];
            uint64_t v17 = ((uint64_t)v13 - v16) >> 3;
            if ((unint64_t)(v17 + 1) >> 61) {
              abort();
            }
            uint64_t v18 = v14 - v16;
            uint64_t v19 = v18 >> 2;
            if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
              uint64_t v19 = v17 + 1;
            }
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v20 = v19;
            }
            if (v20) {
              unint64_t v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v12 + 7), v20);
            }
            else {
              unint64_t v21 = 0;
            }
            uint64_t v22 = &v21[8 * v17];
            *(void *)uint64_t v22 = v10;
            unint64_t v15 = v22 + 8;
            v24 = (char *)v12[5];
            unint64_t v23 = (char *)v12[6];
            if (v23 != v24)
            {
              do
              {
                uint64_t v25 = *((void *)v23 - 1);
                v23 -= 8;
                *((void *)v22 - 1) = v25;
                v22 -= 8;
              }
              while (v23 != v24);
              unint64_t v23 = (char *)v12[5];
            }
            v12[5] = (uint64_t)v22;
            v12[6] = (uint64_t)v15;
            v12[7] = (uint64_t)&v21[8 * v20];
            if (v23) {
              operator delete(v23);
            }
          }
          else
          {
            void *v13 = v10;
            unint64_t v15 = v13 + 1;
          }
          v12[6] = (uint64_t)v15;
          char v6 = 1;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v28 = v50;
  if (v50 != (uint64_t *)v51)
  {
    do
    {
      id v29 = (void *)v28[5];
      long long v40 = (void *)v28[4];
      v30 = (void *)v28[6];
      while (v29 != v30)
      {
        v31 = (void *)*v29;
        [v27 addObject:*v29];
        objc_msgSend(v26, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "hash")));
        ++v29;
      }
      [v40 touchesCancelled:v27 withEvent:a4];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v32 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v26);
            }
            [(NSMutableDictionary *)self->_touchMap removeObjectForKey:*(void *)(*((void *)&v41 + 1) + 8 * j)];
          }
          uint64_t v32 = [v26 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v32);
      }
      [v26 removeAllObjects];
      [v27 removeAllObjects];
      v35 = (uint64_t *)v28[1];
      if (v35)
      {
        do
        {
          id v36 = v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          id v36 = (uint64_t *)v28[2];
          BOOL v37 = *v36 == (void)v28;
          uint64_t v28 = v36;
        }
        while (!v37);
      }
      uint64_t v28 = v36;
    }
    while (v36 != (uint64_t *)v51);
  }

  std::__tree<std::__value_type<SKNode *,std::vector<UITouch *>>,std::__map_value_compare<SKNode *,std::__value_type<SKNode *,std::vector<UITouch *>>,std::less<SKNode *>,true>,std::allocator<std::__value_type<SKNode *,std::vector<UITouch *>>>>::destroy((uint64_t)&v50, v51[0]);
  return v6 & 1;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

@end