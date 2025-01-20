@interface NSArray(CAAnimatableValue)
- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:;
- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:;
- (void)CA_addValue:()CAAnimatableValue multipliedBy:;
@end

@implementation NSArray(CAAnimatableValue)

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = [a1 count];
  v35 = a1;
  if (v11 >= [a4 count]) {
    v12 = a4;
  }
  else {
    v12 = a1;
  }
  unint64_t v13 = [v12 count];
  unint64_t v14 = v13;
  if (a3)
  {
    unint64_t v13 = [a3 count];
    if (v14 >= v13)
    {
      unint64_t v13 = [a3 count];
      unint64_t v14 = v13;
    }
  }
  if (a5)
  {
    unint64_t v13 = [a5 count];
    if (v14 >= v13)
    {
      unint64_t v13 = [a5 count];
      unint64_t v14 = v13;
    }
  }
  unint64_t v15 = 8 * v14;
  if (8 * v14 > 0x1000)
  {
    v17 = (char *)malloc_type_malloc(8 * v14, 0x32582B1EuLL);
    v21 = (char *)malloc_type_malloc(8 * v14, 0x41C17E31uLL);
    if (a3)
    {
      v20 = (char *)malloc_type_malloc(8 * v14, 0x40CABF20uLL);
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      v20 = 0;
      if (a5)
      {
LABEL_16:
        v22 = (char *)malloc_type_malloc(8 * v14, 0x949C1C37uLL);
        if (v17) {
          goto LABEL_26;
        }
        goto LABEL_40;
      }
    }
    v22 = 0;
    if (v17) {
      goto LABEL_26;
    }
LABEL_40:
    if (*a6 >= 0.5) {
      uint64_t v31 = (uint64_t)a4;
    }
    else {
      uint64_t v31 = (uint64_t)v35;
    }
    goto LABEL_43;
  }
  v34 = a4;
  MEMORY[0x1F4188790](v13);
  unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = (char *)&v33 - v16;
  bzero((char *)&v33 - v16, 8 * v14);
  MEMORY[0x1F4188790](v18);
  bzero((char *)&v33 - v16, 8 * v14);
  if (a3)
  {
    MEMORY[0x1F4188790](v19);
    v20 = (char *)&v33 - v16;
    bzero((char *)&v33 - v16, 8 * v14);
    if (a5)
    {
      v21 = (char *)&v33 - v16;
LABEL_19:
      MEMORY[0x1F4188790](v19);
      v22 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v22, 8 * v14);
      goto LABEL_25;
    }
    v22 = 0;
    v21 = (char *)&v33 - v16;
  }
  else
  {
    v20 = 0;
    v21 = (char *)&v33 - v16;
    if (a5) {
      goto LABEL_19;
    }
    v22 = 0;
  }
LABEL_25:
  a4 = v34;
  if (!v17) {
    goto LABEL_40;
  }
LABEL_26:
  if (!v21) {
    goto LABEL_40;
  }
  objc_msgSend(v35, "getObjects:range:", v17, 0, v14);
  objc_msgSend(a4, "getObjects:range:", v21, 0, v14);
  if (a3) {
    objc_msgSend(a3, "getObjects:range:", v20, 0, v14);
  }
  v34 = v21;
  v35 = v17;
  if (a5) {
    objc_msgSend(a5, "getObjects:range:", v22, 0, v14);
  }
  if (v14)
  {
    v24 = v34;
    v23 = (id *)v35;
    v25 = v20;
    v26 = v22;
    for (unint64_t i = v14; i; --i)
    {
      if (v20)
      {
        uint64_t v28 = *(void *)v25;
        if (!v22) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v28 = 0;
        if (!v22)
        {
LABEL_37:
          uint64_t v29 = 0;
          goto LABEL_38;
        }
      }
      uint64_t v29 = *(void *)v26;
LABEL_38:
      uint64_t v30 = *(void *)v24;
      v24 += 8;
      id *v23 = (id)objc_msgSend(*v23, "CA_interpolateValues:::interpolator:", v28, v30, v29, a6);
      ++v23;
      v26 += 8;
      v25 += 8;
    }
  }
  v17 = v35;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:v14];
  v21 = v34;
LABEL_43:
  if (v15 > 0x1000 && v20) {
    free(v20);
  }
  if (v15 > 0x1000 && v17) {
    free(v17);
  }
  if (v15 > 0x1000 && v21) {
    free(v21);
  }
  if (v15 > 0x1000 && v22) {
    free(v22);
  }
  return v31;
}

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a1 count];
  if (v7 >= [a4 count]) {
    v8 = a4;
  }
  else {
    v8 = a1;
  }
  uint64_t v9 = [v8 count];
  uint64_t v10 = v9;
  size_t v11 = 8 * v9;
  if ((unint64_t)(8 * v9) > 0x1000)
  {
    v12 = (char *)malloc_type_malloc(8 * v9, 0xF3417E9uLL);
    unint64_t v14 = (uint64_t *)malloc_type_malloc(v11, 0x34AED3DCuLL);
  }
  else
  {
    MEMORY[0x1F4188790](v9);
    v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
    MEMORY[0x1F4188790](v13);
    unint64_t v14 = (uint64_t *)v12;
    bzero(v12, v11);
  }
  if (v12) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (a2 >= 0.5) {
      uint64_t v16 = (uint64_t)a4;
    }
    else {
      uint64_t v16 = (uint64_t)a1;
    }
  }
  else
  {
    objc_msgSend(a1, "getObjects:range:", v12, 0, v10);
    objc_msgSend(a4, "getObjects:range:", v14, 0, v10);
    if (v10)
    {
      uint64_t v18 = (id *)v12;
      uint64_t v19 = v14;
      uint64_t v20 = v10;
      do
      {
        uint64_t v21 = *v19++;
        *(float *)&double v17 = a2;
        *uint64_t v18 = (id)objc_msgSend(*v18, "CA_interpolateValue:byFraction:", v21, v17);
        ++v18;
        --v20;
      }
      while (v20);
    }
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:v10];
  }
  if (v11 > 0x1000 && v14) {
    free(v14);
  }
  if (v11 > 0x1000 && v12) {
    free(v12);
  }
  return v16;
}

- (void)CA_addValue:()CAAnimatableValue multipliedBy:
{
  v6 = a1;
  v21[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a1 count];
  if (v7 >= [a3 count]) {
    v8 = a3;
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = [v8 count];
  uint64_t v10 = v9;
  size_t v11 = 8 * v9;
  if ((unint64_t)(8 * v9) > 0x1000)
  {
    v12 = (char *)malloc_type_malloc(8 * v9, 0x1AFB272DuLL);
    unint64_t v14 = (uint64_t *)malloc_type_malloc(v11, 0xDF1DD86EuLL);
  }
  else
  {
    MEMORY[0x1F4188790](v9);
    v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
    MEMORY[0x1F4188790](v13);
    unint64_t v14 = (uint64_t *)v12;
    bzero(v12, v11);
  }
  if (v12) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    objc_msgSend(v6, "getObjects:range:", v12, 0, v10);
    objc_msgSend(a3, "getObjects:range:", v14, 0, v10);
    if (v10)
    {
      uint64_t v16 = (id *)v12;
      double v17 = v14;
      uint64_t v18 = v10;
      do
      {
        uint64_t v19 = *v17++;
        *uint64_t v16 = (id)objc_msgSend(*v16, "CA_addValue:multipliedBy:", v19, a4);
        ++v16;
        --v18;
      }
      while (v18);
    }
    v6 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:v10];
  }
  if (v11 > 0x1000 && v14) {
    free(v14);
  }
  if (v11 > 0x1000 && v12) {
    free(v12);
  }
  return v6;
}

@end