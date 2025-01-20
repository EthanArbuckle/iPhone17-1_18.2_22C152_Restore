@interface DDMLResult
+ (BOOL)shouldKeepResultOfType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DDMLResult)initWithText:(id)a3 resultRange:(_NSRange)a4 confidence:(double)a5 resultType:(int)a6;
- (NSString)matchedString;
- (_NSRange)range;
- (__DDResult)ddResultFromQuery:(__DDScanQuery *)a3;
- (double)confidence;
- (id)description;
- (int)classification;
- (void)setClassification:(int)a3;
- (void)setConfidence:(double)a3;
- (void)setMatchedString:(id)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation DDMLResult

- (void).cxx_destruct
{
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setClassification:(int)a3
{
  self->_classification = a3;
}

- (int)classification
{
  return self->_classification;
}

- (void)setMatchedString:(id)a3
{
}

- (NSString)matchedString
{
  return self->_matchedString;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (__DDResult)ddResultFromQuery:(__DDScanQuery *)a3
{
  if ([(DDMLResult *)self classification])
  {
    if ([(DDMLResult *)self classification] == 1)
    {
      uint64_t v5 = [(DDMLResult *)self range];
      uint64_t v7 = v6;
      var1 = a3->var1;
      int64_t var3 = a3->var3;
      unint64_t OffsetOfAbsolutePosition = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)var1, var3, v5);
      unint64_t v11 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)var1, var3, v5 + v7);
      v12 = (__DDResult *)DDResultCreate(@"Location", OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000, v11 & 0xFFFFFFFFFFFF0000);
      if (v12)
      {
        v13 = v12;
        v14 = [(DDMLResult *)self matchedString];
        DDResultSetMatchedString((uint64_t)v13, v14);

        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v15 = [(DDMLResult *)self range];
    int64_t v17 = v16;
    v18 = a3->var1;
    int64_t v19 = a3->var3;
    unint64_t v20 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)v18, v19, v15);
    unint64_t v21 = DDScanQueryGetOffsetOfAbsolutePosition((uint64_t)v18, v19, v15 + v17);
    unint64_t v22 = v20 & 0xFFFFFFFFFFFF0000;
    unint64_t v23 = v21 & 0xFFFFFFFFFFFF0000;
    v24 = (__DDResult *)DDResultCreate(@"FullAddress", v22, v21 & 0xFFFFFFFFFFFF0000);
    if (v24)
    {
      v13 = v24;
      v25 = [(DDMLResult *)self matchedString];
      DDResultSetMatchedString((uint64_t)v13, v25);

      v13->var2.var0 = v15;
      v13->var2.var1 = v17;
      v26 = DDResultCreate(@"Street", v22, v23);
      if (!v26)
      {
        v29 = 0;
        goto LABEL_11;
      }
      v27 = v26;
      v28 = [(DDMLResult *)self matchedString];
      DDResultSetMatchedString((uint64_t)v27, v28);

      DDResultAddSubresult((uint64_t)v13, v27);
      CFRelease(v27);
LABEL_8:
      v29 = v13;
LABEL_11:
      CFAutorelease(v13);
      return v29;
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 range];
    uint64_t v7 = v6;
    [(DDMLResult *)self range];
    if (v7 != v8) {
      goto LABEL_8;
    }
    uint64_t v9 = [v5 range];
    if (v9 != [(DDMLResult *)self range]) {
      goto LABEL_8;
    }
    v10 = [v5 matchedString];
    unint64_t v11 = [(DDMLResult *)self matchedString];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_8;
    }
    int v13 = [v5 classification];
    if (v13 == [(DDMLResult *)self classification])
    {
      [v5 confidence];
      double v15 = v14;
      [(DDMLResult *)self confidence];
      BOOL v17 = v15 == v16;
    }
    else
    {
LABEL_8:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(DDMLResult *)self range];
  [(DDMLResult *)self range];
  uint64_t v6 = v5;
  unsigned int v7 = [(DDMLResult *)self classification];
  if (v7 > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_1E5984E70[v7];
  }
  uint64_t v9 = [(DDMLResult *)self matchedString];
  v10 = [v3 stringWithFormat:@"<DDMLResult:%p (%ld, %ld) %@ \"%@\">", self, v4, v6, v8, v9];

  return v10;
}

- (DDMLResult)initWithText:(id)a3 resultRange:(_NSRange)a4 confidence:(double)a5 resultType:(int)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DDMLResult;
  int v12 = [(DDMLResult *)&v17 init];
  int v13 = v12;
  if (v12)
  {
    v12->_classification = a6;
    v12->_range.NSUInteger location = location;
    v12->_range.NSUInteger length = length;
    v12->_confidence = a5;
    uint64_t v14 = objc_msgSend(v11, "substringWithRange:", location, length);
    matchedString = v13->_matchedString;
    v13->_matchedString = (NSString *)v14;
  }
  return v13;
}

+ (BOOL)shouldKeepResultOfType:(id)a3
{
  return [a3 hasSuffix:@"MLCandidate"] ^ 1;
}

@end