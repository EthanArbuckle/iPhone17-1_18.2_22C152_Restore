@interface NSArray
@end

@implementation NSArray

id __75__NSArray_SGStructuredEventDissector__sg_deepCopyWithoutEmptySchemaObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "sg_isEmptySchemaObject"))
  {
    v3 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v2, "sg_deepCopyWithoutEmptySchemaObjects");
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = v2;
    }
    v3 = v4;
  }

  return v3;
}

@end