@interface UIView(PKLongSqueeze)
- (id)_pk_longSqueezeAction;
- (void)_set_pk_longSqueezeAction:()PKLongSqueeze;
@end

@implementation UIView(PKLongSqueeze)

- (id)_pk_longSqueezeAction
{
  return objc_getAssociatedObject(a1, &kUIViewPKLongSqueezeActionKey);
}

- (void)_set_pk_longSqueezeAction:()PKLongSqueeze
{
  id v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, &kUIViewPKLongSqueezeActionKey, v4, (void *)3);
}

@end