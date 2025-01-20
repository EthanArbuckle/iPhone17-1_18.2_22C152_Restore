@interface CKLStatusFilter
- (BOOL)matchesEvent:(id)a3;
@end

@implementation CKLStatusFilter

- (BOOL)matchesEvent:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_type(v3, v4, v5) == 2560)
  {
    v8 = objc_msgSend_processImagePath(v3, v6, v7);
    char hasSuffix = objc_msgSend_hasSuffix_(v8, v9, @"cloudd");
  }
  else
  {
    char hasSuffix = 0;
  }

  return hasSuffix;
}

@end