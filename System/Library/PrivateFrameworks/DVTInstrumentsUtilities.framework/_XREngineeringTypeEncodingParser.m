@interface _XREngineeringTypeEncodingParser
+ (id)_elementNameToClassMap;
+ (id)_elementNameToKVCMap;
- (NSString)sentinel;
- (int64_t)bitWidth;
- (void)_handleCompletion;
- (void)_handleStart;
- (void)setBitWidth:(int64_t)a3;
- (void)setSentinel:(id)a3;
@end

@implementation _XREngineeringTypeEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA1E8 != -1) {
    dispatch_once(&qword_2687AA1E8, &unk_26E7527B0);
  }
  v2 = (void *)qword_2687AA1E0;

  return v2;
}

+ (id)_elementNameToKVCMap
{
  if (qword_2687AA1F8 != -1) {
    dispatch_once(&qword_2687AA1F8, &unk_26E7527D0);
  }
  v2 = (void *)qword_2687AA1F0;

  return v2;
}

- (void)_handleStart
{
  self->_bitWidth = -1;
}

- (void)_handleCompletion
{
  v26 = self->super.parent;
  v7 = [v26 v3:v4 v5:v6];
  unsigned int v12 = [v26 v8:v9 v10:v11];
  if (v12 <= 6)
  {
    if (((1 << v12) & 0x47) == 0)
    {
      uint64_t v18 = 3;
      goto LABEL_12;
    }
    sentinel = self->_sentinel;
    if (sentinel)
    {
      if ([sentinel isEqualToString:v13 max:v15 v16])
      {
        uint64_t v18 = 1;
      }
      else if ([self->_sentinel isEqualToString:@"zero" v15 v16])
      {
        uint64_t v18 = 2;
      }
      else
      {
        uint64_t v18 = 0;
      }
LABEL_12:
      if (v7)
      {
LABEL_17:
        [v7 setSentinel:v13 sentinel:v18 sentinel:v15 sentinel:v16];
        goto LABEL_18;
      }
LABEL_16:
      v7 = objc_opt_new();
      [v26 setEncodingConvention:v22 withEncoding:v23 withError:v24];
      if (!v7) {
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  if (!v7)
  {
    if (self->_bitWidth < 0) {
      goto LABEL_21;
    }
    uint64_t v18 = 0;
    goto LABEL_16;
  }
  [v7 setSentinel:v13];
LABEL_18:
  int64_t bitWidth = self->_bitWidth;
  if (bitWidth == -1) {
    int64_t bitWidth = [v26 _conventionalBitWidth:v19 -1:v20:v21];
  }
  [v7 setBitWidth:bitWidth];

LABEL_21:
  [v26 didHandleEncodingElement:v13 withEncoding:v14 withElement:v15 withError:v16];
}

- (NSString)sentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(id)a3
{
}

- (int64_t)bitWidth
{
  return self->_bitWidth;
}

- (void)setBitWidth:(int64_t)a3
{
  self->_int64_t bitWidth = a3;
}

- (void).cxx_destruct
{
}

@end