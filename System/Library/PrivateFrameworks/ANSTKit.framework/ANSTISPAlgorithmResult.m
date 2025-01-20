@interface ANSTISPAlgorithmResult
+ (ANSTISPAlgorithmResult)new;
- (ANSTISPAlgorithmResult)init;
- (ANSTISPAlgorithmResult)initWithAcResult:(id *)a3 personMask:(__CVBuffer *)a4 salientPersonMask:(__CVBuffer *)a5 skinMask:(__CVBuffer *)a6 hairMask:(__CVBuffer *)a7 skyMask:(__CVBuffer *)a8 saliencyMask:(__CVBuffer *)a9;
- (__CVBuffer)maskForSemanticCategory:(id)a3;
- (id)_init;
- (id)_objectsOfCategory:(int)a3 fromAcResult:(id *)a4;
- (id)detectedObjectsForCategory:(id)a3;
- (int)smudgeConfidence;
- (void)dealloc;
@end

@implementation ANSTISPAlgorithmResult

+ (ANSTISPAlgorithmResult)new
{
  result = (ANSTISPAlgorithmResult *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPAlgorithmResult)init
{
  result = (ANSTISPAlgorithmResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  return (id)((uint64_t (*)(ANSTISPAlgorithmResult *, char *))MEMORY[0x270F9A6D0])(self, sel_init);
}

- (ANSTISPAlgorithmResult)initWithAcResult:(id *)a3 personMask:(__CVBuffer *)a4 salientPersonMask:(__CVBuffer *)a5 skinMask:(__CVBuffer *)a6 hairMask:(__CVBuffer *)a7 skyMask:(__CVBuffer *)a8 saliencyMask:(__CVBuffer *)a9
{
  v18.receiver = self;
  v18.super_class = (Class)ANSTISPAlgorithmResult;
  v15 = [(ANSTResult *)&v18 _init];
  if (v15)
  {
    if (a3)
    {
      v16 = ($F9BD1179853AD15ECE2EC7F416DEEB2F *)malloc_type_malloc(0x5228uLL, 0x10000400CAA2813uLL);
      v15->_acResult = v16;
      memcpy(v16, a3, sizeof($F9BD1179853AD15ECE2EC7F416DEEB2F));
    }
    v15->_personMask = CVPixelBufferRetain(a4);
    v15->_salientPersonMask = CVPixelBufferRetain(a5);
    v15->_skinMask = CVPixelBufferRetain(a6);
    v15->_hairMask = CVPixelBufferRetain(a7);
    v15->_skyMask = CVPixelBufferRetain(a8);
    v15->_saliencyMask = CVPixelBufferRetain(a9);
  }
  return v15;
}

- (void)dealloc
{
  acResult = self->_acResult;
  if (acResult) {
    free(acResult);
  }
  CVPixelBufferRelease(self->_personMask);
  CVPixelBufferRelease(self->_salientPersonMask);
  CVPixelBufferRelease(self->_skinMask);
  CVPixelBufferRelease(self->_hairMask);
  CVPixelBufferRelease(self->_skyMask);
  CVPixelBufferRelease(self->_saliencyMask);
  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithmResult;
  [(ANSTISPAlgorithmResult *)&v4 dealloc];
}

- (int)smudgeConfidence
{
  return self->_acResult->var6;
}

- (id)detectedObjectsForCategory:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v6 = v4;
  acResult = self->_acResult;
  if (acResult)
  {
    if (@"Face" == v4) {
      goto LABEL_5;
    }
    if (objc_msgSend_isEqualToString_(v4, v5, @"Face"))
    {
      acResult = self->_acResult;
LABEL_5:
      v10 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v5, acResult->var2);
      if (self->_acResult->var2)
      {
        unint64_t v11 = 0;
        uint64_t v12 = 224;
        do
        {
          v13 = [ANSTFace alloc];
          v15 = objc_msgSend_initWithAcFace_(v13, v14, (uint64_t)self->_acResult + v12);
          objc_msgSend_addObject_(v10, v16, (uint64_t)v15);

          ++v11;
          v12 += 1624;
        }
        while (v11 < self->_acResult->var2);
      }
LABEL_22:
      v31 = objc_msgSend_copy(v10, v8, v9);

      goto LABEL_52;
    }
    if (@"Hand" == v6 || objc_msgSend_isEqualToString_(v6, v5, @"Hand"))
    {
      v10 = objc_opt_new();
      objc_super v18 = self->_acResult;
      if (v18->var4)
      {
        unint64_t v19 = 0;
        uint64_t v20 = 16476;
        do
        {
          if ((*(_DWORD *)(&v18->var0.var0 + v20) & 0xFFFFFFFE) == 0xA)
          {
            v21 = [ANSTHand alloc];
            v23 = objc_msgSend_initWithAcObject_(v21, v22, (uint64_t)self->_acResult + v20 - 8);
            objc_msgSend_addObject_(v10, v24, (uint64_t)v23);

            objc_super v18 = self->_acResult;
          }
          ++v19;
          v20 += 36;
        }
        while (v19 < v18->var4);
      }
      goto LABEL_22;
    }
    if (@"Saliency" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"Saliency"))
    {
      v10 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v17, self->_acResult->var7);
      if (self->_acResult->var7)
      {
        unint64_t v25 = 0;
        uint64_t v26 = 17916;
        do
        {
          v27 = [ANSTObject alloc];
          v29 = objc_msgSend_initWithAcObject_(v27, v28, (uint64_t)self->_acResult + v26);
          objc_msgSend_addObject_(v10, v30, (uint64_t)v29);

          ++v25;
          v26 += 36;
        }
        while (v25 < self->_acResult->var7);
      }
      goto LABEL_22;
    }
    if (@"Body" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"Body"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 1, self->_acResult);
      v31 = LABEL_47:;
      goto LABEL_52;
    }
    if (@"FullBody" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"FullBody"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 9, self->_acResult);
      goto LABEL_47;
    }
    if (@"CatBody" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"CatBody"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 2, self->_acResult);
      goto LABEL_47;
    }
    if (@"CatHead" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"CatHead"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 3, self->_acResult);
      goto LABEL_47;
    }
    if (@"DogBody" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"DogBody"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 4, self->_acResult);
      goto LABEL_47;
    }
    if (@"DogHead" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"DogHead"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 5, self->_acResult);
      goto LABEL_47;
    }
    if (@"OtherAnimal" == v6
      || objc_msgSend_isEqualToString_(v6, v17, @"OtherAnimal"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 7, self->_acResult);
      goto LABEL_47;
    }
    if (@"Sportsball" == v6 || objc_msgSend_isEqualToString_(v6, v17, @"Sportsball"))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 8, self->_acResult);
      goto LABEL_47;
    }
    v32 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_246D9B884();
    }
  }
  v31 = 0;
LABEL_52:

  return v31;
}

- (id)_objectsOfCategory:(int)a3 fromAcResult:(id *)a4
{
  v8 = objc_opt_new();
  p_unint64_t var4 = &a4->var4;
  unint64_t var4 = a4->var4;
  if (var4)
  {
    unint64_t v11 = 0;
    var5 = a4->var5;
    do
    {
      long long v13 = *(_OWORD *)&var5->var3.var1;
      v20[0] = *(_OWORD *)&var5->var0;
      v20[1] = v13;
      int v21 = var5->var5;
      if (DWORD2(v20[0]) == a3)
      {
        v14 = [ANSTObject alloc];
        v16 = objc_msgSend_initWithAcObject_(v14, v15, (uint64_t)v20);
        objc_msgSend_addObject_(v8, v17, (uint64_t)v16, *(void *)&v20[0]);

        unint64_t var4 = *p_var4;
      }
      ++v11;
      ++var5;
    }
    while (v11 < var4);
  }
  objc_super v18 = objc_msgSend_copy(v8, v6, v7, *(void *)&v20[0]);

  return v18;
}

- (__CVBuffer)maskForSemanticCategory:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  v6 = v4;
  if (@"Person" == v4 || objc_msgSend_isEqualToString_(v4, v5, @"Person"))
  {
    uint64_t v8 = 16;
LABEL_19:
    long long v13 = *(Class *)((char *)&self->super.super.isa + v8);
    goto LABEL_20;
  }
  if (@"SalientPerson" == v6
    || objc_msgSend_isEqualToString_(v6, v7, @"SalientPerson"))
  {
    uint64_t v8 = 24;
    goto LABEL_19;
  }
  if (@"Skin" == v6 || objc_msgSend_isEqualToString_(v6, v9, @"Skin"))
  {
    uint64_t v8 = 32;
    goto LABEL_19;
  }
  if (@"Hair" == v6 || objc_msgSend_isEqualToString_(v6, v10, @"Hair"))
  {
    uint64_t v8 = 40;
    goto LABEL_19;
  }
  if (@"Sky" == v6 || objc_msgSend_isEqualToString_(v6, v11, @"Sky"))
  {
    uint64_t v8 = 48;
    goto LABEL_19;
  }
  if (@"Saliency" == v6 || objc_msgSend_isEqualToString_(v6, v12, @"Saliency"))
  {
    uint64_t v8 = 56;
    goto LABEL_19;
  }
  v15 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_246D9B904();
  }

  long long v13 = 0;
LABEL_20:

  return v13;
}

@end