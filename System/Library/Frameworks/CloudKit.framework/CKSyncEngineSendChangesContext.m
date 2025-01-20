@interface CKSyncEngineSendChangesContext
- (BOOL)CKDescriptionShouldPrintPointer;
- (CKSyncEngineSendChangesContext)init;
- (CKSyncEngineSendChangesContext)initWithReason:(int64_t)a3 options:(id)a4;
- (CKSyncEngineSendChangesOptions)options;
- (CKSyncEngineSyncReason)reason;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
@end

@implementation CKSyncEngineSendChangesContext

- (void).cxx_destruct
{
}

- (CKSyncEngineSendChangesContext)initWithReason:(int64_t)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKSyncEngineSendChangesContext;
  v8 = [(CKSyncEngineSendChangesContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_reason = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"SendChangesContext";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_reason(self, v5, v6, v7);
  v10 = @"Unknown";
  if (v8 == 1) {
    v10 = @"Manual";
  }
  if (v8) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"reason", (uint64_t)v10, 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"reason", @"Scheduled", 0);
  }
  objc_msgSend_options(self, v11, v12, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, @"options", (uint64_t)v15, 0);
}

- (CKSyncEngineSyncReason)reason
{
  return self->_reason;
}

- (CKSyncEngineSendChangesOptions)options
{
  return (CKSyncEngineSendChangesOptions *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineSendChangesContext *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (CKSyncEngineSendChangesContext)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"-[%@ init] is unavailable", v5);

  objc_exception_throw(v7);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineSendChangesContext *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

@end