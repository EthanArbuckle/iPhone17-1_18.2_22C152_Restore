@interface NSCoder(BCSNSCoderExtras)
- (id)_bcs_strictlyDecodeObjectOfClass:()BCSNSCoderExtras forKey:;
@end

@implementation NSCoder(BCSNSCoderExtras)

- (id)_bcs_strictlyDecodeObjectOfClass:()BCSNSCoderExtras forKey:
{
  v1 = objc_msgSend(a1, "decodeObjectOfClass:forKey:");
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end