id _IFOrderedSetTransform(void *a1, uint64_t a2)
{
  void *v3;
  size_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  Class *v14;
  void *v15;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  unsigned char v21[128];
  uint64_t v22;

  v3 = a1;
  v22 = *MEMORY[0x1E4F143B8];
  v4 = [a1 count];
  if (v4)
  {
    v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v3);
          }
          v11 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*((void *)&v17 + 1) + 8 * i));
          if (v11) {
            v5[v8++] = v11;
          }
        }
        v7 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
    v12 = objc_opt_class();
    v13 = [v12 isSubclassOfClass:objc_opt_class()];
    v14 = (Class *)0x1E4F1CAA0;
    if (v13) {
      v14 = (Class *)0x1E4F1CA70;
    }
    v15 = (void *)[objc_alloc(*v14) initWithObjects:v5 count:v8];
    free(v5);
    return v15;
  }
  return v3;
}

void sub_1DC748D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _IFSetTransform(void *a1, uint64_t a2)
{
  v3 = a1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  size_t v4 = [a1 count];
  if (v4)
  {
    v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*((void *)&v17 + 1) + 8 * i));
          if (v11) {
            v5[v8++] = v11;
          }
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
    v12 = objc_opt_class();
    int v13 = [v12 isSubclassOfClass:objc_opt_class()];
    v14 = (Class *)0x1E4F1CAD0;
    if (v13) {
      v14 = (Class *)0x1E4F1CA80;
    }
    v15 = (void *)[objc_alloc(*v14) initWithObjects:v5 count:v8];
    free(v5);
    return v15;
  }
  return v3;
}

void _IFAsyncArrayTransform(void *a1, char a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  char v7 = a3 != 0;
  size_t v8 = [a1 count];
  uint64_t v9 = malloc_type_calloc(v8, 0x10uLL, 0x108004057E67DB5uLL);
  v10 = dispatch_group_create();
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      dispatch_group_enter(v10);
      uint64_t v12 = [a1 objectAtIndex:i];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = ___IFAsyncArrayTransform_block_invoke;
      v20[3] = &unk_1E6CA0BE8;
      char v21 = a2;
      v20[6] = v9;
      v20[7] = i;
      v20[4] = v10;
      v20[5] = &v22;
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(a4 + 16))(a4, v12, i, v20);
      v7 |= *((unsigned char *)v23 + 24) == 0;
      _Block_object_dispose(&v22, 8);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___IFAsyncArrayTransform_block_invoke_2;
  block[3] = &unk_1E6CA0C10;
  block[6] = v8;
  block[7] = v9;
  char v19 = a2;
  block[4] = v10;
  block[5] = a5;
  if (v7)
  {
    global_queue = a3;
    if (!a3)
    {
      global_queue = MEMORY[0x1E4F14428];
      label = dispatch_queue_get_label(MEMORY[0x1E4F14428]);
      if (label != dispatch_queue_get_label(0)) {
        global_queue = dispatch_get_global_queue(0, 0);
      }
    }
    dispatch_group_notify(v10, global_queue, block);
  }
  else
  {
    ___IFAsyncArrayTransform_block_invoke_2((uint64_t)block);
  }
}

void sub_1DC749640(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id _IFArrayTransform(void *a1, uint64_t a2)
{
  size_t v4 = [a1 count];
  if (!v4) {
    return a1;
  }
  size_t v5 = v4;
  uint64_t v6 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  do
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, [a1 objectAtIndex:v7], v7);
    if (v9) {
      v6[v8++] = v9;
    }
    ++v7;
  }
  while (v5 != v7);
  v10 = objc_opt_class();
  uint64_t v11 = (void *)[_IFSafeAllocArrayOfClass(v10) initWithObjects:v6 count:v8];
  free(v6);
  return v11;
}

id _IFSafeAllocArrayOfClass(void *a1)
{
  int v1 = [a1 isSubclassOfClass:objc_opt_class()];
  v2 = (objc_class **)0x1E4F1C978;
  if (v1) {
    v2 = (objc_class **)0x1E4F1CA48;
  }
  v3 = *v2;
  return [v3 alloc];
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E01A2EC0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1DC74A4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IFCombinePropertyListObject(SipHasher *a1, const __CFString *a2)
{
  uint64_t v273 = *MEMORY[0x1E4F143B8];
  CFTypeID v4 = CFGetTypeID(a2);
  if (v4 == CFDataGetTypeID())
  {
    unint64_t value = a1->_buffer.value;
    uint64_t v6 = HIBYTE(value) & 7;
    char v7 = 8 * v6;
    if (v6 == 7)
    {
      uint64_t v8 = (171 << v7) | value & 0xFFFFFFFFFFFFFFLL;
      unint64_t v9 = (value & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v10 = a1->_v3 ^ v8;
      a1->_v3 = v10;
      a1->_buffer.unint64_t value = v9;
      int c = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v12 = a1->_v0;
      }
      else
      {
        unint64_t v12 = a1->_v0;
        unint64_t v13 = a1->_v1;
        unint64_t v14 = a1->_v2;
        do
        {
          unint64_t v15 = v12 + v13;
          unint64_t v16 = v15 ^ __ROR8__(v13, 51);
          unint64_t v17 = v14 + v10;
          uint64_t v18 = __ROR8__(v10, 48);
          unint64_t v12 = (v17 ^ v18) + __ROR8__(v15, 32);
          unint64_t v10 = v12 ^ __ROR8__(v17 ^ v18, 43);
          unint64_t v19 = v17 + v16;
          unint64_t v13 = v19 ^ __ROR8__(v16, 47);
          unint64_t v14 = __ROR8__(v19, 32);
          --c;
        }
        while (c);
        a1->_int v1 = v13;
        a1->_v2 = v14;
        a1->_v3 = v10;
      }
      a1->_v0 = v12 ^ v8;
    }
    else
    {
      a1->_buffer.unint64_t value = ((171 << v7) | value) + 0x100000000000000;
    }
    BytePtr = CFDataGetBytePtr((CFDataRef)a2);
    CFIndex Length = CFDataGetLength((CFDataRef)a2);
    if (Length >= 1)
    {
      v67 = &BytePtr[Length];
      unint64_t v69 = a1->_v3;
      unint64_t v68 = a1->_buffer.value;
      int v70 = a1->_c;
      unint64_t v71 = a1->_v0;
      unint64_t v72 = a1->_v1;
      unint64_t v73 = a1->_v2;
      do
      {
        if (v67 - BytePtr >= 8) {
          unint64_t v74 = 8;
        }
        else {
          unint64_t v74 = v67 - BytePtr;
        }
        if (v74 > 7)
        {
          unint64_t v75 = *(void *)BytePtr;
        }
        else
        {
          unint64_t v75 = 0;
          switch(v74)
          {
            case 1uLL:
              goto LABEL_42;
            case 2uLL:
              goto LABEL_41;
            case 3uLL:
              goto LABEL_40;
            case 4uLL:
              goto LABEL_39;
            case 5uLL:
              goto LABEL_38;
            case 6uLL:
              goto LABEL_37;
            case 7uLL:
              unint64_t v75 = (unint64_t)BytePtr[6] << 48;
LABEL_37:
              v75 |= (unint64_t)BytePtr[5] << 40;
LABEL_38:
              v75 |= (unint64_t)BytePtr[4] << 32;
LABEL_39:
              v75 |= (unint64_t)BytePtr[3] << 24;
LABEL_40:
              v75 |= (unint64_t)BytePtr[2] << 16;
LABEL_41:
              v75 |= (unint64_t)BytePtr[1] << 8;
LABEL_42:
              v75 |= *BytePtr;
              break;
            default:
              break;
          }
        }
        uint64_t v76 = HIBYTE(v68) & 7;
        char v77 = 8 * v76;
        unint64_t v78 = v76 + v74;
        if (v76 + v74 <= 7)
        {
          unint64_t v68 = ((v75 << v77) | v68) + (v74 << 56);
          a1->_buffer.unint64_t value = v68;
        }
        else
        {
          uint64_t v79 = (v75 << v77) | v68 & 0xFFFFFFFFFFFFFFLL;
          unint64_t v80 = HIBYTE(v68) + v74;
          unint64_t v81 = v75 >> -v77;
          if (v78 == 8) {
            unint64_t v81 = 0;
          }
          unint64_t v68 = v81 | (v80 << 56);
          v69 ^= v79;
          a1->_v3 = v69;
          a1->_buffer.unint64_t value = v68;
          if (v70 >= 1)
          {
            int v82 = v70;
            do
            {
              unint64_t v83 = v71 + v72;
              unint64_t v84 = v83 ^ __ROR8__(v72, 51);
              unint64_t v85 = v73 + v69;
              uint64_t v86 = __ROR8__(v69, 48);
              unint64_t v71 = (v85 ^ v86) + __ROR8__(v83, 32);
              unint64_t v69 = v71 ^ __ROR8__(v85 ^ v86, 43);
              unint64_t v87 = v85 + v84;
              unint64_t v72 = v87 ^ __ROR8__(v84, 47);
              unint64_t v73 = __ROR8__(v87, 32);
              --v82;
            }
            while (v82);
            a1->_int v1 = v72;
            a1->_v2 = v73;
            a1->_v3 = v69;
          }
          v71 ^= v79;
          a1->_v0 = v71;
        }
        BytePtr += 8;
      }
      while (BytePtr < v67);
    }
    return;
  }
  if (v4 == CFStringGetTypeID())
  {
    unint64_t v20 = a1->_buffer.value;
    uint64_t v21 = HIBYTE(v20) & 7;
    char v22 = 8 * v21;
    if (v21 == 7)
    {
      uint64_t v23 = (188 << v22) | v20 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v24 = (v20 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v25 = a1->_v3 ^ v23;
      a1->_v3 = v25;
      a1->_buffer.unint64_t value = v24;
      int v26 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v27 = a1->_v0;
      }
      else
      {
        unint64_t v27 = a1->_v0;
        unint64_t v28 = a1->_v1;
        unint64_t v29 = a1->_v2;
        do
        {
          unint64_t v30 = v27 + v28;
          unint64_t v31 = v30 ^ __ROR8__(v28, 51);
          unint64_t v32 = v29 + v25;
          uint64_t v33 = __ROR8__(v25, 48);
          unint64_t v27 = (v32 ^ v33) + __ROR8__(v30, 32);
          unint64_t v25 = v27 ^ __ROR8__(v32 ^ v33, 43);
          unint64_t v34 = v32 + v31;
          unint64_t v28 = v34 ^ __ROR8__(v31, 47);
          unint64_t v29 = __ROR8__(v34, 32);
          --v26;
        }
        while (v26);
        a1->_int v1 = v28;
        a1->_v2 = v29;
        a1->_v3 = v25;
      }
      a1->_v0 = v27 ^ v23;
    }
    else
    {
      a1->_buffer.unint64_t value = ((188 << v22) | v20) + 0x100000000000000;
    }
    CFIndex v103 = CFStringGetLength(a2);
    if (v103 >= 1)
    {
      CFIndex v104 = v103;
      for (CFIndex i = 0; i < v104; i += Bytes)
      {
        CFIndex usedBufLen = 0;
        v275.length = v104 - i;
        v275.location = i;
        CFIndex Bytes = CFStringGetBytes(a2, v275, 0x100u, 0x3Fu, 0, buffer, 1024, &usedBufLen);
        if (usedBufLen >= 1)
        {
          v107 = &buffer[usedBufLen];
          unint64_t v109 = a1->_v3;
          unint64_t v108 = a1->_buffer.value;
          int v110 = a1->_c;
          unint64_t v111 = a1->_v0;
          unint64_t v112 = a1->_v1;
          v113 = buffer;
          unint64_t v114 = a1->_v2;
          do
          {
            if (v107 - v113 >= 8) {
              unint64_t v115 = 8;
            }
            else {
              unint64_t v115 = v107 - v113;
            }
            if (v115 > 7)
            {
              unint64_t v116 = *(void *)v113;
            }
            else
            {
              unint64_t v116 = 0;
              switch(v115)
              {
                case 1uLL:
                  goto LABEL_79;
                case 2uLL:
                  goto LABEL_78;
                case 3uLL:
                  goto LABEL_77;
                case 4uLL:
                  goto LABEL_76;
                case 5uLL:
                  goto LABEL_75;
                case 6uLL:
                  goto LABEL_74;
                case 7uLL:
                  unint64_t v116 = (unint64_t)v113[6] << 48;
LABEL_74:
                  v116 |= (unint64_t)v113[5] << 40;
LABEL_75:
                  v116 |= (unint64_t)v113[4] << 32;
LABEL_76:
                  v116 |= (unint64_t)v113[3] << 24;
LABEL_77:
                  v116 |= (unint64_t)v113[2] << 16;
LABEL_78:
                  v116 |= (unint64_t)v113[1] << 8;
LABEL_79:
                  v116 |= *v113;
                  break;
                default:
                  break;
              }
            }
            uint64_t v117 = HIBYTE(v108) & 7;
            char v118 = 8 * v117;
            unint64_t v119 = v117 + v115;
            if (v117 + v115 <= 7)
            {
              unint64_t v108 = ((v116 << v118) | v108) + (v115 << 56);
              a1->_buffer.unint64_t value = v108;
            }
            else
            {
              uint64_t v120 = (v116 << v118) | v108 & 0xFFFFFFFFFFFFFFLL;
              unint64_t v121 = HIBYTE(v108) + v115;
              unint64_t v122 = v116 >> -v118;
              if (v119 == 8) {
                unint64_t v122 = 0;
              }
              unint64_t v108 = v122 | (v121 << 56);
              v109 ^= v120;
              a1->_v3 = v109;
              a1->_buffer.unint64_t value = v108;
              if (v110 >= 1)
              {
                int v123 = v110;
                do
                {
                  unint64_t v124 = v111 + v112;
                  unint64_t v125 = v124 ^ __ROR8__(v112, 51);
                  unint64_t v126 = v114 + v109;
                  uint64_t v127 = __ROR8__(v109, 48);
                  unint64_t v111 = (v126 ^ v127) + __ROR8__(v124, 32);
                  unint64_t v109 = v111 ^ __ROR8__(v126 ^ v127, 43);
                  unint64_t v128 = v126 + v125;
                  unint64_t v112 = v128 ^ __ROR8__(v125, 47);
                  unint64_t v114 = __ROR8__(v128, 32);
                  --v123;
                }
                while (v123);
                a1->_int v1 = v112;
                a1->_v2 = v114;
                a1->_v3 = v109;
              }
              v111 ^= v120;
              a1->_v0 = v111;
            }
            v113 += 8;
          }
          while (v113 < v107);
        }
      }
    }
    return;
  }
  if (v4 == CFBooleanGetTypeID())
  {
    unint64_t v35 = a1->_buffer.value;
    uint64_t v36 = HIBYTE(v35) & 7;
    char v37 = 8 * v36;
    if (v36 == 7)
    {
      uint64_t v38 = (205 << v37) | v35 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v39 = (v35 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v40 = a1->_v3 ^ v38;
      a1->_v3 = v40;
      a1->_buffer.unint64_t value = v39;
      int v41 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v42 = a1->_v0;
      }
      else
      {
        unint64_t v42 = a1->_v0;
        unint64_t v43 = a1->_v1;
        unint64_t v44 = a1->_v2;
        do
        {
          unint64_t v45 = v42 + v43;
          unint64_t v46 = v45 ^ __ROR8__(v43, 51);
          unint64_t v47 = v44 + v40;
          uint64_t v48 = __ROR8__(v40, 48);
          unint64_t v42 = (v47 ^ v48) + __ROR8__(v45, 32);
          unint64_t v40 = v42 ^ __ROR8__(v47 ^ v48, 43);
          unint64_t v49 = v47 + v46;
          unint64_t v43 = v49 ^ __ROR8__(v46, 47);
          unint64_t v44 = __ROR8__(v49, 32);
          --v41;
        }
        while (v41);
        a1->_int v1 = v43;
        a1->_v2 = v44;
        a1->_v3 = v40;
      }
      a1->_v0 = v42 ^ v38;
    }
    else
    {
      a1->_buffer.unint64_t value = ((205 << v37) | v35) + 0x100000000000000;
    }
    int v144 = CFBooleanGetValue((CFBooleanRef)a2);
    uint64_t v145 = 171;
    if (!v144) {
      uint64_t v145 = 205;
    }
    unint64_t v146 = a1->_buffer.value;
    uint64_t v147 = HIBYTE(v146) & 7;
    char v148 = 8 * v147;
    if (v147 == 7)
    {
      int v149 = a1->_c;
      unint64_t v150 = a1->_v0;
      unint64_t v151 = a1->_v1;
      unint64_t v152 = a1->_v2;
      uint64_t v153 = (v145 << v148) | v146 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v154 = (v146 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v155 = a1->_v3 ^ v153;
      a1->_v3 = v155;
      a1->_buffer.unint64_t value = v154;
      if (v149 >= 1)
      {
        do
        {
          unint64_t v156 = v150 + v151;
          unint64_t v157 = v156 ^ __ROR8__(v151, 51);
          unint64_t v158 = v152 + v155;
          uint64_t v159 = __ROR8__(v155, 48);
          unint64_t v150 = (v158 ^ v159) + __ROR8__(v156, 32);
          unint64_t v155 = v150 ^ __ROR8__(v158 ^ v159, 43);
          unint64_t v160 = v158 + v157;
          unint64_t v151 = v160 ^ __ROR8__(v157, 47);
          unint64_t v152 = __ROR8__(v160, 32);
          --v149;
        }
        while (v149);
        a1->_int v1 = v151;
        a1->_v2 = v152;
        a1->_v3 = v155;
      }
      unint64_t v161 = v150 ^ v153;
      goto LABEL_143;
    }
    uint64_t v162 = (v145 << v148) | v146;
LABEL_110:
    a1->_buffer.unint64_t value = v162 + 0x100000000000000;
    return;
  }
  if (v4 == CFNumberGetTypeID())
  {
    unint64_t v50 = a1->_buffer.value;
    uint64_t v51 = HIBYTE(v50) & 7;
    char v52 = 8 * v51;
    if (v51 == 7)
    {
      uint64_t v53 = (222 << v52) | v50 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v54 = (v50 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v55 = a1->_v3 ^ v53;
      a1->_v3 = v55;
      a1->_buffer.unint64_t value = v54;
      int v56 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v57 = a1->_v0;
      }
      else
      {
        unint64_t v57 = a1->_v0;
        unint64_t v58 = a1->_v1;
        unint64_t v59 = a1->_v2;
        do
        {
          unint64_t v60 = v57 + v58;
          unint64_t v61 = v60 ^ __ROR8__(v58, 51);
          unint64_t v62 = v59 + v55;
          uint64_t v63 = __ROR8__(v55, 48);
          unint64_t v57 = (v62 ^ v63) + __ROR8__(v60, 32);
          unint64_t v55 = v57 ^ __ROR8__(v62 ^ v63, 43);
          unint64_t v64 = v62 + v61;
          unint64_t v58 = v64 ^ __ROR8__(v61, 47);
          unint64_t v59 = __ROR8__(v64, 32);
          --v56;
        }
        while (v56);
        a1->_int v1 = v58;
        a1->_v2 = v59;
        a1->_v3 = v55;
      }
      a1->_v0 = v57 ^ v53;
    }
    else
    {
      a1->_buffer.unint64_t value = ((222 << v52) | v50) + 0x100000000000000;
    }
    if (CFNumberIsFloatType((CFNumberRef)a2)) {
      CFNumberType v178 = kCFNumberDoubleType;
    }
    else {
      CFNumberType v178 = kCFNumberSInt64Type;
    }
    CFNumberGetValue((CFNumberRef)a2, v178, buffer);
    unint64_t v180 = a1->_v3;
    unint64_t v179 = a1->_buffer.value;
    int v181 = a1->_c;
    unint64_t v182 = a1->_v0;
    unint64_t v183 = a1->_v1;
    unint64_t v184 = a1->_v2;
    BOOL v185 = (v179 & 0x700000000000000) == 0;
    uint64_t v186 = 8 * (HIBYTE(v179) & 7);
    uint64_t v187 = (*(void *)buffer << v186) | v179 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v188 = (v179 & 0xFF00000000000000) + 0x800000000000000;
    uint64_t v189 = *(void *)buffer >> -(char)v186;
    if (v185) {
      uint64_t v189 = 0;
    }
    unint64_t v190 = v189 | v188;
    unint64_t v191 = v180 ^ v187;
    a1->_v3 = v180 ^ v187;
    a1->_buffer.unint64_t value = v190;
    if (v181 < 1) {
      goto LABEL_142;
    }
    do
    {
      unint64_t v192 = v182 + v183;
      unint64_t v193 = v192 ^ __ROR8__(v183, 51);
      unint64_t v194 = v184 + v191;
      uint64_t v195 = __ROR8__(v191, 48);
      unint64_t v182 = (v194 ^ v195) + __ROR8__(v192, 32);
      unint64_t v191 = v182 ^ __ROR8__(v194 ^ v195, 43);
      unint64_t v196 = v194 + v193;
      unint64_t v183 = v196 ^ __ROR8__(v193, 47);
      unint64_t v184 = __ROR8__(v196, 32);
      --v181;
    }
    while (v181);
LABEL_141:
    a1->_int v1 = v183;
    a1->_v2 = v184;
    a1->_v3 = v191;
LABEL_142:
    unint64_t v161 = v182 ^ v187;
    goto LABEL_143;
  }
  if (v4 == CFDateGetTypeID())
  {
    unint64_t v88 = a1->_buffer.value;
    uint64_t v89 = HIBYTE(v88) & 7;
    char v90 = 8 * v89;
    if (v89 == 7)
    {
      uint64_t v91 = (241 << v90) | v88 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v92 = (v88 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v93 = a1->_v3 ^ v91;
      a1->_v3 = v93;
      a1->_buffer.unint64_t value = v92;
      int v94 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v95 = a1->_v0;
      }
      else
      {
        unint64_t v95 = a1->_v0;
        unint64_t v96 = a1->_v1;
        unint64_t v97 = a1->_v2;
        do
        {
          unint64_t v98 = v95 + v96;
          unint64_t v99 = v98 ^ __ROR8__(v96, 51);
          unint64_t v100 = v97 + v93;
          uint64_t v101 = __ROR8__(v93, 48);
          unint64_t v95 = (v100 ^ v101) + __ROR8__(v98, 32);
          unint64_t v93 = v95 ^ __ROR8__(v100 ^ v101, 43);
          unint64_t v102 = v100 + v99;
          unint64_t v96 = v102 ^ __ROR8__(v99, 47);
          unint64_t v97 = __ROR8__(v102, 32);
          --v94;
        }
        while (v94);
        a1->_int v1 = v96;
        a1->_v2 = v97;
        a1->_v3 = v93;
      }
      a1->_v0 = v95 ^ v91;
    }
    else
    {
      a1->_buffer.unint64_t value = ((241 << v90) | v88) + 0x100000000000000;
    }
    double v212 = MEMORY[0x1E01A2A80](a2);
    unint64_t v214 = a1->_v3;
    unint64_t v213 = a1->_buffer.value;
    int v215 = a1->_c;
    unint64_t v182 = a1->_v0;
    unint64_t v183 = a1->_v1;
    unint64_t v184 = a1->_v2;
    BOOL v185 = (v213 & 0x700000000000000) == 0;
    uint64_t v216 = 8 * (HIBYTE(v213) & 7);
    uint64_t v187 = (*(void *)&v212 << v216) | v213 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v217 = (v213 & 0xFF00000000000000) + 0x800000000000000;
    uint64_t v218 = *(void *)&v212 >> -(char)v216;
    if (v185) {
      uint64_t v218 = 0;
    }
    unint64_t v219 = v218 | v217;
    unint64_t v191 = v214 ^ v187;
    a1->_v3 = v214 ^ v187;
    a1->_buffer.unint64_t value = v219;
    if (v215 < 1) {
      goto LABEL_142;
    }
    do
    {
      unint64_t v220 = v182 + v183;
      unint64_t v221 = v220 ^ __ROR8__(v183, 51);
      unint64_t v222 = v184 + v191;
      uint64_t v223 = __ROR8__(v191, 48);
      unint64_t v182 = (v222 ^ v223) + __ROR8__(v220, 32);
      unint64_t v191 = v182 ^ __ROR8__(v222 ^ v223, 43);
      unint64_t v224 = v222 + v221;
      unint64_t v183 = v224 ^ __ROR8__(v221, 47);
      unint64_t v184 = __ROR8__(v224, 32);
      --v215;
    }
    while (v215);
    goto LABEL_141;
  }
  if (v4 == CFArrayGetTypeID())
  {
    unint64_t v129 = a1->_buffer.value;
    uint64_t v130 = HIBYTE(v129) & 7;
    char v131 = 8 * v130;
    if (v130 == 7)
    {
      uint64_t v132 = (18 << v131) | v129 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v133 = (v129 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v134 = a1->_v3 ^ v132;
      a1->_v3 = v134;
      a1->_buffer.unint64_t value = v133;
      int v135 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v136 = a1->_v0;
      }
      else
      {
        unint64_t v136 = a1->_v0;
        unint64_t v137 = a1->_v1;
        unint64_t v138 = a1->_v2;
        do
        {
          unint64_t v139 = v136 + v137;
          unint64_t v140 = v139 ^ __ROR8__(v137, 51);
          unint64_t v141 = v138 + v134;
          uint64_t v142 = __ROR8__(v134, 48);
          unint64_t v136 = (v141 ^ v142) + __ROR8__(v139, 32);
          unint64_t v134 = v136 ^ __ROR8__(v141 ^ v142, 43);
          unint64_t v143 = v141 + v140;
          unint64_t v137 = v143 ^ __ROR8__(v140, 47);
          unint64_t v138 = __ROR8__(v143, 32);
          --v135;
        }
        while (v135);
        a1->_int v1 = v137;
        a1->_v2 = v138;
        a1->_v3 = v134;
      }
      a1->_v0 = v136 ^ v132;
    }
    else
    {
      a1->_buffer.unint64_t value = ((18 << v131) | v129) + 0x100000000000000;
    }
    CFIndex Count = CFArrayGetCount((CFArrayRef)a2);
    CFIndex v226 = Count;
    unint64_t v228 = a1->_v3;
    unint64_t v227 = a1->_buffer.value;
    BOOL v185 = (v227 & 0x700000000000000) == 0;
    uint64_t v229 = 8 * (HIBYTE(v227) & 7);
    uint64_t v230 = (Count << v229) | v227 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v231 = (v227 & 0xFF00000000000000) + 0x800000000000000;
    unint64_t v232 = (unint64_t)Count >> -(char)v229;
    if (v185) {
      unint64_t v232 = 0;
    }
    unint64_t v233 = v232 | v231;
    unint64_t v234 = v230 ^ v228;
    a1->_v3 = v230 ^ v228;
    a1->_buffer.unint64_t value = v233;
    int v235 = a1->_c;
    if (a1->_c <= 0)
    {
      unint64_t v236 = a1->_v0;
    }
    else
    {
      unint64_t v236 = a1->_v0;
      unint64_t v237 = a1->_v1;
      unint64_t v238 = a1->_v2;
      do
      {
        unint64_t v239 = v236 + v237;
        unint64_t v240 = v239 ^ __ROR8__(v237, 51);
        unint64_t v241 = v238 + v234;
        uint64_t v242 = __ROR8__(v234, 48);
        unint64_t v236 = (v241 ^ v242) + __ROR8__(v239, 32);
        unint64_t v234 = v236 ^ __ROR8__(v241 ^ v242, 43);
        unint64_t v243 = v241 + v240;
        unint64_t v237 = v243 ^ __ROR8__(v240, 47);
        unint64_t v238 = __ROR8__(v243, 32);
        --v235;
      }
      while (v235);
      a1->_int v1 = v237;
      a1->_v2 = v238;
      a1->_v3 = v234;
    }
    a1->_v0 = v236 ^ v230;
    if (Count >= 1)
    {
      CFIndex v244 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v244);
        IFCombinePropertyListObject(a1, ValueAtIndex);
        ++v244;
      }
      while (v226 != v244);
    }
  }
  else
  {
    if (v4 != CFDictionaryGetTypeID())
    {
      if (v4 != CFNullGetTypeID()) {
        return;
      }
      unint64_t v197 = a1->_buffer.value;
      uint64_t v198 = HIBYTE(v197) & 7;
      char v199 = 8 * v198;
      if (v198 != 7)
      {
        uint64_t v162 = (52 << v199) | v197;
        goto LABEL_110;
      }
      uint64_t v200 = (52 << v199) | v197 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v201 = (v197 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v202 = a1->_v3 ^ v200;
      a1->_v3 = v202;
      a1->_buffer.unint64_t value = v201;
      int v203 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v204 = a1->_v0;
      }
      else
      {
        unint64_t v204 = a1->_v0;
        unint64_t v205 = a1->_v1;
        unint64_t v206 = a1->_v2;
        do
        {
          unint64_t v207 = v204 + v205;
          unint64_t v208 = v207 ^ __ROR8__(v205, 51);
          unint64_t v209 = v206 + v202;
          uint64_t v210 = __ROR8__(v202, 48);
          unint64_t v204 = (v209 ^ v210) + __ROR8__(v207, 32);
          unint64_t v202 = v204 ^ __ROR8__(v209 ^ v210, 43);
          unint64_t v211 = v209 + v208;
          unint64_t v205 = v211 ^ __ROR8__(v208, 47);
          unint64_t v206 = __ROR8__(v211, 32);
          --v203;
        }
        while (v203);
        a1->_int v1 = v205;
        a1->_v2 = v206;
        a1->_v3 = v202;
      }
      unint64_t v161 = v204 ^ v200;
LABEL_143:
      a1->_v0 = v161;
      return;
    }
    unint64_t v163 = a1->_buffer.value;
    uint64_t v164 = HIBYTE(v163) & 7;
    char v165 = 8 * v164;
    if (v164 == 7)
    {
      uint64_t v166 = (35 << v165) | v163 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v167 = (v163 & 0xFF00000000000000) + 0x100000000000000;
      unint64_t v168 = a1->_v3 ^ v166;
      a1->_v3 = v168;
      a1->_buffer.unint64_t value = v167;
      int v169 = a1->_c;
      if (a1->_c <= 0)
      {
        unint64_t v170 = a1->_v0;
      }
      else
      {
        unint64_t v170 = a1->_v0;
        unint64_t v171 = a1->_v1;
        unint64_t v172 = a1->_v2;
        do
        {
          unint64_t v173 = v170 + v171;
          unint64_t v174 = v173 ^ __ROR8__(v171, 51);
          unint64_t v175 = v172 + v168;
          uint64_t v176 = __ROR8__(v168, 48);
          unint64_t v170 = (v175 ^ v176) + __ROR8__(v173, 32);
          unint64_t v168 = v170 ^ __ROR8__(v175 ^ v176, 43);
          unint64_t v177 = v175 + v174;
          unint64_t v171 = v177 ^ __ROR8__(v174, 47);
          unint64_t v172 = __ROR8__(v177, 32);
          --v169;
        }
        while (v169);
        a1->_int v1 = v171;
        a1->_v2 = v172;
        a1->_v3 = v168;
      }
      a1->_v0 = v170 ^ v166;
    }
    else
    {
      a1->_buffer.unint64_t value = ((35 << v165) | v163) + 0x100000000000000;
    }
    unint64_t v246 = CFDictionaryGetCount((CFDictionaryRef)a2);
    CFIndex v247 = v246;
    unint64_t v249 = a1->_v3;
    unint64_t v248 = a1->_buffer.value;
    BOOL v185 = (v248 & 0x700000000000000) == 0;
    uint64_t v250 = 8 * (HIBYTE(v248) & 7);
    uint64_t v251 = (v246 << v250) | v248 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v252 = (v248 & 0xFF00000000000000) + 0x800000000000000;
    unint64_t v253 = v246 >> -(char)v250;
    if (v185) {
      unint64_t v253 = 0;
    }
    unint64_t v254 = v253 | v252;
    unint64_t v255 = v251 ^ v249;
    a1->_v3 = v251 ^ v249;
    a1->_buffer.unint64_t value = v254;
    int v256 = a1->_c;
    if (a1->_c <= 0)
    {
      unint64_t v257 = a1->_v0;
    }
    else
    {
      unint64_t v257 = a1->_v0;
      unint64_t v258 = a1->_v1;
      unint64_t v259 = a1->_v2;
      do
      {
        unint64_t v260 = v257 + v258;
        unint64_t v261 = v260 ^ __ROR8__(v258, 51);
        unint64_t v262 = v259 + v255;
        uint64_t v263 = __ROR8__(v255, 48);
        unint64_t v257 = (v262 ^ v263) + __ROR8__(v260, 32);
        unint64_t v255 = v257 ^ __ROR8__(v262 ^ v263, 43);
        unint64_t v264 = v262 + v261;
        unint64_t v258 = v264 ^ __ROR8__(v261, 47);
        unint64_t v259 = __ROR8__(v264, 32);
        --v256;
      }
      while (v256);
      a1->_int v1 = v258;
      a1->_v2 = v259;
      a1->_v3 = v255;
    }
    a1->_v0 = v257 ^ v251;
    v265 = (const void **)malloc_type_malloc(8 * v246, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v265, 0);
    CFArrayRef v266 = CFArrayCreate(0, v265, v247, 0);
    free(v265);
    MutableCopy = CFArrayCreateMutableCopy(0, v247, v266);
    CFRelease(v266);
    v276.location = 0;
    v276.length = v247;
    CFArraySortValues(MutableCopy, v276, (CFComparatorFunction)IFCFTypeCompare, 0);
    if (v247 >= 1)
    {
      for (CFIndex j = 0; j != v247; ++j)
      {
        v269 = CFArrayGetValueAtIndex(MutableCopy, j);
        IFCombinePropertyListObject(a1, v269);
        v270 = CFDictionaryGetValue((CFDictionaryRef)a2, v269);
        IFCombinePropertyListObject(a1, v270);
      }
    }
    CFRelease(MutableCopy);
  }
}

id IFMergeDictionaries(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v10 = a1;
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
  unint64_t v17 = (id *)&a10;
  id v12 = a9;
  if (v12)
  {
    unint64_t v13 = v12;
    do
    {
      [v11 addEntriesFromDictionary:v13];
      unint64_t v14 = v17++;
      id v15 = *v14;

      unint64_t v13 = v15;
    }
    while (v15);
  }

  return v11;
}

id _IFConcurrentArrayTransform(void *a1, uint64_t a2)
{
  id v3 = a1;
  size_t v4 = [a1 count];
  if (v4)
  {
    size_t v5 = v4;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v23 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___IFConcurrentArrayTransform_block_invoke;
    block[3] = &unk_1E6CA0BC0;
    block[4] = v3;
    block[5] = a2;
    block[6] = &v20;
    dispatch_apply(v5, 0, block);
    uint64_t v6 = 0;
    size_t v7 = 0;
    uint64_t v8 = (void *)v21[3];
    do
    {
      if (v8[v6]) {
        ++v7;
      }
      ++v6;
    }
    while (v5 != v6);
    if (v7 < v5)
    {
      unint64_t v9 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
      uint64_t v8 = v9;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = *(void *)(v21[3] + 8 * v10);
        if (v12) {
          v9[v11++] = v12;
        }
        ++v10;
      }
      while (v5 != v10);
    }
    unint64_t v13 = objc_opt_class();
    unint64_t v14 = (void *)[_IFSafeAllocArrayOfClass(v13) initWithObjects:v8 count:v7];
    uint64_t v15 = 0;
    if (v5 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v5;
    }
    do
    {
      unint64_t v17 = *(void **)(v21[3] + 8 * v15);
      if (v17) {

      }
      ++v15;
    }
    while (v16 != v15);
    free((void *)v21[3]);
    if (v7 < v5) {
      free(v8);
    }
    id v3 = v14;
    _Block_object_dispose(&v20, 8);
  }
  return v3;
}

void sub_1DC74CC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFComparisonResult IFCFTypeCompare(const __CFString *a1, const __CFString *a2, void *a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  CFTypeID v7 = CFGetTypeID(a2);
  if (v6 == v7)
  {
    if (v6 == CFStringGetTypeID())
    {
      return CFStringCompare(a1, a2, 0x200uLL);
    }
    else if (v6 == CFNumberGetTypeID())
    {
      return CFNumberCompare((CFNumberRef)a1, (CFNumberRef)a2, a3);
    }
    else if (v6 == CFDateGetTypeID())
    {
      return CFDateCompare((CFDateRef)a1, (CFDateRef)a2, a3);
    }
    else if (v6 == CFBooleanGetTypeID())
    {
      int Value = CFBooleanGetValue((CFBooleanRef)a1);
      int v10 = CFBooleanGetValue((CFBooleanRef)a2);
      uint64_t v11 = 1;
      if (Value) {
        uint64_t v11 = -1;
      }
      if (Value == v10) {
        return 0;
      }
      else {
        return v11;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (v6 < v7)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

void sub_1DC74D734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DC74D794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DC74DF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC750D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7C00](allocator, localeID);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void free(void *a1)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}