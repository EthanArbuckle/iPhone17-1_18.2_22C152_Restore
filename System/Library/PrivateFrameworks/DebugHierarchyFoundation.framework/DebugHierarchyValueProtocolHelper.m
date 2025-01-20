@interface DebugHierarchyValueProtocolHelper
+ (BOOL)objectImplementsRequiredDebugHierarchyValueMethods:(id)a3;
+ (id)debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4 onObject:(id)a5;
@end

@implementation DebugHierarchyValueProtocolHelper

+ (BOOL)objectImplementsRequiredDebugHierarchyValueMethods:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector();
  }

  return v4 & 1;
}

+ (id)debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4 onObject:(id)a5
{
  id v7 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    v8 = (id *)&v19;
    v9 = (id *)&v18;
    uint64_t v10 = [v7 debugHierarchyValueWithOutOptions:&v19 outError:&v18];
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    v8 = (id *)&v17;
    v9 = (id *)&v16;
    uint64_t v10 = objc_msgSend(v7, "fallback_debugHierarchyValueWithOutOptions:outError:", &v17, &v16);
LABEL_5:
    v11 = (void *)v10;
    id v12 = *v8;
    id v13 = *v9;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11 = 0;
  id v13 = 0;
  id v12 = 0;
  if (a3) {
LABEL_6:
  }
    *a3 = v12;
LABEL_7:
  if (a4) {
    *a4 = v13;
  }
  id v14 = v11;

  return v14;
}

@end