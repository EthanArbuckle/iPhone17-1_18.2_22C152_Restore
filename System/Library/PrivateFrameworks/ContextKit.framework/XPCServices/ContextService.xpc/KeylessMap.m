@interface KeylessMap
+ (id)keylessMapForDirectory:(id)a3 fileName:(id)a4;
- (KeylessMap)initWithImpl:(id)a3;
- (id)objectsForKey:(id)a3;
- (id)objectsForKey:(id)a3 intoSet:(id)a4 keepWalkingOut:(BOOL *)a5;
- (void)dealloc;
@end

@implementation KeylessMap

- (KeylessMap)initWithImpl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeylessMap;
  v6 = [(KeylessMap *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    pthread_mutex_init(&v7->_lock, 0);
  }

  return v7;
}

+ (id)keylessMapForDirectory:(id)a3 fileName:(id)a4
{
  v4 = +[ComAppleContextkitUtilKeylessMapBase openWithOrgApacheLuceneStoreDirectory:a3 withNSString:a4];
  if (v4) {
    id v5 = [[KeylessMap alloc] initWithImpl:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)objectsForKey:(id)a3 intoSet:(id)a4 keepWalkingOut:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    v10 = [[OrgApacheLuceneUtilBytesRef alloc] initWithJavaLangCharSequence:v8];
    v11 = v10;
    if (v10 && v10->bytes_ && v10->length_ > 0)
    {
      pthread_mutex_lock(&self->_lock);
      v12 = [(ComAppleContextkitUtilKeylessMapBase *)self->_impl newArray];
      pthread_mutex_unlock(&self->_lock);
      uint64_t v13 = v12[2];
      unint64_t v14 = _PASMurmur3_x64_128();
      if ((int)v13 >= 1)
      {
        v12[3] = v14;
        if (v13 != 1)
        {
          unint64_t v17 = HIDWORD(v14);
          v12[4] = HIDWORD(v14);
          if (v13 >= 3)
          {
            v12[5] = v15;
            if (v13 != 3)
            {
              v12[6] = v16;
              if (v13 >= 5)
              {
                unint64_t v18 = 0;
                unint64_t v19 = (unint64_t)(v13 - 5) >> 1;
                uint64x2_t v20 = (uint64x2_t)vdupq_n_s64(v19);
                uint64_t v21 = (v19 & 0x7FFFFFFFFFFFFFFELL) + 2;
                v22 = v12 + 9;
                int v23 = 4 * HIDWORD(v14);
                int v24 = 6;
                do
                {
                  int32x2_t v25 = vmovn_s64((int64x2_t)vcgeq_u64(v20, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v18), (int8x16_t)xmmword_100320EA0)));
                  if (v25.i8[0])
                  {
                    unint64_t v26 = 715827883 * ((v24 - 2) * (v24 - 2) - 1) * (v24 - 2);
                    *(v22 - 2) = v23 + v14 + HIDWORD(v26) + (v26 >> 63);
                  }
                  if (v25.i8[4])
                  {
                    unint64_t v27 = 715827883 * (v24 * v24 - 1) * v24;
                    _DWORD *v22 = 6 * v17 + v14 + HIDWORD(v27) + (v27 >> 63);
                  }
                  v18 += 2;
                  v22 += 4;
                  LODWORD(v14) = v14 + v23;
                  v24 += 4;
                }
                while (v21 != v18);
                if ((int)v13 >= 6)
                {
                  unint64_t v28 = 0;
                  unint64_t v29 = (unint64_t)(v13 - 6) >> 1;
                  uint64x2_t v30 = (uint64x2_t)vdupq_n_s64(v29);
                  uint64_t v31 = (v29 & 0x7FFFFFFFFFFFFFFELL) + 2;
                  v32 = v12 + 10;
                  int v33 = 7;
                  do
                  {
                    int32x2_t v34 = vmovn_s64((int64x2_t)vcgeq_u64(v30, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v28), (int8x16_t)xmmword_100320EA0)));
                    if (v34.i8[0])
                    {
                      unint64_t v35 = 715827883 * ((v33 - 2) * (v33 - 2) - 1) * (v33 - 2);
                      *(v32 - 2) = 5 * v16 + v15 + HIDWORD(v35) + (v35 >> 63);
                    }
                    if (v34.i8[4])
                    {
                      unint64_t v36 = 715827883 * (v33 * v33 - 1) * v33;
                      _DWORD *v32 = 7 * v16 + v15 + HIDWORD(v36) + (v36 >> 63);
                    }
                    v28 += 2;
                    v32 += 4;
                    v15 += 4 * v16;
                    v33 += 4;
                  }
                  while (v31 != v28);
                }
              }
            }
          }
        }
      }
      pthread_mutex_lock(&self->_lock);
      v37 = [(ComAppleContextkitUtilKeylessMapBase *)self->_impl getWithHashesWithIntArray:v12];
      pthread_mutex_unlock(&self->_lock);
      signed int v38 = [v37 size];
      if (v38)
      {
        if (!v9) {
          id v9 = [objc_alloc((Class)NSMutableSet) initWithCapacity:v38];
        }
        v47 = v12;
        v48 = v11;
        if (a5) {
          *a5 = 0;
        }
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v39 = v37;
        id v40 = [v39 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = *(void *)v50;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v50 != v42) {
                objc_enumerationMutation(v39);
              }
              v44 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              if (a5
                && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                && [v44 integerValue] == (id)16)
              {
                *a5 = 1;
              }
              else
              {
                [v9 addObject:v44];
              }
            }
            id v41 = [v39 countByEnumeratingWithState:&v49 objects:v53 count:16];
          }
          while (v41);
        }

        v12 = v47;
        v11 = v48;
      }
      id v45 = v9;
    }
    else
    {
      id v45 = v9;
    }
  }
  else
  {
    id v45 = v9;
  }

  return v45;
}

- (id)objectsForKey:(id)a3
{
  return [(KeylessMap *)self objectsForKey:a3 intoSet:0 keepWalkingOut:0];
}

- (void)dealloc
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(ComAppleContextkitUtilKeylessMapBase *)self->_impl close];
  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)KeylessMap;
  [(KeylessMap *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end