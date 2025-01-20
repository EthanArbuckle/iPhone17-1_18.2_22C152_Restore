@interface NSData(VNPersonsModelAdditions)
- (id)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescription:error:;
- (void)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescriptionProvidingBlock:error:;
@end

@implementation NSData(VNPersonsModelAdditions)

- (id)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescription:error:
{
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__NSData_VNPersonsModelAdditions__VNPersonsModelSubdataWithRange_rangeDescription_error___block_invoke;
  v14[3] = &unk_1E5B20040;
  id v15 = v10;
  id v11 = v10;
  v12 = objc_msgSend(a1, "VNPersonsModelSubdataWithRange:rangeDescriptionProvidingBlock:error:", a3, a4, v14, a6);

  return v12;
}

- (void)VNPersonsModelSubdataWithRange:()VNPersonsModelAdditions rangeDescriptionProvidingBlock:error:
{
  id v10 = a5;
  unint64_t v11 = [a1 length];
  if (a3 >= v11 || a4 > v11 || a3 + a4 > v11)
  {
    if (a6)
    {
      v12 = v10[2](v10);
      v13 = (void *)[[NSString alloc] initWithFormat:@"%@ is corrupt", v12];
      VNPersonsModelErrorForInvalidModelData(v13);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }
  else
  {
    a6 = objc_msgSend(a1, "subdataWithRange:", a3, a4);
  }

  return a6;
}

@end