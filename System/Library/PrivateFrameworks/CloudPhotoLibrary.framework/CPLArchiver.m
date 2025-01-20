@interface CPLArchiver
+ (id)_displayableArrayForArray:(id)a3;
+ (id)_displayableObjectForObject:(id)a3;
+ (id)archivedDataWithRootObject:(id)a3;
+ (id)archivedDataWithRootObject:(id)a3 usingBlock:(id)a4;
+ (id)archivedPropertyListWithRootObject:(id)a3;
+ (id)archivedPropertyListWithRootObject:(id)a3 usingBlock:(id)a4;
+ (id)displayableDictionaryForDictionary:(id)a3;
+ (id)displayablePropertyListWithRootObject:(id)a3;
+ (id)fullDescriptionForObject:(id)a3;
+ (id)unarchiveObjectWithData:(id)a3 ofClass:(Class)a4;
+ (id)unarchivedObjectWithPropertyList:(id)a3 ofClass:(Class)a4;
+ (void)_initializeSmallKeyMapping;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (BOOL)forDisplay;
- (CGPoint)decodePointForKey:(id)a3;
- (CGRect)decodeRectForKey:(id)a3;
- (CGSize)decodeSizeForKey:(id)a3;
- (CPLArchiver)initWithArchive:(id)a3 rootClass:(Class)a4;
- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4;
- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4 block:(id)a5;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)_decodeKey:(id)a3 class:(Class)a4 inDictionary:(id)a5;
- (id)_encodeKey:(id)a3;
- (id)archiveCursor;
- (id)archivedPropertyList;
- (id)decodeObject;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4;
- (id)decodePropertyList;
- (id)decodePropertyListForKey:(id)a3;
- (id)rootObject;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5;
- (void)decodeBytesWithReturnedLength:(unint64_t *)a3;
- (void)decodeValuesOfObjCTypes:(const char *)a3;
- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBycopyObject:(id)a3;
- (void)encodeByrefObject:(id)a3;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeConditionalObject:(id)a3;
- (void)encodeConditionalObject:(id)a3 forKey:(id)a4;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeObject:(id)a3;
- (void)encodeObject:(id)a3 forKey:(id)a4;
- (void)encodePoint:(CGPoint)a3 forKey:(id)a4;
- (void)encodePropertyList:(id)a3;
- (void)encodeRect:(CGRect)a3 forKey:(id)a4;
- (void)encodeRootObject:(id)a3;
- (void)encodeSize:(CGSize)a3 forKey:(id)a4;
- (void)encodeValuesOfObjCTypes:(const char *)a3;
- (void)setArchiveCursor:(id)a3;
@end

@implementation CPLArchiver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootObject, 0);
  objc_storeStrong(&self->_archiveCursor, 0);
  objc_storeStrong(&self->_archive, 0);
}

- (void)setArchiveCursor:(id)a3
{
}

- (id)archiveCursor
{
  return self->_archiveCursor;
}

- (BOOL)forDisplay
{
  return self->_forDisplay;
}

- (CGRect)decodeRectForKey:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1748);
  }
  v6 = [(id)_keyToSmallKeyMapping objectForKey:v5];
  id archiveCursor = self->_archiveCursor;
  if (v6)
  {
    v8 = [archiveCursor objectForKeyedSubscript:v6];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [self->_archiveCursor objectForKeyedSubscript:v5];
    }
    v11 = v10;
  }
  else
  {
    v11 = [archiveCursor objectForKeyedSubscript:v5];
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        v29 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = NSStringFromSelector(a2);
          v31 = objc_opt_class();
          id v32 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v38 = v30;
          __int16 v39 = 2112;
          v40 = v31;
          __int16 v41 = 2112;
          id v42 = v32;
          id v33 = v31;
          _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);
        }
      }
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
      v36 = NSStringFromSelector(a2);
      [v34 handleFailureInMethod:a2, self, v35, 957, @"Unexpected dictionary for %@. Found %@: '%@'", v36, objc_opt_class(), self->_archiveCursor object file lineNumber description];

      abort();
    }
    id v12 = v11;
    v13 = [v12 objectForKeyedSubscript:@"x"];
    [v13 doubleValue];
    double v15 = v14;

    v16 = [v12 objectForKeyedSubscript:@"y"];
    [v16 doubleValue];
    double v18 = v17;

    v19 = [v12 objectForKeyedSubscript:@"w"];
    [v19 doubleValue];
    double v21 = v20;

    v22 = [v12 objectForKeyedSubscript:@"h"];

    [v22 doubleValue];
    double v24 = v23;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F28AD8];
    double v18 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }

  double v25 = v15;
  double v26 = v18;
  double v27 = v21;
  double v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

uint64_t __32__CPLArchiver_decodeRectForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (CGSize)decodeSizeForKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1746);
  }
  v6 = [(id)_keyToSmallKeyMapping objectForKey:v5];
  id archiveCursor = self->_archiveCursor;
  if (v6)
  {
    v8 = [archiveCursor objectForKeyedSubscript:v6];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [self->_archiveCursor objectForKeyedSubscript:v5];
    }
    v11 = v10;
  }
  else
  {
    v11 = [archiveCursor objectForKeyedSubscript:v5];
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        double v21 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = NSStringFromSelector(a2);
          double v23 = objc_opt_class();
          id v24 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v30 = v22;
          __int16 v31 = 2112;
          id v32 = v23;
          __int16 v33 = 2112;
          id v34 = v24;
          id v25 = v23;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);
        }
      }
      double v26 = [MEMORY[0x1E4F28B00] currentHandler];
      double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
      double v28 = NSStringFromSelector(a2);
      [v26 handleFailureInMethod:a2, self, v27, 947, @"Unexpected dictionary for %@. Found %@: '%@'", v28, objc_opt_class(), self->_archiveCursor object file lineNumber description];

      abort();
    }
    id v12 = v11;
    v13 = [v12 objectForKeyedSubscript:@"w"];
    [v13 doubleValue];
    double v15 = v14;

    v16 = [v12 objectForKeyedSubscript:@"h"];

    [v16 doubleValue];
    double v18 = v17;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F28AE0];
    double v18 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
  }

  double v19 = v15;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

uint64_t __32__CPLArchiver_decodeSizeForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (CGPoint)decodePointForKey:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1741);
  }
  v6 = [(id)_keyToSmallKeyMapping objectForKey:v5];
  id archiveCursor = self->_archiveCursor;
  if (v6)
  {
    v8 = [archiveCursor objectForKeyedSubscript:v6];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [self->_archiveCursor objectForKeyedSubscript:v5];
    }
    v11 = v10;
  }
  else
  {
    v11 = [archiveCursor objectForKeyedSubscript:v5];
  }

  if (self->_archiveCursor)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        double v21 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = NSStringFromSelector(a2);
          double v23 = objc_opt_class();
          id v24 = self->_archiveCursor;
          *(_DWORD *)buf = 138412802;
          v30 = v22;
          __int16 v31 = 2112;
          id v32 = v23;
          __int16 v33 = 2112;
          id v34 = v24;
          id v25 = v23;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Unexpected dictionary for %@. Found %@: '%@'", buf, 0x20u);
        }
      }
      double v26 = [MEMORY[0x1E4F28B00] currentHandler];
      double v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
      double v28 = NSStringFromSelector(a2);
      [v26 handleFailureInMethod:a2, self, v27, 937, @"Unexpected dictionary for %@. Found %@: '%@'", v28, objc_opt_class(), self->_archiveCursor object file lineNumber description];

      abort();
    }
    id v12 = v11;
    v13 = [v12 objectForKeyedSubscript:@"x"];
    [v13 doubleValue];
    double v15 = v14;

    v16 = [v12 objectForKeyedSubscript:@"y"];

    [v16 doubleValue];
    double v18 = v17;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F28AD0];
    double v18 = *(double *)(MEMORY[0x1E4F28AD0] + 8);
  }

  double v19 = v15;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

uint64_t __33__CPLArchiver_decodePointForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeRect:(CGRect)a3 forKey:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = v9;
  if (self->_forDisplay)
  {
    id v11 = v9;
LABEL_10:
    id archiveCursor = self->_archiveCursor;
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    v16 = NSStringFromRect(v25);
    [archiveCursor setObject:v16 forKey:v10];

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1739);
  }
  uint64_t v12 = [(id)_keyToSmallKeyMapping objectForKey:v10];
  v13 = (void *)v12;
  if (v12) {
    double v14 = (void *)v12;
  }
  else {
    double v14 = v10;
  }
  id v11 = v14;

  if (self->_forDisplay)
  {
    id v10 = v11;
    goto LABEL_10;
  }
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  if (!NSIsEmptyRect(v26))
  {
    id v17 = self->_archiveCursor;
    v23[0] = @"x";
    double v18 = [NSNumber numberWithDouble:x];
    v24[0] = v18;
    v23[1] = @"y";
    double v19 = [NSNumber numberWithDouble:y];
    v24[1] = v19;
    v23[2] = @"w";
    double v20 = [NSNumber numberWithDouble:width];
    v24[2] = v20;
    v23[3] = @"h";
    double v21 = [NSNumber numberWithDouble:height];
    v24[3] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
    [v17 setObject:v22 forKey:v11];
  }
LABEL_11:
}

uint64_t __33__CPLArchiver_encodeRect_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeSize:(CGSize)a3 forKey:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (self->_forDisplay)
  {
    id v9 = v7;
LABEL_10:
    id archiveCursor = self->_archiveCursor;
    v21.double width = width;
    v21.double height = height;
    double v14 = NSStringFromSize(v21);
    [archiveCursor setObject:v14 forKey:v8];

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1731);
  }
  uint64_t v10 = [(id)_keyToSmallKeyMapping objectForKey:v8];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = v8;
  }
  id v9 = v12;

  if (self->_forDisplay)
  {
    v8 = v9;
    goto LABEL_10;
  }
  v22.double width = width;
  v22.double height = height;
  if (!NSEqualSizes(v22, *MEMORY[0x1E4F28AE0]))
  {
    id v15 = self->_archiveCursor;
    v19[0] = @"w";
    v16 = [NSNumber numberWithDouble:width];
    v19[1] = @"h";
    v20[0] = v16;
    id v17 = [NSNumber numberWithDouble:height];
    v20[1] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v15 setObject:v18 forKey:v9];
  }
LABEL_11:
}

uint64_t __33__CPLArchiver_encodeSize_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodePoint:(CGPoint)a3 forKey:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (self->_forDisplay)
  {
    id v9 = v7;
LABEL_10:
    id archiveCursor = self->_archiveCursor;
    v21.double x = x;
    v21.double y = y;
    double v14 = NSStringFromPoint(v21);
    [archiveCursor setObject:v14 forKey:v8];

    goto LABEL_11;
  }
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1723);
  }
  uint64_t v10 = [(id)_keyToSmallKeyMapping objectForKey:v8];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  else {
    uint64_t v12 = v8;
  }
  id v9 = v12;

  if (self->_forDisplay)
  {
    v8 = v9;
    goto LABEL_10;
  }
  v22.double x = x;
  v22.double y = y;
  if (!NSEqualPoints(v22, *MEMORY[0x1E4F28AD0]))
  {
    id v15 = self->_archiveCursor;
    v19[0] = @"x";
    v16 = [NSNumber numberWithDouble:x];
    v19[1] = @"y";
    v20[0] = v16;
    id v17 = [NSNumber numberWithDouble:y];
    v20[1] = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v15 setObject:v18 forKey:v9];
  }
LABEL_11:
}

uint64_t __34__CPLArchiver_encodePoint_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)decodePropertyListForKey:(id)a3
{
  id v5 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1721);
  }
  v6 = [(id)_keyToSmallKeyMapping objectForKey:v5];
  id archiveCursor = self->_archiveCursor;
  if (v6)
  {
    v8 = [archiveCursor objectForKeyedSubscript:v6];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      [self->_archiveCursor objectForKeyedSubscript:v5];
      objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [archiveCursor objectForKeyedSubscript:v5];
    objc_claimAutoreleasedReturnValue();
  }

  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v13 = objc_opt_class();
  double v14 = NSStringFromSelector(a2);
  [v11 handleFailureInMethod:a2, self, v12, 898, @"%@ does not support %@", v13, v14 object file lineNumber description];

  abort();
}

uint64_t __40__CPLArchiver_decodePropertyListForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1713_5461);
  }
  id v9 = [(id)_keyToSmallKeyMapping objectForKey:v8];
  p_id archiveCursor = &self->_archiveCursor;
  id archiveCursor = self->_archiveCursor;
  if (v9)
  {
    uint64_t v12 = [archiveCursor objectForKeyedSubscript:v9];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [*p_archiveCursor objectForKeyedSubscript:v8];
    }
    id v15 = v14;
  }
  else
  {
    id v15 = [archiveCursor objectForKeyedSubscript:v8];
  }

  if ([v7 count] == 1)
  {
    v16 = [v7 anyObject];
    id v17 = [(CPLArchiver *)self decodeObjectOfClass:v16 forKey:v8];
  }
  else
  {
    id v18 = v15;
    if (v18)
    {
      if (([v7 containsObject:objc_opt_class()] & 1) == 0
        && ![v7 containsObject:objc_opt_class()])
      {
        v40 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
        id v42 = NSStringFromSelector(a2);
        [v40 handleFailureInMethod:a2, self, v41, 887, @"%@ is not supported for %@", v7, v42 object file lineNumber description];

        abort();
      }
      id v19 = v18;
      objc_opt_class();
      v47 = v19;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          v36 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v59 = (id)objc_opt_class();
            __int16 v60 = 2112;
            id v61 = v19;
            id v37 = v59;
            _os_log_impl(&dword_1B4CAC000, v36, OS_LOG_TYPE_ERROR, "Unexpected array. Found %@: '%@'", buf, 0x16u);
          }
        }
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
        [v38 handleFailureInMethod:a2, self, v39, 866, @"Unexpected array. Found %@: '%@'", objc_opt_class(), v19 object file lineNumber description];

        abort();
      }
      id v44 = v18;
      v45 = v15;
      id v43 = *p_archiveCursor;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v46 = v7;
      id v20 = v7;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v53;
LABEL_17:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(v20);
          }
          NSRect v25 = *(objc_class **)(*((void *)&v52 + 1) + 8 * v24);
          if (v25 != (objc_class *)objc_opt_class()) {
            break;
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
            if (v22) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }
      }
      else
      {
LABEL_23:
        NSRect v25 = 0;
      }

      NSRect v26 = v47;
      id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
      if (v25)
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v27 = v47;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v49 != v30) {
                objc_enumerationMutation(v27);
              }
              objc_storeStrong(&self->_archiveCursor, *(id *)(*((void *)&v48 + 1) + 8 * i));
              id v32 = (void *)[[v25 alloc] initWithCPLArchiver:self];
              [v17 addObject:v32];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v29);
        }
        id v33 = *p_archiveCursor;
        *p_id archiveCursor = 0;

        NSRect v26 = v47;
      }
      id v34 = *p_archiveCursor;
      *p_id archiveCursor = v43;

      id v15 = v45;
      id v7 = v46;
      id v18 = v44;
    }
    else
    {
      id v17 = 0;
    }
  }
  return v17;
}

uint64_t __44__CPLArchiver_decodeObjectOfClasses_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1711);
  }
  id v7 = [(id)_keyToSmallKeyMapping objectForKey:v6];
  p_id archiveCursor = &self->_archiveCursor;
  id archiveCursor = self->_archiveCursor;
  if (v7)
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v7];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [*p_archiveCursor objectForKeyedSubscript:v6];
    }
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = [archiveCursor objectForKeyedSubscript:v6];
  }

  id v14 = v13;
  if (v14)
  {
    id v15 = *p_archiveCursor;
    objc_storeStrong(&self->_archiveCursor, v13);
    v16 = (void *)[[a3 alloc] initWithCPLArchiver:self];
    id v17 = *p_archiveCursor;
    *p_id archiveCursor = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __42__CPLArchiver_decodeObjectOfClass_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1709);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  int64_t v11 = [v10 integerValue];
  return v11;
}

uint64_t __35__CPLArchiver_decodeIntegerForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_forDisplay)
  {
    id v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1707);
      id v7 = v13;
    }
    id v8 = [(id)_keyToSmallKeyMapping objectForKey:v7];
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = v13;
    }
    id v10 = v9;

    id v7 = v10;
  }
  if (a3)
  {
    id archiveCursor = self->_archiveCursor;
    id v14 = v7;
    id v12 = [NSNumber numberWithInteger:a3];
    [archiveCursor setObject:v12 forKey:v14];
  }
  MEMORY[0x1F4181870]();
}

uint64_t __36__CPLArchiver_encodeInteger_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v6 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1705);
  }
  id v7 = [(id)_keyToSmallKeyMapping objectForKey:v6];
  id archiveCursor = self->_archiveCursor;
  if (v7)
  {
    id v9 = [archiveCursor objectForKeyedSubscript:v7];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      [self->_archiveCursor objectForKeyedSubscript:v6];
      objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [archiveCursor objectForKeyedSubscript:v6];
    objc_claimAutoreleasedReturnValue();
  }

  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v14 = objc_opt_class();
  id v15 = NSStringFromSelector(a2);
  [v12 handleFailureInMethod:a2, self, v13, 824, @"%@ does not support %@", v14, v15 object file lineNumber description];

  abort();
}

uint64_t __48__CPLArchiver_decodeBytesForKey_returnedLength___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (double)decodeDoubleForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1703);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  [v10 doubleValue];
  double v12 = v11;

  return v12;
}

uint64_t __34__CPLArchiver_decodeDoubleForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (float)decodeFloatForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1701);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  [v10 floatValue];
  float v12 = v11;

  return v12;
}

uint64_t __33__CPLArchiver_decodeFloatForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1699);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  int64_t v11 = [v10 longLongValue];
  return v11;
}

uint64_t __33__CPLArchiver_decodeInt64ForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (int)decodeInt32ForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1697);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  int v11 = [v10 intValue];
  return v11;
}

uint64_t __33__CPLArchiver_decodeInt32ForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (int)decodeIntForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1695);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  int v11 = [v10 intValue];
  return v11;
}

uint64_t __31__CPLArchiver_decodeIntForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (BOOL)decodeBoolForKey:(id)a3
{
  id v4 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1693);
  }
  id v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
  id archiveCursor = self->_archiveCursor;
  if (v5)
  {
    id v7 = [archiveCursor objectForKeyedSubscript:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [self->_archiveCursor objectForKeyedSubscript:v4];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [archiveCursor objectForKeyedSubscript:v4];
  }

  char v11 = [v10 BOOLValue];
  return v11;
}

uint64_t __32__CPLArchiver_decodeBoolForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)decodeObjectForKey:(id)a3
{
  id v5 = a3;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1691);
  }
  id v6 = [(id)_keyToSmallKeyMapping objectForKey:v5];
  id archiveCursor = self->_archiveCursor;
  if (v6)
  {
    id v8 = [archiveCursor objectForKeyedSubscript:v6];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      [self->_archiveCursor objectForKeyedSubscript:v5];
      objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    [archiveCursor objectForKeyedSubscript:v5];
    objc_claimAutoreleasedReturnValue();
  }

  char v11 = [MEMORY[0x1E4F28B00] currentHandler];
  float v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = NSStringFromSelector(a2);
  [v11 handleFailureInMethod:a2, self, v12, 788, @"%@ does not support %@", v13, v14 object file lineNumber description];

  abort();
}

uint64_t __34__CPLArchiver_decodeObjectForKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (BOOL)containsValueForKey:(id)a3
{
  v3 = [self->_archiveCursor objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v7 = a5;
  if (!self->_forDisplay)
  {
    id v8 = v7;
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1689);
    }
    uint64_t v9 = [(id)_keyToSmallKeyMapping objectForKey:v8];
    id v10 = (void *)v9;
    if (v9) {
      char v11 = (void *)v9;
    }
    else {
      char v11 = v8;
    }
    id v12 = v11;
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  [v13 handleFailureInMethod:a2, self, v14, 779, @"%@ does not support %@", v15, v16 object file lineNumber description];

  abort();
}

uint64_t __41__CPLArchiver_encodeBytes_length_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_forDisplay)
  {
    id v13 = v6;
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1687);
    }
    id v8 = objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:");
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v13;
    }
    id v10 = v9;

    id v7 = v10;
  }
  if (a3 != 0.0)
  {
    id archiveCursor = self->_archiveCursor;
    id v14 = v7;
    id v12 = [NSNumber numberWithDouble:a3];
    [archiveCursor setObject:v12 forKey:v14];
  }
  MEMORY[0x1F4181820]();
}

uint64_t __35__CPLArchiver_encodeDouble_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (!self->_forDisplay)
  {
    id v14 = v6;
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1685);
    }
    uint64_t v9 = objc_msgSend((id)_keyToSmallKeyMapping, "objectForKey:");
    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = v14;
    }
    id v11 = v10;

    id v8 = v11;
  }
  if (a3 != 0.0)
  {
    id archiveCursor = self->_archiveCursor;
    *(float *)&double v7 = a3;
    id v15 = v8;
    id v13 = [NSNumber numberWithFloat:v7];
    [archiveCursor setObject:v13 forKey:v15];
  }
  MEMORY[0x1F4181820]();
}

uint64_t __34__CPLArchiver_encodeFloat_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (!self->_forDisplay)
  {
    id v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1683);
      id v7 = v13;
    }
    id v8 = [(id)_keyToSmallKeyMapping objectForKey:v7];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v13;
    }
    id v10 = v9;

    id v7 = v10;
  }
  if (a3)
  {
    id archiveCursor = self->_archiveCursor;
    id v14 = v7;
    id v12 = [NSNumber numberWithLongLong:a3];
    [archiveCursor setObject:v12 forKey:v14];
  }
  MEMORY[0x1F4181870]();
}

uint64_t __34__CPLArchiver_encodeInt64_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (!self->_forDisplay)
  {
    id v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1681);
      id v7 = v13;
    }
    id v8 = [(id)_keyToSmallKeyMapping objectForKey:v7];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v13;
    }
    id v10 = v9;

    id v7 = v10;
  }
  if (v4)
  {
    id archiveCursor = self->_archiveCursor;
    id v14 = v7;
    id v12 = [NSNumber numberWithInt:v4];
    [archiveCursor setObject:v12 forKey:v14];
  }
  MEMORY[0x1F4181870]();
}

uint64_t __34__CPLArchiver_encodeInt32_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (!self->_forDisplay)
  {
    id v13 = v6;
    if (_smallKeyOnce != -1)
    {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1679);
      id v7 = v13;
    }
    id v8 = [(id)_keyToSmallKeyMapping objectForKey:v7];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v13;
    }
    id v10 = v9;

    id v7 = v10;
  }
  if (v4)
  {
    id archiveCursor = self->_archiveCursor;
    id v14 = v7;
    id v12 = [NSNumber numberWithInt:v4];
    [archiveCursor setObject:v12 forKey:v14];
  }
  MEMORY[0x1F4181870]();
}

uint64_t __32__CPLArchiver_encodeInt_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_forDisplay)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v14 = v6;
  if (_smallKeyOnce != -1)
  {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1676);
    id v7 = v14;
  }
  id v10 = [(id)_keyToSmallKeyMapping objectForKey:v7];
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = v14;
  }
  id v12 = v11;

  id v7 = v12;
  if (v4)
  {
LABEL_3:
    id archiveCursor = self->_archiveCursor;
    id v13 = v7;
    uint64_t v9 = [NSNumber numberWithBool:1];
    [archiveCursor setObject:v9 forKey:v13];
  }
LABEL_4:
  MEMORY[0x1F4181870]();
}

uint64_t __33__CPLArchiver_encodeBool_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_forDisplay)
  {
    uint64_t v9 = v8;
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1674);
    }
    uint64_t v10 = [(id)_keyToSmallKeyMapping objectForKey:v9];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v9;
    }
    id v13 = v12;
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(a2);
  [v14 handleFailureInMethod:a2, self, v15, 732, @"%@ does not support %@", v16, v17 object file lineNumber description];

  abort();
}

uint64_t __46__CPLArchiver_encodeConditionalObject_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (!self->_forDisplay)
  {
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_1672);
    }
    uint64_t v7 = [(id)_keyToSmallKeyMapping objectForKey:v6];
    id v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    else {
      uint64_t v9 = v6;
    }
    id v10 = v9;

    id v6 = v10;
  }
  id v11 = [v13 replacementObjectForCoder:self];
  id v12 = [v11 plistArchiveWithCPLArchiver:self];

  if (v12) {
    [self->_archiveCursor setObject:v12 forKey:v6];
  }
}

uint64_t __35__CPLArchiver_encodeObject_forKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)decodePropertyList
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 714, @"%@ does not support %@", v6, v7 object file lineNumber description];

  abort();
}

- (void)encodePropertyList:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 710, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, v6, 705, @"%@ does not support %@", v7, v8 object file lineNumber description];

  abort();
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v9 = objc_opt_class();
  id v10 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 701, @"%@ does not support %@", v9, v10 object file lineNumber description];

  abort();
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, v6, 697, @"%@ does not support %@", v7, v8 object file lineNumber description];

  abort();
}

- (id)decodeObject
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 692, @"%@ does not support %@", v6, v7 object file lineNumber description];

  abort();
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 687, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)encodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(const void *)a5
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v9 = objc_opt_class();
  id v10 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 683, @"%@ does not support %@", v9, v10 object file lineNumber description];

  abort();
}

- (void)encodeValuesOfObjCTypes:(const char *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, v6, 679, @"%@ does not support %@", v7, v8 object file lineNumber description];

  abort();
}

- (void)encodeConditionalObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 675, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)encodeByrefObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 671, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)encodeBycopyObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 667, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)encodeRootObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 663, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (void)encodeObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, v7, 659, @"%@ does not support %@", v8, v9 object file lineNumber description];

  abort();
}

- (CPLArchiver)initWithArchive:(id)a3 rootClass:(Class)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"c"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v18 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v8;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "Invalid stored class name '%@'", buf, 0xCu);
      }
    }
    goto LABEL_19;
  }
  uint64_t v9 = (objc_class *)[(objc_class *)a4 classForStoredClassName:v8 forCPLArchiver:self];
  if (!v9)
  {
    if (!_CPLSilentLogging)
    {
      id v19 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v8;
        __int16 v25 = 2112;
        Class v26 = a4;
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Can't find a proper class from '%@' according to %@", buf, 0x16u);
      }
    }
    goto LABEL_19;
  }
  id v10 = v9;
  if (([(objc_class *)v9 isSubclassOfClass:a4] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v20 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        Class v26 = a4;
        _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Invalid class for archive: %@. Expected subclass of %@", buf, 0x16u);
      }
    }
LABEL_19:
    id v17 = 0;
    goto LABEL_20;
  }
  v22.receiver = self;
  v22.super_class = (Class)CPLArchiver;
  id v11 = [(CPLArchiver *)&v22 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_archive, a3);
    uint64_t v13 = [v7 objectForKey:@"p"];
    id archiveCursor = v12->_archiveCursor;
    v12->_id archiveCursor = (id)v13;

    uint64_t v15 = [[v10 alloc] initWithCPLArchiver:v12];
    id rootObject = v12->_rootObject;
    v12->_id rootObject = (id)v15;
  }
  self = v12;
  id v17 = self;
LABEL_20:

  return v17;
}

- (id)rootObject
{
  return self->_rootObject;
}

- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4 block:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, CPLArchiver *))a5;
  v21.receiver = self;
  v21.super_class = (Class)CPLArchiver;
  id v11 = [(CPLArchiver *)&v21 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_rootObject, a3);
    v12->_forDispladouble y = a4;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id archiveCursor = v12->_archiveCursor;
    v12->_id archiveCursor = v13;
    id v15 = v13;

    v10[2](v10, v12);
    id v16 = v12->_archiveCursor;
    v12->_id archiveCursor = 0;

    v22[0] = @"c";
    id v17 = [v12->_rootObject storedClassNameForCPLArchiver:v12];
    v22[1] = @"p";
    v23[0] = v17;
    v23[1] = v15;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id archive = v12->_archive;
    v12->_id archive = (id)v18;
  }
  return v12;
}

- (CPLArchiver)initWithRootObject:(id)a3 forDisplay:(BOOL)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPLArchiver;
  uint64_t v8 = [(CPLArchiver *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    p_id rootObject = &v8->_rootObject;
    objc_storeStrong(&v8->_rootObject, a3);
    v9->_forDispladouble y = a4;
    id v11 = [*p_rootObject plistArchiveWithCPLArchiver:v9];
    if (v11)
    {
      v17[0] = @"c";
      id v12 = [*p_rootObject storedClassNameForCPLArchiver:v9];
      v17[1] = @"p";
      v18[0] = v12;
      v18[1] = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      id archive = v9->_archive;
      v9->_id archive = (id)v13;
    }
  }

  return v9;
}

- (id)archivedPropertyList
{
  return self->_archive;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)_decodeKey:(id)a3 class:(Class)a4 inDictionary:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, &__block_literal_global_1645);
  }
  uint64_t v8 = [(id)_keyToSmallKeyMapping objectForKey:v6];
  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:v8];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 objectForKeyedSubscript:v6];
    }
    id v12 = v11;
  }
  else
  {
    id v12 = [v7 objectForKeyedSubscript:v6];
  }

  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

uint64_t __45__CPLArchiver__decodeKey_class_inDictionary___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

- (id)_encodeKey:(id)a3
{
  id v4 = a3;
  if (!self->_forDisplay)
  {
    if (_smallKeyOnce != -1) {
      dispatch_once(&_smallKeyOnce, &__block_literal_global_5470);
    }
    uint64_t v5 = [(id)_keyToSmallKeyMapping objectForKey:v4];
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v4;
    }
    id v8 = v7;

    id v4 = v8;
  }
  return v4;
}

uint64_t __26__CPLArchiver__encodeKey___block_invoke()
{
  return +[CPLArchiver _initializeSmallKeyMapping];
}

+ (id)displayableDictionaryForDictionary:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_smallKeyOnce != -1) {
    dispatch_once(&_smallKeyOnce, block);
  }
  if (displayableDictionaryForDictionary__onceToken != -1) {
    dispatch_once(&displayableDictionaryForDictionary__onceToken, &__block_literal_global_1658);
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5473;
  objc_super v16 = __Block_byref_object_dispose__5474;
  id v17 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_1661;
  v8[3] = &unk_1E60A7518;
  id v10 = &v12;
  id v11 = a1;
  id v5 = v4;
  id v9 = v5;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSmallKeyMapping];
}

void __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_1661(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v18 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(id)displayableDictionaryForDictionary__smallKeyToDisplayableKey objectForKeyedSubscript:v18];
    if (v8) {
      id v9 = v8;
    }
    else {
      id v9 = v18;
    }
    id v10 = v9;

    id v11 = [*(id *)(a1 + 48) _displayableObjectForObject:v7];
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v12 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    *a4 = 1;
  }
}

void __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v1 = objc_msgSend(v0, "initWithCapacity:", objc_msgSend((id)_keyToSmallKeyMapping, "count"));
  v2 = (void *)_keyToSmallKeyMapping;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_3;
  v6[3] = &unk_1E60A74F0;
  id v3 = v1;
  id v7 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (void *)displayableDictionaryForDictionary__smallKeyToDisplayableKey;
  displayableDictionaryForDictionary__smallKeyToDisplayableKedouble y = (uint64_t)v3;
  id v5 = v3;
}

uint64_t __50__CPLArchiver_displayableDictionaryForDictionary___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_displayableObjectForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 displayableDictionaryForDictionary:v4];
LABEL_5:
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v4;
    }
    id v8 = v7;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 _displayableArrayForArray:v4];
    goto LABEL_5;
  }
  id v8 = v4;
LABEL_10:

  return v8;
}

+ (id)_displayableArrayForArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "_displayableObjectForObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)unarchiveObjectWithData:(id)a3 ofClass:(Class)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v16 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v16];
    id v8 = v16;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v12 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            long long v13 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v18 = v13;
            id v14 = v13;
            _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Incorrect serialized record is a %@", buf, 0xCu);
          }
        }
        long long v15 = (void *)[[NSString alloc] initWithFormat:@"incorrect serialized record is a %@", objc_opt_class()];
        _CPLStoreFailure(v15);
      }
      uint64_t v9 = [a1 unarchivedObjectWithPropertyList:v7 ofClass:a4];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v10 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Can't unarchive %@", buf, 0xCu);
        }
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)fullDescriptionForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithRootObject:v4 forDisplay:1];

  id v6 = [v5 archivedPropertyList];
  uint64_t v7 = [v6 objectForKey:@"p"];
  id v8 = [v7 description];

  return v8;
}

+ (id)displayablePropertyListWithRootObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithRootObject:v4 forDisplay:1];

  id v6 = [v5 archivedPropertyList];

  return v6;
}

+ (id)unarchivedObjectWithPropertyList:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithArchive:v6 rootClass:a4];

  id v8 = [v7 rootObject];

  return v8;
}

+ (id)archivedDataWithRootObject:(id)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 archivedPropertyListWithRootObject:v6 usingBlock:a4];
  if (v7)
  {
    id v13 = 0;
    id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v13];
    id v9 = v13;
    if (v8) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = _CPLSilentLogging == 0;
    }
    if (v10)
    {
      id v11 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Can't encode %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)archivedPropertyListWithRootObject:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRootObject:v7 forDisplay:0 block:v6];

  id v9 = [v8 archivedPropertyList];

  return v9;
}

+ (id)archivedPropertyListWithRootObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithRootObject:v4 forDisplay:0];

  id v6 = [v5 archivedPropertyList];

  return v6;
}

+ (id)archivedDataWithRootObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 archivedPropertyListWithRootObject:v4];
  if (v5)
  {
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v11];
    id v7 = v11;
    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    if (v8)
    {
      id v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Can't encode %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)_initializeSmallKeyMapping
{
  v2 = (void *)_keyToSmallKeyMapping;
  _keyToSmallKeyMapping = (uint64_t)&unk_1F0D916C0;
}

@end