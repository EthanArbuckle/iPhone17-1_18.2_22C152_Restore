@interface CKSQLiteContainerAttributedTableGroup
+ (id)attributionNameForSpecialContainerType:(int64_t)a3;
+ (unint64_t)tableGroupOptionsForContainerType:(int64_t)a3;
+ (void)attributionFunctionForAttributionName:(id)a3;
+ (void)attributionFunctionForSpecialContainerType:(int64_t)a3;
- (CKSQLiteContainerAttributedTableGroup)init;
- (id)finishInitializing;
- (id)performInTransaction:(id)a3;
- (id)performTransaction:(id)a3;
@end

@implementation CKSQLiteContainerAttributedTableGroup

+ (id)attributionNameForSpecialContainerType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x24) {
    return @"ATTRIBUTION_FUNCTION_NAME(None)";
  }
  else {
    return (id)*((void *)&off_1E54634D8 + a3);
  }
}

+ (void)attributionFunctionForAttributionName:(id)a3
{
  id v3 = a3;
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  v8 = dlsym((void *)0xFFFFFFFFFFFFFFFDLL, v7);
  if (!v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_18B09F72C;
    block[3] = &unk_1E5460350;
    id v11 = v3;
    if (qword_1E912FDE8 != -1) {
      dispatch_once(&qword_1E912FDE8, block);
    }

    v8 = CKSQLiteContainerAttribution_None;
  }

  return v8;
}

+ (void)attributionFunctionForSpecialContainerType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x23) {
    return CKSQLiteContainerAttribution_None;
  }
  else {
    return off_1ED7F5558[a3 - 1];
  }
}

+ (unint64_t)tableGroupOptionsForContainerType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x10000)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)a1, @"CKSQLiteContainerAttributedTableGroup.m", 91, @"container type value out of range");
  }
  return a3;
}

- (CKSQLiteContainerAttributedTableGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteContainerAttributedTableGroup;
  v2 = [(CKSQLiteTableGroup *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_attributionFunc = CKSQLiteContainerAttribution_None;
    v2->_sup.receiver = v2;
    v2->_sup.super_class = (Class)objc_opt_class();
  }
  return v3;
}

- (id)finishInitializing
{
  v22.receiver = self;
  v22.super_class = (Class)CKSQLiteContainerAttributedTableGroup;
  id v6 = [(CKSQLiteTableGroup *)&v22 finishInitializing];
  if (!v6)
  {
    if (self)
    {
      uint64_t v8 = (unsigned __int16)objc_msgSend_options(self, v3, v4, v5);
      if (objc_msgSend_isNew(self, v9, v10, v11))
      {
        if (v8)
        {
          v14 = objc_msgSend_attributionNameForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v12, v8, v13);
          objc_msgSend_setStringValue_forKey_(self, v15, (uint64_t)v14, @"ContainerAttribution");
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          self->_attributionFunc = objc_msgSend_attributionFunctionForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v16, v8, v17);
        }
        else
        {
          id v6 = 0;
        }
        goto LABEL_2;
      }
      if (v8)
      {
        id v6 = 0;
        self->_attributionFunc = objc_msgSend_attributionFunctionForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v12, v8, v13);
        goto LABEL_2;
      }
    }
    else
    {
      id v6 = 0;
      if (objc_msgSend_isNew(0, v3, v4, v5)) {
        goto LABEL_2;
      }
    }
    id v21 = 0;
    v18 = objc_msgSend_stringValueForKey_error_(self, v12, @"ContainerAttribution", (uint64_t)&v21);
    id v6 = v21;
    if (v18)
    {
      self->_attributionFunc = objc_msgSend_attributionFunctionForAttributionName_(CKSQLiteContainerAttributedTableGroup, v19, (uint64_t)v18, v20);
    }
  }
LABEL_2:

  return v6;
}

- (id)performTransaction:(id)a3
{
  return (id)((uint64_t (*)(objc_super *, SEL, id))self->_attributionFunc)(&self->_sup, a2, a3);
}

- (id)performInTransaction:(id)a3
{
  return (id)((uint64_t (*)(objc_super *, SEL, id))self->_attributionFunc)(&self->_sup, a2, a3);
}

@end