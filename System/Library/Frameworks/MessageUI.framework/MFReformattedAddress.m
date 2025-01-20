@interface MFReformattedAddress
- (MFReformattedAddress)initWithAddress:(id)a3;
- (NSString)domainPart;
- (NSString)localPart;
- (_NSRange)middleTruncationRange;
- (double)widthWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5;
- (id)attributedStringWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5;
- (id)description;
- (void)setMiddleTruncationRange:(_NSRange)a3;
@end

@implementation MFReformattedAddress

- (MFReformattedAddress)initWithAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFReformattedAddress;
  v5 = [(MFReformattedAddress *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    -[MFReformattedAddress setMiddleTruncationRange:](v5, "setMiddleTruncationRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  address = self->_address;
  uint64_t v7 = [(MFReformattedAddress *)self middleTruncationRange];
  objc_super v9 = -[NSString mf_substringTruncatedInRange:](address, "mf_substringTruncatedInRange:", v7, v8);
  v10 = [v3 stringWithFormat:@"<%@: %p: %@ (%@)>", v5, self, address, v9];

  return v10;
}

- (NSString)localPart
{
  v2 = [(NSString *)self->_address componentsSeparatedByString:@"@"];
  v3 = [v2 objectAtIndex:0];

  return (NSString *)v3;
}

- (NSString)domainPart
{
  v2 = [(NSString *)self->_address componentsSeparatedByString:@"@"];
  v3 = [v2 objectAtIndex:0];

  return (NSString *)v3;
}

- (double)widthWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5
{
  v5 = [(MFReformattedAddress *)self attributedStringWithFontSize:a5 maximumWidth:a3 options:a4];
  [v5 size];
  double v7 = v6;

  return v7;
}

- (id)attributedStringWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v44[1] = *MEMORY[0x1E4F143B8];
  objc_super v9 = self->_address;
  uint64_t v10 = [(MFReformattedAddress *)self middleTruncationRange];
  v12 = -[NSString mf_substringTruncatedInRange:](v9, "mf_substringTruncatedInRange:", v10, v11);

  id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v43 = *MEMORY[0x1E4FB06F8];
  v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a3];
  v44[0] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  v16 = (void *)[v13 initWithString:v12 attributes:v15];

  [v16 size];
  BOOL v18 = v17 > a4;
  if ((v5 & 1) == 0 && v17 > a4)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke;
    v40[3] = &unk_1E5F79218;
    id v19 = v16;
    id v41 = v19;
    double v42 = a4;
    unint64_t v20 = MFFirstIndexInRangePassingTest(0, 9uLL, v40);
    v21 = (void *)MEMORY[0x1E4FB0710];
    BOOL v18 = v20 == 0x7FFFFFFFFFFFFFFFLL;
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v19, "mf_removeAttribute:", *MEMORY[0x1E4FB0710]);
    }
    else
    {
      double v22 = (double)v20 * -0.100000001;
      *(float *)&double v22 = v22;
      v23 = [NSNumber numberWithFloat:v22];
      objc_msgSend(v19, "mf_addAttribute:value:", *v21, v23);
    }
  }
  if ((v5 & 2) == 0 && v18)
  {
    v24 = [v16 string];
    v25 = (void *)[v24 copy];

    uint64_t v26 = [v25 length] - 1;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke_2;
    v36 = &unk_1E5F79128;
    id v27 = v25;
    id v37 = v27;
    id v28 = v16;
    id v38 = v28;
    double v39 = a4;
    uint64_t v29 = MFLastIndexPassingTest(v26, &v33);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v28, "mf_setString:", v27, v33, v34, v35, v36, v37);
    }
    else
    {
      v30 = objc_msgSend(v27, "mf_substringTruncatedToIndex:", v29, v33, v34, v35, v36, v37);
      objc_msgSend(v28, "mf_setString:", v30);
    }
  }
  if ((MFAddressHasSafeDomain(self->_address) & 1) == 0)
  {
    v31 = [MEMORY[0x1E4FB1618] systemRedColor];
    objc_msgSend(v16, "mf_addAttribute:value:", *MEMORY[0x1E4FB0700], v31);
  }

  return v16;
}

BOOL __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke(uint64_t a1, unint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4FB0710];
  double v5 = (double)a2 * -0.100000001;
  *(float *)&double v5 = v5;
  double v6 = [NSNumber numberWithFloat:v5];
  objc_msgSend(v3, "mf_addAttribute:value:", v4, v6);

  [*(id *)(a1 + 32) size];
  return v7 <= *(double *)(a1 + 40);
}

BOOL __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 32), "mf_substringTruncatedToIndex:", a2);
  objc_msgSend(*(id *)(a1 + 40), "mf_setString:", v3);
  [*(id *)(a1 + 40) size];
  BOOL v5 = v4 <= *(double *)(a1 + 48);

  return v5;
}

- (_NSRange)middleTruncationRange
{
  NSUInteger length = self->_middleTruncationRange.length;
  NSUInteger location = self->_middleTruncationRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMiddleTruncationRange:(_NSRange)a3
{
  self->_middleTruncationRange = a3;
}

- (void).cxx_destruct
{
}

@end