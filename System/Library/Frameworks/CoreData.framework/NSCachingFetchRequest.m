@interface NSCachingFetchRequest
+ (id)_generateIdentifier;
- (BOOL)_isCachingFetchRequest;
- (NSCachingFetchRequest)init;
- (NSCachingFetchRequest)initWithCoder:(id)a3;
- (NSDictionary)substitutionVariables;
- (id)_cachedInfoForRequestor:(id)a3;
- (id)_copyForDirtyContext;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_cacheInfo:(id)a3 forRequestor:(id)a4;
- (void)_disableSQLStatementCaching;
- (void)dealloc;
- (void)setSubstitutionVariables:(id)a3;
@end

@implementation NSCachingFetchRequest

- (BOOL)_isCachingFetchRequest
{
  return self->_cachedInfo != 0;
}

- (id)_cachedInfoForRequestor:(id)a3
{
  if (self->_cachedInfo)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v6 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cachedInfo, a3);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_cacheInfo:(id)a3 forRequestor:(id)a4
{
  if (self->_cachedInfo)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    CFDictionarySetValue((CFMutableDictionaryRef)self->_cachedInfo, a4, a3);
    os_unfair_lock_unlock(p_lock);
    [(NSFetchRequest *)self _incrementInUseCounter];
  }
}

- (void)dealloc
{
  id cachedInfo = self->_cachedInfo;
  if (cachedInfo) {
    CFRelease(cachedInfo);
  }
  self->_id cachedInfo = 0;

  self->_identifier = 0;
  self->_substitutionVariables = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSCachingFetchRequest;
  [(NSFetchRequest *)&v4 dealloc];
}

- (void)_disableSQLStatementCaching
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id cachedInfo = self->_cachedInfo;
  if (cachedInfo) {
    CFRelease(cachedInfo);
  }
  self->_id cachedInfo = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSCachingFetchRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSCachingFetchRequest;
  v2 = [(NSFetchRequest *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_id cachedInfo = CFDictionaryCreateMutable(0, 5, 0, MEMORY[0x1E4F1D540]);
    v3->_identifier = (id)[(id)objc_opt_class() _generateIdentifier];
    v3->_substitutionVariables = 0;
  }
  return v3;
}

+ (id)_generateIdentifier
{
  unint64_t v2 = atomic_fetch_add(&_generateIdentifier_tracker, 1uLL) + 1;
  return (id)[NSNumber numberWithLongLong:v2];
}

- (void)setSubstitutionVariables:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables == a3) {
    return;
  }
  if (!substitutionVariables)
  {
    v7 = 0;
    goto LABEL_27;
  }
  BOOL v6 = [(NSFetchRequest *)self _isEditable];
  v7 = self->_substitutionVariables;
  if (v6)
  {
LABEL_27:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v19 = [(NSDictionary *)v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (!v19) {
      goto LABEL_35;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v7);
        }
        v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", v23), "expressionType"))
        {
          v29 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v30 = *MEMORY[0x1E4F1C3C8];
          v25 = NSString;
          v32 = v23;
LABEL_39:
          uint64_t v31 = [v25 stringWithFormat:@"Unsupported substitution variable type for key %@", v32];
          goto LABEL_40;
        }
      }
      uint64_t v20 = [(NSDictionary *)v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (!v20) {
        goto LABEL_35;
      }
    }
  }
  NSUInteger v8 = [(NSDictionary *)self->_substitutionVariables count];
  if (v8 != [a3 count])
  {
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Mismatched variables dictionaries (count)";
LABEL_41:
    objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v26 userInfo:0]);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = self->_substitutionVariables;
  uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        id v14 = [(NSDictionary *)self->_substitutionVariables valueForKey:v13];
        uint64_t v15 = [a3 valueForKey:v13];
        if (v15)
        {
          v16 = (void *)v15;
          if ([v14 expressionType])
          {
            v29 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v30 = *MEMORY[0x1E4F1C3C8];
            v25 = NSString;
            v32 = v13;
            goto LABEL_39;
          }
          v17 = (void *)[v14 constantValue];
          v18 = (void *)[v16 constantValue];
          if ((([v17 isNSArray] & 1) != 0
             || ([v17 isNSSet] & 1) != 0
             || [v17 isNSOrderedSet])
            && ([v18 isNSArray] & 1) == 0
            && ([v18 isNSSet] & 1) == 0
            && ([v18 isNSOrderedSet] & 1) == 0)
          {
            v29 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v30 = *MEMORY[0x1E4F1C3C8];
            uint64_t v31 = [NSString stringWithFormat:@"Mismatch: that which was once a collection is no longer (%@)", v13];
LABEL_40:
            v26 = (__CFString *)v31;
            v27 = v29;
            uint64_t v28 = v30;
            goto LABEL_41;
          }
        }
        else if ((![v13 isEqual:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"] {
                || ![(NSFetchRequest *)self fetchLimit])
        }
               && (![v13 isEqual:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"]
                || ![(NSFetchRequest *)self fetchOffset]))
        {
          v27 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v28 = *MEMORY[0x1E4F1C3C8];
          v26 = @"Mismatched variables dictionaries (missing value)";
          goto LABEL_41;
        }
      }
      uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }
LABEL_35:
  v24 = (NSDictionary *)[a3 copy];

  self->_substitutionVariables = v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSCachingFetchRequest;
  id v4 = [(NSFetchRequest *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSDictionary *)self->_substitutionVariables mutableCopy];

  *((void *)v4 + 14) = v5;
  os_unfair_lock_lock_with_options();
  BOOL v6 = (const void *)*((void *)v4 + 15);
  CFDictionaryRef cachedInfo = (const __CFDictionary *)self->_cachedInfo;
  if (cachedInfo)
  {
    CFIndex Count = CFDictionaryGetCount(cachedInfo);
    *((void *)v4 + 15) = CFDictionaryCreateMutableCopy(0, Count, (CFDictionaryRef)self->_cachedInfo);
    if (v6) {
      CFRelease(v6);
    }
  }
  else if (v6)
  {
    CFRelease(*((CFTypeRef *)v4 + 15));
    *((void *)v4 + 15) = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (NSDictionary)substitutionVariables
{
  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables)
  {
    v3 = (void *)[(NSDictionary *)substitutionVariables copy];
    return (NSDictionary *)v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
    return (NSDictionary *)[v5 dictionary];
  }
}

- (NSCachingFetchRequest)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NSCachingFetchRequest;
  id v4 = -[NSFetchRequest initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v9 = __39__NSCachingFetchRequest_initWithCoder___block_invoke;
    objc_super v10 = &unk_1E544B868;
    uint64_t v11 = v5;
    if (!v5 || (BOOL v6 = __39__NSCachingFetchRequest_initWithCoder___block_invoke, !v5[1]) && !v5[2])
    {
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E2730));

      id v4 = 0;
      BOOL v6 = v9;
    }
    v6((uint64_t)v8);
  }
  return v4;
}

void __39__NSCachingFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)_copyForDirtyContext
{
  v3 = (id *)[(NSCachingFetchRequest *)self copy];

  v3[16] = self->_identifier;
  id v4 = (void *)[(NSDictionary *)self->_substitutionVariables mutableCopy];
  if (![v4 objectForKey:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"])
  {
    NSUInteger v5 = [(NSFetchRequest *)self fetchLimit];
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28C68], "expressionForConstantValue:", objc_msgSend(NSNumber, "numberWithInteger:", v5)), @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
  }

  v3[14] = v4;
  [v3 _incrementInUseCounter];
  return v3;
}

- (id)_identifier
{
  return self->_identifier;
}

@end