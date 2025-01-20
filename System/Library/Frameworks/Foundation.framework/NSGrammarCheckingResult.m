@interface NSGrammarCheckingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)_adjustRangesWithOffset:(int64_t)a3;
- (NSGrammarCheckingResult)initWithCoder:(id)a3;
- (NSGrammarCheckingResult)initWithRange:(_NSRange)a3 details:(id)a4;
- (_NSRange)range;
- (id)grammarDetails;
- (id)resultByAdjustingRangesWithOffset:(int64_t)a3;
- (unint64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSGrammarCheckingResult

- (NSGrammarCheckingResult)initWithRange:(_NSRange)a3 details:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSGrammarCheckingResult;
  v7 = [(NSGrammarCheckingResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_details = (NSArray *)[a4 copy];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSGrammarCheckingResult;
  [(NSGrammarCheckingResult *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSGrammarCheckingResult *)self grammarDetails];
  if ([a3 allowsKeyedCoding])
  {
    v22 = self;
    id v23 = a3;
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v5;
    uint64_t v27 = [v5 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v27)
    {
      uint64_t v25 = *(void *)v36;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v6;
          v7 = *(void **)(*((void *)&v35 + 1) + 8 * v6);
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v29 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v31 != v11) {
                  objc_enumerationMutation(v7);
                }
                v13 = *(__CFString **)(*((void *)&v30 + 1) + 8 * i);
                int v14 = [(__CFString *)v13 isEqualToString:@"NSGrammarRange"];
                v15 = (NSNumber *)[v7 objectForKey:v13];
                v16 = v15;
                if (v14)
                {
                  uint64_t v17 = [(NSValue *)v15 rangeValue];
                  uint64_t v19 = v18;
                  objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17), @"NSGrammarRangeLocation");
                  v16 = +[NSNumber numberWithUnsignedInteger:v19];
                  v20 = v8;
                  v21 = @"NSGrammarRangeLength";
                }
                else
                {
                  v20 = v8;
                  v21 = v13;
                }
                [v20 setObject:v16 forKey:v21];
              }
              uint64_t v10 = [v7 countByEnumeratingWithState:&v30 objects:v29 count:16];
            }
            while (v10);
          }
          [v26 addObject:v8];

          uint64_t v6 = v28 + 1;
        }
        while (v28 + 1 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v34 count:16];
      }
      while (v27);
    }
    [(NSTextCheckingResult *)v22 encodeRangeWithCoder:v23];
    [v23 encodeObject:v26 forKey:@"NSModifiedGrammarDetails"];
  }
  else
  {
    [(NSTextCheckingResult *)self encodeRangeWithCoder:a3];
    [a3 encodeObject:v5];
  }
}

- (NSGrammarCheckingResult)initWithCoder:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v7;
    int v9 = [a3 containsValueForKey:@"NSModifiedGrammarDetails"];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    if (v9)
    {
      v15 = (void *)[a3 decodeObjectOfClasses:v14 forKey:@"NSModifiedGrammarDetails"];
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = v15;
      uint64_t v38 = [v15 countByEnumeratingWithState:&v46 objects:v45 count:16];
      if (!v38) {
        return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
      }
      uint64_t v34 = v8;
      uint64_t v36 = *(void *)v47;
      long long v37 = (void *)v16;
      while (1)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v47 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v17;
          uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v40 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v42 != v22) {
                  objc_enumerationMutation(v18);
                }
                v24 = *(__CFString **)(*((void *)&v41 + 1) + 8 * i);
                if ([(__CFString *)v24 isEqualToString:@"NSGrammarRangeLocation"])
                {
                  uint64_t v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"NSGrammarRangeLocation"), "unsignedIntegerValue"), objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"NSGrammarRangeLength"), "unsignedIntegerValue"));
                  id v26 = v19;
                  uint64_t v27 = @"NSGrammarRange";
                }
                else
                {
                  if ([(__CFString *)v24 isEqualToString:@"NSGrammarRangeLength"]) {
                    continue;
                  }
                  uint64_t v25 = (NSValue *)[v18 objectForKey:v24];
                  id v26 = v19;
                  uint64_t v27 = v24;
                }
                [v26 setObject:v25 forKey:v27];
              }
              uint64_t v21 = [v18 countByEnumeratingWithState:&v41 objects:v40 count:16];
            }
            while (v21);
          }
          uint64_t v16 = (uint64_t)v37;
          [v37 addObject:v19];

          uint64_t v17 = v39 + 1;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
        if (!v38)
        {
          uint64_t v8 = v34;
          return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
        }
      }
    }
    uint64_t v30 = [a3 decodeObjectOfClasses:v14 forKey:@"NSGrammarDetails"];
  }
  else
  {
    uint64_t v28 = [a3 versionForClassName:@"NSTextCheckingResult"];
    if (v28 != 1)
    {
      uint64_t v32 = v28;
      long long v33 = _NSFullMethodName((objc_class *)self, a2);
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v33, 1, v32);
      [(NSGrammarCheckingResult *)self dealloc];
      return 0;
    }
    uint64_t v6 = [(NSTextCheckingResult *)self decodeRangeWithCoder:a3];
    uint64_t v8 = v29;
    uint64_t v30 = [a3 decodeObject];
  }
  uint64_t v16 = v30;
  return -[NSGrammarCheckingResult initWithRange:details:](self, "initWithRange:details:", v6, v8, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)resultType
{
  return 4;
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)resultByAdjustingRangesWithOffset:(int64_t)a3
{
  unint64_t v6 = [(NSGrammarCheckingResult *)self range];
  NSUInteger v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && v6 < -a3)
    {
      NSUInteger v12 = v6;
      uint64_t v13 = _NSFullMethodName((objc_class *)self, a2);
      v16.NSUInteger location = v12;
      v16.NSUInteger length = v8;
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v13, a3, NSStringFromRange(v16)), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    uint64_t v9 = v6 + a3;
  }
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:details:", v9, v7, -[NSGrammarCheckingResult grammarDetails](self, "grammarDetails"));

  return v10;
}

- (BOOL)_adjustRangesWithOffset:(int64_t)a3
{
  NSUInteger location = self->_range.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 < 0 && location < -a3)
    {
      p_range = &self->_range;
      NSUInteger v7 = _NSFullMethodName((objc_class *)self, a2);
      NSUInteger v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %ld invalid offset for range %@", v7, a3, NSStringFromRange(*p_range)), 0 reason userInfo];
      objc_exception_throw(v8);
    }
    self->_range.NSUInteger location = location + a3;
  }
  return 1;
}

- (id)grammarDetails
{
  return self->_details;
}

@end