@interface NSDictionary(NullSupport)
- (id)valueWithNilHandlingForKey:()NullSupport;
- (void)setValueWithNilHandling:()NullSupport forKey:;
@end

@implementation NSDictionary(NullSupport)

- (void)setValueWithNilHandling:()NullSupport forKey:
{
  id v8 = a3;
  id v6 = a4;
  v7 = v8;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  [a1 setValue:v7 forKey:v6];
  if (!v8) {
}
  }

- (id)valueWithNilHandlingForKey:()NullSupport
{
  v1 = objc_msgSend(a1, "valueForKey:");
  v2 = [MEMORY[0x1E4F1CA98] null];
  if (v1 == v2) {
    v3 = 0;
  }
  else {
    v3 = v1;
  }
  id v4 = v3;

  return v4;
}

@end