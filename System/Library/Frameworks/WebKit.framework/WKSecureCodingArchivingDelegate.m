@interface WKSecureCodingArchivingDelegate
- (BOOL)rewriteMutableArray;
- (BOOL)rewriteMutableData;
- (BOOL)rewriteMutableDictionary;
- (BOOL)rewriteMutableString;
- (BOOL)transformURLs;
- (WKSecureCodingArchivingDelegate)init;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (void)setRewriteMutableArray:(BOOL)a3;
- (void)setRewriteMutableData:(BOOL)a3;
- (void)setRewriteMutableDictionary:(BOOL)a3;
- (void)setRewriteMutableString:(BOOL)a3;
- (void)setTransformURLs:(BOOL)a3;
@end

@implementation WKSecureCodingArchivingDelegate

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a4 && (isKindOfClass & 1) != 0 && self->transformURLs)
  {
    v7 = [[WKSecureCodingURLWrapper alloc] initWithURL:a4];
  }
  else
  {
    if (self->rewriteMutableArray)
    {
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();
      if (a4)
      {
        if (v8) {
          goto LABEL_17;
        }
      }
    }
    if (self->rewriteMutableData && (objc_opt_class(), char v9 = objc_opt_isKindOfClass(), a4) && (v9 & 1) != 0
      || self->rewriteMutableDictionary && (objc_opt_class(), char v10 = objc_opt_isKindOfClass(), a4) && (v10 & 1) != 0
      || self->rewriteMutableString && (objc_opt_class(), char v11 = objc_opt_isKindOfClass(), a4) && (v11 & 1) != 0)
    {
LABEL_17:
      v7 = (WKSecureCodingURLWrapper *)[a4 copy];
    }
    else
    {
      CFTypeID v14 = CFGetTypeID(a4);
      if (v14 != CGColorGetTypeID()) {
        return a4;
      }
      v7 = [[WKSecureCodingCGColorWrapper alloc] initWithCGColor:a4];
    }
  }
  v12 = (void *)CFMakeCollectable(v7);

  return v12;
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  objc_opt_class();
  if (!((a4 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v5 = (void *)[a4 wrappedURL];
    v6 = v5;
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  if (!((a4 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v5 = (void *)[a4 wrappedColor];
    v6 = v5;
    if (v5) {
LABEL_6:
    }
      CFRetain(v5);
LABEL_7:
    CFRelease(a4);
    return v6;
  }
  return a4;
}

- (WKSecureCodingArchivingDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)WKSecureCodingArchivingDelegate;
  result = [(WKSecureCodingArchivingDelegate *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->rewriteMutableArray = 0;
    result->transformURLs = 1;
  }
  return result;
}

- (BOOL)rewriteMutableArray
{
  return self->rewriteMutableArray;
}

- (void)setRewriteMutableArray:(BOOL)a3
{
  self->rewriteMutableArray = a3;
}

- (BOOL)rewriteMutableData
{
  return self->rewriteMutableData;
}

- (void)setRewriteMutableData:(BOOL)a3
{
  self->rewriteMutableData = a3;
}

- (BOOL)rewriteMutableDictionary
{
  return self->rewriteMutableDictionary;
}

- (void)setRewriteMutableDictionary:(BOOL)a3
{
  self->rewriteMutableDictionary = a3;
}

- (BOOL)rewriteMutableString
{
  return self->rewriteMutableString;
}

- (void)setRewriteMutableString:(BOOL)a3
{
  self->rewriteMutableString = a3;
}

- (BOOL)transformURLs
{
  return self->transformURLs;
}

- (void)setTransformURLs:(BOOL)a3
{
  self->transformURLs = a3;
}

@end