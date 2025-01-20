@interface __NSArrayM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)allObjects;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (void)_mutate;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation __NSArrayM

- (void)dealloc
{
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  p_storage = &self->storage;
  NSUInteger used = self->storage.state.var0.used;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || location + length > used)
  {
    uint64_t v28 = _os_log_pack_size();
    v30 = (char *)v45 - ((MEMORY[0x1F4188790](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v42 = used - 1;
      double v43 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v31, (uint64_t)"-[__NSArrayM getObjects:range:]", location, length, v42);
      CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v43, "-[__NSArrayM getObjects:range:]", location, length, v42);
    }
    else
    {
      double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v31, (uint64_t)"-[__NSArrayM getObjects:range:]", location, length);
      CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v32, "-[__NSArrayM getObjects:range:]", location, length);
    }
    v44 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v33) userInfo:0 osLogPack:v30 size:v28];
    objc_exception_throw(v44);
  }
  if (!a3 && length)
  {
    uint64_t v34 = _os_log_pack_size();
    v36 = (char *)v45 - ((MEMORY[0x1F4188790](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315394;
    *(void *)(v37 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v37 + 12) = 2048;
    *(void *)(v37 + 14) = length;
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayM getObjects:range:]", length);
    goto LABEL_40;
  }
  if (length >> 61)
  {
    uint64_t v34 = _os_log_pack_size();
    v36 = (char *)v45 - ((MEMORY[0x1F4188790](v34, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315394;
    *(void *)(v40 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v40 + 12) = 2048;
    *(void *)(v40 + 14) = length;
    CFStringRef v38 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayM getObjects:range:]", length);
LABEL_40:
    v41 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v38) userInfo:0 osLogPack:v36 size:v34];
    objc_exception_throw(v41);
  }
  if (a3 && length)
  {
    list = p_storage->list;
    uint64_t size = p_storage->size;
    unint64_t v13 = (unint64_t)&p_storage->list[size];
    unint64_t v14 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    uint64_t v15 = -size;
    if (v13 <= v14) {
      uint64_t v16 = -size;
    }
    else {
      uint64_t v16 = 0;
    }
    v17 = (void **)(v14 + 8 * v16);
    switch(length)
    {
      case 1uLL:
        goto LABEL_34;
      case 2uLL:
        goto LABEL_30;
      case 3uLL:
        goto LABEL_26;
      case 4uLL:
        goto LABEL_22;
      default:
        if ((uint64_t)(v13 - (void)v17) >> 3 >= length) {
          LODWORD(v18) = length;
        }
        else {
          uint64_t v18 = (uint64_t)(v13 - (void)v17) >> 3;
        }
        if (v18) {
          memmove(a3, v17, 8 * v18);
        }
        if (length != v18) {
          memmove(&a3[v18], list, 8 * (length - v18));
        }
LABEL_22:
        v20 = *v17;
        v19 = v17 + 1;
        *a3++ = v20;
        if (v13 <= (unint64_t)v19) {
          uint64_t v21 = v15;
        }
        else {
          uint64_t v21 = 0;
        }
        v17 = &v19[v21];
LABEL_26:
        v23 = *v17;
        v22 = v17 + 1;
        *a3++ = v23;
        if (v13 <= (unint64_t)v22) {
          uint64_t v24 = v15;
        }
        else {
          uint64_t v24 = 0;
        }
        v17 = &v22[v24];
LABEL_30:
        v26 = *v17;
        v25 = v17 + 1;
        *a3++ = v26;
        if (v13 <= (unint64_t)v25) {
          uint64_t v27 = v15;
        }
        else {
          uint64_t v27 = 0;
        }
        v17 = &v25[v27];
LABEL_34:
        *a3 = *v17;
        break;
    }
  }
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  int64_t length = a3.length;
  int64_t location = a3.location;
  uint64_t v137 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t v7 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v10 = muts + 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v7);
    if (!*(_WORD *)(v7 + 6)) {
      -[__NSArrayM removeObjectsInRange:]();
    }
    if (*(_WORD *)(v7 + 6) != 1 || *(_WORD *)(v7 + 4) != 0)
    {
      --*(_WORD *)(v7 + 6);
      _cow_mutate_slow((uint64_t)self, v7, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
  }
  self->storage.state.var0.unsigned int muts = v10;
  unint64_t v12 = [(__NSArrayM *)self count];
  unint64_t v13 = v12;
  if (location < 0 || length < 0 || (int64_t v14 = location + length, v12 < location + length))
  {
    if (v12)
    {
      uint64_t v118 = _os_log_pack_size();
      v127 = (char *)&v132 - ((MEMORY[0x1F4188790](v118, v126) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v128 = _os_log_pack_fill();
      uint64_t v129 = v13 - 1;
      double v130 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v128, (uint64_t)"-[__NSArrayM removeObjectsInRange:]", location, length, v129);
      CFStringRef v131 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v130, "-[__NSArrayM removeObjectsInRange:]", location, length, v129);
      uint64_t v124 = _CFAutoreleasePoolAddObject(0, (uint64_t)v131);
      v125 = v127;
    }
    else
    {
      uint64_t v118 = _os_log_pack_size();
      v120 = (char *)&v132 - ((MEMORY[0x1F4188790](v118, v119) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v121 = _os_log_pack_fill();
      double v122 = __os_log_helper_1_2_3_8_32_8_0_8_0(v121, (uint64_t)"-[__NSArrayM removeObjectsInRange:]", location, length);
      CFStringRef v123 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v122, "-[__NSArrayM removeObjectsInRange:]", location, length);
      uint64_t v124 = _CFAutoreleasePoolAddObject(0, (uint64_t)v123);
      v125 = v120;
    }
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v124 userInfo:0 osLogPack:v125 size:v118]);
  }
  if (length)
  {
    list = (id *)p_storage->list;
    uint64_t size = p_storage->size;
    unint64_t v17 = (unint64_t)&p_storage->list[size];
    unint64_t v18 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    if (v17 <= v18) {
      uint64_t v19 = -size;
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = (id *)(v18 + 8 * v19);
    if ((uint64_t)(v17 - (void)v20) >> 3 >= (unint64_t)length) {
      LODWORD(v21) = length;
    }
    else {
      uint64_t v21 = (uint64_t)(v17 - (void)v20) >> 3;
    }
    uint64_t v22 = v21;
    if (v21)
    {
      do
      {
        if (((unint64_t)*v20 & 0x8000000000000000) == 0) {

        }
        ++v20;
        --v22;
      }
      while (v22);
    }
    uint64_t v23 = (length - v21);
    if (length != v21)
    {
      do
      {
        if (((unint64_t)*list & 0x8000000000000000) == 0) {

        }
        ++list;
        --v23;
      }
      while (v23);
    }
    unsigned int v24 = p_storage->size;
    uint64_t used = p_storage->state.var0.used;
    uint64_t v26 = (used - length);
    uint64_t v135 = v26;
    v136 = p_storage;
    if (used == length || (double)v26 * 2.61803399 >= (double)v24) {
      goto LABEL_41;
    }
    size_t v27 = 8 * v26;
    size_t v28 = malloc_good_size(v27);
    if (HIDWORD(v28)) {
      -[__NSArrayM removeObjectsInRange:]();
    }
    size_t v29 = v28;
    v30 = (offset **)malloc_type_malloc(v28, 0xB9DF98CuLL);
    if (!v30)
    {
LABEL_41:
      uint64_t v40 = used - v14;
      if (location >= (unint64_t)(used - v14))
      {
        if (v40)
        {
          uint64_t var0 = v136->var0;
          int64_t v62 = v136->size;
          v63 = v136->list;
          if (length < 1)
          {
            if (v40 >= 1)
            {
              v72 = v63 + 1;
              uint64_t v73 = used + var0 - 1;
              unint64_t v74 = v73 - length;
              if ((unint64_t)v62 <= 1) {
                unint64_t v75 = 1;
              }
              else {
                unint64_t v75 = v136->size;
              }
              uint64_t v76 = (uint64_t)&v63[v62 + 1];
              do
              {
                unint64_t v77 = ((v74 & ~((uint64_t)v74 >> 63)) - (v74 + (v74 >> 63))) / v75;
                int64_t v78 = v73
                    + v62
                    + v62
                    * (((v73 & ~(v73 >> 63)) - (v73 + ((unint64_t)v73 >> 63))) / v75
                     + ((unint64_t)v73 >> 63));
                do
                  v78 -= v62;
                while (v78 >= v62);
                unint64_t v79 = v74 + (v77 + (v74 >> 63)) * v62;
                unint64_t v80 = v62 + v62 * ((v74 >> 63) + v77);
                int64_t v81 = v74 + v80;
                uint64_t v82 = v76 + 8 * v79;
                do
                {
                  v81 -= v62;
                  v80 -= v62;
                  v82 -= 8 * v62;
                }
                while ((uint64_t)(v74 + v80) >= v62);
                if (v78 >= (uint64_t)(v74 + v80)) {
                  int64_t v83 = v74 + v80;
                }
                else {
                  int64_t v83 = v78;
                }
                if (v40 >= v83 + 1) {
                  uint64_t v84 = v83 + 1;
                }
                else {
                  uint64_t v84 = v40;
                }
                if (v78 < v81) {
                  int64_t v81 = v78;
                }
                if (v40 >= v81 + 1) {
                  uint64_t v85 = v81 + 1;
                }
                else {
                  uint64_t v85 = v40;
                }
                memmove((void *)(v82 - 8 * v85), &v72[v78] - v84, 8 * v84);
                v73 -= v84;
                v74 -= v84;
                BOOL v57 = v40 <= v84;
                v40 -= v84;
              }
              while (!v57);
            }
          }
          else if (v40 >= 1)
          {
            uint64_t v64 = location + var0;
            uint64_t v65 = v14 + var0;
            if ((unint64_t)v62 <= 1) {
              unint64_t v66 = 1;
            }
            else {
              unint64_t v66 = v136->size;
            }
            do
            {
              int64_t v67 = v65
                  + v62
                  + v62
                  * (((v65 & ~(v65 >> 63)) - (v65 + ((unint64_t)v65 >> 63))) / v66 + ((unint64_t)v65 >> 63));
              do
                v67 -= v62;
              while (v67 >= v62);
              int64_t v68 = v64
                  + v62
                  + v62
                  * (((unint64_t)v64 >> 63) + ((v64 & ~(v64 >> 63)) - (v64 + ((unint64_t)v64 >> 63)))
                                                   / v66);
              do
                v68 -= v62;
              while (v68 >= v62);
              if (v68 <= v67) {
                int64_t v69 = v67;
              }
              else {
                int64_t v69 = v68;
              }
              uint64_t v70 = v62 - v69;
              if (v40 >= v70) {
                uint64_t v71 = v70;
              }
              else {
                uint64_t v71 = v40;
              }
              memmove(&v63[v68], &v63[v67], 8 * v71);
              v65 += v71;
              v64 += v71;
              BOOL v57 = v40 <= v71;
              v40 -= v71;
            }
            while (!v57);
          }
        }
      }
      else
      {
        uint64_t v41 = p_storage->var0;
        if (location > 0)
        {
          LODWORD(v134) = v24;
          int64_t v42 = p_storage->size;
          uint64_t v43 = (uint64_t)(p_storage->list + 1);
          uint64_t v44 = location + v41 - 1;
          unint64_t v45 = v44 + length;
          if ((unint64_t)v42 <= 1) {
            unint64_t v46 = 1;
          }
          else {
            unint64_t v46 = p_storage->size;
          }
          uint64_t v47 = (uint64_t)&p_storage->list[v42 + 1];
          do
          {
            unint64_t v48 = ((v45 & ~((uint64_t)v45 >> 63)) - (v45 + (v45 >> 63))) / v46;
            int64_t v49 = v44
                + v42
                + v42
                * (((v44 & ~(v44 >> 63)) - (v44 + ((unint64_t)v44 >> 63))) / v46 + ((unint64_t)v44 >> 63));
            do
              v49 -= v42;
            while (v49 >= v42);
            unint64_t v50 = v45 + (v48 + (v45 >> 63)) * v42;
            unint64_t v51 = v42 + v42 * ((v45 >> 63) + v48);
            int64_t v52 = v45 + v51;
            uint64_t v53 = v47 + 8 * v50;
            do
            {
              v52 -= v42;
              v51 -= v42;
              v53 -= 8 * v42;
            }
            while ((uint64_t)(v45 + v51) >= v42);
            if (v49 >= (uint64_t)(v45 + v51)) {
              int64_t v54 = v45 + v51;
            }
            else {
              int64_t v54 = v49;
            }
            if (location >= v54 + 1) {
              int64_t v55 = v54 + 1;
            }
            else {
              int64_t v55 = location;
            }
            if (v49 < v52) {
              int64_t v52 = v49;
            }
            if (location >= v52 + 1) {
              int64_t v56 = v52 + 1;
            }
            else {
              int64_t v56 = location;
            }
            memmove((void *)(v53 - 8 * v56), (const void *)(v43 - 8 * v55 + 8 * v49), 8 * v55);
            v44 -= v55;
            v45 -= v55;
            BOOL v57 = location <= v55;
            location -= v55;
          }
          while (!v57);
          p_storage = v136;
          LODWORD(v41) = v136->var0;
          unsigned int v24 = v134;
        }
        unsigned int v58 = v41 + length;
        p_storage->uint64_t var0 = v58;
        BOOL v59 = v58 >= v24;
        unsigned int v60 = v58 - v24;
        if (v59) {
          v136->uint64_t var0 = v60;
        }
      }
      v136->state.var0.uint64_t used = v135;
    }
    else
    {
      uint64_t v31 = v30;
      uint64_t v134 = 8 * v26;
      if (location)
      {
        double v32 = p_storage->list;
        uint64_t v34 = p_storage->var0;
        uint64_t v33 = p_storage->size;
        unint64_t v35 = (unint64_t)&p_storage->list[v33];
        uint64_t v36 = -v33;
        if (v33 <= v34) {
          uint64_t v37 = -v33;
        }
        else {
          uint64_t v37 = 0;
        }
        CFStringRef v38 = &p_storage->list[v34] + v37;
        uint64_t v39 = v30;
        switch(location)
        {
          case 1:
            goto LABEL_129;
          case 2:
            goto LABEL_125;
          case 3:
            goto LABEL_121;
          case 4:
            goto LABEL_117;
          default:
            unint64_t v86 = (uint64_t)(v35 - (void)v38) >> 3;
            if (v86 >= location) {
              unint64_t v86 = location;
            }
            uint64_t v87 = v86;
            if (v86)
            {
              unint64_t v133 = v86;
              memmove(v30, v38, 8 * v86);
              LODWORD(v86) = v133;
            }
            unsigned int v88 = location - v86;
            if (v88) {
              memmove(&v31[v87], v32, 8 * v88);
            }
LABEL_117:
            v90 = *v38;
            v89 = v38 + 1;
            *uint64_t v31 = v90;
            uint64_t v39 = v31 + 1;
            if (v35 <= (unint64_t)v89) {
              uint64_t v91 = v36;
            }
            else {
              uint64_t v91 = 0;
            }
            CFStringRef v38 = (offset **)&v89[v91];
LABEL_121:
            v93 = *v38;
            v92 = v38 + 1;
            *v39++ = v93;
            if (v35 <= (unint64_t)v92) {
              uint64_t v94 = v36;
            }
            else {
              uint64_t v94 = 0;
            }
            CFStringRef v38 = (offset **)&v92[v94];
LABEL_125:
            v96 = *v38;
            v95 = v38 + 1;
            *v39++ = v96;
            if (v35 <= (unint64_t)v95) {
              uint64_t v97 = v36;
            }
            else {
              uint64_t v97 = 0;
            }
            CFStringRef v38 = (offset **)&v95[v97];
LABEL_129:
            *uint64_t v39 = *v38;
            uint64_t v26 = v135;
            p_storage = v136;
            size_t v27 = v134;
            break;
        }
      }
      unint64_t v98 = used - v14;
      if (v98)
      {
        v99 = &v31[location];
        v100 = p_storage->list;
        uint64_t v101 = p_storage->size;
        unint64_t v102 = (unint64_t)&p_storage->list[v101];
        unint64_t v103 = (unint64_t)(&p_storage->list[p_storage->var0] + v14);
        uint64_t v104 = -v101;
        if (v102 <= v103) {
          uint64_t v105 = -v101;
        }
        else {
          uint64_t v105 = 0;
        }
        v106 = (uint64_t *)(v103 + 8 * v105);
        switch(v98)
        {
          case 1uLL:
            goto LABEL_154;
          case 2uLL:
            goto LABEL_150;
          case 3uLL:
            goto LABEL_146;
          case 4uLL:
            goto LABEL_142;
          default:
            if ((uint64_t)(v102 - (void)v106) >> 3 >= v98) {
              LODWORD(v107) = v98;
            }
            else {
              uint64_t v107 = (uint64_t)(v102 - (void)v106) >> 3;
            }
            if (v107) {
              memmove(v99, v106, 8 * v107);
            }
            if (v98 != v107) {
              memmove(&v99[v107], v100, 8 * (v98 - v107));
            }
LABEL_142:
            v109 = (offset *)*v106;
            v108 = v106 + 1;
            *v99++ = v109;
            if (v102 <= (unint64_t)v108) {
              uint64_t v110 = v104;
            }
            else {
              uint64_t v110 = 0;
            }
            v106 = &v108[v110];
LABEL_146:
            v112 = (offset *)*v106;
            v111 = v106 + 1;
            *v99++ = v112;
            if (v102 <= (unint64_t)v111) {
              uint64_t v113 = v104;
            }
            else {
              uint64_t v113 = 0;
            }
            v106 = &v111[v113];
LABEL_150:
            v115 = (offset *)*v106;
            v114 = v106 + 1;
            *v99++ = v115;
            if (v102 <= (unint64_t)v114) {
              uint64_t v116 = v104;
            }
            else {
              uint64_t v116 = 0;
            }
            v106 = &v114[v116];
LABEL_154:
            *v99 = (offset *)*v106;
            uint64_t v26 = v135;
            p_storage = v136;
            size_t v27 = v134;
            break;
        }
      }
      bzero(&v31[v26], v29 - v27);
      v117 = p_storage->list;
      p_storage->list = v31;
      p_storage->uint64_t var0 = 0;
      p_storage->uint64_t size = v29 >> 3;
      p_storage->state.var0.uint64_t used = v26;
      free(v117);
    }
  }
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return self->storage.state.var0.used;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    uint64_t v7 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v7, (unint64_t)v6);
    if (v7) {
      free(v6);
    }
  }
  v8 = (objc_class *)self;
  id v9 = __CFAllocateObject(v8, 0);
  unsigned int v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  list = self->storage.list;
  unsigned int used = self->storage.state.var0.used;
  uint64_t var0 = self->storage.var0;
  unsigned int v9 = self->storage.size - var0;
  if (used >= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = used;
  }
  if (v10)
  {
    unint64_t result = 0;
    unint64_t v12 = &list[var0];
    while (v12[result] != a3)
    {
      if (v10 == ++result) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (used <= v9)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      LODWORD(v13) = used - v10;
      if (v13 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v13;
      }
      while (*list != a3)
      {
        ++v10;
        ++list;
        if (!--v13) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      return v10;
    }
  }
  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v6 = a3;
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (!__cf_tsanReadFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)&v20 - ((MEMORY[0x1F4188790](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v19 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v18) userInfo:0 osLogPack:v16 size:v14];
    objc_exception_throw(v19);
  }
  __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  unsigned int size = self->storage.size;
  size_t used = self->storage.state.var0.used;
  v22[0] = off_1ECE0A5A0;
  v22[1] = 3221225472;
  v22[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v22[3] = &unk_1ECDAB810;
  unsigned int v23 = size;
  v22[4] = a4;
  v22[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 1, used, (uint64_t)v22) & 1) == 0)
  {
    if ((v6 & 2) != 0)
    {
      char v21 = 0;
      uint64_t v12 = self->storage.state.var0.used;
      while (v12)
      {
        --v12;
        uint64_t v13 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v13);
      }
    }
    else
    {
      char v21 = 0;
      if (self->storage.state.var0.used)
      {
        unint64_t v10 = 0;
        do
        {
          v11 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
          ++v10;
        }
        while (v10 < self->storage.state.var0.used);
      }
    }
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v18 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v15 = used - 1;
      double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndex:]", a3, v15);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v16, "-[__NSArrayM objectAtIndex:]", a3, v15);
    }
    else
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSArrayM objectAtIndex:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM objectAtIndex:]", a3);
    }
    uint64_t v17 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v17);
  }
  unsigned int size = self->storage.size;
  unsigned int v8 = self->storage.var0 + a3;
  if (size > v8) {
    unsigned int size = 0;
  }
  return self->storage.list[v8 - size];
}

- (void)removeLastObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  unint64_t v4 = [(__NSArrayM *)self count];
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4) {
      return;
    }
    unint64_t v5 = v4 - 1;
  }
  else if (v4)
  {
    unint64_t v5 = v4 - 1;
  }
  else
  {
    unint64_t v5 = 0;
  }

  [(__NSArrayM *)self removeObjectAtIndex:v5];
}

- (void)removeAllObjects
{
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  atomic_load((unint64_t *)&self->cow);
  unint64_t result = a3->var0;
  if (a3->var0 == -1) {
    return 0;
  }
  p_storage = &self->storage;
  if (result)
  {
    list = (id *)p_storage->list;
    a3->uint64_t var0 = -1;
    a3->var1 = list;
  }
  else
  {
    a3->var2 = &self->storage.state.mutations;
    unint64_t result = self->storage.state.var0.used;
    uint64_t v10 = p_storage->list;
    uint64_t var0 = self->storage.var0;
    unsigned int size = self->storage.size;
    a3->var1 = (id *)&v10[var0];
    BOOL v13 = (int)var0 + (int)result >= size;
    unint64_t v14 = var0 + result - size;
    if (v14 != 0 && v13)
    {
      a3->uint64_t var0 = v14;
      result -= v14;
    }
    else
    {
      a3->uint64_t var0 = -1;
    }
  }
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v71 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_74:
    uint64_t v55 = _os_log_pack_size();
    BOOL v57 = (char *)&v68 - ((MEMORY[0x1F4188790](v55, v56) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v58 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v58 = 136315138;
    *(void *)(v58 + 4) = "-[__NSArrayM insertObject:atIndex:]";
    CFStringRef v59 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSArrayM insertObject:atIndex:]");
    unsigned int v60 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v59) userInfo:0 osLogPack:v57 size:v55];
    objc_exception_throw(v60);
  }
  if (!a3) {
    goto LABEL_74;
  }
LABEL_3:
  p_storage = &self->storage;
  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    uint64_t v61 = _os_log_pack_size();
    v63 = (char *)&v68 - ((MEMORY[0x1F4188790](v61, v62) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v64 = _os_log_pack_fill();
    if (used)
    {
      double v66 = __os_log_helper_1_2_3_8_32_8_0_8_0(v64, (uint64_t)"-[__NSArrayM insertObject:atIndex:]", a4, used - 1);
      CFStringRef v65 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v66, "-[__NSArrayM insertObject:atIndex:]", a4, used - 1);
    }
    else
    {
      *(_DWORD *)uint64_t v64 = 136315394;
      *(void *)(v64 + 4) = "-[__NSArrayM insertObject:atIndex:]";
      *(_WORD *)(v64 + 12) = 2048;
      *(void *)(v64 + 14) = a4;
      CFStringRef v65 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM insertObject:atIndex:]", a4);
    }
    int64_t v67 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v65) userInfo:0 osLogPack:v63 size:v61];
    objc_exception_throw(v67);
  }
  uint64_t v10 = atomic_load((unint64_t *)&self->cow);
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v12 = muts + 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6)) {
      -[__NSArrayM insertObject:atIndex:]();
    }
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }
  int64_t v68 = (offset *)a3;
  self->storage.state.var0.unsigned int muts = v12;
  size_t size = self->storage.size;
  unsigned int v15 = used + 1;
  if (size < (int)used + 1)
  {
    list = p_storage->list;
    double v17 = (double)used * 1.625;
    if (v17 <= (double)v15) {
      double v17 = (double)v15;
    }
    size_t v18 = malloc_good_size(8 * v17);
    uint64_t v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
    if (!v19) {
      -[__NSArrayM insertObject:atIndex:]();
    }
    uint64_t v20 = v19;
    uint64_t var0 = p_storage->var0;
    if ((int)size - (int)var0 >= used) {
      unsigned int v22 = used;
    }
    else {
      unsigned int v22 = size - var0;
    }
    memmove(v19, &list[var0], 8 * v22);
    memmove(&v20[v22], list, 8 * (used - v22));
    bzero(&v20[used], v18 - 8 * used);
    free(list);
    p_storage->list = v20;
    size_t size = v18 >> 3;
    p_storage->uint64_t var0 = 0;
    p_storage->size_t size = v18 >> 3;
  }
  uint64_t v23 = (used - a4);
  size_t v69 = size;
  unint64_t v70 = a4;
  if (v23 <= a4)
  {
    if (used != a4)
    {
      uint64_t v38 = (uint64_t)(p_storage->list + 1);
      unint64_t v39 = v70 + (unint64_t)v23 + p_storage->var0;
      uint64_t v40 = v39 - 1;
      if (v69 <= 1uLL) {
        unint64_t v41 = 1;
      }
      else {
        unint64_t v41 = v69;
      }
      do
      {
        unint64_t v42 = ((v39 & ~((uint64_t)v39 >> 63)) - (v39 + (v39 >> 63))) / v41;
        uint64_t v43 = v40
            + v69
            + v69
            * (((v40 & ~(v40 >> 63)) - (v40 + ((unint64_t)v40 >> 63))) / v41 + ((unint64_t)v40 >> 63));
        do
          v43 -= v69;
        while (v43 >= v69);
        unint64_t v44 = v39 + (v42 + (v39 >> 63)) * v69;
        unint64_t v45 = v69 + v69 * ((v39 >> 63) + v42);
        uint64_t v46 = v39 + v45;
        uint64_t v47 = v38 + 8 * v69 + 8 * v44;
        do
        {
          v46 -= v69;
          v45 -= v69;
          v47 -= 8 * v69;
        }
        while ((uint64_t)(v39 + v45) >= v69);
        if (v43 >= (uint64_t)(v39 + v45)) {
          uint64_t v48 = v39 + v45;
        }
        else {
          uint64_t v48 = v43;
        }
        if (v23 >= v48 + 1) {
          uint64_t v49 = v48 + 1;
        }
        else {
          uint64_t v49 = v23;
        }
        if (v43 < v46) {
          uint64_t v46 = v43;
        }
        if (v23 >= v46 + 1) {
          uint64_t v50 = v46 + 1;
        }
        else {
          uint64_t v50 = v23;
        }
        memmove((void *)(v47 - 8 * v50), (const void *)(v38 - 8 * v49 + 8 * v43), 8 * v49);
        v40 -= v49;
        v39 -= v49;
        BOOL v34 = v23 <= v49;
        v23 -= v49;
      }
      while (!v34);
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v24 = a4;
      v25 = p_storage->list;
      uint64_t v26 = p_storage->var0;
      uint64_t v27 = v26 - 1;
      if (size <= 1uLL) {
        unint64_t v28 = 1;
      }
      else {
        unint64_t v28 = size;
      }
      do
      {
        uint64_t v29 = v26
            + size
            + size
            * (((v26 & ~(v26 >> 63)) - (v26 + ((unint64_t)v26 >> 63))) / v28 + ((unint64_t)v26 >> 63));
        do
          v29 -= size;
        while (v29 >= size);
        uint64_t v30 = v27
            + size
            + size
            * (((unint64_t)v27 >> 63) + ((v27 & ~(v27 >> 63)) - (v27 + ((unint64_t)v27 >> 63))) / v28);
        do
          v30 -= size;
        while (v30 >= size);
        if (v30 <= v29) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = v30;
        }
        uint64_t v32 = size - v31;
        if (v24 >= v32) {
          uint64_t v33 = v32;
        }
        else {
          uint64_t v33 = v24;
        }
        memmove(&v25[v30], &v25[v29], 8 * v33);
        v26 += v33;
        v27 += v33;
        BOOL v34 = v24 <= v33;
        v24 -= v33;
      }
      while (!v34);
    }
    unsigned int v35 = size + p_storage->var0 - 1;
    p_storage->uint64_t var0 = v35;
    BOOL v36 = v35 >= size;
    unsigned int v37 = v35 - size;
    if (v36) {
      p_storage->uint64_t var0 = v37;
    }
  }
  ++p_storage->state.var0.used;
  unsigned int v51 = p_storage->var0 + v70;
  unint64_t v52 = (unint64_t)v68;
  if (v69 <= v51) {
    int v53 = v69;
  }
  else {
    int v53 = 0;
  }
  p_storage->list[v51 - v53] = v68;
  if ((v52 & 0x8000000000000000) == 0)
  {
    id v54 = (id)v52;
  }
}

- (void)addObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t used = self->storage.state.var0.used;

  [(__NSArrayM *)self insertObject:a3 atIndex:used];
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v10 = _os_log_pack_size();
    unsigned int v12 = (char *)v18 - ((MEMORY[0x1F4188790](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v15 = used - 1;
      double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndexedSubscript:]", a3, v15);
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v16, "-[__NSArrayM objectAtIndexedSubscript:]", a3, v15);
    }
    else
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM objectAtIndexedSubscript:]", a3);
    }
    double v17 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v10];
    objc_exception_throw(v17);
  }
  unsigned int size = self->storage.size;
  unsigned int v8 = self->storage.var0 + a3;
  if (size > v8) {
    unsigned int size = 0;
  }
  return self->storage.list[v8 - size];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }

  -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", a3, 1);
}

- (void)_mutate
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }

  return (id)__NSArrayM_copy((uint64_t)self);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v46[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  unint64_t v11 = [(__NSArrayM *)self count];
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      unint64_t v41 = v11;
      uint64_t v27 = _os_log_pack_size();
      uint64_t v29 = (char *)v46 - ((MEMORY[0x1F4188790](v27, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v43 = _os_log_pack_fill();
      double v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v43, (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length, --v41);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]", v44, "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length, v41);
    }
    else
    {
      uint64_t v27 = _os_log_pack_size();
      uint64_t v29 = (char *)v46 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v30 = _os_log_pack_fill();
      double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringRef v32 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: range {%lu, %lu} extends beyond bounds for empty array", v31, "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length);
    }
    unint64_t v45 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v32) userInfo:0 osLogPack:v29 size:v27];
    objc_exception_throw(v45);
  }
  if (!a4 && a5)
  {
    uint64_t v33 = _os_log_pack_size();
    unsigned int v35 = (char *)v46 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315394;
    *(void *)(v36 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(void *)(v36 + 14) = a5;
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", a5);
    goto LABEL_37;
  }
  if (a5 >> 61)
  {
    uint64_t v33 = _os_log_pack_size();
    unsigned int v35 = (char *)v46 - ((MEMORY[0x1F4188790](v33, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v39 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v39 = 136315394;
    *(void *)(v39 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v39 + 12) = 2048;
    *(void *)(v39 + 14) = a5;
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", a5);
LABEL_37:
    uint64_t v40 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v40);
  }
  if (a5)
  {
    uint64_t v12 = 0;
    do
    {
      if (!a4[v12])
      {
        uint64_t v21 = _os_log_pack_size();
        uint64_t v23 = (char *)v46 - ((MEMORY[0x1F4188790](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v24 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v24 = 136315394;
        *(void *)(v24 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v24 + 12) = 2048;
        *(void *)(v24 + 14) = v12;
        CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", v12);
        uint64_t v26 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v25) userInfo:0 osLogPack:v23 size:v21];
        objc_exception_throw(v26);
      }
      ++v12;
    }
    while (a5 != v12);
    unint64_t v13 = a5;
    CFStringRef v14 = a4;
    do
    {
      if (((unint64_t)*v14 & 0x8000000000000000) == 0) {
        id v15 = (id)*v14;
      }
      ++v14;
      --v13;
    }
    while (v13);
  }
  if (length >= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = length;
  }
  if (v16)
  {
    NSUInteger v17 = location;
    size_t v18 = a4;
    unint64_t v19 = v16;
    do
    {
      uint64_t v20 = (uint64_t)*v18++;
      [(__NSArrayM *)self replaceObjectAtIndex:v17++ withObject:v20];
      --v19;
    }
    while (v19);
  }
  if (length > a5)
  {
    -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
    goto LABEL_27;
  }
  if (length >= a5)
  {
LABEL_27:
    if (!a5) {
      return;
    }
    goto LABEL_28;
  }
  [(__NSArrayM *)self insertObjects:&a4[v16] count:a5 - v16 atIndex:v16 + location];
  do
  {
LABEL_28:
    if (((unint64_t)*a4 & 0x8000000000000000) == 0) {

    }
    ++a4;
    --a5;
  }
  while (a5);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v34[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM replaceObjectAtIndex:withObject:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.unsigned int muts = v11;
  if (!a4)
  {
    uint64_t v20 = _os_log_pack_size();
    uint64_t v22 = (char *)v34 - ((MEMORY[0x1F4188790](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
    CFStringRef v24 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSArrayM replaceObjectAtIndex:withObject:]");
    CFStringRef v25 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v24) userInfo:0 osLogPack:v22 size:v20];
    objc_exception_throw(v25);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v34 - ((MEMORY[0x1F4188790](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v29 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v31 = used - 1;
      double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[__NSArrayM replaceObjectAtIndex:withObject:]", a3, v31);
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v32, "-[__NSArrayM replaceObjectAtIndex:withObject:]", a3, v31);
    }
    else
    {
      *(_DWORD *)uint64_t v29 = 136315394;
      *(void *)(v29 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v29 + 12) = 2048;
      *(void *)(v29 + 14) = a3;
      CFStringRef v30 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM replaceObjectAtIndex:withObject:]", a3);
    }
    uint64_t v33 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v30) userInfo:0 osLogPack:v28 size:v26];
    objc_exception_throw(v33);
  }
  unsigned int size = self->storage.size;
  unsigned int v15 = self->storage.var0 + a3;
  if (size > v15) {
    unsigned int size = 0;
  }
  uint64_t v16 = v15 - size;
  list = p_storage->list;
  uint64_t v18 = (uint64_t)p_storage->list[v16];
  if ((id)v18 != a4)
  {
    if (((unint64_t)a4 & 0x8000000000000000) == 0)
    {
      id v19 = a4;
      list = p_storage->list;
    }
    list[v16] = (offset *)a4;
    if (v18 >= 1)
    {
    }
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v164 = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  uint64_t v10 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v13 = muts + 1;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6)) {
      -[__NSArrayM insertObjects:count:atIndex:]();
    }
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }
  self->storage.state.var0.unsigned int muts = v13;
  if (!a3 && a4)
  {
    uint64_t v147 = _os_log_pack_size();
    v149 = (char *)&v157 - ((MEMORY[0x1F4188790](v147, v148) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v150 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v150 = 136315394;
    *(void *)(v150 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
    *(_WORD *)(v150 + 12) = 2048;
    *(void *)(v150 + 14) = a4;
    CFStringRef v151 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSArrayM insertObjects:count:atIndex:]", a4);
    goto LABEL_183;
  }
  if (a4 >> 61)
  {
    uint64_t v147 = _os_log_pack_size();
    v149 = (char *)&v157 - ((MEMORY[0x1F4188790](v147, v152) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v153 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v153 = 136315394;
    *(void *)(v153 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
    *(_WORD *)(v153 + 12) = 2048;
    *(void *)(v153 + 14) = a4;
    CFStringRef v151 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSArrayM insertObjects:count:atIndex:]", a4);
LABEL_183:
    v154 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v151) userInfo:0 osLogPack:v149 size:v147];
    objc_exception_throw(v154);
  }
  if (!a4)
  {
    unint64_t used = self->storage.state.var0.used;
    if ((a5 & 0x8000000000000000) == 0 && used >= a5) {
      return;
    }
LABEL_40:
    uint64_t v40 = _os_log_pack_size();
    uint64_t v42 = (char *)&v157 - ((MEMORY[0x1F4188790](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v43 = _os_log_pack_fill();
    if (used)
    {
      double v155 = __os_log_helper_1_2_3_8_32_8_0_8_0(v43, (uint64_t)"-[__NSArrayM insertObjects:count:atIndex:]", a5, used - 1);
      CFStringRef v44 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v155, "-[__NSArrayM insertObjects:count:atIndex:]", a5, used - 1);
    }
    else
    {
      *(_DWORD *)uint64_t v43 = 136315394;
      *(void *)(v43 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v43 + 12) = 2048;
      *(void *)(v43 + 14) = a5;
      CFStringRef v44 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM insertObjects:count:atIndex:]", a5);
    }
    v156 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v44) userInfo:0 osLogPack:v42 size:v40];
    objc_exception_throw(v156);
  }
  uint64_t v15 = 0;
  do
  {
    if (!a3[v15])
    {
      uint64_t v141 = _os_log_pack_size();
      v143 = (char *)&v157 - ((MEMORY[0x1F4188790](v141, v142) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v144 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v144 = 136315394;
      *(void *)(v144 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v144 + 12) = 2048;
      *(void *)(v144 + 14) = v15;
      CFStringRef v145 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: attempt to insert nil object from objects[%lu]", "-[__NSArrayM insertObjects:count:atIndex:]", v15);
      v146 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v145) userInfo:0 osLogPack:v143 size:v141];
      objc_exception_throw(v146);
    }
    ++v15;
  }
  while (a4 != v15);
  unint64_t used = p_storage->state.var0.used;
  if ((a5 & 0x8000000000000000) != 0 || used < a5) {
    goto LABEL_40;
  }
  uint64_t v17 = 0;
  do
  {
    unint64_t v18 = (unint64_t)a3[v17];
    if ((v18 & 0x8000000000000000) == 0) {
      id v19 = (id)v18;
    }
    ++v17;
  }
  while (a4 != v17);
  int64_t size = p_storage->size;
  uint64_t v21 = (used + a4);
  if (size >= v21)
  {
    unsigned int v45 = p_storage->state.var0.used;
    int64_t v46 = v45 - a5;
    unint64_t v161 = a5;
    v162 = p_storage;
    uint64_t var0 = p_storage->var0;
    uint64_t v160 = (used + a4);
    if (v46 <= a5)
    {
      if (v45 != a5)
      {
        list = v162->list;
        if ((a4 & 0x8000000000000000) != 0)
        {
          uint64_t v87 = var0 + v161;
          uint64_t v88 = v87 + a4;
          if ((unint64_t)size <= 1) {
            unint64_t v89 = 1;
          }
          else {
            unint64_t v89 = size;
          }
          do
          {
            int64_t v90 = v87
                + size
                + size
                * (((v87 & ~(v87 >> 63)) - (v87 + ((unint64_t)v87 >> 63))) / v89 + ((unint64_t)v87 >> 63));
            do
              v90 -= size;
            while (v90 >= size);
            int64_t v91 = v88
                + size
                + size
                * (((unint64_t)v88 >> 63) + ((v88 & ~(v88 >> 63)) - (v88 + ((unint64_t)v88 >> 63))) / v89);
            do
              v91 -= size;
            while (v91 >= size);
            if (v91 <= v90) {
              int64_t v92 = v90;
            }
            else {
              int64_t v92 = v91;
            }
            int64_t v93 = size - v92;
            if (v46 >= v93) {
              uint64_t v94 = v93;
            }
            else {
              uint64_t v94 = v46;
            }
            memmove(&list[v91], &list[v90], 8 * v94);
            v87 += v94;
            v88 += v94;
            BOOL v57 = v46 <= v94;
            v46 -= v94;
          }
          while (!v57);
        }
        else
        {
          CFStringRef v59 = list + 1;
          uint64_t v60 = v161 + v46 + var0 - 1;
          unint64_t v61 = v60 + a4;
          if ((unint64_t)size <= 1) {
            unint64_t v62 = 1;
          }
          else {
            unint64_t v62 = size;
          }
          v63 = list + 1;
          uint64_t v163 = (uint64_t)&v59[size];
          do
          {
            unint64_t v64 = ((v61 & ~((uint64_t)v61 >> 63)) - (v61 + (v61 >> 63))) / v62;
            int64_t v65 = v60
                + size
                + size
                * (((v60 & ~(v60 >> 63)) - (v60 + ((unint64_t)v60 >> 63))) / v62 + ((unint64_t)v60 >> 63));
            do
              v65 -= size;
            while (v65 >= size);
            unint64_t v66 = v61 + (v64 + (v61 >> 63)) * size;
            unint64_t v67 = size + size * ((v61 >> 63) + v64);
            int64_t v68 = v61 + v67;
            uint64_t v69 = v163 + 8 * v66;
            do
            {
              v68 -= size;
              v67 -= size;
              v69 -= 8 * size;
            }
            while ((uint64_t)(v61 + v67) >= size);
            if (v65 >= (uint64_t)(v61 + v67)) {
              int64_t v70 = v61 + v67;
            }
            else {
              int64_t v70 = v65;
            }
            if (v46 >= v70 + 1) {
              int64_t v71 = v70 + 1;
            }
            else {
              int64_t v71 = v46;
            }
            if (v65 < v68) {
              int64_t v68 = v65;
            }
            if (v46 >= v68 + 1) {
              int64_t v72 = v68 + 1;
            }
            else {
              int64_t v72 = v46;
            }
            memmove((void *)(v69 - 8 * v72), &v63[v65] - v71, 8 * v71);
            v60 -= v71;
            v61 -= v71;
            BOOL v57 = v46 <= v71;
            v46 -= v71;
          }
          while (!v57);
        }
      }
    }
    else
    {
      int64_t v48 = a5;
      if (a5)
      {
        uint64_t v49 = v162->list;
        if ((uint64_t)a4 < 1)
        {
          uint64_t v73 = a5 + var0 - 1;
          unint64_t v74 = v73 - a4;
          unint64_t v75 = v49 + 1;
          if ((unint64_t)size <= 1) {
            unint64_t v76 = 1;
          }
          else {
            unint64_t v76 = size;
          }
          uint64_t v163 = (uint64_t)&v75[size];
          do
          {
            unint64_t v77 = ((v74 & ~((uint64_t)v74 >> 63)) - (v74 + (v74 >> 63))) / v76;
            int64_t v78 = v73
                + size
                + size
                * (((v73 & ~(v73 >> 63)) - (v73 + ((unint64_t)v73 >> 63))) / v76 + ((unint64_t)v73 >> 63));
            do
              v78 -= size;
            while (v78 >= size);
            unint64_t v79 = v74 + (v77 + (v74 >> 63)) * size;
            unint64_t v80 = size + size * ((v74 >> 63) + v77);
            int64_t v81 = v74 + v80;
            uint64_t v82 = v163 + 8 * v79;
            do
            {
              v81 -= size;
              v80 -= size;
              v82 -= 8 * size;
            }
            while ((uint64_t)(v74 + v80) >= size);
            if (v78 >= (uint64_t)(v74 + v80)) {
              int64_t v83 = v74 + v80;
            }
            else {
              int64_t v83 = v78;
            }
            if (v48 >= v83 + 1) {
              int64_t v84 = v83 + 1;
            }
            else {
              int64_t v84 = v48;
            }
            if (v78 < v81) {
              int64_t v81 = v78;
            }
            if (v48 >= v81 + 1) {
              int64_t v85 = v81 + 1;
            }
            else {
              int64_t v85 = v48;
            }
            memmove((void *)(v82 - 8 * v85), &v75[v78] - v84, 8 * v84);
            v73 -= v84;
            v74 -= v84;
            BOOL v57 = v48 <= v84;
            v48 -= v84;
          }
          while (!v57);
        }
        else
        {
          uint64_t v50 = var0 - a4;
          if ((unint64_t)size <= 1) {
            unint64_t v51 = 1;
          }
          else {
            unint64_t v51 = size;
          }
          do
          {
            int64_t v52 = var0
                + size
                + size
                * (((var0 & ~(var0 >> 63)) - (var0 + ((unint64_t)var0 >> 63))) / v51
                 + ((unint64_t)var0 >> 63));
            do
              v52 -= size;
            while (v52 >= size);
            int64_t v53 = v50
                + size
                + size
                * (((unint64_t)v50 >> 63) + ((v50 & ~(v50 >> 63)) - (v50 + ((unint64_t)v50 >> 63))) / v51);
            do
              v53 -= size;
            while (v53 >= size);
            if (v53 <= v52) {
              int64_t v54 = v52;
            }
            else {
              int64_t v54 = v53;
            }
            int64_t v55 = size - v54;
            if (v48 >= v55) {
              uint64_t v56 = v55;
            }
            else {
              uint64_t v56 = v48;
            }
            memmove(&v49[v53], &v49[v52], 8 * v56);
            var0 += v56;
            v50 += v56;
            BOOL v57 = v48 <= v56;
            v48 -= v56;
          }
          while (!v57);
        }
      }
      unsigned int v86 = v162->var0 + size - a4;
      v162->uint64_t var0 = v86;
      if (v86 >= size) {
        v162->uint64_t var0 = v86 - size;
      }
    }
    uint64_t v95 = 0;
    v96 = v162;
    uint64_t v97 = v162->size;
    unint64_t v98 = (unint64_t)&v162->list[v97];
    unsigned int v99 = v160;
    unint64_t v100 = (unint64_t)(&v96->list[v96->var0] + v161);
    uint64_t v101 = -v97;
    do
    {
      if (v98 <= v100) {
        uint64_t v102 = v101;
      }
      else {
        uint64_t v102 = 0;
      }
      unint64_t v103 = (const void **)(v100 + 8 * v102);
      uint64_t v104 = a3[v95];
      if (*v103 != v104) {
        *unint64_t v103 = v104;
      }
      unint64_t v100 = (unint64_t)(v103 + 1);
      ++v95;
    }
    while (a4 > v95);
    v96->state.var0.unint64_t used = v99;
  }
  else
  {
    uint64_t v22 = p_storage->list;
    unint64_t v23 = (unint64_t)((double)used * 1.61803399);
    if (v23 <= v21) {
      LODWORD(v23) = used + a4;
    }
    size_t v24 = malloc_good_size(8 * v23);
    if (HIDWORD(v24)) {
      -[__NSArrayM insertObjects:count:atIndex:]();
    }
    size_t v25 = v24;
    uint64_t v26 = (offset **)malloc_type_malloc(v24, 0xB9DF98CuLL);
    uint64_t v27 = v26;
    if (v22)
    {
      v162 = p_storage;
      if (a5 && v26)
      {
        uint64_t v28 = p_storage;
        uint64_t v29 = p_storage->list;
        p_uint64_t var0 = &v28->var0;
        uint64_t v31 = v28->var0;
        uint64_t v30 = p_var0[1];
        uint64_t v33 = &v29[v30];
        uint64_t v34 = &v29[v31];
        uint64_t v35 = -v30;
        if (v30 <= v31) {
          uint64_t v36 = -v30;
        }
        else {
          uint64_t v36 = 0;
        }
        unint64_t v37 = a5;
        uint64_t v38 = &v34[v36];
        unint64_t v161 = v37;
        uint64_t v39 = v26;
        switch(v37)
        {
          case 1uLL:
            goto LABEL_152;
          case 2uLL:
            goto LABEL_148;
          case 3uLL:
            goto LABEL_144;
          case 4uLL:
            goto LABEL_140;
          default:
            if (v33 - v38 >= v161) {
              uint64_t v105 = v161;
            }
            else {
              uint64_t v105 = v33 - v38;
            }
            uint64_t v106 = v105;
            if (v105)
            {
              uint64_t v163 = v35;
              uint64_t v158 = v105;
              uint64_t v159 = v105;
              memmove(v26, v38, 8 * v105);
              LODWORD(v105) = v158;
              uint64_t v106 = v159;
              uint64_t v35 = v163;
            }
            if (v161 != v105)
            {
              uint64_t v107 = v29;
              uint64_t v108 = v35;
              memmove(&v27[v106], v107, 8 * (v161 - v105));
              uint64_t v35 = v108;
            }
LABEL_140:
            uint64_t v110 = *v38;
            v109 = v38 + 1;
            *uint64_t v27 = v110;
            uint64_t v39 = v27 + 1;
            if (v33 <= v109) {
              uint64_t v111 = v35;
            }
            else {
              uint64_t v111 = 0;
            }
            uint64_t v38 = &v109[v111];
LABEL_144:
            uint64_t v113 = *v38;
            v112 = v38 + 1;
            *v39++ = v113;
            if (v33 <= v112) {
              uint64_t v114 = v35;
            }
            else {
              uint64_t v114 = 0;
            }
            uint64_t v38 = &v112[v114];
LABEL_148:
            uint64_t v116 = *v38;
            v115 = v38 + 1;
            *v39++ = v116;
            if (v33 <= v115) {
              uint64_t v117 = v35;
            }
            else {
              uint64_t v117 = 0;
            }
            uint64_t v38 = &v115[v117];
LABEL_152:
            *uint64_t v39 = *v38;
            a5 = v161;
            p_storage = v162;
            break;
        }
      }
      unint64_t v118 = a5;
      uint64_t v119 = &v27[a5];
      memmove(v119, a3, 8 * a4);
      unint64_t v120 = used - v118;
      if (v120)
      {
        uint64_t v121 = (char *)&v119[a4];
        double v122 = p_storage->list;
        uint64_t v123 = p_storage->size;
        unint64_t v124 = (unint64_t)&p_storage->list[v123];
        unint64_t v125 = (unint64_t)(&p_storage->list[p_storage->var0] + v118);
        uint64_t v126 = -v123;
        if (v124 <= v125) {
          uint64_t v127 = -v123;
        }
        else {
          uint64_t v127 = 0;
        }
        uint64_t v128 = (uint64_t *)(v125 + 8 * v127);
        switch(v120)
        {
          case 1uLL:
            goto LABEL_176;
          case 2uLL:
            goto LABEL_172;
          case 3uLL:
            goto LABEL_168;
          case 4uLL:
            goto LABEL_164;
          default:
            unint64_t v129 = (uint64_t)(v124 - (void)v128) >> 3;
            if (v129 >= v120) {
              unint64_t v129 = v120;
            }
            uint64_t v130 = v129;
            if (v129)
            {
              uint64_t v163 = v129;
              unint64_t v161 = v129;
              memmove(v121, v128, 8 * v129);
              LODWORD(v129) = v161;
              uint64_t v130 = v163;
            }
            unsigned int v131 = v120 - v129;
            if (v131) {
              memmove(&v121[8 * v130], v122, 8 * v131);
            }
LABEL_164:
            uint64_t v133 = *v128;
            uint64_t v132 = v128 + 1;
            *(void *)uint64_t v121 = v133;
            v121 += 8;
            if (v124 <= (unint64_t)v132) {
              uint64_t v134 = v126;
            }
            else {
              uint64_t v134 = 0;
            }
            uint64_t v128 = &v132[v134];
LABEL_168:
            uint64_t v136 = *v128;
            uint64_t v135 = v128 + 1;
            *(void *)uint64_t v121 = v136;
            v121 += 8;
            if (v124 <= (unint64_t)v135) {
              uint64_t v137 = v126;
            }
            else {
              uint64_t v137 = 0;
            }
            uint64_t v128 = &v135[v137];
LABEL_172:
            uint64_t v139 = *v128;
            v138 = v128 + 1;
            *(void *)uint64_t v121 = v139;
            v121 += 8;
            if (v124 <= (unint64_t)v138) {
              uint64_t v140 = v126;
            }
            else {
              uint64_t v140 = 0;
            }
            uint64_t v128 = &v138[v140];
LABEL_176:
            *(void *)uint64_t v121 = *v128;
            p_storage = v162;
            break;
        }
      }
    }
    else
    {
      memmove(v26, a3, 8 * a4);
    }
    bzero(&v27[v21], v25 - 8 * v21);
    p_storage->list = v27;
    p_storage->uint64_t var0 = 0;
    p_storage->int64_t size = v25 >> 3;
    p_storage->state.var0.unint64_t used = v21;
    free(v22);
  }
}

- (id)copy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }

  return (id)__NSArrayM_copy((uint64_t)self);
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v5 = _cow_create((uint64_t)self, 1);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->cow, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      free(v5);
    }
  }
  uint64_t v7 = (objc_class *)self;
  id v8 = __CFAllocateObject(v7, 0);
  unsigned int v9 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v9, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v8, 1);
  return v8;
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v49[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM setObject:atIndex:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.unsigned int muts = v11;
  if (!a3)
  {
    uint64_t v33 = _os_log_pack_size();
    uint64_t v35 = (char *)v49 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315138;
    *(void *)(v36 + 4) = "-[__NSArrayM setObject:atIndex:]";
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSArrayM setObject:atIndex:]");
    uint64_t v38 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v38);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    if (self->storage.state.var0.used)
    {
      uint64_t v44 = self->storage.state.var0.used;
      uint64_t v39 = _os_log_pack_size();
      uint64_t v41 = (char *)v49 - ((MEMORY[0x1F4188790](v39, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v46 = _os_log_pack_fill();
      double v47 = __os_log_helper_1_2_3_8_32_8_0_8_0(v46, (uint64_t)"-[__NSArrayM setObject:atIndex:]", a4, --v44);
      CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v47, "-[__NSArrayM setObject:atIndex:]", a4, v44);
    }
    else
    {
      uint64_t v39 = _os_log_pack_size();
      uint64_t v41 = (char *)v49 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v42 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v42 = 136315394;
      *(void *)(v42 + 4) = "-[__NSArrayM setObject:atIndex:]";
      *(_WORD *)(v42 + 12) = 2048;
      *(void *)(v42 + 14) = a4;
      CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM setObject:atIndex:]", a4);
    }
    int64_t v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
    objc_exception_throw(v48);
  }
  if (used == a4)
  {
    LODWORD(v14) = self->storage.size;
    unsigned int v15 = used + 1;
    if (v14 < (int)used + 1)
    {
      list = p_storage->list;
      double v17 = (double)used * 1.625;
      if (v17 <= (double)v15) {
        double v17 = (double)v15;
      }
      size_t v18 = malloc_good_size(8 * v17);
      id v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
      if (!v19) {
        -[__NSArrayM setObject:atIndex:]();
      }
      uint64_t v20 = v19;
      uint64_t var0 = p_storage->var0;
      if ((int)v14 - (int)var0 >= used) {
        unsigned int v22 = used;
      }
      else {
        unsigned int v22 = v14 - var0;
      }
      memmove(v19, &list[var0], 8 * v22);
      memmove(&v20[v22], list, 8 * (used - v22));
      bzero(&v20[used], v18 - 8 * used);
      free(list);
      p_storage->list = v20;
      size_t v14 = v18 >> 3;
      p_storage->uint64_t var0 = 0;
      p_storage->unsigned int size = v18 >> 3;
    }
    unsigned int v23 = p_storage->var0;
    ++p_storage->state.var0.used;
    unsigned int v24 = v23 + used;
    if (v14 <= v24) {
      int v25 = v14;
    }
    else {
      int v25 = 0;
    }
    p_storage->list[v24 - v25] = (offset *)a3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
    {
      id v26 = a3;
    }
  }
  else
  {
    uint64_t v27 = p_storage->list;
    unsigned int size = p_storage->size;
    unsigned int v29 = p_storage->var0 + a4;
    if (size > v29) {
      unsigned int size = 0;
    }
    uint64_t v30 = v29 - size;
    uint64_t v31 = (uint64_t)v27[v30];
    if ((id)v31 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
      {
        id v32 = a3;
        uint64_t v31 = (uint64_t)v27[v30];
      }
      v27[v30] = (offset *)a3;
      if (v31 >= 1)
      {
      }
    }
  }
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  v49[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM setObject:atIndexedSubscript:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.unsigned int muts = v11;
  if (!a3)
  {
    uint64_t v33 = _os_log_pack_size();
    uint64_t v35 = (char *)v49 - ((MEMORY[0x1F4188790](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315138;
    *(void *)(v36 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
    CFStringRef v37 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: object cannot be nil", "-[__NSArrayM setObject:atIndexedSubscript:]");
    uint64_t v38 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v37) userInfo:0 osLogPack:v35 size:v33];
    objc_exception_throw(v38);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    if (self->storage.state.var0.used)
    {
      uint64_t v44 = self->storage.state.var0.used;
      uint64_t v39 = _os_log_pack_size();
      uint64_t v41 = (char *)v49 - ((MEMORY[0x1F4188790](v39, v45) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v46 = _os_log_pack_fill();
      double v47 = __os_log_helper_1_2_3_8_32_8_0_8_0(v46, (uint64_t)"-[__NSArrayM setObject:atIndexedSubscript:]", a4, --v44);
      CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v47, "-[__NSArrayM setObject:atIndexedSubscript:]", a4, v44);
    }
    else
    {
      uint64_t v39 = _os_log_pack_size();
      uint64_t v41 = (char *)v49 - ((MEMORY[0x1F4188790](v39, v40) + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v42 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v42 = 136315394;
      *(void *)(v42 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
      *(_WORD *)(v42 + 12) = 2048;
      *(void *)(v42 + 14) = a4;
      CFStringRef v43 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM setObject:atIndexedSubscript:]", a4);
    }
    int64_t v48 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v43) userInfo:0 osLogPack:v41 size:v39];
    objc_exception_throw(v48);
  }
  if (used == a4)
  {
    LODWORD(v14) = self->storage.size;
    unsigned int v15 = used + 1;
    if (v14 < (int)used + 1)
    {
      list = p_storage->list;
      double v17 = (double)used * 1.625;
      if (v17 <= (double)v15) {
        double v17 = (double)v15;
      }
      size_t v18 = malloc_good_size(8 * v17);
      id v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
      if (!v19) {
        -[__NSArrayM setObject:atIndexedSubscript:]();
      }
      uint64_t v20 = v19;
      uint64_t var0 = p_storage->var0;
      if ((int)v14 - (int)var0 >= used) {
        unsigned int v22 = used;
      }
      else {
        unsigned int v22 = v14 - var0;
      }
      memmove(v19, &list[var0], 8 * v22);
      memmove(&v20[v22], list, 8 * (used - v22));
      bzero(&v20[used], v18 - 8 * used);
      free(list);
      p_storage->list = v20;
      size_t v14 = v18 >> 3;
      p_storage->uint64_t var0 = 0;
      p_storage->unsigned int size = v18 >> 3;
    }
    unsigned int v23 = p_storage->var0;
    ++p_storage->state.var0.used;
    unsigned int v24 = v23 + used;
    if (v14 <= v24) {
      int v25 = v14;
    }
    else {
      int v25 = 0;
    }
    p_storage->list[v24 - v25] = (offset *)a3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
    {
      id v26 = a3;
    }
  }
  else
  {
    uint64_t v27 = p_storage->list;
    unsigned int size = p_storage->size;
    unsigned int v29 = p_storage->var0 + a4;
    if (size > v29) {
      unsigned int size = 0;
    }
    uint64_t v30 = v29 - size;
    uint64_t v31 = (uint64_t)v27[v30];
    if ((id)v31 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
      {
        id v32 = a3;
        uint64_t v31 = (uint64_t)v27[v30];
      }
      v27[v30] = (offset *)a3;
      if (v31 >= 1)
      {
      }
    }
  }
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  v39[1] = *(void *)off_1ECE0A5B0;
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.unsigned int muts = v11;
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    uint64_t v22 = _os_log_pack_size();
    unsigned int v24 = (char *)v39 - ((MEMORY[0x1F4188790](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v25 = _os_log_pack_fill();
    if (used)
    {
      uint64_t v37 = used - 1;
      double v38 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3, v37);
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v38, "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3, v37);
    }
    else
    {
      *(_DWORD *)uint64_t v25 = 136315394;
      *(void *)(v25 + 4) = "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(void *)(v25 + 14) = a3;
      CFStringRef v26 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3);
    }
    uint64_t v34 = _CFAutoreleasePoolAddObject(0, (uint64_t)v26);
    uint64_t v35 = v24;
    uint64_t v36 = v22;
LABEL_32:
    objc_exception_throw(+[NSException exceptionWithName:@"NSRangeException" reason:v34 userInfo:0 osLogPack:v35 size:v36]);
  }
  if ((a4 & 0x8000000000000000) != 0 || used <= a4)
  {
    uint64_t v27 = _os_log_pack_size();
    unsigned int v29 = (char *)v39 - ((MEMORY[0x1F4188790](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = _os_log_pack_fill();
    uint64_t v31 = used - 1;
    double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a4, v31);
    CFStringRef v33 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds [0 .. %lu]", v32, "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a4, v31);
    uint64_t v34 = _CFAutoreleasePoolAddObject(0, (uint64_t)v33);
    uint64_t v35 = v29;
    uint64_t v36 = v27;
    goto LABEL_32;
  }
  if (a3 != a4)
  {
    unsigned int var0 = self->storage.var0;
    unsigned int size = self->storage.size;
    if (size <= var0 + a3) {
      unsigned int v16 = self->storage.size;
    }
    else {
      unsigned int v16 = 0;
    }
    int v17 = var0 + a3 - v16;
    list = p_storage->list;
    unsigned int v19 = var0 + a4;
    if (size > v19) {
      unsigned int size = 0;
    }
    unsigned int v20 = v19 - size;
    uint64_t v21 = list[v20];
    list[v20] = p_storage->list[v17];
    list[v17] = v21;
  }
}

- (id)allObjects
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  uint64_t v4 = (void *)__NSArrayM_copy((uint64_t)self);

  return v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)insertObject:atIndex:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)insertObject:atIndex:.cold.2()
{
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
}

- (void)exchangeObjectAtIndex:withObjectAtIndex:.cold.1()
{
}

- (void)insertObjects:count:atIndex:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)insertObjects:count:atIndex:.cold.2()
{
}

- (void)removeObjectsInRange:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)removeObjectsInRange:.cold.2()
{
}

- (void)setObject:atIndex:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndex:.cold.2()
{
}

- (void)setObject:atIndexedSubscript:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndexedSubscript:.cold.2()
{
}

@end