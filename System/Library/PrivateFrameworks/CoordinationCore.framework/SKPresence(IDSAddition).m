@interface SKPresence(IDSAddition)
- (id)co_IDSIdentifier;
- (void)co_SetIDSIdentifier:()IDSAddition;
@end

@implementation SKPresence(IDSAddition)

- (id)co_IDSIdentifier
{
  return objc_getAssociatedObject(a1, sel_co_IDSIdentifier);
}

- (void)co_SetIDSIdentifier:()IDSAddition
{
}

@end