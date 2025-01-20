@interface UserPathManager
- (BOOL)buildLookupTree;
- (BOOL)computeTranslations:(id)a3;
- (UserPathManager)initWithPathFile:(id)a3;
- (id)lookup:(id)a3 keyboardController:(id)a4;
- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4;
- (void)dealloc;
- (void)setRandomNumberSeed:(unsigned int)a3;
@end

@implementation UserPathManager

- (UserPathManager)initWithPathFile:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UserPathManager;
  v6 = [(UserPathManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathFile, a3);
    uint64_t v8 = +[TTKTestCaseReader loadFromPath:v5];
    source = v7->_source;
    v7->_source = (TTKTestCaseSource *)v8;

    if (v7->_source)
    {
      uint64_t v10 = +[NSMutableDictionary dictionary];
      transforms = v7->_transforms;
      v7->_transforms = (NSMutableDictionary *)v10;

      uint64_t v12 = +[NSMutableDictionary dictionary];
      lookupTree = v7->_lookupTree;
      v7->_lookupTree = (NSMutableDictionary *)v12;

      [(UserPathManager *)v7 buildLookupTree];
      operator new();
    }
    fprintf(__stderrp, "Error: Unable to parse user path JSON file '%s'\n\n", (const char *)[v5 cStringUsingEncoding:4]);
    v14 = 0;
  }
  else
  {
    v14 = (UserPathManager *)0;
  }

  return v14;
}

- (void)dealloc
{
  if (self->m_generator) {
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)UserPathManager;
  [(UserPathManager *)&v2 dealloc];
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  m_generator = self->m_generator;
  _DWORD *m_generator = a3;
  for (uint64_t i = 1; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }
  *((void *)m_generator + 312) = 0;
}

- (BOOL)computeTranslations:(id)a3
{
  id v4 = a3;
  v15 = [(TTKTestCaseSource *)self->_source layouts];
  id v5 = [v4 keyplane];
  objc_super v16 = [v5 name];

  v17 = +[NSMutableDictionary dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v15;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v6 objectForKey:v10];
        uint64_t v12 = [v11 keys];
        v13 = [(UserPathManager *)self translateLayoutForKeys:v12 keyboardController:v4];
        if (v13) {
          [v17 setObject:v13 forKey:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [(NSMutableDictionary *)self->_transforms setObject:v17 forKey:v16];
  return 1;
}

- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4
{
  id v51 = a3;
  id v5 = a4;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x5012000000;
  v65[3] = sub_122D4;
  v65[4] = nullsub_3;
  v65[5] = &unk_82CF2;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v67 = size;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_122E4;
  v63[4] = sub_122F4;
  id v64 = 0;
  id v7 = [v5 keyplane];
  uint64_t v8 = [v7 keys];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_122FC;
  v62[3] = &unk_8CE18;
  v62[4] = v63;
  v62[5] = v65;
  [v8 enumerateObjectsUsingBlock:v62];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v51;
  id v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v9)
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    uint64_t v10 = *(void *)v59;
    double v11 = 1000000000.0;
    double v12 = 1000000000.0;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v59 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v15 = [v14 string];
        objc_super v16 = [v5 layoutUtils];
        v17 = [v5 keyplane];
        long long v18 = [v16 exactKeyForString:v15 keyplane:v17];

        if (v18)
        {
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          double v20 = v19;
          [v18 frame];
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          double v22 = v21;
          if (v12 > v20)
          {
            id v23 = v18;

            id v24 = v14;
            double v12 = v20;
            v54 = v23;
            v56 = v24;
          }
          if (v11 > v22)
          {
            id v25 = v18;

            id v26 = v14;
            double v11 = v22;
            v53 = v25;
            v55 = v26;
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v9);

    v27 = 0;
    if (v56 && v55)
    {
      [v54 frame];
      double v50 = v28;
      [v54 frame];
      double v49 = v29;
      [v54 frame];
      [v54 frame];
      [v53 frame];
      double v31 = v30;
      [v53 frame];
      double v33 = v32;
      [v53 frame];
      [v53 frame];
      [v56 frame];
      CGFloat x = v76.origin.x;
      CGFloat y = v76.origin.y;
      CGFloat width = v76.size.width;
      CGFloat height = v76.size.height;
      double MidX = CGRectGetMidX(v76);
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      objc_msgSend(v55, "frame", CGRectGetMidY(v77));
      CGFloat v39 = v78.origin.x;
      CGFloat v40 = v78.origin.y;
      CGFloat v41 = v78.size.width;
      CGFloat v42 = v78.size.height;
      double v43 = CGRectGetMidX(v78);
      v79.origin.CGFloat x = v39;
      v79.origin.CGFloat y = v40;
      v79.size.CGFloat width = v41;
      v79.size.CGFloat height = v42;
      CGRectGetMidY(v79);
      double v44 = v31 + v33 * 0.5;
      *(float *)&CGFloat v39 = MidX;
      v73[0] = LODWORD(v39);
      v73[1] = 1065353216;
      float v45 = v43;
      *(float *)&v73[2] = v45;
      v73[3] = 1065353216;
      *(float *)&double v31 = v50 + v49 * 0.5;
      float v46 = v44;
      float v71 = *(float *)&v31;
      float v72 = v46;
      if (+[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:](TITesterMathUtils, "solveSystemOfEquations:withBMatrix:size:", v73, &v71, 2)|| (v70[0] = MidX, v70[1] = 1.0, v70[2] = v45, v70[3] = 1.0, float v68 = v50 + v49 * 0.5, v69 = v46, +[TITesterMathUtils solveSystemOfEquations:v70 withBMatrix:&v68 size:2]))
      {
        v27 = 0;
      }
      else
      {
        v57[0] = v71;
        v57[1] = v68;
        v57[2] = v72;
        v57[3] = v69;
        v27 = +[NSValue value:v57 withObjCType:"{?=dddd}"];
      }
    }
    v47 = v53;
  }
  else
  {

    v55 = 0;
    v56 = 0;
    v54 = 0;
    v47 = 0;
    v27 = 0;
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  return v27;
}

- (BOOL)buildLookupTree
{
  objc_super v2 = 0;
  for (uint64_t i = self; ; self = i)
  {
    double v32 = [(TTKTestCaseSource *)self->_source getNextTestCase];

    if (!v32) {
      break;
    }
    v3 = [v32 records];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v3;
    id v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v28)
    {
      uint64_t v30 = *(void *)v47;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          double v33 = objc_msgSend(v4, "primaryIntendedText", v28);
          id v5 = [TIContinuousPathWithLayoutName alloc];
          id v6 = [v4 layoutName];
          id v7 = [(TIContinuousPathWithLayoutName *)v5 initWithLayout:v6];

          uint64_t v8 = [v4 touchDataCollection];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v35 = v8;
          id v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v9)
          {
            uint64_t v36 = *(void *)v43;
            float v10 = -1.0;
            do
            {
              id v37 = v9;
              for (k = 0; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v43 != v36) {
                  objc_enumerationMutation(v35);
                }
                double v12 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
                long long v38 = 0u;
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                v13 = [v12 samples];
                id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v14)
                {
                  uint64_t v15 = *(void *)v39;
                  do
                  {
                    for (m = 0; m != v14; m = (char *)m + 1)
                    {
                      if (*(void *)v39 != v15) {
                        objc_enumerationMutation(v13);
                      }
                      v17 = *(void **)(*((void *)&v38 + 1) + 8 * (void)m);
                      if (v10 < 0.0)
                      {
                        [*(id *)(*((void *)&v38 + 1) + 8 * (void)m) timeStamp];
                        float v10 = v18;
                      }
                      double v19 = [TIContinuousPathSample alloc];
                      [v17 point];
                      double v21 = v20;
                      double v23 = v22;
                      [v17 timeStamp];
                      id v25 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v19, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", [v17 stage], objc_msgSend(v17, "pathIndex"), v21, v23, v24 - v10, 0.0, 0.0);
                      [(TIContinuousPath *)v7 addSample:v25];
                    }
                    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }
                  while (v14);
                }
              }
              id v9 = [v35 countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v9);
          }

          id v26 = [(NSMutableDictionary *)i->_lookupTree objectForKey:v33];
          if (!v26)
          {
            id v26 = +[NSMutableArray array];
            -[NSMutableDictionary setObject:forKey:](i->_lookupTree, "setObject:forKey:");
          }
          [v26 addObject:v7];
        }
        id v28 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v28);
    }

    objc_super v2 = v32;
  }
  return 1;
}

- (id)lookup:(id)a3 keyboardController:(id)a4
{
  id v6 = a3;
  id v40 = a4;
  long long v38 = v6;
  id v7 = [(NSMutableDictionary *)self->_lookupTree objectForKey:v6];
  if (v7
    || (lookupTree = self->_lookupTree,
        [v38 lowercaseString],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [(NSMutableDictionary *)lookupTree objectForKey:v9],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v9,
        v7))
  {
    long long v39 = v7;
    long long v41 = objc_msgSend(v7, "objectAtIndex:", sub_10C00((uint64_t)self->m_generator) % (unint64_t)objc_msgSend(v7, "count"));
    float v10 = [v40 keyplane];
    uint64_t v11 = [v10 name];

    id v37 = (void *)v11;
    double v12 = [(NSMutableDictionary *)self->_transforms objectForKey:v11];
    if (!v12)
    {
      [(UserPathManager *)self computeTranslations:v40];
      double v12 = [(NSMutableDictionary *)self->_transforms objectForKey:v11];
    }
    v13 = [v41 layout];
    id v14 = [v12 objectForKey:v13];

    uint64_t v36 = v14;
    if (v14)
    {
      [v14 getValue:v47];
      uint64_t v15 = objc_alloc_init(TIContinuousPathWithLayoutName);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      objc_super v16 = [v41 samples];
      id v17 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v16);
            }
            double v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            [v20 point];
            double v22 = v21;
            double v23 = *(double *)v47;
            double v24 = *(double *)&v47[2];
            [v20 point];
            double v26 = v25;
            double v42 = *(double *)&v47[1];
            double v27 = *(double *)&v47[3];
            id v28 = [TIContinuousPathSample alloc];
            [v20 timeStamp];
            double v30 = v29;
            [v20 force];
            double v32 = v31;
            [v20 radius];
            v34 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v28, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", [v20 stage], objc_msgSend(v20, "pathIndex"), v24 + v22 * v23, v27 + v26 * v42, v30, v32, v33);
            [(TIContinuousPath *)v15 addSample:v34];
          }
          id v17 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v17);
      }
    }
    else
    {
      uint64_t v15 = v41;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatedKBDLayouts, 0);
  objc_storeStrong((id *)&self->_lookupTree, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_pathFile, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end