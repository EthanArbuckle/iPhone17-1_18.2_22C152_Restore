@interface GLKEffectProperty
+ (void)logSetMasksWithLabel:(id)a3 obj:(id)a4 typeStr:(id)a5;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (GLKBigInt_s)fshMask;
- (GLKBigInt_s)vshMask;
- (GLKEffect)effect;
- (GLKEffectProperty)init;
- (char)fshSource;
- (char)nameString;
- (char)vshSource;
- (int)location;
- (unint64_t)dirtyUniforms;
- (unsigned)masksInitialized;
- (void)dealloc;
- (void)setDirtyUniforms:(unint64_t)a3;
- (void)setEffect:(id)a3;
- (void)setFSHSource:(char *)a3;
- (void)setFshSource:(char *)a3;
- (void)setLocation:(int)a3;
- (void)setMasksInitialized:(unsigned __int8)a3;
- (void)setNameString:(char *)a3;
- (void)setShaderBindings;
- (void)setVSHSource:(char *)a3;
- (void)setVshSource:(char *)a3;
@end

@implementation GLKEffectProperty

- (GLKEffectProperty)init
{
  v10.receiver = self;
  v10.super_class = (Class)GLKEffectProperty;
  v2 = [(GLKEffectProperty *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_location = -1;
    v2->_nameString = 0;
    v2->_vshSource = 0;
    v2->_fshSource = 0;
    v2->_prv = (GLKEffectPropertyPrv *)malloc_type_malloc(0x28uLL, 0xA0040BD5F1188uLL);
    v4 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    *((void *)v3->_prv + 1) = v4;
    *(void *)v3->_prv = v4;
    v5 = *(void **)v3->_prv;
    void *v5 = 0;
    v5[1] = 0;
    v6 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    *((void *)v3->_prv + 3) = v6;
    *((void *)v3->_prv + 2) = v6;
    prv = v3->_prv;
    v8 = (void *)*((void *)prv + 2);
    void *v8 = 0;
    v8[1] = 0;
    *((void *)prv + 4) = 0;
    v3->_masksInitialized = 0;
    [(GLKEffectProperty *)v3 dirtyAllUniforms];
  }
  return v3;
}

- (void)setEffect:(id)a3
{
  *((void *)self->_prv + 4) = a3;
  self->_effect = (GLKEffect *)a3;
}

- (void)setNameString:(char *)a3
{
  nameString = self->_nameString;
  if (nameString)
  {
    free(nameString);
    self->_nameString = 0;
  }
  if (a3) {
    self->_nameString = strdup(a3);
  }
}

- (void)setVSHSource:(char *)a3
{
  vshSource = self->_vshSource;
  if (vshSource)
  {
    free(vshSource);
    self->_vshSource = 0;
  }
  if (a3) {
    self->_vshSource = strdup(a3);
  }
}

- (void)setFSHSource:(char *)a3
{
  fshSource = self->_fshSource;
  if (fshSource)
  {
    free(fshSource);
    self->_fshSource = 0;
  }
  if (a3) {
    self->_fshSource = strdup(a3);
  }
}

- (void)setShaderBindings
{
  NSLog(&cfstr_Glkeffectprope.isa, a2);

  [(GLKEffectProperty *)self dirtyAllUniforms];
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  return 1;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  return 1;
}

+ (void)logSetMasksWithLabel:(id)a3 obj:(id)a4 typeStr:(id)a5
{
  char v8 = [a5 isEqualToString:@"vsh"];
  if (v8) {
    goto LABEL_4;
  }
  if (([a5 isEqualToString:@"fsh"] & 1) == 0)
  {
    if (![a5 isEqualToString:@"both"]) {
      return;
    }
LABEL_4:
    uint64_t v9 = [a4 vshMasks];
    LODWORD(v10) = [a4 vshMaskCt];
    v11 = (void *)[a4 vshMaskStr];
    NSLog(&cfstr_MasksSet.isa, a3);
    if ((int)v10 >= 1)
    {
      uint64_t v10 = v10;
      v12 = (uint64_t *)(v9 + 8);
      while (1)
      {
        v13 = (void *)[a4 vshMask];
        uint64_t v14 = *(v12 - 1);
        if ((v14 & *v13) != 0) {
          break;
        }
        uint64_t v15 = *v12;
        if ((*v12 & v13[1]) != 0) {
          goto LABEL_9;
        }
LABEL_10:
        v12 += 2;
        ++v11;
        if (!--v10) {
          goto LABEL_11;
        }
      }
      uint64_t v15 = *v12;
LABEL_9:
      NSLog(&cfstr_S08llx08llx.isa, *v11, v15, v14);
      goto LABEL_10;
    }
LABEL_11:
    NSLog(&stru_26C9E0050.isa);
    if (v8) {
      return;
    }
  }
  uint64_t v16 = [a4 fshMasks];
  LODWORD(v17) = [a4 fshMaskCt];
  v18 = (void *)[a4 fshMaskStr];
  NSLog(&cfstr_MasksSet.isa, a3);
  if ((int)v17 >= 1)
  {
    uint64_t v17 = v17;
    v19 = (uint64_t *)(v16 + 8);
    while (1)
    {
      v20 = (void *)[a4 fshMask];
      uint64_t v21 = *(v19 - 1);
      if ((v21 & *v20) != 0) {
        break;
      }
      uint64_t v22 = *v19;
      if ((*v19 & v20[1]) != 0) {
        goto LABEL_17;
      }
LABEL_18:
      v19 += 2;
      ++v18;
      if (!--v17) {
        goto LABEL_19;
      }
    }
    uint64_t v22 = *v19;
LABEL_17:
    NSLog(&cfstr_S08llx08llx.isa, *v18, v22, v21);
    goto LABEL_18;
  }
LABEL_19:
  NSLog(&stru_26C9E0050.isa);
}

- (GLKBigInt_s)vshMask
{
  return *(GLKBigInt_s **)self->_prv;
}

- (GLKBigInt_s)fshMask
{
  return (GLKBigInt_s *)*((void *)self->_prv + 2);
}

- (void)dealloc
{
  free(*((void **)self->_prv + 1));
  free(*((void **)self->_prv + 3));
  free(self->_prv);
  nameString = self->_nameString;
  if (nameString) {
    free(nameString);
  }
  vshSource = self->_vshSource;
  if (vshSource) {
    free(vshSource);
  }
  fshSource = self->_fshSource;
  if (fshSource) {
    free(fshSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)GLKEffectProperty;
  [(GLKEffectProperty *)&v6 dealloc];
}

- (int)location
{
  return self->_location;
}

- (void)setLocation:(int)a3
{
  self->_location = a3;
}

- (char)nameString
{
  return self->_nameString;
}

- (char)vshSource
{
  return self->_vshSource;
}

- (void)setVshSource:(char *)a3
{
  self->_vshSource = a3;
}

- (char)fshSource
{
  return self->_fshSource;
}

- (void)setFshSource:(char *)a3
{
  self->_fshSource = a3;
}

- (unint64_t)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(unint64_t)a3
{
  self->_dirtyUniforms = a3;
}

- (unsigned)masksInitialized
{
  return self->_masksInitialized;
}

- (void)setMasksInitialized:(unsigned __int8)a3
{
  self->_masksInitialized = a3;
}

- (GLKEffect)effect
{
  return self->_effect;
}

@end