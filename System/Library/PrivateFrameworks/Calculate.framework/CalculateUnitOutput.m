@interface CalculateUnitOutput
- ($A3B2E143E1A03423F9FC703C010436DC)lengths;
- (CalculateUnitOutput)initWithLocale:(id)a3;
- (NSLocale)locale;
- (UnitsInfo)unitsInfo;
- (int)count;
- (unint64_t)resolvedUnitFormatForUnitID:(int)a3 string:(id)a4;
- (void)dealloc;
- (void)setCount:(int)a3;
- (void)setLengths:(id *)a3;
- (void)setLocale:(id)a3;
- (void)setUnitsInfo:(id)a3;
@end

@implementation CalculateUnitOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setCount:(int)a3
{
  self->_count = a3;
}

- (int)count
{
  return self->_count;
}

- (void)setUnitsInfo:(id)a3
{
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLengths:(id *)a3
{
  self->_lengths = a3;
}

- ($A3B2E143E1A03423F9FC703C010436DC)lengths
{
  return self->_lengths;
}

- (void)dealloc
{
  lengths = self->_lengths;
  if (lengths) {
    free(lengths);
  }
  v4.receiver = self;
  v4.super_class = (Class)CalculateUnitOutput;
  [(CalculateUnitOutput *)&v4 dealloc];
}

- (unint64_t)resolvedUnitFormatForUnitID:(int)a3 string:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || self->_count <= a3)
  {
    unint64_t v15 = 4;
    goto LABEL_18;
  }
  uint64_t v7 = a3;
  v8 = [(UnitsInfo *)self->_unitsInfo objectAtIndexedSubscript:a3];
  int v9 = [v6 length];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke;
  aBlock[3] = &unk_1E6365708;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke_2;
  v32 = &unk_1E6365730;
  id v11 = v10;
  id v33 = v11;
  v12 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v29);
  if (v9 != 3) {
    goto LABEL_6;
  }
  v13 = objc_msgSend(v8, "typeInfo", v29, v30, v31, v32);
  int v14 = [v13 isCurrency];

  if (!v14
    || (unint64_t v15 = 2,
        (*((void (**)(id, void *, uint64_t, void))v11 + 2))(v11, v8, 2, 0),
        v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 compare:v6 options:1],
        v16,
        v17))
  {
LABEL_6:
    lengths = self->_lengths;
    int var1 = lengths[v7].var1;
    if (!var1)
    {
      int var1 = v12[2](v12, v8, 2);
      lengths = self->_lengths;
      lengths[v7].int var1 = var1;
    }
    int var2 = lengths[v7].var2;
    if (!var2)
    {
      int var2 = v12[2](v12, v8, 3);
      lengths = self->_lengths;
      lengths[v7].int var2 = var2;
    }
    int v21 = v9 + 3;
    if (v21 < var1 || v21 > var2)
    {
      if (v21 < var1)
      {
        uint64_t v26 = v7;
        int var0 = lengths[v26].var0;
        if (!var0)
        {
          int var0 = v12[2](v12, v8, 1);
          self->_lengths[v26].int var0 = var0;
        }
        if (v21 <= var0)
        {
          unint64_t v15 = 1;
        }
        else if ((double)var0 + (double)(var1 - var0) * 0.5 >= (double)v21)
        {
          unint64_t v15 = 1;
        }
        else
        {
          unint64_t v15 = 2;
        }
        goto LABEL_16;
      }
      int var3 = lengths[v7].var3;
      if (!var3)
      {
        int var3 = v12[2](v12, v8, 4);
        self->_lengths[v7].int var3 = var3;
      }
      if (v21 > var3)
      {
        if (var3 == var2) {
          unint64_t v15 = 3;
        }
        else {
          unint64_t v15 = 4;
        }
        goto LABEL_16;
      }
      BOOL v22 = (double)var2 + (double)(var3 - var2) * 0.5 < (double)v21;
      uint64_t v23 = 3;
      uint64_t v24 = 4;
    }
    else
    {
      BOOL v22 = (double)var1 + (double)(var2 - var1) * 0.5 < (double)v21;
      uint64_t v23 = 2;
      uint64_t v24 = 3;
    }
    if (v22) {
      unint64_t v15 = v24;
    }
    else {
      unint64_t v15 = v23;
    }
  }
LABEL_16:

LABEL_18:
  return v15;
}

id __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = [v7 typeInfo];
  int v9 = [v8 name];
  v10 = [&unk_1F1872E28 objectForKeyedSubscript:v9];
  uint64_t v11 = (int)[v10 intValue];

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 24);
  v13 = [v7 name];

  int v14 = +[CalculateUnit localizedNameForValue:v12 locale:a4 retainingFormat:a3 unitFormat:v11 unitType:v13 name:1.0];

  return v14;
}

uint64_t __58__CalculateUnitOutput_resolvedUnitFormatForUnitID_string___block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v2 = [v1 length];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }

  return v3;
}

- (CalculateUnitOutput)initWithLocale:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CalculateUnitOutput;
  id v6 = [(CalculateUnitOutput *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    uint64_t v8 = +[UnitsInfo converterUnits];
    unitsInfo = v7->_unitsInfo;
    v7->_unitsInfo = (UnitsInfo *)v8;

    int v10 = [(UnitsInfo *)v7->_unitsInfo unitCount];
    v7->_count = v10;
    v7->_lengths = ($A3B2E143E1A03423F9FC703C010436DC *)malloc_type_calloc(v10, 0x10uLL, 0x1000040451B5BE8uLL);
  }

  return v7;
}

@end