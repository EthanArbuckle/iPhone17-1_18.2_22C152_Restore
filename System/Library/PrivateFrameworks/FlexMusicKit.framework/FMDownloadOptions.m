@interface FMDownloadOptions
- (BOOL)allowsCellular;
- (FMDownloadOptions)init;
- (id)description;
- (unint64_t)downloadPriority;
- (void)_configureDefaults;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setDownloadPriority:(unint64_t)a3;
@end

@implementation FMDownloadOptions

- (FMDownloadOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)FMDownloadOptions;
  v2 = [(FMDownloadOptions *)&v9 init];
  v7 = v2;
  if (v2) {
    objc_msgSend__configureDefaults(v2, v3, v4, v5, v6);
  }
  return v7;
}

- (void)_configureDefaults
{
  objc_msgSend_setAllowsCellular_(self, a2, 1, v2, v3);
  objc_msgSend_setDownloadPriority_(self, v5, 0, v6, v7);
}

- (id)description
{
  uint64_t v6 = NSString;
  if (objc_msgSend_downloadPriority(self, a2, v2, v3, v4)) {
    v11 = @"Background";
  }
  else {
    v11 = @"User Initiated";
  }
  if (objc_msgSend_allowsCellular(self, v7, v8, v9, v10)) {
    return (id)objc_msgSend_stringWithFormat_(v6, v12, @"[%@] [cellular %@]", v13, v14, v11, @"allowed");
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(v6, v12, @"[%@] [cellular %@]", v13, v14, v11, @"not allowed");
  }
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (unint64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(unint64_t)a3
{
  self->_downloadPriority = a3;
}

@end