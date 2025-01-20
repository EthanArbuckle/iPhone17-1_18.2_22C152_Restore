@interface BSDescriptionStyle
+ (BSDescriptionStyle)new;
+ (id)build:(id)a3;
+ (id)debugStyle;
+ (id)keyValuePairSortedByKeyStyle;
+ (id)styleForEndTruncatingCollectionsOverItemCount:(int64_t)a3;
+ (id)succinctStyle;
- (BOOL)isEqual:(id)a3;
- (BSDescriptionStyle)init;
- (NSSet)clientInformation;
- (NSString)description;
- (id)_init;
- (id)_initWithCopyOf:(void *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)styleByOverlayingStyle:(id)a3;
- (int64_t)bodyItemSeparator;
- (int64_t)collectionLineBreak;
- (int64_t)collectionTruncationStyle;
- (int64_t)debugging;
- (int64_t)keyValuePairSorting;
- (int64_t)maximumItemCountForTruncation;
- (int64_t)maximumNameLengthBeforeTruncation;
- (int64_t)maximumValueLengthBeforeTruncation;
- (int64_t)nameTruncation;
- (int64_t)proemItemSeparator;
- (int64_t)valueTruncation;
- (int64_t)verbosity;
- (unint64_t)hash;
- (void)_styleByOverlayingStyle:(CFSetRef *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BSDescriptionStyle

- (void).cxx_destruct
{
}

- (void)_styleByOverlayingStyle:(CFSetRef *)a1
{
  v2 = a1;
  if (a1)
  {
    if ((CFSetRef *)a2 == a1)
    {
      v5 = a1;
      goto LABEL_51;
    }
    if (a1[1]) {
      BOOL v4 = *(void *)(a2 + 8) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4
      && (!a1[2] || *(void *)(a2 + 16))
      && (!a1[3] || *(void *)(a2 + 24))
      && (!a1[5] || *(void *)(a2 + 40))
      && (!a1[4] || *(void *)(a2 + 32))
      && (!a1[6] || *(void *)(a2 + 48))
      && a1[7] == *(CFSetRef *)(a2 + 56)
      && (!a1[8] || *(void *)(a2 + 64))
      && a1[9] == *(CFSetRef *)(a2 + 72)
      && (!a1[10] || *(void *)(a2 + 80))
      && (!a1[11] || *(void *)(a2 + 88))
      && BSEqualSets(a1[13], *(const __CFSet **)(a2 + 104)))
    {
      v5 = (CFSetRef *)(id)a2;
LABEL_51:
      v2 = v5;
      goto LABEL_54;
    }
    v6 = -[BSDescriptionStyle _initWithCopyOf:]([BSDescriptionStyle alloc], (uint64_t)v2);
    v2 = v6;
    if (v6)
    {
      v7 = *(void **)(a2 + 8);
      if (v7) {
        v6[1] = v7;
      }
      v8 = *(void **)(a2 + 16);
      if (v8) {
        v6[2] = v8;
      }
      v9 = *(void **)(a2 + 24);
      if (v9) {
        v6[3] = v9;
      }
      v10 = *(void **)(a2 + 32);
      if (v10) {
        v6[4] = v10;
      }
      v11 = *(void **)(a2 + 40);
      if (v11) {
        v6[5] = v11;
      }
      v12 = *(void **)(a2 + 88);
      if (v12) {
        v6[11] = v12;
      }
      v13 = *(void **)(a2 + 48);
      if (v13)
      {
        v6[6] = v13;
        v6[7] = *(id *)(a2 + 56);
      }
      v14 = *(void **)(a2 + 64);
      if (v14)
      {
        v6[8] = v14;
        v6[9] = *(id *)(a2 + 72);
      }
      v15 = *(void **)(a2 + 80);
      if (v15)
      {
        v6[10] = v15;
        v6[12] = *(id *)(a2 + 96);
      }
      id v16 = *(id *)(a2 + 104);
      if (v16)
      {
        id v17 = v6[13];
        if (v17 != v16)
        {
          if (v17)
          {
            uint64_t v18 = objc_msgSend(v17, "setByAddingObjectsFromSet:");
          }
          else
          {
            uint64_t v18 = [*(id *)(a2 + 104) copy];
          }
          v19 = (void *)v2[13];
          v2[13] = v18;
        }
      }
    }
  }
LABEL_54:
  return v2;
}

- (NSSet)clientInformation
{
  return self->_clientInformation;
}

void __32__BSDescriptionStyle_debugStyle__block_invoke()
{
  id v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1EB21B308;
  qword_1EB21B308 = (uint64_t)v0;

  *(void *)(qword_1EB21B308 + 16) = 2;
}

+ (id)build:(id)a3
{
  id v4 = -[BSDescriptionStyle _init]([BSMutableDescriptionStyle alloc]);
  (*((void (**)(id, id))a3 + 2))(a3, v4);
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)_initWithCopyOf:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v3 = (id *)-[BSDescriptionStyle _init](a1);
  id v4 = v3;
  if (v3)
  {
    v3[1] = *(id *)(a2 + 8);
    v3[2] = *(id *)(a2 + 16);
    v3[3] = *(id *)(a2 + 24);
    v3[4] = *(id *)(a2 + 32);
    v3[5] = *(id *)(a2 + 40);
    v3[10] = *(id *)(a2 + 80);
    v3[6] = *(id *)(a2 + 48);
    v3[7] = *(id *)(a2 + 56);
    v3[8] = *(id *)(a2 + 64);
    v3[9] = *(id *)(a2 + 72);
    v3[12] = *(id *)(a2 + 96);
    v3[11] = *(id *)(a2 + 88);
    objc_storeStrong(v3 + 13, *(id *)(a2 + 104));
  }
  return v4;
}

- (id)_init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        id v4 = [NSString stringWithFormat:@"BSDescriptionStyle cannot be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v6);
          *(_DWORD *)buf = 138544642;
          id v10 = v5;
          __int16 v11 = 2114;
          v12 = v7;
          __int16 v13 = 2048;
          v14 = v1;
          __int16 v15 = 2114;
          id v16 = @"BSDescriptionStyle.m";
          __int16 v17 = 1024;
          int v18 = 362;
          __int16 v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v4 UTF8String];
        __break(0);
        JUMPOUT(0x18AAEA6ACLL);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BSDescriptionStyle;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

+ (id)debugStyle
{
  if (qword_1EB21B310 != -1) {
    dispatch_once(&qword_1EB21B310, &__block_literal_global_58);
  }
  uint64_t v2 = (void *)qword_1EB21B308;
  return v2;
}

void __51__BSDescriptionStyle_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromBSDescriptionVerbosity(*(void *)(*(void *)(a1 + 40) + 8));
  [v2 appendString:v3 withName:@"verbosity"];

  id v4 = *(void **)(a1 + 32);
  id v5 = NSStringFromBSDescriptionDebugging(*(void *)(*(void *)(a1 + 40) + 16));
  [v4 appendString:v5 withName:@"debugging"];

  v6 = *(void **)(a1 + 32);
  v7 = NSStringFromBSDescriptionCollectionLineBreak(*(void *)(*(void *)(a1 + 40) + 24));
  [v6 appendString:v7 withName:@"collectionLineBreak"];

  objc_super v8 = *(void **)(a1 + 32);
  v9 = NSStringFromBSDescriptionItemSeparator(*(void *)(*(void *)(a1 + 40) + 32));
  [v8 appendString:v9 withName:@"proemItemSeparator"];

  id v10 = *(void **)(a1 + 32);
  __int16 v11 = NSStringFromBSDescriptionItemSeparator(*(void *)(*(void *)(a1 + 40) + 40));
  [v10 appendString:v11 withName:@"bodyItemSeparator"];

  v12 = *(void **)(a1 + 32);
  __int16 v13 = NSStringFromBSDescriptionLineTruncation(*(void *)(*(void *)(a1 + 40) + 48));
  [v12 appendString:v13 withName:@"nameTruncationStyle"];

  uint64_t v14 = *(void *)(a1 + 40);
  if (*(uint64_t *)(v14 + 56) >= 1)
  {
    id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    uint64_t v14 = *(void *)(a1 + 40);
  }
  id v16 = *(void **)(a1 + 32);
  __int16 v17 = NSStringFromBSDescriptionLineTruncation(*(void *)(v14 + 64));
  [v16 appendString:v17 withName:@"objectTruncationStyle"];

  uint64_t v18 = *(void *)(a1 + 40);
  if (*(uint64_t *)(v18 + 72) >= 1)
  {
    id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    uint64_t v18 = *(void *)(a1 + 40);
  }
  v20 = *(void **)(a1 + 32);
  uint64_t v21 = NSStringFromBSDescriptionCollectionTruncationStyle(*(void *)(v18 + 80));
  [v20 appendString:v21 withName:@"collectionTruncationStyle"];

  uint64_t v22 = *(void *)(a1 + 40);
  if (*(uint64_t *)(v22 + 96) >= 1)
  {
    id v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:");
    uint64_t v22 = *(void *)(a1 + 40);
  }
  v24 = *(void **)(a1 + 32);
  v25 = NSStringFromBSDescriptionKeyValuePairSorting(*(void *)(v22 + 88));
  [v24 appendString:v25 withName:@"keyValuePairSorting"];

  uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 104);
  if (v26) {
    id v27 = (id)[*(id *)(a1 + 32) appendObject:v26 withName:@"clientInformation"];
  }
}

- (BSDescriptionStyle)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BSDescriptionStyle"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[BSDescriptionStyle init]"];
    int v5 = 138544130;
    v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BSDescriptionStyle.m";
    __int16 v9 = 1024;
    int v10 = 351;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  result = (BSDescriptionStyle *)[v2 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

+ (id)keyValuePairSortedByKeyStyle
{
  if (qword_1EB21B330 != -1) {
    dispatch_once(&qword_1EB21B330, &__block_literal_global_62);
  }
  uint64_t v2 = (void *)qword_1EB21B328;
  return v2;
}

+ (id)succinctStyle
{
  if (qword_1EB21B320 != -1) {
    dispatch_once(&qword_1EB21B320, &__block_literal_global_60_0);
  }
  uint64_t v2 = (void *)qword_1EB21B318;
  return v2;
}

void __35__BSDescriptionStyle_succinctStyle__block_invoke()
{
  id v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1EB21B318;
  qword_1EB21B318 = (uint64_t)v0;

  *(void *)(qword_1EB21B318 + 8) = 2;
}

void __50__BSDescriptionStyle_keyValuePairSortedByKeyStyle__block_invoke()
{
  id v0 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v1 = (void *)qword_1EB21B328;
  qword_1EB21B328 = (uint64_t)v0;

  *(void *)(qword_1EB21B328 + 88) = 2;
}

+ (id)styleForEndTruncatingCollectionsOverItemCount:(int64_t)a3
{
  id v4 = -[BSDescriptionStyle _init]([BSDescriptionStyle alloc]);
  v4[10] = 2;
  v4[12] = a3;
  return v4;
}

- (id)styleByOverlayingStyle:(id)a3
{
  return -[BSDescriptionStyle _styleByOverlayingStyle:](&self->super.isa, (uint64_t)a3);
}

+ (BSDescriptionStyle)new
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"cannot directly allocate BSDescriptionStyle"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = [NSString stringWithUTF8String:"+[BSDescriptionStyle new]"];
    int v5 = 138544130;
    v6 = v3;
    __int16 v7 = 2114;
    objc_super v8 = @"BSDescriptionStyle.m";
    __int16 v9 = 1024;
    int v10 = 356;
    __int16 v11 = 2114;
    v12 = v2;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v5, 0x26u);
  }
  result = (BSDescriptionStyle *)[v2 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [NSNumber numberWithInteger:self->_verbosity];
  uint64_t v4 = [v3 hash];

  int v5 = [NSNumber numberWithInteger:self->_debugging];
  uint64_t v6 = [v5 hash];

  __int16 v7 = [NSNumber numberWithInteger:self->_collectionLineBreak];
  uint64_t v8 = [v7 hash];

  __int16 v9 = [NSNumber numberWithInteger:self->_proemItemSeparator];
  uint64_t v10 = [v9 hash];

  __int16 v11 = [NSNumber numberWithInteger:self->_bodyItemSeparator];
  uint64_t v12 = [v11 hash];

  uint64_t v13 = [NSNumber numberWithInteger:self->_collectionTruncationStyle];
  uint64_t v14 = [v13 hash];

  id v15 = [NSNumber numberWithInteger:self->_nameTruncation];
  uint64_t v33 = [v15 hash];
  uint64_t v34 = v14;

  id v16 = [NSNumber numberWithInteger:self->_maximumNameLengthBeforeTruncation];
  uint64_t v32 = [v16 hash];
  uint64_t v31 = v12;
  uint64_t v17 = v8;

  uint64_t v18 = [NSNumber numberWithInteger:self->_valueTruncation];
  uint64_t v19 = [v18 hash];
  uint64_t v20 = v6;
  uint64_t v21 = v4;

  uint64_t v22 = [NSNumber numberWithInteger:self->_maximumValueLengthBeforeTruncation];
  uint64_t v23 = [v22 hash];

  v24 = [NSNumber numberWithInteger:self->_maximumItemCountForTruncation];
  uint64_t v25 = [v24 hash];

  uint64_t v26 = [NSNumber numberWithInteger:self->_keyValuePairSorting];
  unint64_t v27 = v20 ^ v21 ^ v17 ^ v10 ^ v31 ^ v34 ^ v33 ^ v32 ^ v19 ^ v23 ^ v25 ^ [v26 hash];

  clientInformation = self->_clientInformation;
  if (clientInformation) {
    v27 ^= [(NSSet *)clientInformation hash];
  }
  unint64_t v29 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v27 ^ (v27 >> 30))) >> 27));
  return v29 ^ (v29 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = (CFSetRef *)a3;
  uint64_t v6 = v5;
  if (v5[1] == (CFSetRef)self->_verbosity
    && v5[2] == (CFSetRef)self->_debugging
    && v5[3] == (CFSetRef)self->_collectionLineBreak
    && v5[4] == (CFSetRef)self->_proemItemSeparator
    && v5[5] == (CFSetRef)self->_bodyItemSeparator
    && v5[10] == (CFSetRef)self->_collectionTruncationStyle
    && v5[12] == (CFSetRef)self->_maximumItemCountForTruncation
    && v5[11] == (CFSetRef)self->_keyValuePairSorting)
  {
    char v7 = BSEqualSets(v5[13], (const __CFSet *)self->_clientInformation);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [BSMutableDescriptionStyle alloc];
  return -[BSDescriptionStyle _initWithCopyOf:](v4, (uint64_t)self);
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__BSDescriptionStyle_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E54456B8;
  v3[4] = a3;
  v3[5] = self;
  [a3 appendProem:0 block:v3];
}

- (int64_t)verbosity
{
  return self->_verbosity;
}

- (int64_t)debugging
{
  return self->_debugging;
}

- (int64_t)collectionLineBreak
{
  return self->_collectionLineBreak;
}

- (int64_t)proemItemSeparator
{
  return self->_proemItemSeparator;
}

- (int64_t)bodyItemSeparator
{
  return self->_bodyItemSeparator;
}

- (int64_t)keyValuePairSorting
{
  return self->_keyValuePairSorting;
}

- (int64_t)nameTruncation
{
  return self->_nameTruncation;
}

- (int64_t)maximumNameLengthBeforeTruncation
{
  return self->_maximumNameLengthBeforeTruncation;
}

- (int64_t)valueTruncation
{
  return self->_valueTruncation;
}

- (int64_t)maximumValueLengthBeforeTruncation
{
  return self->_maximumValueLengthBeforeTruncation;
}

- (int64_t)collectionTruncationStyle
{
  return self->_collectionTruncationStyle;
}

- (int64_t)maximumItemCountForTruncation
{
  return self->_maximumItemCountForTruncation;
}

@end