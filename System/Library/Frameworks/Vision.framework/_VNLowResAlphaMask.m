@interface _VNLowResAlphaMask
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSingleMask;
- (_VNLowResAlphaMask)initWithAlphaMaskArray:(id)a3;
- (_VNLowResAlphaMask)initWithCoder:(id)a3;
- (_VNLowResAlphaMask)initWithSingleAlphaMask:(__CVBuffer *)a3;
- (__CVBuffer)_alphaMaskAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _VNLowResAlphaMask

- (void).cxx_destruct
{
}

- (BOOL)isSingleMask
{
  return self->_isSingleMask;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_isSingleMask)
  {
    v4 = [(NSArray *)self->_instanceLowResMaskArray objectAtIndexedSubscript:0];

    v5 = [_VNLowResAlphaMask alloc];
    return [(_VNLowResAlphaMask *)v5 initWithSingleAlphaMask:v4];
  }
  else
  {
    v7 = [_VNLowResAlphaMask alloc];
    instanceLowResMaskArray = self->_instanceLowResMaskArray;
    return [(_VNLowResAlphaMask *)v7 initWithAlphaMaskArray:instanceLowResMaskArray];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_VNLowResAlphaMask *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_isSingleMask == v5->_isSingleMask
        && (NSUInteger v6 = [(NSArray *)self->_instanceLowResMaskArray count],
            v6 == [(NSArray *)v5->_instanceLowResMaskArray count]))
      {
        if (v6)
        {
          BOOL v7 = 0;
          for (i = 0; i != v6; BOOL v7 = i >= v6)
          {
            v9 = [(NSArray *)self->_instanceLowResMaskArray objectAtIndexedSubscript:i];

            v10 = [(NSArray *)v5->_instanceLowResMaskArray objectAtIndexedSubscript:i];

            if (!+[VNCVPixelBufferConversionHelpers isCVPixelBuffer:v9 equalToCVPixelBuffer:v10])break; {
            ++i;
            }
          }
        }
        else
        {
          BOOL v7 = 1;
        }
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)_VNLowResAlphaMask;
  id v3 = [(_VNLowResAlphaMask *)&v11 hash];
  uint64_t v4 = 43690;
  if (!self->_isSingleMask) {
    uint64_t v4 = 21845;
  }
  unint64_t v5 = v4 ^ __ROR8__(v3, 51);
  NSUInteger v6 = [(NSArray *)self->_instanceLowResMaskArray count];
  if (v6)
  {
    NSUInteger v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = [(NSArray *)self->_instanceLowResMaskArray objectAtIndexedSubscript:i];

      unint64_t v5 = +[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:v9] ^ __ROR8__(v5, 51);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self) {
    NSUInteger v4 = [(NSArray *)self->_instanceLowResMaskArray count];
  }
  else {
    NSUInteger v4 = 0;
  }
  [v8 encodeBool:self->_isSingleMask forKey:@"isSingleMask"];
  [v8 encodeInt64:v4 forKey:@"ILRMASize"];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      NSUInteger v6 = objc_msgSend(@"ILRMAE", "stringByAppendingFormat:", @"%d", i);
      NSUInteger v7 = [(NSArray *)self->_instanceLowResMaskArray objectAtIndexedSubscript:i];

      objc_msgSend(v8, "vn_encodePixelBuffer:forKey:", v7, v6);
    }
  }
}

- (_VNLowResAlphaMask)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_VNLowResAlphaMask;
  unint64_t v5 = [(_VNLowResAlphaMask *)&v15 init];
  if (!v5) {
    goto LABEL_7;
  }
  v5->_isSingleMask = [v4 decodeBoolForKey:@"isSingleMask"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"ILRMASize"];
  NSUInteger v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  if (!v6)
  {
LABEL_6:
    uint64_t v11 = [v7 copy];
    instanceLowResMaskArray = v5->_instanceLowResMaskArray;
    v5->_instanceLowResMaskArray = (NSArray *)v11;

LABEL_7:
    v13 = v5;
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  while (1)
  {
    v9 = objc_msgSend(@"ILRMAE", "stringByAppendingFormat:", @"%d", v8);
    v10 = objc_msgSend(v4, "vn_decodePixelBufferForKey:", v9);
    if (!v10) {
      break;
    }
    [v7 addObject:v10];

    if (v6 == ++v8) {
      goto LABEL_6;
    }
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (__CVBuffer)_alphaMaskAtIndex:(unint64_t)a3
{
  instanceLowResMaskArray = self->_instanceLowResMaskArray;
  if (instanceLowResMaskArray && [(NSArray *)instanceLowResMaskArray count] > a3)
  {
    uint64_t v6 = [(NSArray *)self->_instanceLowResMaskArray objectAtIndexedSubscript:a3];
  }
  else
  {
    +[VNError VNAssert:0 log:@"Internal object should not be nil"];
    return 0;
  }
  return (__CVBuffer *)v6;
}

- (_VNLowResAlphaMask)initWithAlphaMaskArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNLowResAlphaMask;
  unint64_t v5 = [(_VNLowResAlphaMask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    instanceLowResMaskArray = v5->_instanceLowResMaskArray;
    v5->_instanceLowResMaskArray = (NSArray *)v6;

    v5->_isSingleMask = 0;
  }

  return v5;
}

- (_VNLowResAlphaMask)initWithSingleAlphaMask:(__CVBuffer *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_VNLowResAlphaMask;
  id v4 = [(_VNLowResAlphaMask *)&v8 init];
  if (v4)
  {
    v9[0] = a3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    instanceLowResMaskArray = v4->_instanceLowResMaskArray;
    v4->_instanceLowResMaskArray = (NSArray *)v5;

    v4->_isSingleMask = 1;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end