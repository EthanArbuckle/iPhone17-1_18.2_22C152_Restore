@interface CUFileQuery
- (CUFileQuery)initWithDictionary:(id)a3 error:(id *)a4;
- (NSString)path;
- (id)completionHandler;
- (id)description;
- (void)encodeWithDictionary:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation CUFileQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)description
{
  return NSPrintF((uint64_t)"CUFileQuery", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)encodeWithDictionary:(id)a3
{
  path = self->_path;
  if (path) {
    [a3 setObject:path forKeyedSubscript:@"path"];
  }
}

- (CUFileQuery)initWithDictionary:(id)a3 error:(id *)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  v12 = [(CUFileQuery *)self init];
  if (v12)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    v14 = CFDictionaryGetTypedValue(v6, @"path", TypeID, 0);
    if (v14) {
      objc_storeStrong((id *)&v12->_path, v14);
    }

    v15 = v12;
  }
  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end