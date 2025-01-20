@interface CKXORCUtilities
+ (void)enumerateColumn:(void *)a3 includingRoot:(BOOL)a4 shallow:(BOOL)a5 withBlock:(id)a6;
+ (void)setDefaultValuesForStruct:(unint64_t)a3 withRootColumn:(void *)a4 atOffset:(unint64_t)a5 withSchema:(id)a6 orcHelpers:(id)a7;
@end

@implementation CKXORCUtilities

+ (void)enumerateColumn:(void *)a3 includingRoot:(BOOL)a4 shallow:(BOOL)a5 withBlock:(id)a6
{
  BOOL v6 = a5;
  BOOL v67 = a4;
  v8 = (void (**)(id, const void *, void))a6;
  v9 = (char *)operator new(8uLL);
  uint64_t v10 = 0;
  *(void *)v9 = a3;
  v11 = v9 + 8;
  v72 = v9 + 8;
  v69 = v9;
  int v68 = !v6;
  do
  {
    if (v10) {
      int v12 = v68;
    }
    else {
      int v12 = 1;
    }
    v13 = (const void *)*((void *)v11 - 1);
    __p = v11 - 8;
    if (v10 || v67) {
      v8[2](v8, v13, v10);
    }
    if (v13)
    {
      v14 = __dynamic_cast(v13, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
      if (v14) {
        int v15 = v12;
      }
      else {
        int v15 = 0;
      }
      if (v15 == 1)
      {
        v16 = v14;
        v17 = (void *)v14[10];
        if (v17 != (void *)v14[11])
        {
          v18 = __p;
          do
          {
            if (v18 >= v72)
            {
              uint64_t v19 = (v18 - v69) >> 3;
              if ((unint64_t)(v19 + 1) >> 61) {
                sub_1DD251DAC();
              }
              unint64_t v20 = (v72 - v69) >> 2;
              if (v20 <= v19 + 1) {
                unint64_t v20 = v19 + 1;
              }
              if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v20;
              }
              if (v21) {
                v22 = (char *)sub_1DD251DC4((uint64_t)&v72, v21);
              }
              else {
                v22 = 0;
              }
              v23 = &v22[8 * v19];
              *(void *)v23 = *v17;
              v18 = v23 + 8;
              v24 = __p;
              if (__p != v69)
              {
                do
                {
                  uint64_t v25 = *((void *)v24 - 1);
                  v24 -= 8;
                  *((void *)v23 - 1) = v25;
                  v23 -= 8;
                }
                while (v24 != v69);
                v24 = v69;
              }
              v69 = v23;
              v72 = &v22[8 * v21];
              if (v24) {
                operator delete(v24);
              }
            }
            else
            {
              *(void *)v18 = *v17;
              v18 += 8;
            }
            __p = v18;
            ++v17;
          }
          while (v17 != (void *)v16[11]);
        }
      }
      v26 = __dynamic_cast(v13, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878250, 0);
      if (v26) {
        char v27 = v12;
      }
      else {
        char v27 = 0;
      }
      if (v27)
      {
        v28 = v26;
        v29 = (void *)v26[20];
        v11 = __p;
        if (v29 != (void *)v26[21])
        {
          do
          {
            if (v11 >= v72)
            {
              uint64_t v30 = (v11 - v69) >> 3;
              if ((unint64_t)(v30 + 1) >> 61) {
                sub_1DD251DAC();
              }
              unint64_t v31 = (v72 - v69) >> 2;
              if (v31 <= v30 + 1) {
                unint64_t v31 = v30 + 1;
              }
              if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v32 = v31;
              }
              if (v32) {
                v33 = (char *)sub_1DD251DC4((uint64_t)&v72, v32);
              }
              else {
                v33 = 0;
              }
              v34 = &v33[8 * v30];
              *(void *)v34 = *v29;
              v11 = v34 + 8;
              v35 = __p;
              if (__p != v69)
              {
                do
                {
                  uint64_t v36 = *((void *)v35 - 1);
                  v35 -= 8;
                  *((void *)v34 - 1) = v36;
                  v34 -= 8;
                }
                while (v35 != v69);
                v35 = v69;
              }
              v69 = v34;
              v72 = &v33[8 * v32];
              if (v35) {
                operator delete(v35);
              }
            }
            else
            {
              *(void *)v11 = *v29;
              v11 += 8;
            }
            __p = v11;
            ++v29;
          }
          while (v29 != (void *)v28[21]);
        }
      }
      else
      {
        v11 = __p;
      }
      v37 = __dynamic_cast(v13, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878030, 0);
      if (v37) {
        int v38 = v12;
      }
      else {
        int v38 = 0;
      }
      if (v38 == 1)
      {
        v39 = v37;
        uint64_t v40 = v37[15];
        if (v11 >= v72)
        {
          uint64_t v42 = (v11 - v69) >> 3;
          if ((unint64_t)(v42 + 1) >> 61) {
            sub_1DD251DAC();
          }
          unint64_t v43 = (v72 - v69) >> 2;
          if (v43 <= v42 + 1) {
            unint64_t v43 = v42 + 1;
          }
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v43;
          }
          if (v44) {
            v45 = (char *)sub_1DD251DC4((uint64_t)&v72, v44);
          }
          else {
            v45 = 0;
          }
          v46 = &v45[8 * v42];
          *(void *)v46 = v40;
          v41 = v46 + 8;
          v47 = __p;
          if (__p != v69)
          {
            do
            {
              uint64_t v48 = *((void *)v47 - 1);
              v47 -= 8;
              *((void *)v46 - 1) = v48;
              v46 -= 8;
            }
            while (v47 != v69);
            v47 = v69;
          }
          v69 = v46;
          v72 = &v45[8 * v44];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *(void *)v11 = v40;
          v41 = v11 + 8;
        }
        __pa = v41;
        uint64_t v49 = v39[16];
        if (v41 >= v72)
        {
          uint64_t v50 = (v41 - v69) >> 3;
          if ((unint64_t)(v50 + 1) >> 61) {
            sub_1DD251DAC();
          }
          unint64_t v51 = (v72 - v69) >> 2;
          if (v51 <= v50 + 1) {
            unint64_t v51 = v50 + 1;
          }
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v51;
          }
          if (v52) {
            v53 = (char *)sub_1DD251DC4((uint64_t)&v72, v52);
          }
          else {
            v53 = 0;
          }
          v54 = &v53[8 * v50];
          *(void *)v54 = v49;
          v11 = v54 + 8;
          v55 = __pa;
          if (__pa != v69)
          {
            do
            {
              uint64_t v56 = *((void *)v55 - 1);
              v55 -= 8;
              *((void *)v54 - 1) = v56;
              v54 -= 8;
            }
            while (v55 != v69);
            v55 = v69;
          }
          v69 = v54;
          v72 = &v53[8 * v52];
          if (v55) {
            operator delete(v55);
          }
        }
        else
        {
          *(void *)v41 = v49;
          v11 = v41 + 8;
        }
        __p = v11;
      }
      v57 = __dynamic_cast(v13, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0);
      if (v57) {
        int v58 = v12;
      }
      else {
        int v58 = 0;
      }
      if (v58 == 1)
      {
        uint64_t v59 = v57[15];
        if (v11 >= v72)
        {
          uint64_t v60 = (v11 - v69) >> 3;
          if ((unint64_t)(v60 + 1) >> 61) {
            sub_1DD251DAC();
          }
          unint64_t v61 = (v72 - v69) >> 2;
          if (v61 <= v60 + 1) {
            unint64_t v61 = v60 + 1;
          }
          if ((unint64_t)(v72 - v69) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v62 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v62 = v61;
          }
          if (v62) {
            v63 = (char *)sub_1DD251DC4((uint64_t)&v72, v62);
          }
          else {
            v63 = 0;
          }
          v64 = &v63[8 * v60];
          *(void *)v64 = v59;
          v11 = v64 + 8;
          v65 = __p;
          if (__p != v69)
          {
            do
            {
              uint64_t v66 = *((void *)v65 - 1);
              v65 -= 8;
              *((void *)v64 - 1) = v66;
              v64 -= 8;
            }
            while (v65 != v69);
            v65 = v69;
          }
          v69 = v64;
          v72 = &v63[8 * v62];
          if (v65) {
            operator delete(v65);
          }
        }
        else
        {
          *(void *)v11 = v59;
          v11 += 8;
        }
      }
    }
    else
    {
      v11 -= 8;
    }
    ++v10;
  }
  while (v11 != v69);
  if (v11) {
    operator delete(v11);
  }
}

+ (void)setDefaultValuesForStruct:(unint64_t)a3 withRootColumn:(void *)a4 atOffset:(unint64_t)a5 withSchema:(id)a6 orcHelpers:(id)a7
{
  id v38 = a6;
  id v13 = a7;
  int v15 = *(const void **)(*((void *)a4 + 10) + 8 * objc_msgSend_topLevelIndexForStruct_(v13, v14, a3));
  if (v15) {
    v16 = __dynamic_cast(v15, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
  }
  else {
    v16 = 0;
  }
  *(unsigned char *)(v16[5] + a5) = 1;
  if (sub_1DD2FE5A8((uint64_t)v38, a3))
  {
    for (unint64_t i = 0; i < sub_1DD2FE5A8((uint64_t)v38, a3); ++i)
    {
      v18 = (const char *)sub_1DD2FE5EC((uint64_t)v38, i, a3);
      uint64_t v20 = sub_1DD2FE014((uint64_t)v38, v18, v19);
      if (v20)
      {
        if (v20 != 2 || sub_1DD2FE0E0((uint64_t)v38, v18, v22)) {
          continue;
        }
        unint64_t v24 = objc_msgSend_listColumnIndexForReference_(v13, v23, (uint64_t)v18);
        uint64_t v27 = v16[10];
        if (v24 >= (v16[11] - v27) >> 3 || (uint64_t v28 = *(void *)(v27 + 8 * v24)) == 0)
        {
          uint64_t v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v25, v26);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, a1, @"CKXORCUtilities.mm", 90, @"Unexpected null struct list column in writer");

          __break(1u);
          return;
        }
        char v29 = 1;
      }
      else
      {
        unint64_t v30 = objc_msgSend_valueColumnIndexForField_(v13, v21, (uint64_t)v18);
        uint64_t v33 = v16[10];
        if (v30 >= (v16[11] - v33) >> 3 || (uint64_t v28 = *(void *)(v33 + 8 * v30)) == 0)
        {
          v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v31, v32);
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, a1, @"CKXORCUtilities.mm", 73, @"Unexpected null value column in writer");

          uint64_t v28 = 0;
        }
        char v29 = sub_1DD2FE2A0((uint64_t)v38, v18, v32) ^ 1;
      }
      *(unsigned char *)(*(void *)(v28 + 40) + a5) = v29;
    }
  }
}

@end