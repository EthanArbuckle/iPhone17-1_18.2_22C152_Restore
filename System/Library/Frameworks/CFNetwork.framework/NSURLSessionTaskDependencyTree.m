@interface NSURLSessionTaskDependencyTree
+ (NSURLSessionTaskDependencyTree)dependencyTreeWithJSONData:(id)a3 error:(id *)a4;
+ (NSURLSessionTaskDependencyTree)dependencyTreeWithMainDocumentURL:(id)a3 dependencyDescriptions:(id)a4;
+ (id)dependencyTreeDefaultWeb;
+ (uint64_t)mimeTypeForURLString:(uint64_t)a1;
- (NSURL)mainDocumentURL;
- (void)dealloc;
- (void)setMainDocumentURL:(id)a3;
@end

@implementation NSURLSessionTaskDependencyTree

- (void)setMainDocumentURL:(id)a3
{
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)dealloc
{
  [(NSURLSessionTaskDependencyTree *)self setMainDocumentURL:0];
  if (self)
  {
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)NSURLSessionTaskDependencyTree;
  [(NSURLSessionTaskDependencyTree *)&v5 dealloc];
}

+ (NSURLSessionTaskDependencyTree)dependencyTreeWithMainDocumentURL:(id)a3 dependencyDescriptions:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(NSURLSessionTaskDependencyTree);
  [(NSURLSessionTaskDependencyTree *)v6 setMainDocumentURL:a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6) {
    objc_setProperty_nonatomic(v6, v8, v7, 16);
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v9 = [a4 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v68;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v68 != v11) {
          objc_enumerationMutation(a4);
        }
        uint64_t v13 = *(void *)(*((void *)&v67 + 1) + 8 * v12);
        if (v6)
        {
          dependencies = v6->_dependencies;
          if (v13) {
            goto LABEL_10;
          }
        }
        else
        {
          dependencies = 0;
          if (v13)
          {
LABEL_10:
            uint64_t v15 = *(void *)(v13 + 16);
            goto LABEL_11;
          }
        }
        uint64_t v15 = 0;
LABEL_11:
        if ([(NSMutableDictionary *)dependencies objectForKeyedSubscript:v15]) {
          goto LABEL_16;
        }
        if (v6)
        {
          v16 = v6->_dependencies;
          if (!v13) {
            goto LABEL_21;
          }
        }
        else
        {
          v16 = 0;
          if (!v13)
          {
LABEL_21:
            uint64_t v17 = 0;
            goto LABEL_15;
          }
        }
        uint64_t v17 = *(void *)(v13 + 16);
LABEL_15:
        [(NSMutableDictionary *)v16 setObject:v13 forKey:v17];
LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v18 = [a4 countByEnumeratingWithState:&v67 objects:v74 count:16];
      uint64_t v10 = v18;
    }
    while (v18);
  }
  if (v6) {
    v19 = v6->_dependencies;
  }
  else {
    v19 = 0;
  }
  v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[NSMutableDictionary allValues](v19, "allValues"));
  v21 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v64;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * v25);
        if (v26) {
          uint64_t v27 = *(void *)(v26 + 24);
        }
        else {
          uint64_t v27 = 0;
        }
        [v21 setObject:v26 forKey:v27];
        ++v25;
      }
      while (v23 != v25);
      uint64_t v28 = [v20 countByEnumeratingWithState:&v63 objects:v73 count:16];
      uint64_t v23 = v28;
    }
    while (v28);
  }
  v29 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v30 = [v20 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v60;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v60 != v32) {
          objc_enumerationMutation(v20);
        }
        uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8 * v33);
        if (v34) {
          uint64_t v35 = *(void *)(v34 + 24);
        }
        else {
          uint64_t v35 = 0;
        }
        v36 = (void *)[v29 objectForKeyedSubscript:v35];
        if (!v36)
        {
          v36 = (void *)[MEMORY[0x1E4F1CA48] array];
          if (v34) {
            uint64_t v37 = *(void *)(v34 + 24);
          }
          else {
            uint64_t v37 = 0;
          }
          [v29 setObject:v36 forKeyedSubscript:v37];
        }
        if (v34) {
          uint64_t v38 = *(void *)(v34 + 16);
        }
        else {
          uint64_t v38 = 0;
        }
        [v36 addObject:v38];
        ++v33;
      }
      while (v31 != v33);
      uint64_t v39 = [v20 countByEnumeratingWithState:&v59 objects:v72 count:16];
      uint64_t v31 = v39;
    }
    while (v39);
  }
  v40 = objc_alloc_init(__NSCFURLSessionTaskDependencyTreeNode);
  v41 = -[__NSURLSessionTaskDependencyResourceIdentifier initWitURLPath:mimeType:]([__NSURLSessionTaskDependencyResourceIdentifier alloc], @"/", 0);
  v42 = (void *)[v29 objectForKey:v41];
  if (v40) {
    objc_setProperty_nonatomic(v40, v43, v42, 24);
  }
  [v21 removeObjectForKey:v41];
  if (v6)
  {
    -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:]((uint64_t)v40, v6->_dependencies, v21, v29);
    objc_setProperty_nonatomic(v6, v44, v40, 24);
  }
  else
  {
    -[__NSCFURLSessionTaskDependencyTreeNode buildTree:parentsToDependencies:parentsToChildren:]((uint64_t)v40, 0, v21, v29);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v45 = objc_msgSend(v21, "allValues", 0);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v56;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v55 + 1) + 8 * v49);
        if (v6)
        {
          v51 = v6->_dependencies;
          if (v50) {
            goto LABEL_66;
          }
        }
        else
        {
          v51 = 0;
          if (v50)
          {
LABEL_66:
            uint64_t v52 = *(void *)(v50 + 16);
            goto LABEL_67;
          }
        }
        uint64_t v52 = 0;
LABEL_67:
        [(NSMutableDictionary *)v51 removeObjectForKey:v52];
        ++v49;
      }
      while (v47 != v49);
      uint64_t v53 = [v45 countByEnumeratingWithState:&v55 objects:v71 count:16];
      uint64_t v47 = v53;
    }
    while (v53);
  }
  return v6;
}

+ (NSURLSessionTaskDependencyTree)dependencyTreeWithJSONData:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)dependencyTreeDefaultWeb
{
  return 0;
}

+ (uint64_t)mimeTypeForURLString:(uint64_t)a1
{
  self;
  CFStringRef v3 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", a2), "pathExtension");
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = copyMIMETypeForExtension(v3);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  uint64_t v6 = [NSString stringWithString:v4];
  CFRelease(v5);
  return v6;
}

@end